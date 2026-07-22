unit LUX.Vulkan.Argume.Samplr;

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     LUX.Data.List,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan.Argume;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_>

     TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TVkArgume<TVkSystem_,TVkDevice_,TVkContex_> )
     private
       type TVkArgumes_ = TVkArgumes<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       _Handle :T_VkSampler;
       ///// A C C E S S O R
       function GetSamplH :T_VkSampler; override;
       function GetHandle :T_VkSampler;
       procedure SetHandle( const Handle_:T_VkSampler );
       ///// M E T H O D
       function CreateHandle :T_VkResult; virtual;
       function DestroHandle :T_VkResult; virtual;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Contex  :TVkContex_  read GetOwnere                 ;
       property Argumes :TVkArgumes_ read GetParent                 ;
       property Handle  :T_VkSampler read GetHandle  write SetHandle;
       ///// M E T H O D
       procedure FreeHandle;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

uses LUX.Vulkan.Contex;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_>.GetSamplH :T_VkSampler;
begin
     Result := Handle;
end;

function TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_>.GetHandle :T_VkSampler;
begin
     if _Handle = Default( T_VkSampler ) then CreateHandle;

     Result := _Handle;
end;

procedure TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_>.SetHandle( const Handle_:T_VkSampler );
begin
     if _Handle <> Default( T_VkSampler ) then CheckVk( DestroHandle, 'TVkSamplr.DestroHandle is Error!' );

     _Handle := Handle_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_>.CreateHandle :T_VkResult;
var
   I :T_VkSamplerCreateInfo;
begin
     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType                   := VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO;
          magFilter               := VK_FILTER_LINEAR;
          minFilter               := VK_FILTER_LINEAR;
          mipmapMode              := VK_SAMPLER_MIPMAP_MODE_NEAREST;
          addressModeU            := VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT;
          addressModeV            := VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT;
          addressModeW            := VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT;
          anisotropyEnable        := VK_FALSE;
          compareEnable           := VK_FALSE;
          borderColor             := VK_BORDER_COLOR_FLOAT_OPAQUE_BLACK;
          unnormalizedCoordinates := VK_FALSE;
     end;

     Result := vkCreateSampler( TVkContex<TVkSystem_,TVkDevice_>( Contex ).Handle, @I, nil, @_Handle );
end;

function TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_>.DestroHandle :T_VkResult;
begin
     vkDestroySampler( TVkContex<TVkSystem_,TVkDevice_>( Contex ).Handle, _Handle, nil );

     _Handle := Default( T_VkSampler );

     Result := VK_SUCCESS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_>.Create;
begin
     inherited;

     _Handle := Default( T_VkSampler );
end;

destructor TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_>.Destroy;
begin
     FreeHandle;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkSamplr<TVkSystem_,TVkDevice_,TVkContex_>.FreeHandle;
begin
     if _Handle <> Default( T_VkSampler ) then DestroHandle;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
