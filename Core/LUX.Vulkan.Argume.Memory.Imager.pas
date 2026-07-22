unit LUX.Vulkan.Argume.Memory.Imager;

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     LUX,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan.Queuer,
     LUX.Vulkan.Argume.Memory;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkImager<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class;

     TVkImaDat<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

     // イメージ本体はデバイス専用メモリ（OPTIMAL タイリング）に置き、
     // ホストとの転送は常駐のステージングバッファ（HOST_VISIBLE）を介して行う。
     TVkImager<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class( TVkMemory<TVkSystem_,TVkDevice_,TVkContex_> )
     private
       type TVkImaDat_ = TVkImaDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>;
     protected
       _Handle :T_VkImage;
       _Viewer :T_VkImageView;
       _Layout :T_VkImageLayout;
       _Staged :T_VkBuffer;
       _StaMem :T_VkDeviceMemory;
       ///// A C C E S S O R
       function GetViewrH :T_VkImageView; override;
       function GetHandle :T_VkImage; virtual;
       procedure SetHandle( const Handle_:T_VkImage ); virtual;
       function GetViewer :T_VkImageView; virtual;
       function GetData :TVkImaDat_; reintroduce; virtual;
       procedure SetData( const Data_:TVkImaDat_ ); reintroduce; virtual;
       function GetSize :T_VkDeviceSize; override;
       function GetFormat :T_VkFormat; virtual; abstract;
       function GetImgTyp :T_VkImageType; virtual; abstract;
       function GetVewTyp :T_VkImageViewType; virtual; abstract;
       function GetCountX :Integer; virtual;
       procedure SetCountX( const CountX_:Integer ); virtual;
       function GetCountY :Integer; virtual;
       procedure SetCountY( const CountY_:Integer ); virtual;
       function GetCountZ :Integer; virtual;
       procedure SetCountZ( const CountZ_:Integer ); virtual;
       ///// M E T H O D
       function CreateHandle :T_VkResult; override;
       function DestroHandle :T_VkResult; override;
       function CreateViewer :T_VkResult; virtual;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Handle :T_VkImage         read GetHandle write SetHandle;
       property Viewer :T_VkImageView     read GetViewer                ;
       property Layout :T_VkImageLayout   read   _Layout                ;
       property Staged :T_VkBuffer        read   _Staged                ;
       property StaMem :T_VkDeviceMemory  read   _StaMem                ;
       property Data   :TVkImaDat_        read GetData   write SetData  ;
       property Format :T_VkFormat        read GetFormat                ;
       property ImgTyp :T_VkImageType     read GetImgTyp                ;
       property VewTyp :T_VkImageViewType read GetVewTyp                ;
       property CountX :Integer           read GetCountX write SetCountX;
       property CountY :Integer           read GetCountY write SetCountY;
       property CountZ :Integer           read GetCountZ write SetCountZ;
       ///// M E T H O D
       procedure FreeHandle;
       function ImageRegion :T_VkBufferImageCopy;
       procedure TransitionTo( const Command_:T_VkCommandBuffer; const Layout_:T_VkImageLayout );
       procedure PreRun( const Command_:T_VkCommandBuffer; const DescriTyp_:T_VkDescriptorType ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImaDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

     TVkImaDat<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class( TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_> )
     private
       type TVkImager_ = TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>;
     protected
       _PitchX :Integer;
       _PitchY :Integer;
       _PitchZ :Integer;
       ///// A C C E S S O R
       function GetImager :TVkImager_; virtual;
       function GetValueP :PByte;
       ///// M E T H O D
       function CreateHandle :T_VkResult; override;
       function DestroHandle :T_VkResult; override;
     public
       ///// P R O P E R T Y
       property Imager :TVkImager_ read GetImager;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

uses LUX.Vulkan.Contex;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetViewrH :T_VkImageView;
begin
     Result := Viewer;
end;

//------------------------------------------------------------------------------

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetHandle :T_VkImage;
begin
     if _Handle = Default( T_VkImage ) then CreateHandle;

     Result := _Handle;
end;

procedure TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetHandle( const Handle_:T_VkImage );
begin
     if _Handle <> Default( T_VkImage ) then CheckVk( DestroHandle, 'TVkImager.DestroHandle is Error!' );

     _Handle := Handle_;
end;

//------------------------------------------------------------------------------

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetViewer :T_VkImageView;
begin
     if _Viewer = Default( T_VkImageView ) then CreateViewer;

     Result := _Viewer;
end;

//------------------------------------------------------------------------------

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetData :TVkImaDat_;
begin
     Result := TVkImaDat_( inherited Data );
end;

procedure TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetData( const Data_:TVkImaDat_ );
begin
     inherited Data := Data_;
end;

//------------------------------------------------------------------------------

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetSize :T_VkDeviceSize;
begin
     Result := T_VkDeviceSize( SizeOf( TValue_ ) ) * T_VkDeviceSize( CountX ) * T_VkDeviceSize( CountY ) * T_VkDeviceSize( CountZ );
end;

//------------------------------------------------------------------------------

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetCountX :Integer;
begin
     Result := 1;
end;

procedure TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetCountX( const CountX_:Integer );
begin
     Handle := Default( T_VkImage );
end;

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetCountY :Integer;
begin
     Result := 1;
end;

procedure TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetCountY( const CountY_:Integer );
begin
     Handle := Default( T_VkImage );
end;

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetCountZ :Integer;
begin
     Result := 1;
end;

procedure TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetCountZ( const CountZ_:Integer );
begin
     Handle := Default( T_VkImage );
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.CreateHandle :T_VkResult;
var
   S :T_VkDeviceSize;
   I :T_VkImageCreateInfo;
   B :T_VkBufferCreateInfo;
   R :T_VkMemoryRequirements;
begin
     S := Size;  // with 内では B.size が優先されるため、事前に取得する

     ////////// IMAGE

     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType         := VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO;
          imageType     := ImgTyp;
          format        := GetFormat;
          extent.width  := CountX;
          extent.height := CountY;
          extent.depth  := CountZ;
          mipLevels     := 1;
          arrayLayers   := 1;
          samples       := VK_SAMPLE_COUNT_1_BIT;
          tiling        := VK_IMAGE_TILING_OPTIMAL;
          usage         := VK_IMAGE_USAGE_SAMPLED_BIT
                        or VK_IMAGE_USAGE_STORAGE_BIT
                        or VK_IMAGE_USAGE_TRANSFER_SRC_BIT
                        or VK_IMAGE_USAGE_TRANSFER_DST_BIT;
          sharingMode   := VK_SHARING_MODE_EXCLUSIVE;
          initialLayout := VK_IMAGE_LAYOUT_UNDEFINED;
     end;

     Result := vkCreateImage( DeviceHandle, @I, nil, @_Handle );

     if Result <> VK_SUCCESS then Exit;

     _Layout := VK_IMAGE_LAYOUT_UNDEFINED;

     vkGetImageMemoryRequirements( DeviceHandle, _Handle, @R );

     _Memory := AllocMemory( R, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT );

     Result := vkBindImageMemory( DeviceHandle, _Handle, _Memory, 0 );

     if Result <> VK_SUCCESS then Exit;

     ////////// STAGING BUFFER

     FillChar( B, SizeOf( B ), 0 );
     with B do
     begin
          sType       := VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO;
          size        := S;
          usage       := VK_BUFFER_USAGE_TRANSFER_SRC_BIT
                      or VK_BUFFER_USAGE_TRANSFER_DST_BIT;
          sharingMode := VK_SHARING_MODE_EXCLUSIVE;
     end;

     Result := vkCreateBuffer( DeviceHandle, @B, nil, @_Staged );

     if Result <> VK_SUCCESS then Exit;

     vkGetBufferMemoryRequirements( DeviceHandle, _Staged, @R );

     _StaMem := AllocMemory( R, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT
                             or VK_MEMORY_PROPERTY_HOST_COHERENT_BIT );

     Result := vkBindBufferMemory( DeviceHandle, _Staged, _StaMem, 0 );
end;

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.DestroHandle :T_VkResult;
begin
     _Data.FreeHandle;

     if _Viewer <> Default( T_VkImageView ) then
     begin
          vkDestroyImageView( DeviceHandle, _Viewer, nil );

          _Viewer := Default( T_VkImageView );
     end;

     vkDestroyImage( DeviceHandle, _Handle, nil );

     _Handle := Default( T_VkImage );

     if _Memory <> Default( T_VkDeviceMemory ) then
     begin
          vkFreeMemory( DeviceHandle, _Memory, nil );

          _Memory := Default( T_VkDeviceMemory );
     end;

     if _Staged <> Default( T_VkBuffer ) then
     begin
          vkDestroyBuffer( DeviceHandle, _Staged, nil );

          _Staged := Default( T_VkBuffer );
     end;

     if _StaMem <> Default( T_VkDeviceMemory ) then
     begin
          vkFreeMemory( DeviceHandle, _StaMem, nil );

          _StaMem := Default( T_VkDeviceMemory );
     end;

     _Layout := VK_IMAGE_LAYOUT_UNDEFINED;

     Result := VK_SUCCESS;
end;

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.CreateViewer :T_VkResult;
var
   I :T_VkImageViewCreateInfo;
begin
     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType                           := VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
          image                           := Handle;
          viewType                        := VewTyp;
          format                          := GetFormat;
          subresourceRange.aspectMask     := VK_IMAGE_ASPECT_COLOR_BIT;
          subresourceRange.baseMipLevel   := 0;
          subresourceRange.levelCount     := 1;
          subresourceRange.baseArrayLayer := 0;
          subresourceRange.layerCount     := 1;
     end;

     Result := vkCreateImageView( DeviceHandle, @I, nil, @_Viewer );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.Create;
begin
     inherited;

     _Handle := Default( T_VkImage );
     _Viewer := Default( T_VkImageView );
     _Staged := Default( T_VkBuffer );
     _StaMem := Default( T_VkDeviceMemory );

     _Layout := VK_IMAGE_LAYOUT_UNDEFINED;
end;

destructor TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.Destroy;
begin
     FreeHandle;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.FreeHandle;
begin
     if _Handle <> Default( T_VkImage ) then DestroHandle;
end;

//------------------------------------------------------------------------------

function TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.ImageRegion :T_VkBufferImageCopy;
begin
     FillChar( Result, SizeOf( Result ), 0 );
     with Result do
     begin
          bufferOffset                    := 0;
          bufferRowLength                 := 0;
          bufferImageHeight               := 0;
          imageSubresource.aspectMask     := VK_IMAGE_ASPECT_COLOR_BIT;
          imageSubresource.mipLevel       := 0;
          imageSubresource.baseArrayLayer := 0;
          imageSubresource.layerCount     := 1;
          imageExtent.width               := CountX;
          imageExtent.height              := CountY;
          imageExtent.depth               := CountZ;
     end;
end;

//------------------------------------------------------------------------------

procedure TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.TransitionTo( const Command_:T_VkCommandBuffer; const Layout_:T_VkImageLayout );
var
   B :T_VkImageMemoryBarrier;
begin
     if _Layout = Layout_ then Exit;

     FillChar( B, SizeOf( B ), 0 );
     with B do
     begin
          sType                           := VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER;
          srcAccessMask                   := VK_ACCESS_MEMORY_WRITE_BIT;
          dstAccessMask                   := VK_ACCESS_MEMORY_READ_BIT or VK_ACCESS_MEMORY_WRITE_BIT;
          oldLayout                       := _Layout;
          newLayout                       := Layout_;
          srcQueueFamilyIndex             := VK_QUEUE_FAMILY_IGNORED;
          dstQueueFamilyIndex             := VK_QUEUE_FAMILY_IGNORED;
          image                           := Handle;
          subresourceRange.aspectMask     := VK_IMAGE_ASPECT_COLOR_BIT;
          subresourceRange.baseMipLevel   := 0;
          subresourceRange.levelCount     := 1;
          subresourceRange.baseArrayLayer := 0;
          subresourceRange.layerCount     := 1;
     end;

     vkCmdPipelineBarrier( Command_,
                           VK_PIPELINE_STAGE_ALL_COMMANDS_BIT,
                           VK_PIPELINE_STAGE_ALL_COMMANDS_BIT,
                           0,
                           0, nil,
                           0, nil,
                           1, @B );

     _Layout := Layout_;
end;

procedure TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.PreRun( const Command_:T_VkCommandBuffer; const DescriTyp_:T_VkDescriptorType );
begin
     case DescriTyp_ of
       VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,
       VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER: TransitionTo( Command_, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL );
       VK_DESCRIPTOR_TYPE_STORAGE_IMAGE         : TransitionTo( Command_, VK_IMAGE_LAYOUT_GENERAL );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImaDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImaDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetImager :TVkImager_;
begin
     Result := TVkImager_( Memory );
end;

function TVkImaDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetValueP :PByte;
begin
     Result := Handle;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkImaDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.CreateHandle :T_VkResult;
var
   C :T_VkCommandBuffer;
   R :T_VkBufferImageCopy;
begin
     Imager.Handle;  // イメージ本体とステージングバッファの生成を保証する

     if TVkMapMode.Read in Mode then
     begin
          C := Queuer.BeginCommand;

          Imager.TransitionTo( C, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL );

          R := Imager.ImageRegion;

          vkCmdCopyImageToBuffer( C, Imager.Handle, Imager.Layout, Imager.Staged, 1, @R );

          Queuer.EndCommand( C );
     end;

     _PitchX := SizeOf( TValue_ );
     _PitchY := _PitchX * Imager.CountX;
     _PitchZ := _PitchY * Imager.CountY;

     Result := vkMapMemory( Imager.DeviceHandle, Imager.StaMem, 0, VK_WHOLE_SIZE, 0, @_Handle );
end;

function TVkImaDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.DestroHandle :T_VkResult;
var
   C :T_VkCommandBuffer;
   R :T_VkBufferImageCopy;
begin
     vkUnmapMemory( Imager.DeviceHandle, Imager.StaMem );

     _Handle := nil;

     if TVkMapMode.Write in Mode then
     begin
          C := Queuer.BeginCommand;

          Imager.TransitionTo( C, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL );

          R := Imager.ImageRegion;

          vkCmdCopyBufferToImage( C, Imager.Staged, Imager.Handle, Imager.Layout, 1, @R );

          Queuer.EndCommand( C );
     end;

     Result := VK_SUCCESS;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
