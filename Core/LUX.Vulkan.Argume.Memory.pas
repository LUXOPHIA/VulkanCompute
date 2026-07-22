unit LUX.Vulkan.Argume.Memory;

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     LUX.Data.List,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan.Queuer,
     LUX.Vulkan.Argume;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkMemory<TVkSystem_,TVkDevice_,TVkContex_:class> = class;

     TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>

     TVkMemory<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TVkArgume<TVkSystem_,TVkDevice_,TVkContex_> )
     private
       type TVkQueuer_ = TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkMemDat_ = TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       _Memory :T_VkDeviceMemory;
       _Data   :TVkMemDat_;
       _Queuer :TVkQueuer_;
       ///// A C C E S S O R
       function NewData :TVkMemDat_; virtual; abstract;
       function GetData :TVkMemDat_; virtual;
       procedure SetData( const Data_:TVkMemDat_ ); virtual;
       function GetSize :T_VkDeviceSize; virtual; abstract;
       function GetQueuer :TVkQueuer_; virtual;
       procedure SetQueuer( const Queuer_:TVkQueuer_ ); virtual;
       ///// M E T H O D
       function AllocMemory( const Require_:T_VkMemoryRequirements; const Flags_:T_VkMemoryPropertyFlags ) :T_VkDeviceMemory;
       function CreateHandle :T_VkResult; virtual; abstract;
       function DestroHandle :T_VkResult; virtual; abstract;
     public
       constructor Create; override;
       constructor Create( const Contex_:TVkContex_; const Queuer_:TVkQueuer_ ); overload; virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Memory :T_VkDeviceMemory read   _Memory                ;
       property Data   :TVkMemDat_       read GetData   write SetData  ;
       property Size   :T_VkDeviceSize   read GetSize                  ;
       property Queuer :TVkQueuer_       read GetQueuer write SetQueuer;
       ///// M E T H O D
       function DeviceHandle :T_VkDevice;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>

     TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_:class> = class
     private
       type TVkQueuer_ = TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkMemory_ = TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       _Memory :TVkMemory_;
       _Mode   :TVkMapModes;
       _Handle :P_void;
       ///// A C C E S S O R
       function GetQueuer :TVkQueuer_; virtual;
       function GetMemory :TVkMemory_; virtual;
       function GetMode :TVkMapModes; virtual;
       procedure SetMode( const Mode_:TVkMapModes ); virtual;
       function GetHandle :P_void; virtual;
       procedure SetHandle( const Handle_:P_void ); virtual;
       ///// M E T H O D
       function CreateHandle :T_VkResult; virtual; abstract;
       function DestroHandle :T_VkResult; virtual; abstract;
     public
       constructor Create; overload; virtual;
       constructor Create( const Memory_:TVkMemory_ ); overload; virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Queuer :TVkQueuer_  read GetQueuer                ;
       property Memory :TVkMemory_  read GetMemory                ;
       property Mode   :TVkMapModes read GetMode   write SetMode  ;
       property Handle :P_void      read GetHandle write SetHandle;
       ///// M E T H O D
       procedure FreeHandle;
       procedure Map; virtual;
       procedure Unmap; virtual;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

uses LUX.Vulkan.Device,
     LUX.Vulkan.Contex;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>.GetData :TVkMemDat_;
begin
     Result := _Data;
end;

procedure TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>.SetData( const Data_:TVkMemDat_ );
begin
     _Data := Data_;
end;

//------------------------------------------------------------------------------

function TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>.GetQueuer :TVkQueuer_;
begin
     Result := _Queuer;
end;

procedure TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>.SetQueuer( const Queuer_:TVkQueuer_ );
begin
     _Queuer := Queuer_;

     Data.Handle := nil;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>.DeviceHandle :T_VkDevice;
begin
     Result := TVkContex<TVkSystem_,TVkDevice_>( Contex ).Handle;
end;

function TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>.AllocMemory( const Require_:T_VkMemoryRequirements; const Flags_:T_VkMemoryPropertyFlags ) :T_VkDeviceMemory;
var
   D :TVkDevice<TVkSystem_>;
   I :T_VkMemoryAllocateInfo;
begin
     D := TVkDevice<TVkSystem_>( TVkContex<TVkSystem_,TVkDevice_>( Contex ).Device );

     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType           := VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
          allocationSize  := Require_.size;
          memoryTypeIndex := D.MemoryByFlags( Require_.memoryTypeBits, Flags_ );
     end;

     CheckVk( vkAllocateMemory( DeviceHandle, @I, nil, @Result ), 'TVkMemory.AllocMemory is Error!' );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>.Create;
begin
     inherited;

     _Memory := Default( T_VkDeviceMemory );
     _Data   := NewData;
     _Queuer := nil;
end;

constructor TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>.Create( const Contex_:TVkContex_; const Queuer_:TVkQueuer_ );
begin
     Create( Contex_ );

     _Queuer := Queuer_;
end;

destructor TVkMemory<TVkSystem_,TVkDevice_,TVkContex_>.Destroy;
begin
     _Data.Free;

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.GetQueuer :TVkQueuer_;
begin
     Result := Memory.Queuer;
end;

//------------------------------------------------------------------------------

function TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.GetMemory :TVkMemory_;
begin
     Result := _Memory;
end;

//------------------------------------------------------------------------------

function TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.GetMode :TVkMapModes;
begin
     Result := _Mode;
end;

procedure TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.SetMode( const Mode_:TVkMapModes );
begin
     _Mode := Mode_;

     Handle := nil;
end;

//------------------------------------------------------------------------------

function TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.GetHandle :P_void;
begin
     if not Assigned( _Handle ) then CreateHandle;

     Result := _Handle;
end;

procedure TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.SetHandle( const Handle_:P_void );
begin
     if Assigned( _Handle ) then CheckVk( DestroHandle, 'TVkMemDat.DestroHandle is Error!' );

     _Handle := Handle_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.Create;
begin
     inherited;

     _Handle := nil;

     _Memory := nil;
     _Mode   := [ TVkMapMode.Read, TVkMapMode.Write ];
end;

constructor TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.Create( const Memory_:TVkMemory_ );
begin
     Create;

     _Memory := Memory_;
end;

destructor TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.Destroy;
begin
     FreeHandle;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.FreeHandle;
begin
     if Assigned( _Handle ) then DestroHandle;

     _Handle := nil;
end;

procedure TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.Map;
begin
     Handle;
end;

procedure TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>.Unmap;
begin
     Handle := nil;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
