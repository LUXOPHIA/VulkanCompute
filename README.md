<!---
layout: page
title: "README (English)"
permalink: /
-->
[`［日本語］`](https://luxophia.github.io/VulkanCompute/ja/)

# [VulkanCompute](https://github.com/LUXOPHIA/VulkanCompute/)
Parallel computing with [Vulkan](https://en.wikipedia.org/wiki/Vulkan) compute shaders on GPUs.

An interactive **Mandelbrot set** renderer: every pixel is computed by a **GLSL compute shader** on the GPU, and colored through a 1D palette texture.
Spin the mouse wheel over the image to zoom in and out around the cursor.

The rendering result is written to a `TBitmap` and shown on the form — no device context, no swapchain, no graphics API at all: this is a minimal, **compute-only** Vulkan application.

![](https://github.com/LUXOPHIA/VulkanCompute/raw/main/--------/_SCREENSHOT/VulkanCompute.png)

----
## ■ 1. [`LUX.Vulkan`](https://luxophia.github.io/LUX.Vulkan/) Library

Everything related to Vulkan is delegated to the [`LUX.Vulkan`](https://github.com/LUXOPHIA/LUX.Vulkan/) library, introduced as a subtree under [`/_LIBRARY/LUXOPHIA/LUX.Vulkan`](https://github.com/LUXOPHIA/VulkanCompute/tree/main/_LIBRARY/LUXOPHIA/LUX.Vulkan).
[`Main.pas`](https://github.com/LUXOPHIA/VulkanCompute/blob/main/Main.pas) therefore consists of little more than constructing objects and connecting them:

| Class | Role in this demo |
|---|---|
| `TVulkan` | Detects the GPUs present on the machine |
| `TVkDevice` | The selected physical device (GPU) |
| `TVkContex` | The logical device that owns everything below |
| `TVkQueuer` | Submits the compute commands to the GPU |
| `TVkBuffer<TSingleC>` | The center and the size of the displayed area |
| `TVkImager1DxBGRAxUFix8` | The 1D palette texture |
| `TVkSamplr` | Interpolates the palette |
| `TVkImager2DxBGRAxUFix8` | The 500 × 500 output image |
| `TVkLibrar` | The `#include`d complex-number library |
| `TVkShader` | Compiles the GLSL, and reflects the generated SPIR-V |
| `TVkKernel` | The compute pipeline, dispatched on every timer tick |

----
## ■ 2. Shader

### ⬤ 2.1. GLSL
The kernel is written in GLSL（[`_DATA/Execut.comp`](https://github.com/LUXOPHIA/VulkanCompute/blob/main/_DATA/Execut.comp)）, and `#include`s a small complex-number library（[`_DATA/Librar.glsl`](https://github.com/LUXOPHIA/VulkanCompute/blob/main/_DATA/Librar.glsl)）.
Its four descriptor bindings correspond to the four arguments supplied by the host:
> `GLSL`
> ```GLSL
> layout( std430, binding = 0 ) buffer TBuffer { TSingleC Cent; TSingleC Size; } Buffer;
> layout( binding = 1          ) uniform texture1D Textur;
> layout( binding = 2          ) uniform sampler   Samplr;
> layout( binding = 3, rgba8   ) writeonly uniform image2D Imager;
> ```

### ⬤ 2.2. SPIR-V
Vulkan consumes **SPIR-V**, not GLSL — the driver has no built-in shader compiler.
`TVkShader` therefore compiles the GLSL **at runtime** with the embedded [glslang](https://github.com/KhronosGroup/glslang)（`glslang.dll`, committed in the `LUX.Vulkan` library）, so no offline step, no Vulkan SDK and no CMake are required.
Just edit `_DATA/Execut.comp` and restart the app.
The `#include` is resolved **by name** through `TVkLibrar`, without touching the file system.

`TVkShader` then **reflects** the generated SPIR-V, so the arguments are connected **by name** too:
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
  * [glslang](https://github.com/KhronosGroup/glslang)
* [LUXOPHIA](https://github.com/LUXOPHIA)
  * [LUX.Vulkan](https://github.com/LUXOPHIA/LUX.Vulkan)

----
* **Delphi IDE** @ Embarcadero  
https://www.embarcadero.com/jp/products/delphi/starter
