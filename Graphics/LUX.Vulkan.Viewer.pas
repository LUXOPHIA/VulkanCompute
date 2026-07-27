unit LUX.Vulkan.Viewer;

// シーングラフの表示窓（TFrame 継承）
//
//【方式】
// ・FMX はフォーム全体をひとつの HWND へ自前で描くため、そこへ Vulkan の描画結果を
//   割り込ませる素直な手段が無い。そこで、TFrame の位置に **WS_CHILD の裸の
//   ウィンドウ**（TForm ではない）を貼り、そこから VkSurfaceKHR ／ VkSwapchainKHR を
//   作って Vulkan 自身に提示させる。
// ・親 HWND の子なので、親と一緒に移動・最小化・破棄され、親の矩形でクリップされる。
//   フチなし TForm を重ねる方式（LUX.GPU.OpenGL）で必要だった Z 順・最小化・
//   アクティブ化・タスクバーの追従処理は、いっさい不要になる。
// ・マウスは子ウィンドウが **WM_NCHITTEST で HTTRANSPARENT を返す**ことで素通しする。
//   入力は親フォームの HWND に届くので、FMX が通常どおり本フレームの
//   MouseDown / MouseMove / MouseWheel へ配送する。
//
//【FMX の部品を上に重ねたいとき】
// ・子ウィンドウは FMX の描画より必ず手前に来るため、上に FMX の部品を置くことは
//   できない。その場合は Direct := False とすると、TVkRender でオフスクリーンに
//   描いて TBitmap として Canvas へ転送する経路に切り替わる。FMX の描画順に完全に
//   従うが、毎フレーム GPU → CPU → GPU の往復が入る。
//
//【描画のきっかけ】
// ・Camera に接続したカメラの OnScene（シーンの変化）を購読して自動で描き直す。
//   アニメーションのように毎フレーム描く場合は、外から Render を呼んでもよい。
//
//【解放の順序】
// ・カメラを先に解放する場合は Camera := nil で購読を外してから解放すること。
// ・Contex より先に本フレームを解放すること。

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Math,
  Winapi.Windows, Winapi.Messages,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Platform.Win,
  vk_platform, vulkan_core, vulkan_functions,
  LUX, LUX.D4x4,
  LUX.Code.C,
  LUX.Vulkan.core,
  LUX.Vulkan,
  LUX.Vulkan.Graphics.Passer,
  LUX.Vulkan.Graphics.Raster,
  LUX.Vulkan.Graphics,
  LUX.Vulkan.Graphics.Swaper,
  LUX.Vulkan.Render;

type
  TVkViewer = class(TFrame)
  private
  protected
    _Contex :TVkContex;
    _Queuer :TVkQueuer;
    _Camera :TVkCam;
    _Direct :Boolean;
    _Window :T_HWND;
    _Passer :TVkPasser;
    _Swaper :TVkSwaper;
    _Render :TVkRender;
    _Bitmap :TBitmap;
    ///// A C C E S S O R
    procedure SetCamera( const Camera_:TVkCam );
    function GetDirect :Boolean;
    procedure SetDirect( const Direct_:Boolean );
    function GetPixelX :Integer;
    function GetPixelY :Integer;
    ///// M E T H O D
    procedure ForceWindow;
    procedure FreeWindow;
    procedure FitWindow;
    procedure RenderDirect;
    procedure RenderBitmap;
    procedure SceneChange( Sender_:TObject );
    procedure Paint; override;
    procedure Resize; override;
    procedure AncestorVisibleChanged( const Visible_:Boolean ); override;
  public
    constructor Create( AOwner_:TComponent ); override;
    destructor Destroy; override;
    ///// P R O P E R T Y
    property Contex :TVkContex read _Contex ;  // Attach で受け取ったコンテキスト
    property Queuer :TVkQueuer read _Queuer ;
    property Camera :TVkCam    read _Camera write SetCamera;  // 描くカメラ（2D / 3D のどちらでもよい）
    property Direct :Boolean   read GetDirect write SetDirect;  // True: 子ウィンドウへ提示 ／ False: TBitmap 経由
    property PixelX :Integer   read GetPixelX;  // 実際の横ピクセル数（DPI 込み）
    property PixelY :Integer   read GetPixelY;  // 　　　　縦ピクセル数
    ///// M E T H O D
    procedure Attach( const Contex_:TVkContex; const Queuer_:TVkQueuer );
    procedure Render;
  end;

implementation //############################################################### ■

{$R *.fmx}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

const VIEWER_CLASS = 'LUX.Vulkan.Viewer';

var
   _ClassOK :Boolean = False;

//------------------------------------------------------------------------------

// 子ウィンドウの手続き。描画は Vulkan が直接行うので、ここでは何も描かない。
// WM_NCHITTEST に HTTRANSPARENT を返すことで、マウスを親（FMX）へ素通しする。
function ViewerProc( Wnd_:HWND; Msg_:UINT; W_:WPARAM; L_:LPARAM ) :LRESULT; stdcall;
begin
     case Msg_ of
       WM_NCHITTEST : Exit( HTTRANSPARENT );  // 入力を受け取らない
       WM_ERASEBKGND: Exit( 1 );              // 背景を塗らない（ちらつき防止）
       WM_PAINT     : begin
                           ValidateRect( Wnd_, nil );  // Vulkan が提示するので WM_PAINT は捨てる

                           Exit( 0 );
                      end;
     end;

     Result := DefWindowProc( Wnd_, Msg_, W_, L_ );
end;

procedure ForceViewerClass;
var
   C :TWndClassEx;
begin
     if _ClassOK then Exit;

     FillChar( C, SizeOf( C ), 0 );
     with C do
     begin
          cbSize        := SizeOf( C );
          style         := CS_HREDRAW or CS_VREDRAW or CS_OWNDC;
          lpfnWndProc   := @ViewerProc;
          hInstance     := HInstance;
          hbrBackground := 0;
          lpszClassName := VIEWER_CLASS;
     end;

     _ClassOK := ( Winapi.Windows.RegisterClassEx( C ) <> 0 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

procedure TVkViewer.SetCamera( const Camera_:TVkCam );
begin
     if Assigned( _Camera ) then _Camera.OnScene.Del( SceneChange );

     _Camera := Camera_;

     if Assigned( _Camera ) then _Camera.OnScene.Add( SceneChange );

     Render;
end;

//------------------------------------------------------------------------------

function TVkViewer.GetDirect :Boolean;
begin
     Result := _Direct;
end;

procedure TVkViewer.SetDirect( const Direct_:Boolean );
begin
     if Direct_ = _Direct then Exit;

     _Direct := Direct_;

     if _Direct then
     begin
          FreeAndNil( _Render );
     end
     else
     begin
          FreeAndNil( _Swaper );
          FreeWindow;
     end;

     Render;
end;

//------------------------------------------------------------------------------

function TVkViewer.GetPixelX :Integer;
begin
     Result := Round( Width * Scene.GetSceneScale );
end;

function TVkViewer.GetPixelY :Integer;
begin
     Result := Round( Height * Scene.GetSceneScale );
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkViewer.ForceWindow;
var
   F :TCommonCustomForm;
   P :HWND;
begin
     if _Window <> 0 then Exit;

     if not ( Root is TCommonCustomForm ) then Exit;  // まだフォームに載っていない

     F := TCommonCustomForm( Root );

     P := FormToHWND( F );  if P = 0 then Exit;

     ForceViewerClass;  if not _ClassOK then Exit;

     _Window := CreateWindowEx( 0,
                                VIEWER_CLASS, nil,
                                WS_CHILD or WS_VISIBLE or WS_CLIPSIBLINGS or WS_CLIPCHILDREN,
                                0, 0, 1, 1,
                                P, 0, HInstance, nil );
end;

procedure TVkViewer.FreeWindow;
begin
     if _Window <> 0 then
     begin
          DestroyWindow( _Window );

          _Window := 0;
     end;
end;

procedure TVkViewer.FitWindow;
var
   R :TRectF;
   S :Single;
begin
     if _Window = 0 then Exit;

     S := Scene.GetSceneScale;  // 論理座標 → 物理ピクセル（DPI 込み）

     R := AbsoluteRect;

     SetWindowPos( _Window, 0,
                   Round( R.Left  * S ), Round( R.Top    * S ),
                   Round( R.Width * S ), Round( R.Height * S ),
                   SWP_NOZORDER or SWP_NOACTIVATE );
end;

//------------------------------------------------------------------------------

procedure TVkViewer.RenderDirect;
var
   C :T_VkCommandBuffer;
   Cs :array [ 0..1 ] of T_VkClearValue;
   BI :T_VkRenderPassBeginInfo;
   V :T_VkViewport;
   S :T_VkRect2D;
   D :TVkDrawer;
   B :TAlphaColorF;
begin
     ForceWindow;  if _Window = 0 then Exit;

     FitWindow;

     if not Assigned( _Swaper ) then _Swaper := TVkSwaper.Create( _Contex, _Queuer, _Passer, _Window );

     _Swaper.Resize( PixelX, PixelY );

     if not _Swaper.BeginFrame( C ) then Exit;  // 最小化中など

     ////////// CLEAR VALUES

     if Assigned( _Camera ) and Assigned( _Camera.Scene ) then B := _Camera.Scene.BackColor
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
          renderPass               := _Passer.Handle;
          framebuffer              := _Swaper.Framer;
          renderArea.extent.width  := _Swaper.SizeX;
          renderArea.extent.height := _Swaper.SizeY;
          clearValueCount          := 2;
          pClearValues             := @Cs[ 0 ];
     end;

     vkCmdBeginRenderPass( C, @BI, VK_SUBPASS_CONTENTS_INLINE );

     // カメラのスクリーンの縦横比を保って収める。余白には、描画パスが描画先
     // いっぱいに塗った背景色がそのまま残る（レターボックス）。
     if Assigned( _Camera ) then V := VkFitViewport( _Camera.SizeX, _Camera.SizeY, _Swaper.SizeX, _Swaper.SizeY )
                            else V := VkFitViewport( _Swaper.SizeX, _Swaper.SizeY, _Swaper.SizeX, _Swaper.SizeY );

     vkCmdSetViewport( C, 0, 1, @V );

     FillChar( S, SizeOf( S ), 0 );
     S.extent.width  := _Swaper.SizeX;
     S.extent.height := _Swaper.SizeY;

     vkCmdSetScissor( C, 0, 1, @S );

     if Assigned( _Camera ) then
     begin
          D := TVkDrawer.Create( C, _Passer, _Swaper.SizeX, _Swaper.SizeY );
          try
             _Camera.Render( D );
          finally
             D.Free;
          end;
     end;

     vkCmdEndRenderPass( C );

     _Swaper.EndFrame;  // 投入 → 提示
end;

procedure TVkViewer.RenderBitmap;
begin
     if not Assigned( _Render ) then _Render := TVkRender.Create( _Contex, _Queuer );

     _Render.SizeX  := PixelX;
     _Render.SizeY  := PixelY;
     _Render.Camera := _Camera;

     if ( _Render.SizeX <= 0 ) or ( _Render.SizeY <= 0 ) then Exit;

     _Render.Render;

     if not Assigned( _Bitmap ) then _Bitmap := TBitmap.Create;

     _Render.CopyTo( _Bitmap );

     Repaint;  // Paint で Canvas へ転送する
end;

//------------------------------------------------------------------------------

procedure TVkViewer.SceneChange( Sender_:TObject );
begin
     Render;
end;

procedure TVkViewer.Paint;
begin
     if _Direct then
     begin
          // 映像は子ウィンドウが手前に出しているので、ここでは何も描かない。
          // ただしフォームの再描画は位置がずれた合図でもあるので、追従させておく。
          FitWindow;

          if csDesigning in ComponentState  // 設計時は置いた場所が分かるよう枠を描く
          then Canvas.DrawRect( LocalRect, 0, 0, AllCorners, AbsoluteOpacity );
     end
     else
     begin
          if Assigned( _Bitmap ) and not _Bitmap.IsEmpty
          then Canvas.DrawBitmap( _Bitmap, _Bitmap.BoundsF, LocalRect, AbsoluteOpacity, True )
          else Canvas.DrawRect( LocalRect, 0, 0, AllCorners, AbsoluteOpacity );
     end;
end;

procedure TVkViewer.Resize;
begin
     inherited;

     Render;  // 大きさが変わったらスワップチェーンを作り直して描き直す
end;

procedure TVkViewer.AncestorVisibleChanged( const Visible_:Boolean );
begin
     inherited;

     if _Window <> 0 then ShowWindow( _Window, IfThen( Visible_, SW_SHOWNA, SW_HIDE ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkViewer.Create( AOwner_:TComponent );
begin
     inherited;

     _Direct := True;  // 既定は子ウィンドウへ直接提示する

     HitTest     := True;  // マウスは子ウィンドウを素通りして FMX 経由で届く
     AutoCapture := True;  // ドラッグの取りこぼしを防ぐ
end;

destructor TVkViewer.Destroy;
begin
     if Assigned( _Camera ) then _Camera.OnScene.Del( SceneChange );  // 購読解除

     _Bitmap.Free;
     _Render.Free;
     _Swaper.Free;

     FreeWindow;

     _Passer.Free;

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkViewer.Attach( const Contex_:TVkContex; const Queuer_:TVkQueuer );
begin
     _Contex := Contex_;
     _Queuer := Queuer_;

     _Passer.Free;

     _Passer := TVkPasser.Create( _Contex );

     _Passer.ColorLast := VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;  // 描いたら提示する
end;

procedure TVkViewer.Render;
begin
     if not Assigned( _Contex ) then Exit;  // Attach されていない

     if not Assigned( Scene ) then Exit;    // まだフォームに載っていない

     if _Direct then RenderDirect
                else RenderBitmap;
end;

end. //######################################################################### ■
