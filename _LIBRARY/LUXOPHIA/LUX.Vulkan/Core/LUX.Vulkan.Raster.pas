unit LUX.Vulkan.Raster;

// ラスタライズパイプライン（VkPipeline ＋ VkPipelineLayout）
//
//【位置づけ】
// ・演算パイプラインの TVkKernel に対する、描画パイプラインの対応物である。
//   どちらも VkPipeline だが、演算は VkShaderModule 1 個から作られるのに対し、
//   描画は複数（頂点・フラグメント …）から作られるため、TVkKernel のように
//   単一の TVkShader の子には置けず、TVkContex の子（Contex.Rasters）となる。
//
//【段（TVkStager）】
// ・TVkStager は VkPipelineShaderStageCreateInfo に対応し、TVkShader（＝
//   VkShaderModule）と入口名（Entry）の組を持つ。段の種別は TVkShader.Stage
//   （glslang の段）から機械的に導かれるので、二重に指定する必要はない。
//
//【頂点入力】
// ・Bindins（頂点バッファの束ね方）と Attribs（頂点属性の配置）を Vulkan の構造体
//   そのままの配列で持つ。AddBindin / AddAttrib は素直な追加の補助である。
//
//【押込定数】
// ・PushSize バイトの押込定数（VkPushConstantRange）を 1 本だけ持つ。行列のように
//   毎フレーム・毎ノードで変わる小さな値は、記述子より押込定数のほうが速く簡単。
//   Vulkan が保証する最小容量は 128 バイト（＝ 4x4 行列 2 個）である。
//
//【記述子】
// ・SetLayouts に VkDescriptorSetLayout を渡せば、テクスチャや一様バッファも
//   扱える。生成と束縛は呼び出し側の責任であり、本クラスは配置だけを受け持つ。
//
//【描画パス】
// ・Passer が未設定なら、描画側（TVkRender / TVkViewer）が自分の描画パスを
//   最初の描画時に代入する。パイプラインは互換な描画パスの間で使い回せるので、
//   添付の形式が一致する限り、ひとつの TVkRaster を複数の描画先で共有できる。
//
//【動的状態】
// ・視野（viewport）と切り抜き（scissor）は常に動的状態である。よって描画先の
//   大きさが変わってもパイプラインを作り直す必要はない。
//
//【所有】
// ・TVkContex の子（Contex.Rasters）であり、コンテキストと共に解放される。

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     glslang_c_shader_types,
     LUX.Data.List,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan.Shader,
     LUX.Vulkan.Passer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkRasters   <TVkSystem_,TVkDevice_,TVkContex_:class> = class;
       TVkRaster  <TVkSystem_,TVkDevice_,TVkContex_:class> = class;
         TVkStagers<TVkSystem_,TVkDevice_,TVkContex_:class> = class;
           TVkStager<TVkSystem_,TVkDevice_,TVkContex_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStager<TVkSystem_,TVkDevice_,TVkContex_>

     // パイプラインの 1 段（VkPipelineShaderStageCreateInfo）
     TVkStager<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TListChildr<TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>,TVkStagers<TVkSystem_,TVkDevice_,TVkContex_>> )
     private
       type TVkRaster_  = TVkRaster <TVkSystem_,TVkDevice_,TVkContex_>;
            TVkStagers_ = TVkStagers<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkShader_  = TVkShader <TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       _Shader :TVkShader_;
       _Entry  :String;
       ///// A C C E S S O R
       function GetShader :TVkShader_; virtual;
       procedure SetShader( const Shader_:TVkShader_ ); virtual;
       function GetEntry :String; virtual;
       procedure SetEntry( const Entry_:String ); virtual;
       function GetFlags :T_VkShaderStageFlagBits; virtual;
     public
       constructor Create; override;
       constructor Create( const Stagers_:TVkStagers_; const Shader_:TVkShader_; const Entry_:String ); overload; virtual;
       ///// P R O P E R T Y
       property Raster  :TVkRaster_              read GetOwnere                ;
       property Stagers :TVkStagers_             read GetParent                ;
       property Shader  :TVkShader_              read GetShader write SetShader;  // ＝ VkShaderModule
       property Entry   :String                  read GetEntry  write SetEntry ;  // 入口関数の名前
       property Flags   :T_VkShaderStageFlagBits read GetFlags                 ;  // Shader.Stage から導かれる段の種別
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStagers<TVkSystem_,TVkDevice_,TVkContex_>

     TVkStagers<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TListParent<TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>,TVkStager<TVkSystem_,TVkDevice_,TVkContex_>> )
     private
       type TVkRaster_ = TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkStager_ = TVkStager<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkShader_ = TVkShader<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       ///// E V E N T
       procedure OnInsertChildr( const Childr_:TVkStager_ ); override;
       procedure OnRemoveChildr( const Childr_:TVkStager_ ); override;
     public
       ///// P R O P E R T Y
       property Raster :TVkRaster_ read GetOwnere;
       ///// M E T H O D
       function Add( const Shader_:TVkShader_; const Entry_:String = 'main' ) :TVkStager_; overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>

     TVkRaster<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TListChildr<TVkContex_,TVkRasters<TVkSystem_,TVkDevice_,TVkContex_>> )
     private
       type TVkRasters_ = TVkRasters<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkStagers_ = TVkStagers<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkStager_  = TVkStager <TVkSystem_,TVkDevice_,TVkContex_>;
            TVkPasser_  = TVkPasser <TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       _Handle    :T_VkPipeline;
       _Layout    :T_VkPipelineLayout;
       _Passer    :TVkPasser_;
       _Stagers   :TVkStagers_;
       _Bindins   :TArray<T_VkVertexInputBindingDescription>;
       _Attribs   :TArray<T_VkVertexInputAttributeDescription>;
       _SetLays   :TArray<T_VkDescriptorSetLayout>;
       _PushSize  :Integer;
       _PushFlags :T_VkShaderStageFlags;
       _Topology  :T_VkPrimitiveTopology;
       _PolyMode  :T_VkPolygonMode;
       _CullMode  :T_VkCullModeFlags;
       _FrontFace :T_VkFrontFace;
       _LineWidth :Single;
       _DepthTest :Boolean;
       _DepthWrit :Boolean;
       _DepthOper :T_VkCompareOp;
       _BlendOK   :Boolean;
       ///// A C C E S S O R
       function GetHandle :T_VkPipeline; virtual;
       function GetLayout :T_VkPipelineLayout; virtual;
       function GetPasser :TVkPasser_; virtual;
       procedure SetPasser( const Passer_:TVkPasser_ ); virtual;
       function GetBindins :TArray<T_VkVertexInputBindingDescription>; virtual;
       procedure SetBindins( const Bindins_:TArray<T_VkVertexInputBindingDescription> ); virtual;
       function GetAttribs :TArray<T_VkVertexInputAttributeDescription>; virtual;
       procedure SetAttribs( const Attribs_:TArray<T_VkVertexInputAttributeDescription> ); virtual;
       function GetSetLays :TArray<T_VkDescriptorSetLayout>; virtual;
       procedure SetSetLays( const SetLays_:TArray<T_VkDescriptorSetLayout> ); virtual;
       function GetPushSize :Integer; virtual;
       procedure SetPushSize( const PushSize_:Integer ); virtual;
       function GetPushFlags :T_VkShaderStageFlags; virtual;
       procedure SetPushFlags( const PushFlags_:T_VkShaderStageFlags ); virtual;
       function GetTopology :T_VkPrimitiveTopology; virtual;
       procedure SetTopology( const Topology_:T_VkPrimitiveTopology ); virtual;
       function GetPolyMode :T_VkPolygonMode; virtual;
       procedure SetPolyMode( const PolyMode_:T_VkPolygonMode ); virtual;
       function GetCullMode :T_VkCullModeFlags; virtual;
       procedure SetCullMode( const CullMode_:T_VkCullModeFlags ); virtual;
       function GetFrontFace :T_VkFrontFace; virtual;
       procedure SetFrontFace( const FrontFace_:T_VkFrontFace ); virtual;
       function GetLineWidth :Single; virtual;
       procedure SetLineWidth( const LineWidth_:Single ); virtual;
       function GetDepthTest :Boolean; virtual;
       procedure SetDepthTest( const DepthTest_:Boolean ); virtual;
       function GetDepthWrit :Boolean; virtual;
       procedure SetDepthWrit( const DepthWrit_:Boolean ); virtual;
       function GetDepthOper :T_VkCompareOp; virtual;
       procedure SetDepthOper( const DepthOper_:T_VkCompareOp ); virtual;
       function GetBlendOK :Boolean; virtual;
       procedure SetBlendOK( const BlendOK_:Boolean ); virtual;
       function GetBuildOK :Boolean; virtual;
       function GetBuildLog :String; virtual;
       ///// M E T H O D
       function CreateLayout :T_VkResult; virtual;
       function DestroLayout :T_VkResult; virtual;
       function CreateHandle :T_VkResult; virtual;
       function DestroHandle :T_VkResult; virtual;
     public
       constructor Create; override;
       constructor Create( const Contex_:TVkContex_ ); overload; virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Contex    :TVkContex_                                  read GetOwnere                      ;
       property Rasters   :TVkRasters_                                 read GetParent                      ;
       property Handle    :T_VkPipeline                                read GetHandle                      ;
       property Layout    :T_VkPipelineLayout                          read GetLayout                      ;
       property Passer    :TVkPasser_                                  read GetPasser    write SetPasser   ;  // 属する描画パス
       property Stagers   :TVkStagers_                                 read   _Stagers                     ;  // シェーダの段
       property Bindins   :TArray<T_VkVertexInputBindingDescription>   read GetBindins   write SetBindins  ;  // 頂点バッファの束ね方
       property Attribs   :TArray<T_VkVertexInputAttributeDescription> read GetAttribs   write SetAttribs  ;  // 頂点属性の配置
       property SetLayouts:TArray<T_VkDescriptorSetLayout>             read GetSetLays   write SetSetLays  ;  // 記述子セットの配置（既定は無し）
       property PushSize  :Integer                                     read GetPushSize  write SetPushSize ;  // 押込定数のバイト数（0 なら無し）
       property PushFlags :T_VkShaderStageFlags                        read GetPushFlags write SetPushFlags;  // 押込定数を読む段
       property Topology  :T_VkPrimitiveTopology                       read GetTopology  write SetTopology ;
       property PolyMode  :T_VkPolygonMode                             read GetPolyMode  write SetPolyMode ;
       property CullMode  :T_VkCullModeFlags                           read GetCullMode  write SetCullMode ;
       property FrontFace :T_VkFrontFace                               read GetFrontFace write SetFrontFace;
       property LineWidth :Single                                      read GetLineWidth write SetLineWidth;
       property DepthTest :Boolean                                     read GetDepthTest write SetDepthTest;
       property DepthWrit :Boolean                                     read GetDepthWrit write SetDepthWrit;
       property DepthOper :T_VkCompareOp                               read GetDepthOper write SetDepthOper;
       property BlendOK   :Boolean                                     read GetBlendOK   write SetBlendOK  ;  // 半透明合成（既定は無し）
       property BuildOK   :Boolean                                     read GetBuildOK                     ;  // 全段のコンパイルが成功したか
       property BuildLog  :String                                      read GetBuildLog                    ;  // 全段のコンパイルログ
       ///// M E T H O D
       function DeviceHandle :T_VkDevice;
       procedure FreeHandle;
       procedure AddBindin( const Binding_,Stride_:T_uint32_t; const Rate_:T_VkVertexInputRate = VK_VERTEX_INPUT_RATE_VERTEX );
       procedure AddAttrib( const Location_,Binding_:T_uint32_t; const Format_:T_VkFormat; const Offset_:T_uint32_t );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkRasters<TVkSystem_,TVkDevice_,TVkContex_>

     TVkRasters<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TListParent<TVkContex_,TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>> )
     private
     protected
     public
       ///// P R O P E R T Y
       property Contex :TVkContex_ read GetOwnere;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

// glslang の段 → Vulkan のシェーダ段
function VkStageOfGlslang( const Stage_:T_glslang_stage_t ) :T_VkShaderStageFlagBits;

implementation //############################################################### ■

uses System.SysUtils,
     LUX.Vulkan.Contex;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

function VkStageOfGlslang( const Stage_:T_glslang_stage_t ) :T_VkShaderStageFlagBits;
begin
     case Stage_ of
       GLSLANG_STAGE_VERTEX        : Result := VK_SHADER_STAGE_VERTEX_BIT                 ;
       GLSLANG_STAGE_TESSCONTROL   : Result := VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT   ;
       GLSLANG_STAGE_TESSEVALUATION: Result := VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT;
       GLSLANG_STAGE_GEOMETRY      : Result := VK_SHADER_STAGE_GEOMETRY_BIT               ;
       GLSLANG_STAGE_FRAGMENT      : Result := VK_SHADER_STAGE_FRAGMENT_BIT               ;
       GLSLANG_STAGE_COMPUTE       : Result := VK_SHADER_STAGE_COMPUTE_BIT                ;
     else                            Result := VK_SHADER_STAGE_ALL                       ;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStager<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkStager<TVkSystem_,TVkDevice_,TVkContex_>.GetShader :TVkShader_;
begin
     Result := _Shader;
end;

procedure TVkStager<TVkSystem_,TVkDevice_,TVkContex_>.SetShader( const Shader_:TVkShader_ );
begin
     _Shader := Shader_;

     if Assigned( Raster ) then Raster.FreeHandle;
end;

function TVkStager<TVkSystem_,TVkDevice_,TVkContex_>.GetEntry :String;
begin
     Result := _Entry;
end;

procedure TVkStager<TVkSystem_,TVkDevice_,TVkContex_>.SetEntry( const Entry_:String );
begin
     _Entry := Entry_;

     if Assigned( Raster ) then Raster.FreeHandle;
end;

//------------------------------------------------------------------------------

function TVkStager<TVkSystem_,TVkDevice_,TVkContex_>.GetFlags :T_VkShaderStageFlagBits;
begin
     if Assigned( _Shader ) then Result := VkStageOfGlslang( _Shader.Stage )
                            else Result := VK_SHADER_STAGE_ALL;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkStager<TVkSystem_,TVkDevice_,TVkContex_>.Create;
begin
     inherited;

     _Shader := nil;
     _Entry  := 'main';
end;

constructor TVkStager<TVkSystem_,TVkDevice_,TVkContex_>.Create( const Stagers_:TVkStagers_; const Shader_:TVkShader_; const Entry_:String );
begin
     inherited Create( Stagers_ );

     _Shader := Shader_;
     _Entry  := Entry_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStagers<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

////////////////////////////////////////////////////////////////////// E V E N T

procedure TVkStagers<TVkSystem_,TVkDevice_,TVkContex_>.OnInsertChildr( const Childr_:TVkStager_ );
begin
     inherited;

     if Assigned( Raster ) then Raster.FreeHandle;  // 段の増減はパイプラインを作り直す
end;

procedure TVkStagers<TVkSystem_,TVkDevice_,TVkContex_>.OnRemoveChildr( const Childr_:TVkStager_ );
begin
     inherited;

     if Assigned( Raster ) then Raster.FreeHandle;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkStagers<TVkSystem_,TVkDevice_,TVkContex_>.Add( const Shader_:TVkShader_; const Entry_:String ) :TVkStager_;
begin
     Result := TVkStager_.Create( Self, Shader_, Entry_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetHandle :T_VkPipeline;
begin
     if _Handle = Default( T_VkPipeline ) then CheckVk( CreateHandle, 'TVkRaster.CreateHandle is Error!' );

     Result := _Handle;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetLayout :T_VkPipelineLayout;
begin
     if _Layout = Default( T_VkPipelineLayout ) then CheckVk( CreateLayout, 'TVkRaster.CreateLayout is Error!' );

     Result := _Layout;
end;

//------------------------------------------------------------------------------

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetPasser :TVkPasser_;
begin
     Result := _Passer;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetPasser( const Passer_:TVkPasser_ );
begin
     if Passer_ = _Passer then Exit;

     _Passer := Passer_;  FreeHandle;
end;

//------------------------------------------------------------------------------

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetBindins :TArray<T_VkVertexInputBindingDescription>;
begin
     Result := _Bindins;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetBindins( const Bindins_:TArray<T_VkVertexInputBindingDescription> );
begin
     _Bindins := Bindins_;  FreeHandle;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetAttribs :TArray<T_VkVertexInputAttributeDescription>;
begin
     Result := _Attribs;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetAttribs( const Attribs_:TArray<T_VkVertexInputAttributeDescription> );
begin
     _Attribs := Attribs_;  FreeHandle;
end;

//------------------------------------------------------------------------------

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetSetLays :TArray<T_VkDescriptorSetLayout>;
begin
     Result := _SetLays;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetSetLays( const SetLays_:TArray<T_VkDescriptorSetLayout> );
begin
     _SetLays := SetLays_;  FreeHandle;  DestroLayout;
end;

//------------------------------------------------------------------------------

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetPushSize :Integer;
begin
     Result := _PushSize;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetPushSize( const PushSize_:Integer );
begin
     if PushSize_ = _PushSize then Exit;

     _PushSize := PushSize_;  FreeHandle;  DestroLayout;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetPushFlags :T_VkShaderStageFlags;
begin
     Result := _PushFlags;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetPushFlags( const PushFlags_:T_VkShaderStageFlags );
begin
     if PushFlags_ = _PushFlags then Exit;

     _PushFlags := PushFlags_;  FreeHandle;  DestroLayout;
end;

//------------------------------------------------------------------------------

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetTopology :T_VkPrimitiveTopology;
begin
     Result := _Topology;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetTopology( const Topology_:T_VkPrimitiveTopology );
begin
     if Topology_ = _Topology then Exit;

     _Topology := Topology_;  FreeHandle;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetPolyMode :T_VkPolygonMode;
begin
     Result := _PolyMode;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetPolyMode( const PolyMode_:T_VkPolygonMode );
begin
     if PolyMode_ = _PolyMode then Exit;

     _PolyMode := PolyMode_;  FreeHandle;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetCullMode :T_VkCullModeFlags;
begin
     Result := _CullMode;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetCullMode( const CullMode_:T_VkCullModeFlags );
begin
     if CullMode_ = _CullMode then Exit;

     _CullMode := CullMode_;  FreeHandle;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetFrontFace :T_VkFrontFace;
begin
     Result := _FrontFace;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetFrontFace( const FrontFace_:T_VkFrontFace );
begin
     if FrontFace_ = _FrontFace then Exit;

     _FrontFace := FrontFace_;  FreeHandle;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetLineWidth :Single;
begin
     Result := _LineWidth;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetLineWidth( const LineWidth_:Single );
begin
     if LineWidth_ = _LineWidth then Exit;

     _LineWidth := LineWidth_;  FreeHandle;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetDepthTest :Boolean;
begin
     Result := _DepthTest;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetDepthTest( const DepthTest_:Boolean );
begin
     if DepthTest_ = _DepthTest then Exit;

     _DepthTest := DepthTest_;  FreeHandle;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetDepthWrit :Boolean;
begin
     Result := _DepthWrit;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetDepthWrit( const DepthWrit_:Boolean );
begin
     if DepthWrit_ = _DepthWrit then Exit;

     _DepthWrit := DepthWrit_;  FreeHandle;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetDepthOper :T_VkCompareOp;
begin
     Result := _DepthOper;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetDepthOper( const DepthOper_:T_VkCompareOp );
begin
     if DepthOper_ = _DepthOper then Exit;

     _DepthOper := DepthOper_;  FreeHandle;
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetBlendOK :Boolean;
begin
     Result := _BlendOK;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.SetBlendOK( const BlendOK_:Boolean );
begin
     if BlendOK_ = _BlendOK then Exit;

     _BlendOK := BlendOK_;  FreeHandle;
end;

//------------------------------------------------------------------------------

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetBuildOK :Boolean;
var
   S :TVkStager_;
   N :Integer;
begin
     N := 0;

     for S in _Stagers do
     begin
          if not Assigned( S.Shader ) then Exit( False );

          if S.Shader.Handle = Default( T_VkShaderModule ) then Exit( False );  // 実行時コンパイルの失敗

          Inc( N );
     end;

     Result := N > 0;  // 段がひとつも無ければ未完成
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.GetBuildLog :String;
var
   S :TVkStager_;
   L :String;
begin
     Result := '';

     for S in _Stagers do
     begin
          if not Assigned( S.Shader ) then Continue;

          L := S.Shader.CompileLog;

          if L <> '' then Result := Result + '▼ ' + S.Shader.Name + sLineBreak + L + sLineBreak;
     end;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.CreateLayout :T_VkResult;
var
   R :T_VkPushConstantRange;
   I :T_VkPipelineLayoutCreateInfo;
begin
     FillChar( R, SizeOf( R ), 0 );
     with R do
     begin
          stageFlags := _PushFlags;
          offset     := 0;
          size       := _PushSize;
     end;

     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType          := VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO;
          setLayoutCount := Length( _SetLays );

          if Length( _SetLays ) > 0 then pSetLayouts := @_SetLays[ 0 ];

          if _PushSize > 0 then
          begin
               pushConstantRangeCount := 1;
               pPushConstantRanges    := @R;
          end;
     end;

     Result := vkCreatePipelineLayout( DeviceHandle, @I, nil, @_Layout );
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.DestroLayout :T_VkResult;
begin
     if _Layout <> Default( T_VkPipelineLayout ) then
     begin
          vkDestroyPipelineLayout( DeviceHandle, _Layout, nil );

          _Layout := Default( T_VkPipelineLayout );
     end;

     Result := VK_SUCCESS;
end;

//------------------------------------------------------------------------------

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.CreateHandle :T_VkResult;
var
   Ss :TArray<T_VkPipelineShaderStageCreateInfo>;
   Ns :TArray<AnsiString>;
   Ds :array [ 0..1 ] of T_VkDynamicState;
   S :TVkStager_;
   N :Integer;
   VI :T_VkPipelineVertexInputStateCreateInfo;
   AI :T_VkPipelineInputAssemblyStateCreateInfo;
   WI :T_VkPipelineViewportStateCreateInfo;
   RI :T_VkPipelineRasterizationStateCreateInfo;
   MI :T_VkPipelineMultisampleStateCreateInfo;
   DI :T_VkPipelineDepthStencilStateCreateInfo;
   BA :T_VkPipelineColorBlendAttachmentState;
   BI :T_VkPipelineColorBlendStateCreateInfo;
   YI :T_VkPipelineDynamicStateCreateInfo;
   PI :T_VkGraphicsPipelineCreateInfo;
begin
     if not Assigned( _Passer ) then Exit( VK_ERROR_INITIALIZATION_FAILED );  // 描画パスが未設定

     ////////// SHADER STAGES

     N := 0;  for S in _Stagers do Inc( N );

     if N = 0 then Exit( VK_ERROR_INITIALIZATION_FAILED );  // 段がひとつも無い

     SetLength( Ss, N );
     SetLength( Ns, N );  // pName の指す先を、呼び出しが終わるまで生存させる

     N := 0;
     for S in _Stagers do
     begin
          if not Assigned( S.Shader ) then Exit( VK_ERROR_INITIALIZATION_FAILED );

          if S.Shader.Handle = Default( T_VkShaderModule ) then Exit( VK_ERROR_UNKNOWN );  // コンパイル失敗（BuildLog を参照）

          Ns[ N ] := AnsiString( S.Entry );

          FillChar( Ss[ N ], SizeOf( Ss[ N ] ), 0 );
          with Ss[ N ] do
          begin
               sType  := VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
               stage  := S.Flags;
               module := S.Shader.Handle;
               pName  := P_char( Ns[ N ] );
          end;

          Inc( N );
     end;

     ////////// VERTEX INPUT

     FillChar( VI, SizeOf( VI ), 0 );
     with VI do
     begin
          sType                         := VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO;
          vertexBindingDescriptionCount := Length( _Bindins );
          vertexAttributeDescriptionCount := Length( _Attribs );

          if Length( _Bindins ) > 0 then pVertexBindingDescriptions   := @_Bindins[ 0 ];
          if Length( _Attribs ) > 0 then pVertexAttributeDescriptions := @_Attribs[ 0 ];
     end;

     ////////// INPUT ASSEMBLY

     FillChar( AI, SizeOf( AI ), 0 );
     with AI do
     begin
          sType    := VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO;
          topology := _Topology;
     end;

     ////////// VIEWPORT（実体は動的状態で与える）

     FillChar( WI, SizeOf( WI ), 0 );
     with WI do
     begin
          sType         := VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO;
          viewportCount := 1;
          scissorCount  := 1;
     end;

     ////////// RASTERIZATION

     FillChar( RI, SizeOf( RI ), 0 );
     with RI do
     begin
          sType       := VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO;
          polygonMode := _PolyMode;
          cullMode    := _CullMode;
          frontFace   := _FrontFace;
          lineWidth   := _LineWidth;
     end;

     ////////// MULTISAMPLE

     FillChar( MI, SizeOf( MI ), 0 );
     with MI do
     begin
          sType                := VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO;
          rasterizationSamples := VK_SAMPLE_COUNT_1_BIT;
          minSampleShading     := 1;
     end;

     ////////// DEPTH STENCIL

     FillChar( DI, SizeOf( DI ), 0 );
     with DI do
     begin
          sType            := VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO;
          depthTestEnable  := T_VkBool32( Ord( _DepthTest and _Passer.DepthOK ) );
          depthWriteEnable := T_VkBool32( Ord( _DepthWrit and _Passer.DepthOK ) );
          depthCompareOp   := _DepthOper;
          maxDepthBounds   := 1;
     end;

     ////////// COLOR BLEND

     FillChar( BA, SizeOf( BA ), 0 );
     with BA do
     begin
          blendEnable         := T_VkBool32( Ord( _BlendOK ) );
          srcColorBlendFactor := VK_BLEND_FACTOR_SRC_ALPHA;
          dstColorBlendFactor := VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA;
          colorBlendOp        := VK_BLEND_OP_ADD;
          srcAlphaBlendFactor := VK_BLEND_FACTOR_ONE;
          dstAlphaBlendFactor := VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA;
          alphaBlendOp        := VK_BLEND_OP_ADD;
          colorWriteMask      := VK_COLOR_COMPONENT_R_BIT or VK_COLOR_COMPONENT_G_BIT
                              or VK_COLOR_COMPONENT_B_BIT or VK_COLOR_COMPONENT_A_BIT;
     end;

     FillChar( BI, SizeOf( BI ), 0 );
     with BI do
     begin
          sType           := VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO;
          attachmentCount := 1;
          pAttachments    := @BA;
     end;

     ////////// DYNAMIC STATE

     Ds[ 0 ] := VK_DYNAMIC_STATE_VIEWPORT;
     Ds[ 1 ] := VK_DYNAMIC_STATE_SCISSOR;

     FillChar( YI, SizeOf( YI ), 0 );
     with YI do
     begin
          sType             := VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO;
          dynamicStateCount := Length( Ds );
          pDynamicStates    := @Ds[ 0 ];
     end;

     ////////// GRAPHICS PIPELINE

     FillChar( PI, SizeOf( PI ), 0 );
     with PI do
     begin
          sType               := VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO;
          stageCount          := Length( Ss );
          pStages             := @Ss[ 0 ];
          pVertexInputState   := @VI;
          pInputAssemblyState := @AI;
          pViewportState      := @WI;
          pRasterizationState := @RI;
          pMultisampleState   := @MI;
          pColorBlendState    := @BI;
          pDynamicState       := @YI;
          layout              := GetLayout;
          renderPass          := _Passer.Handle;
          subpass             := 0;

          if _Passer.DepthOK then pDepthStencilState := @DI;
     end;

     Result := vkCreateGraphicsPipelines( DeviceHandle, Default( T_VkPipelineCache ), 1, @PI, nil, @_Handle );
end;

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.DestroHandle :T_VkResult;
begin
     vkDestroyPipeline( DeviceHandle, _Handle, nil );

     _Handle := Default( T_VkPipeline );

     Result := VK_SUCCESS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.Create;
begin
     inherited;

     _Handle := Default( T_VkPipeline );
     _Layout := Default( T_VkPipelineLayout );
     _Passer := nil;

     _Stagers := TVkStagers_.Create( Self );

     _Bindins := nil;
     _Attribs := nil;
     _SetLays := nil;

     _PushSize  := 0;
     _PushFlags := VK_SHADER_STAGE_VERTEX_BIT or VK_SHADER_STAGE_FRAGMENT_BIT;

     _Topology  := VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;
     _PolyMode  := VK_POLYGON_MODE_FILL;
     _CullMode  := VK_CULL_MODE_BACK_BIT;
     _FrontFace := VK_FRONT_FACE_COUNTER_CLOCKWISE;
     _LineWidth := 1;

     _DepthTest := True;
     _DepthWrit := True;
     _DepthOper := VK_COMPARE_OP_LESS_OR_EQUAL;

     _BlendOK := False;
end;

constructor TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.Create( const Contex_:TVkContex_ );
begin
     inherited Create( TVkContex<TVkSystem_,TVkDevice_>( Contex_ ).Rasters );
end;

destructor TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.Destroy;
begin
     _Stagers.Free;

     FreeHandle;
     DestroLayout;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.DeviceHandle :T_VkDevice;
begin
     Result := TVkContex<TVkSystem_,TVkDevice_>( Contex ).Handle;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.FreeHandle;
begin
     if _Handle <> Default( T_VkPipeline ) then DestroHandle;
end;

//------------------------------------------------------------------------------

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.AddBindin( const Binding_,Stride_:T_uint32_t; const Rate_:T_VkVertexInputRate );
var
   B :T_VkVertexInputBindingDescription;
begin
     B.binding   := Binding_;
     B.stride    := Stride_;
     B.inputRate := Rate_;

     _Bindins := _Bindins + [ B ];  FreeHandle;
end;

procedure TVkRaster<TVkSystem_,TVkDevice_,TVkContex_>.AddAttrib( const Location_,Binding_:T_uint32_t; const Format_:T_VkFormat; const Offset_:T_uint32_t );
var
   A :T_VkVertexInputAttributeDescription;
begin
     A.location := Location_;
     A.binding  := Binding_;
     A.format   := Format_;
     A.offset   := Offset_;

     _Attribs := _Attribs + [ A ];  FreeHandle;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkRasters<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
