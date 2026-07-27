unit LUX.Vulkan.Render;

// オフラインレンダラ（フォーム不要）
//
//【役割】
// ・SizeX × SizeY ピクセルの画像へシーンを描き、FireMonkey の TBitmap へ取り出す。
//   ウィンドウもスワップチェーンも要らないので、コンソールアプリやバッチ処理から
//   でも使える。
// ・Camera プロパティに TVkCam を接続すると、そのカメラの属すシーンを描く。
//   カメラは 2D（TVkCam2D）でも 3D（TVkCam3D）でもよい。
//
//【構成】
// ・色添付は TVkTarget2D（＝ COLOR_ATTACHMENT を足した TVkImager2DxBGRAxUFix8）。
//   TVkImager の常駐ステージングバッファ経由でホストへ取り出せるので、
//   LUX.Vulkan.Stream.FMX.D2 の変換をそのまま使える。
// ・深度添付は VkImageView の aspect が DEPTH でなければならず TVkImager では
//   表せないため、このクラスが VkImage / VkDeviceMemory / VkImageView を直接持つ。
// ・描画パス（Passer）は色添付の最終レイアウトを TRANSFER_SRC_OPTIMAL とする。
//   描画パスがレイアウトを遷移させたことは AssumeLayout で TVkImager へ伝える。
//
//【所有】
// ・呼び出し側の所有物である。Contex より先に解放すること。
// ・Camera（およびシーン）は参照するだけで所有しない。

interface //#################################################################### ■

uses System.UITypes,
     FMX.Graphics,
     vk_platform, vulkan_core, vulkan_functions,
     LUX, LUX.D4x4,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan,
     LUX.Vulkan.Stream.FMX.D2,
     LUX.Vulkan.Graphics.Passer,
     LUX.Vulkan.Graphics.Raster,
     LUX.Vulkan.Graphics;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkTarget2D = class;
     TVkRender   = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkTarget2D

     // 描画先にできるイメージ。既定の TVkImager は COLOR_ATTACHMENT_BIT を
     // 立てないので足す。
     TVkTarget2D = class( TVkImager2DxBGRAxUFix8 )
     private
     protected
       ///// A C C E S S O R
       function GetUsage :T_VkImageUsageFlags; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkRender

     TVkRender = class
     private
     protected
       _Contex :TVkContex;
       _Queuer :TVkQueuer;
       _Passer :TVkPasser;
       _Camera :TVkCam;
       _SizeX  :Integer;
       _SizeY  :Integer;
       _Color  :TVkTarget2D;
       _Stream :IVkStream2DxBGRAxUFix8_FMX;
       _DepImg :T_VkImage;
       _DepMem :T_VkDeviceMemory;
       _DepViw :T_VkImageView;
       _Framer :T_VkFramebuffer;
       ///// A C C E S S O R
       function GetSizeX :Integer; virtual;
       procedure SetSizeX( const SizeX_:Integer ); virtual;
       function GetSizeY :Integer; virtual;
       procedure SetSizeY( const SizeY_:Integer ); virtual;
       function GetCamera :TVkCam; virtual;
       procedure SetCamera( const Camera_:TVkCam ); virtual;
       ///// M E T H O D
       function CreateDepth :T_VkResult; virtual;
       procedure DestroDepth; virtual;
       function CreateFramer :T_VkResult; virtual;
       procedure DestroFramer; virtual;
       procedure ForceTarget;
     public
       constructor Create( const Contex_:TVkContex; const Queuer_:TVkQueuer ); virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Contex :TVkContex   read   _Contex                ;
       property Queuer :TVkQueuer   read   _Queuer                ;
       property Passer :TVkPasser   read   _Passer                ;  // この描画先の描画パス
       property Camera :TVkCam      read GetCamera write SetCamera;  // 描くカメラ（2D / 3D のどちらでもよい）
       property SizeX  :Integer     read GetSizeX  write SetSizeX ;  // 横ピクセル数
       property SizeY  :Integer     read GetSizeY  write SetSizeY ;  // 縦ピクセル数
       property Color  :TVkTarget2D read   _Color                 ;  // 描画結果のイメージ
       ///// M E T H O D
       function DeviceHandle :T_VkDevice;
       procedure FreeHandle;
       procedure Render;
       procedure CopyTo( const Bitmap_:TBitmap );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkTarget2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkTarget2D.GetUsage :T_VkImageUsageFlags;
begin
     Result := inherited GetUsage or VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkRender

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkRender.GetSizeX :Integer;
begin
     Result := _SizeX;
end;

procedure TVkRender.SetSizeX( const SizeX_:Integer );
begin
     if SizeX_ = _SizeX then Exit;

     _SizeX := SizeX_;  FreeHandle;
end;

function TVkRender.GetSizeY :Integer;
begin
     Result := _SizeY;
end;

procedure TVkRender.SetSizeY( const SizeY_:Integer );
begin
     if SizeY_ = _SizeY then Exit;

     _SizeY := SizeY_;  FreeHandle;
end;

//------------------------------------------------------------------------------

function TVkRender.GetCamera :TVkCam;
begin
     Result := _Camera;
end;

procedure TVkRender.SetCamera( const Camera_:TVkCam );
begin
     _Camera := Camera_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkRender.CreateDepth :T_VkResult;
var
   II :T_VkImageCreateInfo;
   VI :T_VkImageViewCreateInfo;
   AI :T_VkMemoryAllocateInfo;
   R :T_VkMemoryRequirements;
   D :T_VkDevice;
begin
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

procedure TVkRender.DestroDepth;
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

function TVkRender.CreateFramer :T_VkResult;
var
   Vs :array [ 0..1 ] of T_VkImageView;
   I :T_VkFramebufferCreateInfo;
begin
     Vs[ 0 ] := _Color.Viewer;
     Vs[ 1 ] := _DepViw;

     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType           := VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO;
          renderPass      := _Passer.Handle;
          attachmentCount := 2;
          pAttachments    := @Vs[ 0 ];
          width           := _SizeX;
          height          := _SizeY;
          layers          := 1;
     end;

     Result := vkCreateFramebuffer( DeviceHandle, @I, nil, @_Framer );
end;

procedure TVkRender.DestroFramer;
begin
     if _Framer <> Default( T_VkFramebuffer ) then
     begin
          vkDestroyFramebuffer( DeviceHandle, _Framer, nil );

          _Framer := Default( T_VkFramebuffer );
     end;
end;

//------------------------------------------------------------------------------

procedure TVkRender.ForceTarget;
begin
     if _Framer <> Default( T_VkFramebuffer ) then Exit;  // すでに揃っている

     _Color.CountX := _SizeX;
     _Color.CountY := _SizeY;

     _Color.Handle;  // イメージとステージングバッファの生成を保証する

     CheckVk( CreateDepth , 'TVkRender.CreateDepth is Error!'  );
     CheckVk( CreateFramer, 'TVkRender.CreateFramer is Error!' );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkRender.Create( const Contex_:TVkContex; const Queuer_:TVkQueuer );
begin
     inherited Create;

     _Contex := Contex_;
     _Queuer := Queuer_;

     _Camera := nil;

     _SizeX := 640;
     _SizeY := 480;

     _DepImg := Default( T_VkImage        );
     _DepMem := Default( T_VkDeviceMemory );
     _DepViw := Default( T_VkImageView    );
     _Framer := Default( T_VkFramebuffer  );

     _Passer := TVkPasser.Create( _Contex );

     _Passer.ColorLast := VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;  // 描いたあとホストへ取り出す

     _Color := TVkTarget2D.Create( _Contex, _Queuer );

     _Stream := TVkStream2DxBGRAxUFix8_FMX.Create( _Color );
end;

destructor TVkRender.Destroy;
begin
     FreeHandle;

     _Stream := nil;

     _Color.Free;
     _Passer.Free;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkRender.DeviceHandle :T_VkDevice;
begin
     Result := _Contex.Handle;
end;

procedure TVkRender.FreeHandle;
begin
     DestroFramer;
     DestroDepth;

     _Color.FreeHandle;
end;

//------------------------------------------------------------------------------

procedure TVkRender.Render;
var
   C :T_VkCommandBuffer;
   Cs :array [ 0..1 ] of T_VkClearValue;
   BI :T_VkRenderPassBeginInfo;
   V :T_VkViewport;
   S :T_VkRect2D;
   D :TVkDrawer;
   B :TAlphaColorF;
begin
     if ( _SizeX <= 0 ) or ( _SizeY <= 0 ) then Exit;

     ForceTarget;

     ////////// CLEAR VALUES

     if Assigned( _Camera ) and Assigned( _Camera.Scene ) then B := _Camera.Scene.BackColor
                                                          else B := TAlphaColorF.Create( 0, 0, 0, 1 );

     FillChar( Cs, SizeOf( Cs ), 0 );

     Cs[ 0 ].color.float32[ 0 ] := B.R;
     Cs[ 0 ].color.float32[ 1 ] := B.G;
     Cs[ 0 ].color.float32[ 2 ] := B.B;
     Cs[ 0 ].color.float32[ 3 ] := B.A;

     Cs[ 1 ].depthStencil.depth := 1;

     ////////// COMMAND

     C := _Queuer.BeginCommand;

     FillChar( BI, SizeOf( BI ), 0 );
     with BI do
     begin
          sType             := VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
          renderPass        := _Passer.Handle;
          framebuffer       := _Framer;
          renderArea.extent.width  := _SizeX;
          renderArea.extent.height := _SizeY;
          clearValueCount   := 2;
          pClearValues      := @Cs[ 0 ];
     end;

     vkCmdBeginRenderPass( C, @BI, VK_SUBPASS_CONTENTS_INLINE );

     // カメラのスクリーンの縦横比を保って収める。余白には、描画パスが描画先
     // いっぱいに塗った背景色がそのまま残る（レターボックス）。
     if Assigned( _Camera ) then V := VkFitViewport( _Camera.SizeX, _Camera.SizeY, _SizeX, _SizeY )
                            else V := VkFitViewport( _SizeX       , _SizeY       , _SizeX, _SizeY );

     vkCmdSetViewport( C, 0, 1, @V );

     FillChar( S, SizeOf( S ), 0 );
     S.extent.width  := _SizeX;
     S.extent.height := _SizeY;

     vkCmdSetScissor( C, 0, 1, @S );

     if Assigned( _Camera ) then
     begin
          D := TVkDrawer.Create( C, _Passer, _SizeX, _SizeY );
          try
             _Camera.Render( D );
          finally
             D.Free;
          end;
     end;

     vkCmdEndRenderPass( C );

     _Queuer.EndCommand( C );  // 実行完了まで待機する

     // 描画パスの finalLayout による遷移を TVkImager へ伝える
     _Color.AssumeLayout( VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL );
end;

procedure TVkRender.CopyTo( const Bitmap_:TBitmap );
begin
     _Stream.CopyTo( Bitmap_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
