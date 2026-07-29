unit LUX.Vulkan.Graphics.D2;

// ２ＤＣＧ用シーングラフ（骨組み）
//
//【現状】
// ・３Ｄ側と対称な骨組みだけを用意した段階であり、図形プリミティブはまだ無い。
//   TVkShaper2D を継承して BuildMesh を実装すれば、３Ｄ側とまったく同じ流れで
//   描ける。TVkRender / TVkViewer は 2D / 3D のどちらのカメラでも扱える。
//
//【座標系】
// ・LUX.CG2D（Skia の２Ｄシーングラフ）と揃えて、Ｙは下向き（画面座標系）とする。
//   Vulkan のクリップ空間も Ｙ下向きなので、VkProjOrth2D は３Ｄと違って
//   Ｙ を反転しない。
// ・ノードの局所行列は本来 TSingleM3 だが、抽象層（TVkObject）と GPU へは
//   TSingleM4 で渡る。Pose2D プロパティが両者を仲介する（暗黙変換を使う）。
//
//【視野】
// ・TVkCamera2D の SizeX / SizeY はスクリーンの広さ（ワールド単位）であり、その縦横比は
//   描画先の縦横比とは独立である。両者の差は、描画側がビューポートをレターボックス
//   にして吸収する。
//
//【深度】
// ・２Ｄでは前後関係を描画順で決めるため、TVkRaster2D は深度テストを切ってある。

interface //#################################################################### ■

uses vk_platform, vulkan_core, vulkan_functions,
     LUX, LUX.D2, LUX.D3, LUX.D3x3, LUX.D4x4,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan,
     LUX.Vulkan.Graphics;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkShaper2D = class;
     TVkCamera2D = class;

     TVkRaster2D  = class;
     TVkVerBuf2D  = class;
     TVkIndBuf2D  = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkVertex2D

     // 標準の頂点（16 バイト）。GLSL 側は
     //   layout( location = 0 ) in vec2 aPos;
     //   layout( location = 1 ) in vec2 aTex;
     TVkVertex2D = packed record
       Pos :TSingle2D;  // 位置
       Tex :TSingle2D;  // テクスチャ座標
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkIndex2D

     TVkIndex2D = packed record
       Value :T_uint32_t;
       /////
       class operator Implicit( const V_:T_uint32_t ) :TVkIndex2D;
       class operator Implicit( const V_:TVkIndex2D ) :T_uint32_t;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkPush2D

     // 押込定数（128 バイト）。３Ｄと同じ形にしてあるので、描画側は区別しなくてよい。
     TVkPush2D = packed record
       ProjViewPose :TSingleM4;  // 射影 × 視野 × 姿勢
       Pose         :TSingleM4;  // 姿勢のみ
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkVerBuf2D

     TVkVerBuf2D = class( TVkBuffer<TVkVertex2D> )
     private
     protected
       ///// A C C E S S O R
       function GetUsage :T_VkBufferUsageFlags; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkIndBuf2D

     TVkIndBuf2D = class( TVkBuffer<TVkIndex2D> )
     private
     protected
       ///// A C C E S S O R
       function GetUsage :T_VkBufferUsageFlags; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkRaster2D

     // ２Ｄ用のラスタライズパイプライン。TVkVertex2D の配置と TVkPush2D の押込定数を
     // 宣言し、深度テストと面の間引きを切ってある。
     TVkRaster2D = class( TVkRaster )
     private
     protected
     public
       constructor Create( const Contex_:TVkContex ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkShaper2D

     // ２Ｄの描画ノード。派生クラスが BuildMesh で形を与える。
     TVkShaper2D = class( TVkShaper )
     private
     protected
       _Verters :TVkVerBuf2D;
       _Indexes :TVkIndBuf2D;
       _MeshOK  :Boolean;
       ///// A C C E S S O R
       function GetPose2D :TSingleM3; virtual;
       procedure SetPose2D( const Pose2D_:TSingleM3 ); virtual;
       function GetPos :TSingle2D; virtual;
       procedure SetPos( const Pos_:TSingle2D ); virtual;
       ///// M E T H O D
       procedure BuildMesh; virtual;
       procedure ForceMesh;
       procedure DrawMain( const Drawer_:TVkDrawer; const Pose_:TSingleM4 ); override;
     public
       constructor Create; overload; override;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Verters :TVkVerBuf2D read _Verters                ;  // 頂点（BuildMesh が書き込む）
       property Indexes :TVkIndBuf2D read _Indexes                ;  // 添字（同）
       property Pose2D  :TSingleM3   read GetPose2D write SetPose2D;  // 局所行列（２Ｄの 3x3 として読み書きする）
       property Pos     :TSingle2D   read GetPos    write SetPos   ;  // 位置（局所行列の平行移動成分）
       ///// M E T H O D
       procedure Rebuild;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCamera2D

     // ２Ｄのカメラ。スクリーン（SizeX × SizeY）をそのまま視野とする平行投影。
     TVkCamera2D = class( TVkCamera )
     private
     protected
       ///// A C C E S S O R
       function GetPose2D :TSingleM3; virtual;
       procedure SetPose2D( const Pose2D_:TSingleM3 ); virtual;
       function GetPos :TSingle2D; virtual;
       procedure SetPos( const Pos_:TSingle2D ); virtual;
       ///// M E T H O D
       function GetProjMat :TSingleM4; override;
     public
       ///// P R O P E R T Y
       property Pose2D :TSingleM3 read GetPose2D write SetPose2D;  // 局所行列（２Ｄの 3x3 として）
       property Pos    :TSingle2D read GetPos    write SetPos   ;  // 位置
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

// Vulkan 規約（Ｙ下向き・Ｚ 0〜1）の２Ｄ平行投影行列。
// ２Ｄもワールドが Ｙ下向きなので、３Ｄと違って Ｙ を反転しない。
function VkProjOrth2D( const SizeX_,SizeY_:Single ) :TSingleM4;

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

function VkProjOrth2D( const SizeX_,SizeY_:Single ) :TSingleM4;
var
   KX, KY :Single;
begin
     KX := 2 / SizeX_;
     KY := 2 / SizeY_;

     with Result do
     begin
          _11 := KX;  _12 :=  0;  _13 := 0;  _14 := 0  ;
          _21 :=  0;  _22 := KY;  _23 := 0;  _24 := 0  ;  // Ｙは反転しない
          _31 :=  0;  _32 :=  0;  _33 := 0;  _34 := 0.5;  // 深度は使わないので中央へ置く
          _41 :=  0;  _42 :=  0;  _43 := 0;  _44 := 1  ;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkIndex2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class operator TVkIndex2D.Implicit( const V_:T_uint32_t ) :TVkIndex2D;
begin
     Result.Value := V_;
end;

class operator TVkIndex2D.Implicit( const V_:TVkIndex2D ) :T_uint32_t;
begin
     Result := V_.Value;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkVerBuf2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkVerBuf2D.GetUsage :T_VkBufferUsageFlags;
begin
     Result := inherited GetUsage or VK_BUFFER_USAGE_VERTEX_BUFFER_BIT;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkIndBuf2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkIndBuf2D.GetUsage :T_VkBufferUsageFlags;
begin
     Result := inherited GetUsage or VK_BUFFER_USAGE_INDEX_BUFFER_BIT;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkRaster2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkRaster2D.Create( const Contex_:TVkContex );
begin
     inherited;

     ////////// 頂点の配置（TVkVertex2D）

     AddBindin( 0, SizeOf( TVkVertex2D ) );

     AddAttrib( 0, 0, VK_FORMAT_R32G32_SFLOAT, 0                   );  // aPos
     AddAttrib( 1, 0, VK_FORMAT_R32G32_SFLOAT, SizeOf( TSingle2D ) );  // aTex

     ////////// 押込定数（TVkPush2D）

     PushSize := SizeOf( TVkPush2D );

     ////////// ２Ｄの既定

     CullMode  := VK_CULL_MODE_NONE;  // 裏返っても描く
     DepthTest := False;              // 前後関係は描画順で決める
     DepthWrit := False;
     BlendOK   := True;               // 半透明を重ねる
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkShaper2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkShaper2D.GetPose2D :TSingleM3;
begin
     Result := TSingleM3( _LocalPose );
end;

procedure TVkShaper2D.SetPose2D( const Pose2D_:TSingleM3 );
begin
     LocalPose := Pose2D_;  // TSingleM3 → TSingleM4 は暗黙変換
end;

//------------------------------------------------------------------------------

function TVkShaper2D.GetPos :TSingle2D;
begin
     Result := TSingle2D.Create( _LocalPose._14, _LocalPose._24 );
end;

procedure TVkShaper2D.SetPos( const Pos_:TSingle2D );
begin
     _LocalPose._14 := Pos_.X;
     _LocalPose._24 := Pos_.Y;

     Changed;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkShaper2D.BuildMesh;
begin
     /////  // 既定は空のメッシュ（派生クラスが頂点と添字を書き込む）
end;

procedure TVkShaper2D.ForceMesh;
var
   Q :TVkQueuer;
begin
     if _MeshOK then Exit;

     Q := Queuer;  if not Assigned( Q ) then Exit;  // シーンに属していない

     if not Assigned( _Verters ) then _Verters := TVkVerBuf2D.Create( Q );
     if not Assigned( _Indexes ) then _Indexes := TVkIndBuf2D.Create( Q );

     _MeshOK := True;  // BuildMesh の中から再入しないよう、先に立てる

     BuildMesh;
end;

procedure TVkShaper2D.DrawMain( const Drawer_:TVkDrawer; const Pose_:TSingleM4 );
var
   R :TVkRaster;
   P :TVkPush2D;
   B :T_VkBuffer;
   O :T_VkDeviceSize;
begin
     ForceMesh;

     if not Assigned( _Indexes ) or ( _Indexes.Count = 0 ) then Exit;  // 描くものが無い

     R := Raster;  if not Drawer_.BindRaster( R ) then Exit;  // パイプラインが使えない

     P.ProjViewPose := Drawer_.ProjView * Pose_;
     P.Pose         := Pose_;

     vkCmdPushConstants( Drawer_.Comman, R.Layout, R.PushFlags, 0, SizeOf( P ), @P );

     B := _Verters.Handle;
     O := 0;

     vkCmdBindVertexBuffers( Drawer_.Comman, 0, 1, @B, @O );

     vkCmdBindIndexBuffer( Drawer_.Comman, _Indexes.Handle, 0, VK_INDEX_TYPE_UINT32 );

     vkCmdDrawIndexed( Drawer_.Comman, _Indexes.Count, 1, 0, 0, 0 );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkShaper2D.Create;
begin
     inherited;

     _Verters := nil;
     _Indexes := nil;
     _MeshOK  := False;
end;

destructor TVkShaper2D.Destroy;
begin
     _Indexes.Free;
     _Verters.Free;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkShaper2D.Rebuild;
begin
     _MeshOK := False;

     ForceMesh;

     Changed;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCamera2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkCamera2D.GetPose2D :TSingleM3;
begin
     Result := TSingleM3( _LocalPose );
end;

procedure TVkCamera2D.SetPose2D( const Pose2D_:TSingleM3 );
begin
     LocalPose := Pose2D_;  // TSingleM3 → TSingleM4 は暗黙変換
end;

function TVkCamera2D.GetPos :TSingle2D;
begin
     Result := TSingle2D.Create( _LocalPose._14, _LocalPose._24 );
end;

procedure TVkCamera2D.SetPos( const Pos_:TSingle2D );
begin
     _LocalPose._14 := Pos_.X;
     _LocalPose._24 := Pos_.Y;

     Changed;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkCamera2D.GetProjMat :TSingleM4;
begin
     Result := VkProjOrth2D( SizeX, SizeY );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
