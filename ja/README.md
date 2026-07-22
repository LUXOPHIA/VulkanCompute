<!---
layout: page
title: "README (Japanese)"
permalink: /ja/
-->
[`［English］`](https://luxophia.github.io/Vulkan/)

# [Vulkan](https://github.com/LUXOPHIA/Vulkan/tree/main/ja)
[Vulkan](https://ja.wikipedia.org/wiki/Vulkan) のコンピュートシェーダを用いた GPU 並列計算。

[OpenCL](https://github.com/LUXOPHIA/OpenCL/) デモアプリケーションの GLSL 移植版です。
**GLSL コンピュートシェーダ**で**マンデルブロ集合**を計算し、1D パレットテクスチャで着色します。
画像の上でマウスホイールを回すと、カーソル位置を中心に拡大／縮小できます。

レンダリング結果は `TBitmap` へ書き出してからフォーム上へ表示します。デバイスコンテキストもスワップチェーンも使わない、グラフィックス API を一切用いないコンピュート専用の最小 Vulkan アプリケーションです。

![](https://github.com/LUXOPHIA/Vulkan/raw/main/--------/_SCREENSHOT/Vulkan.png)

----
## ■ 1. [`LUX.Vulkan`](https://luxophia.github.io/LUX.Vulkan/ja/) ライブラリ

[`LUX.Vulkan`](https://github.com/LUXOPHIA/LUX.Vulkan/) ライブラリ（[`/_LIBRARY/LUXOPHIA/LUX.Vulkan`](https://github.com/LUXOPHIA/Vulkan/tree/main/_LIBRARY/LUXOPHIA/LUX.Vulkan) に SubTree で導入済）は [`LUX.GPU.OpenCL`](https://github.com/LUXOPHIA/LUX.GPU.OpenCL/) と同じ設計を採用しているため、[`Main.pas`](https://github.com/LUXOPHIA/Vulkan/blob/main/Main.pas) は OpenCL デモとほぼ一対一に対応します。

|  | OpenCL | Vulkan |
|---|---|---|
| システム | `TOpenCL` | `TVulkan` |
| デバイス | `TCLDevice`（プラットフォーム内） | `TVkDevice`（物理デバイス） |
| コンテキスト | `TCLContex`（cl_context） | `TVkContex`（論理デバイス） |
| キュー | `TCLQueuer`（コマンドキュー） | `TVkQueuer`（キュー ＋ コマンドプール） |
| バッファ | `TCLBuffer<T>` | `TVkBuffer<T>`（ストレージバッファ） |
| イメージ | `TCLImager2DxBGRAxUFix8` | `TVkImager2DxBGRAxUFix8` |
| サンプラー | `TCLSamplr` | `TVkSamplr` |
| プログラム | `TCLExecut` ＋ `TCLBuildr`（実行時ビルド） | `TVkShader`（事前 SPIR-V ＋ リフレクション） |
| カーネル | `TCLKernel` | `TVkKernel`（演算パイプライン） |

----
## ■ 2. シェーダ

### ⬤ 2.1. GLSL
カーネルは GLSL（[`_DATA/Execut.comp`](https://github.com/LUXOPHIA/Vulkan/blob/main/_DATA/Execut.comp)）で記述し、OpenCL デモの `Librar.cl` を再現した複素数ライブラリ（[`_DATA/Librar.glsl`](https://github.com/LUXOPHIA/Vulkan/blob/main/_DATA/Librar.glsl)）を `#include` します。
OpenCL 版の４つのカーネル引数は、４つの記述子バインディングに対応します。
> `GLSL`
> ```GLSL
> layout( std430, binding = 0 ) buffer TBuffer { TSingleC Cent; TSingleC Size; } Buffer;
> layout( binding = 1          ) uniform texture1D Textur;
> layout( binding = 2          ) uniform sampler   Samplr;
> layout( binding = 3, rgba8   ) writeonly uniform image2D Imager;
> ```

### ⬤ 2.2. SPIR-V
Vulkan が受け取るのは GLSL ではなく **SPIR-V** です。そこで `TVkShader` は、組み込んだ [glslang](https://github.com/KhronosGroup/glslang)（`LUX.Vulkan` ライブラリに収録した `glslang.dll`）で GLSL を**実行時にコンパイル**します。事前のコンパイル作業も、Vulkan SDK も CMake も不要です。
`_DATA/Execut.comp` を書き換えてアプリを起動し直すだけで反映されます。
`#include` は、OpenCL デモで `#include<Librar.cl>` を `TCLLibrar` が解決するのと同様に、`TVkLibrar` が解決します。
生成された SPIR-V は `TVkShader` がリフレクションするため、実引数は OpenCL 版と同様に**名前で**接続できます。
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
* [LUXOPHIA](https://github.com/LUXOPHIA)
  * [LUX.Vulkan](https://github.com/LUXOPHIA/LUX.Vulkan)
  * [OpenCL](https://github.com/LUXOPHIA/OpenCL)（オリジナルのデモ）

----
* **Delphi IDE** @ Embarcadero  
https://www.embarcadero.com/jp/products/delphi/starter
