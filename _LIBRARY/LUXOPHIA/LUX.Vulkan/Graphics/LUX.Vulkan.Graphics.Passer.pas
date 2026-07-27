unit LUX.Vulkan.Graphics.Passer;

// 描画パス（VkRenderPass）
//
//【役割】
// ・「色添付 1 枚 ＋ 深度添付 1 枚、サブパス 1 個」という最も基本的な描画パスを
//   構成する。ラスタライズパイプライン（TVkRaster）と描画先（TVkRender /
//   TVkViewer）の双方が参照する。
// ・添付は毎フレーム消去（loadOp = CLEAR）する前提であり、初期レイアウトは
//   UNDEFINED である。したがって描画先の内容を引き継ぐことはできない。
//
//【互換性】
// ・Vulkan のパイプラインは「互換な」描画パスとの間で使い回せる。互換性の条件は
//   添付の形式（format）とサンプル数の一致だけで、レイアウトや loadOp / storeOp は
//   問われない。よって ColorForm / DepthForm が同じであれば、ひとつの TVkRaster を
//   オフスクリーン（TVkRender）と表示窓（TVkViewer）の両方で共有できる。
//
//【レイアウト】
// ・ColorLast は色添付の最終レイアウト。オフスクリーンは TRANSFER_SRC_OPTIMAL、
//   表示窓は PRESENT_SRC_KHR を指定する。
// ・TVkImager を色添付に使う場合、描画パスがレイアウトを遷移させたことを
//   TVkImager.AssumeLayout で教える必要がある（クラス側は追跡できない）。
//
//【所有】
// ・呼び出し側の所有物である。Contex より先に解放すること。

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkPasser = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkPasser

     TVkPasser = class
     private
     protected
       _Contex    :TVkContex;
       _Handle    :T_VkRenderPass;
       _ColorForm :T_VkFormat;
       _DepthForm :T_VkFormat;
       _ColorLast :T_VkImageLayout;
       ///// A C C E S S O R
       function GetHandle :T_VkRenderPass; virtual;
       function GetColorForm :T_VkFormat; virtual;
       procedure SetColorForm( const ColorForm_:T_VkFormat ); virtual;
       function GetDepthForm :T_VkFormat; virtual;
       procedure SetDepthForm( const DepthForm_:T_VkFormat ); virtual;
       function GetColorLast :T_VkImageLayout; virtual;
       procedure SetColorLast( const ColorLast_:T_VkImageLayout ); virtual;
       function GetDepthOK :Boolean; virtual;
       ///// M E T H O D
       function CreateHandle :T_VkResult; virtual;
       function DestroHandle :T_VkResult; virtual;
     public
       constructor Create( const Contex_:TVkContex ); virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Contex    :TVkContex       read   _Contex                      ;
       property Handle    :T_VkRenderPass  read GetHandle                       ;
       property ColorForm :T_VkFormat      read GetColorForm write SetColorForm ;  // 色添付の形式
       property DepthForm :T_VkFormat      read GetDepthForm write SetDepthForm ;  // 深度添付の形式（UNDEFINED なら深度添付なし）
       property ColorLast :T_VkImageLayout read GetColorLast write SetColorLast ;  // 色添付の最終レイアウト
       property DepthOK   :Boolean         read GetDepthOK                      ;  // 深度添付を持つか
       ///// M E T H O D
       function DeviceHandle :T_VkDevice;
       procedure FreeHandle;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkPasser

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkPasser.GetHandle :T_VkRenderPass;
begin
     if _Handle = Default( T_VkRenderPass ) then CheckVk( CreateHandle, 'TVkPasser.CreateHandle is Error!' );

     Result := _Handle;
end;

//------------------------------------------------------------------------------

function TVkPasser.GetColorForm :T_VkFormat;
begin
     Result := _ColorForm;
end;

procedure TVkPasser.SetColorForm( const ColorForm_:T_VkFormat );
begin
     if ColorForm_ = _ColorForm then Exit;

     _ColorForm := ColorForm_;  FreeHandle;
end;

function TVkPasser.GetDepthForm :T_VkFormat;
begin
     Result := _DepthForm;
end;

procedure TVkPasser.SetDepthForm( const DepthForm_:T_VkFormat );
begin
     if DepthForm_ = _DepthForm then Exit;

     _DepthForm := DepthForm_;  FreeHandle;
end;

function TVkPasser.GetColorLast :T_VkImageLayout;
begin
     Result := _ColorLast;
end;

procedure TVkPasser.SetColorLast( const ColorLast_:T_VkImageLayout );
begin
     if ColorLast_ = _ColorLast then Exit;

     _ColorLast := ColorLast_;  FreeHandle;
end;

//------------------------------------------------------------------------------

function TVkPasser.GetDepthOK :Boolean;
begin
     Result := _DepthForm <> VK_FORMAT_UNDEFINED;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkPasser.CreateHandle :T_VkResult;
var
   As_ :array [ 0..1 ] of T_VkAttachmentDescription;
   CR, DR :T_VkAttachmentReference;
   S :T_VkSubpassDescription;
   D :T_VkSubpassDependency;
   I :T_VkRenderPassCreateInfo;
   N :T_uint32_t;
begin
     FillChar( As_, SizeOf( As_ ), 0 );

     ////////// COLOR ATTACHMENT

     with As_[ 0 ] do
     begin
          format         := _ColorForm;
          samples        := VK_SAMPLE_COUNT_1_BIT;
          loadOp         := VK_ATTACHMENT_LOAD_OP_CLEAR;       // 毎フレーム消去する
          storeOp        := VK_ATTACHMENT_STORE_OP_STORE;
          stencilLoadOp  := VK_ATTACHMENT_LOAD_OP_DONT_CARE;
          stencilStoreOp := VK_ATTACHMENT_STORE_OP_DONT_CARE;
          initialLayout  := VK_IMAGE_LAYOUT_UNDEFINED;         // 消去するので内容は問わない
          finalLayout    := _ColorLast;
     end;

     CR.attachment := 0;
     CR.layout     := VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;

     N := 1;

     ////////// DEPTH ATTACHMENT

     if DepthOK then
     begin
          with As_[ 1 ] do
          begin
               format         := _DepthForm;
               samples        := VK_SAMPLE_COUNT_1_BIT;
               loadOp         := VK_ATTACHMENT_LOAD_OP_CLEAR;
               storeOp        := VK_ATTACHMENT_STORE_OP_DONT_CARE;  // 描画後に深度は使わない
               stencilLoadOp  := VK_ATTACHMENT_LOAD_OP_DONT_CARE;
               stencilStoreOp := VK_ATTACHMENT_STORE_OP_DONT_CARE;
               initialLayout  := VK_IMAGE_LAYOUT_UNDEFINED;
               finalLayout    := VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
          end;

          DR.attachment := 1;
          DR.layout     := VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;

          N := 2;
     end;

     ////////// SUBPASS

     FillChar( S, SizeOf( S ), 0 );
     with S do
     begin
          pipelineBindPoint    := VK_PIPELINE_BIND_POINT_GRAPHICS;
          colorAttachmentCount := 1;
          pColorAttachments    := @CR;

          if DepthOK then pDepthStencilAttachment := @DR;
     end;

     ////////// DEPENDENCY

     // 外部（前フレームの描画・提示）から、この描画パスの色出力への依存
     FillChar( D, SizeOf( D ), 0 );
     with D do
     begin
          srcSubpass    := VK_SUBPASS_EXTERNAL;
          dstSubpass    := 0;
          srcStageMask  := VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
          dstStageMask  := VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
          srcAccessMask := 0;
          dstAccessMask := VK_ACCESS_COLOR_ATTACHMENT_READ_BIT or VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;
     end;

     ////////// RENDER PASS

     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType           := VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO;
          attachmentCount := N;
          pAttachments    := @As_[ 0 ];
          subpassCount    := 1;
          pSubpasses      := @S;
          dependencyCount := 1;
          pDependencies   := @D;
     end;

     Result := vkCreateRenderPass( DeviceHandle, @I, nil, @_Handle );
end;

function TVkPasser.DestroHandle :T_VkResult;
begin
     vkDestroyRenderPass( DeviceHandle, _Handle, nil );

     _Handle := Default( T_VkRenderPass );

     Result := VK_SUCCESS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkPasser.Create( const Contex_:TVkContex );
begin
     inherited Create;

     _Contex := Contex_;

     _Handle := Default( T_VkRenderPass );

     _ColorForm := VK_FORMAT_B8G8R8A8_UNORM;                  // FMX の TBitmap と同じ並び
     _DepthForm := VK_FORMAT_D32_SFLOAT;
     _ColorLast := VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;      // オフスクリーンの既定（取り出す前提）
end;

destructor TVkPasser.Destroy;
begin
     FreeHandle;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkPasser.DeviceHandle :T_VkDevice;
begin
     Result := _Contex.Handle;
end;

procedure TVkPasser.FreeHandle;
begin
     if _Handle <> Default( T_VkRenderPass ) then DestroHandle;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
