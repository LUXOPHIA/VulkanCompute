<!---
layout: page
title: "README (Japanese)"
permalink: /ja/
-->
[`［English］`](https://luxophia.github.io/VulkanCompute/)

# [VulkanCompute](https://github.com/LUXOPHIA/VulkanCompute/tree/main/ja)
[Vulkan](https://ja.wikipedia.org/wiki/Vulkan) のコンピュートシェーダを用いた GPU 並列計算。

**マンデルブロ集合**のインタラクティブなレンダラです。各ピクセルを GPU 上の **GLSL コンピュートシェーダ**で計算し、1D パレットテクスチャで着色します。
画像の上でマウスホイールを回すと、カーソル位置を中心に拡大／縮小できます。

レンダリング結果は `TBitmap` へ書き出してからフォーム上へ表示します。デバイスコンテキストもスワップチェーンも使わない、グラフィックス API を一切用いない**コンピュート専用**の最小 Vulkan アプリケーションです。

![](https://github.com/LUXOPHIA/VulkanCompute/raw/main/--------/_SCREENSHOT/VulkanCompute.png)

----
## ■ 1. [`LUX.Vulkan`](https://luxophia.github.io/LUX.Vulkan/ja/) ライブラリ

Vulkan に関わる処理はすべて [`LUX.Vulkan`](https://github.com/LUXOPHIA/LUX.Vulkan/) ライブラリ（[`/_LIBRARY/LUXOPHIA/LUX.Vulkan`](https://github.com/LUXOPHIA/VulkanCompute/tree/main/_LIBRARY/LUXOPHIA/LUX.Vulkan) に SubTree で導入済）に委ねています。
そのため [`Main.pas`](https://github.com/LUXOPHIA/VulkanCompute/blob/main/Main.pas) は、オブジェクトを生成して接続するだけの内容になっています。

| クラス | このデモでの役割 |
|---|---|
| `TVulkan` | マシン上の GPU を検出する |
| `TVkDevice` | 選択した物理デバイス（GPU） |
| `TVkContex` | 以下のすべてを所有する論理デバイス |
| `TVkQueuer` | 演算コマンドを GPU へ送出する |
| `TVkBuffer<TSingleC>` | 表示領域の中心とサイズ |
| `TVkImager1DxBGRAxUFix8` | 1D パレットテクスチャ |
| `TVkSamplr` | パレットを補間する |
| `TVkImager2DxBGRAxUFix8` | 500 × 500 の出力イメージ |
| `TVkLibrar` | `#include` される複素数ライブラリ |
| `TVkShader` | GLSL をコンパイルし、SPIR-V をリフレクションする |
| `TVkKernel` | タイマごとに実行される演算パイプライン |

----
## ■ 2. シェーダ

### ⬤ 2.1. GLSL
カーネルは GLSL（[`_DATA/Execut.comp`](https://github.com/LUXOPHIA/VulkanCompute/blob/main/_DATA/Execut.comp)）で記述し、小さな複素数ライブラリ（[`_DATA/Librar.glsl`](https://github.com/LUXOPHIA/VulkanCompute/blob/main/_DATA/Librar.glsl)）を `#include` します。
４つの記述子バインディングが、ホスト側から与える４つの実引数に対応します。
> `GLSL`
> ```GLSL
> layout( std430, binding = 0 ) buffer TBuffer { TSingleC Cent; TSingleC Size; } Buffer;
> layout( binding = 1          ) uniform texture1D Textur;
> layout( binding = 2          ) uniform sampler   Samplr;
> layout( binding = 3, rgba8   ) writeonly uniform image2D Imager;
> ```

### ⬤ 2.2. SPIR-V
Vulkan が受け取るのは GLSL ではなく **SPIR-V** であり、ドライバはシェーダコンパイラを内蔵していません。
そこで `TVkShader` が、組み込んだ [glslang](https://github.com/KhronosGroup/glslang)（`LUX.Vulkan` ライブラリに収録した `glslang.dll`）で GLSL を**実行時にコンパイル**します。事前のコンパイル作業も、Vulkan SDK も CMake も不要です。
`_DATA/Execut.comp` を書き換えてアプリを起動し直すだけで反映されます。
`#include` は `TVkLibrar` が**名前で**解決するため、ファイルシステムへのアクセスも発生しません。

生成された SPIR-V は `TVkShader` が**リフレクション**するので、実引数も**名前で**接続できます。
> `Object Pascal`
> ```Delphi
> _Kernel.Parames['Buffer'] := _Buffer;  // バッファーの登録
> _Kernel.Parames['Textur'] := _Textur;  // テクスチャの登録
> _Kernel.Parames['Samplr'] := _Samplr;  // サンプラーの登録
> _Kernel.Parames['Imager'] := _Imager;  // イメージ　の登録
> ```

----
## ■ 3. 参考

### ⬤ 3.1. [The Khronos Group Inc](https://www.khronos.org/)
* [Vulkan Registry](https://registry.khronos.org/vulkan/)
  * [Vulkan Specification](https://registry.khronos.org/vulkan/specs/latest/html/)
  * [Vulkan Guide](https://docs.vulkan.org/guide/latest/index.html)

### ⬤ 3.2. [GitHub](https://github.com)
* [The Khronos Group](https://github.com/KhronosGroup)
  * [Vulkan-Headers](https://github.com/KhronosGroup/Vulkan-Headers)
  * [glslang](https://github.com/KhronosGroup/glslang)
* [LUXOPHIA](https://github.com/LUXOPHIA)
  * [LUX.Vulkan](https://github.com/LUXOPHIA/LUX.Vulkan)

----
* **Delphi IDE** @ Embarcadero  
https://www.embarcadero.com/jp/products/delphi/starter
