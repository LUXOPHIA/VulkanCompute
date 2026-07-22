unit LUX.Vulkan.Contex;

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     LUX.Data.List,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan.Queuer,
     LUX.Vulkan.Argume,
     LUX.Vulkan.Shader;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkContexs <TVkSystem_,TVkDevice_:class> = class;
       TVkContex<TVkSystem_,TVkDevice_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkContex<TVkSystem_,TVkDevice_>

     TVkContex<TVkSystem_,TVkDevice_:class> = class( TListChildr<TVkDevice_,TVkContexs<TVkSystem_,TVkDevice_>> )
     private
       type TVkContexs_ = TVkContexs<TVkSystem_,TVkDevice_>;
            TVkContex_  = TVkContex <TVkSystem_,TVkDevice_>;
            TVkQueuers_ = TVkQueuers<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkArgumes_ = TVkArgumes<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkShaders_ = TVkShaders<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       _Queuers :TVkQueuers_;
       _Handle  :T_VkDevice;
       _FamilyI :Integer;
       _Argumes :TVkArgumes_;
       _Shaders :TVkShaders_;
       ///// A C C E S S O R
       function GetHandle :T_VkDevice;
       procedure SetHandle( const Handle_:T_VkDevice );
       function GetFamilyI :Integer;
       ///// M E T H O D
       function CreateHandle :T_VkResult; virtual;
       function DestroHandle :T_VkResult; virtual;
     public
       constructor Create; override;
       constructor Create( const Device_:TVkDevice_ ); overload; virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Device  :TVkDevice_  read GetOwnere                 ;
       property Contexs :TVkContexs_ read GetParent                 ;
       property Queuers :TVkQueuers_ read   _Queuers                ;
       property Handle  :T_VkDevice  read GetHandle  write SetHandle;
       property FamilyI :Integer     read GetFamilyI                ;
       property Argumes :TVkArgumes_ read   _Argumes                ;
       property Shaders :TVkShaders_ read   _Shaders                ;
       ///// M E T H O D
       procedure FreeHandle;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkContexs<TVkSystem_,TVkDevice_>

     TVkContexs<TVkSystem_,TVkDevice_:class> = class( TListParent<TVkDevice_,TVkContex<TVkSystem_,TVkDevice_>> )
     private
       type TVkContex_ = TVkContex<TVkSystem_,TVkDevice_>;
     protected
     public
       ///// P R O P E R T Y
       property Device :TVkDevice_ read GetOwnere;
       ///// M E T H O D
       function Add :TVkContex_; overload;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

uses LUX.Vulkan.Device;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkContex<TVkSystem_,TVkDevice_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkContex<TVkSystem_,TVkDevice_>.GetHandle :T_VkDevice;
begin
     if not Assigned( _Handle ) then CreateHandle;

     Result := _Handle;
end;

procedure TVkContex<TVkSystem_,TVkDevice_>.SetHandle( const Handle_:T_VkDevice );
begin
     if Assigned( _Handle ) then CheckVk( DestroHandle, 'TVkContex.DestroHandle is Error!' );

     _Handle := Handle_;
end;

//------------------------------------------------------------------------------

function TVkContex<TVkSystem_,TVkDevice_>.GetFamilyI :Integer;
begin
     Handle;  // 論理デバイスの生成時にファミリが確定する

     Result := _FamilyI;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkContex<TVkSystem_,TVkDevice_>.CreateHandle :T_VkResult;
var
   P :T_float;
   Q :T_VkDeviceQueueCreateInfo;
   I :T_VkDeviceCreateInfo;
begin
     _FamilyI := TVkDevice<TVkSystem_>( Device ).FamilyByFlags( VK_QUEUE_COMPUTE_BIT );

     P := 1;

     FillChar( Q, SizeOf( Q ), 0 );
     with Q do
     begin
          sType            := VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
          queueFamilyIndex := _FamilyI;
          queueCount       := 1;
          pQueuePriorities := @P;
     end;

     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType                := VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
          queueCreateInfoCount := 1;
          pQueueCreateInfos    := @Q;
     end;

     Result := vkCreateDevice( TVkDevice<TVkSystem_>( Device ).Handle, @I, nil, @_Handle );
end;

function TVkContex<TVkSystem_,TVkDevice_>.DestroHandle :T_VkResult;
begin
     vkDestroyDevice( _Handle, nil );

     _Handle := nil;

     Result := VK_SUCCESS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkContex<TVkSystem_,TVkDevice_>.Create;
begin
     inherited;

     _Handle  := nil;
     _FamilyI := -1;

     _Queuers := TVkQueuers_.Create( Self );
     _Argumes := TVkArgumes_.Create( Self );
     _Shaders := TVkShaders_.Create( Self );
end;

constructor TVkContex<TVkSystem_,TVkDevice_>.Create( const Device_:TVkDevice_ );
begin
     inherited Create( TVkDevice<TVkSystem_>( Device_ ).Contexs );
end;

destructor TVkContex<TVkSystem_,TVkDevice_>.Destroy;
begin
     _Shaders.Free;
     _Argumes.Free;
     _Queuers.Free;

     FreeHandle;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkContex<TVkSystem_,TVkDevice_>.FreeHandle;
begin
     if Assigned( _Handle ) then DestroHandle;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkContexs<TVkSystem_,TVkDevice_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkContexs<TVkSystem_,TVkDevice_>.Add :TVkContex_;
begin
     Result := TVkContex_.Create( Device );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
