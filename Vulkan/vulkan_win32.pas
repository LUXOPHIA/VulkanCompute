unit vulkan_win32;

(*
** Copyright 2015-2024 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*)

(*
** This header is generated from the Khronos Vulkan XML API Registry.
**
*)

interface //#################################################################### ■

uses LUX.Code.C,
     vk_platform,
     vulkan_core;

//#ifndef VULKAN_WIN32_H_
const VULKAN_WIN32_H_ = 1;

(*
** Copyright 2015-2024 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*)

(*
** This header is generated from the Khronos Vulkan XML API Registry.
**
*)


//#ifdef __cplusplus
//extern "C" {
//#endif



// VK_KHR_win32_surface is a preprocessor guard. Do not pass it to API calls.
const VK_KHR_win32_surface = 1;
const VK_KHR_WIN32_SURFACE_SPEC_VERSION = 6;
const VK_KHR_WIN32_SURFACE_EXTENSION_NAME = 'VK_KHR_win32_surface';
type T_VkWin32SurfaceCreateFlagsKHR = T_VkFlags;  P_VkWin32SurfaceCreateFlagsKHR = ^T_VkWin32SurfaceCreateFlagsKHR;
type T_VkWin32SurfaceCreateInfoKHR = record
       sType     :T_VkStructureType;
       pNext     :P_void;
       flags     :T_VkWin32SurfaceCreateFlagsKHR;
       hinstance :T_HINSTANCE;
       hwnd      :T_HWND;
     end;
     P_VkWin32SurfaceCreateInfoKHR = ^T_VkWin32SurfaceCreateInfoKHR;

type
T_PFN_vkCreateWin32SurfaceKHR = function(       instance_    :T_VkInstance;
                                          const pCreateInfo_ :P_VkWin32SurfaceCreateInfoKHR;
                                          const pAllocator_  :P_VkAllocationCallbacks;
                                                pSurface_    :P_VkSurfaceKHR ) :T_VkResult;
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR = function( physicalDevice_   :T_VkPhysicalDevice;
                                                                 queueFamilyIndex_ :T_uint32_t ) :T_VkBool32;
                                                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}



implementation //############################################################### ■

end. //######################################################################### ■
