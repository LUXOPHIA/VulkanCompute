unit LUX.Vulkan.Graphics.Swaper;

// 表示面（VkSurfaceKHR）とスワップチェーン（VkSwapchainKHR）
//
//【役割】
// ・ウィンドウハンドル（HWND）を Vulkan の表示先に変える。TVkViewer が使うが、
//   ウィンドウを持つ枠組みなら何にでも繋げられるよう、UI 非依存にしてある。
// ・色添付はスワップチェーンが供給するイメージ、深度添付はこのクラスが 1 枚だけ
//   持つ（描画は 1 枚ずつ完了させるので共有できる）。
//
//【同期】
// ・1 フレーム完結（frames-in-flight ＝ 1）である。
//     取得 → 記録 → 投入（取得完了を待ち、描画完了を通知）→ 提示（描画完了を待つ）
//     → キューの待機
//   最後にキューを待つので、コマンドバッファもセマフォも次フレームで再利用できる。
//   多重化すれば速くなるが、そのぶん状態が増えるため採らなかった。
//
//【大きさ】
// ・Resize で外から与えた大きさと、表示面が実際に許す大きさ（currentExtent）の
//   両方を見て作り直す。最小化などで 0 になった場合は Ready が False となり、
//   呼び出し側は描画を丸ごと飛ばせばよい。
// ・VK_ERROR_OUT_OF_DATE_KHR / VK_SUBOPTIMAL_KHR は再構築の合図として扱う。
//
//【所有】
// ・呼び出し側の所有物である。Contex より先に、また Window_ の破棄より先に解放すること。

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_win32, vulkan_functions,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan,
     LUX.Vulkan.Graphics.Passer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkSwaper = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkSwaper

     TVkSwaper = class
     private
     protected
       _Contex  :TVkContex;
       _Queuer  :TVkQueuer;
       _Passer  :TVkPasser;
       _Window  :T_HWND;
       _Surfac  :T_VkSurfaceKHR;
       _Handle  :T_VkSwapchainKHR;
       _SizeX   :Integer;
       _SizeY   :Integer;
       _WantX   :Integer;
       _WantY   :Integer;
       _Format  :T_VkFormat;
       _Images  :TArray<T_VkImage>;
       _Viewers :TArray<T_VkImageView>;
       _Framers :TArray<T_VkFramebuffer>;
       _DepImg  :T_VkImage;
       _DepMem  :T_VkDeviceMemory;
       _DepViw  :T_VkImageView;
       _AcqSem  :T_VkSemaphore;
       _RndSem  :T_VkSemaphore;
       _ImageI  :T_uint32_t;
       _Comman  :T_VkCommandBuffer;
       ///// A C C E S S O R
       function GetReady :Boolean; virtual;
       function GetFramer :T_VkFramebuffer; virtual;
       ///// M E T H O D
       function CreateSurfac :T_VkResult; virtual;
       procedure DestroSurfac; virtual;
       function SurfacFormat :T_VkFormat;
       function SurfacExtent( out SizeX_,SizeY_:Integer; out MinN_:T_uint32_t ) :Boolean;
       function CreateSync :T_VkResult; virtual;
       procedure DestroSync; virtual;
       function CreateDepth :T_VkResult; virtual;
       procedure DestroDepth; virtual;
       function CreateHandle :T_VkResult; virtual;
       procedure DestroHandle; virtual;
       procedure ForceHandle;
     public
       constructor Create( const Contex_:TVkContex; const Queuer_:TVkQueuer;
                           const Passer_:TVkPasser; const Window_:T_HWND ); virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Contex :TVkContex        read _Contex ;
       property Queuer :TVkQueuer        read _Queuer ;
       property Passer :TVkPasser        read _Passer ;
       property Window :T_HWND           read _Window ;
       property Surfac :T_VkSurfaceKHR   read _Surfac ;
       property Handle :T_VkSwapchainKHR read _Handle ;
       property SizeX  :Integer          read _SizeX  ;  // スワップチェーンの実際の横ピクセル数
       property SizeY  :Integer          read _SizeY  ;  // 　　　　　　　　　縦ピクセル数
       property Format :T_VkFormat       read _Format ;  // 色添付の形式
       property Ready  :Boolean          read GetReady;  // 描けるか（最小化中などは False）
       property Framer :T_VkFramebuffer  read GetFramer;  // いま取得しているフレームバッファ
       ///// M E T H O D
       function DeviceHandle :T_VkDevice;
       procedure FreeHandle;
       procedure Resize( const SizeX_,SizeY_:Integer );
       function BeginFrame( out Comman_:T_VkCommandBuffer ) :Boolean;
       procedure EndFrame;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

uses Winapi.Windows;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkSwaper

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkSwaper.GetReady :Boolean;
begin
     Result := ( _Handle <> Default( T_VkSwapchainKHR ) ) and ( _SizeX > 0 ) and ( _SizeY > 0 );
end;

function TVkSwaper.GetFramer :T_VkFramebuffer;
begin
     if _ImageI < T_uint32_t( Length( _Framers ) ) then Result := _Framers[ _ImageI ]
                                                   else Result := Default( T_VkFramebuffer );
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkSwaper.CreateSurfac :T_VkResult;
var
   I :T_VkWin32SurfaceCreateInfoKHR;
   S :T_VkBool32;
begin
     if not Assigned( vkCreateWin32SurfaceKHR ) then Exit( VK_ERROR_EXTENSION_NOT_PRESENT );

     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType     := VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR;
          hinstance := GetModuleHandle( nil );
          hwnd      := _Window;
     end;

     Result := vkCreateWin32SurfaceKHR( _Contex.Device.Devices.Handle, @I, nil, @_Surfac );

     if Result <> VK_SUCCESS then Exit;

     // このキューファミリで提示できるかを確かめる（できなければ描画キューを分ける必要がある）
     S := 0;

     Result := vkGetPhysicalDeviceSurfaceSupportKHR( _Contex.Device.Handle, _Contex.FamilyI, _Surfac, @S );

     if Result <> VK_SUCCESS then Exit;

     if S = 0 then
     begin
          DestroSurfac;

          Exit( VK_ERROR_SURFACE_LOST_KHR );  // 提示できないキューファミリ
     end;
end;

procedure TVkSwaper.DestroSurfac;
begin
     if _Surfac <> Default( T_VkSurfaceKHR ) then
     begin
          vkDestroySurfaceKHR( _Contex.Device.Devices.Handle, _Surfac, nil );

          _Surfac := Default( T_VkSurfaceKHR );
     end;
end;

//------------------------------------------------------------------------------

function TVkSwaper.SurfacFormat :T_VkFormat;
var
   N :T_uint32_t;
   Fs :TArray<T_VkSurfaceFormatKHR>;
   F :T_VkSurfaceFormatKHR;
begin
     Result := VK_FORMAT_B8G8R8A8_UNORM;  // 見つからなければ既定（描画パスと同じ形式）

     N := 0;

     if vkGetPhysicalDeviceSurfaceFormatsKHR( _Contex.Device.Handle, _Surfac, @N, nil ) <> VK_SUCCESS then Exit;

     if N = 0 then Exit;

     SetLength( Fs, N );

     if vkGetPhysicalDeviceSurfaceFormatsKHR( _Contex.Device.Handle, _Surfac, @N, @Fs[0] ) <> VK_SUCCESS then Exit;

     // 描画パスと同じ B8G8R8A8_UNORM があればそれを選ぶ（パイプラインを共有できる）
     for F in Fs do
     begin
          if ( F.format = VK_FORMAT_B8G8R8A8_UNORM )
         and ( F.colorSpace = VK_COLOR_SPACE_SRGB_NONLINEAR_KHR ) then Exit( F.format );
     end;

     if Fs[0].format <> VK_FORMAT_UNDEFINED then Result := Fs[0].format;
end;

function TVkSwaper.SurfacExtent( out SizeX_,SizeY_:Integer; out MinN_:T_uint32_t ) :Boolean;
var
   C :T_VkSurfaceCapabilitiesKHR;
begin
     SizeX_ := 0;  SizeY_ := 0;  MinN_ := 2;

     Result := vkGetPhysicalDeviceSurfaceCapabilitiesKHR( _Contex.Device.Handle, _Surfac, @C ) = VK_SUCCESS;

     if not Result then Exit;

     MinN_ := C.minImageCount + 1;  // 三重までは要らないが、最小 ＋ 1 で待ちを減らす

     if ( C.maxImageCount > 0 ) and ( MinN_ > C.maxImageCount ) then MinN_ := C.maxImageCount;

     if C.currentExtent.width <> UINT32_MAX then
     begin
          // 表示面が大きさを決めている（Windows は常にこちら）
          SizeX_ := C.currentExtent.width;
          SizeY_ := C.currentExtent.height;
     end
     else
     begin
          SizeX_ := _WantX;
          SizeY_ := _WantY;
     end;

     if SizeX_ < Integer( C.minImageExtent.width  ) then SizeX_ := C.minImageExtent.width ;
     if SizeY_ < Integer( C.minImageExtent.height ) then SizeY_ := C.minImageExtent.height;
     if SizeX_ > Integer( C.maxImageExtent.width  ) then SizeX_ := C.maxImageExtent.width ;
     if SizeY_ > Integer( C.maxImageExtent.height ) then SizeY_ := C.maxImageExtent.height;
end;

//------------------------------------------------------------------------------

function TVkSwaper.CreateSync :T_VkResult;
var
   I :T_VkSemaphoreCreateInfo;
begin
     FillChar( I, SizeOf( I ), 0 );
     I.sType := VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;

     Result := vkCreateSemaphore( DeviceHandle, @I, nil, @_AcqSem );

     if Result <> VK_SUCCESS then Exit;

     Result := vkCreateSemaphore( DeviceHandle, @I, nil, @_RndSem );
end;

procedure TVkSwaper.DestroSync;
begin
     if _AcqSem <> Default( T_VkSemaphore ) then
     begin
          vkDestroySemaphore( DeviceHandle, _AcqSem, nil );  _AcqSem := Default( T_VkSemaphore );
     end;

     if _RndSem <> Default( T_VkSemaphore ) then
     begin
          vkDestroySemaphore( DeviceHandle, _RndSem, nil );  _RndSem := Default( T_VkSemaphore );
     end;
end;

//------------------------------------------------------------------------------

function TVkSwaper.CreateDepth :T_VkResult;
var
   II :T_VkImageCreateInfo;
   VI :T_VkImageViewCreateInfo;
   AI :T_VkMemoryAllocateInfo;
   R :T_VkMemoryRequirements;
   D :T_VkDevice;
begin
     Result := VK_SUCCESS;

     if not _Passer.DepthOK then Exit;

     D := DeviceHandle;

     FillChar( II, SizeOf( II ), 0 );
     with II do
     begin
          sType         := VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO;
          imageType     := VK_IMAGE_TYPE_2D;
          format        := _Passer.DepthForm;
          extent.width  := _SizeX;
          extent.height := _SizeY;
          extent.depth  := 1;
          mipLevels     := 1;
          arrayLayers   := 1;
          samples       := VK_SAMPLE_COUNT_1_BIT;
          tiling        := VK_IMAGE_TILING_OPTIMAL;
          usage         := VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT;
          sharingMode   := VK_SHARING_MODE_EXCLUSIVE;
          initialLayout := VK_IMAGE_LAYOUT_UNDEFINED;
     end;

     Result := vkCreateImage( D, @II, nil, @_DepImg );

     if Result <> VK_SUCCESS then Exit;

     vkGetImageMemoryRequirements( D, _DepImg, @R );

     FillChar( AI, SizeOf( AI ), 0 );
     with AI do
     begin
          sType           := VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
          allocationSize  := R.size;
          memoryTypeIndex := _Contex.Device.MemoryByFlags( R.memoryTypeBits, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT );
     end;

     Result := vkAllocateMemory( D, @AI, nil, @_DepMem );

     if Result <> VK_SUCCESS then Exit;

     Result := vkBindImageMemory( D, _DepImg, _DepMem, 0 );

     if Result <> VK_SUCCESS then Exit;

     FillChar( VI, SizeOf( VI ), 0 );
     with VI do
     begin
          sType                           := VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
          image                           := _DepImg;
          viewType                        := VK_IMAGE_VIEW_TYPE_2D;
          format                          := _Passer.DepthForm;
          subresourceRange.aspectMask     := VK_IMAGE_ASPECT_DEPTH_BIT;
          subresourceRange.baseMipLevel   := 0;
          subresourceRange.levelCount     := 1;
          subresourceRange.baseArrayLayer := 0;
          subresourceRange.layerCount     := 1;
     end;

     Result := vkCreateImageView( D, @VI, nil, @_DepViw );
end;

procedure TVkSwaper.DestroDepth;
var
   D :T_VkDevice;
begin
     D := DeviceHandle;

     if _DepViw <> Default( T_VkImageView ) then
     begin
          vkDestroyImageView( D, _DepViw, nil );  _DepViw := Default( T_VkImageView );
     end;

     if _DepImg <> Default( T_VkImage ) then
     begin
          vkDestroyImage( D, _DepImg, nil );  _DepImg := Default( T_VkImage );
     end;

     if _DepMem <> Default( T_VkDeviceMemory ) then
     begin
          vkFreeMemory( D, _DepMem, nil );  _DepMem := Default( T_VkDeviceMemory );
     end;
end;

//------------------------------------------------------------------------------

function TVkSwaper.CreateHandle :T_VkResult;
var
   SI :T_VkSwapchainCreateInfoKHR;
   VI :T_VkImageViewCreateInfo;
   FI :T_VkFramebufferCreateInfo;
   Vs :array [ 0..1 ] of T_VkImageView;
   MinN, N :T_uint32_t;
   I :Integer;
   D :T_VkDevice;
begin
     if _Surfac = Default( T_VkSurfaceKHR ) then
     begin
          Result := CreateSurfac;  if Result <> VK_SUCCESS then Exit;

          _Format := SurfacFormat;

          _Passer.ColorForm := _Format;                            // 描画パスを表示面の形式に合わせる
          _Passer.ColorLast := VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;    // 描いたら提示する
     end;

     if not SurfacExtent( _SizeX, _SizeY, MinN ) then Exit( VK_ERROR_SURFACE_LOST_KHR );

     if ( _SizeX = 0 ) or ( _SizeY = 0 ) then Exit( VK_SUCCESS );  // 最小化中（Ready = False になる）

     D := DeviceHandle;

     FillChar( SI, SizeOf( SI ), 0 );
     with SI do
     begin
          sType              := VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
          surface            := _Surfac;
          minImageCount      := MinN;
          imageFormat        := _Format;
          imageColorSpace    := VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
          imageExtent.width  := _SizeX;
          imageExtent.height := _SizeY;
          imageArrayLayers   := 1;
          imageUsage         := VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
          imageSharingMode   := VK_SHARING_MODE_EXCLUSIVE;
          preTransform       := VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR;
          compositeAlpha     := VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
          presentMode        := VK_PRESENT_MODE_FIFO_KHR;           // 垂直同期あり（どの環境でも必ず対応する）
          clipped            := 1;
     end;

     Result := vkCreateSwapchainKHR( D, @SI, nil, @_Handle );

     if Result <> VK_SUCCESS then Exit;

     ////////// IMAGES

     N := 0;

     Result := vkGetSwapchainImagesKHR( D, _Handle, @N, nil );

     if Result <> VK_SUCCESS then Exit;

     SetLength( _Images, N );

     Result := vkGetSwapchainImagesKHR( D, _Handle, @N, @_Images[0] );

     if Result <> VK_SUCCESS then Exit;

     ////////// DEPTH

     Result := CreateDepth;

     if Result <> VK_SUCCESS then Exit;

     ////////// VIEWS ＆ FRAMEBUFFERS

     SetLength( _Viewers, N );
     SetLength( _Framers, N );

     for I := 0 to Integer( N )-1 do
     begin
          FillChar( VI, SizeOf( VI ), 0 );
          with VI do
          begin
               sType                           := VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
               image                           := _Images[ I ];
               viewType                        := VK_IMAGE_VIEW_TYPE_2D;
               format                          := _Format;
               subresourceRange.aspectMask     := VK_IMAGE_ASPECT_COLOR_BIT;
               subresourceRange.baseMipLevel   := 0;
               subresourceRange.levelCount     := 1;
               subresourceRange.baseArrayLayer := 0;
               subresourceRange.layerCount     := 1;
          end;

          Result := vkCreateImageView( D, @VI, nil, @_Viewers[ I ] );

          if Result <> VK_SUCCESS then Exit;

          Vs[ 0 ] := _Viewers[ I ];
          Vs[ 1 ] := _DepViw;

          FillChar( FI, SizeOf( FI ), 0 );
          with FI do
          begin
               sType           := VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO;
               renderPass      := _Passer.Handle;
               pAttachments    := @Vs[ 0 ];
               width           := _SizeX;
               height          := _SizeY;
               layers          := 1;

               if _Passer.DepthOK then attachmentCount := 2
                                  else attachmentCount := 1;
          end;

          Result := vkCreateFramebuffer( D, @FI, nil, @_Framers[ I ] );

          if Result <> VK_SUCCESS then Exit;
     end;
end;

procedure TVkSwaper.DestroHandle;
var
   D :T_VkDevice;
   I :Integer;
begin
     D := DeviceHandle;

     vkDeviceWaitIdle( D );  // 使用中の資源を壊さない

     for I := 0 to High( _Framers ) do
     begin
          if _Framers[ I ] <> Default( T_VkFramebuffer ) then vkDestroyFramebuffer( D, _Framers[ I ], nil );
     end;

     for I := 0 to High( _Viewers ) do
     begin
          if _Viewers[ I ] <> Default( T_VkImageView ) then vkDestroyImageView( D, _Viewers[ I ], nil );
     end;

     _Framers := nil;
     _Viewers := nil;
     _Images  := nil;

     DestroDepth;

     if _Handle <> Default( T_VkSwapchainKHR ) then
     begin
          vkDestroySwapchainKHR( D, _Handle, nil );

          _Handle := Default( T_VkSwapchainKHR );
     end;

     _SizeX := 0;
     _SizeY := 0;
end;

procedure TVkSwaper.ForceHandle;
begin
     if _Handle <> Default( T_VkSwapchainKHR ) then Exit;

     if ( _WantX <= 0 ) or ( _WantY <= 0 ) then Exit;

     if CreateHandle <> VK_SUCCESS then DestroHandle;  // 作れなければ後始末して Ready = False
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkSwaper.Create( const Contex_:TVkContex; const Queuer_:TVkQueuer;
                              const Passer_:TVkPasser; const Window_:T_HWND );
begin
     inherited Create;

     _Contex := Contex_;
     _Queuer := Queuer_;
     _Passer := Passer_;
     _Window := Window_;

     _Surfac := Default( T_VkSurfaceKHR   );
     _Handle := Default( T_VkSwapchainKHR );
     _DepImg := Default( T_VkImage        );
     _DepMem := Default( T_VkDeviceMemory );
     _DepViw := Default( T_VkImageView    );
     _AcqSem := Default( T_VkSemaphore    );
     _RndSem := Default( T_VkSemaphore    );
     _Comman := Default( T_VkCommandBuffer );

     _Format := VK_FORMAT_B8G8R8A8_UNORM;

     _SizeX := 0;  _SizeY := 0;
     _WantX := 0;  _WantY := 0;
     _ImageI := 0;

     CheckVk( CreateSync, 'TVkSwaper.CreateSync is Error!' );
end;

destructor TVkSwaper.Destroy;
begin
     FreeHandle;

     DestroSync;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkSwaper.DeviceHandle :T_VkDevice;
begin
     Result := _Contex.Handle;
end;

procedure TVkSwaper.FreeHandle;
begin
     DestroHandle;
     DestroSurfac;
end;

//------------------------------------------------------------------------------

procedure TVkSwaper.Resize( const SizeX_,SizeY_:Integer );
begin
     if ( SizeX_ = _WantX ) and ( SizeY_ = _WantY ) then Exit;

     _WantX := SizeX_;
     _WantY := SizeY_;

     DestroHandle;  // 次の BeginFrame で作り直す（表示面は使い回す）
end;

//------------------------------------------------------------------------------

function TVkSwaper.BeginFrame( out Comman_:T_VkCommandBuffer ) :Boolean;
var
   R :T_VkResult;
begin
     Result  := False;
     Comman_ := Default( T_VkCommandBuffer );

     ForceHandle;

     if not Ready then Exit;

     R := vkAcquireNextImageKHR( DeviceHandle, _Handle, UINT64_MAX, _AcqSem, Default( T_VkFence ), @_ImageI );

     case R of
       VK_SUCCESS, VK_SUBOPTIMAL_KHR: ;  // SUBOPTIMAL はこのフレームは描いてよい
       VK_ERROR_OUT_OF_DATE_KHR     : begin DestroHandle;  Exit; end;
     else                             Exit;
     end;

     _Comman := _Queuer.BeginCommand;

     Comman_ := _Comman;

     Result := True;
end;

procedure TVkSwaper.EndFrame;
var
   C :T_VkCommandBuffer;
   W :T_VkPipelineStageFlags;
   SI :T_VkSubmitInfo;
   PI :T_VkPresentInfoKHR;
   S :T_VkSwapchainKHR;
   A, N :T_VkSemaphore;
   R :T_VkResult;
begin
     C := _Comman;

     if C = Default( T_VkCommandBuffer ) then Exit;

     _Comman := Default( T_VkCommandBuffer );

     CheckVk( vkEndCommandBuffer( C ), 'TVkSwaper.EndFrame is Error!' );

     A := _AcqSem;
     N := _RndSem;
     W := VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;

     FillChar( SI, SizeOf( SI ), 0 );
     with SI do
     begin
          sType                := VK_STRUCTURE_TYPE_SUBMIT_INFO;
          waitSemaphoreCount   := 1;
          pWaitSemaphores      := @A;              // イメージの取得完了を待つ
          pWaitDstStageMask    := @W;
          commandBufferCount   := 1;
          pCommandBuffers      := @C;
          signalSemaphoreCount := 1;
          pSignalSemaphores    := @N;              // 描画完了を知らせる
     end;

     CheckVk( vkQueueSubmit( _Queuer.Handle, 1, @SI, Default( T_VkFence ) ), 'TVkSwaper.EndFrame is Error!' );

     S := _Handle;

     FillChar( PI, SizeOf( PI ), 0 );
     with PI do
     begin
          sType              := VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
          waitSemaphoreCount := 1;
          pWaitSemaphores    := @N;                // 描画完了を待って提示する
          swapchainCount     := 1;
          pSwapchains        := @S;
          pImageIndices      := @_ImageI;
     end;

     R := vkQueuePresentKHR( _Queuer.Handle, @PI );

     vkQueueWaitIdle( _Queuer.Handle );  // 1 フレーム完結（コマンドバッファとセマフォを再利用する）

     vkFreeCommandBuffers( DeviceHandle, _Queuer.Pooler, 1, @C );

     if ( R = VK_ERROR_OUT_OF_DATE_KHR ) or ( R = VK_SUBOPTIMAL_KHR ) then DestroHandle;  // 次フレームで作り直す
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
