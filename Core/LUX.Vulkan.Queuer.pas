unit LUX.Vulkan.Queuer;

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     LUX.Data.List,
     LUX.Code.C,
     LUX.Vulkan.core;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkQueuers <TVkSystem_,TVkDevice_,TVkContex_:class> = class;
       TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>

     TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TListChildr<TVkContex_,TVkQueuers<TVkSystem_,TVkDevice_,TVkContex_>> )
     private
       type TVkQueuers_ = TVkQueuers<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       _Handle :T_VkQueue;
       _Pooler :T_VkCommandPool;
       ///// A C C E S S O R
       function GetHandle :T_VkQueue;
       procedure SetHandle( const Handle_:T_VkQueue );
       function GetPooler :T_VkCommandPool;
       ///// M E T H O D
       function CreateHandle :T_VkResult; virtual;
       function CreatePooler :T_VkResult; virtual;
       function DestroPooler :T_VkResult; virtual;
     public
       constructor Create; override;
       constructor Create( const Contex_:TVkContex_ ); overload; virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Contex  :TVkContex_      read GetOwnere                 ;
       property Queuers :TVkQueuers_     read GetParent                 ;
       property Handle  :T_VkQueue       read GetHandle  write SetHandle;
       property Pooler  :T_VkCommandPool read GetPooler                 ;
       ///// M E T H O D
       function BeginCommand :T_VkCommandBuffer;
       procedure EndCommand( const Command_:T_VkCommandBuffer );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkQueuers<TVkSystem_,TVkDevice_,TVkContex_>

     TVkQueuers<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TListParent<TVkContex_,TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>> )
     private
       type TVkQueuer_ = TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
     public
       ///// P R O P E R T Y
       property Contex :TVkContex_ read GetOwnere;
       ///// M E T H O D
       function Add :TVkQueuer_; overload;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

uses LUX.Vulkan.Contex;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.GetHandle :T_VkQueue;
begin
     if not Assigned( _Handle ) then CreateHandle;

     Result := _Handle;
end;

procedure TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.SetHandle( const Handle_:T_VkQueue );
begin
     _Handle := Handle_;
end;

//------------------------------------------------------------------------------

function TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.GetPooler :T_VkCommandPool;
begin
     if _Pooler = Default( T_VkCommandPool ) then CreatePooler;

     Result := _Pooler;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.CreateHandle :T_VkResult;
var
   C :TVkContex<TVkSystem_,TVkDevice_>;
begin
     C := TVkContex<TVkSystem_,TVkDevice_>( Contex );

     vkGetDeviceQueue( C.Handle, C.FamilyI, 0, @_Handle );

     Result := VK_SUCCESS;
end;

function TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.CreatePooler :T_VkResult;
var
   I :T_VkCommandPoolCreateInfo;
begin
     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType            := VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
          flags            := VK_COMMAND_POOL_CREATE_TRANSIENT_BIT;
          queueFamilyIndex := TVkContex<TVkSystem_,TVkDevice_>( Contex ).FamilyI;
     end;

     Result := vkCreateCommandPool( TVkContex<TVkSystem_,TVkDevice_>( Contex ).Handle, @I, nil, @_Pooler );
end;

function TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.DestroPooler :T_VkResult;
begin
     vkDestroyCommandPool( TVkContex<TVkSystem_,TVkDevice_>( Contex ).Handle, _Pooler, nil );

     _Pooler := Default( T_VkCommandPool );

     Result := VK_SUCCESS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.Create;
begin
     inherited;

     _Handle := nil;
     _Pooler := Default( T_VkCommandPool );
end;

constructor TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.Create( const Contex_:TVkContex_ );
begin
     inherited Create( TVkContex<TVkSystem_,TVkDevice_>( Contex_ ).Queuers );
end;

destructor TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.Destroy;
begin
     if _Pooler <> Default( T_VkCommandPool ) then DestroPooler;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.BeginCommand :T_VkCommandBuffer;
var
   A :T_VkCommandBufferAllocateInfo;
   B :T_VkCommandBufferBeginInfo;
begin
     FillChar( A, SizeOf( A ), 0 );
     with A do
     begin
          sType              := VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
          commandPool        := Pooler;
          level              := VK_COMMAND_BUFFER_LEVEL_PRIMARY;
          commandBufferCount := 1;
     end;

     CheckVk( vkAllocateCommandBuffers( TVkContex<TVkSystem_,TVkDevice_>( Contex ).Handle, @A, @Result ), 'TVkQueuer.BeginCommand is Error!' );

     FillChar( B, SizeOf( B ), 0 );
     with B do
     begin
          sType := VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
          flags := VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
     end;

     CheckVk( vkBeginCommandBuffer( Result, @B ), 'TVkQueuer.BeginCommand is Error!' );
end;

procedure TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>.EndCommand( const Command_:T_VkCommandBuffer );
var
   C :T_VkCommandBuffer;
   S :T_VkSubmitInfo;
begin
     C := Command_;

     CheckVk( vkEndCommandBuffer( C ), 'TVkQueuer.EndCommand is Error!' );

     FillChar( S, SizeOf( S ), 0 );
     with S do
     begin
          sType              := VK_STRUCTURE_TYPE_SUBMIT_INFO;
          commandBufferCount := 1;
          pCommandBuffers    := @C;
     end;

     CheckVk( vkQueueSubmit( Handle, 1, @S, Default( T_VkFence ) ), 'TVkQueuer.EndCommand is Error!' );

     CheckVk( vkQueueWaitIdle( Handle ), 'TVkQueuer.EndCommand is Error!' );

     vkFreeCommandBuffers( TVkContex<TVkSystem_,TVkDevice_>( Contex ).Handle, Pooler, 1, @C );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkQueuers<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkQueuers<TVkSystem_,TVkDevice_,TVkContex_>.Add :TVkQueuer_;
begin
     Result := TVkQueuer_.Create( Contex );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
