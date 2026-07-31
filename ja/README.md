# VulkanCompute

[English](../README.md) | [日本語](README.md)

**VulkanCompute** は、Delphi（FireMonkey）で書かれた最小構成の**コンピュート専用** [Vulkan](https://www.vulkan.org/) アプリケーションです。**マンデルブロ集合**のインタラクティブなレンダラであり、各ピクセルを GPU 上の **GLSL コンピュートシェーダ**で計算し、1D パレットテクスチャで着色します。結果は `TBitmap` へコピーしてフォーム上に表示します。スワップチェーンもデバイスコンテキストもグラフィックスパイプラインも一切使いません。

![VulkanCompute](../--------/_SCREENSHOT/VulkanCompute.png)

## 利用ライブラリ

* [**LUX**](https://github.com/LUXOPHIA/LUX) ：LUXOPHIA の基盤数学ライブラリ。
* [**LUX.Vulkan**](https://github.com/LUXOPHIA/LUX.Vulkan) ：Vulkan API のラッパーライブラリ。

## 1. 概要

* **コンピュート専用 Vulkan**：GPU を純粋な並列計算機として使います。レンダリング結果はホストへ転送し、通常の FMX ビットマップとして表示します。
* **実行時 GLSL → SPIR-V コンパイル**：カーネル（[`_DATA/Execut.comp`](../_DATA/Execut.comp)）は、同梱の [glslang](https://github.com/KhronosGroup/glslang) DLL [4] によって**実行時に**コンパイルされます。事前コンパイルも Vulkan SDK も CMake も不要です。シェーダを書き換えてアプリを再起動するだけで反映されます。
* **SPIR-V リフレクション**：シェーダのバインディングをコンパイル済みバイナリから検出するため、ホスト側の実引数は**名前で**接続できます（`_Kernel.Parames['Buffer'] := _Buffer;`）。
* **メモリ内 `#include`**：複素数ライブラリ（[`_DATA/Librar.glsl`](../_DATA/Librar.glsl)）は `TVkLibrar` に登録され、`GL_GOOGLE_include_directive` を介して名前で解決されます。ファイルシステムへのアクセスは発生しません。
* **インタラクティブ**：画像の上でマウスホイールを回すと、カーソル位置を中心に拡大／縮小できます。目標領域へ向けて滑らかにアニメーションします。
* **薄いアプリケーション層**：Vulkan に関わる処理はすべて [LUX.Vulkan](https://github.com/LUXOPHIA/LUX.Vulkan) ライブラリ（[`_LIBRARY/LUXOPHIA/LUX.Vulkan`](../_LIBRARY/LUXOPHIA/LUX.Vulkan) に Git SubTree として導入済）に委ねています。[`Main.pas`](../Main.pas) は、オブジェクトを生成して接続するだけの内容です。

## 2. 技術的背景

### 2.1. Vulkan のコンピュートモデル

コンピュートディスパッチは、**ワークグループ**の 3 次元グリッドを起動します。各ワークグループは、シェーダ内で宣言された固定サイズの**呼び出し（invocation）**のブロックを含みます [1][3]。本カーネルは

```GLSL
layout( local_size_x = 16, local_size_y = 16 ) in;
```

すなわちローカルサイズ $s = (16, 16, 1)$ を宣言します。`TVkKernel.Run` は、要求された*グローバル*サイズ $G$（ここでは出力画像の $500 \times 500$）から、切り上げ除算でワークグループ数を導出します。

```math
D_k = \left\lceil \frac{G_k}{L_k} \right\rceil, \qquad k \in \{x, y, z\}
```

したがって `vkCmdDispatch` には各軸 $\lceil 500/16 \rceil = 32$ グループが渡され、合計 $512 \times 512$ の呼び出しが起動されます。余剰分はシェーダ内の範囲ガード（`if ( P.x >= S.x ) ... return;`）で破棄されます。各呼び出しは `gl_GlobalInvocationID`、すなわちグローバル呼び出し ID $g = w \cdot s + l$（$w$ はワークグループ ID、$l$ はローカル呼び出し ID）によって担当ピクセルを識別します [3]。

### 2.2. 記述子セットとリソースバインディング

シェーダの４つの記述子バインディングは、ホスト側の４つの実引数と一対一に対応します。

```GLSL
layout( std430, binding = 0 ) buffer TBuffer { TSingleC Cent; TSingleC Size; } Buffer;
layout( binding = 1          ) uniform texture1D Textur;
layout( binding = 2          ) uniform sampler   Samplr;
layout( binding = 3, rgba8   ) writeonly uniform image2D Imager;
```

`TVkShader` は glslang [4] で GLSL をコンパイルし、生成された SPIR-V を**リフレクション**します（エントリポイント・`OpExecutionMode` のローカルサイズ・名前付きバインディング）。`TVkKernel` はこのリフレクション結果から `VkDescriptorSetLayout` と `VkPipeline` を構築し、実引数を**名前で**割り当てられるようにします。

```Delphi
_Kernel.Parames['Buffer'] := _Buffer;  // ストレージバッファ : 表示領域の中心とサイズ
_Kernel.Parames['Textur'] := _Textur;  // 1D テクスチャ      : カラーパレット
_Kernel.Parames['Samplr'] := _Samplr;  // サンプラー         : パレットの補間
_Kernel.Parames['Imager'] := _Imager;  // ストレージイメージ : 500 × 500 の出力
```

### 2.3. コマンド送出と同期

`_Kernel.Run` の１回ごとに、１つのプライマリコマンドバッファを記録・送出します。

1. 各実引数の `PreRun` が**イメージメモリバリア**（`vkCmdPipelineBarrier`）を挿入し、パレットテクスチャをサンプリング可能なレイアウトへ、出力をストレージイメージのレイアウトへ遷移させます [1]。
2. `vkCmdBindPipeline` と `vkCmdBindDescriptorSets` が、コンピュートパイプラインと単一の記述子セットをバインドします。
3. `vkCmdDispatch` が 2.1 節のグリッドを起動します。
4. `TVkQueuer.EndCommand` がバッファを送出し、`vkQueueWaitIdle` で完了を待機します。実行は同期的であり、フレームごとのカーネル実行として最も単純で正しい方式です。

### 2.4. マンデルブロカーネル

各呼び出しはまず、$S_x \times S_y$ 画像内の担当ピクセル $P$ を、バッファに格納された表示領域の中心と半径を用いて複素平面上の点へ写像します。

```math
c = \left( \mathrm{Cent}_R + \mathrm{Size}_R \left( \frac{2 \left( P_x + 0.5 \right)}{S_x} - 1 \right) \right) + i \left( \mathrm{Cent}_I - \mathrm{Size}_I \left( \frac{2 \left( P_y + 0.5 \right)}{S_y} - 1 \right) \right)
```

次に、二次写像

```math
z_0 = 0, \qquad z_{n+1} = z_n^2 + c
```

を最大 $N_{\max} = 1000$ ステップまで反復します。複素数演算（`Add`・`Mul`・`Pow2`・`Abs`）は `Librar.glsl` から `#include` されたものです。軌道が発散した時点（$|z_n| > 2$）で、色の縞模様（バンディング）を避けるため、脱出時間を連続値へ平滑化します。

```math
\nu = n + 1 - \log \left( \log_2 |z_n| \right)
```

最後に、ガンマ圧縮した座標

```math
t = \sqrt{ \nu / N_{\max} }
```

で `texture( sampler1D( Textur, Samplr ), t )` によりパレットをサンプリングし、`imageStore` で色を書き込みます。

ホスト側では、ホイール１ノッチごとに表示領域を $1.1^{\Delta/120}$ 倍し、カーソル位置の複素座標を不動点として拡縮します。タイマの各ティックで現在の表示領域を目標へ向けて 1/4 ずつ補間し、マップしたバッファへ書き直すことで、滑らかなズームアニメーションを実現しています。

## 3. アーキテクチャ

実際のラッパークラス（すべて LUX.Vulkan のもの）の所有関係は以下の通りです。

```
・TVulkan                          ･･･ インスタンス／物理デバイスの列挙
  ┗・Devices[0] :TVkDevice        ･･･ 選択された物理 GPU
     ┗・TVkContex                 ･･･ 論理デバイス — 以下のすべてを所有
        ┣・TVkQueuer              ･･･ 演算キュー＋コマンドバッファ
        ┣・TVkBuffer<TSingleC>    ･･･ binding 0 : 表示領域 Cent / Size (SSBO)
        ┣・TVkImager1DxBGRAxUFix8 ･･･ binding 1 : 1D パレットテクスチャ
        ┃  ┗・TVkStream1D..._FMX ･･･ Textur.png → ステージング → イメージ
        ┣・TVkSamplr              ･･･ binding 2 : パレットのサンプラー
        ┣・TVkImager2DxBGRAxUFix8 ･･･ binding 3 : 500 × 500 の出力イメージ
        ┃  ┗・TVkStream2D..._FMX ･･･ イメージ → ステージング → TBitmap
        ┣・TVkLibrar              ･･･ Librar.glsl（#include 名で解決）
        ┗・TVkShader              ･･･ glslang → SPIR-V → リフレクション
           ┗・TVkKernel           ･･･ VkPipeline ＋記述子セット（名前で接続）
```

フレームごとのデータフロー：

```
[ フレームごとのデータフロー — 入れ子は Timer1 内の順序を表す ]

・Timer1
  ┣・_Buffer.Data
  ┃  ┣・Map
  ┃  ┣・Cent, Size を書き込み
  ┃  ┗・Unmap
  ┣・_Kernel.Run
  ┃  ┣・PreRun :vkCmdPipelineBarrier ･･･ （イメージレイアウト遷移）
  ┃  ┣・vkCmdBindPipeline / vkCmdBindDescriptorSets
  ┃  ┣・vkCmdDispatch( ⌈500/16⌉, ⌈500/16⌉, 1 )
  ┃  ┗・vkQueueWaitIdle              ･･･ （同期実行）
  ┗・_ImaFMX.CopyTo( ImageR.Bitmap )
     ┗・GPU イメージ
        ┗・TBitmap
           ┗・画面
```

リポジトリ構成：

```
・VulkanCompute/
  ┣・VulkanCompute.dpr     ･･･ プロジェクトソース（ユニット一覧）
  ┣・VulkanCompute.dproj   ･･･ RAD Studio プロジェクト（Win32 / Win64）
  ┣・Main.pas / Main.fmx   ･･･ メインフォーム：オブジェクト生成＋描画ループ
  ┣・_DATA/
  ┃  ┣・Execut.comp       ･･･ コンピュートシェーダ（マンデルブロ・GLSL）
  ┃  ┣・Librar.glsl       ･･･ 複素数ライブラリ（#include 名で解決）
  ┃  ┗・Textur.png        ･･･ 1D パレットテクスチャ
  ┣・_LIBRARY/
  ┃  ┗・LUXOPHIA/
  ┃     ┣・LUX/           ･･･ 基盤ライブラリ（TSingleC 複素数型・リスト等）
  ┃     ┗・LUX.Vulkan/    ･･･ Vulkan ラッパーライブラリ（Git SubTree）
  ┗・--------/_SCREENSHOT/ ･･･ スクリーンショット
```

## 4. 使い方

| 入力 | 動作 |
|---|---|
| 結果画像上でマウスホイール | カーソル位置を中心に拡大／縮小（1 ノッチあたり × 1.1、滑らかにアニメーション） |

| UI 要素 | 内容 |
|---|---|
| `System` タブ | Vulkan インスタンス／デバイス情報（終了時に `System.txt` へ保存） |
| `Program` › `Librar` タブ | `Librar.glsl` のソース |
| `Program` › `Execut` タブ | `Execut.comp` のソース |
| `Program` › `Build` タブ | コンパイルログ・SPIR-V サイズ・エントリポイント・ローカルサイズ・リフレクションされたバインディング |
| `Result` タブ | レンダリングされたマンデルブロ集合（終了時に `Imager.png` へ保存） |

GLSL のコンパイルに失敗すると、自動的に `Build` タブへ切り替わり、glslang のエラーログを表示します。

## 5. ビルド

1. **RAD Studio**（Delphi / FireMonkey）で [`VulkanCompute.dproj`](../VulkanCompute.dproj) を開きます。
2. ターゲットプラットフォーム（**Win32** または **Win64**）を選択してビルドします。
3. 既定の出力ディレクトリ（例：`Win64\Debug`）から実行します。シェーダソースは相対パス `..\..\_DATA\` からロードされます。

必要環境：

* `vulkan-1.dll` ランタイムを提供する **Vulkan 対応 GPU とドライバ**。**Vulkan SDK は不要**です。
* 実行時 GLSL コンパイルのため、実行ファイルと同じ場所に **glslang.dll** が必要です。ビルド済みバイナリはライブラリ内の [`_LIBRARY/LUXOPHIA/LUX.Vulkan/_DLL/Win32`](../_LIBRARY/LUXOPHIA/LUX.Vulkan/_DLL/Win32) および [`.../Win64`](../_LIBRARY/LUXOPHIA/LUX.Vulkan/_DLL/Win64) に同梱されています。

オフラインのシェーダコンパイル工程はありません。`TVkShader` がアプリ起動のたびに `_DATA/Execut.comp` を SPIR-V へコンパイルします（2.2 節）。

## 6. 参考文献

1. Khronos Group, [*Vulkan Specification*](https://registry.khronos.org/vulkan/specs/latest/html/).
2. Khronos Group, [*Vulkan Guide*](https://docs.vulkan.org/guide/latest/index.html).
3. Khronos Group, [*The OpenGL Shading Language 4.60 Specification*](https://registry.khronos.org/OpenGL/specs/gl/GLSLangSpec.4.60.html) — Compute Shaders.
4. KhronosGroup, [*glslang*](https://github.com/KhronosGroup/glslang) — Khronos リファレンスの GLSL → SPIR-V コンパイラ.

## 💖 [Embarcadero](https://www.embarcadero.com/jp/) [**Delphi**](https://www.embarcadero.com/jp/products/delphi)
ネイティブなクロスプラットフォームアプリを開発するための統合開発環境（ＩＤＥ）。
### Free Download: [**Delphi** Community Edition](https://www.embarcadero.com/jp/products/delphi/starter)
