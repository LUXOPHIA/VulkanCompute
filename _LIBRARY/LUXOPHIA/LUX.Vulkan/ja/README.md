# LUX.Vulkan
[English](../README.md) | [日本語](README.md)

Vulkan API [1] を介して **GLSL** から GPU を駆動するための Delphi 用クラスライブラリです。
Vulkan の各ハンドルをクラス 1 個で包み、それらがハンドルの所有関係をそのまま写したツリーを構成するため、生成順序と寿命の管理はライブラリ側が引き受けます。

1. [概要](#1-概要)
2. [技術的背景](#2-技術的背景)
3. [アーキテクチャ](#3-アーキテクチャ)
4. [API リファレンス](#4-api-リファレンス)
5. [使い方：コンピュート](#5-使い方コンピュート)
6. [使い方：グラフィックス](#6-使い方グラフィックス)
7. [設計上の約束ごと](#7-設計上の約束ごと)
8. [必要な環境](#8-必要な環境)
9. [参考文献](#9-参考文献)

## 利用ライブラリ

* [**LUX**](https://github.com/LUXOPHIA/LUX) ：`LUX.Code.C`・`LUX.Color`・ベクトル／行列型・コンテナ `LUX.Data.List`／`LUX.Data.Tree` を全体で用いる土台のライブラリ。

----
## 1. 概要

Vulkan の両輪をどちらも扱えます。

* **コンピュート** ―― コンピュートシェーダの実行（`TVkKernel`）。
* **グラフィックス** ―― ラスタライザによるシーングラフの描画（`TVkRaster`）。オフスクリーンで `TBitmap` へ（`TVkRender`）、あるいはスワップチェーンでウィンドウへ（`TVkViewer`）。

ツールチェーンの面では自己完結しています。Vulkan のヘッダはツリー内で Delphi へ翻訳済であり、GLSL コンパイラ（glslang [5]）はビルド済 DLL として収録済です。したがってアプリのビルドに **Vulkan SDK も CMake も不要**で、Delphi だけで完結します（[§ 8](#8-必要な環境)）。

設計を特徴づける性質は 3 つです。

* **ハンドル 1 個につきクラス 1 個。** Vulkan のハンドル型ごとに包むクラスが 1 個あり、それらはハンドルの所有グラフと同じ形のツリーへジョイントされます（[§ 3.4](#34-所有関係とデータの流れ)）。
* **遅延生成。** `Handle` プロパティは最初に読まれたときにハンドルを生成し、生成条件を変えると破棄して次の読み取りに委ねます（[§ 7.1](#71-ハンドルは遅延生成)）。
* **宣言ではなく反射。** 記述子・入口関数・`local_size` は本ライブラリ自前の反射器が SPIR-V から取り出すため、実引数は**名前で**接続します（[§ 5.7](#57-カーネル)）。

----
## 2. 技術的背景

### 2.1 Vulkan のオブジェクトモデル

Vulkan にはグローバルな状態がありません。すべてのオブジェクトは親オブジェクトから生成され、親より長く生きることはできません。つまり API 全体が厳密な所有の連鎖です。

```
[ 所有の連鎖 ]
・VkInstance（ローダ）
  ┗・VkPhysicalDevice（列挙のみ）
     ┗・VkDevice（論理）
        ┣・VkQueue
        ┃  ┗・VkCommandPool
        ┃     ┗・VkCommandBuffer
        ┣・VkBuffer ／ VkImage
        ┃  ┗・VkDeviceMemory ＋ VkImageView ／ VkSampler
        ┣・VkShaderModule
        ┃  ┗・VkPipeline（compute）
        ┣・VkRenderPass
        ┃  ┗・VkFramebuffer
        ┗・VkPipeline（graphics）

[ 提示の連鎖 ]
・VkSurfaceKHR
  ┗・VkSwapchainKHR
     ┗・VkImage[]
        ┗・VkImageView[]
           ┗・VkFramebuffer[]
```

* **インスタンス** ―― ローダの入口。インスタンスレベルの拡張（`VK_KHR_surface`、`VK_KHR_win32_surface`）はここで選び、後から足すことはできません。
* **物理デバイス** ―― GPU。*列挙*されるだけであり、生成も破棄もしません。ここから得られるキューファミリとメモリタイプが、次の段階の選択材料になります。
* **論理デバイス** ―― 実際の作業単位。デバイス拡張（`VK_KHR_swapchain`）と開くキューファミリは生成時に固定されるため、これらを変えると配下の資源はすべて無効になります。
* **キュー** ―― 処理は直接実行されません。コマンドプールから確保したコマンドバッファへ記録し、キューへ投入します。
* **スワップチェーン** ―― 提示（present）はコアではなく拡張です。プラットフォーム表示面（`VkSurfaceKHR`。Windows では `HWND` から作る）を、輪番で使う複数のイメージへ変換し、その各々に専用のビューとフレームバッファが必要になります。
* **描画パス** ―― 添付の形式・load/store の挙動・レイアウト遷移を、あらかじめ宣言したもの。描画パイプラインはこれに対して焼き込まれます。
* **パイプライン** ―― 固定機能の状態のすべてとシェーダ段を、ひとつの不変オブジェクトへコンパイルしたもの。明示的に*動的*と宣言した状態（本ライブラリでは視野と切り抜き）だけが、作り直しなしに変更できます。

本ライブラリはこの連鎖をクラスへ 1 対 1 で対応させます。

| Vulkan ハンドル | クラス |
|---|---|
| `VkInstance` | `TVkDevices` |
| `VkPhysicalDevice` | `TVkDevice` |
| `VkDevice` | `TVkContex` |
| `VkQueue` ＋ `VkCommandPool` | `TVkQueuer` |
| `VkBuffer` ＋ `VkDeviceMemory` | `TVkBuffer<TValue_>` |
| `VkImage` ＋ `VkImageView` ＋ `VkDeviceMemory` | `TVkImager<TValue_>` |
| `VkSampler` | `TVkSamplr` |
| `VkShaderModule` | `TVkShader` |
| `VkPipeline`（compute）＋ 記述子まわり | `TVkKernel` |
| `VkRenderPass` | `TVkPasser` |
| `VkPipeline`（graphics）＋ `VkPipelineLayout` | `TVkRaster` |
| `VkPipelineShaderStageCreateInfo` | `TVkStager` |
| `VkSurfaceKHR` ＋ `VkSwapchainKHR` ＋ フレームバッファ | `TVkSwaper` |

クラスのツリーがハンドルの連鎖と同じ形をしているため、あるノードを解放すれば、Vulkan が「ともに破棄せよ」と定めるハンドルが、Vulkan が定める順序でちょうど破棄されます。

### 2.2 実行時のシェーダコンパイル

Vulkan が受け取るのは GLSL ではなく **SPIR-V** [3] であり、ドライバはシェーダコンパイラを内蔵していません。
そこで本ライブラリは glslang [5]（Khronos 公式のリファレンスコンパイラ。`/：KhronosGroup/glslang` に SubTree で導入済）を組み込み、**GLSL を実行時にコンパイル**します。

一方、反射は委譲**しません**。本ライブラリは SPIR-V モジュールを自前で解析して、記述子・入口関数・`local_size` を取り出します。その帰結として、ディスクから読み込んだだけの `.spv` も、いまコンパイルしたものとまったく同じように振る舞います。コンパイラを一切介さずに、同じ名前で接続できるのです（[§ 8.3](#83-glslangdll-を同梱しない配布)）。

`#include` は `GL_GOOGLE_include_directive` 拡張 [6] を通じて、コンテキストに登録された `TVkLibrar` に対して**名前で**解決されます。ファイルシステムへのアクセスも事前のテキスト展開も起こりません。

#### 2.2.1 GLSL のみをサポート

glslang は **HLSL** もコンパイルできますが、本ライブラリは **GLSL のみ**をサポートします（`TVkShader` は常に GLSL のフロントエンドを選択します）。

これは意図的なものです。glslang の HLSL フロントエンドは**非推奨であり、将来のメジャーリリースで削除されます** [7]。将来性が無いため、これを土台にはしません。
HLSL が必要な場合は、SPIR-V を直接出力できる DXC [8] を使用してください。
なお Slang [9] は glslang とは全く別のコンパイラであり、glslang には含まれません。

また、ソースの言語が**自動判別されることはありません**。GLSL と HLSL は `glslang_input_t.language` で明示的に選択します。

### 2.3 座標系と変換の連鎖

#### 2.3.1 Vulkan のクリップ空間の規約

**Vulkan のクリップ空間は OpenGL と規約が違います。** 透視除算のあとの正規化デバイス座標は次を満たします。

```math
x_{\text{ndc}} \in [-1,\,1] \;(\text{右向き}), \qquad
y_{\text{ndc}} \in [-1,\,1] \;(\textbf{下向き}), \qquad
z_{\text{ndc}} \in [\,0,\,1\,]
\tag{1}
```

Ｙの向きだけでなく、$z$ の範囲も OpenGL の $z \in [-1,1]$ とは違う ―― 座標の構造そのものが別物です。したがって `LUX.D4x4` の `TSingleM4.ProjPers` ／ `ProjOrth`（OpenGL 規約）を変換行列で無理に整合させるより、Vulkan 規約の行列を直に作るほうが素直です。

特殊なのは射影だけであり、`TVkObject.LocalPose` などは `TSingleM4` のままなので、使う側が不便になることもありません。

> ※ 「`VkViewport.height` に負の値を入れる」やり方では $y$ の向きしか直せず、$z$ の範囲は残ります。どのみち射影で面倒を見る必要があります。

#### 2.3.2 変換の連鎖

頂点は、自ノードの座標系からクリップ空間へ次のように運ばれます。

```math
\mathbf{p}_{\text{clip}} \;=\; \mathbf{P}\,\mathbf{V}\,\mathbf{M}\;\mathbf{p}_{\text{local}}
\tag{2}
```

ここで $\mathbf{M}$ はノードの大域行列、$\mathbf{V}$ は視野行列、$\mathbf{P}$ は射影行列です。大域行列は根からノードまでの経路上の局所行列の積であり、視野行列はカメラの大域行列の逆行列です。

```math
\mathbf{M} \;=\; \mathbf{L}_1 \mathbf{L}_2 \cdots \mathbf{L}_k ,
\qquad
\mathbf{V} \;=\; \mathbf{M}_{\text{camera}}^{-1}
\tag{3}
```

Vulkan には行列スタックが無いので、`TVkObject.Draw` は $\mathbf{M}$ を累積しながら引数で下へ渡します。積 $\mathbf{P}\mathbf{V}$ は描画 1 回につき一度だけカメラが求め、`TVkDrawer.ProjView` が運びます。両者は押込定数としてシェーダへ届きます。

> `GLSL`
> ```GLSL
> layout( push_constant ) uniform Push { mat4 ProjViewPose; mat4 Pose; } uPush;
> ```

行列の型は 2D / 3D に共通の `TSingleM4` です。GPU へ渡る形がこれであり、２Ｄの `TSingleM3` は暗黙変換で載ります。

#### 2.3.3 透視投影

`VkProjPers3D( SizeX_, SizeY_, FocusZ_, NeaZ_, FarZ_ )` は、$s_x \times s_y$ のスクリーンを距離 $d$ から覗き、クリップ面を $n$ と $f$ に置いた透視投影行列を作ります。

```math
\mathbf{P}_{\text{pers}} =
\begin{pmatrix}
k_x & 0    & 0   & 0        \\
0   & -k_y & 0   & 0        \\
0   & 0    & k_z & k_z\,n   \\
0   & 0    & -1  & 0
\end{pmatrix}
\tag{4}
```

```math
k_x = \frac{2d}{s_x}, \qquad
k_y = \frac{2d}{s_y}, \qquad
k_z = \frac{f}{n-f}
\tag{5}
```

カメラは $-z$ の方向を向くため $w_{\text{clip}} = -z$ が視点からの距離になります。$k_y$ を符号反転しているのが (1) のＹ下向き規約であり、$k_z$ が $z = -n \mapsto z_{\text{ndc}} = 0$、$z = -f \mapsto z_{\text{ndc}} = 1$ の対応を与えます。

#### 2.3.4 平行投影

`VkProjOrth3D( SizeX_, SizeY_, NeaZ_, FarZ_ )` は、視野をスクリーンそのものとします。

```math
\mathbf{P}_{\text{orth}} =
\begin{pmatrix}
k_x & 0    & 0   & 0      \\
0   & -k_y & 0   & 0      \\
0   & 0    & k_z & k_z\,n \\
0   & 0    & 0   & 1
\end{pmatrix},
\qquad
k_x = \frac{2}{s_x}, \;\;
k_y = \frac{2}{s_y}, \;\;
k_z = \frac{1}{n-f}
\tag{6}
```

２Ｄ層の `VkProjOrth2D( SizeX_, SizeY_ )` は 2 点で異なります。$k_y$ を符号反転**しない**こと（２Ｄの座標系はもともとＹ下向きであり、`LUX.CG2D` と揃っている）と、深度を使わないため $z_{\text{ndc}}$ を範囲の中央へ固定することです。

```math
\mathbf{P}_{\text{orth2D}} =
\begin{pmatrix}
k_x & 0   & 0 & 0            \\
0   & k_y & 0 & 0            \\
0   & 0   & 0 & \tfrac{1}{2} \\
0   & 0   & 0 & 1
\end{pmatrix}
\tag{7}
```

#### 2.3.5 視野角ではなく焦点距離

`TVkCameraPers3D` は視野角ではなく**焦点距離 `FocusZ`** を持ちます。スクリーン（$s_x \times s_y$）を距離 $d$ から覗いたときの見え方が視野です。画角 `AngleX` ／ `AngleY` はそこから導かれ、

```math
\theta_x = 2\arctan\!\frac{s_x}{2d}, \qquad
\theta_y = 2\arctan\!\frac{s_y}{2d}
\tag{8}
```

書き込むとスクリーンの大きさを保ったまま $d$ が動きます（＝ ズーム）。

#### 2.3.6 カメラと描画先の縦横比

カメラの視野は `SizeX` ／ `SizeY` だけで決まり、描画先はＵＩの都合で自由に変形します。**射影は描画先の縦横比の影響を受けません**。両者の差は、描画側がビューポートをレターボックスにして吸収します。

```pascal
V := VkFitViewport( _Camera.SizeX, _Camera.SizeY, DstX, DstY );  // 中央へ最大の大きさで収める
```

$w_d \times h_d$ 画素の描画先に対して、ビューポートはカメラの縦横比をもつ最大の矩形を中央へ寄せたものになります。

```math
(w,\,h) =
\begin{cases}
\left( h_d\,\dfrac{s_x}{s_y}, \;\; h_d \right) & (w_d\,s_y > h_d\,s_x \;\text{のとき、描画先のほうが横長}) \\[8pt]
\left( w_d, \;\; w_d\,\dfrac{s_y}{s_x} \right) & (\text{それ以外})
\end{cases}
\qquad
(x,\,y) = \left( \frac{w_d-w}{2}, \;\; \frac{h_d-h}{2} \right)
\tag{9}
```

余白の塗り分けは要りません。描画パスは**描画先いっぱい**を背景色で塗り、シザーもそのままなので、ビューポートの外側には背景色が残ります。カメラの縦横比が描画先と一致していれば余白は生じません。

----
## 3. アーキテクチャ

### 3.1 ファイル構成

```
・LUX.Vulkan/
  ┣・LUX.Vulkan.pas                             ･･･ /Core の具象別名
  ┣・Vulkan/                                    ･･･ 公式 C ヘッダの Delphi 訳
  ┃  ┣・vk_platform.pas                        ･･･ プラットフォーム固有型
  ┃  ┣・vulkan_core.pas                        ･･･ API 1.0-1.4 ＋ 全拡張
  ┃  ┣・vulkan_win32.pas                       ･･･ Win32 の全ブロック
  ┃  ┣・vulkan_functions.pas                   ･･･ 入口の動的ロード
  ┃  ┗・vk_video/                              ･･･ 映像コーデックの規格型
  ┣・Glslang/                                   ･･･ コンパイラのバインディング
  ┃  ┣・glslang_c_shader_types.pas             ･･･ 列挙型
  ┃  ┣・glslang_c_interface.pas                ･･･ DefaultTBuiltInResource
  ┃  ┗・glslang_functions.pas                  ･･･ glslang.dll を動的ロード
  ┣・Core/                                      ･･･ 核（すべてジェネリック）
  ┃  ┣・LUX.Vulkan.core.pas                    ･･･ TVkVersion・EVkError ほか
  ┃  ┣・LUX.Vulkan.Device.pas                  ･･･ TVkDevices ／ TVkDevice
  ┃  ┣・LUX.Vulkan.Contex.pas                  ･･･ TVkContexs ／ TVkContex
  ┃  ┣・LUX.Vulkan.Queuer.pas                  ･･･ TVkQueuers ／ TVkQueuer
  ┃  ┣・LUX.Vulkan.Argume*.pas                 ･･･ バッファ・画像・サンプラ
  ┃  ┣・LUX.Vulkan.Shader.pas                  ･･･ SPIR-V の反射
  ┃  ┣・LUX.Vulkan.Kernel.pas                  ･･･ TVkKernel ／ TVkParame ほか
  ┃  ┣・LUX.Vulkan.Passer.pas                  ･･･ TVkPasser（VkRenderPass）
  ┃  ┣・LUX.Vulkan.Raster.pas                  ･･･ TVkRaster ／ TVkStager
  ┃  ┗・LUX.Vulkan.Show.pas                    ･･･ システム情報の診断用ダンプ
  ┣・Graphics/                                  ･･･ シーングラフ＋ラスタライザ
  ┃  ┣・LUX.Vulkan.Graphics.pas                ･･･ TVkObject ／ TVkShaper ほか
  ┃  ┣・LUX.Vulkan.Graphics.Swaper.pas         ･･･ TVkSwaper（swapchain）
  ┃  ┣・LUX.Vulkan.Render.pas                  ･･･ TVkRender（オフスクリーン）
  ┃  ┣・LUX.Vulkan.Viewer.pas ／ .fmx          ･･･ TVkViewer（画面上。TFrame）
  ┃  ┣・3D/
  ┃  ┃  ┣・LUX.Vulkan.Graphics.D3.pas         ･･･ ３Ｄ層＋VkProj{Pers,Orth}3D
  ┃  ┃  ┗・LUX.Vulkan.Graphics.D3.Shapers.pas ･･･ TVkCube3D
  ┃  ┗・2D/
  ┃     ┗・LUX.Vulkan.Graphics.D2.pas          ･･･ ２Ｄ層 ＋ VkProjOrth2D
  ┣・Stream/                                    ･･･ TVkImager ⇄ TBitmap
  ┃  ┣・LUX.Vulkan.Stream.FMX.D1.pas
  ┃  ┗・LUX.Vulkan.Stream.FMX.D2.pas
  ┣・_DLL/                                      ･･･ ビルド済 glslang.dll
  ┗・：KhronosGroup/                            ･･･ 上流ソース。SubTree で導入
     ┣・Vulkan-Headers/                         ･･･ [4]
     ┗・glslang/                                ･･･ [5]
```

#### 3.1.1 `/Vulkan` ：インポートライブラリ

公式 C ヘッダ（Vulkan-Headers [4]。`/：KhronosGroup` に SubTree で導入済）から生成した Delphi 訳。

**移植したヘッダについては、その全内容を漏れなく収録しています。** `vulkan_core.h` の 438 フィーチャーブロック（コア 1.0〜1.4 の 5 個 ＋ 拡張 433 個）と `vulkan_win32.h` の 9 ブロックが対象で、デモで使わない API も含めてすべて翻訳済みです。`vulkan_core.h` が `#include` している `vk_video/` の 12 ヘッダも同じ理由で収録してあります。なお `include/vulkan/` の残りのヘッダ（他プラットフォームの surface 等）は移植していません。

命名は機械的な規約に従います。
C の型 `VkFoo` → `T_VkFoo` ／ ポインタ `P_VkFoo` ／ 関数型 `PFN_vkFoo` → `T_PFN_vkFoo`。
定数（`VK_...`）は元の名前のままです。
C のビットフィールドは 32 ビットの格納語へ畳み、名前つきプロパティで読み書きします（`vk_video/` のみ）。

入口の取得は 3 段階です。`LoadFunctions` が `vulkan-1.dll` の公開シンボル（コア＋一部の WSI）を取り、`LoadInstanceFunctions( instance )` が `vkGetInstanceProcAddr` 経由で拡張を含む全入口を埋め、`LoadDeviceFunctions( device )` が `vkGetDeviceProcAddr` でデバイス階層を取り直します。**拡張の関数は DLL から公開されていないので、拡張を使うには 2 段目が必須です。**

#### 3.1.2 `/Glslang` ：GLSL コンパイラ

glslang [5] へのバインディングです。そもそもコンパイラが必要な理由は [§ 2.2](#22-実行時のシェーダコンパイル)、配布すべきものは [§ 8.2](#82-シェーダのコンパイルと-glslangdll) を参照してください。

#### 3.1.3 `/Core` ＋ `LUX.Vulkan.pas` ：クラスライブラリの核

デバイス・キュー・メモリ・シェーダ・演算パイプラインから、描画パス・ラスタライズパイプラインまで ―― Vulkan ハンドルを包むクラスの全部です。
すべてジェネリッククラスとして書かれており、`LUX.Vulkan.pas` が `TVkSystem` を頂点として実体化した具象別名を公開します。**利用側が使うのはこの具象別名**です（[§ 3.3](#33-ジェネリック層と具象別名)）。

#### 3.1.4 `/Graphics` ：シーングラフ ＋ ラスタライザ

スワップチェーンと、その上のシーングラフ、2 種類の描画先です。
`/Core` と違いジェネリックではなく、`LUX.Vulkan.pas` の具象型を直に使います（`/Stream` と同じ方針）。

#### 3.1.5 `/Stream` ：FMX ストリーム

`TVkImager` と FireMonkey の `TBitmap` の間で画像をコピーします。

### 3.2 クラスの継承関係

`（G）` はジェネリックです。`LUX.Vulkan.pas` が公開する具象別名は同じ名前を持ちます。

```
・TObject
  ┣・TVkSystem                             ･･･ システム（TVulkan が保持）
  ┣・TVulkan                               ･･･ TVkSystem のシングルトン
  ┃
  ┣・TListParent
  ┃  ┗・TListParent<>
  ┃     ┣・TVkDevices（G）                ･･･ 物理デバイスリスト
  ┃     ┣・TVkContexs（G）                ･･･ コンテキストリスト
  ┃     ┣・TVkQueuers（G）                ･･･ キューリスト
  ┃     ┣・TVkArgumes（G）                ･･･ 実引数リスト
  ┃     ┣・TVkLibrars（G）                ･･･ ライブラリリスト
  ┃     ┣・TVkShaders（G）                ･･･ シェーダリスト
  ┃     ┣・TVkKernels（G）                ･･･ カーネルリスト
  ┃     ┣・TVkParames（G）                ･･･ 仮引数リスト
  ┃     ┣・TVkPassers（G）                ･･･ 描画パスリスト
  ┃     ┣・TVkRasters（G）                ･･･ パイプラインリスト
  ┃     ┗・TVkStagers（G）                ･･･ シェーダ段リスト
  ┃
  ┣・TListChildr
  ┃  ┗・TListChildr<>
  ┃     ┣・TVkDevice（G）                 ･･･ 物理デバイス
  ┃     ┣・TVkContex（G）                 ･･･ コンテキスト（論理デバイス）
  ┃     ┣・TVkQueuer（G）                 ･･･ キュー
  ┃     ┣・TVkArgume（G）                 ･･･ 実引数の基底
  ┃     ┃  ┣・TVkSamplr（G）             ･･･ サンプラー
  ┃     ┃  ┗・TVkMemory（G）             ･･･ メモリを持つ実引数の基底
  ┃     ┃     ┣・TVkBuffer<TValue_>（G） ･･･ バッファ
  ┃     ┃     ┗・TVkImager<TValue_>（G） ･･･ イメージ
  ┃     ┃        ┗・TVkImager1D<TValue_>
  ┃     ┃           ┗・TVkImager2D<TValue_>
  ┃     ┃              ┗・TVkImager3D<TValue_>
  ┃     ┣・TVkLibrar（G）                 ･･･ GLSL ライブラリ
  ┃     ┣・TVkShader（G）                 ･･･ シェーダモジュール
  ┃     ┣・TVkKernel（G）                 ･･･ 演算パイプライン
  ┃     ┣・TVkParame（G）                 ･･･ 仮引数
  ┃     ┣・TVkPasser（G）                 ･･･ 描画パス
  ┃     ┣・TVkRaster（G）                 ･･･ ラスタライズパイプライン
  ┃     ┃  ┣・TVkRaster2D                ･･･ ２Ｄ用（頂点配置等を設定済み）
  ┃     ┃  ┗・TVkRaster3D                ･･･ ３Ｄ用（同）
  ┃     ┗・TVkStager（G）                 ･･･ シェーダの 1 段
  ┃
  ┣・TVkMemDat（G）                        ･･･ メモリのマップ（ホスト側の窓）
  ┃  ┣・TVkBufDat<TValue_>（G）           ･･･ バッファのマップ
  ┃  ┗・TVkImaDat<TValue_>（G）           ･･･ イメージのマップ
  ┃     ┗・TVkImaDat1D
  ┃        ┗・TVkImaDat2D
  ┃           ┗・TVkImaDat3D
  ┃
  ┣・TVkBinary（G）                        ･･･ SPIR-V バイナリ
  ┣・TStringList
  ┃  ┣・TVkSource（G）                    ･･･ シェーダの GLSL ソース
  ┃  ┗・TVkLibSrc（G）                    ･･･ ライブラリの GLSL ソース
  ┣・Exception
  ┃  ┗・EVkError                          ･･･ Vulkan のエラー
  ┃
  ┣・TVkSwaper                             ･･･ 表示面 ＋ スワップチェーン
  ┣・TVkDrawer                             ･･･ 描画 1 回分の状態
  ┣・TVkRender                             ･･･ オフラインレンダラ
  ┃
  ┣・TTreeKnot<>
  ┃  ┗・TVkObject                         ･･･ シーンのノード（中間節も可）
  ┃     ┣・TVkShaper                      ･･･ 描画の実体を持つノード
  ┃     ┃  ┣・TVkShaper2D
  ┃     ┃  ┗・TVkShaper3D
  ┃     ┃     ┗・TVkCube3D               ･･･ 直方体
  ┃     ┣・TVkCamera                      ･･･ 視点
  ┃     ┃  ┣・TVkCamera2D
  ┃     ┃  ┗・TVkCamera3D
  ┃     ┃     ┣・TVkCameraPers3D         ･･･ 透視投影
  ┃     ┃     ┗・TVkCameraOrth3D         ･･･ 平行投影
  ┃     ┗・TVkScener                      ･･･ シーンの根（次元共通）
  ┃
  ┣・TInterfacedObject
  ┃  ┗・TVkStream1D_FMX<>
  ┃     ┗・TVkStream2D_FMX<>              ･･･ FMX ストリーム
  ┗・TFrame
     ┗・TVkViewer                          ･･･ 表示窓
```

### 3.3 ジェネリック層と具象別名

具象別名（`LUX.Vulkan.pas`）は、連鎖に沿って型引数を固定したものです。

```
・TVkSystem
  ┗・TVkDevices
     ┗・TVkDevice
        ┗・TVkContexs
           ┗・TVkContex
              ┗・…
```

| ジェネリック | 具象別名 |
|---|---|
| `TVkDevices<TVkSystem>` | `TVkDevices` |
| `TVkDevice<TVkSystem>` | `TVkDevice` |
| `TVkContexs<TVkSystem,TVkDevice>` | `TVkContexs` |
| `TVkContex<TVkSystem,TVkDevice>` | `TVkContex` |
| `TVkQueuers` ／ `TVkQueuer` ／ `TVkArgumes` ／ `TVkArgume` ／ `TVkSamplr` ／ `TVkMemory` | 同名 |
| `TVkLibrars` ／ `TVkLibrar` ／ `TVkShaders` ／ `TVkShader` | 同名 |
| `TVkKernels` ／ `TVkKernel` ／ `TVkParames` ／ `TVkParame` | 同名 |
| `TVkPassers` ／ `TVkPasser` ／ `TVkRasters` ／ `TVkRaster` ／ `TVkStagers` ／ `TVkStager` | 同名 |
| `TVkBuffer<TVkSystem,TVkDevice,TVkContex,TValue_>` | `TVkBuffer<TValue_>` |
| `TVkImager{1,2,3}Dx{BGRAxUInt8,BGRAxUFix8,RGBAxUInt32,RGBAxSFlo32}` | 同名（計 12 種） |

### 3.4 所有関係とデータの流れ

**Free するとその部分木ごと解放されます。** リストは自分の子を所有し、子は自分の下位資源を所有します。

```
・TVulkan（クラス。プログラム終了時に解放）
  ┗・TVkSystem
     ┗・TVkDevices                            ･･･ VkInstance
        ┗・TVkDevice                          ･･･ VkPhysicalDevice（列挙のみ）
           ┗・TVkContexs
              ┗・TVkContex                    ･･･ VkDevice
                 ┣・TVkQueuers
                 ┃  ┗・TVkQueuer             ･･･ VkQueue ＋ VkCommandPool
                 ┣・TVkArgumes
                 ┃  ┣・TVkSamplr             ･･･ VkSampler
                 ┃  ┣・TVkBuffer             ･･･ VkBuffer ＋ VkDeviceMemory
                 ┃  ┃  ┗・TVkBufDat         ･･･ マップされたポインタ
                 ┃  ┗・TVkImager             ･･･ VkImage・ビュー・メモリほか
                 ┃     ┗・TVkImaDat          ･･･ マップされたポインタ
                 ┣・TVkLibrars
                 ┃  ┗・TVkLibrar
                 ┃     ┗・TVkLibSrc          ･･･ GLSL ソース
                 ┣・TVkShaders
                 ┃  ┗・TVkShader             ･･･ VkShaderModule
                 ┃     ┣・TVkSource          ･･･ GLSL ソース
                 ┃     ┣・TVkBinary          ･･･ SPIR-V
                 ┃     ┗・TVkKernels
                 ┃        ┗・TVkKernel       ･･･ パイプライン＋デスクリプタ
                 ┃           ┗・TVkParames
                 ┃              ┗・TVkParame ･･･ → TVkArgume（参照のみ）
                 ┣・TVkPassers
                 ┃  ┗・TVkPasser             ･･･ VkRenderPass
                 ┗・TVkRasters
                    ┗・TVkRaster              ･･･ VkPipeline ＋ レイアウト
                       ┣・TVkStagers
                       ┃  ┗・TVkStager       ･･･ → TVkShader（参照のみ）
                       ┗・Passer              ･･･ → TVkPasser（参照のみ）
```

画面側（スワップチェーン・描画先・シーングラフ）は**呼び出し側の所有物**です。コンテキストを参照するだけなので、`TVkContex` より先に解放してください。

```
・TVkSwaper             ･･･ 表示面 ＋ swapchain ＋ FB ＋ 深度 ＋ セマフォ

・TVkRender
  ┣・TVkPasser（Contex の子。生成と解放は担う）
  ┣・TVkTarget2D（同） ･･･ 色添付。TVkImager2DxBGRAxUFix8 の派生
  ┣・深度（VkImage ＋ VkImageView ＋ VkDeviceMemory）
  ┣・VkFramebuffer
  ┗・Camera            ･･･ → TVkCamera（参照のみ）

・TVkViewer（TFrame）
  ┣・子 HWND（WS_CHILD）
  ┣・TVkPasser（Contex の子。生成と解放は担う）
  ┣・TVkSwaper（所有）
  ┣・TVkRender（所有。Direct = False のときだけ生成）
  ┗・Camera            ･･･ → TVkCamera（参照のみ）
```

シーングラフはノードの木です。`Free` で部分木ごと解放されます。

```
・TVkScener（根。親には所属できない）
  ┗・TVkObject
     ┣・TVkObject（入れ子）
     ┣・TVkShaper       ･･･ → Raster：TVkRaster（参照のみ）
     ┃  ┗・TVkShaper3D ･･･ TVkVerBuf3D ＋ TVkIndBuf3D（所有）
     ┗・TVkCamera
```

描画は所有関係とは逆向きに流れます。描画先がコマンドバッファを開いて `TVkDrawer` を用意し、それをカメラへ渡します。カメラは $\mathbf{P}\mathbf{V}$ を組み立て、木を辿ります。

```
[ 描画の流れ ]
・TVkRender ／ TVkViewer（描画先）
  ┗・BeginFrame → VkRecordScene
     ┗・TVkDrawer（Comman ＋ Passer ＋ ProjView）
        ┗・Camera.Render
           ┗・TVkScener
              ┗・TVkObject
                 ┗・…
                    ┗・TVkShaper.DrawMain
                       ┗・Drawer.BindRaster( Raster )
                          ┗・TVkRaster
                             ┗・VkCmdDraw* → コマンドバッファへ
```

### 3.5 レコード・列挙・例外

| 型 | 意味 |
|---|---|
| `TVkVersion` | Vulkan のバージョン。`Major` ／ `Minor` ／ `Patch` ／ `ToString` |
| `TVkNames` | 文字列配列を C の `char*` 配列として渡す保持箱（`ppEnabled*Names` 用） |
| `TVkMapMode` ／ `TVkMapModes` | マップの用途（`Read` ／ `Write`）。イメージの転送方向を決める |
| `TVkBinding` | SPIR-V の反射で得た記述子情報（`Name` ／ `DescSet` ／ `Binding` ／ `DescriTyp`） |
| `TVkSpirTyp` ／ `TVkSpirVar` | SPIR-V 解析の中間情報（内部用） |
| `TVkHeders` | `#include` 解決用の「ヘッダ名 → GLSL」辞書 |
| `TLoop3D` | 演算のループ回数（X ／ Y ／ Z） |
| `TVkVertex2D` ／ `TVkVertex3D` | 標準の頂点（16 ／ 32 バイト） |
| `TVkIndex2D` ／ `TVkIndex3D` | 添字（`T_uint32_t` を包んだレコード） |
| `TVkPush2D` ／ `TVkPush3D` | 押込定数（ともに 128 バイト） |
| `EVkError` | Vulkan のエラー。`Code` に `T_VkResult` を持つ |

----
## 4. API リファレンス

### 4.1 システムとデバイス

#### 4.1.1 `TVulkan`
`TVkSystem` のシングルトンです。実体を意識せずに使えるよう、すべて class メンバです。ユニット初期化時に `vulkan-1.dll` をロードし、`VkInstance` を作って物理デバイスを列挙します。

| メンバ | 意味 |
|---|---|
| `Available :Boolean` | `vulkan-1.dll` が使えるか |
| `Devices :TVkDevices` | 物理デバイスのリスト |
| `Show( Strings_ )` | システム情報を `TStrings` へ書き出す（診断用） |

#### 4.1.2 `TVkSystem`
ツリーの頂点。`Devices` を所有するだけの入れ物です。ジェネリック層の型引数 `TVkSystem_` を具体化する役でもあります。

#### 4.1.3 `TVkDevices` ── VkInstance
物理デバイスのリストであり、**`VkInstance` の持ち主**でもあります。最初に触れたときにインスタンスを生成し、続けて物理デバイスを列挙して `TVkDevice` を並べます。

| メンバ | 意味 |
|---|---|
| `Handle :T_VkInstance` | `VkInstance`（遅延生成） |
| `Childrs[ I ]` ／ `Count` | 物理デバイス |
| `AvailExtens :TArray<String>` | この環境が対応するインスタンス拡張 |
| `UsingExtens :TArray<String>` | 実際に有効化する拡張。既定は `VK_KHR_surface` ＋ `VK_KHR_win32_surface` のうち対応するもの |

> ※ インスタンスは `TVulkan` の初期化時に生成されるため、外から拡張を足す余地はありません。必要なら `UsingExtens` を override してください。

#### 4.1.4 `TVkDevice` ── VkPhysicalDevice
物理デバイス（GPU）です。ハンドルは列挙で得るだけで、生成も破棄もしません。

| メンバ | 意味 |
|---|---|
| `Handle :T_VkPhysicalDevice` | 物理デバイス |
| `DEVICE_NAME` ／ `DEVICE_TYPE` ／ `VENDOR_ID` ／ `DEVICE_ID` | 識別情報 |
| `API_VERSION` ／ `DRIVER_VERSION` :TVkVersion | バージョン |
| `Propers` ／ `Feature` ／ `MemProp` ／ `Familys` | Vulkan の問い合わせ結果をそのまま返す |
| `Contexs :TVkContexs` | このデバイス上のコンテキスト |
| `FamilyByFlags( Flags_ )` | 能力を満たすキューファミリの番号（無ければ −1） |
| `MemoryByFlags( TypeBits_, Flags_ )` | 条件を満たすメモリタイプの番号（同） |
| `AvailExtens` | このデバイスが対応するデバイス拡張 |

#### 4.1.5 `TVkContex` ── VkDevice
「**コンテキスト**」＝ 論理デバイスです。以下のすべての資源の持ち主であり、実質的な作業単位になります。

| メンバ | 意味 |
|---|---|
| `Handle :T_VkDevice` | 論理デバイス（遅延生成） |
| `QueFlags :T_VkQueueFlags` | 要求するキューの能力。既定は `GRAPHICS or COMPUTE` |
| `Extens :TArray<String>` | 追加で有効化するデバイス拡張 |
| `UsingExtens` | 実際に有効化する拡張。`VK_KHR_swapchain` は常に試みる |
| `FamilyI :Integer` | 選ばれたキューファミリの番号 |
| `Queuers` ／ `Argumes` ／ `Librars` ／ `Shaders` ／ `Passers` ／ `Rasters` | 配下の各リスト |
| `FreeHandle` | 論理デバイスを破棄する |

`QueFlags` を満たすファミリが無ければ、演算のみ → 描画のみ、の順に能力を落として探し直します。したがって演算専用デバイスでもそのまま動きます。
`QueFlags` と `Extens` は **`Handle` の生成前にのみ**設定できます（生成後の変更は配下の資源をすべて無効にするため例外）。

#### 4.1.6 `TVkQueuer` ── VkQueue ＋ VkCommandPool
「**キュー**」です。コマンドバッファの発行と実行を受け持ちます。

| メンバ | 意味 |
|---|---|
| `Handle :T_VkQueue` | キュー |
| `Pooler :T_VkCommandPool` | コマンドプール（遅延生成） |
| `BeginCommand :T_VkCommandBuffer` | 使い捨てのコマンドバッファを確保して記録を開始する |
| `EndCommand( C )` | 記録を終え、投入し、**完了まで待って**解放する |

### 4.2 実引数（シェーダへ渡すもの）

#### 4.2.1 `TVkArgume`（基底）
記述子へ接続できるものの基底です。`TVkParame.Bind` が記述子タイプに応じて `BuffeH` ／ `ViewrH` ／ `SamplH` のいずれかを取りに来ます。派生クラスは自分に該当するものだけを override します。
`PreRun` は実行直前に呼ばれ、イメージのレイアウト遷移などの下準備を行います。

#### 4.2.2 `TVkSamplr` ── VkSampler
サンプラーです。補間（線形）と繰り返し（ミラー）を定義します。設定項目は現状固定です。

#### 4.2.3 `TVkMemory`（基底）／ `TVkMemDat`
`VkDeviceMemory` を伴う実引数の基底と、そのホスト側の窓です。

`TVkMemDat` は「マップ」を表します。`Handle` に初めて触れたときにマップし、`nil` を代入するとアンマップします。`Map` ／ `Unmap` はその別名です。`Mode`（`Read` ／ `Write`）はイメージの場合に転送方向を決めます。

#### 4.2.4 `TVkBuffer<TValue_>` ── VkBuffer
任意のレコード型の配列を、ホストから見えるバッファに置きます。

| メンバ | 意味 |
|---|---|
| `Count :Integer` | 要素数（変更するとバッファを作り直す） |
| `Data :TVkBufDat` | マップ。`Data[ I ]` で要素を読み書きする |
| `Handle :T_VkBuffer` | バッファ（遅延生成） |
| `GetUsage`（virtual） | 用途フラグ。既定は STORAGE ／ UNIFORM ／ TRANSFER_SRC ／ TRANSFER_DST |

頂点バッファや添字バッファは、`GetUsage` を override してフラグを足した派生（`TVkVerBuf3D` ／ `TVkIndBuf3D`、および `TVkVerBuf2D` ／ `TVkIndBuf2D`）を使います。

#### 4.2.5 `TVkImager<TValue_>` ── VkImage ＋ VkImageView
1D 〜 3D の画素配列です。イメージ本体はデバイス専用メモリ（OPTIMAL タイリング）に置き、ホストとの転送は**常駐のステージングバッファ**を介します。`Data.Map` でイメージ → ホスト、`Data.Unmap` でホスト → イメージへコピーし、レイアウト遷移も自動で行います。

| メンバ | 意味 |
|---|---|
| `CountX` ／ `CountY` ／ `CountZ` | 画素数（次元ごとの派生が実体を持つ） |
| `Data :TVkImaDat` | マップ。`Data[ X, Y ]` などで画素を読み書きする |
| `Handle` ／ `Viewer` | `VkImage` ／ `VkImageView` |
| `Layout :T_VkImageLayout` | いま記録しているレイアウト |
| `Usage`（virtual） | 用途フラグ。既定は SAMPLED ／ STORAGE ／ TRANSFER_SRC ／ TRANSFER_DST |
| `TransitionTo( C, L )` | 障壁を張ってレイアウトを遷移させる |
| `AssumeLayout( L )` | 障壁を張らずに記録だけ書き換える（描画パスが遷移させた結果を教える） |

具象クラスは `TVkImager{次元}x{並び}x{型}` の命名です。

| クラス | VkFormat |
|---|---|
| `TVkImager2DxBGRAxUInt8` | `VK_FORMAT_B8G8R8A8_UINT` |
| `TVkImager2DxBGRAxUFix8` | `VK_FORMAT_B8G8R8A8_UNORM` |
| `TVkImager2DxRGBAxUInt32` | `VK_FORMAT_R32G32B32A32_UINT` |
| `TVkImager2DxRGBAxSFlo32` | `VK_FORMAT_R32G32B32A32_SFLOAT` |

（1D ／ 3D も同じ 4 形式。計 12 クラス）

### 4.3 シェーダ

#### 4.3.1 `TVkLibrar` ／ `TVkLibSrc`
シェーダから `#include` される GLSL ソースです。コンパイル時に**名前で**解決されるため、ファイルシステムへのアクセスも事前のテキスト展開も起こりません。`Source.LoadFromFile` するとファイル名が `Name` になります。

#### 4.3.2 `TVkShader` ── VkShaderModule
**シェーダモジュールそのもの**です。したがって 1 個につき 1 段（頂点／フラグメント／演算 …）です。

| メンバ | 意味 |
|---|---|
| `Stage :T_glslang_stage_t` | 段の種別。既定は `GLSLANG_STAGE_COMPUTE` |
| `Source :TVkSource` | GLSL ソース。編集すると再コンパイルを要求する |
| `Binary :TVkBinary` | SPIR-V。読み書きできるので `.spv` の入出力も可能 |
| `Handle :T_VkShaderModule` | モジュール（遅延生成。必要なら実行時コンパイルが走る） |
| `CompileOK` ／ `CompileLog` | コンパイルの成否とログ。`.spv` を直接与えた場合（コンパイルを通らない）も `True` |
| `Bindins :TArray<TVkBinding>` | 反射で得た記述子の一覧 |
| `Entrys :TArray<String>` | 反射で得た入口関数の名前 |
| `LocalX` ／ `LocalY` ／ `LocalZ` | 反射で得た `local_size` |
| `Kernels :TVkKernels` | このモジュールから作った演算パイプライン |

SPIR-V の**反射は自前**です（`glslang` に依存しません）。`.spv` を読み込んだだけの場合でも同じように働きます。

#### 4.3.3 `TVkBinary`
SPIR-V バイナリ。`LoadFromFile` ／ `SaveToFile` ／ `LoadFromStream` ／ `SaveToStream` を持ちます。`SaveTo*` は未コンパイルなら先に GLSL からコンパイルします。

### 4.4 演算（コンピュート）

#### 4.4.1 `TVkKernel` ── VkPipeline（compute）
「**カーネル**」＝ 演算パイプラインです。シェーダの反射から、記述子セットレイアウト・パイプラインレイアウト・記述子プール・記述子セットを内部で作ります。

| メンバ | 意味 |
|---|---|
| `Name :String` | 入口関数の名前 |
| `Queuer :TVkQueuer` | 実行に使うキュー |
| `Parames :TVkParames` | 仮引数（名前で実引数を接続する） |
| `GloSizX` ／ `GloSizY` ／ `GloSizZ` | 呼び出し回数 |
| `GloDimN` | 実質的な次元数 |
| `Run` | ディスパッチして完了まで待つ |

ワークグループ数は `GloSiz*` とシェーダの `local_size` から自動的に計算されます。

> ※ `vkCmdDispatch` には**オフセット引数がありません**。OpenCL の `GloMin*`（global_work_offset）に相当する機能は Vulkan には無いため、本クラスも持ちません。オフセットが要る場合は、押込定数などでシェーダへ渡してください。

シェーダが未コンパイル（GLSL のコンパイル失敗、SPIR-V 未設定など）なら、空のモジュールをドライバへ渡さずにパイプラインの生成を打ち切ります。原因は `Shader.CompileLog` を参照してください。描画側の `TVkRaster` も `BuildOK` ／ `BuildLog` で同じように振る舞います。

#### 4.4.2 `TVkParames` ／ `TVkParame`
仮引数のリストと、その 1 個です。`Parames['名前'] := 実引数` で接続します。

| メンバ | 意味 |
|---|---|
| `Argumes[ Name ]`（既定） | 名前で実引数を読み書きする |
| `FindsOK :Boolean` | 反射で得た記述子がすべて仮引数と照合できたか |
| `BindsOK :Boolean` | 実引数がすべて記述子へ書き込めたか |

### 4.5 描画の土台

#### 4.5.1 `TVkPasser` ── VkRenderPass
「色添付 1 枚 ＋ 深度添付 1 枚、サブパス 1 個」という最も基本的な描画パスです。

| メンバ | 意味 |
|---|---|
| `ColorForm :T_VkFormat` | 色添付の形式。既定は `B8G8R8A8_UNORM` |
| `DepthForm :T_VkFormat` | 深度添付の形式。`UNDEFINED` なら深度なし |
| `ColorLast :T_VkImageLayout` | 色添付の最終レイアウト。オフスクリーンは `TRANSFER_SRC_OPTIMAL`、表示窓は `PRESENT_SRC_KHR` |
| `DepthOK :Boolean` | 深度添付を持つか |

添付は毎フレーム消去する前提（`loadOp = CLEAR`、`initialLayout = UNDEFINED`）です。
Vulkan のパイプラインは「互換な」描画パスとの間で使い回せます。互換性の条件は添付の**形式とサンプル数の一致だけ**で、レイアウトや `loadOp` は問われません。よって形式さえ揃っていれば、ひとつの `TVkRaster` をオフスクリーンと表示窓の両方で共有できます。

#### 4.5.2 `TVkRaster` ── VkPipeline（graphics）＋ VkPipelineLayout
「**ラスタライズパイプライン**」です。`TVkKernel` の描画版にあたります。
描画パイプラインは*複数*のシェーダモジュールを束ねるため、単一の `TVkShader` の子には置けません。代わりに `TVkContex` の子（`Contex.Rasters`）となり、モジュールを `TVkStager` として集めます。

| メンバ | 意味 |
|---|---|
| `Stagers :TVkStagers` | シェーダの段。`Stagers.Add( Shader, Entry )` で追加 |
| `Passer :TVkPasser` | 属する描画パス。未設定なら描画側が最初の描画時に代入する |
| `Bindins` ／ `Attribs` | 頂点バッファの束ね方と頂点属性の配置（Vulkan の構造体そのまま） |
| `AddBindin` ／ `AddAttrib` | 上記への素直な追加 |
| `SetLayouts` | 記述子セットレイアウト（既定は無し） |
| `PushSize` ／ `PushFlags` | 押込定数のバイト数と、それを読む段 |
| `Topology` ／ `PolyMode` ／ `CullMode` ／ `FrontFace` ／ `LineWidth` | 組み立てとラスタライズ |
| `DepthTest` ／ `DepthWrit` ／ `DepthOper` ／ `BlendOK` | 深度と合成 |
| `Handle` ／ `Layout` | パイプラインとパイプラインレイアウト（遅延生成） |
| `BuildOK` ／ `BuildLog` | 全段のコンパイルの成否とログ |

いずれの属性も、変更するとパイプラインを遅延して作り直します。
視野（viewport）と切り抜き（scissor）は常に**動的状態**なので、描画先の大きさが変わっても作り直しは起こりません。

#### 4.5.3 `TVkStager`
パイプラインの 1 段（`VkPipelineShaderStageCreateInfo`）です。`Shader`（＝ `VkShaderModule`）と入口名 `Entry` の組を持ちます。段の種別 `Flags` は `Shader.Stage` から機械的に導かれるので、二重に指定する必要はありません。

#### 4.5.4 `TVkSwaper` ── VkSurfaceKHR ＋ VkSwapchainKHR
ウィンドウハンドル（`HWND`）を Vulkan の表示先に変えます。UI 非依存なので、ウィンドウを持つ枠組みなら何にでも繋げられます。

| メンバ | 意味 |
|---|---|
| `Resize( X, Y )` | 望む大きさを与える（変われば作り直す） |
| `Ready :Boolean` | 描けるか（最小化中などは `False`） |
| `BeginFrame( out Comman_ )` | イメージを取得してコマンドの記録を始める |
| `Framer :T_VkFramebuffer` | いま取得しているフレームバッファ |
| `EndFrame` | 投入 → 提示 → キューの待機 |
| `SizeX` ／ `SizeY` ／ `Format` | スワップチェーンの実際の大きさと形式 |

同期は 1 フレーム完結（frames-in-flight ＝ 1）です。取得完了と描画完了をセマフォで繋ぎ、最後にキューを待つので、コマンドバッファもセマフォも次フレームで再利用できます。
`VK_ERROR_OUT_OF_DATE_KHR` ／ `VK_SUBOPTIMAL_KHR` は再構築の合図として扱います。

### 4.6 シーングラフ

#### 4.6.1 `TVkObject`
ノードです。親も子も自型（`TTreeKnot<TVkObject,TVkObject>`）なので、互いに自由にジョイントできます。

| メンバ | 意味 |
|---|---|
| `LocalPose :TSingleM4` | 局所行列（親ノード座標系 ← 自ノード座標系） |
| `GlobalPose :TSingleM4` | 大域行列（＝ 先祖の局所行列の積） |
| `Visible :Boolean` | 描くか（部分木ごと隠れる） |
| `Raster :TVkRaster` | 描画に使うパイプライン。`nil` なら親を遡って解決される |
| `Scene` ／ `Contex` ／ `Queuer` | 属すシーンと、そのコンテキスト・キュー |
| `Changed` | 変更を根まで伝える |
| `Draw( Drawer_, Pose_ )` | 行列を累積しながら部分木を描く |

行列の型は 2D / 3D に共通の `TSingleM4` です。GPU へ渡る形がこれであり、２Ｄの `TSingleM3` は暗黙変換で載ります。
Vulkan には行列スタックが無いので、`Draw` は累積した行列を引数で下へ渡します（[§ 2.3.2](#232-変換の連鎖)）。

#### 4.6.2 `TVkShaper`
描画の実体を持つノードの基底です。局所行列を自前で持ちます。実際の描画コマンドは、次元ごとの派生が `DrawMain` で発行します。

#### 4.6.3 `TVkCamera`
視点のノードです。自分では何も描きません。姿勢は先祖の積（`GlobalPose`）で決まります。

| メンバ | 意味 |
|---|---|
| `SizeX` ／ `SizeY` | スクリーンの実寸（既定 2 × 2）。縦横比はここから決まる |
| `NeaZ` ／ `FarZ` | 前後のクリップ面 |
| `ProjMat` | 射影行列（派生が与える）。引数を取らない |
| `ViewMat` | 視野行列（＝ `GlobalPose.Inverse`） |
| `Render( Drawer_ )` | 射影 × 視野を用意してシーンを描く |
| `OnScene :TDelegates` | シーンの変化の通知（`TVkScener.OnChange` の転送） |

属すシーンの `OnChange` を購読して `OnScene` として転送するため、**ビューアはカメラだけを受け取れば済みます**。
カメラと描画先の縦横比が独立である点は [§ 2.3.6](#236-カメラと描画先の縦横比) を参照してください。

#### 4.6.4 `TVkScener`
シーンの根です。ノードでありながら親には所属できません。次元（2D ／ 3D）に依存しないので、そのまま両方に使います。
`Create( Queuer_ )` でキューを受け取り（コンテキストはキューから定まる）、シーンに属すノードはこれを通して自分の資源を確保します。

| メンバ | 意味 |
|---|---|
| `Contex` ／ `Queuer` | 資源を確保するコンテキストと、転送に使うキュー |
| `BackColor :TAlphaColorF` | 背景色 |
| `OnChange :TDelegates` | シーンの変化の通知（`Add` ／ `Del` で多播購読） |

ノードの挿抜・移動・属性の変更はすべて `Changed` として根まで遡り、`OnChange` で外へ出ます。
大量の変更は `BeginUpdate` ／ `EndUpdate`（Tree 層の一括更新）で束ねられます。破棄中のノードは `Updating` 扱いのため通知は発火しません。

#### 4.6.5 `TVkDrawer`
描画 1 回の間だけ生きる状態です。描画先が用意し、シーングラフの `Draw` に手渡されます。

| メンバ | 意味 |
|---|---|
| `Comman` ／ `Passer` | 記録中のコマンドバッファと描画パス |
| `ProjView :TSingleM4` | 射影行列 × 視野行列（カメラが設定する） |
| `BindRaster( Raster_ )` | 必要ならパイプラインを束ね直す。使えなければ `False` |

同じパイプラインの連続した束縛は `BindRaster` が省きます。

### 4.7 次元別の層

#### 4.7.1 ３Ｄ（`/Graphics/3D`）

| クラス | 意味 |
|---|---|
| `TVkShaper3D` | 頂点／添字バッファを持ち、添字つきで描画する。形は `BuildMesh` で与える。`Rebuild` で作り直す |
| `TVkCamera3D` | `Pos` と `LookAt` を持つカメラの基底 |
| `TVkCameraPers3D` | 透視投影。`FocusZ`（焦点距離）と、それに連動する `AngleX` ／ `AngleY`（画角） |
| `TVkCameraOrth3D` | 平行投影。視野は基底の `SizeX` ／ `SizeY` そのもの |
| `TVkRaster3D` | `TVkVertex3D` の配置と `TVkPush3D` の押込定数を宣言済みのパイプライン |
| `TVkVerBuf3D` ／ `TVkIndBuf3D` | 頂点／添字バッファ（用途フラグを足した `TVkBuffer` の派生） |
| `TVkCube3D` | 直方体（`/3D/…D3.Shapers.pas`）。`Size` で寸法を与える |

射影行列は本ユニットの `VkProjPers3D` ／ `VkProjOrth3D` で作ります。

| 関数 | 引数 |
|---|---|
| `VkProjPers3D( SizeX_, SizeY_, FocusZ_, NeaZ_, FarZ_ )` | スクリーンを距離 `FocusZ_` から覗いた透視投影 |
| `VkProjOrth3D( SizeX_, SizeY_, NeaZ_, FarZ_ )` | 視野がスクリーンそのものの平行投影 |

どちらも OpenGL ではなく Vulkan の規約で書いてあります。行列とその理由は [§ 2.3.1](#231-vulkan-のクリップ空間の規約)〜[§ 2.3.5](#235-視野角ではなく焦点距離) を参照してください。

#### 4.7.2 ２Ｄ（`/Graphics/2D`）

３Ｄと対称な骨組みだけを用意した段階であり、図形プリミティブはまだありません。`TVkShaper2D` を継承して `BuildMesh` を実装すれば、３Ｄとまったく同じ流れで描けます。

座標系は `LUX.CG2D`（Skia の２Ｄシーングラフ）と揃えて**Ｙ下向き**（画面座標系）です。Vulkan のクリップ空間も Ｙ下向きなので、射影行列 `VkProjOrth2D( SizeX_, SizeY_ )` は３Ｄと違って Ｙ を反転しません（式 (7)）。
`TVkCamera2D` の `SizeX` ／ `SizeY` は基底 `TVkCamera` のものをそのまま使い、スクリーンの広さ（ワールド単位）を表します。
`TVkRaster2D` は深度テストと面の間引きを切り、半透明合成を有効にしてあります。

> ※ 2D と 3D のノードを同じシーンに混在させないでください。頂点の配置と押込定数の形が異なるため、パイプラインが噛み合いません。

### 4.8 描画先

#### 4.8.1 `TVkRender`
`SizeX` × `SizeY` ピクセルの画像へシーンを描き、FireMonkey の `TBitmap` へ取り出します。ウィンドウもスワップチェーンも要らないので、コンソールアプリやバッチ処理からでも使えます。

| メンバ | 意味 |
|---|---|
| `SizeX` ／ `SizeY` | 出力の画素数 |
| `Camera :TVkCamera` | 描くカメラ（２Ｄでも３Ｄでもよい） |
| `Passer :TVkPasser` | この描画先の描画パス |
| `Color :TVkTarget2D` | 描画結果のイメージ |
| `Render` | 描く |
| `CopyTo( Bitmap_ )` | `TBitmap` へ取り出す |

色添付は `TVkTarget2D`（＝ `COLOR_ATTACHMENT` を足した `TVkImager2DxBGRAxUFix8`）なので、`/Stream` の変換をそのまま使えます。
深度添付は `VkImageView` の aspect が DEPTH でなければならず `TVkImager` では表せないため、このクラスが直接持ちます。

#### 4.8.2 `TVkViewer`（`TFrame` 継承）
フォームへ置ける表示窓です。詳しくは [§ 6.5](#65-表示窓) を参照してください。

| メンバ | 意味 |
|---|---|
| `Attach( Queuer_ )` | キューを接続する（最初に 1 回）。コンテキストも定まる |
| `Camera :TVkCamera` | 描くカメラ。接続するとシーンの変化を購読する |
| `Direct :Boolean` | `True`：子ウィンドウへ提示 ／ `False`：`TVkRender` 経由で `TBitmap` |
| `PixelX` ／ `PixelY` | 実際の画素数（DPI 込み） |
| `Render` | 明示的に描き直す |

### 4.9 FMX ストリーム

`TVkImager` と `TBitmap` の間で画像をコピーします。イメージの形式ごとに具象クラスがあり、インタフェース経由で使うので解放は不要です。

| クラス | 対応するイメージ |
|---|---|
| `TVkStream1DxBGRAxUFix8_FMX` ほか 3 種 | `TVkImager1Dx…` |
| `TVkStream2DxBGRAxUFix8_FMX` ほか 3 種 | `TVkImager2Dx…` |

| メソッド | 意味 |
|---|---|
| `CopyTo( Bitmap_ )` | イメージ → `TBitmap` |
| `CopyFrom( Bitmap_ )` | `TBitmap` → イメージ（大きさも合わせる） |
| `LoadFromFile` ／ `SaveToFile` | 画像ファイルとの入出力 |

----
## 5. 使い方：コンピュート

### 5.1 デバイス
`TVulkan` はすべての物理デバイス（GPU）を自動的に検出します。
> `Object Pascal`
> ```Delphi
> TVulkan.Available        :Boolean    // vulkan-1.dll が使えるか
> TVulkan.Devices.Count    :Integer    // 物理デバイスの数
> TVulkan.Devices[*]       :TVkDevice  // 物理デバイスの配列
>
> _Device := TVulkan.Devices[0];       // デバイスの選択
>
> _Device.DEVICE_NAME      :String     // デバイス名
> _Device.API_VERSION      :TVkVersion // 対応する Vulkan のバージョン
> ```

### 5.2 コンテキスト
> `Object Pascal`
> ```Delphi
> _Contex := TVkContex.Create( _Device );
> ```

### 5.3 キュー
> `Object Pascal`
> ```Delphi
> _Queuer := TVkQueuer.Create( _Contex );
> ```

### 5.4 実引数

#### 5.4.1 バッファ
> `Object Pascal`
> ```Delphi
> _Buffer := TVkBuffer<TItem>.Create( _Queuer );
> _Buffer.Count := 2;         // 要素数の設定
> _Buffer.Data.Map;           // ホストとデータを同期
> _Buffer.Data[0] := Item0;   // 書き込み
> _Buffer.Data[1] := Item1;
> _Buffer.Data.Unmap;         // デバイスとデータを同期
> ```

#### 5.4.2 イメージ
> `Object Pascal`
> ```Delphi
> _Imager := TVkImager2DxBGRAxUFix8.Create( _Queuer );
> _Imager.CountX := 500;      // Ｘ方向の画素数
> _Imager.CountY := 500;      // Ｙ方向の画素数
> ```

#### 5.4.3 サンプラー
> `Object Pascal`
> ```Delphi
> _Samplr := TVkSamplr.Create( _Contex );
> ```

### 5.5 ライブラリ
`#include` は**名前で**解決されます。ファイルシステムへのアクセスは起こりません。
> `Object Pascal`
> ```Delphi
> _Librar := TVkLibrar.Create( _Contex );
>
> _Librar.Source.LoadFromFile( 'Librar.glsl' );  // Name が 'Librar.glsl' になる
> ```
> `GLSL`
> ```GLSL
> #extension GL_GOOGLE_include_directive : require
> #include "Librar.glsl"
> ```

### 5.6 シェーダ
GLSL を読み込むと、最初に必要になった時点で**実行時にコンパイル**（`glslang.dll`）し、生成された SPIR-V を**自前で反射**します。記述子（名前・binding・型）・入口・`local_size` が自動的に取り出されます。
> `Object Pascal`
> ```Delphi
> _Shader := TVkShader.Create( _Contex );
>
> _Shader.Source.LoadFromFile( 'Execut.comp' );
>
> _Shader.CompileOK  :Boolean            // コンパイルの成否
> _Shader.CompileLog :String             // コンパイルログ
> _Shader.Binary     :TVkBinary          // 生成された SPIR-V
> _Shader.Bindins    :TArray<TVkBinding> // 反射で得た記述子
> _Shader.LocalX/Y/Z :Integer            // 反射で得た local_size
> ```
SPIR-V は直接読み書きもできるので、事前にコンパイルして `.spv` として配布することもできます（[§ 8.3](#83-glslangdll-を同梱しない配布)）。
> `Object Pascal`
> ```Delphi
> _Shader.Binary.SaveToFile( 'Execut.spv' );  // 必要ならコンパイルしてから保存
> _Shader.Binary.LoadFromFile( 'Execut.spv' );
> ```

### 5.7 カーネル
実引数は、シェーダから反射した**名前で**接続します。
> `Object Pascal`
> ```Delphi
> _Kernel := TVkKernel.Create( _Shader, 'main', _Queuer );
>
> _Kernel.GloSizX := _Imager.CountX;     // Ｘ方向ループ回数
> _Kernel.GloSizY := _Imager.CountY;     // Ｙ方向ループ回数
>
> _Kernel.Parames['Buffer'] := _Buffer;  // GLSL の変数名で接続
> _Kernel.Parames['Textur'] := _Textur;
> _Kernel.Parames['Samplr'] := _Samplr;
> _Kernel.Parames['Imager'] := _Imager;
>
> _Kernel.Parames.FindsOK  :Boolean  // 仮引数の照合
> _Kernel.Parames.BindsOK  :Boolean  // 実引数の接続
>
> _Kernel.Run;  // ディスパッチと完了待機
> ```

----
## 6. 使い方：グラフィックス

### 6.1 デバイスの要件
描画できるキューファミリとスワップチェーン拡張は、どちらも**既定**です。明示的に要求する必要はありません。
> `Object Pascal`
> ```Delphi
> _Contex := TVkContex.Create( _Device );
> _Queuer := TVkQueuer.Create( _Contex );
> ```

### 6.2 シェーダの段とパイプライン
> `Object Pascal`
> ```Delphi
> _ShaderV := TVkShader.Create( _Contex );
> _ShaderV.Stage := GLSLANG_STAGE_VERTEX;
> _ShaderV.Source.LoadFromFile( 'Shader.vert' );
>
> _ShaderF := TVkShader.Create( _Contex );
> _ShaderF.Stage := GLSLANG_STAGE_FRAGMENT;
> _ShaderF.Source.LoadFromFile( 'Shader.frag' );
>
> _Raster := TVkRaster3D.Create( _Contex );   // ３Ｄ用：頂点配置と押込定数は設定済み
> _Raster.Stagers.Add( _ShaderV );            // 入口名の既定は 'main'
> _Raster.Stagers.Add( _ShaderF );
> ```

押込定数は 128 バイト ―― これはあらゆる Vulkan 実装が保証する最小値そのもの [1] ―― なので、行列を運ぶだけなら記述子セットは要りません。
> `GLSL`
> ```GLSL
> layout( push_constant ) uniform Push { mat4 ProjViewPose; mat4 Pose; } uPush;
> layout( location = 0 ) in vec3 aPos;
> layout( location = 1 ) in vec3 aNor;
> layout( location = 2 ) in vec2 aTex;
> ```
テクスチャや uniform バッファも使えます。自前の `VkDescriptorSetLayout` を `TVkRaster.SetLayouts` へ渡してください。

### 6.3 シーングラフ
> `Object Pascal`
> ```Delphi
> _Scene := TVkScener.Create( _Queuer );
> _Scene.BackColor := TAlphaColorF.Create( 0.1, 0.12, 0.16, 1 );
> _Scene.Raster    := _Raster;                  // 子孫すべてに継承される
>
> _Cube := TVkCube3D.Create( _Scene );          // Create( Parent ) で木へ加わる
> _Cube.Size      := TSingle3D.Create( 1, 1, 1 );
> _Cube.LocalPose := TSingleM4.RotateY( T );
>
> _Camera := TVkCameraPers3D.Create( _Scene );
> _Camera.SizeX  := 4;                          // スクリーン 4:3 ＝ カメラの縦横比
> _Camera.SizeY  := 3;                          //（描画先の縦横比とは独立）
> _Camera.AngleY := DegToRad( 40 );             // 縦の画角 → FocusZ が決まる
> _Camera.LookAt( EyeP, TarP );
> ```

### 6.4 オフラインレンダラ
> `Object Pascal`
> ```Delphi
> _Render := TVkRender.Create( _Queuer );
> _Render.SizeX  := 480;
> _Render.SizeY  := 360;
> _Render.Camera := _Camera;
>
> _Render.Render;
> _Render.CopyTo( Bitmap );
> ```

### 6.5 表示窓
> `Object Pascal`
> ```Delphi
> Viewer.Attach( _Queuer );
> Viewer.Camera := _Camera;     // シーンが変わるたびに自動で描き直す
> ```

FireMonkey はフォーム全体をひとつの `HWND` へ描くため、Vulkan が提示に割り込む素直な継ぎ目がありません。そこでビューアは、フレームの矩形の上に**`WS_CHILD` の裸のウィンドウ**（`TForm` では**ない**）を作り、そこへスワップチェーンで提示します。

* 親フォームの `HWND` の子なので、親にクリップされ、親の移動・最小化・破棄に付いていきます。フチなしの `TForm` を重ねる方式で必要になる Z 順・最小化・アクティブ化・タスクバーの面倒はいっさい不要です。
* `WM_NCHITTEST` で `HTTRANSPARENT` を返すため入力を飲みません。マウスは親フォームの `HWND` に届き、FireMonkey が通常どおりフレームの `MouseDown` ／ `MouseMove` ／ `MouseWheel` へ配送します。
* 位置は物理ピクセル（`Scene.GetSceneScale`）で合わせるので、モニタごとに異なる DPI でも正しく重なります。

ネイティブの子ウィンドウは必ず FireMonkey の描画より手前に来るため、その上に FireMonkey のコントロールを重ねることはできません。それが必要なときは `Direct := False` としてください。`TVkRender` で描いて `Paint` で `TBitmap` を転送する経路に切り替わり、FireMonkey の描画順に完全に従います。代償は毎フレームの GPU → CPU → GPU の往復です。

----
## 7. 設計上の約束ごと

### 7.1 ハンドルは遅延生成
`Handle` プロパティは、最初に読まれたときに Vulkan のハンドルを生成します。生成条件（大きさ・形式など）を変えるセッタは、いったんハンドルを破棄して次の読み取りに委ねます。したがって**生成順序を気にする必要はありません**。

### 7.2 所有と解放
`/Core` のオブジェクトは親のリストに所属し、親を `Free` すると部分木ごと解放されます。個別に `Free` することもできます。
`TVkPasser` ／ `TVkRaster` は `TVkContex` の子（`Contex.Passers` ／ `Contex.Rasters`）であり、コンテキストと共に解放されます。画面側の物（`TVkSwaper` ／ `TVkRender` ／ `TVkViewer` ／ `TVkScener`）は**呼び出し側の所有物**です。`TVkContex` より先に解放してください。
シーングラフのノードは木に所属し、`Free` で部分木ごと解放されます。ただし `Raster` は参照であり所有しません。

### 7.3 命名
Vulkan のハンドル 1 個につきクラス 1 個を対応させ、クラス名は 6 文字に揃えています（`Contex` ／ `Queuer` ／ `Argume` ／ `Samplr` ／ `Memory` ／ `Buffer` ／ `Imager` ／ `Librar` ／ `Shader` ／ `Kernel` ／ `Parame` ／ `Passer` ／ `Raster` ／ `Swaper` ／ `Drawer` ／ `Render` ／ `Viewer`）。
リストは複数形（`TVkShaders`）、その要素は単数形（`TVkShader`）です。

### 7.4 dcc64 の制約と土台側での回避
`/Core` は深いジェネリックの連鎖でできており、Delphi のコンパイラの不具合を 2 つ踏みます。どちらも症状は E2130「書き込み専用プロパティから読み取れません」で、**読めるはずのプロパティがユニットの外から読めなくなります**。

1. **`reintroduce` で祖先のアクセサを隠すと、相互再帰するジェネリックの実体化でプロパティの getter を見失う。** `virtual` を足すと今度はコンパイラ自身が落ちます（F2084: URW1402）。
2. **プロパティの `read` が、ジェネリックを 2 段以上またいだ祖先のアクセサを指名すると、同じく読み取りを見失う。** 直近の祖先が宣言したアクセサなら通ります。

いずれも `LUX.Data.List` 側で吸収済みなので、**本ライブラリの利用者や派生ライブラリが対策を書く必要はありません。**

* 核（`LUX.Data.List.core`）のアクセサを `GetParent0` ／ `SetParent0` に改名し、型付け層が `GetParent` ／ `SetParent` を**隠蔽なしで**名乗れるようにした（→ 1 を回避）。
* `TListChildr<TOwnere_,TParent_>` でも同じアクセサを名乗り直して上位へ転送し、型付きアクセサが常に「直近の祖先」に来るようにした（→ 2 を回避）。継承関係（`TListChildr<TOwnere_,TParent_>` は `TListChildr<TParent_>` の派生）はそのままである。

おかげで、派生クラスは素直に書けます。

> `Object Pascal`
> ```Delphi
> property Devices :TVkDevices_ read GetParent;   // そのまま読める
> ```

----
## 8. 必要な環境

### 8.1 Vulkan の実行環境

Vulkan に対応した GPU とドライバ。ローダ `vulkan-1.dll`（現行の GPU ドライバには必ず同梱されます）は `/Vulkan/vulkan_functions.pas` が**動的にロード**するため、アプリは何もリンクせず、Vulkan の無い環境でも起動します。有無は `TVulkan.Available` が報告します。

ビルドにも実行にも **Vulkan SDK [10] は不要**です。開発中の検証レイヤやツールのために入れる価値はありますが、それだけです。

グラフィックス側が使うのは Vulkan 1.0 ＋ `VK_KHR_surface` ＋ `VK_KHR_win32_surface` ＋ `VK_KHR_swapchain` の範囲であり、コンピュートは拡張を一切必要としません。翻訳済の表示面バックエンドが `VK_KHR_win32_surface` のみであるため、対象プラットフォームは Windows（Win32 ／ Win64）です。

### 8.2 シェーダのコンパイルと `glslang.dll`

`_DLL/Win32/glslang.dll` と `_DLL/Win64/glslang.dll` を本リポジトリに収録しているため、アプリのビルドに **Vulkan SDK も CMake も不要**です。Delphi だけでビルドできます。
使用するアーキテクチャの DLL を実行ファイルと同じフォルダへコピーしてください。
DLL は SPIRV-Tools 非依存（`ENABLE_OPT=OFF`）かつ CRT 静的リンク（`/MT`）でビルドしているため、`KERNEL32.dll` 以外に依存するものはありません。

> ※ `glslang_default_resource()` は別ライブラリ `glslang-default-resource-limits` 側にあり、`glslang.dll` からは公開され**ません**。そのため既定のリソース制限は、`ResourceLimits.cpp` から移植した Pascal の定数 `DefaultTBuiltInResource` として持っています。

> ※ glslang のライセンスは BSD-3-Clause ／ Apache-2.0（[5] の `LICENSE.txt`）であり、この再頒布が許諾されています。

### 8.3 `glslang.dll` を同梱しない配布

`glslang.dll` は、GLSL を実際にコンパイルする必要が生じたときにだけ**遅延ロード**されます。
そのため、コンパイル済の `.spv` を同梱するアプリケーションであれば、**`glslang.dll` を配布する必要は一切ありません**。ロード・反射・実行のいずれも DLL 無しで動作し、エラーにもなりません。

> ※ 代入は **`Source` を先に、`Binary` を後に**行なってください。
> `Source` へ書き込むと、現在の `Binary` は破棄されます（GLSL を編集した以上、コンパイル済の結果は無効とみなすため）。`.spv` をロードした後に表示用の `Source` を代入すると、SPIR-V が捨てられてしまいます。

### 8.4 `glslang.dll` をソースからビルドする

`_DLL/MakeGlslang.ps1` は SubTree から CMake で `glslang.dll` をビルドします。ビルド済 DLL を収録しているので、**通常は実行不要**です。

> ※ **CMake** と **MSVC の C++ コンパイラ**（Visual Studio、または無償の Build Tools の「C++ によるデスクトップ開発」ワークロード）が必要。VC++ *再頒布可能パッケージ*ではコンパイラが入らないため不可。

### 8.5 開発環境

* **Delphi**（FireMonkey フレームワークを含む）。`/Core` は深いジェネリックの連鎖に依存します。回避しているコンパイラの不具合は [§ 7.4](#74-dcc64-の制約と土台側での回避) を参照してください。
* **LUX** ―― 土台となるライブラリ。`LUX.Code.C` ／ `LUX.Color` ／ `LUX.D2` ／ `LUX.D3` ／ `LUX.D3x3` ／ `LUX.D4x4` ／ `LUX.Data.List` ／ `LUX.Data.Tree` を全体で使用します。
* FireMonkey（`TBitmap` ／ `TFrame`）を使うのは `/Stream`、`/Graphics/LUX.Vulkan.Render.pas`、`TVkViewer` だけであり、それ以外は依存しません。

----
## 9. 参考文献

1. Khronos Group, [*Vulkan Specification*](https://registry.khronos.org/vulkan/specs/latest/html/), Vulkan Registry（2026 年閲覧）.
2. Khronos Group, [*Vulkan Registry*](https://registry.khronos.org/vulkan/)（2026 年閲覧）.
3. Khronos Group, [*SPIR-V Registry*](https://registry.khronos.org/SPIR-V/)（2026 年閲覧）.
4. Khronos Group, [*Vulkan-Headers*](https://github.com/KhronosGroup/Vulkan-Headers), GitHub リポジトリ（2026 年閲覧）.
5. Khronos Group, [*glslang*](https://github.com/KhronosGroup/glslang), GitHub リポジトリ（2026 年閲覧）.
6. Khronos Group, [*GL_GOOGLE_include_directive*](https://github.com/KhronosGroup/GLSL/blob/main/extensions/google/GL_GOOGLE_include_directive.txt), GLSL 拡張レジストリ（2026 年閲覧）.
7. Khronos Group, [*glslang issue #4210*](https://github.com/KhronosGroup/glslang/issues/4210), GitHub（2026 年閲覧）.
8. Microsoft, [*DirectX Shader Compiler*](https://github.com/microsoft/DirectXShaderCompiler), GitHub リポジトリ（2026 年閲覧）.
9. Shader Slang, [*Slang*](https://github.com/shader-slang/slang), GitHub リポジトリ（2026 年閲覧）.
10. LunarG, [*Vulkan SDK*](https://vulkan.lunarg.com/)（2026 年閲覧）.
11. LUXOPHIA, [*VulkanCompute*](https://github.com/LUXOPHIA/VulkanCompute), GitHub リポジトリ（2026 年閲覧）.
12. LUXOPHIA, [*Vulkan3DCG*](https://github.com/LUXOPHIA/Vulkan3DCG), GitHub リポジトリ（2026 年閲覧）.
13. Google, [*shaderc*](https://github.com/google/shaderc), GitHub リポジトリ（2026 年閲覧）.

## 💖 [Embarcadero](https://www.embarcadero.com/jp/) [**Delphi**](https://www.embarcadero.com/jp/products/delphi)
ネイティブなクロスプラットフォームアプリを開発するための統合開発環境（ＩＤＥ）。
### Free Download: [**Delphi** Community Edition](https://www.embarcadero.com/jp/products/delphi/starter)
