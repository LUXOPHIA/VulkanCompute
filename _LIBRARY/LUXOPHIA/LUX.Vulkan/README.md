<!---
layout: page
title: "README (English)"
permalink: /
-->
[`［日本語］`](https://luxophia.github.io/LUX.Vulkan/ja/)

# [LUX.Vulkan](https://github.com/LUXOPHIA/LUX.Vulkan/)
[Vulkan](https://en.wikipedia.org/wiki/Vulkan) for [Delphi](https://www.embarcadero.com/products/delphi).

A class library to drive GPUs through the Vulkan API from **GLSL**.
Every Vulkan handle is wrapped in exactly one class, and the classes form a tree that mirrors the ownership of the underlying handles, so creation order and lifetimes are handled for you.

Both halves of Vulkan are covered:

* **Compute** — dispatch compute shaders（`TVkKernel`）.
* **Graphics** — draw a scene graph with the rasterizer（`TVkRaster`）, either offscreen into a `TBitmap`（`TVkRender`）or into a window through a swapchain（`TVkViewer`）.

----
## ■ Contents

1. [Structure](#-1-structure)
2. [The classes at a glance](#-2-the-classes-at-a-glance)
3. [Class reference](#-3-class-reference)
4. [Usage: compute](#-4-usage-compute)
5. [Usage: graphics](#-5-usage-graphics)
6. [Conventions](#-6-conventions)
7. [Reference](#-7-reference)

----
## ■ 1. Structure

### ⬤ 1.1. [`/Vulkan`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Vulkan) : Import library

Delphi translations of the official C headers ([KhronosGroup/Vulkan-Headers](https://github.com/KhronosGroup/Vulkan-Headers), introduced as a subtree under `/：KhronosGroup`).

> [`vk_platform.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Vulkan/vk_platform.pas) ：Platform-specific types（→ vk_platform.h）  
> [`vulkan_core.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Vulkan/vulkan_core.pas) ：Core API 1.0 - 1.3 ＋ VK_KHR_surface ／ VK_KHR_swapchain（→ vulkan_core.h）  
> [`vulkan_win32.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Vulkan/vulkan_win32.pas) ：VK_KHR_win32_surface（→ vulkan_win32.h）  
> [`vulkan_functions.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Vulkan/vulkan_functions.pas) ：Dynamic loading of all commands from `vulkan-1.dll`

Naming follows a mechanical convention:
C type `VkFoo` → `T_VkFoo` ／ pointer `P_VkFoo` ／ function type `PFN_vkFoo` → `T_PFN_vkFoo`.
All constants (`VK_...`) keep their original names.

### ⬤ 1.2. [`/Glslang`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Glslang) : GLSL compiler

Vulkan consumes **SPIR-V**, not GLSL — the driver has no built-in shader compiler.
This library therefore embeds [glslang](https://github.com/KhronosGroup/glslang)（the Khronos reference compiler, introduced as a subtree under `/：KhronosGroup/glslang`）so that GLSL can be compiled **at runtime**.

> [`glslang_c_shader_types.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Glslang/glslang_c_shader_types.pas) ：Enumerations（→ glslang_c_shader_types.h）  
> [`glslang_c_interface.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Glslang/glslang_c_interface.pas) ：Structures ＋ function types（→ glslang_c_interface.h）  
> [`glslang_functions.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Glslang/glslang_functions.pas) ：Dynamic loading of all commands from `glslang.dll`  
> [`MakeGlslang.ps1`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/_DLL/MakeGlslang.ps1) ：Builds `glslang.dll` from the subtree with CMake（**normally unnecessary** — prebuilt DLLs are committed）  
> 　　※ Requires **CMake** and the **MSVC C++ compiler**（Visual Studio, or the free Build Tools with the "Desktop development with C++" workload）. The VC++ *redistributable* is not enough — it contains no compiler.

[`_DLL/Win32/glslang.dll`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/_DLL) and [`_DLL/Win64/glslang.dll`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/_DLL) are committed to this repository, so **neither the Vulkan SDK nor CMake is required** to build an application: Delphi alone is enough.
Copy the matching DLL next to your executable.
The DLLs are built without SPIRV-Tools（`ENABLE_OPT=OFF`）and with a statically linked CRT（`/MT`）, so they depend on nothing but `KERNEL32.dll`.

> ※ `glslang_default_resource()` lives in the separate `glslang-default-resource-limits` library and is therefore **not** exported by `glslang.dll`. The default limits are instead provided as the Pascal constant `DefaultTBuiltInResource`, transcribed from `ResourceLimits.cpp`.

> ※ glslang is licensed under BSD-3-Clause / Apache-2.0（see [`LICENSE.txt`](https://github.com/KhronosGroup/glslang/blob/main/LICENSE.txt)）, which permits this redistribution.

#### ▼ 1.2.1. GLSL only

glslang can also compile **HLSL**, but this library supports **GLSL only** — `TVkShader` always selects the GLSL front-end.

This is deliberate: the HLSL front-end of glslang is **deprecated and will be removed in a future major release**（[glslang issue #4210](https://github.com/KhronosGroup/glslang/issues/4210)）, so building on it would be a dead end.
If you need HLSL, use [DXC](https://github.com/microsoft/DirectXShaderCompiler)（which emits SPIR-V directly）instead.
[Slang](https://github.com/shader-slang/slang) is a separate compiler altogether and is not part of glslang.

Note also that the source language is **never auto-detected** — GLSL and HLSL are chosen explicitly through `glslang_input_t.language`.

### ⬤ 1.3. [`/Core`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Core) ＋ [`LUX.Vulkan.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/LUX.Vulkan.pas) : The core class library

Devices, queues, memory, shaders and the compute pipeline — everything that does not depend on graphics.
It is written entirely as generic classes; `LUX.Vulkan.pas` instantiates them with `TVkSystem` at the apex and publishes concrete aliases. **Those aliases are what you use.**

### ⬤ 1.4. [`/Graphics`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Graphics) : Scene graph ＋ rasterizer

Render pass, rasterization pipeline and swapchain, plus the scene graph and two destinations built on top of them.
Unlike `/Core` it is not generic — it uses the concrete types from `LUX.Vulkan.pas` directly（the same approach as `/Stream`）.

### ⬤ 1.5. [`/Stream`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Stream) : FMX streams

Copy images between `TVkImager` and FireMonkey `TBitmap`.

----
## ■ 2. The classes at a glance

### ⬤ 2.1. Inheritance

`（G）` marks a generic; the concrete aliases published by `LUX.Vulkan.pas` share the same names.

```
TObject
├ TVkSystem ...................... The system（the single instance TVulkan holds）
├ TVulkan ........................ Singleton of TVkSystem（class members only）
│
├ TListParent ─ TListParent<> ─┬ TVkDevices（G）..... Physical device list
│                              ├ TVkContexs（G）..... Context list
│                              ├ TVkQueuers（G）..... Queue list
│                              ├ TVkArgumes（G）..... Argument list
│                              ├ TVkLibrars（G）..... Library list
│                              ├ TVkShaders（G）..... Shader list
│                              ├ TVkKernels（G）..... Kernel list
│                              ├ TVkParames（G）..... Parameter list
│                              └ TVkStages ......... Shader stage list
│
├ TListChildr ─ TListChildr<> ─┬ TVkDevice（G）...... Physical device
│                              ├ TVkContex（G）...... Context（logical device）
│                              ├ TVkQueuer（G）...... Queue
│                              ├ TVkArgume（G）..... Base of every argument
│                              │ ├ TVkSamplr（G）... Sampler
│                              │ └ TVkMemory（G）... Base of arguments backed by memory
│                              │   ├ TVkBuffer<TValue_>（G）.... Buffer
│                              │   └ TVkImager<TValue_>（G）.... Image
│                              │     └ TVkImager1D<TValue_>
│                              │       └ TVkImager2D<TValue_>
│                              │         └ TVkImager3D<TValue_>
│                              ├ TVkLibrar（G）...... GLSL library
│                              ├ TVkShader（G）...... Shader module
│                              ├ TVkKernel（G）...... Compute pipeline
│                              ├ TVkParame（G）...... Parameter
│                              └ TVkStage .......... One shader stage
│
├ TVkMemDat（G）.................. A mapping of memory（the host-side window）
│ ├ TVkBufDat<TValue_>（G）....... Mapping of a buffer
│ └ TVkImaDat<TValue_>（G）....... Mapping of an image
│   └ TVkImaDat1D → TVkImaDat2D → TVkImaDat3D
│
├ TVkBinary（G）.................. SPIR-V binary
├ TStringList ─┬ TVkSource（G）... GLSL source of a shader
│              └ TVkLibSrc（G）... GLSL source of a library
├ Exception ─ EVkError ........... A Vulkan error
│
├ TVkPasser ...................... Render pass
├ TVkRaster ...................... Rasterization pipeline
│ ├ TVkRaster2D .................. for 2D（vertex layout ＋ push constants preset）
│ └ TVkRaster3D .................. for 3D（ditto）
├ TVkSwaper ...................... Surface ＋ swapchain
├ TVkDrawer ...................... State carried through one traversal
├ TVkRender ...................... Offscreen renderer
│
├ TTreeKnot<> ─ TVkObject ........ Scene graph node
│               ├ TVkShaper ...... A node that draws something
│               │ ├ TVkShaper2D
│               │ └ TVkShaper3D
│               │   └ TVkCube3D .. Box
│               ├ TVkCam ......... A viewpoint
│               │ ├ TVkCam2D
│               │ └ TVkCam3D
│               │   ├ TVkCamPers3D  perspective
│               │   └ TVkCamOrth3D  orthographic
│               ├ TVkScene ....... The root of a scene
│               │ ├ TVkScene2D
│               │ └ TVkScene3D
│               ├ TVkObject2D .... 2D grouping node
│               └ TVkObject3D .... 3D grouping node
│
├ TInterfacedObject ─ TVkStream1D_FMX<> ─ TVkStream2D_FMX<> ... FMX streams
└ TFrame ─ TVkViewer ............. On-screen viewer
```

The concrete aliases in `LUX.Vulkan.pas` simply pin the type arguments along the chain

```
TVkSystem → TVkDevices → TVkDevice → TVkContexs → TVkContex → …
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
| `TVkBuffer<TVkSystem,TVkDevice,TVkContex,TValue_>` | `TVkBuffer<TValue_>` |
| `TVkImager{1,2,3}Dx{BGRAxUInt8,BGRAxUFix8,RGBAxUInt32,RGBAxSFlo32}` | same name（12 classes） |

### ⬤ 2.2. Ownership (how the objects are jointed)

**Freeing a node frees its whole subtree.** A list owns its children; a child owns the handles below it.

```
TVulkan（a class; released when the program ends）
└ TVkSystem
  └ TVkDevices ────────────────── VkInstance
    └ TVkDevice ───────────────── VkPhysicalDevice（enumerated, never created）
      └ TVkContexs
        └ TVkContex ───────────── VkDevice
          ├ TVkQueuers
          │ └ TVkQueuer ───────── VkQueue ＋ VkCommandPool
          ├ TVkArgumes
          │ ├ TVkSamplr ───────── VkSampler
          │ ├ TVkBuffer ───────── VkBuffer ＋ VkDeviceMemory
          │ │ └ TVkBufDat ─────── the mapped pointer
          │ └ TVkImager ───────── VkImage ＋ VkImageView ＋ VkDeviceMemory
          │   │                   ＋ resident staging（VkBuffer ＋ VkDeviceMemory）
          │   └ TVkImaDat ─────── the mapped pointer
          ├ TVkLibrars
          │ └ TVkLibrar
          │   └ TVkLibSrc ─────── GLSL source
          └ TVkShaders
            └ TVkShader ───────── VkShaderModule
              ├ TVkSource ─────── GLSL source
              ├ TVkBinary ─────── SPIR-V
              └ TVkKernels
                └ TVkKernel ───── VkPipeline（compute）＋ VkPipelineLayout
                  │                ＋ VkDescriptorSetLayout ＋ VkDescriptorPool ＋ VkDescriptorSet
                  └ TVkParames
                    └ TVkParame ─→ TVkArgume（reference only）
```

The graphics objects are **owned by the caller**. They only reference a context, so free them before the `TVkContex`.

```
TVkPasser ─────────────────────── VkRenderPass
TVkRaster ─────────────────────── VkPipeline（graphics）＋ VkPipelineLayout
├ TVkStages
│ └ TVkStage ──────────────────→ TVkShader（reference only）
└ Passer ─────────────────────→ TVkPasser（reference only）

TVkSwaper ─────────────────────── VkSurfaceKHR ＋ VkSwapchainKHR
                                  ＋ VkImageView[] ＋ VkFramebuffer[]
                                  ＋ depth（VkImage ＋ VkImageView ＋ VkDeviceMemory）
                                  ＋ VkSemaphore × 2

TVkRender
├ TVkPasser（owned）
├ TVkTarget2D（owned）──────────── the color attachment; a TVkImager2DxBGRAxUFix8
├ depth（VkImage ＋ VkImageView ＋ VkDeviceMemory）
├ VkFramebuffer
└ Camera ────────────────────→ TVkCam（reference only）

TVkViewer（TFrame）
├ the child HWND（WS_CHILD）
├ TVkPasser（owned）
├ TVkSwaper（owned）
├ TVkRender（owned; only while Direct = False）
└ Camera ────────────────────→ TVkCam（reference only）
```

The scene graph is a tree of nodes; `Free` releases the whole subtree.

```
TVkScene（the root; cannot have a parent）
└ TVkObject ─┬ TVkObject（nested）
             ├ TVkShaper ──→ Raster: TVkRaster（reference only）
             │   └ TVkShaper3D ── TVkVerBuf3D ＋ TVkIndBuf3D（owned）
             └ TVkCam
```

### ⬤ 2.3. Records, enumerations and exceptions

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
## ■ 3. Class reference

### ⬤ 3.1. System and devices

#### ▼ `TVulkan`
The singleton of `TVkSystem`. Everything is a class member so you never handle the instance. On unit initialization it loads `vulkan-1.dll`, creates the `VkInstance` and enumerates the physical devices.

| Member | Meaning |
|---|---|
| `Available :Boolean` | Whether `vulkan-1.dll` is available |
| `Devices :TVkDevices` | The physical devices |
| `Show( Strings_ )` | Dump system information into a `TStrings`（diagnostics） |

#### ▼ `TVkSystem`
The apex of the tree. It only owns `Devices`, and gives the generic type parameter `TVkSystem_` something concrete to be.

#### ▼ `TVkDevices` ── VkInstance
The list of physical devices, and **the owner of the `VkInstance`**. On first touch it creates the instance, then enumerates the physical devices into `TVkDevice` children.

| Member | Meaning |
|---|---|
| `Handle :T_VkInstance` | The instance（created lazily） |
| `Childrs[ I ]` ／ `Count` | The physical devices |
| `AvailExtens :TArray<String>` | Instance extensions this machine supports |
| `UsingExtens :TArray<String>` | The ones actually enabled; by default `VK_KHR_surface` ＋ `VK_KHR_win32_surface` where supported |

> ※ The instance is created while `TVulkan` initializes, so there is no window in which to add extensions from outside. Override `UsingExtens` if you need to.

#### ▼ `TVkDevice` ── VkPhysicalDevice
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

#### ▼ `TVkContex` ── VkDevice
The "**context**" is the logical device. It owns everything below, and is the practical unit of work.

| Member | Meaning |
|---|---|
| `Handle :T_VkDevice` | The logical device（created lazily） |
| `QueFlags :T_VkQueueFlags` | Required queue capabilities; `GRAPHICS or COMPUTE` by default |
| `Extens :TArray<String>` | Extra device extensions |
| `UsingExtens` | The ones actually enabled; `VK_KHR_swapchain` is always attempted |
| `FamilyI :Integer` | The chosen queue family |
| `Queuers` ／ `Argumes` ／ `Librars` ／ `Shaders` | The lists below |
| `FreeHandle` | Destroy the logical device |

If no family satisfies `QueFlags`, it retries with compute-only, then graphics-only — so a compute-only device keeps working.
`QueFlags` and `Extens` may only be set **before** `Handle` is first touched; afterwards they raise, because every child resource of the logical device would become invalid.

#### ▼ `TVkQueuer` ── VkQueue ＋ VkCommandPool
The "**queue**". It issues and runs command buffers.

| Member | Meaning |
|---|---|
| `Handle :T_VkQueue` | The queue |
| `Pooler :T_VkCommandPool` | The command pool（created lazily） |
| `BeginCommand :T_VkCommandBuffer` | Allocate a one-shot command buffer and begin recording |
| `EndCommand( C )` | End, submit, **wait for completion**, and free |

### ⬤ 3.2. Arguments (what shaders receive)

#### ▼ `TVkArgume`（base）
The base of everything that can be bound to a descriptor. `TVkParame.Bind` asks for `BuffeH` ／ `ViewrH` ／ `SamplH` depending on the descriptor type; each subclass overrides only what applies to it.
`PreRun` runs just before execution and does any preparation, such as transitioning an image's layout.

#### ▼ `TVkSamplr` ── VkSampler
The sampler; defines the interpolation（linear）and addressing（mirrored repeat）. Its settings are fixed for now.

#### ▼ `TVkMemory`（base）／ `TVkMemDat`
The base of arguments backed by a `VkDeviceMemory`, and the host-side window onto it.

`TVkMemDat` represents a mapping. Touching `Handle` maps the memory; assigning `nil` unmaps it — `Map` ／ `Unmap` are aliases for exactly that. `Mode`（`Read` ／ `Write`）decides the transfer direction for images.

#### ▼ `TVkBuffer<TValue_>` ── VkBuffer
An array of any record type in host-visible memory.

| Member | Meaning |
|---|---|
| `Count :Integer` | Element count（changing it rebuilds the buffer） |
| `Data :TVkBufDat` | The mapping; read and write elements through `Data[ I ]` |
| `Handle :T_VkBuffer` | The buffer（created lazily） |
| `GetUsage`（virtual） | Usage flags; STORAGE ／ UNIFORM ／ TRANSFER_SRC ／ TRANSFER_DST by default |

Vertex and index buffers are subclasses that override `GetUsage` to add their bit（`TVkVerBuf3D` ／ `TVkIndBuf3D`）.

#### ▼ `TVkImager<TValue_>` ── VkImage ＋ VkImageView
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

### ⬤ 3.3. Shaders

#### ▼ `TVkLibrar` ／ `TVkLibSrc`
A GLSL source that shaders `#include`. It is resolved **by name** at compile time, so no file system access and no textual pre-expansion happen. `Source.LoadFromFile` sets `Name` to the file name.

#### ▼ `TVkShader` ── VkShaderModule
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

#### ▼ `TVkBinary`
The SPIR-V binary, with `LoadFromFile` ／ `SaveToFile` ／ `LoadFromStream` ／ `SaveToStream`. The `SaveTo*` pair compiles from GLSL first if necessary.

### ⬤ 3.4. Compute

#### ▼ `TVkKernel` ── VkPipeline（compute）
The "**kernel**" is a compute pipeline. From the shader's reflection it internally builds the descriptor set layout, pipeline layout, descriptor pool and descriptor set.

| Member | Meaning |
|---|---|
| `Name :String` | The entry point |
| `Queuer :TVkQueuer` | The queue it runs on |
| `Parames :TVkParames` | Parameters — arguments are connected by name |
| `GloMin*` ／ `GloSiz*` ／ `GloMax*` | The range of invocations |
| `GloDimN` | The effective dimensionality |
| `Run` | Dispatch and wait |

The number of workgroups is computed automatically from `GloSiz*` and the shader's `local_size`.

If the shader is not compiled（a failed GLSL compile, no SPIR-V set, …）, pipeline creation is abandoned rather than handing an empty module to the driver; see `Shader.CompileLog` for the reason. `TVkRaster` behaves the same way on the graphics side, reported through `BuildOK` ／ `BuildLog`.

#### ▼ `TVkParames` ／ `TVkParame`
The parameter list and one parameter. Connect with `Parames['name'] := argument`.

| Member | Meaning |
|---|---|
| `Argumes[ Name ]`（default） | Read and write arguments by name |
| `FindsOK :Boolean` | Did every reflected descriptor match a parameter? |
| `BindsOK :Boolean` | Was every argument written into its descriptor? |

### ⬤ 3.5. The drawing foundation

#### ▼ `TVkPasser` ── VkRenderPass
The most basic render pass: one color attachment, one depth attachment, one subpass.

| Member | Meaning |
|---|---|
| `ColorForm :T_VkFormat` | Color attachment format; `B8G8R8A8_UNORM` by default |
| `DepthForm :T_VkFormat` | Depth attachment format; `UNDEFINED` means no depth |
| `ColorLast :T_VkImageLayout` | Final layout of the color attachment: `TRANSFER_SRC_OPTIMAL` offscreen, `PRESENT_SRC_KHR` on screen |
| `DepthOK :Boolean` | Whether there is a depth attachment |

Attachments are cleared every frame（`loadOp = CLEAR`, `initialLayout = UNDEFINED`）.
Vulkan pipelines can be reused across "compatible" render passes, and compatibility depends only on the attachments' **format and sample count** — not on layouts or load/store ops. So as long as the formats match, one `TVkRaster` serves both an offscreen renderer and a viewer.

#### ▼ `TVkRaster` ── VkPipeline（graphics）＋ VkPipelineLayout
The "**rasterization pipeline**" — the drawing counterpart of `TVkKernel`.
Because a graphics pipeline binds *several* shader modules, it cannot be a child of a single `TVkShader`; it takes the context instead and collects the modules as `TVkStage` children.

| Member | Meaning |
|---|---|
| `Stages :TVkStages` | The shader stages; add with `Stages.Add( Shader, Entry )` |
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

#### ▼ `TVkStage`
One stage of a pipeline（`VkPipelineShaderStageCreateInfo`）: a `Shader`（＝ `VkShaderModule`）paired with an entry name. The stage kind `Flags` is derived mechanically from `Shader.Stage`, so there is nothing to state twice.

#### ▼ `TVkSwaper` ── VkSurfaceKHR ＋ VkSwapchainKHR
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

### ⬤ 3.6. Scene graph

#### ▼ `TVkObject`
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
Vulkan has no matrix stack, so `Draw` passes the accumulated matrix down as an argument.

#### ▼ `TVkShaper`
The base of nodes that draw something; it holds a local matrix of its own. The actual draw commands are issued by the per-dimension subclasses in `DrawMain`.

#### ▼ `TVkCam`
A viewpoint that draws nothing itself. Its pose is the product of its ancestors'（`GlobalPose`）.

| Member | Meaning |
|---|---|
| `SizeX` ／ `SizeY` | The screen's real extent（default 2 × 2）. The aspect ratio follows from these |
| `NeaZ` ／ `FarZ` | Near and far clip planes |
| `ProjMat` | The projection matrix（supplied by subclasses）. Takes no argument |
| `ViewMat` | The view matrix（＝ `GlobalPose.Inverse`） |
| `Render( Drawer_ )` | Set up projection × view and draw the scene |
| `OnScene :TDelegates` | Scene-change notification（forwarded from `TVkScene.OnChange`） |

Because a camera subscribes to its own scene and re-broadcasts as `OnScene`, **a viewer only ever needs a camera**.

##### The camera's aspect ratio is independent of the destination's
A camera's field comes from `SizeX` ／ `SizeY` alone, while the destination deforms freely to suit the UI. **The projection is unaffected by the destination's aspect ratio**; the difference is absorbed by the drawing side, which letterboxes the viewport:

```pascal
V := VkFitViewport( _Camera.SizeX, _Camera.SizeY, DstX, DstY );  // centred, as large as fits
```

Nothing has to fill the bars. The render pass clears the **whole destination** with the background colour and the scissor stays full, so whatever lies outside the viewport simply keeps that colour. Match the camera's aspect ratio to the destination and no bars appear at all.

#### ▼ `TVkScene`
The root of a scene: a node that cannot have a parent. It holds the Vulkan context and queue, so nodes in the scene can allocate their own resources.

| Member | Meaning |
|---|---|
| `Contex` ／ `Queuer` | Where resources come from, and which queue transfers use |
| `BackColor :TAlphaColorF` | Background color |
| `OnChange :TDelegates` | Scene-change notification（multicast via `Add` ／ `Del`） |

Inserting, moving or editing a node travels up as `Changed` and leaves through `OnChange`.
Bulk edits can be wrapped in `BeginUpdate` ／ `EndUpdate`（the Tree layer's batching）. A node being destroyed counts as `Updating`, so it stays silent.

#### ▼ `TVkDrawer`
The state that lives for exactly one traversal. The destination creates it and hands it to the scene graph's `Draw`.

| Member | Meaning |
|---|---|
| `Comman` ／ `Passer` ／ `SizeX` ／ `SizeY` | The command buffer being recorded, the render pass, and the destination size |
| `ProjView :TSingleM4` | Projection × view（set by the camera） |
| `BindRaster( Raster_ )` | Bind the pipeline if needed; `False` if it is unusable |

`BindRaster` skips redundant consecutive binds of the same pipeline.

### ⬤ 3.7. The per-dimension layers

#### ▼ 3D（[`/Graphics/3D`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Graphics/3D)）

| Class | Meaning |
|---|---|
| `TVkObject3D` | A grouping node with no matrix of its own |
| `TVkShaper3D` | Holds vertex/index buffers and draws indexed; the shape comes from `BuildMesh`, and `Rebuild` regenerates it |
| `TVkCam3D` | Camera base with `Pos` and `LookAt` |
| `TVkCamPers3D` | Perspective; `FocusZ`（focal length）with `AngleX` ／ `AngleY`（field of view）derived from it |
| `TVkCamOrth3D` | Orthographic; the field is the base's `SizeX` ／ `SizeY` itself |
| `TVkScene3D` | A 3D scene |
| `TVkRaster3D` | A pipeline with the `TVkVertex3D` layout and `TVkPush3D` push constants already declared |
| `TVkVerBuf3D` ／ `TVkIndBuf3D` | Vertex/index buffers（`TVkBuffer` subclasses with the usage bit added） |
| `TVkCube3D` | A box（in `/3D/…D3.Shapers.pas`）; `Size` sets its extent |

Projection matrices come from this unit's `VkProjPers3D` ／ `VkProjOrth3D`.

| Function | Arguments |
|---|---|
| `VkProjPers3D( SizeX_, SizeY_, FocusZ_, NeaZ_, FarZ_ )` | Perspective: the screen seen from a distance of `FocusZ_` |
| `VkProjOrth3D( SizeX_, SizeY_, NeaZ_, FarZ_ )` | Orthographic: the field is the screen itself |

**Vulkan's clip space is not OpenGL's — Y points down and Z runs 0 → 1.** Not just the direction of Y but the range of Z differs, i.e. the coordinate structure itself is a different one; writing the Vulkan-convention matrix directly is more honest than forcing `LUX.D4x4`'s `TSingleM4.ProjPers` ／ `ProjOrth`（OpenGL convention）into line with a conversion matrix. Only the projection is special — `TVkObject.LocalPose` and friends stay `TSingleM4` — so nothing about this inconveniences the caller.

> ※ Setting a negative `VkViewport.height` only fixes Y; the Z range still differs. The projection has to deal with it either way.

`TVkCamPers3D` carries a **focal length `FocusZ`** rather than a field-of-view angle: the field is what you see looking at the screen（`SizeX` × `SizeY`）from a distance of `FocusZ`. The angles `AngleX` ／ `AngleY` are derived from it, and writing one moves `FocusZ` while keeping the screen size（i.e. it zooms）:

```
AngleX = 2 * ArcTan( SizeX / 2 / FocusZ )     AngleY = 2 * ArcTan( SizeY / 2 / FocusZ )
```

#### ▼ 2D（[`/Graphics/2D`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Graphics/2D)）

Only the skeleton, mirroring 3D; there are no primitives yet. Subclass `TVkShaper2D` and implement `BuildMesh` and everything else follows the 3D flow exactly.

The coordinate system matches [`LUX.CG2D`](https://github.com/LUXOPHIA/LUX.CG2D)（the Skia 2D scene graph）: **Y points down**（screen coordinates）. Vulkan's clip space also has Y down, so `VkProjOrth2D( SizeX_, SizeY_ )` — unlike the 3D projections — does not flip it.
`TVkCam2D` uses the base `TVkCam`'s `SizeX` ／ `SizeY` as they are; they give the screen's extent in world units.
`TVkRaster2D` turns off depth testing and face culling and turns on alpha blending.

> ※ Do not mix 2D and 3D nodes in one scene: their vertex layouts and push constants differ, so the pipeline will not match.

### ⬤ 3.8. Destinations

#### ▼ `TVkRender`
Draws the scene into an image of a given pixel size and hands it to FireMonkey. It needs no form, no window and no swapchain, so it works from a console application too.

| Member | Meaning |
|---|---|
| `SizeX` ／ `SizeY` | Output size in pixels |
| `Camera :TVkCam` | The camera to draw（2D or 3D） |
| `Passer :TVkPasser` | This destination's render pass |
| `Color :TVkTarget2D` | The rendered image |
| `Render` | Draw |
| `CopyTo( Bitmap_ )` | Fetch into a `TBitmap` |

The color attachment is a `TVkTarget2D`（a `TVkImager2DxBGRAxUFix8` with `COLOR_ATTACHMENT` added）, so `/Stream` converts it for free.
The depth attachment needs an image view with the DEPTH aspect, which `TVkImager` cannot express, so this class owns it directly.

#### ▼ `TVkViewer`（a `TFrame`）
An on-screen viewer you can drop onto a form. See [§ 5.5](#-55-on-screen-viewer) for how it works.

| Member | Meaning |
|---|---|
| `Attach( Contex_, Queuer_ )` | Connect the context（once） |
| `Camera :TVkCam` | The camera; connecting subscribes to its scene |
| `Direct :Boolean` | `True`: present into the child window ／ `False`: `TVkRender` into a `TBitmap` |
| `PixelX` ／ `PixelY` | The real pixel size（DPI included） |
| `Render` | Redraw explicitly |

### ⬤ 3.9. FMX streams

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
## ■ 4. Usage: compute

### ⬤ 4.1. Device
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

### ⬤ 4.2. Context
> `Object Pascal`
> ```Delphi
> _Contex := TVkContex.Create( _Device );
> ```

### ⬤ 4.3. Queue
> `Object Pascal`
> ```Delphi
> _Queuer := TVkQueuer.Create( _Contex );
> ```

### ⬤ 4.4. Arguments

#### ▼ 4.4.1. Buffer
> `Object Pascal`
> ```Delphi
> _Buffer := TVkBuffer<TItem>.Create( _Contex, _Queuer );
> _Buffer.Count := 2;         // Setting the number of elements
> _Buffer.Data.Map;           // Synchronize data with host
> _Buffer.Data[0] := Item0;   // Writing
> _Buffer.Data[1] := Item1;
> _Buffer.Data.Unmap;         // Synchronize data with device
> ```

#### ▼ 4.4.2. Image
> `Object Pascal`
> ```Delphi
> _Imager := TVkImager2DxBGRAxUFix8.Create( _Contex, _Queuer );
> _Imager.CountX := 500;      // Number of pixels in the X direction
> _Imager.CountY := 500;      // Number of pixels in the Y direction
> ```

#### ▼ 4.4.3. Sampler
> `Object Pascal`
> ```Delphi
> _Samplr := TVkSamplr.Create( _Contex );
> ```

### ⬤ 4.5. Library
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

### ⬤ 4.6. Shader
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
The SPIR-V can also be read and written directly, so a shader can be pre-compiled and shipped as a `.spv`.
> `Object Pascal`
> ```Delphi
> _Shader.Binary.SaveToFile( 'Execut.spv' );  // Compiles if necessary, then saves
> _Shader.Binary.LoadFromFile( 'Execut.spv' );
> ```

#### ▼ 4.6.1. Shipping without `glslang.dll`

`glslang.dll` is loaded **lazily**, only when a GLSL source actually has to be compiled.
An application that ships pre-compiled `.spv` files therefore **does not need to distribute `glslang.dll` at all** — loading, reflection and execution all work without it, and no error is raised.

> ※ Assign in this order: **`Source` first, `Binary` last**.
> Writing to `Source` discards the current `Binary`（editing the GLSL must invalidate the compiled result）, so loading a `.spv` and *then* filling `Source` for display would throw the SPIR-V away.

### ⬤ 4.7. Kernel
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
## ■ 5. Usage: graphics

### ⬤ 5.1. Device requirements
A graphics-capable queue family and the swapchain extension are both the **default**, so nothing has to be requested.
> `Object Pascal`
> ```Delphi
> _Contex := TVkContex.Create( _Device );
> _Queuer := TVkQueuer.Create( _Contex );
> ```

### ⬤ 5.2. Shader stages and pipeline
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
> _Raster.Stages.Add( _ShaderV );             // entry point defaults to 'main'
> _Raster.Stages.Add( _ShaderF );
> ```

Push constants are 128 bytes — exactly the minimum every Vulkan implementation must support — so moving matrices needs no descriptor set:
> `GLSL`
> ```GLSL
> layout( push_constant ) uniform Push { mat4 ProjViewPose; mat4 Pose; } uPush;
> layout( location = 0 ) in vec3 aPos;
> layout( location = 1 ) in vec3 aNor;
> layout( location = 2 ) in vec2 aTex;
> ```
Textures and uniform buffers remain available: hand your own `VkDescriptorSetLayout`s to `TVkRaster.SetLayouts`.

### ⬤ 5.3. Scene graph
> `Object Pascal`
> ```Delphi
> _Scene := TVkScene3D.Create( _Contex, _Queuer );
> _Scene.BackColor := TAlphaColorF.Create( 0.1, 0.12, 0.16, 1 );
> _Scene.Raster    := _Raster;                  // inherited by every descendant
>
> _Cube := TVkCube3D.Create( _Scene );          // Create( Parent ) joins the tree
> _Cube.Size      := TSingle3D.Create( 1, 1, 1 );
> _Cube.LocalPose := TSingleM4.RotateY( T );
>
> _Camera := TVkCamPers3D.Create( _Scene );
> _Camera.SizeX  := 4;                          // a 4:3 screen ＝ the camera's aspect
> _Camera.SizeY  := 3;                          //（independent of the destination's）
> _Camera.AngleY := DegToRad( 40 );             // vertical FOV → sets FocusZ
> _Camera.LookAt( EyeP, TarP );
> ```

### ⬤ 5.4. Offscreen renderer
> `Object Pascal`
> ```Delphi
> _Render := TVkRender.Create( _Contex, _Queuer );
> _Render.SizeX  := 480;
> _Render.SizeY  := 360;
> _Render.Camera := _Camera;
>
> _Render.Render;
> _Render.CopyTo( Bitmap );
> ```

### ⬤ 5.5. On-screen viewer
> `Object Pascal`
> ```Delphi
> Viewer.Attach( _Contex, _Queuer );
> Viewer.Camera := _Camera;     // redraws itself whenever the scene changes
> ```

FireMonkey paints a whole form into a single `HWND`, which leaves no natural seam for Vulkan to present into. So the viewer creates a bare **`WS_CHILD` window**（*not* a `TForm`）over the frame's rectangle and presents into it through a swapchain:

* Being a child of the form's `HWND`, it is clipped by it and follows it when the form moves, minimizes or closes. None of the z-order / minimize / activation / taskbar bookkeeping that a borderless overlay `TForm` requires is needed.
* It returns `HTTRANSPARENT` from `WM_NCHITTEST`, so it swallows no input: the mouse reaches the form's `HWND` and FireMonkey routes it to the frame's `MouseDown` ／ `MouseMove` ／ `MouseWheel` as usual.
* It is positioned in physical pixels（`Scene.GetSceneScale`）, so it stays correct under per-monitor DPI.

A native child window is always in front of FireMonkey's own drawing, so FireMonkey controls cannot be layered on top of it. When you need that, set `Direct := False`: the viewer then renders through `TVkRender` and blits a `TBitmap` in `Paint`, obeying FireMonkey's paint order at the cost of a GPU → CPU → GPU round trip per frame.

----
## ■ 6. Conventions

### ⬤ 6.1. Handles are created lazily
A `Handle` property creates its Vulkan handle the first time it is read. Setters that change a creation parameter（size, format …）destroy the handle and leave the next read to rebuild it. **You therefore never have to think about creation order.**

### ⬤ 6.2. Ownership and disposal
Objects in `/Core` belong to their parent list, and freeing a parent frees the whole subtree; freeing one individually is fine too.
Objects in `/Graphics`（`TVkPasser` ／ `TVkRaster` ／ `TVkSwaper` ／ `TVkRender`）are **owned by the caller** — free them before the `TVkContex`.
Scene graph nodes belong to the tree and `Free` releases the subtree; `Raster`, however, is a reference and is never owned.

### ⬤ 6.3. Naming
One class per Vulkan handle, and the class names are six letters（`Contex` ／ `Queuer` ／ `Argume` ／ `Samplr` ／ `Memory` ／ `Buffer` ／ `Imager` ／ `Librar` ／ `Shader` ／ `Kernel` ／ `Parame` ／ `Passer` ／ `Raster` ／ `Swaper` ／ `Drawer` ／ `Render` ／ `Viewer`）.
A list is plural（`TVkShaders`）and its element singular（`TVkShader`）.

### ⬤ 6.4. dcc64 limitations, absorbed by the foundation
`/Core` is a deep chain of generics, and it trips over two compiler defects. Both surface as E2130, "cannot read from a write-only property" — **a property that plainly should be readable becomes unreadable from outside its unit**.

1. **Hiding an ancestor's accessor with `reintroduce` makes the compiler lose the property's getter** once mutually recursive generics are instantiated. Adding `virtual` instead makes the compiler itself crash（F2084: URW1402）.
2. **A property whose `read` names an accessor two or more generic levels up hits the same problem.** Naming one declared by the immediate ancestor is fine.

Both are absorbed inside [`LUX.Data.List`](https://github.com/LUXOPHIA/LUX/tree/main/Data/List), so **neither this library nor any library derived from it has to work around them**:

* The core（`LUX.Data.List.core`）accessors were renamed to `GetParent0` ／ `SetParent0`, letting the typed layer claim `GetParent` ／ `SetParent` **without hiding anything**（avoids 1）.
* `TListChildr<TOwnere_,TParent_>` restates the same accessors and forwards them upward, so the typed accessor is always in the immediate ancestor（avoids 2）. The inheritance is untouched — it still derives from `TListChildr<TParent_>`.

Derived classes can therefore be written the obvious way:

> `Object Pascal`
> ```Delphi
> property Devices :TVkDevices_ read GetParent;   // readable as-is
> ```

----
## ■ 7. Reference

### ⬤ 7.1. [The Khronos Group Inc](https://www.khronos.org/)
* [Vulkan Registry](https://registry.khronos.org/vulkan/)
  * [Vulkan Specification](https://registry.khronos.org/vulkan/specs/latest/html/)
* [SPIR-V Registry](https://registry.khronos.org/SPIR-V/)

### ⬤ 7.2. [GitHub](https://github.com)
* [The Khronos Group](https://github.com/KhronosGroup)
  * [Vulkan-Headers](https://github.com/KhronosGroup/Vulkan-Headers)
  * [glslang](https://github.com/KhronosGroup/glslang)
* [Google](https://github.com/google)
  * [shaderc](https://github.com/google/shaderc)
* [LUXOPHIA](https://github.com/LUXOPHIA)
  * [LUX](https://github.com/LUXOPHIA/LUX)
  * [VulkanCompute](https://github.com/LUXOPHIA/VulkanCompute)（compute demo）
  * [Vulkan3DCG](https://github.com/LUXOPHIA/Vulkan3DCG)（graphics demo）

### ⬤ 7.3. [LunarG](https://www.lunarg.com/)
* [Vulkan SDK](https://vulkan.lunarg.com/)

----
* **Delphi IDE** @ Embarcadero  
https://www.embarcadero.com/jp/products/delphi/starter
