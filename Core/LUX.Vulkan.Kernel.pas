unit LUX.Vulkan.Kernel;

interface //#################################################################### ■

uses System.Generics.Collections,
     vk_platform, vulkan_core, vulkan_functions,
     LUX.Data.List,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan.Queuer,
     LUX.Vulkan.Argume;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkKernels     <TVkSystem_,TVkDevice_,TVkContex_,TVkShader_:class> = class;
       TVkKernel    <TVkSystem_,TVkDevice_,TVkContex_,TVkShader_:class> = class;
         TVkParames <TVkSystem_,TVkDevice_,TVkContex_,TVkShader_:class> = class;
           TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TLoop3D

     TLoop3D = record
       X, Y, Z :T_uint32_t;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>

     TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_:class> = class( TListChildr<TVkKernel <TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>,
                                                                                       TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>> )
     private
       type TVkArgume_  = TVkArgume <TVkSystem_,TVkDevice_,TVkContex_>;
            TVkKernel_  = TVkKernel <TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>;
            TVkParames_ = TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>;
     protected
       _Name      :String;
       _BindingI  :Integer;
       _DescriTyp :T_VkDescriptorType;
       _Argume    :TVkArgume_;
       ///// A C C E S S O R
       function GetName :String; virtual;
       procedure SetName( const Name_:String ); virtual;
       function GetBindingI :Integer; virtual;
       function GetDescriTyp :T_VkDescriptorType; virtual;
       function GetArgume :TVkArgume_; virtual;
       procedure SetArgume( const Argume_:TVkArgume_ ); virtual;
     public
       constructor Create; override;
       constructor Create( const Parames_:TVkParames_; const Name_:String ); overload; virtual;
       constructor Create( const Parames_:TVkParames_; const Name_:String; const Argume_:TVkArgume_ ); overload; virtual;
       ///// P R O P E R T Y
       property Kernel    :TVkKernel_          read GetOwnere                 ;
       property Parames   :TVkParames_         read GetParent                 ;
       property Name      :String              read GetName      write SetName  ;
       property BindingI  :Integer             read GetBindingI               ;
       property DescriTyp :T_VkDescriptorType  read GetDescriTyp              ;
       property Argume    :TVkArgume_          read GetArgume    write SetArgume;
       ///// M E T H O D
       function Bind :T_VkResult;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>

     TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_:class> = class( TListParent<TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>,
                                                                                        TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>> )
     private
       type TVkArgume_  = TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkKernel_  = TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>;
            TVkParame_  = TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>;
            TVkNamPars_ = TDictionary<String,TVkParame_>;
     protected
       _NamPars :TVkNamPars_;
       _FindsOK :Boolean;
       _BindsOK :Boolean;
       ///// A C C E S S O R
       function GetChildr( const Name_:String ) :TVkParame_; overload; virtual;
       procedure SetChildr( const Name_:String; const Childr_:TVkParame_ ); overload; virtual;
       function GetArgumes( const Name_:String ) :TVkArgume_; virtual;
       procedure SetArgumes( const Name_:String; const Argume_:TVkArgume_ ); virtual;
       function GetFindsOK :Boolean; virtual;
       procedure SetFindsOK( const FindsOK_:Boolean ); virtual;
       function GetBindsOK :Boolean; virtual;
       procedure SetBindsOK( const BindsOK_:Boolean ); virtual;
       ///// イベント
       procedure OnInsertChildr( const Childr_:TVkParame_ ); override;
       procedure OnRemoveChildr( const Childr_:TVkParame_ ); override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Kernel                        :TVkKernel_ read GetOwnere                  ;
       property Childrs[ const Name_:String ] :TVkParame_ read GetChildr  write SetChildr ;
       property Items  [ const Name_:String ] :TVkParame_ read GetChildr  write SetChildr ;
       property Argumes[ const Name_:String ] :TVkArgume_ read GetArgumes write SetArgumes; default;
       property FindsOK                       :Boolean    read GetFindsOK write SetFindsOK;
       property BindsOK                       :Boolean    read GetBindsOK write SetBindsOK;
       ///// M E T H O D
       function Contains( const Name_:String ) :Boolean;
       function Add( const Name_:String ) :TVkParame_; overload;
       function Add( const Name_:String; const Argume_:TVkArgume_ ) :TVkParame_; overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>

     // 演算パイプライン。記述子セット・パイプラインレイアウトを内包する。
     TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_:class> = class( TListChildr<TVkShader_,TVkKernels<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>> )
     private
       type TVkQueuer_  = TVkQueuer <TVkSystem_,TVkDevice_,TVkContex_>;
            TVkKernels_ = TVkKernels<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>;
            TVkParames_ = TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>;
     protected
       _Handle   :T_VkPipeline;
       _Name     :String;
       _Queuer   :TVkQueuer_;
       _Parames  :TVkParames_;
       _GloMin   :TLoop3D;
       _GloSiz   :TLoop3D;
       _DescLay  :T_VkDescriptorSetLayout;
       _PipLay   :T_VkPipelineLayout;
       _DescPoo  :T_VkDescriptorPool;
       _DescSet  :T_VkDescriptorSet;
       ///// A C C E S S O R
       function GetHandle :T_VkPipeline; virtual;
       procedure SetHandle( const Handle_:T_VkPipeline ); virtual;
       function GetName :String; virtual;
       procedure SetName( const Name_:String ); virtual;
       function GetGloMinX :Integer; virtual;
       procedure SetGloMinX( const GloMinX_:Integer ); virtual;
       function GetGloMinY :Integer; virtual;
       procedure SetGloMinY( const GloMinY_:Integer ); virtual;
       function GetGloMinZ :Integer; virtual;
       procedure SetGloMinZ( const GloMinZ_:Integer ); virtual;
       function GetGloSizX :Integer; virtual;
       procedure SetGloSizX( const GloSizX_:Integer ); virtual;
       function GetGloSizY :Integer; virtual;
       procedure SetGloSizY( const GloSizY_:Integer ); virtual;
       function GetGloSizZ :Integer; virtual;
       procedure SetGloSizZ( const GloSizZ_:Integer ); virtual;
       function GetGloMaxX :Integer; virtual;
       procedure SetGloMaxX( const GloMaxX_:Integer ); virtual;
       function GetGloMaxY :Integer; virtual;
       procedure SetGloMaxY( const GloMaxY_:Integer ); virtual;
       function GetGloMaxZ :Integer; virtual;
       procedure SetGloMaxZ( const GloMaxZ_:Integer ); virtual;
       function GetGloDimN :Integer; virtual;
       ///// M E T H O D
       function DeviceHandle :T_VkDevice;
       function CreateHandle :T_VkResult; virtual;
       function DestroHandle :T_VkResult; virtual;
     public
       constructor Create; override;
       constructor Create( const Shader_:TVkShader_ ); overload; virtual;
       constructor Create( const Shader_:TVkShader_; const Name_:String ); overload; virtual;
       constructor Create( const Shader_:TVkShader_; const Queuer_:TVkQueuer_ ); overload; virtual;
       constructor Create( const Shader_:TVkShader_; const Name_:String; const Queuer_:TVkQueuer_ ); overload; virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Shader  :TVkShader_        read GetOwnere                  ;
       property Kernels :TVkKernels_       read GetParent                  ;
       property Handle  :T_VkPipeline      read GetHandle  write SetHandle ;
       property Name    :String            read GetName    write SetName   ;
       property Queuer  :TVkQueuer_        read   _Queuer                  ;
       property Parames :TVkParames_       read   _Parames                 ;
       property DescSet :T_VkDescriptorSet read   _DescSet                 ;
       property GloMinX :Integer           read GetGloMinX write SetGloMinX;
       property GloMinY :Integer           read GetGloMinY write SetGloMinY;
       property GloMinZ :Integer           read GetGloMinZ write SetGloMinZ;
       property GloSizX :Integer           read GetGloSizX write SetGloSizX;
       property GloSizY :Integer           read GetGloSizY write SetGloSizY;
       property GloSizZ :Integer           read GetGloSizZ write SetGloSizZ;
       property GloMaxX :Integer           read GetGloMaxX write SetGloMaxX;
       property GloMaxY :Integer           read GetGloMaxY write SetGloMaxY;
       property GloMaxZ :Integer           read GetGloMaxZ write SetGloMaxZ;
       property GloDimN :Integer           read GetGloDimN                 ;
       ///// M E T H O D
       procedure FreeHandle;
       procedure Run;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkKernels<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>

     TVkKernels<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_:class> = class( TListParent<TVkShader_,TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>> )
     private
       type TVkQueuer_ = TVkQueuer<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkKernel_ = TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>;
     protected
     public
       ///// P R O P E R T Y
       property Shader :TVkShader_ read GetOwnere;
       ///// M E T H O D
       function Add( const Name_:String ) :TVkKernel_; overload;
       function Add( const Name_:String; const Queuer_:TVkQueuer_ ) :TVkKernel_; overload;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

uses System.SysUtils,
     LUX.Vulkan.Contex,
     LUX.Vulkan.Shader;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetName :String;
begin
     Result := _Name;
end;

procedure TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetName( const Name_:String );
begin
     _Name := Name_;

     Parames.FindsOK := False;
end;

//------------------------------------------------------------------------------

function TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetBindingI :Integer;
begin
     Parames.FindsOK;

     Result := _BindingI;
end;

function TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetDescriTyp :T_VkDescriptorType;
begin
     Parames.FindsOK;

     Result := _DescriTyp;
end;

//------------------------------------------------------------------------------

function TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetArgume :TVkArgume_;
begin
     Result := _Argume;
end;

procedure TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetArgume( const Argume_:TVkArgume_ );
begin
     _Argume := Argume_;

     if Assigned( Parames ) then Parames.BindsOK := False;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Create;
begin
     inherited;

     _Name      := '';
     _BindingI  := -1;
     _DescriTyp := VK_DESCRIPTOR_TYPE_MAX_ENUM;
     _Argume    := nil;
end;

constructor TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Create( const Parames_:TVkParames_; const Name_:String );
begin
     inherited Create( Parames_ );

     _Name := Name_;
end;

constructor TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Create( const Parames_:TVkParames_; const Name_:String; const Argume_:TVkArgume_ );
begin
     Create( Parames_, Name_ );

     _Argume := Argume_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Bind :T_VkResult;
var
   W :T_VkWriteDescriptorSet;
   BI :T_VkDescriptorBufferInfo;
   II :T_VkDescriptorImageInfo;
begin
     Kernel.Handle;  // パイプラインと記述子セットの生成を保証する

     FillChar( W, SizeOf( W ), 0 );
     with W do
     begin
          sType           := VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
          dstSet          := Kernel.DescSet;
          dstBinding      := BindingI;
          dstArrayElement := 0;
          descriptorCount := 1;
          descriptorType  := DescriTyp;
     end;

     FillChar( BI, SizeOf( BI ), 0 );
     FillChar( II, SizeOf( II ), 0 );

     case DescriTyp of
       VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
       VK_DESCRIPTOR_TYPE_STORAGE_BUFFER:
         begin
              BI.buffer := Argume.BuffeH;
              BI.offset := 0;
              BI.range  := VK_WHOLE_SIZE;

              W.pBufferInfo := @BI;
         end;

       VK_DESCRIPTOR_TYPE_SAMPLER:
         begin
              II.sampler := Argume.SamplH;

              W.pImageInfo := @II;
         end;

       VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER:
         begin
              II.sampler     := Argume.SamplH;
              II.imageView   := Argume.ViewrH;
              II.imageLayout := VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;

              W.pImageInfo := @II;
         end;

       VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE:
         begin
              II.imageView   := Argume.ViewrH;
              II.imageLayout := VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;

              W.pImageInfo := @II;
         end;

       VK_DESCRIPTOR_TYPE_STORAGE_IMAGE:
         begin
              II.imageView   := Argume.ViewrH;
              II.imageLayout := VK_IMAGE_LAYOUT_GENERAL;

              W.pImageInfo := @II;
         end;
     else
         Exit( VK_ERROR_UNKNOWN );
     end;

     vkUpdateDescriptorSets( Kernel.DeviceHandle, 1, @W, 0, nil );

     Result := VK_SUCCESS;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetChildr( const Name_:String ) :TVkParame_;
begin
     if Contains( Name_ ) then Result := _NamPars[ Name_ ]
                          else Result := Add( Name_ );
end;

procedure TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetChildr( const Name_:String; const Childr_:TVkParame_ );
begin
     Childr_.Name   := Name_;
     Childr_.Parent := Self;
end;

//------------------------------------------------------------------------------

function TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetArgumes( const Name_:String ) :TVkArgume_;
begin
     Result := _NamPars[ Name_ ].Argume;
end;

procedure TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetArgumes( const Name_:String; const Argume_:TVkArgume_ );
begin
     Childrs[ Name_ ].Argume := Argume_;
end;

//------------------------------------------------------------------------------

function TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetFindsOK :Boolean;
var
   B :TVkBinding;
begin
     if not _FindsOK then
     begin
          _FindsOK := True;

          for B in TVkShader<TVkSystem_,TVkDevice_,TVkContex_>( Kernel.Shader ).Bindins do
          begin
               if Contains( B.Name ) then
               begin
                    with Items[ B.Name ] do
                    begin
                         _BindingI  := B.Binding;
                         _DescriTyp := B.DescriTyp;
                    end;
               end
               else
               begin
                    _FindsOK := False;  Break;
               end;
          end;
     end;

     Result := _FindsOK;
end;

procedure TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetFindsOK( const FindsOK_:Boolean );
begin
     _FindsOK := FindsOK_;
     _BindsOK := False;
end;

//------------------------------------------------------------------------------

function TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetBindsOK :Boolean;
var
   A :TVkParame_;
begin
     if FindsOK and not _BindsOK then
     begin
          _BindsOK := True;

          for A in Self do
          begin
               if A.Bind <> VK_SUCCESS then
               begin
                    _BindsOK := False;  Break;
               end;
          end;
     end;

     Result := _BindsOK;
end;

procedure TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetBindsOK( const BindsOK_:Boolean );
begin
     _BindsOK := BindsOK_;
end;

/////////////////////////////////////////////////////////////////////// イベント

procedure TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.OnInsertChildr( const Childr_:TVkParame_ );
begin
     inherited;

     if _NamPars.ContainsKey( Childr_.Name ) then _NamPars[ Childr_.Name ].Free;

     _NamPars.Add( Childr_.Name, Childr_ );
end;

procedure TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.OnRemoveChildr( const Childr_:TVkParame_ );
begin
     inherited;

     _NamPars.Remove( Childr_.Name );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Create;
begin
     inherited;

     _NamPars := TVkNamPars_.Create;

     _FindsOK := False;
     _BindsOK := False;
end;

destructor TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Destroy;
begin
     Clear;

     _NamPars.Free;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Contains( const Name_:String ) :Boolean;
begin
     Result := _NamPars.ContainsKey( Name_ );
end;

//------------------------------------------------------------------------------

function TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Add( const Name_:String ) :TVkParame_;
begin
     Result := TVkParame_.Create( Self, Name_ );
end;

function TVkParames<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Add( const Name_:String; const Argume_:TVkArgume_ ) :TVkParame_;
begin
     Result := TVkParame_.Create( Self, Name_, Argume_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetHandle :T_VkPipeline;
begin
     if _Handle = Default( T_VkPipeline ) then CheckVk( CreateHandle, 'TVkKernel.CreateHandle is Error!' );

     Result := _Handle;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetHandle( const Handle_:T_VkPipeline );
begin
     if _Handle <> Default( T_VkPipeline ) then CheckVk( DestroHandle, 'TVkKernel.DestroHandle is Error!' );

     _Handle := Handle_;
end;

//------------------------------------------------------------------------------

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetName :String;
begin
     Result := _Name;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetName( const Name_:String );
begin
     _Name := Name_;

     Handle := Default( T_VkPipeline );
end;

//------------------------------------------------------------------------------

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetGloMinX :Integer;
begin
     Result := _GloMin.X;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetGloMinX( const GloMinX_:Integer );
begin
     _GloMin.X := GloMinX_;
end;

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetGloMinY :Integer;
begin
     Result := _GloMin.Y;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetGloMinY( const GloMinY_:Integer );
begin
     _GloMin.Y := GloMinY_;
end;

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetGloMinZ :Integer;
begin
     Result := _GloMin.Z;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetGloMinZ( const GloMinZ_:Integer );
begin
     _GloMin.Z := GloMinZ_;
end;

//------------------------------------------------------------------------------

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetGloSizX :Integer;
begin
     Result := _GloSiz.X;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetGloSizX( const GloSizX_:Integer );
begin
     _GloSiz.X := GloSizX_;
end;

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetGloSizY :Integer;
begin
     Result := _GloSiz.Y;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetGloSizY( const GloSizY_:Integer );
begin
     _GloSiz.Y := GloSizY_;
end;

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetGloSizZ :Integer;
begin
     Result := _GloSiz.Z;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetGloSizZ( const GloSizZ_:Integer );
begin
     _GloSiz.Z := GloSizZ_;
end;

//------------------------------------------------------------------------------

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetGloMaxX :Integer;
begin
     Result := GloMinX + GloSizX - 1;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetGloMaxX( const GloMaxX_:Integer );
begin
     GloSizX := GloMaxX_ - GloMinX + 1;
end;

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetGloMaxY :Integer;
begin
     Result := GloMinY + GloSizY - 1;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetGloMaxY( const GloMaxY_:Integer );
begin
     GloSizY := GloMaxY_ - GloMinY + 1;
end;

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetGloMaxZ :Integer;
begin
     Result := GloMinZ + GloSizZ - 1;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.SetGloMaxZ( const GloMaxZ_:Integer );
begin
     GloSizZ := GloMaxZ_ - GloMinZ + 1;
end;

//------------------------------------------------------------------------------

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.GetGloDimN :Integer;
begin
     if ( GloMinZ > 0 ) or ( GloSizZ > 1 ) then Result := 3
                                           else
     if ( GloMinY > 0 ) or ( GloSizY > 1 ) then Result := 2
                                           else Result := 1;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.DeviceHandle :T_VkDevice;
begin
     Result := TVkContex<TVkSystem_,TVkDevice_>( TVkShader<TVkSystem_,TVkDevice_,TVkContex_>( Shader ).Contex ).Handle;
end;

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.CreateHandle :T_VkResult;
var
   Bs :TArray<TVkBinding>;
   Ls :TArray<T_VkDescriptorSetLayoutBinding>;
   Ps :TArray<T_VkDescriptorPoolSize>;
   LI :T_VkDescriptorSetLayoutCreateInfo;
   YI :T_VkPipelineLayoutCreateInfo;
   OI :T_VkDescriptorPoolCreateInfo;
   AI :T_VkDescriptorSetAllocateInfo;
   PI :T_VkComputePipelineCreateInfo;
   AN :AnsiString;
   I :Integer;
   D :T_VkDevice;
begin
     D := DeviceHandle;

     Bs := TVkShader<TVkSystem_,TVkDevice_,TVkContex_>( Shader ).Bindins;

     ////////// DESCRIPTOR SET LAYOUT

     SetLength( Ls, Length( Bs ) );
     SetLength( Ps, Length( Bs ) );
     for I := 0 to High( Bs ) do
     begin
          FillChar( Ls[ I ], SizeOf( Ls[ I ] ), 0 );
          with Ls[ I ] do
          begin
               binding         := Bs[ I ].Binding;
               descriptorType  := Bs[ I ].DescriTyp;
               descriptorCount := 1;
               stageFlags      := VK_SHADER_STAGE_COMPUTE_BIT;
          end;

          with Ps[ I ] do
          begin
               &type           := Bs[ I ].DescriTyp;
               descriptorCount := 1;
          end;
     end;

     FillChar( LI, SizeOf( LI ), 0 );
     with LI do
     begin
          sType        := VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO;
          bindingCount := Length( Ls );
          pBindings    := @Ls[ 0 ];
     end;

     Result := vkCreateDescriptorSetLayout( D, @LI, nil, @_DescLay );

     if Result <> VK_SUCCESS then Exit;

     ////////// PIPELINE LAYOUT

     FillChar( YI, SizeOf( YI ), 0 );
     with YI do
     begin
          sType          := VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO;
          setLayoutCount := 1;
          pSetLayouts    := @_DescLay;
     end;

     Result := vkCreatePipelineLayout( D, @YI, nil, @_PipLay );

     if Result <> VK_SUCCESS then Exit;

     ////////// DESCRIPTOR POOL & SET

     FillChar( OI, SizeOf( OI ), 0 );
     with OI do
     begin
          sType         := VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO;
          maxSets       := 1;
          poolSizeCount := Length( Ps );
          pPoolSizes    := @Ps[ 0 ];
     end;

     Result := vkCreateDescriptorPool( D, @OI, nil, @_DescPoo );

     if Result <> VK_SUCCESS then Exit;

     FillChar( AI, SizeOf( AI ), 0 );
     with AI do
     begin
          sType              := VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO;
          descriptorPool     := _DescPoo;
          descriptorSetCount := 1;
          pSetLayouts        := @_DescLay;
     end;

     Result := vkAllocateDescriptorSets( D, @AI, @_DescSet );

     if Result <> VK_SUCCESS then Exit;

     ////////// COMPUTE PIPELINE

     AN := AnsiString( _Name );

     FillChar( PI, SizeOf( PI ), 0 );
     with PI do
     begin
          stage.sType  := VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
          stage.stage  := VK_SHADER_STAGE_COMPUTE_BIT;
          stage.module := TVkShader<TVkSystem_,TVkDevice_,TVkContex_>( Shader ).Handle;
          stage.pName  := P_char( AN );

          sType  := VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO;
          layout := _PipLay;
     end;

     Result := vkCreateComputePipelines( D, Default( T_VkPipelineCache ), 1, @PI, nil, @_Handle );
end;

function TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.DestroHandle :T_VkResult;
var
   D :T_VkDevice;
begin
     D := DeviceHandle;

     vkDestroyPipeline( D, _Handle, nil );

     _Handle := Default( T_VkPipeline );

     if _DescPoo <> Default( T_VkDescriptorPool ) then
     begin
          vkDestroyDescriptorPool( D, _DescPoo, nil );

          _DescPoo := Default( T_VkDescriptorPool );
          _DescSet := Default( T_VkDescriptorSet );
     end;

     if _PipLay <> Default( T_VkPipelineLayout ) then
     begin
          vkDestroyPipelineLayout( D, _PipLay, nil );

          _PipLay := Default( T_VkPipelineLayout );
     end;

     if _DescLay <> Default( T_VkDescriptorSetLayout ) then
     begin
          vkDestroyDescriptorSetLayout( D, _DescLay, nil );

          _DescLay := Default( T_VkDescriptorSetLayout );
     end;

     Result := VK_SUCCESS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Create;
begin
     inherited;

     _Handle  := Default( T_VkPipeline );
     _DescLay := Default( T_VkDescriptorSetLayout );
     _PipLay  := Default( T_VkPipelineLayout );
     _DescPoo := Default( T_VkDescriptorPool );
     _DescSet := Default( T_VkDescriptorSet );

     _Parames := TVkParames_.Create( Self );

     _Name   := '';
     _Queuer := nil;

     _GloMin.X := 0;  _GloMin.Y := 0;  _GloMin.Z := 0;
     _GloSiz.X := 1;  _GloSiz.Y := 1;  _GloSiz.Z := 1;
end;

constructor TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Create( const Shader_:TVkShader_ );
begin
     inherited Create( TVkShader<TVkSystem_,TVkDevice_,TVkContex_>( Shader_ ).Kernels );
end;

constructor TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Create( const Shader_:TVkShader_; const Name_:String );
begin
     Create( Shader_ );

     _Name := Name_;
end;

constructor TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Create( const Shader_:TVkShader_; const Queuer_:TVkQueuer_ );
begin
     Create( Shader_ );

     _Queuer := Queuer_;
end;

constructor TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Create( const Shader_:TVkShader_; const Name_:String; const Queuer_:TVkQueuer_ );
begin
     Create( Shader_, Name_ );

     _Queuer := Queuer_;
end;

destructor TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Destroy;
begin
     _Parames.Free;

     FreeHandle;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.FreeHandle;
begin
     if _Handle <> Default( T_VkPipeline ) then DestroHandle;
end;

procedure TVkKernel<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Run;
var
   C :T_VkCommandBuffer;
   A :TVkParame<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>;
   LX, LY, LZ :Integer;
begin
     if not Parames.BindsOK then raise EVkError.Create( VK_ERROR_UNKNOWN, 'TVkKernel.Parames.BindsOK = False' );

     Handle;  // パイプラインの生成を保証する

     C := Queuer.BeginCommand;

     for A in Parames do A.Argume.PreRun( C, A.DescriTyp );  // イメージのレイアウト遷移

     vkCmdBindPipeline( C, VK_PIPELINE_BIND_POINT_COMPUTE, Handle );

     vkCmdBindDescriptorSets( C, VK_PIPELINE_BIND_POINT_COMPUTE, _PipLay, 0, 1, @_DescSet, 0, nil );

     with TVkShader<TVkSystem_,TVkDevice_,TVkContex_>( Shader ) do
     begin
          LX := LocalX;
          LY := LocalY;
          LZ := LocalZ;
     end;

     vkCmdDispatch( C, ( GloSizX + LX-1 ) div LX,
                       ( GloSizY + LY-1 ) div LY,
                       ( GloSizZ + LZ-1 ) div LZ );

     Queuer.EndCommand( C );  // 実行完了まで待機する
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkKernels<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

function TVkKernels<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Add( const Name_:String ) :TVkKernel_;
begin
     Result := TVkKernel_.Create( Shader, Name_ );
end;

function TVkKernels<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>.Add( const Name_:String; const Queuer_:TVkQueuer_ ) :TVkKernel_;
begin
     Result := TVkKernel_.Create( Shader, Name_, Queuer_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
