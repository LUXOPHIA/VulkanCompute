<!---
layout: page
title: "README (English)"
permalink: /
-->
[`［日本語］`](https://luxophia.github.io/Vulkan/ja/)

# [Vulkan](https://github.com/LUXOPHIA/Vulkan/)
Parallel computing with [Vulkan](https://en.wikipedia.org/wiki/Vulkan) compute shaders on GPUs.

A GLSL port of the [OpenCL](https://github.com/LUXOPHIA/OpenCL/) demo application:
an interactive **Mandelbrot set** renderer, computed by a **GLSL compute shader** and colored through a 1D palette texture.
Spin the mouse wheel over the image to zoom in and out around the cursor.

The rendering result is written to a `TBitmap` and shown on the form — no device context, no swapchain, no graphics API at all: this is a minimal, compute-only Vulkan application.

![](https://github.com/LUXOPHIA/Vulkan/raw/main/--------/_SCREENSHOT/Vulkan.png)

----
## ■ 1. [`LUX.Vulkan`](https://luxophia.github.io/LUX.Vulkan/) Library

The [`LUX.Vulkan`](https://github.com/LUXOPHIA/LUX.Vulkan/) library（introduced as a subtree under [`/_LIBRARY/LUXOPHIA/LUX.Vulkan`](https://github.com/LUXOPHIA/Vulkan/tree/main/_LIBRARY/LUXOPHIA/LUX.Vulkan)）mirrors the design of [`LUX.GPU.OpenCL`](https://github.com/LUXOPHIA/LUX.GPU.OpenCL/), so [`Main.pas`](https://github.com/LUXOPHIA/Vulkan/blob/main/Main.pas) reads almost line-for-line like the OpenCL demo:

|  | OpenCL | Vulkan |
|---|---|---|
| System | `TOpenCL` | `TVulkan` |
| Device | `TCLDevice`（in a platform） | `TVkDevice`（physical device） |
| Context | `TCLContex`（cl_context） | `TVkContex`（logical device） |
| Queue | `TCLQueuer`（command queue） | `TVkQueuer`（queue ＋ command pool） |
| Buffer | `TCLBuffer<T>` | `TVkBuffer<T>`（storage buffer） |
| Image | `TCLImager2DxBGRAxUFix8` | `TVkImager2DxBGRAxUFix8` |
| Sampler | `TCLSamplr` | `TVkSamplr` |
| Program | `TCLExecut` ＋ `TCLBuildr`（runtime build） | `TVkShader`（offline SPIR-V ＋ reflection） |
| Kernel | `TCLKernel` | `TVkKernel`（compute pipeline） |

----
## ■ 2. Shader

### ⬤ 2.1. GLSL
The kernel is written in GLSL（[`_DATA/Execut.comp`](https://github.com/LUXOPHIA/Vulkan/blob/main/_DATA/Execut.comp)）, with a complex-number library（[`_DATA/Librar.glsl`](https://github.com/LUXOPHIA/Vulkan/blob/main/_DATA/Librar.glsl)）reproducing `Librar.cl` of the OpenCL demo.
The four kernel arguments of the OpenCL version map to four descriptor bindings:
> `GLSL`
> ```GLSL
> layout( std430, binding = 0 ) buffer TBuffer { TSingleC Cent; TSingleC Size; } Buffer;
> layout( binding = 1          ) uniform texture1D Textur;
> layout( binding = 2          ) uniform sampler   Samplr;
> layout( binding = 3, rgba8   ) writeonly uniform image2D Imager;
> ```

### ⬤ 2.2. SPIR-V
Vulkan consumes **SPIR-V**, not GLSL. `TVkShader` therefore compiles the GLSL **at runtime** with the embedded [glslang](https://github.com/KhronosGroup/glslang)（`glslang.dll`, committed in the `LUX.Vulkan` library）— no offline step, no Vulkan SDK, no CMake.
Just edit `_DATA/Execut.comp` and restart the app.
The `#include` is resolved by `TVkLibrar`, exactly as `#include<Librar.cl>` is resolved by `TCLLibrar` in the OpenCL demo.
`TVkShader` then reflects the generated SPIR-V, so the arguments are connected **by name**:
> `Object Pascal`
> ```Delphi
> _Kernel.Parames['Buffer'] := _Buffer;  // バッファーの登録
> _Kernel.Parames['Textur'] := _Textur;  // テクスチャの登録
> _Kernel.Parames['Samplr'] := _Samplr;  // サンプラーの登録
> _Kernel.Parames['Imager'] := _Imager;  // イメージ　の登録
> ```

----
## ■ 3. Reference

### ⬤ 3.1. [The Khronos Group Inc](https://www.khronos.org/)
* [Vulkan Registry](https://registry.khronos.org/vulkan/)
  * [Vulkan Specification](https://registry.khronos.org/vulkan/specs/latest/html/)
  * [Vulkan Guide](https://docs.vulkan.org/guide/latest/index.html)

### ⬤ 3.2. [GitHub](https://github.com)
* [The Khronos Group](https://github.com/KhronosGroup)
  * [Vulkan-Headers](https://github.com/KhronosGroup/Vulkan-Headers)
* [LUXOPHIA](https://github.com/LUXOPHIA)
  * [LUX.Vulkan](https://github.com/LUXOPHIA/LUX.Vulkan)
  * [OpenCL](https://github.com/LUXOPHIA/OpenCL)（the original demo）

----
* **Delphi IDE** @ Embarcadero  
https://www.embarcadero.com/jp/products/delphi/starter
