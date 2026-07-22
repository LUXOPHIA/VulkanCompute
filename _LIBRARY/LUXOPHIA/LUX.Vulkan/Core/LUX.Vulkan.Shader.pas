unit LUX.Vulkan.Shader;

interface //#################################################################### ■

uses System.SysUtils, System.Classes,
     vk_platform, vulkan_core, vulkan_functions,
     LUX.Data.List,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan.Kernel;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkShaders   <TVkSystem_,TVkDevice_,TVkContex_:class> = class;
       TVkShader  <TVkSystem_,TVkDevice_,TVkContex_:class> = class;
         TVkSource<TVkSystem_,TVkDevice_,TVkContex_:class> = class;
         TVkBinary<TVkSystem_,TVkDevice_,TVkContex_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkBinding

     // SPIR-V の反射で得られる記述子情報
     TVkBinding = record
       Name      :String;
       DescSet   :Integer;
       Binding   :Integer;
       DescriTyp :T_VkDescriptorType;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkSpirTyp / TVkSpirVar

     // SPIR-V 解析の中間情報
     TVkSpirTyp = record
       Op :Integer;
       A  :Integer;  // SpirOpTypePointer:StorageClass / SpirOpTypeImage:Sampled / SpirOpTypeSampledImage:ImageT / SpirOpTypeArray:ElemT
       B  :Integer;  // SpirOpTypePointer:PointeeT
     end;

     TVkSpirVar = record
       Id  :Integer;
       Ptr :Integer;
       Sto :Integer;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkSource<TVkSystem_,TVkDevice_,TVkContex_>

     // GLSL ソースコード（表示・保管用）。実行には SPIR-V（TVkBinary）を用いる。
     TVkSource<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TStringList )
     private
       type TVkShader_ = TVkShader<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       _Shader :TVkShader_;
     public
       constructor Create; overload; virtual;
       constructor Create( const Shader_:TVkShader_ ); overload; virtual;
       ///// P R O P E R T Y
       property Shader :TVkShader_ read _Shader;
       ///// M E T H O D
       procedure LoadFromFile( const FileName_:String ); override;
       procedure LoadFromFile( const FileName_:String; Encoding_:TEncoding ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkBinary<TVkSystem_,TVkDevice_,TVkContex_>

     // SPIR-V バイナリコード
     TVkBinary<TVkSystem_,TVkDevice_,TVkContex_:class> = class
     private
       type TVkShader_ = TVkShader<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       _Shader :TVkShader_;
       _Data   :TBytes;
       ///// A C C E S S O R
       function GetData :TBytes;
       procedure SetData( const Data_:TBytes );
       function GetSize :Integer;
     public
       constructor Create; overload; virtual;
       constructor Create( const Shader_:TVkShader_ ); overload; virtual;
       ///// P R O P E R T Y
       property Shader :TVkShader_ read _Shader              ;
       property Data   :TBytes     read GetData  write SetData;
       property Size   :Integer    read GetSize              ;
       ///// M E T H O D
       procedure LoadFromFile( const FileName_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkShader<TVkSystem_,TVkDevice_,TVkContex_>

     TVkShader<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TListChildr<TVkContex_,TVkShaders<TVkSystem_,TVkDevice_,TVkContex_>> )
     private
       type TVkShaders_ = TVkShaders<TVkSystem_,TVkDevice_,TVkContex_>;
            TVkShader_  = TVkShader <TVkSystem_,TVkDevice_,TVkContex_>;
            TVkSource_  = TVkSource <TVkSystem_,TVkDevice_,TVkContex_>;
            TVkBinary_  = TVkBinary <TVkSystem_,TVkDevice_,TVkContex_>;
            TVkKernels_ = TVkKernels<TVkSystem_,TVkDevice_,TVkContex_,TVkShader_>;
       ///// M E T H O D
       procedure Reflect;
     protected
       _Handle  :T_VkShaderModule;
       _Name    :String;
       _Source  :TVkSource_;
       _Binary  :TVkBinary_;
       _Kernels :TVkKernels_;
       _Refled  :Boolean;
       _Bindins :TArray<TVkBinding>;
       _Entrys  :TArray<String>;
       _LocalX  :Integer;
       _LocalY  :Integer;
       _LocalZ  :Integer;
       ///// A C C E S S O R
       function GetHandle :T_VkShaderModule;
       procedure SetHandle( const Handle_:T_VkShaderModule );
       function GetBindins :TArray<TVkBinding>;
       function GetEntrys :TArray<String>;
       function GetLocalX :Integer;
       function GetLocalY :Integer;
       function GetLocalZ :Integer;
       ///// M E T H O D
       function CreateHandle :T_VkResult; virtual;
       function DestroHandle :T_VkResult; virtual;
     public
       constructor Create; override;
       constructor Create( const Contex_:TVkContex_ ); overload; virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Contex  :TVkContex_          read GetOwnere                 ;
       property Shaders :TVkShaders_         read GetParent                 ;
       property Handle  :T_VkShaderModule    read GetHandle  write SetHandle;
       property Name    :String              read   _Name    write   _Name  ;
       property Source  :TVkSource_          read   _Source                 ;
       property Binary  :TVkBinary_          read   _Binary                 ;
       property Kernels :TVkKernels_         read   _Kernels                ;
       property Bindins :TArray<TVkBinding>  read GetBindins                ;
       property Entrys  :TArray<String>      read GetEntrys                 ;
       property LocalX  :Integer             read GetLocalX                 ;
       property LocalY  :Integer             read GetLocalY                 ;
       property LocalZ  :Integer             read GetLocalZ                 ;
       ///// M E T H O D
       procedure FreeHandle;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkShaders<TVkSystem_,TVkDevice_,TVkContex_>

     TVkShaders<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TListParent<TVkContex_,TVkShader<TVkSystem_,TVkDevice_,TVkContex_>> )
     private
       type TVkShader_ = TVkShader<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
     public
       ///// P R O P E R T Y
       property Contex :TVkContex_ read GetOwnere;
       ///// M E T H O D
       function Add :TVkShader_; overload;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

     // SPIR-V の命令コード
     SpirOpName             =  5;
     SpirOpEntryPoint       = 15;
     SpirOpExecutionMode    = 16;
     SpirOpTypeImage        = 25;
     SpirOpTypeSampler      = 26;
     SpirOpTypeSampledImage = 27;
     SpirOpTypeArray        = 28;
     SpirOpTypeRuntimeArray = 29;
     SpirOpTypeStruct       = 30;
     SpirOpTypePointer      = 32;
     SpirOpVariable         = 59;
     SpirOpDecorate         = 71;
     SpirDecoBlock          =  2;
     SpirDecoBufferBlock    =  3;
     SpirDecoBinding        = 33;
     SpirDecoDescriptorSet  = 34;
     SpirModeLocalSize      = 17;
     SpirStoUniformConstant =  0;
     SpirStoUniform         =  2;
     SpirStoStorageBuffer   = 12;

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

function SpirWord( const Ws_:P_uint32_t; const I_:Integer ) :Integer;

function SpirText( const Ws_:P_uint32_t; const I0_:Integer ) :String;

implementation //############################################################### ■

uses System.IOUtils, System.Generics.Collections,
     LUX.Vulkan.Contex;

function SpirWord( const Ws_:P_uint32_t; const I_:Integer ) :Integer;
var
   P :P_uint32_t;
begin
     P := Ws_;  Inc( P, I_ );  Result := P^;
end;

function SpirText( const Ws_:P_uint32_t; const I0_:Integer ) :String;
var
   Bs :TBytes;
   J, K :Integer;
   W :Integer;
   C :Byte;
begin
     Bs := nil;
     J  := I0_;
     repeat
           W := SpirWord( Ws_, J );  Inc( J );

           for K := 0 to 3 do
           begin
                C := ( W shr ( 8 * K ) ) and $FF;

                if C = 0 then Break;

                Bs := Bs + [ C ];
           end;
     until C = 0;

     Result := TEncoding.UTF8.GetString( Bs );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkSource<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkSource<TVkSystem_,TVkDevice_,TVkContex_>.Create;
begin
     inherited;

end;

constructor TVkSource<TVkSystem_,TVkDevice_,TVkContex_>.Create( const Shader_:TVkShader_ );
begin
     Create;

     _Shader := Shader_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkSource<TVkSystem_,TVkDevice_,TVkContex_>.LoadFromFile( const FileName_:String );
begin
     inherited;

     Shader.Name := TPath.GetFileName( FileName_ );
end;

procedure TVkSource<TVkSystem_,TVkDevice_,TVkContex_>.LoadFromFile( const FileName_:String; Encoding_:TEncoding );
begin
     inherited;

     Shader.Name := TPath.GetFileName( FileName_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkBinary<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkBinary<TVkSystem_,TVkDevice_,TVkContex_>.GetData :TBytes;
begin
     Result := _Data;
end;

procedure TVkBinary<TVkSystem_,TVkDevice_,TVkContex_>.SetData( const Data_:TBytes );
begin
     _Data := Data_;

     _Shader.FreeHandle;

     _Shader._Refled := False;
end;

function TVkBinary<TVkSystem_,TVkDevice_,TVkContex_>.GetSize :Integer;
begin
     Result := Length( _Data );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkBinary<TVkSystem_,TVkDevice_,TVkContex_>.Create;
begin
     inherited;

     _Data := nil;
end;

constructor TVkBinary<TVkSystem_,TVkDevice_,TVkContex_>.Create( const Shader_:TVkShader_ );
begin
     Create;

     _Shader := Shader_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkBinary<TVkSystem_,TVkDevice_,TVkContex_>.LoadFromFile( const FileName_:String );
begin
     Data := TFile.ReadAllBytes( FileName_ );

     _Shader.Name := TPath.GetFileName( FileName_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkShader<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.Reflect;
var
   Ws :P_uint32_t;
   WsN, I, N, Op, K, T :Integer;
   Names :TDictionary<Integer,String>;
   Binds :TDictionary<Integer,Integer>;
   DSets :TDictionary<Integer,Integer>;
   Decos :TDictionary<Integer,Integer>;
   Types :TDictionary<Integer,TVkSpirTyp>;
   Vars :TList<TVkSpirVar>;
   TI :TVkSpirTyp;
   VI :TVkSpirVar;
   B :TVkBinding;
   S :String;
begin
     _Bindins := nil;
     _Entrys  := nil;
     _LocalX  := 1;
     _LocalY  := 1;
     _LocalZ  := 1;

     _Refled := True;

     if Binary.Size < 20 then Exit;

     Ws  := P_uint32_t( @Binary.Data[ 0 ] );
     WsN := Binary.Size div 4;

     if SpirWord( Ws,0 ) <> Integer( $07230203 ) then Exit;  // SPIR-V マジックナンバー

     Names := TDictionary<Integer,String>.Create;
     Binds := TDictionary<Integer,Integer>.Create;
     DSets := TDictionary<Integer,Integer>.Create;
     Decos := TDictionary<Integer,Integer>.Create;
     Types := TDictionary<Integer,TVkSpirTyp>.Create;
     Vars  := TList<TVkSpirVar>.Create;

     try
        I := 5;
        while I < WsN do
        begin
             N  := SpirWord( Ws,I ) shr 16;
             Op := SpirWord( Ws,I ) and $FFFF;

             if N = 0 then Break;

             case Op of
               SpirOpName:
                 Names.AddOrSetValue( SpirWord( Ws,I+1 ), SpirText( Ws,I+2 ) );

               SpirOpEntryPoint:
                 _Entrys := _Entrys + [ SpirText( Ws,I+3 ) ];

               SpirOpExecutionMode:
                 if SpirWord( Ws,I+2 ) = SpirModeLocalSize then
                 begin
                      _LocalX := SpirWord( Ws,I+3 );
                      _LocalY := SpirWord( Ws,I+4 );
                      _LocalZ := SpirWord( Ws,I+5 );
                 end;

               SpirOpDecorate:
                 case SpirWord( Ws,I+2 ) of
                   SpirDecoBinding      : Binds.AddOrSetValue( SpirWord( Ws,I+1 ), SpirWord( Ws,I+3 ) );
                   SpirDecoDescriptorSet: DSets.AddOrSetValue( SpirWord( Ws,I+1 ), SpirWord( Ws,I+3 ) );
                   SpirDecoBlock        : Decos.AddOrSetValue( SpirWord( Ws,I+1 ), SpirDecoBlock       );
                   SpirDecoBufferBlock  : Decos.AddOrSetValue( SpirWord( Ws,I+1 ), SpirDecoBufferBlock );
                 end;

               SpirOpTypeImage:
                 begin
                      TI.Op := Op;  TI.A := SpirWord( Ws,I+7 );  TI.B := 0;
                      Types.AddOrSetValue( SpirWord( Ws,I+1 ), TI );
                 end;

               SpirOpTypeSampler,
               SpirOpTypeStruct:
                 begin
                      TI.Op := Op;  TI.A := 0;  TI.B := 0;
                      Types.AddOrSetValue( SpirWord( Ws,I+1 ), TI );
                 end;

               SpirOpTypeSampledImage,
               SpirOpTypeArray,
               SpirOpTypeRuntimeArray:
                 begin
                      TI.Op := Op;  TI.A := SpirWord( Ws,I+2 );  TI.B := 0;
                      Types.AddOrSetValue( SpirWord( Ws,I+1 ), TI );
                 end;

               SpirOpTypePointer:
                 begin
                      TI.Op := Op;  TI.A := SpirWord( Ws,I+2 );  TI.B := SpirWord( Ws,I+3 );
                      Types.AddOrSetValue( SpirWord( Ws,I+1 ), TI );
                 end;

               SpirOpVariable:
                 begin
                      VI.Ptr := SpirWord( Ws,I+1 );
                      VI.Id  := SpirWord( Ws,I+2 );
                      VI.Sto := SpirWord( Ws,I+3 );
                      Vars.Add( VI );
                 end;
             end;

             Inc( I, N );
        end;

        ////////// 記述子の分類

        for VI in Vars do
        begin
             if not ( VI.Sto in [ SpirStoUniformConstant, SpirStoUniform, SpirStoStorageBuffer ] ) then Continue;

             if not Binds.ContainsKey( VI.Id ) then Continue;

             if not Types.TryGetValue( VI.Ptr, TI ) then Continue;

             T := TI.B;  // ポインタの指す型

             while Types.TryGetValue( T, TI ) and ( TI.Op in [ SpirOpTypeArray, SpirOpTypeRuntimeArray ] ) do T := TI.A;

             if not Types.TryGetValue( T, TI ) then Continue;

             case TI.Op of
               SpirOpTypeSampler     : B.DescriTyp := VK_DESCRIPTOR_TYPE_SAMPLER;
               SpirOpTypeSampledImage: B.DescriTyp := VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
               SpirOpTypeImage       : if TI.A = 2
                                   then B.DescriTyp := VK_DESCRIPTOR_TYPE_STORAGE_IMAGE
                                   else B.DescriTyp := VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE;
               SpirOpTypeStruct      : if ( Decos.TryGetValue( T, K ) and ( K = SpirDecoBufferBlock ) )
                                  or ( VI.Sto = SpirStoStorageBuffer )
                                   then B.DescriTyp := VK_DESCRIPTOR_TYPE_STORAGE_BUFFER
                                   else B.DescriTyp := VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER;
             else                  Continue;
             end;

             if not Names.TryGetValue( VI.Id, S ) then S := '';

             B.Name    := S;
             B.Binding := Binds[ VI.Id ];

             if DSets.ContainsKey( VI.Id ) then B.DescSet := DSets[ VI.Id ]
                                           else B.DescSet := 0;

             _Bindins := _Bindins + [ B ];
        end;

     finally
        Names.Free;
        Binds.Free;
        DSets.Free;
        Decos.Free;
        Types.Free;
        Vars.Free;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.GetHandle :T_VkShaderModule;
begin
     if _Handle = Default( T_VkShaderModule ) then CreateHandle;

     Result := _Handle;
end;

procedure TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.SetHandle( const Handle_:T_VkShaderModule );
begin
     if _Handle <> Default( T_VkShaderModule ) then CheckVk( DestroHandle, 'TVkShader.DestroHandle is Error!' );

     _Handle := Handle_;
end;

//------------------------------------------------------------------------------

function TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.GetBindins :TArray<TVkBinding>;
begin
     if not _Refled then Reflect;

     Result := _Bindins;
end;

function TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.GetEntrys :TArray<String>;
begin
     if not _Refled then Reflect;

     Result := _Entrys;
end;

function TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.GetLocalX :Integer;
begin
     if not _Refled then Reflect;

     Result := _LocalX;
end;

function TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.GetLocalY :Integer;
begin
     if not _Refled then Reflect;

     Result := _LocalY;
end;

function TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.GetLocalZ :Integer;
begin
     if not _Refled then Reflect;

     Result := _LocalZ;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.CreateHandle :T_VkResult;
var
   I :T_VkShaderModuleCreateInfo;
begin
     FillChar( I, SizeOf( I ), 0 );
     with I do
     begin
          sType    := VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO;
          codeSize := Binary.Size;
          pCode    := P_uint32_t( @Binary.Data[ 0 ] );
     end;

     Result := vkCreateShaderModule( TVkContex<TVkSystem_,TVkDevice_>( Contex ).Handle, @I, nil, @_Handle );
end;

function TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.DestroHandle :T_VkResult;
begin
     _Kernels.Clear;

     vkDestroyShaderModule( TVkContex<TVkSystem_,TVkDevice_>( Contex ).Handle, _Handle, nil );

     _Handle := Default( T_VkShaderModule );

     Result := VK_SUCCESS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.Create;
begin
     inherited;

     _Handle := Default( T_VkShaderModule );

     _Source  := TVkSource_.Create( Self );
     _Binary  := TVkBinary_.Create( Self );
     _Kernels := TVkKernels_.Create( Self );

     _Refled := False;
end;

constructor TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.Create( const Contex_:TVkContex_ );
begin
     inherited Create( TVkContex<TVkSystem_,TVkDevice_>( Contex_ ).Shaders );
end;

destructor TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.Destroy;
begin
     _Kernels.Free;

     FreeHandle;

     _Source.Free;
     _Binary.Free;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkShader<TVkSystem_,TVkDevice_,TVkContex_>.FreeHandle;
begin
     if _Handle <> Default( T_VkShaderModule ) then DestroHandle;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkShaders<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkShaders<TVkSystem_,TVkDevice_,TVkContex_>.Add :TVkShader_;
begin
     Result := TVkShader_.Create( Contex );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
