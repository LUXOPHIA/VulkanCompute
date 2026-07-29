unit LUX.Vulkan.Graphics;

// 抽象シーングラフ（次元に依存しない核）
//
//【構造】
// ・LUX.Data.Tree のノードでシーンを木構造に繋ぐ。TVkObject は親も子も自型の節
//   （TTreeKnot<TVkObject,TVkObject>）であり、互いに自由にジョイントできる。
//   生成・移籍・部分木ごとの解放・循環の禁止は Tree 層が担う。
// ・TVkScener は TVkObject の派生でありながら親には所属できない根である。根も
//   ノードなので、Changed の遡上は親の連鎖をたどるだけでよい（余分な層が要らない）。
//   TVkScener を他のノードの子にすることはできない。
// ・TVkShaper は描画の実体を持つノード、TVkCamera は視点のノード。どちらも次元に
//   依存しないため、実際の形や射影は 2D / 3D の派生ユニットが与える。
//
//【座標系】
// ・LocalPose は局所行列（親ノード座標系 ← 自ノード座標系）、GlobalPose は大域
//   行列（先祖の LocalPose の積）。型は 2D / 3D に共通の TSingleM4 とする ――
//   GPU へ渡る形がこれであり、2D の TSingleM3 は暗黙変換で載せられるため。
// ・Vulkan には行列スタックが無いので、Draw は累積した行列を引数で下へ渡す。
//
//【描画】
// ・描画中の状態は TVkDrawer が持ち運ぶ（コマンドバッファ・描画パス・描画先の
//   大きさ・射影×視野行列・いま束ねているパイプライン）。同じパイプラインの
//   連続した束縛は TVkDrawer.BindRaster が省く。
// ・実際の描画コマンドは TVkShaper の派生が DrawMain で発行する。
//
//【通知】
// ・ノードの挿抜・属性の変更は Changed として根の TVkScener へ集まり、OnChange
//   （TDelegates による多播）で外へ出る。TVkCamera は属すシーンの OnChange を購読して
//   OnScene として転送するので、ビューアはカメラだけを受け取ればよい。
// ・大量の変更は BeginUpdate / EndUpdate（Tree 層の一括更新）で束ねる。破棄中の
//   ノードは Updating 扱いのため通知は発火しない。
//
//【所有】
// ・ノードは部分木ごと所有される（Free で子孫まで解放される）。
// ・Raster（パイプライン）は共有される資源なので、ノードは参照するだけであり
//   所有しない。解放は生成した側の責任である。

interface //#################################################################### ■

uses System.UITypes,
     vk_platform, vulkan_core, vulkan_functions,
     LUX, LUX.D3, LUX.D4x4,
     LUX.Data.Tree,
     LUX.Code.C,
     LUX.Vulkan.core,
     LUX.Vulkan;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkDrawer = class;
     TVkObject = class;
       TVkShaper = class;
       TVkCamera    = class;
       TVkScener  = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkDrawer

     // 描画 1 回の間だけ生きる状態。描画先（TVkRender / TVkViewer）が用意し、
     // シーングラフの Draw に手渡される。
     TVkDrawer = class
     private
     protected
       _Comman   :T_VkCommandBuffer;
       _Passer   :TVkPasser;
       _ProjView :TSingleM4;
       _Raster   :TVkRaster;
     public
       constructor Create( const Comman_:T_VkCommandBuffer; const Passer_:TVkPasser ); virtual;
       ///// P R O P E R T Y
       property Comman   :T_VkCommandBuffer read _Comman                 ;  // 記録中のコマンドバッファ
       property Passer   :TVkPasser         read _Passer                 ;  // 描画先の描画パス
       property ProjView :TSingleM4         read _ProjView write _ProjView;  // 射影行列 × 視野行列（カメラが設定する）
       property Raster   :TVkRaster         read _Raster                 ;  // いま束ねているパイプライン
       ///// M E T H O D
       function BindRaster( const Raster_:TVkRaster ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkObject

     TVkObject = class( TTreeKnot<TVkObject,TVkObject> )
     private
     protected
       _Visible :Boolean;
       _Raster  :TVkRaster;
       ///// A C C E S S O R
       function GetLocalPose :TSingleM4; virtual;
       procedure SetLocalPose( const LocalPose_:TSingleM4 ); virtual;
       function GetGlobalPose :TSingleM4; virtual;
       procedure SetGlobalPose( const GlobalPose_:TSingleM4 ); virtual;
       function GetVisible :Boolean; virtual;
       procedure SetVisible( const Visible_:Boolean ); virtual;
       function GetRaster :TVkRaster; virtual;
       procedure SetRaster( const Raster_:TVkRaster ); virtual;
       ///// E V E N T
       function AcceptChildr( const Childr_:TTreeNode ) :Boolean; override;
       procedure OnInsertChildr( const Childr_:TTreeNode ); override;
       procedure OnRemoveChildr( const Childr_:TTreeNode ); override;
       procedure Updated; override;
       ///// A C C E S S O R
       function GetScene :TVkScener; virtual;
       function GetContex :TVkContex; virtual;
       function GetQueuer :TVkQueuer; virtual;
       ///// M E T H O D
       procedure DrawMain( const Drawer_:TVkDrawer; const Pose_:TSingleM4 ); virtual;
     public
       constructor Create; overload; override;
       ///// P R O P E R T Y
       property Scene      :TVkScener read GetScene                         ;  // 属すシーン（根が TVkScener でなければ nil）
       property Contex     :TVkContex read GetContex                        ;  // シーンが持つコンテキスト（同 nil）
       property Queuer     :TVkQueuer read GetQueuer                        ;  // シーンが持つキュー　　（同 nil）
       property LocalPose  :TSingleM4 read GetLocalPose  write SetLocalPose ;  // 局所行列（親ノード座標系 ← 自ノード座標系）
       property GlobalPose :TSingleM4 read GetGlobalPose write SetGlobalPose;  // 大域行列（＝ 先祖の局所行列の積）
       property Visible    :Boolean   read GetVisible    write SetVisible   ;  // 描くか（部分木ごと隠れる）
       property Raster     :TVkRaster read GetRaster     write SetRaster    ;  // 描画に使うパイプライン（nil なら親を遡る。参照のみで所有しない）
       ///// M E T H O D
       procedure Changed; virtual;
       procedure Draw( const Drawer_:TVkDrawer; const Pose_:TSingleM4 ); virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkShaper

     // 描画の実体を持つノードの基底。局所行列を自前で持つ。
     TVkShaper = class( TVkObject )
     private
     protected
       _LocalPose :TSingleM4;
       ///// A C C E S S O R
       function GetLocalPose :TSingleM4; override;
       procedure SetLocalPose( const LocalPose_:TSingleM4 ); override;
     public
       constructor Create; overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCamera

     // 視点のノード。自分では何も描かない。姿勢は先祖の積（GlobalPose）で決まる。
     // 属すシーンの OnChange を購読して OnScene として転送する。所属の変更には
     // Create( Parent_ ) と Parent への代入で追従する。
     TVkCamera = class( TVkObject )
     private
       _Scene :TVkScener;  // 購読中のシーン
       ///// E V E N T
       _OnScene :TDelegates;
       ///// M E T H O D
       procedure Subscribe;
       procedure SceneChange( Sender_:TObject );
     protected
       _LocalPose :TSingleM4;
       _SizeX     :Single;
       _SizeY     :Single;
       _NeaZ      :Single;
       _FarZ      :Single;
       ///// A C C E S S O R
       function GetLocalPose :TSingleM4; override;
       procedure SetLocalPose( const LocalPose_:TSingleM4 ); override;
       procedure SetParent( const Parent_:TVkObject ); override;
       function GetSizeX :Single; virtual;
       procedure SetSizeX( const SizeX_:Single ); virtual;
       function GetSizeY :Single; virtual;
       procedure SetSizeY( const SizeY_:Single ); virtual;
       function GetNeaZ :Single; virtual;
       procedure SetNeaZ( const NeaZ_:Single ); virtual;
       function GetFarZ :Single; virtual;
       procedure SetFarZ( const FarZ_:Single ); virtual;
       ///// M E T H O D
       function GetProjMat :TSingleM4; virtual;
     public
       constructor Create; overload; override;
       destructor Destroy; override;
       procedure AfterConstruction; override;
       ///// P R O P E R T Y
       property Scene    :TVkScener read   _Scene                ;  // 属すシーン（どこにも属さなければ nil）
       property SizeX    :Single    read GetSizeX  write SetSizeX;  // スクリーンの幅（実寸）
       property SizeY    :Single    read GetSizeY  write SetSizeY;  // スクリーンの高さ（実寸）
       property NeaZ     :Single    read GetNeaZ   write SetNeaZ ;  // 前方クリップ面
       property FarZ     :Single    read GetFarZ   write SetFarZ ;  // 後方クリップ面
       ///// E V E N T
       property OnScene :TDelegates read _OnScene;  // シーンの変化の通知（TVkScener.OnChange の転送）
       ///// M E T H O D
       function ProjMat :TSingleM4;
       function ViewMat :TSingleM4;
       procedure Render( const Drawer_:TVkDrawer );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkScener

     // シーンの根。ノードでありながら親には所属できない。
     // シーンの変化を OnChange で外へ出す。
     // Vulkan のコンテキストとキューを持ち、シーンに属すノードはこれを通して
     // 自分の資源（頂点バッファなど）を確保する。
     TVkScener = class( TVkObject )
     private
       ///// E V E N T
       _OnChange :TDelegates;
     protected
       _Contex    :TVkContex;
       _Queuer    :TVkQueuer;
       _BackColor :TAlphaColorF;
       ///// A C C E S S O R
       procedure SetParent( const Parent_:TVkObject ); override;
       function GetScene :TVkScener; override;
       function GetContex :TVkContex; override;
       procedure SetContex( const Contex_:TVkContex ); virtual;
       function GetQueuer :TVkQueuer; override;
       procedure SetQueuer( const Queuer_:TVkQueuer ); virtual;
       function GetBackColor :TAlphaColorF; virtual;
       procedure SetBackColor( const BackColor_:TAlphaColorF ); virtual;
     public
       constructor Create; overload; override;
       constructor Create( const Queuer_:TVkQueuer ); overload; virtual;
       ///// P R O P E R T Y
       property Contex    :TVkContex    read GetContex    write SetContex   ;  // 資源を確保するコンテキスト
       property Queuer    :TVkQueuer    read GetQueuer    write SetQueuer   ;  // 転送に使うキュー
       property BackColor :TAlphaColorF read GetBackColor write SetBackColor;  // 背景色
       ///// E V E N T
       property OnChange :TDelegates read _OnChange;  // シーンの変化の通知（Add / Del で多播購読）
       ///// M E T H O D
       procedure Changed; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

// カメラのスクリーン（CamX_ × CamY_）の縦横比を保ったまま、描画先（DstX_ × DstY_
// ピクセル）へ最大の大きさで収める視野。余白（レターボックス）には、描画パスが
// 描画先いっぱいに塗った背景色がそのまま残る。
function VkFitViewport( const CamX_,CamY_:Single; const DstX_,DstY_:Integer ) :T_VkViewport;

// シーンを 1 パス分描くコマンド列（クリア 〜 EndRenderPass）を記録する。
// TVkRender と TVkViewer が共用する。カメラが nil なら背景色だけを塗る。
procedure VkRecordScene( const Comman_:T_VkCommandBuffer; const Passer_:TVkPasser;
                         const Framer_:T_VkFramebuffer; const SizeX_,SizeY_:Integer;
                         const Camera_:TVkCamera );

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

function VkFitViewport( const CamX_,CamY_:Single; const DstX_,DstY_:Integer ) :T_VkViewport;
var
   W, H :Single;
begin
     W := DstX_;
     H := DstY_;

     if W * CamY_ > H * CamX_ then W := H * CamX_ / CamY_   // 描画先のほうが横長 → 左右が余る
                              else H := W * CamY_ / CamX_;  // 　　　　　　縦長 → 上下が余る

     FillChar( Result, SizeOf( Result ), 0 );
     with Result do
     begin
          x        := ( DstX_ - W ) / 2;  // 中央へ寄せる
          y        := ( DstY_ - H ) / 2;
          width    := W;
          height   := H;
          minDepth := 0;
          maxDepth := 1;
     end;
end;

procedure VkRecordScene( const Comman_:T_VkCommandBuffer; const Passer_:TVkPasser;
                         const Framer_:T_VkFramebuffer; const SizeX_,SizeY_:Integer;
                         const Camera_:TVkCamera );
var
   B :TAlphaColorF;
   Cs :array [ 0..1 ] of T_VkClearValue;
   BI :T_VkRenderPassBeginInfo;
   V :T_VkViewport;
   S :T_VkRect2D;
   D :TVkDrawer;
begin
     ////////// CLEAR VALUES

     if Assigned( Camera_ ) and Assigned( Camera_.Scene ) then B := Camera_.Scene.BackColor
                                                          else B := TAlphaColorF.Create( 0, 0, 0, 1 );

     FillChar( Cs, SizeOf( Cs ), 0 );

     Cs[ 0 ].color.float32[ 0 ] := B.R;
     Cs[ 0 ].color.float32[ 1 ] := B.G;
     Cs[ 0 ].color.float32[ 2 ] := B.B;
     Cs[ 0 ].color.float32[ 3 ] := B.A;

     Cs[ 1 ].depthStencil.depth := 1;

     ////////// RENDER PASS

     FillChar( BI, SizeOf( BI ), 0 );
     with BI do
     begin
          sType                    := VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
          renderPass               := Passer_.Handle;
          framebuffer              := Framer_;
          renderArea.extent.width  := SizeX_;
          renderArea.extent.height := SizeY_;
          clearValueCount          := 2;
          pClearValues             := @Cs[ 0 ];
     end;

     vkCmdBeginRenderPass( Comman_, @BI, VK_SUBPASS_CONTENTS_INLINE );

     // カメラのスクリーンの縦横比を保って収める。余白には、いま塗った背景色が残る
     if Assigned( Camera_ ) then V := VkFitViewport( Camera_.SizeX, Camera_.SizeY, SizeX_, SizeY_ )
                            else V := VkFitViewport( SizeX_       , SizeY_       , SizeX_, SizeY_ );

     vkCmdSetViewport( Comman_, 0, 1, @V );

     FillChar( S, SizeOf( S ), 0 );
     S.extent.width  := SizeX_;
     S.extent.height := SizeY_;

     vkCmdSetScissor( Comman_, 0, 1, @S );

     if Assigned( Camera_ ) then
     begin
          D := TVkDrawer.Create( Comman_, Passer_ );
          try
             Camera_.Render( D );
          finally
             D.Free;
          end;
     end;

     vkCmdEndRenderPass( Comman_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkDrawer

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkDrawer.Create( const Comman_:T_VkCommandBuffer; const Passer_:TVkPasser );
begin
     inherited Create;

     _Comman   := Comman_;
     _Passer   := Passer_;
     _ProjView := 1;
     _Raster   := nil;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkDrawer.BindRaster( const Raster_:TVkRaster ) :Boolean;
var
   H :T_VkPipeline;
begin
     Result := False;

     if not Assigned( Raster_ ) then Exit;

     // 描画パスが未設定なら、描画側のものを与える（互換な描画パスなら使い回せる）
     if not Assigned( Raster_.Passer ) then Raster_.Passer := _Passer;

     if not Raster_.BuildOK then Exit;  // シェーダのコンパイルに失敗している（BuildLog を参照）

     if Raster_ = _Raster then Exit( True );  // すでに束ねてある

     try
        H := Raster_.Handle;
     except
        on EVkError do Exit;  // パイプラインの生成に失敗（毎フレーム例外を投げ続けない）
     end;

     vkCmdBindPipeline( _Comman, VK_PIPELINE_BIND_POINT_GRAPHICS, H );

     _Raster := Raster_;

     Result := True;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkObject

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkObject.GetLocalPose :TSingleM4;
begin
     Result := 1;  // 既定は恒等（行列の実体は TVkShaper / TVkCamera が持つ）
end;

procedure TVkObject.SetLocalPose( const LocalPose_:TSingleM4 );
begin
     /////  // 行列を持たないノードへの代入は無視する
end;

//------------------------------------------------------------------------------

function TVkObject.GetGlobalPose :TSingleM4;
begin
     if Assigned( Parent ) then Result := Parent.GlobalPose * LocalPose
                           else Result := LocalPose;
end;

procedure TVkObject.SetGlobalPose( const GlobalPose_:TSingleM4 );
begin
     if Assigned( Parent ) then LocalPose := Parent.GlobalPose.Inverse * GlobalPose_
                           else LocalPose := GlobalPose_;
end;

//------------------------------------------------------------------------------

function TVkObject.GetVisible :Boolean;
begin
     Result := _Visible;
end;

procedure TVkObject.SetVisible( const Visible_:Boolean );
begin
     if Visible_ = _Visible then Exit;

     _Visible := Visible_;

     Changed;
end;

//------------------------------------------------------------------------------

function TVkObject.GetRaster :TVkRaster;
begin
     if Assigned( _Raster ) then Result := _Raster       else
     if Assigned( Parent  ) then Result := Parent.Raster  // 自分が nil なら親を遡って解決する
                            else Result := nil;
end;

procedure TVkObject.SetRaster( const Raster_:TVkRaster );
begin
     if Raster_ = _Raster then Exit;

     _Raster := Raster_;

     Changed;
end;

//------------------------------------------------------------------------------

function TVkObject.GetScene :TVkScener;
var
   R :TTreeNode;
begin
     R := Root;

     if R is TVkScener then Result := TVkScener( R )
                      else Result := nil;  // どのシーンにも属していない
end;

function TVkObject.GetContex :TVkContex;
var
   S :TVkScener;
begin
     S := GetScene;

     if Assigned( S ) then Result := S.Contex
                      else Result := nil;
end;

function TVkObject.GetQueuer :TVkQueuer;
var
   S :TVkScener;
begin
     S := GetScene;

     if Assigned( S ) then Result := S.Queuer
                      else Result := nil;
end;

////////////////////////////////////////////////////////////////////// E V E N T

function TVkObject.AcceptChildr( const Childr_:TTreeNode ) :Boolean;
begin
     Result := inherited AcceptChildr( Childr_ ) and not ( Childr_ is TVkScener );  // シーンは入れ子にできない
end;

procedure TVkObject.OnInsertChildr( const Childr_:TTreeNode );
begin
     inherited;

     Changed;
end;

procedure TVkObject.OnRemoveChildr( const Childr_:TTreeNode );
begin
     inherited;

     Changed;
end;

procedure TVkObject.Updated;
begin
     inherited;

     Changed;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkObject.DrawMain( const Drawer_:TVkDrawer; const Pose_:TSingleM4 );
begin
     /////  // 既定は何も描かない
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkObject.Create;
begin
     inherited;

     _Visible := True;
     _Raster  := nil;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkObject.Changed;
begin
     if Updating then Exit;  // 一括更新中は発火しない（最外殻の EndUpdate で Updated が発火する）

     if Assigned( Parent ) then Parent.Changed;  // 根（TVkScener）まで遡る
end;

//------------------------------------------------------------------------------

procedure TVkObject.Draw( const Drawer_:TVkDrawer; const Pose_:TSingleM4 );
var
   P :TSingleM4;
   C :TVkObject;
begin
     if not _Visible then Exit;  // 部分木ごと描かない

     P := Pose_ * LocalPose;  // Vulkan に行列スタックは無いので、累積して下へ渡す

     DrawMain( Drawer_, P );

     for C in Self do C.Draw( Drawer_, P );  // 型付き for-in（TTreeEnumer<TVkObject>）
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkShaper

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkShaper.GetLocalPose :TSingleM4;
begin
     Result := _LocalPose;
end;

procedure TVkShaper.SetLocalPose( const LocalPose_:TSingleM4 );
begin
     _LocalPose := LocalPose_;

     Changed;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkShaper.Create;
begin
     inherited;

     _LocalPose := 1;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkCamera

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkCamera.Subscribe;
var
   R :TTreeNode;
begin
     if Assigned( _Scene ) then _Scene.OnChange.Del( SceneChange );

     _Scene := nil;

     R := Root;

     if R is TVkScener then _Scene := TVkScener( R );

     if Assigned( _Scene ) then _Scene.OnChange.Add( SceneChange );
end;

procedure TVkCamera.SceneChange( Sender_:TObject );
begin
     _OnScene.Run( Self );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkCamera.GetLocalPose :TSingleM4;
begin
     Result := _LocalPose;
end;

procedure TVkCamera.SetLocalPose( const LocalPose_:TSingleM4 );
begin
     _LocalPose := LocalPose_;

     Changed;
end;

//------------------------------------------------------------------------------

procedure TVkCamera.SetParent( const Parent_:TVkObject );
begin
     inherited;

     Subscribe;  // 所属が変わったのでシーンを購読し直す
end;

//------------------------------------------------------------------------------

function TVkCamera.GetSizeX :Single;
begin
     Result := _SizeX;
end;

procedure TVkCamera.SetSizeX( const SizeX_:Single );
begin
     _SizeX := SizeX_;

     Changed;
end;

function TVkCamera.GetSizeY :Single;
begin
     Result := _SizeY;
end;

procedure TVkCamera.SetSizeY( const SizeY_:Single );
begin
     _SizeY := SizeY_;

     Changed;
end;

//------------------------------------------------------------------------------

function TVkCamera.GetNeaZ :Single;
begin
     Result := _NeaZ;
end;

procedure TVkCamera.SetNeaZ( const NeaZ_:Single );
begin
     _NeaZ := NeaZ_;

     Changed;
end;

function TVkCamera.GetFarZ :Single;
begin
     Result := _FarZ;
end;

procedure TVkCamera.SetFarZ( const FarZ_:Single );
begin
     _FarZ := FarZ_;

     Changed;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkCamera.GetProjMat :TSingleM4;
begin
     Result := 1;  // 既定は恒等（射影は 2D / 3D の派生が与える）
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkCamera.Create;
begin
     inherited;

     _LocalPose := 1;
     _Scene     := nil;

     _SizeX := 2;  // スクリーン -1〜+1（正方形）
     _SizeY := 2;

     _NeaZ := 0.1;
     _FarZ := 1000;
end;

destructor TVkCamera.Destroy;
begin
     if Assigned( _Scene ) then _Scene.OnChange.Del( SceneChange );  // 購読解除

     inherited;
end;

procedure TVkCamera.AfterConstruction;
begin
     inherited;  // ここで親へ挿入される

     Subscribe;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkCamera.ProjMat :TSingleM4;
begin
     Result := GetProjMat;
end;

function TVkCamera.ViewMat :TSingleM4;
begin
     Result := GlobalPose.Inverse;  // ワールド座標系 → カメラ座標系
end;

//------------------------------------------------------------------------------

procedure TVkCamera.Render( const Drawer_:TVkDrawer );
begin
     if not Assigned( _Scene ) then Exit;  // シーンに属していなければ何も描かない

     // 描画先の縦横比は射影に影響しない。両者の差は、描画側が視野（viewport）を
     // レターボックスにすることで吸収する（VkFitViewport）。
     Drawer_.ProjView := ProjMat * ViewMat;

     _Scene.Draw( Drawer_, 1 );  // 根の恒等行列から積み始める
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkScener

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

procedure TVkScener.SetParent( const Parent_:TVkObject );
begin
     if Assigned( Parent_ ) then raise ETreeError.Create( 'TVkScener: 親には所属できません' );

     inherited;
end;

//------------------------------------------------------------------------------

function TVkScener.GetScene :TVkScener;
begin
     Result := Self;  // 自分が根
end;

function TVkScener.GetContex :TVkContex;
begin
     Result := _Contex;
end;

procedure TVkScener.SetContex( const Contex_:TVkContex );
begin
     _Contex := Contex_;

     Changed;
end;

function TVkScener.GetQueuer :TVkQueuer;
begin
     Result := _Queuer;
end;

procedure TVkScener.SetQueuer( const Queuer_:TVkQueuer );
begin
     _Queuer := Queuer_;

     Changed;
end;

//------------------------------------------------------------------------------

function TVkScener.GetBackColor :TAlphaColorF;
begin
     Result := _BackColor;
end;

procedure TVkScener.SetBackColor( const BackColor_:TAlphaColorF );
begin
     _BackColor := BackColor_;

     Changed;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkScener.Create;
begin
     inherited;

     _Contex := nil;
     _Queuer := nil;

     _BackColor := TAlphaColorF.Create( 0.2, 0.2, 0.2, 1 );
end;

constructor TVkScener.Create( const Queuer_:TVkQueuer );
begin
     Create;

     _Contex := Queuer_.Contex;  // コンテキストはキューから導く
     _Queuer := Queuer_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkScener.Changed;
begin
     if Updating then Exit;  // 一括更新中は発火しない（最外殻の EndUpdate で Updated が発火する）

     _OnChange.Run( Self );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
