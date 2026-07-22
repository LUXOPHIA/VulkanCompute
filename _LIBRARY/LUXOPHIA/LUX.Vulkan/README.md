<!---
layout: page
title: "README (English)"
permalink: /
-->
[`［日本語］`](https://luxophia.github.io/LUX.Vulkan/ja/)

# [LUX.Vulkan](https://github.com/LUXOPHIA/LUX.Vulkan/)
[Vulkan](https://en.wikipedia.org/wiki/Vulkan) for [Delphi](https://www.embarcadero.com/products/delphi).

A class library to run **GLSL compute shaders** on GPUs via the Vulkan API.
Every Vulkan object is wrapped in a class, and the classes form a tree that mirrors the ownership of the underlying handles, so creation order and lifetimes are handled for you.
Only **compute** is implemented for now; the class hierarchy is designed to be extended toward graphics (swapchain / render pass) in the future.

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

### ⬤ 1.2. [`/Core`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Core) ＋ [`LUX.Vulkan.pas`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/LUX.Vulkan.pas) : Class library

> [`TVulkan`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/LUX.Vulkan.pas#L84) ：Singleton of TVkSystem  
> 　┃  
> [`TVkSystem`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/LUX.Vulkan.pas#L69) ：System  
> 　┗[`TVkDevices`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Device.pas#L67) ：Physical device list（owns the VkInstance）  
> 　　　┗[`TVkDevice`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Device.pas#L22) ：Physical device  
> 　　　　　┗[`TVkContexs`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Contex.pas#L62) ：Context list  
> 　　　　　　　┗[`TVkContex`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Contex.pas#L24) ：Context（logical device ＝ VkDevice）  
> 　　　　　　　　　┣[`TVkQueuers`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Queuer.pas#L51) ：Queue list  
> 　　　　　　　　　┃　┗[`TVkQueuer`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Queuer.pas#L21) ：Queue（VkQueue ＋ VkCommandPool）  
> 　　　　　　　　　┣[`TVkArgumes`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.pas#L47) ：Argument list  
> 　　　　　　　　　┃　┣[`TVkBuffer`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Buffer.pas#L24) ：Buffer（VkBuffer）  
> 　　　　　　　　　┃　┣[`TVkImager`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Imager.pas#L26) ：Image（VkImage ＋ VkImageView）  
> 　　　　　　　　　┃　┗[`TVkSamplr`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Samplr.pas#L21) ：Sampler（VkSampler）  
> 　　　　　　　　　┣[`TVkLibrars`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Shader.pas) ：Library list  
> 　　　　　　　　　┃　┗[`TVkLibrar`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Shader.pas) ：Library（`#include`d GLSL）  
> 　　　　　　　　　┗[`TVkShaders`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Shader.pas) ：Shader list  
> 　　　　　　　　　　　┗[`TVkShader`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Shader.pas) ：Shader（GLSL → SPIR-V ＋ reflection）  
> 　　　　　　　　　　　　　┗[`TVkKernels`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Kernel.pas#L185) ：Kernel list  
> 　　　　　　　　　　　　　　　┗[`TVkKernel`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Kernel.pas#L109) ：Kernel（VkPipeline ＋ VkDescriptorSet）  
> 　　　　　　　　　　　　　　　　　┗[`TVkParames`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Kernel.pas#L67) ：Parameter list  
> 　　　　　　　　　　　　　　　　　　　┗[`TVkParame`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Kernel.pas#L32) ：Parameter

### ⬤ 1.3. [`/Glslang`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Glslang) : GLSL compiler

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

#### ▼ 1.3.1. GLSL only

glslang can also compile **HLSL**, but this library supports **GLSL only** — `TVkShader` always selects the GLSL front-end.

This is deliberate: the HLSL front-end of glslang is **deprecated and will be removed in a future major release**（[glslang issue #4210](https://github.com/KhronosGroup/glslang/issues/4210)）, so building on it would be a dead end.
If you need HLSL, use [DXC](https://github.com/microsoft/DirectXShaderCompiler)（which emits SPIR-V directly）instead.
[Slang](https://github.com/shader-slang/slang) is a separate compiler altogether and is not part of glslang.

Note also that the source language is **never auto-detected** — GLSL and HLSL are chosen explicitly through `glslang_input_t.language`.

### ⬤ 1.4. [`/Stream`](https://github.com/LUXOPHIA/LUX.Vulkan/tree/main/Stream) : FMX streams

Copy images between `TVkImager` and FireMonkey `TBitmap`（[`TVkStream1D_FMX`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Stream/LUX.Vulkan.Stream.FMX.D1.pas) ／ [`TVkStream2D_FMX`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Stream/LUX.Vulkan.Stream.FMX.D2.pas)）.

----
## ■ 2. Usage

### ⬤ 2.1. Device
The `TVulkan` class is a singleton of the `TVkSystem` class, and automatically detects all **physical device**s（GPUs）.
The `VkInstance` is created lazily inside the `TVkDevices` list.
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

### ⬤ 2.2. Context
The "**context**" object (`TVkContex`) is the **logical device** (`VkDevice`).
It selects a compute-capable queue family, and owns arguments and shaders.
> `Object Pascal`
> ```Delphi
> _Contex := TVkContex.Create( _Device );
> ```

### ⬤ 2.3. Queue
The "**queue**" object (`TVkQueuer`) wraps a `VkQueue` and a `VkCommandPool`, and executes one-shot command buffers.
> `Object Pascal`
> ```Delphi
> _Queuer := TVkQueuer.Create( _Contex );
> ```

### ⬤ 2.4. Argument

> [`TVkArgume`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.pas#L23)  
> 　┣[`TVkMemory`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.pas#L24)  
> 　┃　┣[`TVkBuffer`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Buffer.pas#L24)  
> 　┃　┗[`TVkImager`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Imager.pas#L26)  
> 　┗[`TVkSamplr`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Samplr.pas#L21)  

#### ▼ 2.4.1. Buffer
The `TVkBuffer<T>` class stores an array of any record type in a host-visible `VkBuffer`.
Read and write the array through the `Data` property, between `Map` and `Unmap`.
> `Object Pascal`
> ```Delphi
> _Buffer := TVkBuffer<TItem>.Create( _Contex, _Queuer );
> _Buffer.Count := 2;         // Setting the number of elements
> _Buffer.Data.Map;           // Synchronize data with host
> _Buffer.Data[0] := Item0;   // Writing
> _Buffer.Data[1] := Item1;   // Writing
> _Buffer.Data.Unmap;         // Synchronize data with device
> ```

#### ▼ 2.4.2. Image
The "**image**" object (`TVkImager`) stores a pixel array in 1D to 3D as a device-local `VkImage`.
Host access goes through a resident staging buffer; `Data.Map` copies the image to the host, and `Data.Unmap` copies it back.
Image layout transitions are handled automatically.
The concrete classes follow the `TVkImager*Dx<Order>x<Type>` naming, e.g.
[`TVkImager1DxBGRAxUFix8`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Imager.D1.pas#L82)（`VK_FORMAT_B8G8R8A8_UNORM`）／
[`TVkImager2DxBGRAxUFix8`](https://github.com/LUXOPHIA/LUX.Vulkan/blob/main/Core/LUX.Vulkan.Argume.Memory.Imager.D2.pas#L82) etc.
> `Object Pascal`
> ```Delphi
> _Imager := TVkImager2DxBGRAxUFix8.Create( _Contex, _Queuer );
> _Imager.CountX := 500;  // Number of pixels in the X direction
> _Imager.CountY := 500;  // Number of pixels in the Y direction
> ```

#### ▼ 2.4.3. Sampler
The sampler object (`TVkSamplr`) defines the interpolation（linear ／ mirrored-repeat）.
> `Object Pascal`
> ```Delphi
> _Samplr := TVkSamplr.Create( _Contex );
> ```

### ⬤ 2.5. Library
The "**library**" object (`TVkLibrar`) is a GLSL source that is `#include`d by shaders.
It is resolved **by name** at compile time — no file system access, and no textual pre-expansion.
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

### ⬤ 2.6. Shader
The "**shader**" object (`TVkShader`) holds the GLSL source and the **SPIR-V** binary.
Load the GLSL source and the class **compiles it at runtime**（via `glslang.dll`）on first use, then **reflects** the resulting SPIR-V by itself: descriptor bindings (name / binding / type), entry points, and `local_size` are extracted automatically.
Editing `Source` at any time triggers a recompilation.
> `Object Pascal`
> ```Delphi
> _Shader := TVkShader.Create( _Contex );
>
> _Shader.Source.LoadFromFile( 'Execut.comp' );  // GLSL source
>
> _Shader.CompileOK  :Boolean            // Compile status
> _Shader.CompileLog :String             // Compile log ( errors and warnings )
> _Shader.Binary     :TVkBinary          // Generated SPIR-V
> _Shader.Bindins    :TArray<TVkBinding> // Reflected descriptor bindings
> _Shader.LocalX/Y/Z :Integer            // Reflected local_size
> ```

The **SPIR-V** binary (`TVkBinary`) can also be read and written directly, so a shader can be pre-compiled and shipped as a `.spv` file.
Loading a `.spv` requires no GLSL source at all — `glslang.dll` is then never loaded — and reflection works just the same.
> `Object Pascal`
> ```Delphi
> _Shader.Binary.SaveToFile( 'Execut.spv' );  // Compiles if necessary, then saves
> _Shader.Binary.LoadFromFile( 'Execut.spv' );  // Uses the SPIR-V as-is
>
> _Shader.Binary.SaveToStream( Stream );  // ( TStream versions are also available )
> _Shader.Binary.LoadFromStream( Stream );
> ```

### ⬤ 2.7. Kernel
The "**kernel**" object (`TVkKernel`) is a compute pipeline (`VkPipeline`), and internally creates the descriptor set layout ／ pipeline layout ／ descriptor pool ／ descriptor set from the shader reflection.
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
The number of workgroups is computed automatically from `GloSiz*` and the shader's `local_size`.

----
## ■ 3. Reference

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
