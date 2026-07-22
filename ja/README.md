<!---
layout: page
title: "README (Japanese)"
permalink: /ja/
-->
[`［English］`](https://luxophia.github.io/LUX.Vulkan/)

# [LUX.Vulkan](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/ja)
[Delphi](https://www.embarcadero.com/jp/products/delphi) 用 [Vulkan](https://ja.wikipedia.org/wiki/Vulkan) ライブラリ。

Vulkan API を介して GPU 上で **GLSL コンピュートシェーダ**を実行するためのクラスライブラリです。
姉妹ライブラリ [`LUX.GPU.OpenCL`](https://github.com/LUXOPHIA/LUX.GPU.OpenCL/) と同じ設計を採用しており、OpenCL ベースのアプリケーションを最小限の変更で移植できます。
現時点では**コンピュート**のみを実装していますが、将来的にグラフィックス（スワップチェーン／レンダーパス）へ拡張できるクラス設計になっています。

----
## ■ 1. 構成

### ⬤ 1.1. [`/Vulkan`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Vulkan) ：インポートライブラリ

公式 C ヘッダ（[KhronosGroup/Vulkan-Headers](https://github.com/KhronosGroup/Vulkan-Headers)、`/：KhronosGroup` に SubTree で導入済）から生成した Delphi 訳。

> [`vk_platform.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Vulkan/vk_platform.pas) ：プラットフォーム固有型（→ vk_platform.h）  
> [`vulkan_core.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Vulkan/vulkan_core.pas) ：コア API 1.0 - 1.3 ＋ VK_KHR_surface ／ VK_KHR_swapchain（→ vulkan_core.h）  
> [`vulkan_win32.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Vulkan/vulkan_win32.pas) ：VK_KHR_win32_surface（→ vulkan_win32.h）  
> [`vulkan_functions.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Vulkan/vulkan_functions.pas) ：`vulkan-1.dll` からの全コマンドの動的ロード

命名は OpenCL インポートライブラリと同じ規約に従います。
C の型 `VkFoo` → `T_VkFoo` ／ ポインタ `P_VkFoo` ／ 関数型 `PFN_vkFoo` → `T_PFN_vkFoo`。
定数（`VK_...`）は元の名前のままです。

### ⬤ 1.2. [`/Core`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Core) ＋ [`LUX.Vulkan.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/LUX.Vulkan.pas) ：クラスライブラリ

> [`TVulkan`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/LUX.Vulkan.pas#L84) ：TVkSystem のシングルトン  
> 　┃  
> [`TVkSystem`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/LUX.Vulkan.pas#L69) ：システム  
> 　┗[`TVkDevices`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Device.pas#L67) ：物理デバイスリスト（VkInstance を保持）  
> 　　　┗[`TVkDevice`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Device.pas#L22) ：物理デバイス  
> 　　　　　┗[`TVkContexs`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Contex.pas#L62) ：コンテキストリスト  
> 　　　　　　　┗[`TVkContex`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Contex.pas#L24) ：コンテキスト（論理デバイス ＝ VkDevice）  
> 　　　　　　　　　┣[`TVkQueuers`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Queuer.pas#L51) ：キューリスト  
> 　　　　　　　　　┃　┗[`TVkQueuer`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Queuer.pas#L21) ：キュー（VkQueue ＋ VkCommandPool）  
> 　　　　　　　　　┣[`TVkArgumes`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.pas#L47) ：実引数リスト  
> 　　　　　　　　　┃　┣[`TVkBuffer`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Buffer.pas#L24) ：バッファ（VkBuffer）  
> 　　　　　　　　　┃　┣[`TVkImager`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Imager.pas#L26) ：イメージ（VkImage ＋ VkImageView）  
> 　　　　　　　　　┃　┗[`TVkSamplr`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Samplr.pas#L21) ：サンプラー（VkSampler）  
> 　　　　　　　　　┗[`TVkShaders`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Shader.pas#L147) ：シェーダリスト  
> 　　　　　　　　　　　┗[`TVkShader`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Shader.pas#L92) ：シェーダ（VkShaderModule ＋ SPIR-V リフレクション）  
> 　　　　　　　　　　　　　┗[`TVkKernels`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Kernel.pas#L185) ：カーネルリスト  
> 　　　　　　　　　　　　　　　┗[`TVkKernel`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Kernel.pas#L109) ：カーネル（VkPipeline ＋ VkDescriptorSet）  
> 　　　　　　　　　　　　　　　　　┗[`TVkParames`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Kernel.pas#L67) ：仮引数リスト  
> 　　　　　　　　　　　　　　　　　　　┗[`TVkParame`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Kernel.pas#L32) ：仮引数

### ⬤ 1.3. [`/Stream`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Stream) ：FMX ストリーム

`TVkImager` と FireMonkey の `TBitmap` の間で画像をコピーします（[`TVkStream1D_FMX`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Stream/LUX.Vulkan.Stream.FMX.D1.pas) ／ [`TVkStream2D_FMX`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Stream/LUX.Vulkan.Stream.FMX.D2.pas)）。

----
## ■ 2. 使い方

### ⬤ 2.1. デバイス
`TVulkan` クラスは `TVkSystem` クラスのシングルトンであり、すべての**物理デバイス**（GPU）を自動的に検出します。
`VkInstance` は `TVkDevices` リストの内部で遅延生成されます。
> `Object Pascal`
> ```Delphi
> TVulkan.Available        :Boolean    // vulkan-1.dll が利用可能か
> TVulkan.Devices.Count    :Integer    // 物理デバイスの数
> TVulkan.Devices[*]       :TVkDevice  // 物理デバイスの配列
>
> _Device := TVulkan.Devices[0];       // デバイスの選択
>
> _Device.DEVICE_NAME      :String     // デバイス名
> _Device.API_VERSION      :TVkVersion // 対応する Vulkan バージョン
> ```

### ⬤ 2.2. コンテキスト
「**コンテキスト**」オブジェクト（`TVkContex`）は**論理デバイス**（`VkDevice`）です。
コンピュート対応のキューファミリを選択し、実引数とシェーダを所有します。
> `Object Pascal`
> ```Delphi
> _Contex := TVkContex.Create( _Device );
> ```

### ⬤ 2.3. キュー
「**キュー**」オブジェクト（`TVkQueuer`）は `VkQueue` と `VkCommandPool` を包み、ワンショットのコマンドバッファを実行します。
> `Object Pascal`
> ```Delphi
> _Queuer := TVkQueuer.Create( _Contex );
> ```

### ⬤ 2.4. 実引数

> [`TVkArgume`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.pas#L23)  
> 　┣[`TVkMemory`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.pas#L24)  
> 　┃　┣[`TVkBuffer`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Buffer.pas#L24)  
> 　┃　┗[`TVkImager`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Imager.pas#L26)  
> 　┗[`TVkSamplr`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Samplr.pas#L21)  

#### ▼ 2.4.1. バッファ
`TVkBuffer<T>` クラスは、任意のレコード型の配列をホスト可視の `VkBuffer` に格納します。
配列データは `Data` プロパティを通し、`Map` ／ `Unmap` の間で読み書きします。
> `Object Pascal`
> ```Delphi
> _Buffer := TVkBuffer<TItem>.Create( _Contex, _Queuer );
> _Buffer.Count := 2;         // 要素数の設定
> _Buffer.Data.Map;           // ホストとの同期
> _Buffer.Data[0] := Item0;   // 書き込み
> _Buffer.Data[1] := Item1;   // 書き込み
> _Buffer.Data.Unmap;         // デバイスとの同期
> ```

#### ▼ 2.4.2. イメージ
「**イメージ**」オブジェクト（`TVkImager`）は、1D ～ 3D のピクセル配列をデバイス専用の `VkImage` として格納します。
ホストからのアクセスは常駐のステージングバッファを介して行われ、`Data.Map` でイメージがホストへ、`Data.Unmap` でホストからイメージへコピーされます。
イメージレイアウトの遷移は自動的に処理されます。
具象クラスは `TVkImager*Dx<順序>x<型>` の命名に従います。例：
[`TVkImager1DxBGRAxUFix8`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Imager.D1.pas#L82)（`VK_FORMAT_B8G8R8A8_UNORM`）／
[`TVkImager2DxBGRAxUFix8`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Imager.D2.pas#L82) など。
> `Object Pascal`
> ```Delphi
> _Imager := TVkImager2DxBGRAxUFix8.Create( _Contex, _Queuer );
> _Imager.CountX := 500;  // 横ピクセル数
> _Imager.CountY := 500;  // 縦ピクセル数
> ```

#### ▼ 2.4.3. サンプラー
サンプラーオブジェクト（`TVkSamplr`）は補間方法（リニア／ミラーリピート）を定義します。
> `Object Pascal`
> ```Delphi
> _Samplr := TVkSamplr.Create( _Contex );
> ```

### ⬤ 2.5. シェーダ
「**シェーダ**」オブジェクト（`TVkShader`）は、GLSL ソース（表示用）と **SPIR-V** バイナリ（実行用）を保持します。
Vulkan には実行時の GLSL コンパイラが無いため、GLSL は事前に SPIR-V へコンパイルします（`glslangValidator` や `shaderc` など）。
本クラスは SPIR-V バイナリを自前で**リフレクション**し、記述子バインディング（名前／番号／種別）、エントリポイント、`local_size` を自動的に抽出します。
> `Object Pascal`
> ```Delphi
> _Shader := TVkShader.Create( _Contex );
>
> _Shader.Source.LoadFromFile( 'Execut.comp' );  // GLSL ソース（表示用）
> _Shader.Binary.LoadFromFile( 'Execut.spv'  );  // SPIR-V バイナリ（実行用）
>
> _Shader.Bindins    :TArray<TVkBinding>  // リフレクションで得た記述子バインディング
> _Shader.LocalX/Y/Z :Integer             // リフレクションで得た local_size
> ```

### ⬤ 2.6. カーネル
「**カーネル**」オブジェクト（`TVkKernel`）は演算パイプライン（`VkPipeline`）であり、シェーダのリフレクション結果から記述子セットレイアウト／パイプラインレイアウト／記述子プール／記述子セットを内部で生成します。
実引数は OpenCL ライブラリと同様に**名前で**接続します。
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
ワークグループ数は `GloSiz*` とシェーダの `local_size` から自動的に計算されます。

----
## ■ 3. 参考

### ⬤ 3.1. [The Khronos Group Inc](https://www.khronos.org/)
* [Vulkan Registry](https://registry.khronos.org/vulkan/)
  * [Vulkan Specification](https://registry.khronos.org/vulkan/specs/latest/html/)
* [SPIR-V Registry](https://registry.khronos.org/SPIR-V/)

### ⬤ 3.2. [GitHub](https://github.com)
* [The Khronos Group](https://github.com/KhronosGroup)
  * [Vulkan-Headers](https://github.com/KhronosGroup/Vulkan-Headers)
  * [glslang](https://github.com/KhronosGroup/glslang)
* [Google](https://github.com/google)
  * [shaderc](https://github.com/google/shaderc)

### ⬤ 3.3. [LunarG](https://www.lunarg.com/)
* [Vulkan SDK](https://vulkan.lunarg.com/)

----
* **Delphi IDE** @ Embarcadero  
https://www.embarcadero.com/jp/products/delphi/starter
