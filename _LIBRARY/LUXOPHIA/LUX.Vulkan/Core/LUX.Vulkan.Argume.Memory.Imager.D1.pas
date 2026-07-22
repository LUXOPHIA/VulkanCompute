unit LUX.Vulkan.Argume.Memory.Imager.D1;

interface //#################################################################### ■

uses vk_platform, vulkan_core,
     LUX,
     LUX.Code.C,
     LUX.Color,
     LUX.Vulkan.core,
     LUX.Vulkan.Argume.Memory,
     LUX.Vulkan.Argume.Memory.Imager;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class;

     TVkImaDat1D<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class;

     TVkImager1DxBGRAxUInt8 <TVkSystem_,TVkDevice_,TVkContex_:class> = class;
     TVkImager1DxBGRAxUFix8 <TVkSystem_,TVkDevice_,TVkContex_:class> = class;
     TVkImager1DxRGBAxUInt32<TVkSystem_,TVkDevice_,TVkContex_:class> = class;
     TVkImager1DxRGBAxSFlo32<TVkSystem_,TVkDevice_,TVkContex_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

     TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class( TVkImager<TVkSystem_,TVkDevice_,TVkContex_,TValue_> )
     private
       type TVkMemDat_ = TVkMemDat  <TVkSystem_,TVkDevice_,TVkContex_>;
            TVkImaDat_ = TVkImaDat1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>;
     protected
       _CountX :Integer;
       ///// A C C E S S O R
       function NewData :TVkMemDat_; override;
       function GetData :TVkImaDat_; reintroduce; virtual;
       procedure SetData( const Data_:TVkImaDat_ ); reintroduce; virtual;
       function GetImgTyp :T_VkImageType; override;
       function GetVewTyp :T_VkImageViewType; override;
       function GetCountX :Integer; override;
       procedure SetCountX( const CountX_:Integer ); override;
     public
       constructor Create; override;
       ///// P R O P E R T Y
       property Data   :TVkImaDat_ read GetData   write SetData  ;
       property CountX :Integer    read GetCountX write SetCountX;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImaDat1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

     TVkImaDat1D<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class( TVkImaDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_> )
     private
       type TVkImager_ = TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>;
            PValue_    = ^TValue_;
     protected
       ///// A C C E S S O R
       function GetImager :TVkImager_; reintroduce; virtual;
       function GetValueP( const X_:Integer ) :PByte;
       function GetValues( const X_:Integer ) :TValue_;
       procedure SetValues( const X_:Integer; const Values_:TValue_ );
     public
       ///// P R O P E R T Y
       property Imager                     :TVkImager_ read GetImager                ;
       property ValueP[ const X_:Integer ] :PByte      read GetValueP                ;
       property Values[ const X_:Integer ] :TValue_    read GetValues write SetValues; default;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager1DxBGRAxUInt8<TVkSystem_,TVkDevice_,TVkContex_>

     TVkImager1DxBGRAxUInt8<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TByteRGBA> )
     private
     protected
       ///// A C C E S S O R
       function GetFormat :T_VkFormat; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager1DxBGRAxUFix8<TVkSystem_,TVkDevice_,TVkContex_>

     TVkImager1DxBGRAxUFix8<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TByteRGBA> )
     private
     protected
       ///// A C C E S S O R
       function GetFormat :T_VkFormat; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager1DxRGBAxUInt32<TVkSystem_,TVkDevice_,TVkContex_>

     TVkImager1DxRGBAxUInt32<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TUInt32xRGBA> )
     private
     protected
       ///// A C C E S S O R
       function GetFormat :T_VkFormat; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager1DxRGBAxSFlo32<TVkSystem_,TVkDevice_,TVkContex_>

     TVkImager1DxRGBAxSFlo32<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TSingleRGBA> )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.NewData :TVkMemDat_;
begin
     Result := TVkImaDat_.Create( Self );
end;

function TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetData :TVkImaDat_;
begin
     Result := TVkImaDat_( inherited Data );
end;

procedure TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetData( const Data_:TVkImaDat_ );
begin
     inherited Data := Data_;
end;

//------------------------------------------------------------------------------

function TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetImgTyp :T_VkImageType;
begin
     Result := VK_IMAGE_TYPE_1D;
end;

function TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetVewTyp :T_VkImageViewType;
begin
     Result := VK_IMAGE_VIEW_TYPE_1D;
end;

//------------------------------------------------------------------------------

function TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetCountX :Integer;
begin
     Result := _CountX;
end;

procedure TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetCountX( const CountX_:Integer );
begin
     inherited;

     _CountX := CountX_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkImager1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.Create;
begin
     inherited;

     _CountX := 1;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImaDat1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImaDat1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetImager :TVkImager_;
begin
     Result := TVkImager_( Memory );
end;

//------------------------------------------------------------------------------

function TVkImaDat1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetValueP( const X_:Integer ) :PByte;
begin
     Result := inherited GetValueP;

     Inc( Result, _PitchX * X_ );
end;

function TVkImaDat1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetValues( const X_:Integer ) :TValue_;
begin
     Result := PValue_( ValueP[ X_ ] )^;
end;

procedure TVkImaDat1D<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetValues( const X_:Integer; const Values_:TValue_ );
begin
     PValue_( ValueP[ X_ ] )^ := Values_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager1DxBGRAxUInt8<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager1DxBGRAxUInt8<TVkSystem_,TVkDevice_,TVkContex_>.GetFormat :T_VkFormat;
begin
     Result := VK_FORMAT_B8G8R8A8_UINT;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager1DxBGRAxUFix8<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager1DxBGRAxUFix8<TVkSystem_,TVkDevice_,TVkContex_>.GetFormat :T_VkFormat;
begin
     Result := VK_FORMAT_B8G8R8A8_UNORM;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager1DxRGBAxUInt32<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager1DxRGBAxUInt32<TVkSystem_,TVkDevice_,TVkContex_>.GetFormat :T_VkFormat;
begin
     Result := VK_FORMAT_R32G32B32A32_UINT;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkImager1DxRGBAxSFlo32<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkImager1DxRGBAxSFlo32<TVkSystem_,TVkDevice_,TVkContex_>.GetFormat :T_VkFormat;
begin
     Result := VK_FORMAT_R32G32B32A32_SFLOAT;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
