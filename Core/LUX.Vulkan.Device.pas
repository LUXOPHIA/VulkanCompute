unit LUX.Vulkan.Device;

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     LUX.Data.List,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan.Contex;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkDevices <TVkSystem_:class> = class;
       TVkDevice<TVkSystem_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkDevice<TVkSystem_>

     TVkDevice<TVkSystem_:class> = class( TListChildr<TVkSystem_,TVkDevices<TVkSystem_>> )
     private
       type TVkDevices_ = TVkDevices<TVkSystem_>;
            TVkDevice_  = TVkDevice <TVkSystem_>;
            TVkContexs_ = TVkContexs<TVkSystem_,TVkDevice_>;
     protected
       _Handle  :T_VkPhysicalDevice;
       _Contexs :TVkContexs_;
       ///// A C C E S S O R
       function GetPropers :T_VkPhysicalDeviceProperties;
       function GetFeature :T_VkPhysicalDeviceFeatures;
       function GetMemProp :T_VkPhysicalDeviceMemoryProperties;
       function GetFamilys :TArray<T_VkQueueFamilyProperties>;
       function GetDEVICE_NAME :String;
       function GetDEVICE_TYPE :T_VkPhysicalDeviceType;
       function GetVENDOR_ID :T_uint32_t;
       function GetDEVICE_ID :T_uint32_t;
       function GetAPI_VERSION :TVkVersion;
       function GetDRIVER_VERSION :TVkVersion;
     public
       constructor Create; override;
       constructor Create( const Devices_:TVkDevices_; const Handle_:T_VkPhysicalDevice ); overload; virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property System         :TVkSystem_                          read GetOwnere        ;
       property Devices        :TVkDevices_                         read GetParent        ;
       property Handle         :T_VkPhysicalDevice                  read   _Handle        ;
       property Propers        :T_VkPhysicalDeviceProperties        read GetPropers       ;
       property Feature        :T_VkPhysicalDeviceFeatures          read GetFeature       ;
       property MemProp        :T_VkPhysicalDeviceMemoryProperties  read GetMemProp       ;
       property Familys        :TArray<T_VkQueueFamilyProperties>   read GetFamilys       ;
       property DEVICE_NAME    :String                              read GetDEVICE_NAME   ;
       property DEVICE_TYPE    :T_VkPhysicalDeviceType              read GetDEVICE_TYPE   ;
       property VENDOR_ID      :T_uint32_t                          read GetVENDOR_ID     ;
       property DEVICE_ID      :T_uint32_t                          read GetDEVICE_ID     ;
       property API_VERSION    :TVkVersion                          read GetAPI_VERSION   ;
       property DRIVER_VERSION :TVkVersion                          read GetDRIVER_VERSION;
       property Contexs        :TVkContexs_                         read   _Contexs       ;
       ///// M E T H O D
       function FamilyByFlags( const Flags_:T_VkQueueFlags ) :Integer;
       function MemoryByFlags( const TypeBits_:T_uint32_t; const Flags_:T_VkMemoryPropertyFlags ) :Integer;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkDevices<TVkSystem_>

     TVkDevices<TVkSystem_:class> = class( TListParent<TVkSystem_,TVkDevice<TVkSystem_>> )
     private
       type TVkDevice_ = TVkDevice<TVkSystem_>;
     protected
       _Handle :T_VkInstance;
       ///// A C C E S S O R
       function GetHandle :T_VkInstance;
       procedure SetHandle( const Handle_:T_VkInstance );
       ///// M E T H O D
       function CreateHandle :T_VkResult; virtual;
       function DestroHandle :T_VkResult; virtual;
       procedure FindDevices;
       ///// イベント
       procedure OnInit; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property System :TVkSystem_   read GetOwnere                ;
       property Handle :T_VkInstance read GetHandle write SetHandle;
       ///// M E T H O D
       procedure FreeHandle;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkDevice<TVkSystem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkDevice<TVkSystem_>.GetPropers :T_VkPhysicalDeviceProperties;
begin
     vkGetPhysicalDeviceProperties( Handle, @Result );
end;

function TVkDevice<TVkSystem_>.GetFeature :T_VkPhysicalDeviceFeatures;
begin
     vkGetPhysicalDeviceFeatures( Handle, @Result );
end;

function TVkDevice<TVkSystem_>.GetMemProp :T_VkPhysicalDeviceMemoryProperties;
begin
     vkGetPhysicalDeviceMemoryProperties( Handle, @Result );
end;

function TVkDevice<TVkSystem_>.GetFamilys :TArray<T_VkQueueFamilyProperties>;
var
   N :T_uint32_t;
begin
     vkGetPhysicalDeviceQueueFamilyProperties( Handle, @N, nil );

     SetLength( Result, N );

     vkGetPhysicalDeviceQueueFamilyProperties( Handle, @N, @Result[0] );
end;

//------------------------------------------------------------------------------

function TVkDevice<TVkSystem_>.GetDEVICE_NAME :String;
var
   P :T_VkPhysicalDeviceProperties;
begin
     P := Propers;

     Result := String( P_char( @P.deviceName[0] ) );
end;

function TVkDevice<TVkSystem_>.GetDEVICE_TYPE :T_VkPhysicalDeviceType;
begin
     Result := Propers.deviceType;
end;

function TVkDevice<TVkSystem_>.GetVENDOR_ID :T_uint32_t;
begin
     Result := Propers.vendorID;
end;

function TVkDevice<TVkSystem_>.GetDEVICE_ID :T_uint32_t;
begin
     Result := Propers.deviceID;
end;

function TVkDevice<TVkSystem_>.GetAPI_VERSION :TVkVersion;
begin
     Result := TVkVersion.Create( Propers.apiVersion );
end;

function TVkDevice<TVkSystem_>.GetDRIVER_VERSION :TVkVersion;
begin
     Result := TVkVersion.Create( Propers.driverVersion );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkDevice<TVkSystem_>.Create;
begin
     inherited;

     _Contexs := TVkContexs_.Create( Self );
end;

constructor TVkDevice<TVkSystem_>.Create( const Devices_:TVkDevices_; const Handle_:T_VkPhysicalDevice );
begin
     Create( Devices_ );

     _Handle := Handle_;
end;

destructor TVkDevice<TVkSystem_>.Destroy;
begin
     _Contexs.Free;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkDevice<TVkSystem_>.FamilyByFlags( const Flags_:T_VkQueueFlags ) :Integer;
var
   Fs :TArray<T_VkQueueFamilyProperties>;
   I :Integer;
begin
     Fs := Familys;

     for I := 0 to Length( Fs )-1 do
     begin
          if Fs[ I ].queueFlags and Flags_ = Flags_ then Exit( I );
     end;

     Result := -1;
end;

function TVkDevice<TVkSystem_>.MemoryByFlags( const TypeBits_:T_uint32_t; const Flags_:T_VkMemoryPropertyFlags ) :Integer;
var
   Ms :T_VkPhysicalDeviceMemoryProperties;
   I :Integer;
begin
     Ms := MemProp;

     for I := 0 to Ms.memoryTypeCount-1 do
     begin
          if ( TypeBits_ and ( 1 shl I ) <> 0 )
         and ( Ms.memoryTypes[ I ].propertyFlags and Flags_ = Flags_ ) then Exit( I );
     end;

     Result := -1;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkDevices<TVkSystem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkDevices<TVkSystem_>.GetHandle :T_VkInstance;
begin
     if not Assigned( _Handle ) then CreateHandle;

     Result := _Handle;
end;

procedure TVkDevices<TVkSystem_>.SetHandle( const Handle_:T_VkInstance );
begin
     if Assigned( _Handle ) then DestroHandle;

     _Handle := Handle_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkDevices<TVkSystem_>.CreateHandle :T_VkResult;
var
   A :T_VkApplicationInfo;
   I :T_VkInstanceCreateInfo;
begin
     FillChar( A, SizeOf( A ), 0 );
     with A do
     begin
          sType      := VK_STRUCTURE_TYPE_APPLICATION_INFO;
          apiVersion := VK_API_VERSION_1_0;
     end;

     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType            := VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
          pApplicationInfo := @A;
     end;

     Result := vkCreateInstance( @I, nil, @_Handle );
end;

function TVkDevices<TVkSystem_>.DestroHandle :T_VkResult;
begin
     vkDestroyInstance( _Handle, nil );

     _Handle := nil;

     Result := VK_SUCCESS;
end;

//------------------------------------------------------------------------------

procedure TVkDevices<TVkSystem_>.FindDevices;
var
   DsN :T_uint32_t;
   Ds :TArray<T_VkPhysicalDevice>;
   D :T_VkPhysicalDevice;
begin
     if not Assigned( vkEnumeratePhysicalDevices ) then Exit;

     CheckVk( vkEnumeratePhysicalDevices( Handle, @DsN, nil ), 'TVkDevices.FindDevices is Error!' );

     SetLength( Ds, DsN );

     CheckVk( vkEnumeratePhysicalDevices( Handle, @DsN, @Ds[0] ), 'TVkDevices.FindDevices is Error!' );

     for D in Ds do TVkDevice_.Create( Self, D );
end;

/////////////////////////////////////////////////////////////////////// イベント

procedure TVkDevices<TVkSystem_>.OnInit;
begin
     FindDevices;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkDevices<TVkSystem_>.Create;
begin
     inherited;

     _Handle := nil;
end;

destructor TVkDevices<TVkSystem_>.Destroy;
begin
     Clear;

     FreeHandle;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkDevices<TVkSystem_>.FreeHandle;
begin
     if Assigned( _Handle ) then DestroHandle;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
