# VulkanCompute

[English](README.md) | [日本語](ja/README.md)

**VulkanCompute** is a minimal, compute-only [Vulkan](https://www.vulkan.org/) application written in Delphi (FireMonkey): an interactive **Mandelbrot set** renderer in which every pixel is evaluated by a **GLSL compute shader** on the GPU and colored through a 1D palette texture. The result is copied into a `TBitmap` and displayed on the form — no swapchain, no device context, no graphics pipeline at all.

![VulkanCompute](--------/_SCREENSHOT/VulkanCompute.png)

## 利用ライブラリ

* [**LUX**](https://github.com/LUXOPHIA/LUX) ：The foundation math library of LUXOPHIA.
* [**LUX.Vulkan**](https://github.com/LUXOPHIA/LUX.Vulkan) ：A wrapper library for the Vulkan API.

## 1. Overview

* **Compute-only Vulkan**: the GPU is used purely as a parallel computer. The rendered image travels back to the host and is shown as an ordinary FMX bitmap.
* **Runtime GLSL → SPIR-V compilation**: the kernel ([`_DATA/Execut.comp`](_DATA/Execut.comp)) is compiled **at runtime** by the bundled [glslang](https://github.com/KhronosGroup/glslang) DLL [4] — no offline step, no Vulkan SDK, no CMake. Edit the shader and restart the application.
* **SPIR-V reflection**: shader bindings are discovered from the compiled binary, so host arguments are connected **by name** (`_Kernel.Parames['Buffer'] := _Buffer;`).
* **In-memory `#include`**: the complex-number library ([`_DATA/Librar.glsl`](_DATA/Librar.glsl)) is registered with `TVkLibrar` and resolved by name via `GL_GOOGLE_include_directive`, without touching the file system.
* **Interactive**: spin the mouse wheel over the image to zoom in and out around the cursor, with smooth animation toward the target view.
* **Thin application layer**: all Vulkan plumbing is delegated to the [LUX.Vulkan](https://github.com/LUXOPHIA/LUX.Vulkan) library, vendored as a Git subtree under [`_LIBRARY/LUXOPHIA/LUX.Vulkan`](_LIBRARY/LUXOPHIA/LUX.Vulkan). [`Main.pas`](Main.pas) does little more than construct objects and connect them.

## 2. Technical Background

### 2.1. The Vulkan compute model

A compute dispatch launches a 3D grid of **workgroups**, each containing a fixed block of **invocations** whose size is declared in the shader [1][3]. The kernel declares

```GLSL
layout( local_size_x = 16, local_size_y = 16 ) in;
```

i.e. a local size $s = (16, 16, 1)$. `TVkKernel.Run` derives the workgroup count from the requested *global* size $G$ (here $500 \times 500$, the output image) by ceiling division:

```math
D_k = \left\lceil \frac{G_k}{L_k} \right\rceil, \qquad k \in \{x, y, z\}
```

so `vkCmdDispatch` receives $\lceil 500/16 \rceil = 32$ groups per axis — $512 \times 512$ invocations in total, and the shader discards the excess with a bounds guard (`if ( P.x >= S.x ) ... return;`). Each invocation identifies its pixel through `gl_GlobalInvocationID`, the global invocation ID $g = w \cdot s + l$, where $w$ is the workgroup ID and $l$ the local invocation ID [3].

### 2.2. Descriptor sets and resource binding

The shader's four descriptor bindings correspond one-to-one to the four host-side arguments:

```GLSL
layout( std430, binding = 0 ) buffer TBuffer { TSingleC Cent; TSingleC Size; } Buffer;
layout( binding = 1          ) uniform texture1D Textur;
layout( binding = 2          ) uniform sampler   Samplr;
layout( binding = 3, rgba8   ) writeonly uniform image2D Imager;
```

`TVkShader` compiles the GLSL through glslang [4] and then **reflects** the generated SPIR-V (entry points, `OpExecutionMode` local size, and the named bindings). `TVkKernel` uses this reflection to build the `VkDescriptorSetLayout` and `VkPipeline`, and to let arguments be assigned **by name**:

```Delphi
_Kernel.Parames['Buffer'] := _Buffer;  // storage buffer  : view center & size
_Kernel.Parames['Textur'] := _Textur;  // 1D texture      : color palette
_Kernel.Parames['Samplr'] := _Samplr;  // sampler         : palette interpolation
_Kernel.Parames['Imager'] := _Imager;  // storage image   : 500 × 500 output
```

### 2.3. Command submission and synchronization

Each `_Kernel.Run` records and submits one primary command buffer:

1. `PreRun` of every argument inserts **image memory barriers** (`vkCmdPipelineBarrier`) that transition the palette texture into a sampleable layout and the output into a storage-image layout [1];
2. `vkCmdBindPipeline` and `vkCmdBindDescriptorSets` bind the compute pipeline and its single descriptor set;
3. `vkCmdDispatch` launches the grid of Section 2.1;
4. `TVkQueuer.EndCommand` submits the buffer and blocks on `vkQueueWaitIdle`, making execution synchronous — the simplest correct scheme for a per-frame kernel.

### 2.4. The Mandelbrot kernel

Each invocation first maps its pixel $P$ of the $S_x \times S_y$ image to a point of the complex plane, using the view center and half-extent stored in the buffer:

```math
c = \left( \mathrm{Cent}_R + \mathrm{Size}_R \left( \frac{2 \left( P_x + 0.5 \right)}{S_x} - 1 \right) \right) + i \left( \mathrm{Cent}_I - \mathrm{Size}_I \left( \frac{2 \left( P_y + 0.5 \right)}{S_y} - 1 \right) \right)
```

It then iterates the quadratic map

```math
z_0 = 0, \qquad z_{n+1} = z_n^2 + c
```

up to $N_{\max} = 1000$ steps, using the complex operations (`Add`, `Mul`, `Pow2`, `Abs`) `#include`d from `Librar.glsl`. When the orbit escapes ($|z_n| > 2$), the escape time is smoothed into a continuous value to avoid color banding:

```math
\nu = n + 1 - \log \left( \log_2 |z_n| \right)
```

Finally the palette is sampled at the gamma-compressed coordinate

```math
t = \sqrt{ \nu / N_{\max} }
```

via `texture( sampler1D( Textur, Samplr ), t )`, and the color is written with `imageStore`.

On the host, a wheel notch scales the view by $1.1^{\Delta/120}$ with the cursor's complex coordinate as fixed point, and every timer tick interpolates the current view a quarter of the way toward the target before rewriting the mapped buffer — producing the smooth zoom animation.

## 3. Architecture

Ownership graph of the actual wrapper classes (all from LUX.Vulkan):

```
・TVulkan                          ･･･ instance / physical-device enumeration
  ┗・Devices[0] :TVkDevice        ･･･ selected physical GPU
     ┗・TVkContex                 ･･･ logical device — owns everything below
        ┣・TVkQueuer              ･･･ compute queue + command buffers
        ┣・TVkBuffer<TSingleC>    ･･･ binding 0 : view Cent / Size (SSBO)
        ┣・TVkImager1DxBGRAxUFix8 ･･･ binding 1 : 1D palette texture
        ┃  ┗・TVkStream1D..._FMX ･･･ Textur.png → staging → image
        ┣・TVkSamplr              ･･･ binding 2 : palette sampler
        ┣・TVkImager2DxBGRAxUFix8 ･･･ binding 3 : 500 × 500 output image
        ┃  ┗・TVkStream2D..._FMX ･･･ image → staging → TBitmap
        ┣・TVkLibrar              ･･･ Librar.glsl, resolved by #include name
        ┗・TVkShader              ･･･ glslang → SPIR-V → reflection
           ┗・TVkKernel           ･･･ VkPipeline + descriptor set (named args)
```

Per-frame data flow:

```
[ Per-frame data flow — nesting shows the sequence inside Timer1 ]

・Timer1
  ┣・_Buffer.Data
  ┃  ┣・Map
  ┃  ┣・write Cent, Size
  ┃  ┗・Unmap
  ┣・_Kernel.Run
  ┃  ┣・PreRun :vkCmdPipelineBarrier ･･･ (image layout transitions)
  ┃  ┣・vkCmdBindPipeline / vkCmdBindDescriptorSets
  ┃  ┣・vkCmdDispatch( ⌈500/16⌉, ⌈500/16⌉, 1 )
  ┃  ┗・vkQueueWaitIdle              ･･･ (synchronous)
  ┗・_ImaFMX.CopyTo( ImageR.Bitmap )
     ┗・GPU image
        ┗・TBitmap
           ┗・screen
```

Repository layout:

```
・VulkanCompute/
  ┣・VulkanCompute.dpr     ･･･ Project source (unit list)
  ┣・VulkanCompute.dproj   ･･･ RAD Studio project (Win32 / Win64)
  ┣・Main.pas / Main.fmx   ･･･ Main form: object construction + render loop
  ┣・_DATA/
  ┃  ┣・Execut.comp       ･･･ Compute shader (Mandelbrot kernel, GLSL)
  ┃  ┣・Librar.glsl       ･･･ Complex-number library (#include'd by name)
  ┃  ┗・Textur.png        ･･･ 1D palette texture
  ┣・_LIBRARY/
  ┃  ┗・LUXOPHIA/
  ┃     ┣・LUX/           ･･･ Base library (TSingleC complex type, lists, …)
  ┃     ┗・LUX.Vulkan/    ･･･ Vulkan wrapper library (Git subtree)
  ┗・--------/_SCREENSHOT/ ･･･ Screenshot
```

## 4. Usage

| Input | Action |
|---|---|
| Mouse wheel over the result image | Zoom in / out around the cursor (× 1.1 per notch, smoothly animated) |

| UI element | Contents |
|---|---|
| `System` tab | Vulkan instance / device information (saved to `System.txt` on exit) |
| `Program` › `Librar` tab | Source of `Librar.glsl` |
| `Program` › `Execut` tab | Source of `Execut.comp` |
| `Program` › `Build` tab | Compile log, SPIR-V size, entry points, local size, and reflected bindings |
| `Result` tab | The rendered Mandelbrot set (saved to `Imager.png` on exit) |

If GLSL compilation fails, the application automatically switches to the `Build` tab and shows the glslang error log.

## 5. Building

1. Open [`VulkanCompute.dproj`](VulkanCompute.dproj) in **RAD Studio** (Delphi / FireMonkey).
2. Select a target platform — **Win32** or **Win64** — and build.
3. Run from the default output directory (e.g. `Win64\Debug`): the shader sources are loaded from the relative path `..\..\_DATA\`.

Requirements:

* A **Vulkan-capable GPU and driver** providing the `vulkan-1.dll` runtime. The **Vulkan SDK is not required**.
* **glslang.dll** next to the executable, for runtime GLSL compilation. Prebuilt binaries are bundled in the library at [`_LIBRARY/LUXOPHIA/LUX.Vulkan/_DLL/Win32`](_LIBRARY/LUXOPHIA/LUX.Vulkan/_DLL/Win32) and [`.../Win64`](_LIBRARY/LUXOPHIA/LUX.Vulkan/_DLL/Win64).

There is no offline shader-compilation step: `TVkShader` compiles `_DATA/Execut.comp` to SPIR-V every time the application starts (Section 2.2).

## 6. References

1. Khronos Group, [*Vulkan Specification*](https://registry.khronos.org/vulkan/specs/latest/html/).
2. Khronos Group, [*Vulkan Guide*](https://docs.vulkan.org/guide/latest/index.html).
3. Khronos Group, [*The OpenGL Shading Language 4.60 Specification*](https://registry.khronos.org/OpenGL/specs/gl/GLSLangSpec.4.60.html) — Compute Shaders.
4. KhronosGroup, [*glslang*](https://github.com/KhronosGroup/glslang) — Khronos-reference GLSL → SPIR-V compiler.

## 💖 [Embarcadero](https://www.embarcadero.com/) [**Delphi**](https://www.embarcadero.com/products/delphi)
Integrated Development Environment (IDE) for Creating Native Cross-Platform Apps.
### Free Download: [**Delphi** Community Edition](https://www.embarcadero.com/products/delphi/starter)
