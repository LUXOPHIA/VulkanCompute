unit LUX.Vulkan.Graphics.D3.Shapers;

// ３ＤＣＧ用の形状プリミティブ
//
// ・形は BuildMesh の中で頂点バッファと添字バッファへ書き込む。最初の描画時に
//   一度だけ呼ばれ、寸法を変えると（Changed 経由で）作り直される。
// ・面ごとに法線が異なる立体は、稜線で頂点を共有できない。立方体は 8 頂点ではなく
//   面 6 × 4 = 24 頂点で構成する。
// ・面の表裏は反時計回り（VK_FRONT_FACE_COUNTER_CLOCKWISE）を表とする。

interface //#################################################################### ■

uses vk_platform, vulkan_core,
     LUX, LUX.D2, LUX.D3, LUX.D4x4,
     LUX.Code.C,
     LUX.Vulkan,
     LUX.Vulkan.Graphics,
     LUX.Vulkan.Graphics.D3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkCube3D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCube3D

     // 直方体。原点を中心に、Size の寸法で広がる。
     TVkCube3D = class( TVkShaper3D )
     private
     protected
       _Size :TSingle3D;
       ///// A C C E S S O R
       function GetSize :TSingle3D; virtual;
       procedure SetSize( const Size_:TSingle3D ); virtual;
       ///// M E T H O D
       procedure BuildMesh; override;
     public
       constructor Create; overload; override;
       ///// P R O P E R T Y
       property Size :TSingle3D read GetSize write SetSize;  // 各軸方向の全長（既定は 1×1×1）
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCube3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkCube3D.GetSize :TSingle3D;
begin
     Result := _Size;
end;

procedure TVkCube3D.SetSize( const Size_:TSingle3D );
begin
     _Size := Size_;

     Rebuild;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkCube3D.BuildMesh;
   //////////  単位立方体の座標を寸法へ引き伸ばす（TSingle3D に成分ごとの積は無い）
   function Scaled( const P_:TSingle3D ) :TSingle3D;
   begin
        Result := TSingle3D.Create( P_.X * _Size.X, P_.Y * _Size.Y, P_.Z * _Size.Z );
   end;
   //////////  面の法線と、その面の張る 2 軸から 4 頂点 ＋ 6 添字を作る
   procedure MakeFace( const FaceI_:Integer; const Nor_,AxisU_,AxisV_:TSingle3D );
   var
      V :TVkVertex3D;
      C :TSingle3D;  // 面の中心（単位立方体での）
      I, J :Integer;
   begin
        C := Nor_ * 0.5;  // 法線方向に半分ずらした位置が面の中心

        V.Nor := Nor_;

        I := FaceI_ * 4;
        J := FaceI_ * 6;

        V.Pos := Scaled( C - AxisU_ * 0.5 - AxisV_ * 0.5 );  V.Tex := TSingle2D.Create( 0, 0 );  _Verters.Data[ I+0 ] := V;
        V.Pos := Scaled( C + AxisU_ * 0.5 - AxisV_ * 0.5 );  V.Tex := TSingle2D.Create( 1, 0 );  _Verters.Data[ I+1 ] := V;
        V.Pos := Scaled( C + AxisU_ * 0.5 + AxisV_ * 0.5 );  V.Tex := TSingle2D.Create( 1, 1 );  _Verters.Data[ I+2 ] := V;
        V.Pos := Scaled( C - AxisU_ * 0.5 + AxisV_ * 0.5 );  V.Tex := TSingle2D.Create( 0, 1 );  _Verters.Data[ I+3 ] := V;

        _Indexes.Data[ J+0 ] := T_uint32_t( I+0 );  // 反時計回りが表
        _Indexes.Data[ J+1 ] := T_uint32_t( I+1 );
        _Indexes.Data[ J+2 ] := T_uint32_t( I+2 );
        _Indexes.Data[ J+3 ] := T_uint32_t( I+0 );
        _Indexes.Data[ J+4 ] := T_uint32_t( I+2 );
        _Indexes.Data[ J+5 ] := T_uint32_t( I+3 );
   end;
   //////////
var
   AX, AY, AZ :TSingle3D;
begin
     AX := TSingle3D.IdentityX;
     AY := TSingle3D.IdentityY;
     AZ := TSingle3D.IdentityZ;

     _Verters.Count := 6 * 4;  // 面ごとに法線が違うので、頂点は共有できない
     _Indexes.Count := 6 * 6;

     _Verters.Data.Map;
     _Indexes.Data.Map;

     MakeFace( 0, +AZ, +AX, +AY );  // 前
     MakeFace( 1, -AZ, -AX, +AY );  // 後
     MakeFace( 2, +AX, -AZ, +AY );  // 右
     MakeFace( 3, -AX, +AZ, +AY );  // 左
     MakeFace( 4, +AY, +AX, -AZ );  // 上
     MakeFace( 5, -AY, +AX, +AZ );  // 下

     _Indexes.Data.Unmap;
     _Verters.Data.Unmap;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkCube3D.Create;
begin
     inherited;

     _Size := TSingle3D.Create( 1, 1, 1 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
