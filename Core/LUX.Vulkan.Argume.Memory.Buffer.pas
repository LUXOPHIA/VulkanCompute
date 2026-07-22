unit LUX.Vulkan.Argume.Memory.Buffer;

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     LUX,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan.Queuer,
     LUX.Vulkan.Argume.Memory;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class;

     TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

     TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class( TVkMemory<TVkSystem_,TVkDevice_,TVkContex_> )
     private
       type TVkMemDat_ = TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkBufDat_ = TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>;
     protected
       _Handle :T_VkBuffer;
       _Count  :Integer;
       ///// A C C E S S O R
       function GetBuffeH :T_VkBuffer; override;
       function GetHandle :T_VkBuffer; virtual;
       procedure SetHandle( const Handle_:T_VkBuffer ); virtual;
       function GetUsage :T_VkBufferUsageFlags; virtual;
       function NewData :TVkMemDat_; override;
       function GetData :TVkBufDat_; reintroduce; virtual;
       procedure SetData( const Data_:TVkBufDat_ ); reintroduce; virtual;
       function GetSize :T_VkDeviceSize; override;
       function GetCount :Integer; virtual;
       procedure SetCount( const Count_:Integer ); virtual;
       ///// M E T H O D
       function CreateHandle :T_VkResult; override;
       function DestroHandle :T_VkResult; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Handle :T_VkBuffer read GetHandle write SetHandle;
       property Data   :TVkBufDat_ read GetData   write SetData  ;
       property Count  :Integer    read GetCount  write SetCount ;
       ///// M E T H O D
       procedure FreeHandle;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

     TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_:class;TValue_:record> = class( TVkMemDat<TVkSystem_,TVkDevice_,TVkContex_> )
     private
       type TVkBuffer_ = TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>;
            PValue_    = ^TValue_;
     protected
       ///// A C C E S S O R
       function GetBuffer :TVkBuffer_; virtual;
       function GetValueP( const I_:Integer ) :PValue_; virtual;
       function GetValues( const I_:Integer ) :TValue_; virtual;
       procedure SetValues( const I_:Integer; const Values_:TValue_ ); virtual;
       ///// M E T H O D
       function CreateHandle :T_VkResult; override;
       function DestroHandle :T_VkResult; override;
     public
       ///// P R O P E R T Y
       property Buffer                     :TVkBuffer_ read GetBuffer                ;
       property ValueP[ const I_:Integer ] :PValue_    read GetValueP                ;
       property Values[ const I_:Integer ] :TValue_    read GetValues write SetValues; default;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

uses LUX.Vulkan.Contex;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetBuffeH :T_VkBuffer;
begin
     Result := Handle;
end;

//------------------------------------------------------------------------------

function TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetHandle :T_VkBuffer;
begin
     if _Handle = Default( T_VkBuffer ) then CreateHandle;

     Result := _Handle;
end;

procedure TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetHandle( const Handle_:T_VkBuffer );
begin
     if _Handle <> Default( T_VkBuffer ) then CheckVk( DestroHandle, 'TVkBuffer.DestroHandle is Error!' );

     _Handle := Handle_;
end;

//------------------------------------------------------------------------------

function TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetUsage :T_VkBufferUsageFlags;
begin
     Result := VK_BUFFER_USAGE_STORAGE_BUFFER_BIT
            or VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT
            or VK_BUFFER_USAGE_TRANSFER_SRC_BIT
            or VK_BUFFER_USAGE_TRANSFER_DST_BIT;
end;

//------------------------------------------------------------------------------

function TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.NewData :TVkMemDat_;
begin
     Result := TVkBufDat_.Create( Self );
end;

function TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetData :TVkBufDat_;
begin
     Result := TVkBufDat_( inherited Data );
end;

procedure TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetData( const Data_:TVkBufDat_ );
begin
     inherited Data := Data_;
end;

//------------------------------------------------------------------------------

function TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetSize :T_VkDeviceSize;
begin
     Result := T_VkDeviceSize( SizeOf( TValue_ ) ) * T_VkDeviceSize( _Count );
end;

//------------------------------------------------------------------------------

function TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetCount :Integer;
begin
     Result := _Count;
end;

procedure TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetCount( const Count_:Integer );
begin
     Handle := Default( T_VkBuffer );

     _Count := Count_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.CreateHandle :T_VkResult;
var
   S :T_VkDeviceSize;
   I :T_VkBufferCreateInfo;
   R :T_VkMemoryRequirements;
begin
     S := Size;  // with 内では I.size が優先されるため、事前に取得する

     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType       := VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO;
          size        := S;
          usage       := GetUsage;
          sharingMode := VK_SHARING_MODE_EXCLUSIVE;
     end;

     Result := vkCreateBuffer( DeviceHandle, @I, nil, @_Handle );

     if Result <> VK_SUCCESS then Exit;

     vkGetBufferMemoryRequirements( DeviceHandle, _Handle, @R );

     _Memory := AllocMemory( R, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT
                             or VK_MEMORY_PROPERTY_HOST_COHERENT_BIT );

     Result := vkBindBufferMemory( DeviceHandle, _Handle, _Memory, 0 );
end;

function TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.DestroHandle :T_VkResult;
begin
     _Data.FreeHandle;

     vkDestroyBuffer( DeviceHandle, _Handle, nil );

     _Handle := Default( T_VkBuffer );

     if _Memory <> Default( T_VkDeviceMemory ) then
     begin
          vkFreeMemory( DeviceHandle, _Memory, nil );

          _Memory := Default( T_VkDeviceMemory );
     end;

     Result := VK_SUCCESS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.Create;
begin
     inherited;

     _Handle := Default( T_VkBuffer );

     _Count := 1;
end;

destructor TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.Destroy;
begin
     FreeHandle;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkBuffer<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.FreeHandle;
begin
     if _Handle <> Default( T_VkBuffer ) then DestroHandle;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetBuffer :TVkBuffer_;
begin
     Result := TVkBuffer_( Memory );
end;

function TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetValueP( const I_:Integer ) :PValue_;
begin
     Result := Handle;  Inc( Result, I_ );
end;

function TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.GetValues( const I_:Integer ) :TValue_;
begin
     Result := ValueP[ I_ ]^;
end;

procedure TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.SetValues( const I_:Integer; const Values_:TValue_ );
begin
     ValueP[ I_ ]^ := Values_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.CreateHandle :T_VkResult;
begin
     Buffer.Handle;  // バッファ本体とメモリの生成を保証する

     Result := vkMapMemory( Buffer.DeviceHandle, Buffer.Memory, 0, VK_WHOLE_SIZE, 0, @_Handle );
end;

function TVkBufDat<TVkSystem_,TVkDevice_,TVkContex_,TValue_>.DestroHandle :T_VkResult;
begin
     vkUnmapMemory( Buffer.DeviceHandle, Buffer.Memory );

     _Handle := nil;

     Result := VK_SUCCESS;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
