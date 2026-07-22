unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Memo.Types, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.TabControl,
  vk_platform, vulkan_core, vulkan_functions,
  LUX,
  LUX.Complex,
  LUX.Vulkan,
  LUX.Vulkan.Show,
  LUX.Vulkan.Stream.FMX.D1,
  LUX.Vulkan.Stream.FMX.D2;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
      TabItemS: TTabItem;
        MemoS: TMemo;
      TabItemP: TTabItem;
        TabControlP: TTabControl;
          TabItemPL: TTabItem;
            MemoPL: TMemo;
          TabItemPE: TTabItem;
            MemoPE: TMemo;
          TabItemPB: TTabItem;
            MemoPB: TMemo;
      TabItemR: TTabItem;
        ImageR: TImage;
    ImageT: TImage;
    Timer1: TTimer;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ImageRMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
  private
    { private 宣言 }
    _Cent0 :TSingleC;
    _Cent1 :TSingleC;
    _Size0 :TSingleC;
    _Size1 :TSingleC;
    ///// M E T H O D
    procedure ShowBuild;
  public
    { public 宣言 }
    _Device :TVkDevice;
    _Contex :TVkContex;
    _Queuer :TVkQueuer;
    _Buffer :TVkBuffer<TSingleC>;
    _Textur :TVkImager1DxBGRAxUFix8;
    _TexFMX :IVkStream1DxBGRAxUFix8_FMX;
    _Samplr :TVkSamplr;
    _Imager :TVkImager2DxBGRAxUFix8;
    _ImaFMX :IVkStream2DxBGRAxUFix8_FMX;
    _Librar :TVkLibrar;
    _Shader :TVkShader;
    _Kernel :TVkKernel;
    ///// M E T H O D
    procedure MakeContext;
    procedure MakeArguments;
    procedure MakePrograms;
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

{$R *.fmx}

uses System.Math;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TForm1.ShowBuild;
var
   B :TVkBinding;
begin
     with MemoPB.Lines do
     begin
          Add( '▼ Compile' );
          Add( _Shader.CompileLog );
          Add( '' );

          if _Shader.CompileOK then
          begin
               Add( '▼ Module' );
               Add( 'Binary    = ' + _Shader.Binary.Size.ToString + ' Bytes' );
               Add( 'Entry     = ' + String.Join( ', ', _Shader.Entrys ) );
               Add( 'LocalSize = ' + _Shader.LocalX.ToString + ' × '
                                   + _Shader.LocalY.ToString + ' × '
                                   + _Shader.LocalZ.ToString );
               Add( '' );
               Add( '▼ Bindings' );
               for B in _Shader.Bindins do
               begin
                    Add( 'layout( binding = ' + B.Binding.ToString + ' ) ' + B.Name
                       + ' :' + DescriTypToString( B.DescriTyp ) );
               end;
               Add( '' );
          end;
     end;

     if _Shader.CompileOK then Exit;

     TabControl1.ActiveTab := TabItemP;
     TabControlP.ActiveTab := TabItemPB;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TForm1.MakeContext;
begin
     ////////// DEVICE

     _Device := TVulkan.Devices[ 0 ];                                           // 選択

     ////////// CONTEXT (論理デバイス)

     _Contex := TVkContex.Create( _Device );                                    // 生成

     ////////// QUEUE

     _Queuer := TVkQueuer.Create( _Contex );                                    // 生成

     Assert( Assigned( _Contex.Handle ), '_Contex is Error!' );                 // 検証
     Assert( Assigned( _Queuer.Handle ), '_Queuer is Error!' );                 // 検証
end;

//------------------------------------------------------------------------------

procedure TForm1.MakeArguments;
begin
     ////////// BUFFER

     _Buffer := TVkBuffer<TSingleC>.Create( _Contex, _Queuer );                 // 生成

     _Buffer.Count := 2;                                                        // 要素数の設定

     Assert( _Buffer.Handle <> Default( T_VkBuffer ), '_Buffer is Error!' );    // 検証

     _Cent0 := TSingleC.Create( 0, 0 );                                         // 表示領域の中心
     _Size0 := TSingleC.Create( 2, 2 );                                         // 表示領域のサイズ(中心から端まで)

     _Cent1 := _Cent0;                                                          // 目標領域の中心
     _Size1 := _Size0;                                                          // 目標領域のサイズ

     ////////// TEXTURE

     _Textur := TVkImager1DxBGRAxUFix8.Create( _Contex, _Queuer );              // 生成

     _TexFMX := TVkStream1DxBGRAxUFix8_FMX.Create( _Textur );                   // ストリームの生成

     _TexFMX.LoadFromFile( '..\..\_DATA\Textur.png' );                          // 画像のロード

     Assert( _Textur.Handle <> Default( T_VkImage ), '_Textur is Error!' );     // 検証

     _TexFMX.CopyTo( ImageT.Bitmap );                                           // 画像の表示

     ////////// SAMPLER

     _Samplr := TVkSamplr.Create( _Contex );                                    // 生成

     Assert( _Samplr.Handle <> Default( T_VkSampler ), '_Samplr is Error!' );   // 検証

     ////////// IMAGE

     _Imager := TVkImager2DxBGRAxUFix8.Create( _Contex, _Queuer );              // 生成

     _Imager.CountX := 500;                                                     // 横ピクセル数の設定
     _Imager.CountY := 500;                                                     // 縦ピクセル数の設定

     Assert( _Imager.Handle <> Default( T_VkImage ), '_Imager is Error!' );     // 検証

     _ImaFMX := TVkStream2DxBGRAxUFix8_FMX.Create( _Imager );                   // ストリームの生成
end;

//------------------------------------------------------------------------------

procedure TForm1.MakePrograms;
begin
     ////////// LIBRARY

     _Librar := TVkLibrar.Create( _Contex );                                    // 生成

     _Librar.Source.LoadFromFile( '..\..\_DATA\Librar.glsl' );                  // ソースコードのロード

     MemoPL.Lines.Assign( _Librar.Source );                                     // ソースコードの表示

     ////////// SHADER

     _Shader := TVkShader.Create( _Contex );                                    // 生成

     _Shader.Source.LoadFromFile( '..\..\_DATA\Execut.comp' );                  // ソースコードのロード

     MemoPE.Lines.Assign( _Shader.Source );                                     // ソースコードの表示

     ////////// BUILD ( GLSL → SPIR-V )

     if _Shader.Handle = Default( T_VkShaderModule ) then Exit; { _Shader is Error! }  // 検証（実行時コンパイル）

     ////////// KERNEL

     _Kernel := TVkKernel.Create( _Shader, 'main', _Queuer );                   // 生成

     Assert( _Kernel.Handle <> Default( T_VkPipeline ), '_Kernel is Error!' );  // 検証

     _Kernel.GloSizX := _Imager.CountX;                                         // Ｘ方向ループ回数の設定
     _Kernel.GloSizY := _Imager.CountY;                                         // Ｙ方向ループ回数の設定

     _Kernel.Parames['Buffer'] := _Buffer;                                      // バッファーの登録
     _Kernel.Parames['Textur'] := _Textur;                                      // テクスチャの登録
     _Kernel.Parames['Samplr'] := _Samplr;                                      // サンプラーの登録
     _Kernel.Parames['Imager'] := _Imager;                                      // イメージ　の登録

     Assert( _Kernel.Parames.FindsOK, '_Kernel.Parames.FindsOK is Error!' );    // 仮引数の照合
     Assert( _Kernel.Parames.BindsOK, '_Kernel.Parames.BindsOK is Error!' );    // 実引数の接続

     Timer1.Enabled := True;                                                    // 描画開始
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     if not TVulkan.Available or ( TVulkan.Devices.Count = 0 ) then
     begin
          MemoS.Lines.Add( 'Vulkan is not available.' );                        // Vulkan が利用できない環境

          Exit;
     end;

     MakeContext;                                                               // コンテキストの生成

     MakeArguments;                                                             // 実引数の生成

     MakePrograms;                                                              // プログラムの生成

     ShowBuild;                                                                 // ビルド情報の表示

     TVulkan.Show( MemoS.Lines );                                               // システム情報の表示
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     MemoS.Lines.SaveToFile( 'System.txt', TEncoding.UTF8 );

     ImageR.Bitmap.SaveToFile( 'Imager.png' );
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Timer1Timer(Sender: TObject);
const
     L = 0.25;
begin
     ////////// AREA

     _Cent0 := _Cent0 + ( _Cent1 - _Cent0 ) * L;                                // 目標領域へ補間
     _Size0 := _Size0 + ( _Size1 - _Size0 ) * L;

     ////////// BUFFER

     _Buffer.Data.Map;                                                          // 展開
     _Buffer.Data[ 0 ] := _Cent0;                                               // 中心の書き込み
     _Buffer.Data[ 1 ] := _Size0;                                               // サイズの書き込み
     _Buffer.Data.Unmap;                                                        // 同期

     ////////// KERNEL

     _Kernel.Run;                                                               // 実行

     ////////// IMAGE

     _ImaFMX.CopyTo( ImageR.Bitmap );                                           // 画像の表示
end;

procedure TForm1.ImageRMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
var
   P :TPointF;
   C :TSingleC;
   S :Single;
begin
     P := ImageR.AbsoluteToLocal( ScreenToClient( Screen.MousePos ) );

     C.R := _Cent1.R + _Size1.R * ( 2 * P.X / ImageR.Width  - 1 );              // カーソル位置の複素座標
     C.I := _Cent1.I - _Size1.I * ( 2 * P.Y / ImageR.Height - 1 );

     S := Power( 1.1, WheelDelta / 120 );                                       // 1ノッチあたりの倍率

     _Cent1 := C + ( _Cent1 - C ) * S;                                          // カーソル位置を不動点に拡縮
     _Size1 := _Size1 * S;
end;

end. //######################################################################### ■
