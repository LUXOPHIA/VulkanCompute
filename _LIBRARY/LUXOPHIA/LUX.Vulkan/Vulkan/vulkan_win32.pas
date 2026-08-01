unit vulkan_win32;

(*
** Copyright 2015-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0 OR MIT
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




//#ifdef __cplusplus
//#endif



// VK_KHR_win32_surface is a preprocessor guard. Do not pass it to API calls.
const VK_KHR_win32_surface                = 1;
const VK_KHR_WIN32_SURFACE_SPEC_VERSION   = 6;
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

//#ifndef VK_NO_PROTOTYPES
//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif

//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif
//#endif


// VK_KHR_external_memory_win32 is a preprocessor guard. Do not pass it to API calls.
const VK_KHR_external_memory_win32                = 1;
const VK_KHR_EXTERNAL_MEMORY_WIN32_SPEC_VERSION   = 1;
const VK_KHR_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME = 'VK_KHR_external_memory_win32';
type T_VkImportMemoryWin32HandleInfoKHR = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       handleType :T_VkExternalMemoryHandleTypeFlagBits;
       handle     :T_HANDLE;
       name       :T_LPCWSTR;
     end;
     P_VkImportMemoryWin32HandleInfoKHR = ^T_VkImportMemoryWin32HandleInfoKHR;

type T_VkExportMemoryWin32HandleInfoKHR = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       pAttributes :P_SECURITY_ATTRIBUTES;
       dwAccess    :T_DWORD;
       name        :T_LPCWSTR;
     end;
     P_VkExportMemoryWin32HandleInfoKHR = ^T_VkExportMemoryWin32HandleInfoKHR;

type T_VkMemoryWin32HandlePropertiesKHR = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       memoryTypeBits :T_uint32_t;
     end;
     P_VkMemoryWin32HandlePropertiesKHR = ^T_VkMemoryWin32HandlePropertiesKHR;

type T_VkMemoryGetWin32HandleInfoKHR = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       memory     :T_VkDeviceMemory;
       handleType :T_VkExternalMemoryHandleTypeFlagBits;
     end;
     P_VkMemoryGetWin32HandleInfoKHR = ^T_VkMemoryGetWin32HandleInfoKHR;

type
T_PFN_vkGetMemoryWin32HandleKHR = function(       device_              :T_VkDevice;
                                            const pGetWin32HandleInfo_ :P_VkMemoryGetWin32HandleInfoKHR;
                                                  pHandle_             :P_HANDLE ) :T_VkResult;
                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}
type
T_PFN_vkGetMemoryWin32HandlePropertiesKHR = function( device_                       :T_VkDevice;
                                                      handleType_                   :T_VkExternalMemoryHandleTypeFlagBits;
                                                      handle_                       :T_HANDLE;
                                                      pMemoryWin32HandleProperties_ :P_VkMemoryWin32HandlePropertiesKHR ) :T_VkResult;
                                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

//#ifndef VK_NO_PROTOTYPES
//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif

//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif
//#endif


// VK_KHR_win32_keyed_mutex is a preprocessor guard. Do not pass it to API calls.
const VK_KHR_win32_keyed_mutex                = 1;
const VK_KHR_WIN32_KEYED_MUTEX_SPEC_VERSION   = 1;
const VK_KHR_WIN32_KEYED_MUTEX_EXTENSION_NAME = 'VK_KHR_win32_keyed_mutex';
type T_VkWin32KeyedMutexAcquireReleaseInfoKHR = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       acquireCount     :T_uint32_t;
       pAcquireSyncs    :P_VkDeviceMemory;
       pAcquireKeys     :P_uint64_t;
       pAcquireTimeouts :P_uint32_t;
       releaseCount     :T_uint32_t;
       pReleaseSyncs    :P_VkDeviceMemory;
       pReleaseKeys     :P_uint64_t;
     end;
     P_VkWin32KeyedMutexAcquireReleaseInfoKHR = ^T_VkWin32KeyedMutexAcquireReleaseInfoKHR;



// VK_KHR_external_semaphore_win32 is a preprocessor guard. Do not pass it to API calls.
const VK_KHR_external_semaphore_win32                = 1;
const VK_KHR_EXTERNAL_SEMAPHORE_WIN32_SPEC_VERSION   = 1;
const VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME = 'VK_KHR_external_semaphore_win32';
type T_VkImportSemaphoreWin32HandleInfoKHR = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       semaphore  :T_VkSemaphore;
       flags      :T_VkSemaphoreImportFlags;
       handleType :T_VkExternalSemaphoreHandleTypeFlagBits;
       handle     :T_HANDLE;
       name       :T_LPCWSTR;
     end;
     P_VkImportSemaphoreWin32HandleInfoKHR = ^T_VkImportSemaphoreWin32HandleInfoKHR;

type T_VkExportSemaphoreWin32HandleInfoKHR = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       pAttributes :P_SECURITY_ATTRIBUTES;
       dwAccess    :T_DWORD;
       name        :T_LPCWSTR;
     end;
     P_VkExportSemaphoreWin32HandleInfoKHR = ^T_VkExportSemaphoreWin32HandleInfoKHR;

type T_VkD3D12FenceSubmitInfoKHR = record
       sType                      :T_VkStructureType;
       pNext                      :P_void;
       waitSemaphoreValuesCount   :T_uint32_t;
       pWaitSemaphoreValues       :P_uint64_t;
       signalSemaphoreValuesCount :T_uint32_t;
       pSignalSemaphoreValues     :P_uint64_t;
     end;
     P_VkD3D12FenceSubmitInfoKHR = ^T_VkD3D12FenceSubmitInfoKHR;

type T_VkSemaphoreGetWin32HandleInfoKHR = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       semaphore  :T_VkSemaphore;
       handleType :T_VkExternalSemaphoreHandleTypeFlagBits;
     end;
     P_VkSemaphoreGetWin32HandleInfoKHR = ^T_VkSemaphoreGetWin32HandleInfoKHR;

type
T_PFN_vkImportSemaphoreWin32HandleKHR = function(       device_                          :T_VkDevice;
                                                  const pImportSemaphoreWin32HandleInfo_ :P_VkImportSemaphoreWin32HandleInfoKHR ) :T_VkResult;
                                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}
type
T_PFN_vkGetSemaphoreWin32HandleKHR = function(       device_              :T_VkDevice;
                                               const pGetWin32HandleInfo_ :P_VkSemaphoreGetWin32HandleInfoKHR;
                                                     pHandle_             :P_HANDLE ) :T_VkResult;
                                     {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

//#ifndef VK_NO_PROTOTYPES
//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif

//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif
//#endif


// VK_KHR_external_fence_win32 is a preprocessor guard. Do not pass it to API calls.
const VK_KHR_external_fence_win32                = 1;
const VK_KHR_EXTERNAL_FENCE_WIN32_SPEC_VERSION   = 1;
const VK_KHR_EXTERNAL_FENCE_WIN32_EXTENSION_NAME = 'VK_KHR_external_fence_win32';
type T_VkImportFenceWin32HandleInfoKHR = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       fence      :T_VkFence;
       flags      :T_VkFenceImportFlags;
       handleType :T_VkExternalFenceHandleTypeFlagBits;
       handle     :T_HANDLE;
       name       :T_LPCWSTR;
     end;
     P_VkImportFenceWin32HandleInfoKHR = ^T_VkImportFenceWin32HandleInfoKHR;

type T_VkExportFenceWin32HandleInfoKHR = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       pAttributes :P_SECURITY_ATTRIBUTES;
       dwAccess    :T_DWORD;
       name        :T_LPCWSTR;
     end;
     P_VkExportFenceWin32HandleInfoKHR = ^T_VkExportFenceWin32HandleInfoKHR;

type T_VkFenceGetWin32HandleInfoKHR = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       fence      :T_VkFence;
       handleType :T_VkExternalFenceHandleTypeFlagBits;
     end;
     P_VkFenceGetWin32HandleInfoKHR = ^T_VkFenceGetWin32HandleInfoKHR;

type
T_PFN_vkImportFenceWin32HandleKHR = function(       device_                      :T_VkDevice;
                                              const pImportFenceWin32HandleInfo_ :P_VkImportFenceWin32HandleInfoKHR ) :T_VkResult;
                                    {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}
type
T_PFN_vkGetFenceWin32HandleKHR = function(       device_              :T_VkDevice;
                                           const pGetWin32HandleInfo_ :P_VkFenceGetWin32HandleInfoKHR;
                                                 pHandle_             :P_HANDLE ) :T_VkResult;
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

//#ifndef VK_NO_PROTOTYPES
//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif

//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif
//#endif


// VK_NV_external_memory_win32 is a preprocessor guard. Do not pass it to API calls.
const VK_NV_external_memory_win32                = 1;
const VK_NV_EXTERNAL_MEMORY_WIN32_SPEC_VERSION   = 1;
const VK_NV_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME = 'VK_NV_external_memory_win32';
type T_VkImportMemoryWin32HandleInfoNV = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       handleType :T_VkExternalMemoryHandleTypeFlagsNV;
       handle     :T_HANDLE;
     end;
     P_VkImportMemoryWin32HandleInfoNV = ^T_VkImportMemoryWin32HandleInfoNV;

type T_VkExportMemoryWin32HandleInfoNV = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       pAttributes :P_SECURITY_ATTRIBUTES;
       dwAccess    :T_DWORD;
     end;
     P_VkExportMemoryWin32HandleInfoNV = ^T_VkExportMemoryWin32HandleInfoNV;

type
T_PFN_vkGetMemoryWin32HandleNV = function( device_     :T_VkDevice;
                                           memory_     :T_VkDeviceMemory;
                                           handleType_ :T_VkExternalMemoryHandleTypeFlagsNV;
                                           pHandle_    :P_HANDLE ) :T_VkResult;
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

//#ifndef VK_NO_PROTOTYPES
//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif
//#endif


// VK_NV_win32_keyed_mutex is a preprocessor guard. Do not pass it to API calls.
const VK_NV_win32_keyed_mutex                = 1;
const VK_NV_WIN32_KEYED_MUTEX_SPEC_VERSION   = 2;
const VK_NV_WIN32_KEYED_MUTEX_EXTENSION_NAME = 'VK_NV_win32_keyed_mutex';
type T_VkWin32KeyedMutexAcquireReleaseInfoNV = record
       sType                       :T_VkStructureType;
       pNext                       :P_void;
       acquireCount                :T_uint32_t;
       pAcquireSyncs               :P_VkDeviceMemory;
       pAcquireKeys                :P_uint64_t;
       pAcquireTimeoutMilliseconds :P_uint32_t;
       releaseCount                :T_uint32_t;
       pReleaseSyncs               :P_VkDeviceMemory;
       pReleaseKeys                :P_uint64_t;
     end;
     P_VkWin32KeyedMutexAcquireReleaseInfoNV = ^T_VkWin32KeyedMutexAcquireReleaseInfoNV;



// VK_EXT_full_screen_exclusive is a preprocessor guard. Do not pass it to API calls.
const VK_EXT_full_screen_exclusive                = 1;
const VK_EXT_FULL_SCREEN_EXCLUSIVE_SPEC_VERSION   = 4;
const VK_EXT_FULL_SCREEN_EXCLUSIVE_EXTENSION_NAME = 'VK_EXT_full_screen_exclusive';

//typedef enum VkFullScreenExclusiveEXT {
type T_VkFullScreenExclusiveEXT = T_int32_t;  P_VkFullScreenExclusiveEXT = ^T_VkFullScreenExclusiveEXT;
const VK_FULL_SCREEN_EXCLUSIVE_DEFAULT_EXT                = 0;
const VK_FULL_SCREEN_EXCLUSIVE_ALLOWED_EXT                = 1;
const VK_FULL_SCREEN_EXCLUSIVE_DISALLOWED_EXT             = 2;
const VK_FULL_SCREEN_EXCLUSIVE_APPLICATION_CONTROLLED_EXT = 3;
const VK_FULL_SCREEN_EXCLUSIVE_MAX_ENUM_EXT               = $7FFFFFFF;
//} VkFullScreenExclusiveEXT;
type T_VkSurfaceFullScreenExclusiveInfoEXT = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       fullScreenExclusive :T_VkFullScreenExclusiveEXT;
     end;
     P_VkSurfaceFullScreenExclusiveInfoEXT = ^T_VkSurfaceFullScreenExclusiveInfoEXT;

type T_VkSurfaceCapabilitiesFullScreenExclusiveEXT = record
       sType                        :T_VkStructureType;
       pNext                        :P_void;
       fullScreenExclusiveSupported :T_VkBool32;
     end;
     P_VkSurfaceCapabilitiesFullScreenExclusiveEXT = ^T_VkSurfaceCapabilitiesFullScreenExclusiveEXT;

type T_VkSurfaceFullScreenExclusiveWin32InfoEXT = record
       sType    :T_VkStructureType;
       pNext    :P_void;
       hmonitor :T_HMONITOR;
     end;
     P_VkSurfaceFullScreenExclusiveWin32InfoEXT = ^T_VkSurfaceFullScreenExclusiveWin32InfoEXT;

type
T_PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT = function(       physicalDevice_    :T_VkPhysicalDevice;
                                                             const pSurfaceInfo_      :P_VkPhysicalDeviceSurfaceInfo2KHR;
                                                                   pPresentModeCount_ :P_uint32_t;
                                                                   pPresentModes_     :P_VkPresentModeKHR ) :T_VkResult;
                                                   {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}
type
T_PFN_vkAcquireFullScreenExclusiveModeEXT = function( device_    :T_VkDevice;
                                                      swapchain_ :T_VkSwapchainKHR ) :T_VkResult;
                                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}
type
T_PFN_vkReleaseFullScreenExclusiveModeEXT = function( device_    :T_VkDevice;
                                                      swapchain_ :T_VkSwapchainKHR ) :T_VkResult;
                                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}
type
T_PFN_vkGetDeviceGroupSurfacePresentModes2EXT = function(       device_       :T_VkDevice;
                                                          const pSurfaceInfo_ :P_VkPhysicalDeviceSurfaceInfo2KHR;
                                                                pModes_       :P_VkDeviceGroupPresentModeFlagsKHR ) :T_VkResult;
                                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

//#ifndef VK_NO_PROTOTYPES
//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif

//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif

//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif

//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif
//#endif


// VK_NV_acquire_winrt_display is a preprocessor guard. Do not pass it to API calls.
const VK_NV_acquire_winrt_display                = 1;
const VK_NV_ACQUIRE_WINRT_DISPLAY_SPEC_VERSION   = 1;
const VK_NV_ACQUIRE_WINRT_DISPLAY_EXTENSION_NAME = 'VK_NV_acquire_winrt_display';
type
T_PFN_vkAcquireWinrtDisplayNV = function( physicalDevice_ :T_VkPhysicalDevice;
                                          display_        :T_VkDisplayKHR ) :T_VkResult;
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}
type
T_PFN_vkGetWinrtDisplayNV = function( physicalDevice_   :T_VkPhysicalDevice;
                                      deviceRelativeId_ :T_uint32_t;
                                      pDisplay_         :P_VkDisplayKHR ) :T_VkResult;
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

//#ifndef VK_NO_PROTOTYPES
//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif

//#ifndef VK_ONLY_EXPORTED_PROTOTYPES
//#endif
//#endif

//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

end. //######################################################################### ■
