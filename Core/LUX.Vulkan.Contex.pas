unit LUX.Vulkan.Contex;

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     LUX.Data.List,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan.Queuer,
     LUX.Vulkan.Argume,
     LUX.Vulkan.Shader,
     LUX.Vulkan.Passer,
     LUX.Vulkan.Raster;

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
            TVkLibrars_ = TVkLibrars<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkShaders_ = TVkShaders<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkPassers_ = TVkPassers<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkRasters_ = TVkRasters<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       _Queuers  :TVkQueuers_;
       _Handle   :T_VkDevice;
       _FamilyI  :Integer;
       _QueFlags :T_VkQueueFlags;
       _Extens   :TArray<String>;
       _Argumes  :TVkArgumes_;
       _Librars  :TVkLibrars_;
       _Shaders  :TVkShaders_;
       _Passers  :TVkPassers_;
       _Rasters  :TVkRasters_;
       ///// A C C E S S O R
       function GetHandle :T_VkDevice;
       procedure SetHandle( const Handle_:T_VkDevice );
       function GetFamilyI :Integer;
       function GetQueFlags :T_VkQueueFlags;
       procedure SetQueFlags( const QueFlags_:T_VkQueueFlags );
       function GetExtens :TArray<String>;
       procedure SetExtens( const Extens_:TArray<String> );
       ///// M E T H O D
       procedure CheckUnborn( const Method_:String );
       function CreateHandle :T_VkResult; virtual;
       function DestroHandle :T_VkResult; virtual;
     public
       constructor Create; override;
       constructor Create( const Device_:TVkDevice_ ); overload; virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Device   :TVkDevice_     read GetOwnere                   ;
       property Contexs  :TVkContexs_    read GetParent                   ;
       property Queuers  :TVkQueuers_    read   _Queuers                  ;
       property Handle   :T_VkDevice     read GetHandle   write SetHandle  ;
       property FamilyI  :Integer        read GetFamilyI                  ;
       property QueFlags :T_VkQueueFlags read GetQueFlags write SetQueFlags;  // 要求するキューの能力（Handle の生成前にのみ設定可）
       property Extens   :TArray<String> read GetExtens   write SetExtens  ;  // 追加で有効化するデバイス拡張（同）
       property Argumes  :TVkArgumes_    read   _Argumes                  ;
       property Librars  :TVkLibrars_    read   _Librars                  ;
       property Shaders  :TVkShaders_    read   _Shaders                  ;
       property Passers  :TVkPassers_    read   _Passers                  ;
       property Rasters  :TVkRasters_    read   _Rasters                  ;
       ///// M E T H O D
       procedure FreeHandle;
       function AvailExtens :TArray<String>;          // 物理デバイスが対応するデバイス拡張
       function UsingExtens :TArray<String>; virtual; // 実際に有効化するデバイス拡張（対応するものだけ）
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

//------------------------------------------------------------------------------

function TVkContex<TVkSystem_,TVkDevice_>.GetQueFlags :T_VkQueueFlags;
begin
     Result := _QueFlags;
end;

procedure TVkContex<TVkSystem_,TVkDevice_>.SetQueFlags( const QueFlags_:T_VkQueueFlags );
begin
     CheckUnborn( 'TVkContex.QueFlags' );

     _QueFlags := QueFlags_;
end;

//------------------------------------------------------------------------------

function TVkContex<TVkSystem_,TVkDevice_>.GetExtens :TArray<String>;
begin
     Result := _Extens;
end;

procedure TVkContex<TVkSystem_,TVkDevice_>.SetExtens( const Extens_:TArray<String> );
begin
     CheckUnborn( 'TVkContex.Extens' );

     _Extens := Extens_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkContex<TVkSystem_,TVkDevice_>.CheckUnborn( const Method_:String );
begin
     // 論理デバイスの生成条件は、生成後には変えられない（子の資源がすべて無効になる）
     if Assigned( _Handle ) then raise EVkError.Create( VK_ERROR_INITIALIZATION_FAILED,
                                                       Method_ + ' は Handle の生成前にのみ設定できます。' );
end;

//------------------------------------------------------------------------------

function TVkContex<TVkSystem_,TVkDevice_>.CreateHandle :T_VkResult;
var
   D :TVkDevice<TVkSystem_>;
   P :T_float;
   Q :T_VkDeviceQueueCreateInfo;
   I :T_VkDeviceCreateInfo;
   E :TVkNames;
begin
     D := TVkDevice<TVkSystem_>( Device );

     _FamilyI := D.FamilyByFlags( _QueFlags );

     // 要求をすべて満たすファミリが無ければ、能力を落として探し直す
     if _FamilyI < 0 then _FamilyI := D.FamilyByFlags( VK_QUEUE_COMPUTE_BIT  );
     if _FamilyI < 0 then _FamilyI := D.FamilyByFlags( VK_QUEUE_GRAPHICS_BIT );

     if _FamilyI < 0 then Exit( VK_ERROR_INITIALIZATION_FAILED );

     E := TVkNames.Create( UsingExtens );  // Vulkan の呼び出しまで生存させる

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
          sType                   := VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
          queueCreateInfoCount    := 1;
          pQueueCreateInfos       := @Q;
          enabledExtensionCount   := E.Count;
          ppEnabledExtensionNames := E.Ptrs;
     end;

     Result := vkCreateDevice( D.Handle, @I, nil, @_Handle );
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

     _Handle   := nil;
     _FamilyI  := -1;
     _QueFlags := VK_QUEUE_GRAPHICS_BIT or VK_QUEUE_COMPUTE_BIT;  // 描画と演算を兼ねる万能ファミリ
     _Extens   := nil;

     _Queuers := TVkQueuers_.Create( Self );
     _Argumes := TVkArgumes_.Create( Self );
     _Librars := TVkLibrars_.Create( Self );
     _Shaders := TVkShaders_.Create( Self );
     _Passers := TVkPassers_.Create( Self );
     _Rasters := TVkRasters_.Create( Self );
end;

constructor TVkContex<TVkSystem_,TVkDevice_>.Create( const Device_:TVkDevice_ );
begin
     inherited Create( TVkDevice<TVkSystem_>( Device_ ).Contexs );
end;

destructor TVkContex<TVkSystem_,TVkDevice_>.Destroy;
begin
     _Rasters.Free;  // パイプラインは描画パスを参照するので先に
     _Passers.Free;
     _Shaders.Free;
     _Librars.Free;
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

//------------------------------------------------------------------------------

function TVkContex<TVkSystem_,TVkDevice_>.AvailExtens :TArray<String>;
begin
     Result := TVkDevice<TVkSystem_>( Device ).AvailExtens;
end;

function TVkContex<TVkSystem_,TVkDevice_>.UsingExtens :TArray<String>;
begin
     // 表示窓（TVkViewer）に必要な VK_KHR_swapchain は常に有効化を試みる。
     // 対応していない環境では黙って外される（オフスクリーン描画は影響を受けない）。
     Result := VkNameFilter( [ VK_KHR_SWAPCHAIN_EXTENSION_NAME ] + _Extens, AvailExtens );
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
