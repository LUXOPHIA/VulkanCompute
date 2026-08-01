# LUX.Vulkan
[English](README.md) | [日本語](ja/README.md)

A Delphi class library that drives the GPU through the Vulkan API [1] from **GLSL**.
Every Vulkan handle is wrapped in exactly one class, and the classes form a tree that mirrors the ownership of the underlying handles, so creation order and object lifetimes are handled for you.

1. [Overview](#1-overview)
2. [Technical Background](#2-technical-background)
3. [Architecture](#3-architecture)
4. [API Reference](#4-api-reference)
5. [Usage: Compute](#5-usage-compute)
6. [Usage: Graphics](#6-usage-graphics)
7. [Design Conventions](#7-design-conventions)
8. [Requirements](#8-requirements)
9. [References](#9-references)

## 利用ライブラリ

* [**LUX**](https://github.com/LUXOPHIA/LUX) ：Foundation library supplying `LUX.Code.C`, `LUX.Color`, the vector/matrix types and the `LUX.Data.List` / `LUX.Data.Tree` containers used throughout.

----
## 1. Overview

Both halves of Vulkan are covered:

* **Compute** — dispatch compute shaders（`TVkKernel`）.
* **Graphics** — draw a scene graph with the rasterizer（`TVkRaster`）, either offscreen into a `TBitmap`（`TVkRender`）or into a window through a swapchain（`TVkViewer`）.

The library is self-contained on the tooling side: the Vulkan headers are translated to Delphi in-tree, and the GLSL compiler（glslang [5]）is shipped as a committed DLL, so **neither the Vulkan SDK nor CMake is required** to build an application — Delphi alone is enough（see [§ 8](#8-requirements)）.

Three properties characterise the design:

* **One class per handle.** Each Vulkan handle type has exactly one wrapper class, and the classes are jointed into a tree in the same shape as the handles' ownership graph（[§ 3.4](#34-ownership-and-data-flow)）.
* **Lazy creation.** A `Handle` property creates its handle the first time it is read; changing a creation parameter destroys it and defers the rebuild（[§ 7.1](#71-handles-are-created-lazily)）.
* **Reflection instead of declaration.** Descriptor bindings, entry points and `local_size` are recovered from the SPIR-V by this library's own reflector, so arguments are connected **by name**（[§ 5.7](#57-kernel)）.

----
## 2. Technical Background

### 2.1 The Vulkan object model

Vulkan exposes no global state. Every object is created from, and outlives no longer than, a parent object, which makes the API a strict ownership chain:

```
[ Ownership chain ]
・VkInstance（loader）
  ┗・VkPhysicalDevice（enumerated）
     ┗・VkDevice（logical）
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

[ Presentation chain ]
・VkSurfaceKHR
  ┗・VkSwapchainKHR
     ┗・VkImage[]
        ┗・VkImageView[]
           ┗・VkFramebuffer[]
```

* **Instance** — the loader's entry point. Instance-level extensions（`VK_KHR_surface`, `VK_KHR_win32_surface`）are chosen here and cannot be added afterwards.
* **Physical device** — a GPU. It is only ever *enumerated*; there is no create and no destroy call. Its queue families and memory types are what the next step is chosen from.
* **Logical device** — the working context. Device extensions（`VK_KHR_swapchain`）and the queue families to open are fixed at creation, so every resource below it is invalidated if they change.
* **Queue** — work is never executed directly; it is recorded into a command buffer allocated from a command pool and submitted to a queue.
* **Swapchain** — presentation is an extension, not core. A platform surface（`VkSurfaceKHR`, from an `HWND` on Windows）is turned into a rotating set of images, each of which needs its own view and framebuffer.
* **Render pass** — the attachments' formats, load/store behaviour and layout transitions, declared up front. A graphics pipeline is baked against one.
* **Pipeline** — the whole of the fixed-function state plus the shader stages, compiled into one immutable object. Only the states explicitly declared *dynamic*（here: viewport and scissor）can be changed without a rebuild.

This library maps that chain onto classes one-to-one:

| Vulkan handle | Class |
|---|---|
| `VkInstance` | `TVkDevices` |
| `VkPhysicalDevice` | `TVkDevice` |
| `VkDevice` | `TVkContex` |
| `VkQueue` ＋ `VkCommandPool` | `TVkQueuer` |
| `VkBuffer` ＋ `VkDeviceMemory` | `TVkBuffer<TValue_>` |
| `VkImage` ＋ `VkImageView` ＋ `VkDeviceMemory` | `TVkImager<TValue_>` |
| `VkSampler` | `TVkSamplr` |
| `VkShaderModule` | `TVkShader` |
| `VkPipeline`（compute）＋ its descriptor objects | `TVkKernel` |
| `VkRenderPass` | `TVkPasser` |
| `VkPipeline`（graphics）＋ `VkPipelineLayout` | `TVkRaster` |
| `VkPipelineShaderStageCreateInfo` | `TVkStager` |
| `VkSurfaceKHR` ＋ `VkSwapchainKHR` ＋ framebuffers | `TVkSwaper` |

Because the class tree has the same shape as the handle chain, freeing a node frees exactly the handles that Vulkan requires to be destroyed with it, in the order Vulkan requires.

### 2.2 GLSL, SPIR-V and runtime compilation

Vulkan consumes **SPIR-V** [3], not GLSL — the driver has no built-in shader compiler.
This library therefore embeds glslang [5]（the Khronos reference compiler, introduced as a subtree under `/：KhronosGroup/glslang`）so that GLSL can be compiled **at runtime**.

Reflection, on the other hand, is **not** delegated: this library parses the SPIR-V module itself to recover descriptor bindings, entry points and `local_size`. The consequence is that a `.spv` that was merely loaded from disk behaves exactly like one just compiled — the same names are available to bind against, with no compiler involved（[§ 8.3](#83-shipping-without-glslangdll)）.

`#include` is resolved through the `GL_GOOGLE_include_directive` extension [6] by **name**, against the `TVkLibrar` objects registered on the context. No file system access and no textual pre-expansion take place.

#### 2.2.1 GLSL only

glslang can also compile **HLSL**, but this library supports **GLSL only** — `TVkShader` always selects the GLSL front-end.

This is deliberate: the HLSL front-end of glslang is **deprecated and will be removed in a future major release** [7], so building on it would be a dead end.
If you need HLSL, use DXC [8]（which emits SPIR-V directly）instead.
Slang [9] is a separate compiler altogether and is not part of glslang.

Note also that the source language is **never auto-detected** — GLSL and HLSL are chosen explicitly through `glslang_input_t.language`.

### 2.3 Coordinate systems and the transform chain

#### 2.3.1 Vulkan clip-space conventions

**Vulkan's clip space is not OpenGL's.** After the perspective divide, the normalised device coordinates satisfy

```math
x_{\text{ndc}} \in [-1,\,1] \;(\text{right}), \qquad
y_{\text{ndc}} \in [-1,\,1] \;(\textbf{down}), \qquad
z_{\text{ndc}} \in [\,0,\,1\,]
\tag{1}
```

Not just the direction of $y$ but the range of $z$ differs from OpenGL's $z \in [-1,1]$, i.e. the coordinate structure itself is a different one. Writing the Vulkan-convention matrix directly is therefore more honest than forcing `LUX.D4x4`'s `TSingleM4.ProjPers` ／ `ProjOrth`（OpenGL convention）into line with a conversion matrix.

Only the projection is special — `TVkObject.LocalPose` and friends stay `TSingleM4` — so nothing about this inconveniences the caller.

> ※ Setting a negative `VkViewport.height` only fixes $y$; the $z$ range still differs. The projection has to deal with it either way.

#### 2.3.2 The transform chain

A vertex is carried from its own node's space to clip space by

```math
\mathbf{p}_{\text{clip}} \;=\; \mathbf{P}\,\mathbf{V}\,\mathbf{M}\;\mathbf{p}_{\text{local}}
\tag{2}
```

where $\mathbf{M}$ is the node's global pose, $\mathbf{V}$ the view matrix and $\mathbf{P}$ the projection. The global pose is the product of the local poses along the path from the root, and the view matrix is the camera's global pose inverted:

```math
\mathbf{M} \;=\; \mathbf{L}_1 \mathbf{L}_2 \cdots \mathbf{L}_k ,
\qquad
\mathbf{V} \;=\; \mathbf{M}_{\text{camera}}^{-1}
\tag{3}
```

Vulkan has no matrix stack, so `TVkObject.Draw` accumulates $\mathbf{M}$ and passes it down as an argument. The product $\mathbf{P}\mathbf{V}$ is computed once per traversal by the camera and carried in `TVkDrawer.ProjView`; both it and $\mathbf{M}$ reach the shader as push constants:

> `GLSL`
> ```GLSL
> layout( push_constant ) uniform Push { mat4 ProjViewPose; mat4 Pose; } uPush;
> ```

The matrix type is `TSingleM4` for both 2D and 3D — that is the form the GPU wants, and a 2D `TSingleM3` converts implicitly.

#### 2.3.3 Perspective projection

`VkProjPers3D( SizeX_, SizeY_, FocusZ_, NeaZ_, FarZ_ )` builds the perspective matrix for a screen of $s_x \times s_y$ seen from a distance $d$, with clip planes at $n$ and $f$:

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

The camera looks down $-z$, so $w_{\text{clip}} = -z$ is the distance from the eye; the negated $k_y$ produces the Y-down convention of (1), and $k_z$ maps $z = -n \mapsto z_{\text{ndc}} = 0$ and $z = -f \mapsto z_{\text{ndc}} = 1$.

#### 2.3.4 Orthographic projection

`VkProjOrth3D( SizeX_, SizeY_, NeaZ_, FarZ_ )` uses the screen itself as the field:

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

The 2D layer's `VkProjOrth2D( SizeX_, SizeY_ )` differs in two ways: $k_y$ is **not** negated — the 2D coordinate system already has Y pointing down, matching `LUX.CG2D` — and depth is unused, so $z_{\text{ndc}}$ is pinned to the middle of the range:

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

#### 2.3.5 Focal length instead of field of view

`TVkCameraPers3D` carries a **focal length `FocusZ`** rather than a field-of-view angle: the field is what you see looking at the screen（$s_x \times s_y$）from a distance $d$. The angles `AngleX` ／ `AngleY` are derived from it,

```math
\theta_x = 2\arctan\!\frac{s_x}{2d}, \qquad
\theta_y = 2\arctan\!\frac{s_y}{2d}
\tag{8}
```

and writing one moves $d$ while keeping the screen size — i.e. it zooms.

#### 2.3.6 Camera aspect and destination aspect

A camera's field comes from `SizeX` ／ `SizeY` alone, while the destination deforms freely to suit the UI. **The projection is unaffected by the destination's aspect ratio**; the difference is absorbed by the drawing side, which letterboxes the viewport:

```pascal
V := VkFitViewport( _Camera.SizeX, _Camera.SizeY, DstX, DstY );  // centred, as large as fits
```

For a destination of $w_d \times h_d$ pixels, the viewport is the largest rectangle of the camera's aspect that fits, centred:

```math
(w,\,h) =
\begin{cases}
\left( h_d\,\dfrac{s_x}{s_y}, \;\; h_d \right) & \text{if } w_d\,s_y > h_d\,s_x \quad (\text{destination wider}) \\[8pt]
\left( w_d, \;\; w_d\,\dfrac{s_y}{s_x} \right) & \text{otherwise}
\end{cases}
\qquad
(x,\,y) = \left( \frac{w_d-w}{2}, \;\; \frac{h_d-h}{2} \right)
\tag{9}
```

Nothing has to fill the bars. The render pass clears the **whole destination** with the background colour and the scissor stays full, so whatever lies outside the viewport simply keeps that colour. Match the camera's aspect ratio to the destination and no bars appear at all.

----
## 3. Architecture

### 3.1 File layout

```
・LUX.Vulkan/
  ┣・LUX.Vulkan.pas                             ･･･ Concrete aliases of /Core
  ┣・Vulkan/                                    ･･･ port of official C headers
  ┃  ┣・vk_platform.pas                        ･･･ Platform-specific types
  ┃  ┣・vulkan_core.pas                        ･･･ API 1.0-1.4 ＋ all exts
  ┃  ┣・vulkan_win32.pas                       ･･･ All Win32 blocks
  ┃  ┣・vulkan_functions.pas                   ･･･ Dynamic entry loading
  ┃  ┗・vk_video/                              ･･･ Video codec std types
  ┣・Glslang/                                   ･･･ GLSL compiler binding
  ┃  ┣・glslang_c_shader_types.pas             ･･･ Enums
  ┃  ┣・glslang_c_interface.pas                ･･･ DefaultTBuiltInResource
  ┃  ┗・glslang_functions.pas                  ･･･ Loads glslang.dll commands
  ┣・Core/                                      ･･･ core classes（all generic）
  ┃  ┣・LUX.Vulkan.core.pas                    ･･･ TVkVersion / EVkError etc.
  ┃  ┣・LUX.Vulkan.Device.pas                  ･･･ TVkDevices ／ TVkDevice
  ┃  ┣・LUX.Vulkan.Contex.pas                  ･･･ TVkContexs ／ TVkContex
  ┃  ┣・LUX.Vulkan.Queuer.pas                  ･･･ TVkQueuers ／ TVkQueuer
  ┃  ┣・LUX.Vulkan.Argume*.pas                 ･･･ buffer / image / sampler
  ┃  ┣・LUX.Vulkan.Shader.pas                  ･･･ SPIR-V reflection
  ┃  ┣・LUX.Vulkan.Kernel.pas                  ･･･ TVkKernel ／ TVkParame etc.
  ┃  ┣・LUX.Vulkan.Passer.pas                  ･･･ TVkPasser（VkRenderPass）
  ┃  ┣・LUX.Vulkan.Raster.pas                  ･･･ TVkRaster ／ TVkStager
  ┃  ┗・LUX.Vulkan.Show.pas                    ･･･ Diagnostic system-info dump
  ┣・Graphics/                                  ･･･ Scene graph ＋ rasterizer
  ┃  ┣・LUX.Vulkan.Graphics.pas                ･･･ TVkObject ／ TVkShaper etc.
  ┃  ┣・LUX.Vulkan.Graphics.Swaper.pas         ･･･ TVkSwaper（swapchain）
  ┃  ┣・LUX.Vulkan.Render.pas                  ･･･ TVkRender（offscreen）
  ┃  ┣・LUX.Vulkan.Viewer.pas ／ .fmx          ･･･ TVkViewer, on-screen TFrame
  ┃  ┣・3D/
  ┃  ┃  ┣・LUX.Vulkan.Graphics.D3.pas         ･･･ 3D ＋ VkProj{Pers,Orth}3D
  ┃  ┃  ┗・LUX.Vulkan.Graphics.D3.Shapers.pas ･･･ TVkCube3D
  ┃  ┗・2D/
  ┃     ┗・LUX.Vulkan.Graphics.D2.pas          ･･･ 2D layer ＋ VkProjOrth2D
  ┣・Stream/                                    ･･･ TVkImager ⇄ TBitmap
  ┃  ┣・LUX.Vulkan.Stream.FMX.D1.pas
  ┃  ┗・LUX.Vulkan.Stream.FMX.D2.pas
  ┣・_DLL/                                      ･･･ Prebuilt glslang.dll
  ┗・：KhronosGroup/                            ･･･ Upstream sources (subtrees)
     ┣・Vulkan-Headers/                         ･･･ [4]
     ┗・glslang/                                ･･･ [5]
```

#### 3.1.1 `/Vulkan` : Import library

Delphi translations of the official C headers（Vulkan-Headers [4], introduced as a subtree under `/：KhronosGroup`）.

**Whatever header is ported is ported in full.** That means all 438 feature blocks of `vulkan_core.h` (5 core versions, 1.0 through 1.4, plus 433 extensions) and all 9 blocks of `vulkan_win32.h`, including APIs no demo ever calls. The 12 headers under `vk_video/` are included for the same reason — `vulkan_core.h` `#include`s them. The remaining headers in `include/vulkan/` (surfaces for other platforms, etc.) are not ported.

Naming follows a mechanical convention:
C type `VkFoo` → `T_VkFoo` ／ pointer `P_VkFoo` ／ function type `PFN_vkFoo` → `T_PFN_vkFoo`.
All constants (`VK_...`) keep their original names.
C bitfields are folded into 32-bit storage words and exposed as named properties (`vk_video/` only).

Entry points are loaded in three stages. `LoadFunctions` takes what `vulkan-1.dll` exports (core plus some WSI), `LoadInstanceFunctions( instance )` fills in every entry — extensions included — through `vkGetInstanceProcAddr`, and `LoadDeviceFunctions( device )` re-resolves the device tier through `vkGetDeviceProcAddr`. **Extension commands are not exported by the DLL, so the second stage is mandatory if you use any extension.**

#### 3.1.2 `/Glslang` : GLSL compiler

The binding to glslang [5]. See [§ 2.2](#22-glsl-spir-v-and-runtime-compilation) for why a compiler is needed at all, and [§ 8.2](#82-shader-compilation-and-glslangdll) for what has to be shipped.

#### 3.1.3 `/Core` ＋ `LUX.Vulkan.pas` : The core class library

From devices, queues, memory and shaders through the compute pipeline to the render pass and rasterization pipeline — every class that wraps a Vulkan handle.
It is written entirely as generic classes; `LUX.Vulkan.pas` instantiates them with `TVkSystem` at the apex and publishes concrete aliases. **Those aliases are what you use**（[§ 3.3](#33-the-generic-layer-and-its-concrete-aliases)）.

#### 3.1.4 `/Graphics` : Scene graph ＋ rasterizer

The swapchain, plus the scene graph and two destinations built on top of it.
Unlike `/Core` it is not generic — it uses the concrete types from `LUX.Vulkan.pas` directly（the same approach as `/Stream`）.

#### 3.1.5 `/Stream` : FMX streams

Copy images between `TVkImager` and FireMonkey `TBitmap`.

### 3.2 Class hierarchy

`（G）` marks a generic; the concrete aliases published by `LUX.Vulkan.pas` share the same names.

```
・TObject
  ┣・TVkSystem                             ･･･ The system（TVulkan holds it）
  ┣・TVulkan                               ･･･ Singleton of TVkSystem
  ┃
  ┣・TListParent
  ┃  ┗・TListParent<>
  ┃     ┣・TVkDevices（G）                ･･･ Physical device list
  ┃     ┣・TVkContexs（G）                ･･･ Context list
  ┃     ┣・TVkQueuers（G）                ･･･ Queue list
  ┃     ┣・TVkArgumes（G）                ･･･ Argument list
  ┃     ┣・TVkLibrars（G）                ･･･ Library list
  ┃     ┣・TVkShaders（G）                ･･･ Shader list
  ┃     ┣・TVkKernels（G）                ･･･ Kernel list
  ┃     ┣・TVkParames（G）                ･･･ Parameter list
  ┃     ┣・TVkPassers（G）                ･･･ Render pass list
  ┃     ┣・TVkRasters（G）                ･･･ Pipeline list
  ┃     ┗・TVkStagers（G）                ･･･ Shader stage list
  ┃
  ┣・TListChildr
  ┃  ┗・TListChildr<>
  ┃     ┣・TVkDevice（G）                 ･･･ Physical device
  ┃     ┣・TVkContex（G）                 ･･･ Context（logical device）
  ┃     ┣・TVkQueuer（G）                 ･･･ Queue
  ┃     ┣・TVkArgume（G）                 ･･･ Base of every argument
  ┃     ┃  ┣・TVkSamplr（G）             ･･･ Sampler
  ┃     ┃  ┗・TVkMemory（G）             ･･･ memory-backed argument base
  ┃     ┃     ┣・TVkBuffer<TValue_>（G） ･･･ Buffer
  ┃     ┃     ┗・TVkImager<TValue_>（G） ･･･ Image
  ┃     ┃        ┗・TVkImager1D<TValue_>
  ┃     ┃           ┗・TVkImager2D<TValue_>
  ┃     ┃              ┗・TVkImager3D<TValue_>
  ┃     ┣・TVkLibrar（G）                 ･･･ GLSL library
  ┃     ┣・TVkShader（G）                 ･･･ Shader module
  ┃     ┣・TVkKernel（G）                 ･･･ Compute pipeline
  ┃     ┣・TVkParame（G）                 ･･･ Parameter
  ┃     ┣・TVkPasser（G）                 ･･･ Render pass
  ┃     ┣・TVkRaster（G）                 ･･･ Rasterization pipeline
  ┃     ┃  ┣・TVkRaster2D                ･･･ for 2D（layout, push constants）
  ┃     ┃  ┗・TVkRaster3D                ･･･ for 3D（ditto）
  ┃     ┗・TVkStager（G）                 ･･･ One shader stage
  ┃
  ┣・TVkMemDat（G）                        ･･･ A memory map（host-side window）
  ┃  ┣・TVkBufDat<TValue_>（G）           ･･･ Mapping of a buffer
  ┃  ┗・TVkImaDat<TValue_>（G）           ･･･ Mapping of an image
  ┃     ┗・TVkImaDat1D
  ┃        ┗・TVkImaDat2D
  ┃           ┗・TVkImaDat3D
  ┃
  ┣・TVkBinary（G）                        ･･･ SPIR-V binary
  ┣・TStringList
  ┃  ┣・TVkSource（G）                    ･･･ GLSL source of a shader
  ┃  ┗・TVkLibSrc（G）                    ･･･ GLSL source of a library
  ┣・Exception
  ┃  ┗・EVkError                          ･･･ A Vulkan error
  ┃
  ┣・TVkSwaper                             ･･･ Surface ＋ swapchain
  ┣・TVkDrawer                             ･･･ State for one traversal
  ┣・TVkRender                             ･･･ Offscreen renderer
  ┃
  ┣・TTreeKnot<>
  ┃  ┗・TVkObject                         ･･･ Scene node（also a group）
  ┃     ┣・TVkShaper                      ･･･ A node that draws something
  ┃     ┃  ┣・TVkShaper2D
  ┃     ┃  ┗・TVkShaper3D
  ┃     ┃     ┗・TVkCube3D               ･･･ Box
  ┃     ┣・TVkCamera                      ･･･ A viewpoint
  ┃     ┃  ┣・TVkCamera2D
  ┃     ┃  ┗・TVkCamera3D
  ┃     ┃     ┣・TVkCameraPers3D         ･･･ perspective
  ┃     ┃     ┗・TVkCameraOrth3D         ･･･ orthographic
  ┃     ┗・TVkScener                      ･･･ Scene root（any dimension）
  ┃
  ┣・TInterfacedObject
  ┃  ┗・TVkStream1D_FMX<>
  ┃     ┗・TVkStream2D_FMX<>              ･･･ FMX streams
  ┗・TFrame
     ┗・TVkViewer                          ･･･ On-screen viewer
```

### 3.3 The generic layer and its concrete aliases

The concrete aliases in `LUX.Vulkan.pas` simply pin the type arguments along the chain

```
・TVkSystem
  ┗・TVkDevices
     ┗・TVkDevice
        ┗・TVkContexs
           ┗・TVkContex
              ┗・…
```

| Generic | Concrete alias |
|---|---|
| `TVkDevices<TVkSystem>` | `TVkDevices` |
| `TVkDevice<TVkSystem>` | `TVkDevice` |
| `TVkContexs<TVkSystem,TVkDevice>` | `TVkContexs` |
| `TVkContex<TVkSystem,TVkDevice>` | `TVkContex` |
| `TVkQueuers` ／ `TVkQueuer` ／ `TVkArgumes` ／ `TVkArgume` ／ `TVkSamplr` ／ `TVkMemory` | same name |
| `TVkLibrars` ／ `TVkLibrar` ／ `TVkShaders` ／ `TVkShader` | same name |
| `TVkKernels` ／ `TVkKernel` ／ `TVkParames` ／ `TVkParame` | same name |
| `TVkPassers` ／ `TVkPasser` ／ `TVkRasters` ／ `TVkRaster` ／ `TVkStagers` ／ `TVkStager` | same name |
| `TVkBuffer<TVkSystem,TVkDevice,TVkContex,TValue_>` | `TVkBuffer<TValue_>` |
| `TVkImager{1,2,3}Dx{BGRAxUInt8,BGRAxUFix8,RGBAxUInt32,RGBAxSFlo32}` | same name（12 classes） |

### 3.4 Ownership and data flow

**Freeing a node frees its whole subtree.** A list owns its children; a child owns the handles below it.

```
・TVulkan（a class; released when the program ends）
  ┗・TVkSystem
     ┗・TVkDevices                            ･･･ VkInstance
        ┗・TVkDevice                          ･･･ VkPhysicalDevice, enumerated
           ┗・TVkContexs
              ┗・TVkContex                    ･･･ VkDevice
                 ┣・TVkQueuers
                 ┃  ┗・TVkQueuer             ･･･ VkQueue ＋ VkCommandPool
                 ┣・TVkArgumes
                 ┃  ┣・TVkSamplr             ･･･ VkSampler
                 ┃  ┣・TVkBuffer             ･･･ VkBuffer ＋ VkDeviceMemory
                 ┃  ┃  ┗・TVkBufDat         ･･･ the mapped pointer
                 ┃  ┗・TVkImager             ･･･ VkImage + view/memory/staging
                 ┃     ┗・TVkImaDat          ･･･ the mapped pointer
                 ┣・TVkLibrars
                 ┃  ┗・TVkLibrar
                 ┃     ┗・TVkLibSrc          ･･･ GLSL source
                 ┣・TVkShaders
                 ┃  ┗・TVkShader             ･･･ VkShaderModule
                 ┃     ┣・TVkSource          ･･･ GLSL source
                 ┃     ┣・TVkBinary          ･･･ SPIR-V
                 ┃     ┗・TVkKernels
                 ┃        ┗・TVkKernel       ･･･ compute pipeline, descriptors
                 ┃           ┗・TVkParames
                 ┃              ┗・TVkParame ･･･ → TVkArgume（reference）
                 ┣・TVkPassers
                 ┃  ┗・TVkPasser             ･･･ VkRenderPass
                 ┗・TVkRasters
                    ┗・TVkRaster              ･･･ VkPipeline ＋ layout
                       ┣・TVkStagers
                       ┃  ┗・TVkStager       ･･･ → TVkShader（reference）
                       ┗・Passer              ･･･ → TVkPasser（reference）
```

The screen-side objects（swapchain, destinations, scene graph）are **owned by the caller**. They only reference a context, so free them before the `TVkContex`.

```
・TVkSwaper                ･･･ surface ＋ swapchain ＋ FB ＋ depth ＋ semaphores

・TVkRender
  ┣・TVkPasser（a child of Contex; created and freed here）
  ┣・TVkTarget2D（ditto） ･･･ the color attachment; a TVkImager2DxBGRAxUFix8
  ┣・depth（VkImage ＋ VkImageView ＋ VkDeviceMemory）
  ┣・VkFramebuffer
  ┗・Camera               ･･･ → TVkCamera（reference only）

・TVkViewer（TFrame）
  ┣・the child HWND（WS_CHILD）
  ┣・TVkPasser（a child of Contex; created and freed here）
  ┣・TVkSwaper（owned）
  ┣・TVkRender（owned; only while Direct = False）
  ┗・Camera               ･･･ → TVkCamera（reference only）
```

The scene graph is a tree of nodes; `Free` releases the whole subtree.

```
・TVkScener（the root; cannot have a parent）
  ┗・TVkObject
     ┣・TVkObject（nested）
     ┣・TVkShaper       ･･･ → Raster: TVkRaster（reference only）
     ┃  ┗・TVkShaper3D ･･･ TVkVerBuf3D ＋ TVkIndBuf3D（owned）
     ┗・TVkCamera
```

Drawing flows in the opposite direction to ownership. A destination opens a command buffer, creates a `TVkDrawer`, and hands it to the camera, which composes $\mathbf{P}\mathbf{V}$ and walks the tree:

```
[ Draw order ]
・TVkRender ／ TVkViewer（the destination）
  ┗・BeginFrame → VkRecordScene
     ┗・TVkDrawer（Comman ＋ Passer ＋ ProjView）
        ┗・Camera.Render
           ┗・TVkScener
              ┗・TVkObject
                 ┗・…
                    ┗・TVkShaper.DrawMain
                       ┗・Drawer.BindRaster( Raster )
                          ┗・TVkRaster
                             ┗・VkCmdDraw* → the command buffer
```

### 3.5 Records, enumerations and exceptions

| Type | Meaning |
|---|---|
| `TVkVersion` | A Vulkan version. `Major` ／ `Minor` ／ `Patch` ／ `ToString` |
| `TVkNames` | Holds a string array as a C `char*` array（for `ppEnabled*Names`） |
| `TVkMapMode` ／ `TVkMapModes` | What a mapping is for（`Read` ／ `Write`）; decides the transfer direction for images |
| `TVkBinding` | A descriptor found by reflection（`Name` ／ `DescSet` ／ `Binding` ／ `DescriTyp`） |
| `TVkSpirTyp` ／ `TVkSpirVar` | Intermediate SPIR-V parsing data（internal） |
| `TVkHeders` | "header name → GLSL" dictionary used to resolve `#include` |
| `TLoop3D` | Invocation counts（X ／ Y ／ Z） |
| `TVkVertex2D` ／ `TVkVertex3D` | The standard vertex（16 ／ 32 bytes） |
| `TVkIndex2D` ／ `TVkIndex3D` | An index（a record wrapping `T_uint32_t`） |
| `TVkPush2D` ／ `TVkPush3D` | Push constants（128 bytes each） |
| `EVkError` | A Vulkan error; carries the `T_VkResult` in `Code` |

----
## 4. API Reference

### 4.1 System and devices

#### 4.1.1 `TVulkan`
The singleton of `TVkSystem`. Everything is a class member so you never handle the instance. On unit initialization it loads `vulkan-1.dll`, creates the `VkInstance` and enumerates the physical devices.

| Member | Meaning |
|---|---|
| `Available :Boolean` | Whether `vulkan-1.dll` is available |
| `Devices :TVkDevices` | The physical devices |
| `Show( Strings_ )` | Dump system information into a `TStrings`（diagnostics） |

#### 4.1.2 `TVkSystem`
The apex of the tree. It only owns `Devices`, and gives the generic type parameter `TVkSystem_` something concrete to be.

#### 4.1.3 `TVkDevices` ── VkInstance
The list of physical devices, and **the owner of the `VkInstance`**. On first touch it creates the instance, then enumerates the physical devices into `TVkDevice` children.

| Member | Meaning |
|---|---|
| `Handle :T_VkInstance` | The instance（created lazily） |
| `Childrs[ I ]` ／ `Count` | The physical devices |
| `AvailExtens :TArray<String>` | Instance extensions this machine supports |
| `UsingExtens :TArray<String>` | The ones actually enabled; by default `VK_KHR_surface` ＋ `VK_KHR_win32_surface` where supported |

> ※ The instance is created while `TVulkan` initializes, so there is no window in which to add extensions from outside. Override `UsingExtens` if you need to.

#### 4.1.4 `TVkDevice` ── VkPhysicalDevice
A physical device (GPU). Its handle is obtained by enumeration — never created, never destroyed.

| Member | Meaning |
|---|---|
| `Handle :T_VkPhysicalDevice` | The physical device |
| `DEVICE_NAME` ／ `DEVICE_TYPE` ／ `VENDOR_ID` ／ `DEVICE_ID` | Identification |
| `API_VERSION` ／ `DRIVER_VERSION` :TVkVersion | Versions |
| `Propers` ／ `Feature` ／ `MemProp` ／ `Familys` | Vulkan's own query results, passed straight through |
| `Contexs :TVkContexs` | The contexts on this device |
| `FamilyByFlags( Flags_ )` | Index of a queue family with those capabilities（−1 if none） |
| `MemoryByFlags( TypeBits_, Flags_ )` | Index of a matching memory type（ditto） |
| `AvailExtens` | Device extensions this GPU supports |

#### 4.1.5 `TVkContex` ── VkDevice
The "**context**" is the logical device. It owns everything below, and is the practical unit of work.

| Member | Meaning |
|---|---|
| `Handle :T_VkDevice` | The logical device（created lazily） |
| `QueFlags :T_VkQueueFlags` | Required queue capabilities; `GRAPHICS or COMPUTE` by default |
| `Extens :TArray<String>` | Extra device extensions |
| `UsingExtens` | The ones actually enabled; `VK_KHR_swapchain` is always attempted |
| `FamilyI :Integer` | The chosen queue family |
| `Queuers` ／ `Argumes` ／ `Librars` ／ `Shaders` ／ `Passers` ／ `Rasters` | The lists below |
| `FreeHandle` | Destroy the logical device |

If no family satisfies `QueFlags`, it retries with compute-only, then graphics-only — so a compute-only device keeps working.
`QueFlags` and `Extens` may only be set **before** `Handle` is first touched; afterwards they raise, because every child resource of the logical device would become invalid.

#### 4.1.6 `TVkQueuer` ── VkQueue ＋ VkCommandPool
The "**queue**". It issues and runs command buffers.

| Member | Meaning |
|---|---|
| `Handle :T_VkQueue` | The queue |
| `Pooler :T_VkCommandPool` | The command pool（created lazily） |
| `BeginCommand :T_VkCommandBuffer` | Allocate a one-shot command buffer and begin recording |
| `EndCommand( C )` | End, submit, **wait for completion**, and free |

### 4.2 Arguments (what shaders receive)

#### 4.2.1 `TVkArgume`（base）
The base of everything that can be bound to a descriptor. `TVkParame.Bind` asks for `BuffeH` ／ `ViewrH` ／ `SamplH` depending on the descriptor type; each subclass overrides only what applies to it.
`PreRun` runs just before execution and does any preparation, such as transitioning an image's layout.

#### 4.2.2 `TVkSamplr` ── VkSampler
The sampler; defines the interpolation（linear）and addressing（mirrored repeat）. Its settings are fixed for now.

#### 4.2.3 `TVkMemory`（base）／ `TVkMemDat`
The base of arguments backed by a `VkDeviceMemory`, and the host-side window onto it.

`TVkMemDat` represents a mapping. Touching `Handle` maps the memory; assigning `nil` unmaps it — `Map` ／ `Unmap` are aliases for exactly that. `Mode`（`Read` ／ `Write`）decides the transfer direction for images.

#### 4.2.4 `TVkBuffer<TValue_>` ── VkBuffer
An array of any record type in host-visible memory.

| Member | Meaning |
|---|---|
| `Count :Integer` | Element count（changing it rebuilds the buffer） |
| `Data :TVkBufDat` | The mapping; read and write elements through `Data[ I ]` |
| `Handle :T_VkBuffer` | The buffer（created lazily） |
| `GetUsage`（virtual） | Usage flags; STORAGE ／ UNIFORM ／ TRANSFER_SRC ／ TRANSFER_DST by default |

Vertex and index buffers are subclasses that override `GetUsage` to add their bit（`TVkVerBuf3D` ／ `TVkIndBuf3D`, and `TVkVerBuf2D` ／ `TVkIndBuf2D`）.

#### 4.2.5 `TVkImager<TValue_>` ── VkImage ＋ VkImageView
A 1D–3D pixel array. The image itself lives in device-local memory（OPTIMAL tiling）and host access goes through a **resident staging buffer**: `Data.Map` copies image → host, `Data.Unmap` copies host → image, and layout transitions are handled for you.

| Member | Meaning |
|---|---|
| `CountX` ／ `CountY` ／ `CountZ` | Pixel counts（the per-dimension subclasses hold the fields） |
| `Data :TVkImaDat` | The mapping; `Data[ X, Y ]` and friends address pixels |
| `Handle` ／ `Viewer` | `VkImage` ／ `VkImageView` |
| `Layout :T_VkImageLayout` | The layout currently on record |
| `Usage`（virtual） | Usage flags; SAMPLED ／ STORAGE ／ TRANSFER_SRC ／ TRANSFER_DST by default |
| `TransitionTo( C, L )` | Transition with a barrier |
| `AssumeLayout( L )` | Rewrite the record without a barrier（tell it what a render pass already did） |

Concrete classes follow the `TVkImager{dim}x{order}x{type}` naming.

| Class | VkFormat |
|---|---|
| `TVkImager2DxBGRAxUInt8` | `VK_FORMAT_B8G8R8A8_UINT` |
| `TVkImager2DxBGRAxUFix8` | `VK_FORMAT_B8G8R8A8_UNORM` |
| `TVkImager2DxRGBAxUInt32` | `VK_FORMAT_R32G32B32A32_UINT` |
| `TVkImager2DxRGBAxSFlo32` | `VK_FORMAT_R32G32B32A32_SFLOAT` |

（1D and 3D offer the same four formats — 12 classes in all.）

### 4.3 Shaders

#### 4.3.1 `TVkLibrar` ／ `TVkLibSrc`
A GLSL source that shaders `#include`. It is resolved **by name** at compile time, so no file system access and no textual pre-expansion happen. `Source.LoadFromFile` sets `Name` to the file name.

#### 4.3.2 `TVkShader` ── VkShaderModule
**The shader module itself** — hence exactly one stage per instance（vertex ／ fragment ／ compute …）.

| Member | Meaning |
|---|---|
| `Stage :T_glslang_stage_t` | The stage; `GLSLANG_STAGE_COMPUTE` by default |
| `Source :TVkSource` | The GLSL; editing it requests a recompile |
| `Binary :TVkBinary` | The SPIR-V; readable and writable, so `.spv` files work too |
| `Handle :T_VkShaderModule` | The module（created lazily, compiling at runtime if needed） |
| `CompileOK` ／ `CompileLog` | Compile status and log. Also `True` when a `.spv` was supplied directly（no compile took place） |
| `Bindins :TArray<TVkBinding>` | Descriptors found by reflection |
| `Entrys :TArray<String>` | Entry points found by reflection |
| `LocalX` ／ `LocalY` ／ `LocalZ` | `local_size` found by reflection |
| `Kernels :TVkKernels` | Compute pipelines built from this module |

The SPIR-V **reflection is our own**（it does not go through glslang）, so it works identically for a `.spv` that was merely loaded.

#### 4.3.3 `TVkBinary`
The SPIR-V binary, with `LoadFromFile` ／ `SaveToFile` ／ `LoadFromStream` ／ `SaveToStream`. The `SaveTo*` pair compiles from GLSL first if necessary.

### 4.4 Compute

#### 4.4.1 `TVkKernel` ── VkPipeline（compute）
The "**kernel**" is a compute pipeline. From the shader's reflection it internally builds the descriptor set layout, pipeline layout, descriptor pool and descriptor set.

| Member | Meaning |
|---|---|
| `Name :String` | The entry point |
| `Queuer :TVkQueuer` | The queue it runs on |
| `Parames :TVkParames` | Parameters — arguments are connected by name |
| `GloSizX` ／ `GloSizY` ／ `GloSizZ` | The number of invocations |
| `GloDimN` | The effective dimensionality |
| `Run` | Dispatch and wait |

The number of workgroups is computed automatically from `GloSiz*` and the shader's `local_size`.

> ※ `vkCmdDispatch` has **no offset argument**. Vulkan simply has no counterpart to OpenCL's `GloMin*`（global_work_offset）, so neither does this class; if you need an offset, pass one to the shader yourself, e.g. as a push constant.

If the shader is not compiled（a failed GLSL compile, no SPIR-V set, …）, pipeline creation is abandoned rather than handing an empty module to the driver; see `Shader.CompileLog` for the reason. `TVkRaster` behaves the same way on the graphics side, reported through `BuildOK` ／ `BuildLog`.

#### 4.4.2 `TVkParames` ／ `TVkParame`
The parameter list and one parameter. Connect with `Parames['name'] := argument`.

| Member | Meaning |
|---|---|
| `Argumes[ Name ]`（default） | Read and write arguments by name |
| `FindsOK :Boolean` | Did every reflected descriptor match a parameter? |
| `BindsOK :Boolean` | Was every argument written into its descriptor? |

### 4.5 The drawing foundation

#### 4.5.1 `TVkPasser` ── VkRenderPass
The most basic render pass: one color attachment, one depth attachment, one subpass.

| Member | Meaning |
|---|---|
| `ColorForm :T_VkFormat` | Color attachment format; `B8G8R8A8_UNORM` by default |
| `DepthForm :T_VkFormat` | Depth attachment format; `UNDEFINED` means no depth |
| `ColorLast :T_VkImageLayout` | Final layout of the color attachment: `TRANSFER_SRC_OPTIMAL` offscreen, `PRESENT_SRC_KHR` on screen |
| `DepthOK :Boolean` | Whether there is a depth attachment |

Attachments are cleared every frame（`loadOp = CLEAR`, `initialLayout = UNDEFINED`）.
Vulkan pipelines can be reused across "compatible" render passes, and compatibility depends only on the attachments' **format and sample count** — not on layouts or load/store ops. So as long as the formats match, one `TVkRaster` serves both an offscreen renderer and a viewer.

#### 4.5.2 `TVkRaster` ── VkPipeline（graphics）＋ VkPipelineLayout
The "**rasterization pipeline**" — the drawing counterpart of `TVkKernel`.
Because a graphics pipeline binds *several* shader modules, it cannot be a child of a single `TVkShader`; it is a child of `TVkContex`（`Contex.Rasters`）instead and collects the modules as `TVkStager` entries.

| Member | Meaning |
|---|---|
| `Stagers :TVkStagers` | The shader stages; add with `Stagers.Add( Shader, Entry )` |
| `Passer :TVkPasser` | Its render pass; if unset, the destination assigns its own on first draw |
| `Bindins` ／ `Attribs` | Vertex bindings and attributes（Vulkan's own structures） |
| `AddBindin` ／ `AddAttrib` | Plain helpers for appending to those |
| `SetLayouts` | Descriptor set layouts（none by default） |
| `PushSize` ／ `PushFlags` | Push constant size, and which stages read it |
| `Topology` ／ `PolyMode` ／ `CullMode` ／ `FrontFace` ／ `LineWidth` | Assembly and rasterization |
| `DepthTest` ／ `DepthWrit` ／ `DepthOper` ／ `BlendOK` | Depth and blending |
| `Handle` ／ `Layout` | Pipeline and pipeline layout（created lazily） |
| `BuildOK` ／ `BuildLog` | Compile status and log across all stages |

Changing any of these rebuilds the pipeline lazily.
Viewport and scissor are always **dynamic**, so resizing the destination rebuilds nothing.

#### 4.5.3 `TVkStager`
One stage of a pipeline（`VkPipelineShaderStageCreateInfo`）: a `Shader`（＝ `VkShaderModule`）paired with an entry name. The stage kind `Flags` is derived mechanically from `Shader.Stage`, so there is nothing to state twice.

#### 4.5.4 `TVkSwaper` ── VkSurfaceKHR ＋ VkSwapchainKHR
Turns a window handle（`HWND`）into a Vulkan destination. It is UI-agnostic, so any framework that owns a window can drive it.

| Member | Meaning |
|---|---|
| `Resize( X, Y )` | State the desired size（rebuilds if it changed） |
| `Ready :Boolean` | Whether it can draw（`False` while minimized） |
| `BeginFrame( out Comman_ )` | Acquire an image and begin recording |
| `Framer :T_VkFramebuffer` | The framebuffer currently acquired |
| `EndFrame` | Submit → present → wait for the queue |
| `SizeX` ／ `SizeY` ／ `Format` | The swapchain's actual size and format |

Synchronization is one frame at a time（frames-in-flight ＝ 1）: acquisition and rendering are chained with semaphores and the queue is drained at the end, so the command buffer and the semaphores can be reused next frame.
`VK_ERROR_OUT_OF_DATE_KHR` ／ `VK_SUBOPTIMAL_KHR` are treated as a signal to rebuild.

### 4.6 Scene graph

#### 4.6.1 `TVkObject`
A node. Both its parent and its children are of its own type（`TTreeKnot<TVkObject,TVkObject>`）, so nodes joint freely.

| Member | Meaning |
|---|---|
| `LocalPose :TSingleM4` | Local matrix（parent space ← own space） |
| `GlobalPose :TSingleM4` | Global matrix（the product of the ancestors' local matrices） |
| `Visible :Boolean` | Whether to draw（hides the whole subtree） |
| `Raster :TVkRaster` | The pipeline to draw with; `nil` resolves upwards |
| `Scene` ／ `Contex` ／ `Queuer` | The scene it belongs to, and that scene's context and queue |
| `Changed` | Propagate a change to the root |
| `Draw( Drawer_, Pose_ )` | Draw the subtree, accumulating the matrix |

The matrix type is `TSingleM4` for both 2D and 3D — that is the form the GPU wants, and a 2D `TSingleM3` converts implicitly.
Vulkan has no matrix stack, so `Draw` passes the accumulated matrix down as an argument（[§ 2.3.2](#232-the-transform-chain)）.

#### 4.6.2 `TVkShaper`
The base of nodes that draw something; it holds a local matrix of its own. The actual draw commands are issued by the per-dimension subclasses in `DrawMain`.

#### 4.6.3 `TVkCamera`
A viewpoint that draws nothing itself. Its pose is the product of its ancestors'（`GlobalPose`）.

| Member | Meaning |
|---|---|
| `SizeX` ／ `SizeY` | The screen's real extent（default 2 × 2）. The aspect ratio follows from these |
| `NeaZ` ／ `FarZ` | Near and far clip planes |
| `ProjMat` | The projection matrix（supplied by subclasses）. Takes no argument |
| `ViewMat` | The view matrix（＝ `GlobalPose.Inverse`） |
| `Render( Drawer_ )` | Set up projection × view and draw the scene |
| `OnScene :TDelegates` | Scene-change notification（forwarded from `TVkScener.OnChange`） |

Because a camera subscribes to its own scene and re-broadcasts as `OnScene`, **a viewer only ever needs a camera**.
The camera's aspect ratio is independent of the destination's — see [§ 2.3.6](#236-camera-aspect-and-destination-aspect).

#### 4.6.4 `TVkScener`
The root of a scene: a node that cannot have a parent. It is dimension-independent, so both 2D and 3D use it as it is.
`Create( Queuer_ )` takes the queue（the context follows from it）, and nodes in the scene allocate their own resources through it.

| Member | Meaning |
|---|---|
| `Contex` ／ `Queuer` | Where resources come from, and which queue transfers use |
| `BackColor :TAlphaColorF` | Background color |
| `OnChange :TDelegates` | Scene-change notification（multicast via `Add` ／ `Del`） |

Inserting, moving or editing a node travels up as `Changed` and leaves through `OnChange`.
Bulk edits can be wrapped in `BeginUpdate` ／ `EndUpdate`（the Tree layer's batching）. A node being destroyed counts as `Updating`, so it stays silent.

#### 4.6.5 `TVkDrawer`
The state that lives for exactly one traversal. The destination creates it and hands it to the scene graph's `Draw`.

| Member | Meaning |
|---|---|
| `Comman` ／ `Passer` | The command buffer being recorded and the render pass |
| `ProjView :TSingleM4` | Projection × view（set by the camera） |
| `BindRaster( Raster_ )` | Bind the pipeline if needed; `False` if it is unusable |

`BindRaster` skips redundant consecutive binds of the same pipeline.

### 4.7 The per-dimension layers

#### 4.7.1 3D（`/Graphics/3D`）

| Class | Meaning |
|---|---|
| `TVkShaper3D` | Holds vertex/index buffers and draws indexed; the shape comes from `BuildMesh`, and `Rebuild` regenerates it |
| `TVkCamera3D` | Camera base with `Pos` and `LookAt` |
| `TVkCameraPers3D` | Perspective; `FocusZ`（focal length）with `AngleX` ／ `AngleY`（field of view）derived from it |
| `TVkCameraOrth3D` | Orthographic; the field is the base's `SizeX` ／ `SizeY` itself |
| `TVkRaster3D` | A pipeline with the `TVkVertex3D` layout and `TVkPush3D` push constants already declared |
| `TVkVerBuf3D` ／ `TVkIndBuf3D` | Vertex/index buffers（`TVkBuffer` subclasses with the usage bit added） |
| `TVkCube3D` | A box（in `/3D/…D3.Shapers.pas`）; `Size` sets its extent |

Projection matrices come from this unit's `VkProjPers3D` ／ `VkProjOrth3D`.

| Function | Arguments |
|---|---|
| `VkProjPers3D( SizeX_, SizeY_, FocusZ_, NeaZ_, FarZ_ )` | Perspective: the screen seen from a distance of `FocusZ_` |
| `VkProjOrth3D( SizeX_, SizeY_, NeaZ_, FarZ_ )` | Orthographic: the field is the screen itself |

Both are written in the Vulkan convention rather than OpenGL's; the matrices and the reasoning are in [§ 2.3.1](#231-vulkan-clip-space-conventions)–[§ 2.3.5](#235-focal-length-instead-of-field-of-view).

#### 4.7.2 2D（`/Graphics/2D`）

Only the skeleton, mirroring 3D; there are no primitives yet. Subclass `TVkShaper2D` and implement `BuildMesh` and everything else follows the 3D flow exactly.

The coordinate system matches `LUX.CG2D`（the Skia 2D scene graph）: **Y points down**（screen coordinates）. Vulkan's clip space also has Y down, so `VkProjOrth2D( SizeX_, SizeY_ )` — unlike the 3D projections — does not flip it（equation (7)）.
`TVkCamera2D` uses the base `TVkCamera`'s `SizeX` ／ `SizeY` as they are; they give the screen's extent in world units.
`TVkRaster2D` turns off depth testing and face culling and turns on alpha blending.

> ※ Do not mix 2D and 3D nodes in one scene: their vertex layouts and push constants differ, so the pipeline will not match.

### 4.8 Destinations

#### 4.8.1 `TVkRender`
Draws the scene into an image of a given pixel size and hands it to FireMonkey. It needs no form, no window and no swapchain, so it works from a console application too.

| Member | Meaning |
|---|---|
| `SizeX` ／ `SizeY` | Output size in pixels |
| `Camera :TVkCamera` | The camera to draw（2D or 3D） |
| `Passer :TVkPasser` | This destination's render pass |
| `Color :TVkTarget2D` | The rendered image |
| `Render` | Draw |
| `CopyTo( Bitmap_ )` | Fetch into a `TBitmap` |

The color attachment is a `TVkTarget2D`（a `TVkImager2DxBGRAxUFix8` with `COLOR_ATTACHMENT` added）, so `/Stream` converts it for free.
The depth attachment needs an image view with the DEPTH aspect, which `TVkImager` cannot express, so this class owns it directly.

#### 4.8.2 `TVkViewer`（a `TFrame`）
An on-screen viewer you can drop onto a form. See [§ 6.5](#65-on-screen-viewer) for how it works.

| Member | Meaning |
|---|---|
| `Attach( Queuer_ )` | Connect the queue（once）; the context follows from it |
| `Camera :TVkCamera` | The camera; connecting subscribes to its scene |
| `Direct :Boolean` | `True`: present into the child window ／ `False`: `TVkRender` into a `TBitmap` |
| `PixelX` ／ `PixelY` | The real pixel size（DPI included） |
| `Render` | Redraw explicitly |

### 4.9 FMX streams

Copy images between `TVkImager` and `TBitmap`. There is one concrete class per image format, used through an interface so nothing needs freeing.

| Class | Image |
|---|---|
| `TVkStream1DxBGRAxUFix8_FMX` and 3 more | `TVkImager1Dx…` |
| `TVkStream2DxBGRAxUFix8_FMX` and 3 more | `TVkImager2Dx…` |

| Method | Meaning |
|---|---|
| `CopyTo( Bitmap_ )` | image → `TBitmap` |
| `CopyFrom( Bitmap_ )` | `TBitmap` → image（resizing it to match） |
| `LoadFromFile` ／ `SaveToFile` | Image file I/O |

----
## 5. Usage: Compute

### 5.1 Device
`TVulkan` detects every physical device (GPU) automatically.
> `Object Pascal`
> ```Delphi
> TVulkan.Available        :Boolean    // Whether vulkan-1.dll is available
> TVulkan.Devices.Count    :Integer    // Number of physical devices
> TVulkan.Devices[*]       :TVkDevice  // Array of physical devices
>
> _Device := TVulkan.Devices[0];       // Selecting a device
>
> _Device.DEVICE_NAME      :String     // Device name
> _Device.API_VERSION      :TVkVersion // Supported Vulkan version
> ```

### 5.2 Context
> `Object Pascal`
> ```Delphi
> _Contex := TVkContex.Create( _Device );
> ```

### 5.3 Queue
> `Object Pascal`
> ```Delphi
> _Queuer := TVkQueuer.Create( _Contex );
> ```

### 5.4 Arguments

#### 5.4.1 Buffer
> `Object Pascal`
> ```Delphi
> _Buffer := TVkBuffer<TItem>.Create( _Queuer );
> _Buffer.Count := 2;         // Setting the number of elements
> _Buffer.Data.Map;           // Synchronize data with host
> _Buffer.Data[0] := Item0;   // Writing
> _Buffer.Data[1] := Item1;
> _Buffer.Data.Unmap;         // Synchronize data with device
> ```

#### 5.4.2 Image
> `Object Pascal`
> ```Delphi
> _Imager := TVkImager2DxBGRAxUFix8.Create( _Queuer );
> _Imager.CountX := 500;      // Number of pixels in the X direction
> _Imager.CountY := 500;      // Number of pixels in the Y direction
> ```

#### 5.4.3 Sampler
> `Object Pascal`
> ```Delphi
> _Samplr := TVkSamplr.Create( _Contex );
> ```

### 5.5 Library
`#include` is resolved **by name** — no file system access.
> `Object Pascal`
> ```Delphi
> _Librar := TVkLibrar.Create( _Contex );
>
> _Librar.Source.LoadFromFile( 'Librar.glsl' );  // Name becomes 'Librar.glsl'
> ```
> `GLSL`
> ```GLSL
> #extension GL_GOOGLE_include_directive : require
> #include "Librar.glsl"
> ```

### 5.6 Shader
Loading GLSL makes the class **compile it at runtime**（via `glslang.dll`）on first use, then **reflect** the resulting SPIR-V by itself: descriptor bindings, entry points and `local_size` are extracted automatically.
> `Object Pascal`
> ```Delphi
> _Shader := TVkShader.Create( _Contex );
>
> _Shader.Source.LoadFromFile( 'Execut.comp' );
>
> _Shader.CompileOK  :Boolean            // Compile status
> _Shader.CompileLog :String             // Compile log
> _Shader.Binary     :TVkBinary          // Generated SPIR-V
> _Shader.Bindins    :TArray<TVkBinding> // Reflected descriptor bindings
> _Shader.LocalX/Y/Z :Integer            // Reflected local_size
> ```
The SPIR-V can also be read and written directly, so a shader can be pre-compiled and shipped as a `.spv`（[§ 8.3](#83-shipping-without-glslangdll)）.
> `Object Pascal`
> ```Delphi
> _Shader.Binary.SaveToFile( 'Execut.spv' );  // Compiles if necessary, then saves
> _Shader.Binary.LoadFromFile( 'Execut.spv' );
> ```

### 5.7 Kernel
Arguments are connected **by name**, using the identifiers reflected from the shader.
> `Object Pascal`
> ```Delphi
> _Kernel := TVkKernel.Create( _Shader, 'main', _Queuer );
>
> _Kernel.GloSizX := _Imager.CountX;     // Number of invocations in X direction
> _Kernel.GloSizY := _Imager.CountY;     // Number of invocations in Y direction
>
> _Kernel.Parames['Buffer'] := _Buffer;  // Connect by the GLSL variable name
> _Kernel.Parames['Textur'] := _Textur;
> _Kernel.Parames['Samplr'] := _Samplr;
> _Kernel.Parames['Imager'] := _Imager;
>
> _Kernel.Parames.FindsOK  :Boolean  // All reflected bindings matched?
> _Kernel.Parames.BindsOK  :Boolean  // All descriptors written?
>
> _Kernel.Run;  // Dispatch and wait
> ```

----
## 6. Usage: Graphics

### 6.1 Device requirements
A graphics-capable queue family and the swapchain extension are both the **default**, so nothing has to be requested.
> `Object Pascal`
> ```Delphi
> _Contex := TVkContex.Create( _Device );
> _Queuer := TVkQueuer.Create( _Contex );
> ```

### 6.2 Shader stages and pipeline
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
> _Raster := TVkRaster3D.Create( _Contex );   // 3D: vertex layout ＋ push constants preset
> _Raster.Stagers.Add( _ShaderV );            // entry point defaults to 'main'
> _Raster.Stagers.Add( _ShaderF );
> ```

Push constants are 128 bytes — exactly the minimum every Vulkan implementation must support [1] — so moving matrices needs no descriptor set:
> `GLSL`
> ```GLSL
> layout( push_constant ) uniform Push { mat4 ProjViewPose; mat4 Pose; } uPush;
> layout( location = 0 ) in vec3 aPos;
> layout( location = 1 ) in vec3 aNor;
> layout( location = 2 ) in vec2 aTex;
> ```
Textures and uniform buffers remain available: hand your own `VkDescriptorSetLayout`s to `TVkRaster.SetLayouts`.

### 6.3 Scene graph
> `Object Pascal`
> ```Delphi
> _Scene := TVkScener.Create( _Queuer );
> _Scene.BackColor := TAlphaColorF.Create( 0.1, 0.12, 0.16, 1 );
> _Scene.Raster    := _Raster;                  // inherited by every descendant
>
> _Cube := TVkCube3D.Create( _Scene );          // Create( Parent ) joins the tree
> _Cube.Size      := TSingle3D.Create( 1, 1, 1 );
> _Cube.LocalPose := TSingleM4.RotateY( T );
>
> _Camera := TVkCameraPers3D.Create( _Scene );
> _Camera.SizeX  := 4;                          // a 4:3 screen ＝ the camera's aspect
> _Camera.SizeY  := 3;                          //（independent of the destination's）
> _Camera.AngleY := DegToRad( 40 );             // vertical FOV → sets FocusZ
> _Camera.LookAt( EyeP, TarP );
> ```

### 6.4 Offscreen renderer
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

### 6.5 On-screen viewer
> `Object Pascal`
> ```Delphi
> Viewer.Attach( _Queuer );
> Viewer.Camera := _Camera;     // redraws itself whenever the scene changes
> ```

FireMonkey paints a whole form into a single `HWND`, which leaves no natural seam for Vulkan to present into. So the viewer creates a bare **`WS_CHILD` window**（*not* a `TForm`）over the frame's rectangle and presents into it through a swapchain:

* Being a child of the form's `HWND`, it is clipped by it and follows it when the form moves, minimizes or closes. None of the z-order / minimize / activation / taskbar bookkeeping that a borderless overlay `TForm` requires is needed.
* It returns `HTTRANSPARENT` from `WM_NCHITTEST`, so it swallows no input: the mouse reaches the form's `HWND` and FireMonkey routes it to the frame's `MouseDown` ／ `MouseMove` ／ `MouseWheel` as usual.
* It is positioned in physical pixels（`Scene.GetSceneScale`）, so it stays correct under per-monitor DPI.

A native child window is always in front of FireMonkey's own drawing, so FireMonkey controls cannot be layered on top of it. When you need that, set `Direct := False`: the viewer then renders through `TVkRender` and blits a `TBitmap` in `Paint`, obeying FireMonkey's paint order at the cost of a GPU → CPU → GPU round trip per frame.

----
## 7. Design Conventions

### 7.1 Handles are created lazily
A `Handle` property creates its Vulkan handle the first time it is read. Setters that change a creation parameter（size, format …）destroy the handle and leave the next read to rebuild it. **You therefore never have to think about creation order.**

### 7.2 Ownership and disposal
Objects in `/Core` belong to their parent list, and freeing a parent frees the whole subtree; freeing one individually is fine too.
`TVkPasser` ／ `TVkRaster` are children of `TVkContex`（`Contex.Passers` ／ `Contex.Rasters`）and are freed with it. The screen-side objects（`TVkSwaper` ／ `TVkRender` ／ `TVkViewer` ／ `TVkScener`）are **owned by the caller** — free them before the `TVkContex`.
Scene graph nodes belong to the tree and `Free` releases the subtree; `Raster`, however, is a reference and is never owned.

### 7.3 Naming
One class per Vulkan handle, and the class names are six letters（`Contex` ／ `Queuer` ／ `Argume` ／ `Samplr` ／ `Memory` ／ `Buffer` ／ `Imager` ／ `Librar` ／ `Shader` ／ `Kernel` ／ `Parame` ／ `Passer` ／ `Raster` ／ `Swaper` ／ `Drawer` ／ `Render` ／ `Viewer`）.
A list is plural（`TVkShaders`）and its element singular（`TVkShader`）.

### 7.4 dcc64 limitations, absorbed by the foundation
`/Core` is a deep chain of generics, and it trips over two compiler defects. Both surface as E2130, "cannot read from a write-only property" — **a property that plainly should be readable becomes unreadable from outside its unit**.

1. **Hiding an ancestor's accessor with `reintroduce` makes the compiler lose the property's getter** once mutually recursive generics are instantiated. Adding `virtual` instead makes the compiler itself crash（F2084: URW1402）.
2. **A property whose `read` names an accessor two or more generic levels up hits the same problem.** Naming one declared by the immediate ancestor is fine.

Both are absorbed inside `LUX.Data.List`, so **neither this library nor any library derived from it has to work around them**:

* The core（`LUX.Data.List.core`）accessors were renamed to `GetParent0` ／ `SetParent0`, letting the typed layer claim `GetParent` ／ `SetParent` **without hiding anything**（avoids 1）.
* `TListChildr<TOwnere_,TParent_>` restates the same accessors and forwards them upward, so the typed accessor is always in the immediate ancestor（avoids 2）. The inheritance is untouched — it still derives from `TListChildr<TParent_>`.

Derived classes can therefore be written the obvious way:

> `Object Pascal`
> ```Delphi
> property Devices :TVkDevices_ read GetParent;   // readable as-is
> ```

----
## 8. Requirements

### 8.1 Vulkan runtime

A Vulkan-capable GPU and driver. The loader `vulkan-1.dll` — installed with every current GPU driver — is loaded **dynamically** by `/Vulkan/vulkan_functions.pas`, so an application links against nothing and still starts on a machine without Vulkan; `TVulkan.Available` reports whether it is there.

The **Vulkan SDK [10] is not required** to build or to run. It is worth installing only for the validation layers and tools while developing.

Vulkan 1.0 with `VK_KHR_surface` ＋ `VK_KHR_win32_surface` ＋ `VK_KHR_swapchain` covers everything the graphics side uses; compute needs no extension at all. The target platform is Windows（Win32 ／ Win64）, since the only surface backend translated is `VK_KHR_win32_surface`.

### 8.2 Shader compilation and `glslang.dll`

`_DLL/Win32/glslang.dll` and `_DLL/Win64/glslang.dll` are committed to this repository, so **neither the Vulkan SDK nor CMake is required** to build an application: Delphi alone is enough.
Copy the matching DLL next to your executable.
The DLLs are built without SPIRV-Tools（`ENABLE_OPT=OFF`）and with a statically linked CRT（`/MT`）, so they depend on nothing but `KERNEL32.dll`.

> ※ `glslang_default_resource()` lives in the separate `glslang-default-resource-limits` library and is therefore **not** exported by `glslang.dll`. The default limits are instead provided as the Pascal constant `DefaultTBuiltInResource`, transcribed from `ResourceLimits.cpp`.

> ※ glslang is licensed under BSD-3-Clause / Apache-2.0（see `LICENSE.txt` in [5]）, which permits this redistribution.

### 8.3 Shipping without `glslang.dll`

`glslang.dll` is loaded **lazily**, only when a GLSL source actually has to be compiled.
An application that ships pre-compiled `.spv` files therefore **does not need to distribute `glslang.dll` at all** — loading, reflection and execution all work without it, and no error is raised.

> ※ Assign in this order: **`Source` first, `Binary` last**.
> Writing to `Source` discards the current `Binary`（editing the GLSL must invalidate the compiled result）, so loading a `.spv` and *then* filling `Source` for display would throw the SPIR-V away.

### 8.4 Rebuilding `glslang.dll` from source

`_DLL/MakeGlslang.ps1` builds `glslang.dll` from the subtree with CMake. This is **normally unnecessary** — the prebuilt DLLs are committed.

> ※ Requires **CMake** and the **MSVC C++ compiler**（Visual Studio, or the free Build Tools with the "Desktop development with C++" workload）. The VC++ *redistributable* is not enough — it contains no compiler.

### 8.5 Development environment

* **Delphi** with the FireMonkey framework. `/Core` relies on a deep chain of generics; see [§ 7.4](#74-dcc64-limitations-absorbed-by-the-foundation) for the compiler defects it works around.
* **LUX** — the foundation library. `LUX.Code.C`, `LUX.Color`, `LUX.D2`, `LUX.D3`, `LUX.D3x3`, `LUX.D4x4`, `LUX.Data.List` and `LUX.Data.Tree` are used throughout.
* `/Stream`, `/Graphics/LUX.Vulkan.Render.pas` and `TVkViewer` use FireMonkey（`TBitmap` ／ `TFrame`）; the rest of the library does not.

----
## 9. References

1. Khronos Group, [*Vulkan Specification*](https://registry.khronos.org/vulkan/specs/latest/html/), Vulkan Registry（accessed 2026）.
2. Khronos Group, [*Vulkan Registry*](https://registry.khronos.org/vulkan/)（accessed 2026）.
3. Khronos Group, [*SPIR-V Registry*](https://registry.khronos.org/SPIR-V/)（accessed 2026）.
4. Khronos Group, [*Vulkan-Headers*](https://github.com/KhronosGroup/Vulkan-Headers), GitHub repository（accessed 2026）.
5. Khronos Group, [*glslang*](https://github.com/KhronosGroup/glslang), GitHub repository（accessed 2026）.
6. Khronos Group, [*GL_GOOGLE_include_directive*](https://github.com/KhronosGroup/GLSL/blob/main/extensions/google/GL_GOOGLE_include_directive.txt), GLSL extension registry（accessed 2026）.
7. Khronos Group, [*glslang issue #4210*](https://github.com/KhronosGroup/glslang/issues/4210), GitHub（accessed 2026）.
8. Microsoft, [*DirectX Shader Compiler*](https://github.com/microsoft/DirectXShaderCompiler), GitHub repository（accessed 2026）.
9. Shader Slang, [*Slang*](https://github.com/shader-slang/slang), GitHub repository（accessed 2026）.
10. LunarG, [*Vulkan SDK*](https://vulkan.lunarg.com/)（accessed 2026）.
11. LUXOPHIA, [*VulkanCompute*](https://github.com/LUXOPHIA/VulkanCompute), GitHub repository（accessed 2026）.
12. LUXOPHIA, [*Vulkan3DCG*](https://github.com/LUXOPHIA/Vulkan3DCG), GitHub repository（accessed 2026）.
13. Google, [*shaderc*](https://github.com/google/shaderc), GitHub repository（accessed 2026）.

## 💖 [Embarcadero](https://www.embarcadero.com/) [**Delphi**](https://www.embarcadero.com/products/delphi)
Integrated Development Environment (IDE) for Creating Native Cross-Platform Apps.
### Free Download: [**Delphi** Community Edition](https://www.embarcadero.com/products/delphi/starter)
