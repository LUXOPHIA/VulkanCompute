unit LUX.Vulkan.Graphics.D3;

// ３ＤＣＧ用シーングラフ
//
//【頂点】
// ・TVkVertex3D が標準の頂点である（位置・法線・テクスチャ座標）。GLSL の
//   location = 0 / 1 / 2 に対応し、その配置は TVkRaster3D が宣言する。
// ・頂点バッファと添字バッファは TVkShaper3D が持ち、最初の描画時に BuildMesh で
//   遅延生成される。Rebuild で作り直せる。
//
//【押込定数】
// ・TVkPush3D（128 バイト）を全ノード共通の押込定数とする。Vulkan が保証する
//   最小容量とちょうど同じなので、どの環境でも追加の記述子なしに動く。
// ・ProjViewPose は「射影 × 視野 × 姿勢」、Pose は姿勢のみ（法線の変換と
//   ワールド座標の算出に使う）。
//
//【射影】
// ・Vulkan のクリップ空間は OpenGL と規約が違う（Ｙが下向き・Ｚが 0〜1）。座標の
//   構造そのものが異なるので、LUX.D4x4 の射影行列を変換して使うのではなく、
//   本ユニットの VkProjPers3D / VkProjOrth3D で Vulkan 規約の行列を直に作る。
//   特殊なのは射影だけであり、TVkObject.LocalPose などは TSingleM4 のままでよい。
// ・カメラはスクリーン（SizeX × SizeY）を持ち、その縦横比は描画先の縦横比とは
//   独立である。両者の差は、描画側がビューポートをレターボックスにして吸収する。
//
//【混在】
// ・2D（LUX.Vulkan.Graphics.D2）のノードと同じシーンに混在させないこと。
//   頂点の配置と押込定数の形が異なるため、パイプラインが噛み合わない。

interface //#################################################################### ■

uses System.Math,
     vk_platform, vulkan_core, vulkan_functions,
     LUX, LUX.D2, LUX.D3, LUX.D4x4,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan,
     LUX.Vulkan.Graphics.Passer,
     LUX.Vulkan.Graphics.Raster,
     LUX.Vulkan.Graphics;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkObject3D  = class;
       TVkShaper3D = class;
       TVkCam3D    = class;
         TVkCamPers3D = class;
         TVkCamOrth3D = class;
       TVkScene3D  = class;

     TVkRaster3D  = class;
     TVkVerBuf3D  = class;
     TVkIndBuf3D  = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkVertex3D

     // 標準の頂点（32 バイト）。GLSL 側は
     //   layout( location = 0 ) in vec3 aPos;
     //   layout( location = 1 ) in vec3 aNor;
     //   layout( location = 2 ) in vec2 aTex;
     TVkVertex3D = packed record
       Pos :TSingle3D;  // 位置
       Nor :TSingle3D;  // 法線
       Tex :TSingle2D;  // テクスチャ座標
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkIndex3D

     // 添字（TVkBuffer の型引数にできるよう、レコードで包む）
     TVkIndex3D = packed record
       Value :T_uint32_t;
       /////
       class operator Implicit( const V_:T_uint32_t ) :TVkIndex3D;
       class operator Implicit( const V_:TVkIndex3D ) :T_uint32_t;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkPush3D

     // 押込定数（128 バイト ＝ Vulkan が保証する最小容量）。GLSL 側は
     //   layout( push_constant ) uniform Push { mat4 ProjViewPose; mat4 Pose; } uPush;
     TVkPush3D = packed record
       ProjViewPose :TSingleM4;  // 射影 × 視野 × 姿勢
       Pose         :TSingleM4;  // 姿勢のみ
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkVerBuf3D

     // 頂点バッファ。既定の TVkBuffer は VERTEX_BUFFER_BIT を立てないので足す。
     TVkVerBuf3D = class( TVkBuffer<TVkVertex3D> )
     private
     protected
       ///// A C C E S S O R
       function GetUsage :T_VkBufferUsageFlags; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkIndBuf3D

     // 添字バッファ
     TVkIndBuf3D = class( TVkBuffer<TVkIndex3D> )
     private
     protected
       ///// A C C E S S O R
       function GetUsage :T_VkBufferUsageFlags; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkRaster3D

     // ３Ｄ用のラスタライズパイプライン。TVkVertex3D の配置と TVkPush3D の押込定数を
     // あらかじめ宣言してある。段（Stages）だけを足せば使える。
     TVkRaster3D = class( TVkRaster )
     private
     protected
     public
       constructor Create( const Contex_:TVkContex ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkObject3D

     // ３Ｄノード。行列を持たない中間節（グループ）として使える。
     TVkObject3D = class( TVkObject )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkShaper3D

     // ３Ｄの描画ノード。頂点バッファと添字バッファを持ち、添字つきで描画する。
     // 形は派生クラスが BuildMesh で与える。
     TVkShaper3D = class( TVkShaper )
     private
     protected
       _Verters :TVkVerBuf3D;
       _Indexes :TVkIndBuf3D;
       _MeshOK  :Boolean;
       ///// A C C E S S O R
       function GetPos :TSingle3D; virtual;
       procedure SetPos( const Pos_:TSingle3D ); virtual;
       ///// M E T H O D
       procedure BuildMesh; virtual;
       procedure ForceMesh;
       procedure DrawMain( const Drawer_:TVkDrawer; const Pose_:TSingleM4 ); override;
     public
       constructor Create; overload; override;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Verters :TVkVerBuf3D read _Verters              ;  // 頂点（BuildMesh が書き込む）
       property Indexes :TVkIndBuf3D read _Indexes              ;  // 添字（同）
       property Pos     :TSingle3D   read GetPos    write SetPos;  // 位置（局所行列の平行移動成分）
       ///// M E T H O D
       procedure Rebuild;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCam3D

     TVkCam3D = class( TVkCam )
     private
     protected
       ///// A C C E S S O R
       function GetPos :TSingle3D; virtual;
       procedure SetPos( const Pos_:TSingle3D ); virtual;
     public
       ///// P R O P E R T Y
       property Pos :TSingle3D read GetPos write SetPos;  // 位置（局所行列の平行移動成分）
       ///// M E T H O D
       procedure LookAt( const TarP_:TSingle3D ); overload;
       procedure LookAt( const EyeP_,TarP_:TSingle3D ); overload;
       procedure LookAt( const EyeP_,TarP_,UppV_:TSingle3D ); overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCamPers3D

     // 透視投影のカメラ。
     // スクリーン（SizeX × SizeY）を焦点距離 FocusZ の位置に置いた「レンズ」として
     // 扱う。画角 AngleX / AngleY はそこから導かれる量であり、代入すると
     // スクリーンの大きさは保ったまま FocusZ のほうが動く（＝ ズーム）。
     TVkCamPers3D = class( TVkCam3D )
     private
     protected
       _FocusZ :Single;
       ///// A C C E S S O R
       function GetFocusZ :Single; virtual;
       procedure SetFocusZ( const FocusZ_:Single ); virtual;
       function GetAngleX :Single; virtual;
       procedure SetAngleX( const AngleX_:Single ); virtual;
       function GetAngleY :Single; virtual;
       procedure SetAngleY( const AngleY_:Single ); virtual;
       ///// M E T H O D
       function GetProjMat :TSingleM4; override;
     public
       constructor Create; overload; override;
       ///// P R O P E R T Y
       property FocusZ :Single read GetFocusZ write SetFocusZ;  // 焦点距離（スクリーンまでの距離）
       property AngleX :Single read GetAngleX write SetAngleX;  // 横方向の画角（ラジアン）
       property AngleY :Single read GetAngleY write SetAngleY;  // 縦方向の画角（ラジアン）
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCamOrth3D

     // 平行投影のカメラ。視野はスクリーン（SizeX × SizeY）そのもの。
     TVkCamOrth3D = class( TVkCam3D )
     private
     protected
       ///// M E T H O D
       function GetProjMat :TSingleM4; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkScene3D

     TVkScene3D = class( TVkScene )
     private
     protected
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

// Vulkan 規約（Ｙ下向き・Ｚ 0〜1）の透視投影行列。
// スクリーン SizeX_ × SizeY_ を距離 FocusZ_ から覗いた視野を写す。
function VkProjPers3D( const SizeX_,SizeY_,FocusZ_,NeaZ_,FarZ_:Single ) :TSingleM4;

// Vulkan 規約（Ｙ下向き・Ｚ 0〜1）の平行投影行列。視野はスクリーンそのもの。
function VkProjOrth3D( const SizeX_,SizeY_,NeaZ_,FarZ_:Single ) :TSingleM4;

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

function VkProjPers3D( const SizeX_,SizeY_,FocusZ_,NeaZ_,FarZ_:Single ) :TSingleM4;
var
   KX, KY, KZ :Single;
begin
     KX := 2 * FocusZ_ / SizeX_;
     KY := 2 * FocusZ_ / SizeY_;
     KZ := FarZ_ / ( NeaZ_ - FarZ_ );  // 奥ほど 1 に近づく（Ｚ 0〜1）

     with Result do
     begin
          _11 := KX;  _12 :=   0;  _13 :=   0;  _14 :=       0    ;
          _21 :=  0;  _22 := -KY;  _23 :=   0;  _24 :=       0    ;  // Ｙは下向き
          _31 :=  0;  _32 :=   0;  _33 :=  KZ;  _34 := KZ * NeaZ_ ;
          _41 :=  0;  _42 :=   0;  _43 :=  -1;  _44 :=       0    ;  // Ｗ ＝ 視点からの距離
     end;
end;

function VkProjOrth3D( const SizeX_,SizeY_,NeaZ_,FarZ_:Single ) :TSingleM4;
var
   KX, KY, KZ :Single;
begin
     KX := 2 / SizeX_;
     KY := 2 / SizeY_;
     KZ := 1 / ( NeaZ_ - FarZ_ );

     with Result do
     begin
          _11 := KX;  _12 :=   0;  _13 :=   0;  _14 :=       0    ;
          _21 :=  0;  _22 := -KY;  _23 :=   0;  _24 :=       0    ;  // Ｙは下向き
          _31 :=  0;  _32 :=   0;  _33 :=  KZ;  _34 := KZ * NeaZ_ ;
          _41 :=  0;  _42 :=   0;  _43 :=   0;  _44 :=       1    ;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkIndex3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class operator TVkIndex3D.Implicit( const V_:T_uint32_t ) :TVkIndex3D;
begin
     Result.Value := V_;
end;

class operator TVkIndex3D.Implicit( const V_:TVkIndex3D ) :T_uint32_t;
begin
     Result := V_.Value;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkVerBuf3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkVerBuf3D.GetUsage :T_VkBufferUsageFlags;
begin
     Result := inherited GetUsage or VK_BUFFER_USAGE_VERTEX_BUFFER_BIT;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkIndBuf3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkIndBuf3D.GetUsage :T_VkBufferUsageFlags;
begin
     Result := inherited GetUsage or VK_BUFFER_USAGE_INDEX_BUFFER_BIT;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkRaster3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkRaster3D.Create( const Contex_:TVkContex );
begin
     inherited;

     ////////// 頂点の配置（TVkVertex3D）

     AddBindin( 0, SizeOf( TVkVertex3D ) );

     AddAttrib( 0, 0, VK_FORMAT_R32G32B32_SFLOAT, 0                        );  // aPos
     AddAttrib( 1, 0, VK_FORMAT_R32G32B32_SFLOAT, SizeOf( TSingle3D )      );  // aNor
     AddAttrib( 2, 0, VK_FORMAT_R32G32_SFLOAT   , SizeOf( TSingle3D ) * 2  );  // aTex

     ////////// 押込定数（TVkPush3D）

     PushSize := SizeOf( TVkPush3D );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkObject3D

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkShaper3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkShaper3D.GetPos :TSingle3D;
begin
     Result := _LocalPose.AxisP;
end;

procedure TVkShaper3D.SetPos( const Pos_:TSingle3D );
begin
     _LocalPose.AxisP := Pos_;

     Changed;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkShaper3D.BuildMesh;
begin
     /////  // 既定は空のメッシュ（派生クラスが頂点と添字を書き込む）
end;

procedure TVkShaper3D.ForceMesh;
var
   C :TVkContex;
   Q :TVkQueuer;
begin
     if _MeshOK then Exit;

     C := Contex;  if not Assigned( C ) then Exit;  // シーンに属していない
     Q := Queuer;

     if not Assigned( _Verters ) then _Verters := TVkVerBuf3D.Create( C, Q );
     if not Assigned( _Indexes ) then _Indexes := TVkIndBuf3D.Create( C, Q );

     _MeshOK := True;  // BuildMesh の中から再入しないよう、先に立てる

     BuildMesh;
end;

procedure TVkShaper3D.DrawMain( const Drawer_:TVkDrawer; const Pose_:TSingleM4 );
var
   R :TVkRaster;
   P :TVkPush3D;
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

constructor TVkShaper3D.Create;
begin
     inherited;

     _Verters := nil;
     _Indexes := nil;
     _MeshOK  := False;
end;

destructor TVkShaper3D.Destroy;
begin
     _Indexes.Free;
     _Verters.Free;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkShaper3D.Rebuild;
begin
     _MeshOK := False;

     ForceMesh;

     Changed;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCam3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkCam3D.GetPos :TSingle3D;
begin
     Result := _LocalPose.AxisP;
end;

procedure TVkCam3D.SetPos( const Pos_:TSingle3D );
begin
     _LocalPose.AxisP := Pos_;

     Changed;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkCam3D.LookAt( const TarP_:TSingle3D );
begin
     LookAt( Pos, TarP_, TSingle3D.Create( 0, 1, 0 ) );
end;

procedure TVkCam3D.LookAt( const EyeP_,TarP_:TSingle3D );
begin
     LookAt( EyeP_, TarP_, TSingle3D.Create( 0, 1, 0 ) );
end;

procedure TVkCam3D.LookAt( const EyeP_,TarP_,UppV_:TSingle3D );
begin
     // TSingleM4.LookAt は視野行列（ワールド → カメラ）を返すので、
     // ノードの姿勢（カメラ → ワールド）へ逆にして代入する
     LocalPose := TSingleM4.LookAt( EyeP_, TarP_, UppV_ ).Inverse;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCamPers3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkCamPers3D.GetFocusZ :Single;
begin
     Result := _FocusZ;
end;

procedure TVkCamPers3D.SetFocusZ( const FocusZ_:Single );
begin
     _FocusZ := FocusZ_;

     Changed;
end;

//------------------------------------------------------------------------------

function TVkCamPers3D.GetAngleX :Single;
begin
     Result := 2 * ArcTan( SizeX / 2 / _FocusZ );
end;

procedure TVkCamPers3D.SetAngleX( const AngleX_:Single );
begin
     FocusZ := SizeX / 2 / Tan( AngleX_ / 2 );  // スクリーンは動かさず、レンズを繰り出す
end;

function TVkCamPers3D.GetAngleY :Single;
begin
     Result := 2 * ArcTan( SizeY / 2 / _FocusZ );
end;

procedure TVkCamPers3D.SetAngleY( const AngleY_:Single );
begin
     FocusZ := SizeY / 2 / Tan( AngleY_ / 2 );
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkCamPers3D.GetProjMat :TSingleM4;
begin
     Result := VkProjPers3D( SizeX, SizeY, _FocusZ, NeaZ, FarZ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkCamPers3D.Create;
begin
     inherited;

     _FocusZ := 1 / Tan( DegToRad( 45 ) / 2 );  // SizeY = 2 に対して画角 45°
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCamOrth3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkCamOrth3D.GetProjMat :TSingleM4;
begin
     Result := VkProjOrth3D( SizeX, SizeY, NeaZ, FarZ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkScene3D

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
