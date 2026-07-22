unit LUX.Vulkan.Argume.Memory.Imager.D3;

interface //#################################################################### ■

uses vk_platform, vulkan_core,
     LUX,
     LUX.Code.C,
     LUX.Color,
     LUX.Vulkan.core,
     LUX.Vulkan.Argume.Memory,
     LUX.Vulkan.Argume.Memory.Imager.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class;

     TVkImaDat3D<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class;

     TVkImager3DxBGRAxUInt8 <TVkSystem_,TVkDevice_,TVkContex_:class> = class;
     TVkImager3DxBGRAxUFix8 <TVkSystem_,TVkDevice_,TVkContex_:class> = class;
     TVkImager3DxRGBAxUInt32<TVkSystem_,TVkDevice_,TVkContex_:class> = class;
     TVkImager3DxRGBAxSFlo32<TVkSystem_,TVkDevice_,TVkContex_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

     TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class( TVkImager2D<TVkSystem_,TVkDevice_,TVkContex_,TValue_> )
     private
       type TVkMemDat_ = TVkMemDat  <TVkSystem_,TVkDevice_,TVkContex_>;
            TVkImaDat_ = TVkImaDat3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>;
     protected
       _CountZ :Integer;
       ///// A C C E S S O R
       function NewData :TVkMemDat_; override;
       function GetData :TVkImaDat_; reintroduce; virtual;
       procedure SetData( const Data_:TVkImaDat_ ); reintroduce; virtual;
       function GetImgTyp :T_VkImageType; override;
       function GetVewTyp :T_VkImageViewType; override;
       function GetCountZ :Integer; override;
       procedure SetCountZ( const CountZ_:Integer ); override;
     public
       constructor Create; override;
       ///// P R O P E R T Y
       property Data   :TVkImaDat_ read GetData   write SetData  ;
       property CountZ :Integer    read GetCountZ write SetCountZ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImaDat3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

     TVkImaDat3D<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class( TVkImaDat2D<TVkSystem_,TVkDevice_,TVkContex_,TValue_> )
     private
       type TVkImager_ = TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>;
            PValue_    = ^TValue_;
     protected
       ///// A C C E S S O R
       function GetImager :TVkImager_; reintroduce; virtual;
       function GetValueP( const X_,Y_,Z_:Integer ) :PByte;
       function GetValues( const X_,Y_,Z_:Integer ) :TValue_;
       procedure SetValues( const X_,Y_,Z_:Integer; const Values_:TValue_ );
     public
       ///// P R O P E R T Y
       property Imager                           :TVkImager_ read GetImager                ;
       property ValueP[ const X_,Y_,Z_:Integer ] :PByte      read GetValueP                ;
       property Values[ const X_,Y_,Z_:Integer ] :TValue_    read GetValues write SetValues; default;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager3DxBGRAxUInt8<TVkSystem_,TVkDevice_,TVkContex_>

     TVkImager3DxBGRAxUInt8<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TByteRGBA> )
     private
     protected
       ///// A C C E S S O R
       function GetFormat :T_VkFormat; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager3DxBGRAxUFix8<TVkSystem_,TVkDevice_,TVkContex_>

     TVkImager3DxBGRAxUFix8<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TByteRGBA> )
     private
     protected
       ///// A C C E S S O R
       function GetFormat :T_VkFormat; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager3DxRGBAxUInt32<TVkSystem_,TVkDevice_,TVkContex_>

     TVkImager3DxRGBAxUInt32<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TUInt32xRGBA> )
     private
     protected
       ///// A C C E S S O R
       function GetFormat :T_VkFormat; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager3DxRGBAxSFlo32<TVkSystem_,TVkDevice_,TVkContex_>

     TVkImager3DxRGBAxSFlo32<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TSingleRGBA> )
     private
     protected
       ///// A C C E S S O R
       function GetFormat :T_VkFormat; override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.NewData :TVkMemDat_;
begin
     Result := TVkImaDat_.Create( Self );
end;

function TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetData :TVkImaDat_;
begin
     Result := TVkImaDat_( inherited Data );
end;

procedure TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetData( const Data_:TVkImaDat_ );
begin
     inherited Data := Data_;
end;

//------------------------------------------------------------------------------

function TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetImgTyp :T_VkImageType;
begin
     Result := VK_IMAGE_TYPE_3D;
end;

function TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetVewTyp :T_VkImageViewType;
begin
     Result := VK_IMAGE_VIEW_TYPE_3D;
end;

//------------------------------------------------------------------------------

function TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetCountZ :Integer;
begin
     Result := _CountZ;
end;

procedure TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetCountZ( const CountZ_:Integer );
begin
     inherited;

     _CountZ := CountZ_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkImager3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.Create;
begin
     inherited;

     _CountZ := 1;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImaDat3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImaDat3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetImager :TVkImager_;
begin
     Result := TVkImager_( Memory );
end;

//------------------------------------------------------------------------------

function TVkImaDat3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetValueP( const X_,Y_,Z_:Integer ) :PByte;
begin
     Result := inherited GetValueP( X_, Y_ );

     Inc( Result, _PitchZ * Z_ );
end;

function TVkImaDat3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetValues( const X_,Y_,Z_:Integer ) :TValue_;
begin
     Result := PValue_( ValueP[ X_, Y_, Z_ ] )^;
end;

procedure TVkImaDat3D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetValues( const X_,Y_,Z_:Integer; const Values_:TValue_ );
begin
     PValue_( ValueP[ X_, Y_, Z_ ] )^ := Values_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager3DxBGRAxUInt8<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager3DxBGRAxUInt8<TVkSystem_,TVkDevice_,TVkContex_>.GetFormat :T_VkFormat;
begin
     Result := VK_FORMAT_B8G8R8A8_UINT;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager3DxBGRAxUFix8<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager3DxBGRAxUFix8<TVkSystem_,TVkDevice_,TVkContex_>.GetFormat :T_VkFormat;
begin
     Result := VK_FORMAT_B8G8R8A8_UNORM;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager3DxRGBAxUInt32<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager3DxRGBAxUInt32<TVkSystem_,TVkDevice_,TVkContex_>.GetFormat :T_VkFormat;
begin
     Result := VK_FORMAT_R32G32B32A32_UINT;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager3DxRGBAxSFlo32<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager3DxRGBAxSFlo32<TVkSystem_,TVkDevice_,TVkContex_>.GetFormat :T_VkFormat;
begin
     Result := VK_FORMAT_R32G32B32A32_SFLOAT;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
