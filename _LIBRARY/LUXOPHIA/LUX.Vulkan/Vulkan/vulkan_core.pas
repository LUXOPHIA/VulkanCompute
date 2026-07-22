unit vulkan_core;

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
     vk_platform;

// VK_VERSION_1_0 is a preprocessor guard. Do not pass it to API calls.
const VK_VERSION_1_0 = 1;
//#include "vk_platform.h"

//#define VK_DEFINE_HANDLE(object) typedef struct object##_T* object;

//#ifndef VK_USE_64_BIT_PTR_DEFINES
//    #if defined(__LP64__) || defined(_WIN64) || (defined(__x86_64__) && !defined(__ILP32__) ) || defined(_M_X64) || defined(__ia64) || defined (_M_IA64) || defined(__aarch64__) || defined(__powerpc64__) || (defined(__riscv) && __riscv_xlen == 64)
//        #define VK_USE_64_BIT_PTR_DEFINES 1
//    #else
//        #define VK_USE_64_BIT_PTR_DEFINES 0
//    #endif
//#endif

{$IF Defined( CPU64BITS ) }
const VK_NULL_HANDLE :Pointer = nil;
{$ELSE}
const VK_NULL_HANDLE = 0;
{$ENDIF}

//#ifndef VK_DEFINE_NON_DISPATCHABLE_HANDLE
//    #if (VK_USE_64_BIT_PTR_DEFINES==1)
//        #define VK_DEFINE_NON_DISPATCHABLE_HANDLE(object) typedef struct object##_T *object;
//    #else
//        #define VK_DEFINE_NON_DISPATCHABLE_HANDLE(object) typedef uint64_t object;
//    #endif
//#endif

//#define VK_MAKE_API_VERSION(variant, major, minor, patch) \
//    ((((uint32_t)(variant)) << 29U) | (((uint32_t)(major)) << 22U) | (((uint32_t)(minor)) << 12U) | ((uint32_t)(patch)))
function VK_MAKE_API_VERSION( const variant_,major_,minor_,patch_:T_uint32_t ) :T_uint32_t; inline;

// DEPRECATED: This define has been removed. Specific version defines (e.g. VK_API_VERSION_1_0), or the VK_MAKE_VERSION macro, should be used instead.
//#define VK_API_VERSION VK_MAKE_API_VERSION(0, 1, 0, 0) // Patch version should always be set to 0

// Vulkan 1.0 version number
const VK_API_VERSION_1_0 = ( 0 shl 29 ) or ( 1 shl 22 ) or ( 0 shl 12 ) or 0;// Patch version should always be set to 0

// Version of this file
const VK_HEADER_VERSION = 278;

// Complete version of this file
const VK_HEADER_VERSION_COMPLETE = ( 0 shl 29 ) or ( 1 shl 22 ) or ( 3 shl 12 ) or VK_HEADER_VERSION;

// DEPRECATED: This define is deprecated. VK_MAKE_API_VERSION should be used instead.
//#define VK_MAKE_VERSION(major, minor, patch) \
//    ((((uint32_t)(major)) << 22U) | (((uint32_t)(minor)) << 12U) | ((uint32_t)(patch)))
function VK_MAKE_VERSION( const major_,minor_,patch_:T_uint32_t ) :T_uint32_t; inline;

// DEPRECATED: This define is deprecated. VK_API_VERSION_MAJOR should be used instead.
function VK_VERSION_MAJOR( const version_:T_uint32_t ) :T_uint32_t; inline;

// DEPRECATED: This define is deprecated. VK_API_VERSION_MINOR should be used instead.
function VK_VERSION_MINOR( const version_:T_uint32_t ) :T_uint32_t; inline;

// DEPRECATED: This define is deprecated. VK_API_VERSION_PATCH should be used instead.
function VK_VERSION_PATCH( const version_:T_uint32_t ) :T_uint32_t; inline;

function VK_API_VERSION_VARIANT( const version_:T_uint32_t ) :T_uint32_t; inline;
function VK_API_VERSION_MAJOR( const version_:T_uint32_t ) :T_uint32_t; inline;
function VK_API_VERSION_MINOR( const version_:T_uint32_t ) :T_uint32_t; inline;
function VK_API_VERSION_PATCH( const version_:T_uint32_t ) :T_uint32_t; inline;

type T_VkBool32        = T_uint32_t;  P_VkBool32        = ^T_VkBool32       ;
type T_VkDeviceAddress = T_uint64_t;  P_VkDeviceAddress = ^T_VkDeviceAddress;
type T_VkDeviceSize    = T_uint64_t;  P_VkDeviceSize    = ^T_VkDeviceSize   ;
type T_VkFlags         = T_uint32_t;  P_VkFlags         = ^T_VkFlags        ;
type T_VkSampleMask    = T_uint32_t;  P_VkSampleMask    = ^T_VkSampleMask   ;

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkBuffer)
{$IF Defined( CPU64BITS ) }
type T_VkBuffer = ^T__VkBuffer;  T__VkBuffer = record end;  P_VkBuffer = ^T_VkBuffer;
{$ELSE}
type T_VkBuffer = T_uint64_t;  P_VkBuffer = ^T_VkBuffer;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkImage)
{$IF Defined( CPU64BITS ) }
type T_VkImage = ^T__VkImage;  T__VkImage = record end;  P_VkImage = ^T_VkImage;
{$ELSE}
type T_VkImage = T_uint64_t;  P_VkImage = ^T_VkImage;
{$ENDIF}

//VK_DEFINE_HANDLE(VkInstance)
type T_VkInstance = ^T__VkInstance;  T__VkInstance = record end;  P_VkInstance = ^T_VkInstance;

//VK_DEFINE_HANDLE(VkPhysicalDevice)
type T_VkPhysicalDevice = ^T__VkPhysicalDevice;  T__VkPhysicalDevice = record end;  P_VkPhysicalDevice = ^T_VkPhysicalDevice;

//VK_DEFINE_HANDLE(VkDevice)
type T_VkDevice = ^T__VkDevice;  T__VkDevice = record end;  P_VkDevice = ^T_VkDevice;

//VK_DEFINE_HANDLE(VkQueue)
type T_VkQueue = ^T__VkQueue;  T__VkQueue = record end;  P_VkQueue = ^T_VkQueue;

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkSemaphore)
{$IF Defined( CPU64BITS ) }
type T_VkSemaphore = ^T__VkSemaphore;  T__VkSemaphore = record end;  P_VkSemaphore = ^T_VkSemaphore;
{$ELSE}
type T_VkSemaphore = T_uint64_t;  P_VkSemaphore = ^T_VkSemaphore;
{$ENDIF}

//VK_DEFINE_HANDLE(VkCommandBuffer)
type T_VkCommandBuffer = ^T__VkCommandBuffer;  T__VkCommandBuffer = record end;  P_VkCommandBuffer = ^T_VkCommandBuffer;

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkFence)
{$IF Defined( CPU64BITS ) }
type T_VkFence = ^T__VkFence;  T__VkFence = record end;  P_VkFence = ^T_VkFence;
{$ELSE}
type T_VkFence = T_uint64_t;  P_VkFence = ^T_VkFence;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkDeviceMemory)
{$IF Defined( CPU64BITS ) }
type T_VkDeviceMemory = ^T__VkDeviceMemory;  T__VkDeviceMemory = record end;  P_VkDeviceMemory = ^T_VkDeviceMemory;
{$ELSE}
type T_VkDeviceMemory = T_uint64_t;  P_VkDeviceMemory = ^T_VkDeviceMemory;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkEvent)
{$IF Defined( CPU64BITS ) }
type T_VkEvent = ^T__VkEvent;  T__VkEvent = record end;  P_VkEvent = ^T_VkEvent;
{$ELSE}
type T_VkEvent = T_uint64_t;  P_VkEvent = ^T_VkEvent;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkQueryPool)
{$IF Defined( CPU64BITS ) }
type T_VkQueryPool = ^T__VkQueryPool;  T__VkQueryPool = record end;  P_VkQueryPool = ^T_VkQueryPool;
{$ELSE}
type T_VkQueryPool = T_uint64_t;  P_VkQueryPool = ^T_VkQueryPool;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkBufferView)
{$IF Defined( CPU64BITS ) }
type T_VkBufferView = ^T__VkBufferView;  T__VkBufferView = record end;  P_VkBufferView = ^T_VkBufferView;
{$ELSE}
type T_VkBufferView = T_uint64_t;  P_VkBufferView = ^T_VkBufferView;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkImageView)
{$IF Defined( CPU64BITS ) }
type T_VkImageView = ^T__VkImageView;  T__VkImageView = record end;  P_VkImageView = ^T_VkImageView;
{$ELSE}
type T_VkImageView = T_uint64_t;  P_VkImageView = ^T_VkImageView;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkShaderModule)
{$IF Defined( CPU64BITS ) }
type T_VkShaderModule = ^T__VkShaderModule;  T__VkShaderModule = record end;  P_VkShaderModule = ^T_VkShaderModule;
{$ELSE}
type T_VkShaderModule = T_uint64_t;  P_VkShaderModule = ^T_VkShaderModule;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkPipelineCache)
{$IF Defined( CPU64BITS ) }
type T_VkPipelineCache = ^T__VkPipelineCache;  T__VkPipelineCache = record end;  P_VkPipelineCache = ^T_VkPipelineCache;
{$ELSE}
type T_VkPipelineCache = T_uint64_t;  P_VkPipelineCache = ^T_VkPipelineCache;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkPipelineLayout)
{$IF Defined( CPU64BITS ) }
type T_VkPipelineLayout = ^T__VkPipelineLayout;  T__VkPipelineLayout = record end;  P_VkPipelineLayout = ^T_VkPipelineLayout;
{$ELSE}
type T_VkPipelineLayout = T_uint64_t;  P_VkPipelineLayout = ^T_VkPipelineLayout;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkPipeline)
{$IF Defined( CPU64BITS ) }
type T_VkPipeline = ^T__VkPipeline;  T__VkPipeline = record end;  P_VkPipeline = ^T_VkPipeline;
{$ELSE}
type T_VkPipeline = T_uint64_t;  P_VkPipeline = ^T_VkPipeline;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkRenderPass)
{$IF Defined( CPU64BITS ) }
type T_VkRenderPass = ^T__VkRenderPass;  T__VkRenderPass = record end;  P_VkRenderPass = ^T_VkRenderPass;
{$ELSE}
type T_VkRenderPass = T_uint64_t;  P_VkRenderPass = ^T_VkRenderPass;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkDescriptorSetLayout)
{$IF Defined( CPU64BITS ) }
type T_VkDescriptorSetLayout = ^T__VkDescriptorSetLayout;  T__VkDescriptorSetLayout = record end;  P_VkDescriptorSetLayout = ^T_VkDescriptorSetLayout;
{$ELSE}
type T_VkDescriptorSetLayout = T_uint64_t;  P_VkDescriptorSetLayout = ^T_VkDescriptorSetLayout;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkSampler)
{$IF Defined( CPU64BITS ) }
type T_VkSampler = ^T__VkSampler;  T__VkSampler = record end;  P_VkSampler = ^T_VkSampler;
{$ELSE}
type T_VkSampler = T_uint64_t;  P_VkSampler = ^T_VkSampler;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkDescriptorSet)
{$IF Defined( CPU64BITS ) }
type T_VkDescriptorSet = ^T__VkDescriptorSet;  T__VkDescriptorSet = record end;  P_VkDescriptorSet = ^T_VkDescriptorSet;
{$ELSE}
type T_VkDescriptorSet = T_uint64_t;  P_VkDescriptorSet = ^T_VkDescriptorSet;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkDescriptorPool)
{$IF Defined( CPU64BITS ) }
type T_VkDescriptorPool = ^T__VkDescriptorPool;  T__VkDescriptorPool = record end;  P_VkDescriptorPool = ^T_VkDescriptorPool;
{$ELSE}
type T_VkDescriptorPool = T_uint64_t;  P_VkDescriptorPool = ^T_VkDescriptorPool;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkFramebuffer)
{$IF Defined( CPU64BITS ) }
type T_VkFramebuffer = ^T__VkFramebuffer;  T__VkFramebuffer = record end;  P_VkFramebuffer = ^T_VkFramebuffer;
{$ELSE}
type T_VkFramebuffer = T_uint64_t;  P_VkFramebuffer = ^T_VkFramebuffer;
{$ENDIF}

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkCommandPool)
{$IF Defined( CPU64BITS ) }
type T_VkCommandPool = ^T__VkCommandPool;  T__VkCommandPool = record end;  P_VkCommandPool = ^T_VkCommandPool;
{$ELSE}
type T_VkCommandPool = T_uint64_t;  P_VkCommandPool = ^T_VkCommandPool;
{$ENDIF}

const VK_ATTACHMENT_UNUSED              = T_uint32_t( $FFFFFFFF );
const VK_FALSE                          = 0;
const VK_LOD_CLAMP_NONE                 = 1000.0;
const VK_QUEUE_FAMILY_IGNORED           = T_uint32_t( $FFFFFFFF );
const VK_REMAINING_ARRAY_LAYERS         = T_uint32_t( $FFFFFFFF );
const VK_REMAINING_MIP_LEVELS           = T_uint32_t( $FFFFFFFF );
const VK_SUBPASS_EXTERNAL               = T_uint32_t( $FFFFFFFF );
const VK_TRUE                           = 1;
const VK_WHOLE_SIZE                     = T_uint64_t( $FFFFFFFFFFFFFFFF );
const VK_MAX_MEMORY_TYPES               = 32;
const VK_MAX_PHYSICAL_DEVICE_NAME_SIZE  = 256;
const VK_UUID_SIZE                      = 16;
const VK_MAX_EXTENSION_NAME_SIZE        = 256;
const VK_MAX_DESCRIPTION_SIZE           = 256;
const VK_MAX_MEMORY_HEAPS               = 16;

//typedef enum VkResult {
type T_VkResult = T_int32_t;  P_VkResult = ^T_VkResult;
const VK_SUCCESS                                             = 0;
const VK_NOT_READY                                           = 1;
const VK_TIMEOUT                                             = 2;
const VK_EVENT_SET                                           = 3;
const VK_EVENT_RESET                                         = 4;
const VK_INCOMPLETE                                          = 5;
const VK_ERROR_OUT_OF_HOST_MEMORY                            = -1;
const VK_ERROR_OUT_OF_DEVICE_MEMORY                          = -2;
const VK_ERROR_INITIALIZATION_FAILED                         = -3;
const VK_ERROR_DEVICE_LOST                                   = -4;
const VK_ERROR_MEMORY_MAP_FAILED                             = -5;
const VK_ERROR_LAYER_NOT_PRESENT                             = -6;
const VK_ERROR_EXTENSION_NOT_PRESENT                         = -7;
const VK_ERROR_FEATURE_NOT_PRESENT                           = -8;
const VK_ERROR_INCOMPATIBLE_DRIVER                           = -9;
const VK_ERROR_TOO_MANY_OBJECTS                              = -10;
const VK_ERROR_FORMAT_NOT_SUPPORTED                          = -11;
const VK_ERROR_FRAGMENTED_POOL                               = -12;
const VK_ERROR_UNKNOWN                                       = -13;
const VK_ERROR_OUT_OF_POOL_MEMORY                            = -1000069000;
const VK_ERROR_INVALID_EXTERNAL_HANDLE                       = -1000072003;
const VK_ERROR_FRAGMENTATION                                 = -1000161000;
const VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS                = -1000257000;
const VK_PIPELINE_COMPILE_REQUIRED                           = 1000297000;
const VK_ERROR_SURFACE_LOST_KHR                              = -1000000000;
const VK_ERROR_NATIVE_WINDOW_IN_USE_KHR                      = -1000000001;
const VK_SUBOPTIMAL_KHR                                      = 1000001003;
const VK_ERROR_OUT_OF_DATE_KHR                               = -1000001004;
const VK_ERROR_INCOMPATIBLE_DISPLAY_KHR                      = -1000003001;
const VK_ERROR_VALIDATION_FAILED_EXT                         = -1000011001;
const VK_ERROR_INVALID_SHADER_NV                             = -1000012000;
const VK_ERROR_IMAGE_USAGE_NOT_SUPPORTED_KHR                 = -1000023000;
const VK_ERROR_VIDEO_PICTURE_LAYOUT_NOT_SUPPORTED_KHR        = -1000023001;
const VK_ERROR_VIDEO_PROFILE_OPERATION_NOT_SUPPORTED_KHR     = -1000023002;
const VK_ERROR_VIDEO_PROFILE_FORMAT_NOT_SUPPORTED_KHR        = -1000023003;
const VK_ERROR_VIDEO_PROFILE_CODEC_NOT_SUPPORTED_KHR         = -1000023004;
const VK_ERROR_VIDEO_STD_VERSION_NOT_SUPPORTED_KHR           = -1000023005;
const VK_ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT  = -1000158000;
const VK_ERROR_NOT_PERMITTED_KHR                             = -1000174001;
const VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT           = -1000255000;
const VK_THREAD_IDLE_KHR                                     = 1000268000;
const VK_THREAD_DONE_KHR                                     = 1000268001;
const VK_OPERATION_DEFERRED_KHR                              = 1000268002;
const VK_OPERATION_NOT_DEFERRED_KHR                          = 1000268003;
const VK_ERROR_INVALID_VIDEO_STD_PARAMETERS_KHR              = -1000299000;
const VK_ERROR_COMPRESSION_EXHAUSTED_EXT                     = -1000338000;
const VK_INCOMPATIBLE_SHADER_BINARY_EXT                      = 1000482000;
const VK_ERROR_OUT_OF_POOL_MEMORY_KHR                        = VK_ERROR_OUT_OF_POOL_MEMORY;
const VK_ERROR_INVALID_EXTERNAL_HANDLE_KHR                   = VK_ERROR_INVALID_EXTERNAL_HANDLE;
const VK_ERROR_FRAGMENTATION_EXT                             = VK_ERROR_FRAGMENTATION;
const VK_ERROR_NOT_PERMITTED_EXT                             = VK_ERROR_NOT_PERMITTED_KHR;
const VK_ERROR_INVALID_DEVICE_ADDRESS_EXT                    = VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS;
const VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS_KHR            = VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS;
const VK_PIPELINE_COMPILE_REQUIRED_EXT                       = VK_PIPELINE_COMPILE_REQUIRED;
const VK_ERROR_PIPELINE_COMPILE_REQUIRED_EXT                 = VK_PIPELINE_COMPILE_REQUIRED;
const VK_ERROR_INCOMPATIBLE_SHADER_BINARY_EXT                = VK_INCOMPATIBLE_SHADER_BINARY_EXT;
const VK_RESULT_MAX_ENUM                                     = $7FFFFFFF;
//} VkResult;


//typedef enum VkStructureType {
type T_VkStructureType = T_int32_t;  P_VkStructureType = ^T_VkStructureType;
const VK_STRUCTURE_TYPE_APPLICATION_INFO                                             = 0;
const VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO                                         = 1;
const VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO                                     = 2;
const VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO                                           = 3;
const VK_STRUCTURE_TYPE_SUBMIT_INFO                                                  = 4;
const VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO                                         = 5;
const VK_STRUCTURE_TYPE_MAPPED_MEMORY_RANGE                                          = 6;
const VK_STRUCTURE_TYPE_BIND_SPARSE_INFO                                             = 7;
const VK_STRUCTURE_TYPE_FENCE_CREATE_INFO                                            = 8;
const VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO                                        = 9;
const VK_STRUCTURE_TYPE_EVENT_CREATE_INFO                                            = 10;
const VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO                                       = 11;
const VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO                                           = 12;
const VK_STRUCTURE_TYPE_BUFFER_VIEW_CREATE_INFO                                      = 13;
const VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO                                            = 14;
const VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO                                       = 15;
const VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO                                    = 16;
const VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO                                   = 17;
const VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO                            = 18;
const VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO                      = 19;
const VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO                    = 20;
const VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_STATE_CREATE_INFO                      = 21;
const VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO                          = 22;
const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO                     = 23;
const VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO                       = 24;
const VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO                     = 25;
const VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO                       = 26;
const VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO                           = 27;
const VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO                                = 28;
const VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO                                 = 29;
const VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO                                  = 30;
const VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO                                          = 31;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO                            = 32;
const VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO                                  = 33;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO                                 = 34;
const VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET                                         = 35;
const VK_STRUCTURE_TYPE_COPY_DESCRIPTOR_SET                                          = 36;
const VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO                                      = 37;
const VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO                                      = 38;
const VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO                                     = 39;
const VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO                                 = 40;
const VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_INFO                              = 41;
const VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO                                    = 42;
const VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO                                       = 43;
const VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER                                        = 44;
const VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER                                         = 45;
const VK_STRUCTURE_TYPE_MEMORY_BARRIER                                               = 46;
const VK_STRUCTURE_TYPE_LOADER_INSTANCE_CREATE_INFO                                  = 47;
const VK_STRUCTURE_TYPE_LOADER_DEVICE_CREATE_INFO                                    = 48;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_PROPERTIES                          = 1000094000;
const VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO                                      = 1000157000;
const VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO                                       = 1000157001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES                       = 1000083000;
const VK_STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS                                = 1000127000;
const VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO                               = 1000127001;
const VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO                                   = 1000060000;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO                          = 1000060003;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO                       = 1000060004;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO                                     = 1000060005;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO                                = 1000060006;
const VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO                         = 1000060013;
const VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO                          = 1000060014;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES                             = 1000070000;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO                              = 1000070001;
const VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2                            = 1000146000;
const VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2                             = 1000146001;
const VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2                      = 1000146002;
const VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2                                        = 1000146003;
const VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2                           = 1000146004;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2                                   = 1000059000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2                                 = 1000059001;
const VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2                                          = 1000059002;
const VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2                                    = 1000059003;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2                          = 1000059004;
const VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2                                    = 1000059005;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2                          = 1000059006;
const VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2                             = 1000059007;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2                   = 1000059008;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES                    = 1000117000;
const VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO              = 1000117001;
const VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO                                 = 1000117002;
const VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO        = 1000117003;
const VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO                            = 1000053000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES                           = 1000053001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES                         = 1000053002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES                   = 1000120000;
const VK_STRUCTURE_TYPE_PROTECTED_SUBMIT_INFO                                        = 1000145000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES                    = 1000145001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_PROPERTIES                  = 1000145002;
const VK_STRUCTURE_TYPE_DEVICE_QUEUE_INFO_2                                          = 1000145003;
const VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO                         = 1000156000;
const VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO                                = 1000156001;
const VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO                                 = 1000156002;
const VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO                         = 1000156003;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES            = 1000156004;
const VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES             = 1000156005;
const VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO                       = 1000085000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO                   = 1000071000;
const VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES                             = 1000071001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO                         = 1000071002;
const VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES                                   = 1000071003;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES                                = 1000071004;
const VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO                           = 1000072000;
const VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO                            = 1000072001;
const VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO                                  = 1000072002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO                          = 1000112000;
const VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES                                    = 1000112001;
const VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO                                     = 1000113000;
const VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO                                 = 1000077000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO                      = 1000076000;
const VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES                                = 1000076001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES                     = 1000168000;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT                                = 1000168001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES              = 1000063000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_FEATURES                          = 49;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_PROPERTIES                        = 50;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES                          = 51;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_PROPERTIES                        = 52;
const VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO                                = 1000147000;
const VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2                                     = 1000109000;
const VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2                                       = 1000109001;
const VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2                                        = 1000109002;
const VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2                                         = 1000109003;
const VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2                                    = 1000109004;
const VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO                                           = 1000109005;
const VK_STRUCTURE_TYPE_SUBPASS_END_INFO                                             = 1000109006;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES                        = 1000177000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES                            = 1000196000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES                 = 1000180000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES                 = 1000082000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES                    = 1000197000;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO              = 1000161000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES                 = 1000161001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES               = 1000161002;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO       = 1000161003;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT      = 1000161004;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES             = 1000199000;
const VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE                    = 1000199001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES                 = 1000221000;
const VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO                              = 1000246000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES             = 1000130000;
const VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO                           = 1000130001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES                 = 1000211000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES               = 1000108000;
const VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO                          = 1000108001;
const VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO                            = 1000108002;
const VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO                            = 1000108003;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES      = 1000253000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES      = 1000175000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES      = 1000241000;
const VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT                          = 1000241001;
const VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT                        = 1000241002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES                    = 1000261000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES                  = 1000207000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES                = 1000207001;
const VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO                                   = 1000207002;
const VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO                               = 1000207003;
const VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO                                          = 1000207004;
const VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO                                        = 1000207005;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES               = 1000257000;
const VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO                                   = 1000244001;
const VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO                    = 1000257002;
const VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO                  = 1000257003;
const VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO                    = 1000257004;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES                          = 53;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES                        = 54;
const VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO                       = 1000192000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES         = 1000215000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES                              = 1000245000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES  = 1000276000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES                        = 1000295000;
const VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO                              = 1000295001;
const VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO                                = 1000295002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES     = 1000297000;
const VK_STRUCTURE_TYPE_MEMORY_BARRIER_2                                             = 1000314000;
const VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2                                      = 1000314001;
const VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2                                       = 1000314002;
const VK_STRUCTURE_TYPE_DEPENDENCY_INFO                                              = 1000314003;
const VK_STRUCTURE_TYPE_SUBMIT_INFO_2                                                = 1000314004;
const VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO                                        = 1000314005;
const VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO                                   = 1000314006;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES                   = 1000314007;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES    = 1000325000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES                    = 1000335000;
const VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2                                           = 1000337000;
const VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2                                            = 1000337001;
const VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2                                  = 1000337002;
const VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2                                  = 1000337003;
const VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2                                            = 1000337004;
const VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2                                         = 1000337005;
const VK_STRUCTURE_TYPE_BUFFER_COPY_2                                                = 1000337006;
const VK_STRUCTURE_TYPE_IMAGE_COPY_2                                                 = 1000337007;
const VK_STRUCTURE_TYPE_IMAGE_BLIT_2                                                 = 1000337008;
const VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2                                          = 1000337009;
const VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2                                              = 1000337010;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES             = 1000225000;
const VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO     = 1000225001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES               = 1000225002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES                = 1000138000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES              = 1000138001;
const VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK                    = 1000138002;
const VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO             = 1000138003;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES        = 1000066000;
const VK_STRUCTURE_TYPE_RENDERING_INFO                                               = 1000044000;
const VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO                                    = 1000044001;
const VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO                               = 1000044002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES                   = 1000044003;
const VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDERING_INFO                    = 1000044004;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES          = 1000280000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES        = 1000280001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES            = 1000281001;
const VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3                                          = 1000360000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES                       = 1000413000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES                     = 1000413001;
const VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS                            = 1000413002;
const VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS                             = 1000413003;
const VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR                                    = 1000001000;
const VK_STRUCTURE_TYPE_PRESENT_INFO_KHR                                             = 1000001001;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR                        = 1000060007;
const VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR                              = 1000060008;
const VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR                         = 1000060009;
const VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR                                  = 1000060010;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR                                = 1000060011;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR                       = 1000060012;
const VK_STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR                                 = 1000002000;
const VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR                              = 1000002001;
const VK_STRUCTURE_TYPE_DISPLAY_PRESENT_INFO_KHR                                     = 1000003000;
const VK_STRUCTURE_TYPE_XLIB_SURFACE_CREATE_INFO_KHR                                 = 1000004000;
const VK_STRUCTURE_TYPE_XCB_SURFACE_CREATE_INFO_KHR                                  = 1000005000;
const VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR                              = 1000006000;
const VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR                              = 1000008000;
const VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR                                = 1000009000;
const VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT                        = 1000011000;
const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_RASTERIZATION_ORDER_AMD         = 1000018000;
const VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT                            = 1000022000;
const VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT                             = 1000022001;
const VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT                                 = 1000022002;
const VK_STRUCTURE_TYPE_VIDEO_PROFILE_INFO_KHR                                       = 1000023000;
const VK_STRUCTURE_TYPE_VIDEO_CAPABILITIES_KHR                                       = 1000023001;
const VK_STRUCTURE_TYPE_VIDEO_PICTURE_RESOURCE_INFO_KHR                              = 1000023002;
const VK_STRUCTURE_TYPE_VIDEO_SESSION_MEMORY_REQUIREMENTS_KHR                        = 1000023003;
const VK_STRUCTURE_TYPE_BIND_VIDEO_SESSION_MEMORY_INFO_KHR                           = 1000023004;
const VK_STRUCTURE_TYPE_VIDEO_SESSION_CREATE_INFO_KHR                                = 1000023005;
const VK_STRUCTURE_TYPE_VIDEO_SESSION_PARAMETERS_CREATE_INFO_KHR                     = 1000023006;
const VK_STRUCTURE_TYPE_VIDEO_SESSION_PARAMETERS_UPDATE_INFO_KHR                     = 1000023007;
const VK_STRUCTURE_TYPE_VIDEO_BEGIN_CODING_INFO_KHR                                  = 1000023008;
const VK_STRUCTURE_TYPE_VIDEO_END_CODING_INFO_KHR                                    = 1000023009;
const VK_STRUCTURE_TYPE_VIDEO_CODING_CONTROL_INFO_KHR                                = 1000023010;
const VK_STRUCTURE_TYPE_VIDEO_REFERENCE_SLOT_INFO_KHR                                = 1000023011;
const VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR                            = 1000023012;
const VK_STRUCTURE_TYPE_VIDEO_PROFILE_LIST_INFO_KHR                                  = 1000023013;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_FORMAT_INFO_KHR                        = 1000023014;
const VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR                                  = 1000023015;
const VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR              = 1000023016;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_INFO_KHR                                        = 1000024000;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_CAPABILITIES_KHR                                = 1000024001;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_USAGE_INFO_KHR                                  = 1000024002;
const VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_IMAGE_CREATE_INFO_NV                    = 1000026000;
const VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_BUFFER_CREATE_INFO_NV                   = 1000026001;
const VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_MEMORY_ALLOCATE_INFO_NV                 = 1000026002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT              = 1000028000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_PROPERTIES_EXT            = 1000028001;
const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_STREAM_CREATE_INFO_EXT          = 1000028002;
const VK_STRUCTURE_TYPE_CU_MODULE_CREATE_INFO_NVX                                    = 1000029000;
const VK_STRUCTURE_TYPE_CU_FUNCTION_CREATE_INFO_NVX                                  = 1000029001;
const VK_STRUCTURE_TYPE_CU_LAUNCH_INFO_NVX                                           = 1000029002;
const VK_STRUCTURE_TYPE_IMAGE_VIEW_HANDLE_INFO_NVX                                   = 1000030000;
const VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX                            = 1000030001;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR                           = 1000038000;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_SESSION_PARAMETERS_CREATE_INFO_KHR         = 1000038001;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_SESSION_PARAMETERS_ADD_INFO_KHR            = 1000038002;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_PICTURE_INFO_KHR                           = 1000038003;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_DPB_SLOT_INFO_KHR                          = 1000038004;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_NALU_SLICE_INFO_KHR                        = 1000038005;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_GOP_REMAINING_FRAME_INFO_KHR               = 1000038006;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_PROFILE_INFO_KHR                           = 1000038007;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_RATE_CONTROL_INFO_KHR                      = 1000038008;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_RATE_CONTROL_LAYER_INFO_KHR                = 1000038009;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_SESSION_CREATE_INFO_KHR                    = 1000038010;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUALITY_LEVEL_PROPERTIES_KHR               = 1000038011;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_SESSION_PARAMETERS_GET_INFO_KHR            = 1000038012;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_SESSION_PARAMETERS_FEEDBACK_INFO_KHR       = 1000038013;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR                           = 1000039000;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR         = 1000039001;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_PARAMETERS_ADD_INFO_KHR            = 1000039002;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_PICTURE_INFO_KHR                           = 1000039003;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_DPB_SLOT_INFO_KHR                          = 1000039004;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_INFO_KHR                = 1000039005;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_GOP_REMAINING_FRAME_INFO_KHR               = 1000039006;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_PROFILE_INFO_KHR                           = 1000039007;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_RATE_CONTROL_INFO_KHR                      = 1000039009;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_RATE_CONTROL_LAYER_INFO_KHR                = 1000039010;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_CREATE_INFO_KHR                    = 1000039011;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR               = 1000039012;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_PARAMETERS_GET_INFO_KHR            = 1000039013;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_PARAMETERS_FEEDBACK_INFO_KHR       = 1000039014;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_CAPABILITIES_KHR                           = 1000040000;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_PICTURE_INFO_KHR                           = 1000040001;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_PROFILE_INFO_KHR                           = 1000040003;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_SESSION_PARAMETERS_CREATE_INFO_KHR         = 1000040004;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_SESSION_PARAMETERS_ADD_INFO_KHR            = 1000040005;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_DPB_SLOT_INFO_KHR                          = 1000040006;
const VK_STRUCTURE_TYPE_TEXTURE_LOD_GATHER_FORMAT_PROPERTIES_AMD                     = 1000041000;
const VK_STRUCTURE_TYPE_RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR          = 1000044006;
const VK_STRUCTURE_TYPE_RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_INFO_EXT           = 1000044007;
const VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_AMD                             = 1000044008;
const VK_STRUCTURE_TYPE_MULTIVIEW_PER_VIEW_ATTRIBUTES_INFO_NVX                       = 1000044009;
const VK_STRUCTURE_TYPE_STREAM_DESCRIPTOR_SURFACE_CREATE_INFO_GGP                    = 1000049000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV             = 1000050000;
const VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV                         = 1000056000;
const VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_NV                               = 1000056001;
const VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_NV                           = 1000057000;
const VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_NV                           = 1000057001;
const VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_NV                    = 1000058000;
const VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT                                         = 1000061000;
const VK_STRUCTURE_TYPE_VI_SURFACE_CREATE_INFO_NN                                    = 1000062000;
const VK_STRUCTURE_TYPE_IMAGE_VIEW_ASTC_DECODE_MODE_EXT                              = 1000067000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT                     = 1000067001;
const VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO_EXT                          = 1000068000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT             = 1000068001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT           = 1000068002;
const VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_KHR                          = 1000073000;
const VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_KHR                          = 1000073001;
const VK_STRUCTURE_TYPE_MEMORY_WIN32_HANDLE_PROPERTIES_KHR                           = 1000073002;
const VK_STRUCTURE_TYPE_MEMORY_GET_WIN32_HANDLE_INFO_KHR                             = 1000073003;
const VK_STRUCTURE_TYPE_IMPORT_MEMORY_FD_INFO_KHR                                    = 1000074000;
const VK_STRUCTURE_TYPE_MEMORY_FD_PROPERTIES_KHR                                     = 1000074001;
const VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR                                       = 1000074002;
const VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR                   = 1000075000;
const VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR                       = 1000078000;
const VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR                       = 1000078001;
const VK_STRUCTURE_TYPE_D3D12_FENCE_SUBMIT_INFO_KHR                                  = 1000078002;
const VK_STRUCTURE_TYPE_SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR                          = 1000078003;
const VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_FD_INFO_KHR                                 = 1000079000;
const VK_STRUCTURE_TYPE_SEMAPHORE_GET_FD_INFO_KHR                                    = 1000079001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR               = 1000080000;
const VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_CONDITIONAL_RENDERING_INFO_EXT    = 1000081000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CONDITIONAL_RENDERING_FEATURES_EXT           = 1000081001;
const VK_STRUCTURE_TYPE_CONDITIONAL_RENDERING_BEGIN_INFO_EXT                         = 1000081002;
const VK_STRUCTURE_TYPE_PRESENT_REGIONS_KHR                                          = 1000084000;
const VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_W_SCALING_STATE_CREATE_INFO_NV             = 1000087000;
const VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_EXT                                   = 1000090000;
const VK_STRUCTURE_TYPE_DISPLAY_POWER_INFO_EXT                                       = 1000091000;
const VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT                                        = 1000091001;
const VK_STRUCTURE_TYPE_DISPLAY_EVENT_INFO_EXT                                       = 1000091002;
const VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT                            = 1000091003;
const VK_STRUCTURE_TYPE_PRESENT_TIMES_INFO_GOOGLE                                    = 1000092000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_ATTRIBUTES_PROPERTIES_NVX = 1000097000;
const VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SWIZZLE_STATE_CREATE_INFO_NV               = 1000098000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISCARD_RECTANGLE_PROPERTIES_EXT             = 1000099000;
const VK_STRUCTURE_TYPE_PIPELINE_DISCARD_RECTANGLE_STATE_CREATE_INFO_EXT             = 1000099001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CONSERVATIVE_RASTERIZATION_PROPERTIES_EXT    = 1000101000;
const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_CONSERVATIVE_STATE_CREATE_INFO_EXT    = 1000101001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT               = 1000102000;
const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT      = 1000102001;
const VK_STRUCTURE_TYPE_HDR_METADATA_EXT                                             = 1000105000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RELAXED_LINE_RASTERIZATION_FEATURES_IMG      = 1000110000;
const VK_STRUCTURE_TYPE_SHARED_PRESENT_SURFACE_CAPABILITIES_KHR                      = 1000111000;
const VK_STRUCTURE_TYPE_IMPORT_FENCE_WIN32_HANDLE_INFO_KHR                           = 1000114000;
const VK_STRUCTURE_TYPE_EXPORT_FENCE_WIN32_HANDLE_INFO_KHR                           = 1000114001;
const VK_STRUCTURE_TYPE_FENCE_GET_WIN32_HANDLE_INFO_KHR                              = 1000114002;
const VK_STRUCTURE_TYPE_IMPORT_FENCE_FD_INFO_KHR                                     = 1000115000;
const VK_STRUCTURE_TYPE_FENCE_GET_FD_INFO_KHR                                        = 1000115001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PERFORMANCE_QUERY_FEATURES_KHR               = 1000116000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PERFORMANCE_QUERY_PROPERTIES_KHR             = 1000116001;
const VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR                       = 1000116002;
const VK_STRUCTURE_TYPE_PERFORMANCE_QUERY_SUBMIT_INFO_KHR                            = 1000116003;
const VK_STRUCTURE_TYPE_ACQUIRE_PROFILING_LOCK_INFO_KHR                              = 1000116004;
const VK_STRUCTURE_TYPE_PERFORMANCE_COUNTER_KHR                                      = 1000116005;
const VK_STRUCTURE_TYPE_PERFORMANCE_COUNTER_DESCRIPTION_KHR                          = 1000116006;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR                           = 1000119000;
const VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR                                   = 1000119001;
const VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR                                         = 1000119002;
const VK_STRUCTURE_TYPE_DISPLAY_PROPERTIES_2_KHR                                     = 1000121000;
const VK_STRUCTURE_TYPE_DISPLAY_PLANE_PROPERTIES_2_KHR                               = 1000121001;
const VK_STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR                                = 1000121002;
const VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR                                     = 1000121003;
const VK_STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR                             = 1000121004;
const VK_STRUCTURE_TYPE_IOS_SURFACE_CREATE_INFO_MVK                                  = 1000122000;
const VK_STRUCTURE_TYPE_MACOS_SURFACE_CREATE_INFO_MVK                                = 1000123000;
const VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT                             = 1000128000;
const VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_TAG_INFO_EXT                              = 1000128001;
const VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT                                        = 1000128002;
const VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT                      = 1000128003;
const VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT                        = 1000128004;
const VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_USAGE_ANDROID                        = 1000129000;
const VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID                   = 1000129001;
const VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_ANDROID            = 1000129002;
const VK_STRUCTURE_TYPE_IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID                  = 1000129003;
const VK_STRUCTURE_TYPE_MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID              = 1000129004;
const VK_STRUCTURE_TYPE_EXTERNAL_FORMAT_ANDROID                                      = 1000129005;
const VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_2_ANDROID          = 1000129006;
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ENQUEUE_FEATURES_AMDX                 = 1000134000;
//#endif
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ENQUEUE_PROPERTIES_AMDX               = 1000134001;
//#endif
//#ifdef VK_ENABLE_BETA_EXTENSIONS

const VK_STRUCTURE_TYPE_EXECUTION_GRAPH_PIPELINE_SCRATCH_SIZE_AMDX                  = 1000134002;
//#endif
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_STRUCTURE_TYPE_EXECUTION_GRAPH_PIPELINE_CREATE_INFO_AMDX                   = 1000134003;
//#endif
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_NODE_CREATE_INFO_AMDX                 = 1000134004;
//#endif
const VK_STRUCTURE_TYPE_SAMPLE_LOCATIONS_INFO_EXT                                   = 1000143000;
const VK_STRUCTURE_TYPE_RENDER_PASS_SAMPLE_LOCATIONS_BEGIN_INFO_EXT                 = 1000143001;
const VK_STRUCTURE_TYPE_PIPELINE_SAMPLE_LOCATIONS_STATE_CREATE_INFO_EXT             = 1000143002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLE_LOCATIONS_PROPERTIES_EXT             = 1000143003;
const VK_STRUCTURE_TYPE_MULTISAMPLE_PROPERTIES_EXT                                  = 1000143004;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_FEATURES_EXT       = 1000148000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_PROPERTIES_EXT     = 1000148001;
const VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_ADVANCED_STATE_CREATE_INFO_EXT         = 1000148002;
const VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_TO_COLOR_STATE_CREATE_INFO_NV             = 1000149000;
const VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR             = 1000150007;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR              = 1000150000;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_DEVICE_ADDRESS_INFO_KHR              = 1000150002;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_AABBS_DATA_KHR              = 1000150003;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR          = 1000150004;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_TRIANGLES_DATA_KHR          = 1000150005;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_KHR                         = 1000150006;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR                     = 1000150009;
const VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_INFO_KHR                        = 1000150010;
const VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_TO_MEMORY_INFO_KHR              = 1000150011;
const VK_STRUCTURE_TYPE_COPY_MEMORY_TO_ACCELERATION_STRUCTURE_INFO_KHR              = 1000150012;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR         = 1000150013;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR       = 1000150014;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_KHR                      = 1000150017;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR                 = 1000150020;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR           = 1000347000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR         = 1000347001;
const VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_KHR                        = 1000150015;
const VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_KHR                    = 1000150016;
const VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR              = 1000150018;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR                      = 1000348013;
const VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV           = 1000152000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_FEATURES_NV              = 1000154000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV            = 1000154001;
const VK_STRUCTURE_TYPE_DRM_FORMAT_MODIFIER_PROPERTIES_LIST_EXT                     = 1000158000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_DRM_FORMAT_MODIFIER_INFO_EXT          = 1000158002;
const VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_LIST_CREATE_INFO_EXT              = 1000158003;
const VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_EXPLICIT_CREATE_INFO_EXT          = 1000158004;
const VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_PROPERTIES_EXT                    = 1000158005;
const VK_STRUCTURE_TYPE_DRM_FORMAT_MODIFIER_PROPERTIES_LIST_2_EXT                   = 1000158006;
const VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT                            = 1000160000;
const VK_STRUCTURE_TYPE_SHADER_MODULE_VALIDATION_CACHE_CREATE_INFO_EXT              = 1000160001;
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR             = 1000163000;
//#endif
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR           = 1000163001;
//#endif
const VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV   = 1000164000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV              = 1000164001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV            = 1000164002;
const VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_COARSE_SAMPLE_ORDER_STATE_CREATE_INFO_NV  = 1000164005;
const VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV                         = 1000165000;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_NV                       = 1000165001;
const VK_STRUCTURE_TYPE_GEOMETRY_NV                                                 = 1000165003;
const VK_STRUCTURE_TYPE_GEOMETRY_TRIANGLES_NV                                       = 1000165004;
const VK_STRUCTURE_TYPE_GEOMETRY_AABB_NV                                            = 1000165005;
const VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV                  = 1000165006;
const VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV              = 1000165007;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_INFO_NV          = 1000165008;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV                   = 1000165009;
const VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_NV                     = 1000165011;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_INFO_NV                              = 1000165012;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_REPRESENTATIVE_FRAGMENT_TEST_FEATURES_NV    = 1000166000;
const VK_STRUCTURE_TYPE_PIPELINE_REPRESENTATIVE_FRAGMENT_TEST_STATE_CREATE_INFO_NV  = 1000166001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_IMAGE_FORMAT_INFO_EXT            = 1000170000;
const VK_STRUCTURE_TYPE_FILTER_CUBIC_IMAGE_VIEW_IMAGE_FORMAT_PROPERTIES_EXT         = 1000170001;
const VK_STRUCTURE_TYPE_IMPORT_MEMORY_HOST_POINTER_INFO_EXT                         = 1000178000;
const VK_STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT                          = 1000178001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_HOST_PROPERTIES_EXT         = 1000178002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR                   = 1000181000;
const VK_STRUCTURE_TYPE_PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD                   = 1000183000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD                  = 1000185000;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_CAPABILITIES_KHR                          = 1000187000;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR        = 1000187001;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_SESSION_PARAMETERS_ADD_INFO_KHR           = 1000187002;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PROFILE_INFO_KHR                          = 1000187003;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PICTURE_INFO_KHR                          = 1000187004;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_DPB_SLOT_INFO_KHR                         = 1000187005;
const VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_KHR                = 1000174000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR          = 1000388000;
const VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR                 = 1000388001;
const VK_STRUCTURE_TYPE_DEVICE_MEMORY_OVERALLOCATION_CREATE_INFO_AMD                = 1000189000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT     = 1000190000;
const VK_STRUCTURE_TYPE_PRESENT_FRAME_TOKEN_GGP                                     = 1000191000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV      = 1000201000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV                     = 1000202000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV                   = 1000202001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_FOOTPRINT_FEATURES_NV          = 1000204000;
const VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV    = 1000205000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXCLUSIVE_SCISSOR_FEATURES_NV               = 1000205002;
const VK_STRUCTURE_TYPE_CHECKPOINT_DATA_NV                                          = 1000206000;
const VK_STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_NV                       = 1000206001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_FUNCTIONS_2_FEATURES_INTEL   = 1000209000;
const VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL              = 1000210000;
const VK_STRUCTURE_TYPE_INITIALIZE_PERFORMANCE_API_INFO_INTEL                       = 1000210001;
const VK_STRUCTURE_TYPE_PERFORMANCE_MARKER_INFO_INTEL                               = 1000210002;
const VK_STRUCTURE_TYPE_PERFORMANCE_STREAM_MARKER_INFO_INTEL                        = 1000210003;
const VK_STRUCTURE_TYPE_PERFORMANCE_OVERRIDE_INFO_INTEL                             = 1000210004;
const VK_STRUCTURE_TYPE_PERFORMANCE_CONFIGURATION_ACQUIRE_INFO_INTEL                = 1000210005;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT                 = 1000212000;
const VK_STRUCTURE_TYPE_DISPLAY_NATIVE_HDR_SURFACE_CAPABILITIES_AMD                 = 1000213000;
const VK_STRUCTURE_TYPE_SWAPCHAIN_DISPLAY_NATIVE_HDR_CREATE_INFO_AMD                = 1000213001;
const VK_STRUCTURE_TYPE_IMAGEPIPE_SURFACE_CREATE_INFO_FUCHSIA                       = 1000214000;
const VK_STRUCTURE_TYPE_METAL_SURFACE_CREATE_INFO_EXT                               = 1000217000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT           = 1000218000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT         = 1000218001;
const VK_STRUCTURE_TYPE_RENDER_PASS_FRAGMENT_DENSITY_MAP_CREATE_INFO_EXT            = 1000218002;
const VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR                   = 1000226000;
const VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR        = 1000226001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR        = 1000226002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR          = 1000226003;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR                   = 1000226004;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_2_AMD                = 1000227000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COHERENT_MEMORY_FEATURES_AMD                = 1000229000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR   = 1000232000;
const VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO_KHR                      = 1000232001;
const VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO_KHR                   = 1000232002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT      = 1000234000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR            = 1000235000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT                = 1000237000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT                = 1000238000;
const VK_STRUCTURE_TYPE_MEMORY_PRIORITY_ALLOCATE_INFO_EXT                           = 1000238001;
const VK_STRUCTURE_TYPE_SURFACE_PROTECTED_CAPABILITIES_KHR                          = 1000239000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEDICATED_ALLOCATION_IMAGE_ALIASING_FEATURES_NV = 1000240000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT          = 1000244000;
const VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_CREATE_INFO_EXT                       = 1000244002;
const VK_STRUCTURE_TYPE_VALIDATION_FEATURES_EXT                                     = 1000247000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR                   = 1000248000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV              = 1000249000;
const VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV                            = 1000249001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV            = 1000249002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COVERAGE_REDUCTION_MODE_FEATURES_NV         = 1000250000;
const VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_REDUCTION_STATE_CREATE_INFO_NV            = 1000250001;
const VK_STRUCTURE_TYPE_FRAMEBUFFER_MIXED_SAMPLES_COMBINATION_NV                    = 1000250002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT      = 1000251000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT             = 1000252000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT               = 1000254000;
const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_PROVOKING_VERTEX_STATE_CREATE_INFO_EXT = 1000254001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_PROPERTIES_EXT             = 1000254002;
const VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_INFO_EXT                      = 1000255000;
const VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_FULL_SCREEN_EXCLUSIVE_EXT              = 1000255002;
const VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_WIN32_INFO_EXT                = 1000255001;
const VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT                            = 1000256000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT            = 1000260000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT         = 1000267000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_EXECUTABLE_PROPERTIES_FEATURES_KHR = 1000269000;
const VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR                                           = 1000269001;
const VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_PROPERTIES_KHR                          = 1000269002;
const VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INFO_KHR                                = 1000269003;
const VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_STATISTIC_KHR                           = 1000269004;
const VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INTERNAL_REPRESENTATION_KHR             = 1000269005;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT                = 1000270000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT              = 1000270001;
const VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY_EXT                                    = 1000270002;
const VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY_EXT                                    = 1000270003;
const VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO_EXT                               = 1000270004;
const VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO_EXT                               = 1000270005;
const VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO_EXT                       = 1000270006;
const VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO_EXT                                = 1000270007;
const VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE_EXT                            = 1000270008;
const VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY_EXT                = 1000270009;
const VK_STRUCTURE_TYPE_MEMORY_MAP_INFO_KHR                                         = 1000271000;
const VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO_KHR                                       = 1000271001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT              = 1000272000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT            = 1000272001;
const VK_STRUCTURE_TYPE_MEMORY_MAP_PLACED_INFO_EXT                                  = 1000272002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_2_FEATURES_EXT          = 1000273000;
const VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_EXT                                    = 1000274000;
const VK_STRUCTURE_TYPE_SURFACE_PRESENT_SCALING_CAPABILITIES_EXT                    = 1000274001;
const VK_STRUCTURE_TYPE_SURFACE_PRESENT_MODE_COMPATIBILITY_EXT                      = 1000274002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_EXT        = 1000275000;
const VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_FENCE_INFO_EXT                            = 1000275001;
const VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODES_CREATE_INFO_EXT                     = 1000275002;
const VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODE_INFO_EXT                             = 1000275003;
const VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_SCALING_CREATE_INFO_EXT                   = 1000275004;
const VK_STRUCTURE_TYPE_RELEASE_SWAPCHAIN_IMAGES_INFO_EXT                           = 1000275005;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV     = 1000277000;
const VK_STRUCTURE_TYPE_GRAPHICS_SHADER_GROUP_CREATE_INFO_NV                        = 1000277001;
const VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_SHADER_GROUPS_CREATE_INFO_NV              = 1000277002;
const VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_NV                           = 1000277003;
const VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NV                     = 1000277004;
const VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV                                  = 1000277005;
const VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_NV              = 1000277006;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV       = 1000277007;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INHERITED_VIEWPORT_SCISSOR_FEATURES_NV      = 1000278000;
const VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_VIEWPORT_SCISSOR_INFO_NV         = 1000278001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_FEATURES_EXT         = 1000281000;
const VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDER_PASS_TRANSFORM_INFO_QCOM  = 1000282000;
const VK_STRUCTURE_TYPE_RENDER_PASS_TRANSFORM_BEGIN_INFO_QCOM                       = 1000282001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT             = 1000283000;
const VK_STRUCTURE_TYPE_DEPTH_BIAS_INFO_EXT                                         = 1000283001;
const VK_STRUCTURE_TYPE_DEPTH_BIAS_REPRESENTATION_INFO_EXT                          = 1000283002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT           = 1000284000;
const VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT                 = 1000284001;
const VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT                      = 1000284002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT                   = 1000286000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT                 = 1000286001;
const VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT                 = 1000287000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT          = 1000287001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT            = 1000287002;
const VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR                            = 1000290000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_BARRIER_FEATURES_NV                 = 1000292000;
const VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV                     = 1000292001;
const VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_BARRIER_CREATE_INFO_NV                    = 1000292002;
const VK_STRUCTURE_TYPE_PRESENT_ID_KHR                                              = 1000294000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR                     = 1000294001;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_INFO_KHR                                       = 1000299000;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_RATE_CONTROL_INFO_KHR                          = 1000299001;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_RATE_CONTROL_LAYER_INFO_KHR                    = 1000299002;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_CAPABILITIES_KHR                               = 1000299003;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_USAGE_INFO_KHR                                 = 1000299004;
const VK_STRUCTURE_TYPE_QUERY_POOL_VIDEO_ENCODE_FEEDBACK_CREATE_INFO_KHR            = 1000299005;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR         = 1000299006;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR                   = 1000299007;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR                         = 1000299008;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_SESSION_PARAMETERS_GET_INFO_KHR                = 1000299009;
const VK_STRUCTURE_TYPE_VIDEO_ENCODE_SESSION_PARAMETERS_FEEDBACK_INFO_KHR           = 1000299010;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DIAGNOSTICS_CONFIG_FEATURES_NV              = 1000300000;
const VK_STRUCTURE_TYPE_DEVICE_DIAGNOSTICS_CONFIG_CREATE_INFO_NV                    = 1000300001;
const VK_STRUCTURE_TYPE_CUDA_MODULE_CREATE_INFO_NV                                  = 1000307000;
const VK_STRUCTURE_TYPE_CUDA_FUNCTION_CREATE_INFO_NV                                = 1000307001;
const VK_STRUCTURE_TYPE_CUDA_LAUNCH_INFO_NV                                         = 1000307002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUDA_KERNEL_LAUNCH_FEATURES_NV              = 1000307003;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUDA_KERNEL_LAUNCH_PROPERTIES_NV            = 1000307004;
const VK_STRUCTURE_TYPE_QUERY_LOW_LATENCY_SUPPORT_NV                                = 1000310000;
const VK_STRUCTURE_TYPE_EXPORT_METAL_OBJECT_CREATE_INFO_EXT                         = 1000311000;
const VK_STRUCTURE_TYPE_EXPORT_METAL_OBJECTS_INFO_EXT                               = 1000311001;
const VK_STRUCTURE_TYPE_EXPORT_METAL_DEVICE_INFO_EXT                                = 1000311002;
const VK_STRUCTURE_TYPE_EXPORT_METAL_COMMAND_QUEUE_INFO_EXT                         = 1000311003;
const VK_STRUCTURE_TYPE_EXPORT_METAL_BUFFER_INFO_EXT                                = 1000311004;
const VK_STRUCTURE_TYPE_IMPORT_METAL_BUFFER_INFO_EXT                                = 1000311005;
const VK_STRUCTURE_TYPE_EXPORT_METAL_TEXTURE_INFO_EXT                               = 1000311006;
const VK_STRUCTURE_TYPE_IMPORT_METAL_TEXTURE_INFO_EXT                               = 1000311007;
const VK_STRUCTURE_TYPE_EXPORT_METAL_IO_SURFACE_INFO_EXT                            = 1000311008;
const VK_STRUCTURE_TYPE_IMPORT_METAL_IO_SURFACE_INFO_EXT                            = 1000311009;
const VK_STRUCTURE_TYPE_EXPORT_METAL_SHARED_EVENT_INFO_EXT                          = 1000311010;
const VK_STRUCTURE_TYPE_IMPORT_METAL_SHARED_EVENT_INFO_EXT                          = 1000311011;
const VK_STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_2_NV                     = 1000314008;
const VK_STRUCTURE_TYPE_CHECKPOINT_DATA_2_NV                                        = 1000314009;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT            = 1000316000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_DENSITY_MAP_PROPERTIES_EXT = 1000316001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT              = 1000316002;
const VK_STRUCTURE_TYPE_DESCRIPTOR_ADDRESS_INFO_EXT                                 = 1000316003;
const VK_STRUCTURE_TYPE_DESCRIPTOR_GET_INFO_EXT                                     = 1000316004;
const VK_STRUCTURE_TYPE_BUFFER_CAPTURE_DESCRIPTOR_DATA_INFO_EXT                     = 1000316005;
const VK_STRUCTURE_TYPE_IMAGE_CAPTURE_DESCRIPTOR_DATA_INFO_EXT                      = 1000316006;
const VK_STRUCTURE_TYPE_IMAGE_VIEW_CAPTURE_DESCRIPTOR_DATA_INFO_EXT                 = 1000316007;
const VK_STRUCTURE_TYPE_SAMPLER_CAPTURE_DESCRIPTOR_DATA_INFO_EXT                    = 1000316008;
const VK_STRUCTURE_TYPE_OPAQUE_CAPTURE_DESCRIPTOR_DATA_CREATE_INFO_EXT              = 1000316010;
const VK_STRUCTURE_TYPE_DESCRIPTOR_BUFFER_BINDING_INFO_EXT                          = 1000316011;
const VK_STRUCTURE_TYPE_DESCRIPTOR_BUFFER_BINDING_PUSH_DESCRIPTOR_BUFFER_HANDLE_EXT = 1000316012;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CAPTURE_DESCRIPTOR_DATA_INFO_EXT     = 1000316009;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT      = 1000320000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT    = 1000320001;
const VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_LIBRARY_CREATE_INFO_EXT                   = 1000320002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EARLY_AND_LATE_FRAGMENT_TESTS_FEATURES_AMD = 1000321000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR    = 1000203000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR  = 1000322000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_UNIFORM_CONTROL_FLOW_FEATURES_KHR = 1000323000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV   = 1000326000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV     = 1000326001;
const VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV    = 1000326002;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_MOTION_TRIANGLES_DATA_NV    = 1000327000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MOTION_BLUR_FEATURES_NV         = 1000327001;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MOTION_INFO_NV                       = 1000327002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT                    = 1000328000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT                  = 1000328001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_2_PLANE_444_FORMATS_FEATURES_EXT      = 1000330000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT         = 1000332000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT       = 1000332001;
const VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM                            = 1000333000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_WORKGROUP_MEMORY_EXPLICIT_LAYOUT_FEATURES_KHR = 1000336000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT      = 1000338000;
const VK_STRUCTURE_TYPE_IMAGE_COMPRESSION_CONTROL_EXT                               = 1000338001;
const VK_STRUCTURE_TYPE_IMAGE_COMPRESSION_PROPERTIES_EXT                            = 1000338004;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT = 1000339000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT                   = 1000340000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT                          = 1000341000;
const VK_STRUCTURE_TYPE_DEVICE_FAULT_COUNTS_EXT                                     = 1000341001;
const VK_STRUCTURE_TYPE_DEVICE_FAULT_INFO_EXT                                       = 1000341002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RGBA10X6_FORMATS_FEATURES_EXT               = 1000344000;
const VK_STRUCTURE_TYPE_DIRECTFB_SURFACE_CREATE_INFO_EXT                            = 1000346000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_INPUT_DYNAMIC_STATE_FEATURES_EXT     = 1000352000;
const VK_STRUCTURE_TYPE_VERTEX_INPUT_BINDING_DESCRIPTION_2_EXT                      = 1000352001;
const VK_STRUCTURE_TYPE_VERTEX_INPUT_ATTRIBUTE_DESCRIPTION_2_EXT                    = 1000352002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRM_PROPERTIES_EXT                          = 1000353000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT         = 1000354000;
const VK_STRUCTURE_TYPE_DEVICE_ADDRESS_BINDING_CALLBACK_DATA_EXT                    = 1000354001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT             = 1000355000;
const VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLIP_CONTROL_CREATE_INFO_EXT        = 1000355001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVE_TOPOLOGY_LIST_RESTART_FEATURES_EXT = 1000356000;
const VK_STRUCTURE_TYPE_IMPORT_MEMORY_ZIRCON_HANDLE_INFO_FUCHSIA                    = 1000364000;
const VK_STRUCTURE_TYPE_MEMORY_ZIRCON_HANDLE_PROPERTIES_FUCHSIA                     = 1000364001;
const VK_STRUCTURE_TYPE_MEMORY_GET_ZIRCON_HANDLE_INFO_FUCHSIA                       = 1000364002;
const VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_ZIRCON_HANDLE_INFO_FUCHSIA                 = 1000365000;
const VK_STRUCTURE_TYPE_SEMAPHORE_GET_ZIRCON_HANDLE_INFO_FUCHSIA                    = 1000365001;
const VK_STRUCTURE_TYPE_BUFFER_COLLECTION_CREATE_INFO_FUCHSIA                       = 1000366000;
const VK_STRUCTURE_TYPE_IMPORT_MEMORY_BUFFER_COLLECTION_FUCHSIA                     = 1000366001;
const VK_STRUCTURE_TYPE_BUFFER_COLLECTION_IMAGE_CREATE_INFO_FUCHSIA                 = 1000366002;
const VK_STRUCTURE_TYPE_BUFFER_COLLECTION_PROPERTIES_FUCHSIA                        = 1000366003;
const VK_STRUCTURE_TYPE_BUFFER_CONSTRAINTS_INFO_FUCHSIA                             = 1000366004;
const VK_STRUCTURE_TYPE_BUFFER_COLLECTION_BUFFER_CREATE_INFO_FUCHSIA                = 1000366005;
const VK_STRUCTURE_TYPE_IMAGE_CONSTRAINTS_INFO_FUCHSIA                              = 1000366006;
const VK_STRUCTURE_TYPE_IMAGE_FORMAT_CONSTRAINTS_INFO_FUCHSIA                       = 1000366007;
const VK_STRUCTURE_TYPE_SYSMEM_COLOR_SPACE_FUCHSIA                                  = 1000366008;
const VK_STRUCTURE_TYPE_BUFFER_COLLECTION_CONSTRAINTS_INFO_FUCHSIA                  = 1000366009;
const VK_STRUCTURE_TYPE_SUBPASS_SHADING_PIPELINE_CREATE_INFO_HUAWEI                 = 1000369000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_FEATURES_HUAWEI             = 1000369001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_PROPERTIES_HUAWEI           = 1000369002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INVOCATION_MASK_FEATURES_HUAWEI             = 1000370000;
const VK_STRUCTURE_TYPE_MEMORY_GET_REMOTE_ADDRESS_INFO_NV                           = 1000371000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_RDMA_FEATURES_NV            = 1000371001;
const VK_STRUCTURE_TYPE_PIPELINE_PROPERTIES_IDENTIFIER_EXT                          = 1000372000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT            = 1000372001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT                 = 1000375000;
const VK_STRUCTURE_TYPE_FRAME_BOUNDARY_EXT                                          = 1000375001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT = 1000376000;
const VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT                       = 1000376001;
const VK_STRUCTURE_TYPE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_INFO_EXT              = 1000376002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT       = 1000377000;
const VK_STRUCTURE_TYPE_SCREEN_SURFACE_CREATE_INFO_QNX                              = 1000378000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COLOR_WRITE_ENABLE_FEATURES_EXT             = 1000381000;
const VK_STRUCTURE_TYPE_PIPELINE_COLOR_WRITE_CREATE_INFO_EXT                        = 1000381001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT     = 1000382000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR      = 1000386000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT             = 1000391000;
const VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT                          = 1000391001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT                     = 1000392000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_PROPERTIES_EXT                   = 1000392001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT            = 1000393000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT              = 1000395000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT            = 1000395001;
const VK_STRUCTURE_TYPE_MICROMAP_BUILD_INFO_EXT                                     = 1000396000;
const VK_STRUCTURE_TYPE_MICROMAP_VERSION_INFO_EXT                                   = 1000396001;
const VK_STRUCTURE_TYPE_COPY_MICROMAP_INFO_EXT                                      = 1000396002;
const VK_STRUCTURE_TYPE_COPY_MICROMAP_TO_MEMORY_INFO_EXT                            = 1000396003;
const VK_STRUCTURE_TYPE_COPY_MEMORY_TO_MICROMAP_INFO_EXT                            = 1000396004;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT               = 1000396005;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT             = 1000396006;
const VK_STRUCTURE_TYPE_MICROMAP_CREATE_INFO_EXT                                    = 1000396007;
const VK_STRUCTURE_TYPE_MICROMAP_BUILD_SIZES_INFO_EXT                               = 1000396008;
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_OPACITY_MICROMAP_EXT       = 1000396009;
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_FEATURES_NV           = 1000397000;
//#endif
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_PROPERTIES_NV         = 1000397001;
//#endif
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_DISPLACEMENT_MICROMAP_NV   = 1000397002;
//#endif
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CLUSTER_CULLING_SHADER_FEATURES_HUAWEI      = 1000404000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CLUSTER_CULLING_SHADER_PROPERTIES_HUAWEI    = 1000404001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CLUSTER_CULLING_SHADER_VRS_FEATURES_HUAWEI  = 1000404002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BORDER_COLOR_SWIZZLE_FEATURES_EXT           = 1000411000;
const VK_STRUCTURE_TYPE_SAMPLER_BORDER_COLOR_COMPONENT_MAPPING_CREATE_INFO_EXT      = 1000411001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PAGEABLE_DEVICE_LOCAL_MEMORY_FEATURES_EXT   = 1000412000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM                  = 1000415000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR         = 1000416000;
const VK_STRUCTURE_TYPE_DEVICE_QUEUE_SHADER_CORE_CONTROL_CREATE_INFO_ARM            = 1000417000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCHEDULING_CONTROLS_FEATURES_ARM            = 1000417001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCHEDULING_CONTROLS_PROPERTIES_ARM          = 1000417002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT        = 1000418000;
const VK_STRUCTURE_TYPE_IMAGE_VIEW_SLICED_CREATE_INFO_EXT                           = 1000418001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_SET_HOST_MAPPING_FEATURES_VALVE  = 1000420000;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_BINDING_REFERENCE_VALVE                      = 1000420001;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE               = 1000420002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT           = 1000421000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT          = 1000422000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RENDER_PASS_STRIPED_FEATURES_ARM            = 1000424000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RENDER_PASS_STRIPED_PROPERTIES_ARM          = 1000424001;
const VK_STRUCTURE_TYPE_RENDER_PASS_STRIPE_BEGIN_INFO_ARM                           = 1000424002;
const VK_STRUCTURE_TYPE_RENDER_PASS_STRIPE_INFO_ARM                                 = 1000424003;
const VK_STRUCTURE_TYPE_RENDER_PASS_STRIPE_SUBMIT_INFO_ARM                          = 1000424004;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_FEATURES_QCOM   = 1000425000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_PROPERTIES_QCOM = 1000425001;
const VK_STRUCTURE_TYPE_SUBPASS_FRAGMENT_DENSITY_MAP_OFFSET_END_INFO_QCOM           = 1000425002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COPY_MEMORY_INDIRECT_FEATURES_NV            = 1000426000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COPY_MEMORY_INDIRECT_PROPERTIES_NV          = 1000426001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_DECOMPRESSION_FEATURES_NV            = 1000427000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_DECOMPRESSION_PROPERTIES_NV          = 1000427001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_COMPUTE_FEATURES_NV = 1000428000;
const VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_INDIRECT_BUFFER_INFO_NV                    = 1000428001;
const VK_STRUCTURE_TYPE_PIPELINE_INDIRECT_DEVICE_ADDRESS_INFO_NV                    = 1000428002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINEAR_COLOR_ATTACHMENT_FEATURES_NV         = 1000430000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR   = 1000434000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT = 1000437000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_FEATURES_QCOM              = 1000440000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_PROPERTIES_QCOM            = 1000440001;
const VK_STRUCTURE_TYPE_IMAGE_VIEW_SAMPLE_WEIGHT_CREATE_INFO_QCOM                   = 1000440002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT          = 1000451000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT        = 1000451001;

const VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_ACQUIRE_UNMODIFIED_EXT                      = 1000453000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT       = 1000455000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT     = 1000455001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT         = 1000458000;
const VK_STRUCTURE_TYPE_RENDER_PASS_CREATION_CONTROL_EXT                            = 1000458001;
const VK_STRUCTURE_TYPE_RENDER_PASS_CREATION_FEEDBACK_CREATE_INFO_EXT               = 1000458002;
const VK_STRUCTURE_TYPE_RENDER_PASS_SUBPASS_FEEDBACK_CREATE_INFO_EXT                = 1000458003;
const VK_STRUCTURE_TYPE_DIRECT_DRIVER_LOADING_INFO_LUNARG                           = 1000459000;
const VK_STRUCTURE_TYPE_DIRECT_DRIVER_LOADING_LIST_LUNARG                           = 1000459001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT       = 1000462000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT     = 1000462001;
const VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_MODULE_IDENTIFIER_CREATE_INFO_EXT     = 1000462002;
const VK_STRUCTURE_TYPE_SHADER_MODULE_IDENTIFIER_EXT                                = 1000462003;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT = 1000342000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPTICAL_FLOW_FEATURES_NV                    = 1000464000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPTICAL_FLOW_PROPERTIES_NV                  = 1000464001;
const VK_STRUCTURE_TYPE_OPTICAL_FLOW_IMAGE_FORMAT_INFO_NV                           = 1000464002;
const VK_STRUCTURE_TYPE_OPTICAL_FLOW_IMAGE_FORMAT_PROPERTIES_NV                     = 1000464003;
const VK_STRUCTURE_TYPE_OPTICAL_FLOW_SESSION_CREATE_INFO_NV                         = 1000464004;
const VK_STRUCTURE_TYPE_OPTICAL_FLOW_EXECUTE_INFO_NV                                = 1000464005;
const VK_STRUCTURE_TYPE_OPTICAL_FLOW_SESSION_CREATE_PRIVATE_DATA_INFO_NV            = 1000464010;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT               = 1000465000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT      = 1000466000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FORMAT_RESOLVE_FEATURES_ANDROID    = 1000468000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FORMAT_RESOLVE_PROPERTIES_ANDROID  = 1000468001;
const VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_RESOLVE_PROPERTIES_ANDROID   = 1000468002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR                  = 1000470000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES_KHR                = 1000470001;
const VK_STRUCTURE_TYPE_RENDERING_AREA_INFO_KHR                                     = 1000470003;
const VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO_KHR                           = 1000470004;
const VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_KHR                                    = 1000338002;
const VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_KHR                                     = 1000338003;
const VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO_KHR                     = 1000470005;
const VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO_KHR                        = 1000470006;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_POSITION_FETCH_FEATURES_KHR     = 1000481000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT                  = 1000482000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT                = 1000482001;
const VK_STRUCTURE_TYPE_SHADER_CREATE_INFO_EXT                                      = 1000482002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TILE_PROPERTIES_FEATURES_QCOM               = 1000484000;
const VK_STRUCTURE_TYPE_TILE_PROPERTIES_QCOM                                        = 1000484001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_AMIGO_PROFILING_FEATURES_SEC                = 1000485000;
const VK_STRUCTURE_TYPE_AMIGO_PROFILING_SUBMIT_INFO_SEC                             = 1000485001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_VIEWPORTS_FEATURES_QCOM  = 1000488000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_INVOCATION_REORDER_FEATURES_NV  = 1000490000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_INVOCATION_REORDER_PROPERTIES_NV = 1000490001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_FEATURES_NV   = 1000492000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_PROPERTIES_NV = 1000492001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT        = 1000351000;
const VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_EXT                     = 1000351002;
const VK_STRUCTURE_TYPE_LAYER_SETTINGS_CREATE_INFO_EXT                              = 1000496000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_FEATURES_ARM           = 1000497000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_PROPERTIES_ARM         = 1000497001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT = 1000498000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT = 1000499000;
const VK_STRUCTURE_TYPE_LATENCY_SLEEP_MODE_INFO_NV                                  = 1000505000;
const VK_STRUCTURE_TYPE_LATENCY_SLEEP_INFO_NV                                       = 1000505001;
const VK_STRUCTURE_TYPE_SET_LATENCY_MARKER_INFO_NV                                  = 1000505002;
const VK_STRUCTURE_TYPE_GET_LATENCY_MARKER_INFO_NV                                  = 1000505003;
const VK_STRUCTURE_TYPE_LATENCY_TIMINGS_FRAME_REPORT_NV                             = 1000505004;
const VK_STRUCTURE_TYPE_LATENCY_SUBMISSION_PRESENT_ID_NV                            = 1000505005;
const VK_STRUCTURE_TYPE_OUT_OF_BAND_QUEUE_TYPE_INFO_NV                              = 1000505006;
const VK_STRUCTURE_TYPE_SWAPCHAIN_LATENCY_CREATE_INFO_NV                            = 1000505007;
const VK_STRUCTURE_TYPE_LATENCY_SURFACE_CAPABILITIES_NV                             = 1000505008;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR             = 1000506000;
const VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_KHR                           = 1000506001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR           = 1000506002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_RENDER_AREAS_FEATURES_QCOM = 1000510000;
const VK_STRUCTURE_TYPE_MULTIVIEW_PER_VIEW_RENDER_AREAS_RENDER_PASS_BEGIN_INFO_QCOM = 1000510001;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR                           = 1000512000;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PICTURE_INFO_KHR                           = 1000512001;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR                           = 1000512003;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR         = 1000512004;
const VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_DPB_SLOT_INFO_KHR                          = 1000512005;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR            = 1000515000;
const VK_STRUCTURE_TYPE_VIDEO_INLINE_QUERY_INFO_KHR                                 = 1000515001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PER_STAGE_DESCRIPTOR_SET_FEATURES_NV        = 1000516000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_2_FEATURES_QCOM            = 1000518000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_2_PROPERTIES_QCOM          = 1000518001;
const VK_STRUCTURE_TYPE_SAMPLER_BLOCK_MATCH_WINDOW_CREATE_INFO_QCOM                 = 1000518002;
const VK_STRUCTURE_TYPE_SAMPLER_CUBIC_WEIGHTS_CREATE_INFO_QCOM                      = 1000519000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUBIC_WEIGHTS_FEATURES_QCOM                 = 1000519001;
const VK_STRUCTURE_TYPE_BLIT_IMAGE_CUBIC_WEIGHTS_INFO_QCOM                          = 1000519002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_DEGAMMA_FEATURES_QCOM                 = 1000520000;
const VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_YCBCR_DEGAMMA_CREATE_INFO_QCOM     = 1000520001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUBIC_CLAMP_FEATURES_QCOM                   = 1000521000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_DYNAMIC_STATE_FEATURES_EXT = 1000524000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR     = 1000525000;
const VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_KHR         = 1000190001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR       = 1000190002;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR        = 1000528000;
const VK_STRUCTURE_TYPE_SCREEN_BUFFER_PROPERTIES_QNX                                = 1000529000;
const VK_STRUCTURE_TYPE_SCREEN_BUFFER_FORMAT_PROPERTIES_QNX                         = 1000529001;
const VK_STRUCTURE_TYPE_IMPORT_SCREEN_BUFFER_INFO_QNX                               = 1000529002;
const VK_STRUCTURE_TYPE_EXTERNAL_FORMAT_QNX                                         = 1000529003;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_SCREEN_BUFFER_FEATURES_QNX  = 1000529004;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT              = 1000530000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR               = 1000265000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR             = 1000259000;
const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_KHR           = 1000259001;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR           = 1000259002;
const VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_KHR                               = 1000184000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR           = 1000544000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR                  = 1000545000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR                = 1000545001;
const VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS_KHR                                      = 1000545002;
const VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO_KHR                               = 1000545003;
const VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO_KHR                                     = 1000545004;
const VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO_KHR                                = 1000545005;
const VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO_KHR                  = 1000545006;
const VK_STRUCTURE_TYPE_SET_DESCRIPTOR_BUFFER_OFFSETS_INFO_EXT                      = 1000545007;
const VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_BUFFER_EMBEDDED_SAMPLERS_INFO_EXT           = 1000545008;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_POOL_OVERALLOCATION_FEATURES_NV  = 1000546000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT16_VECTOR_FEATURES_NV    = 1000563000;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES                   = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETER_FEATURES              = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES;
const VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT                                = VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT;
const VK_STRUCTURE_TYPE_RENDERING_INFO_KHR                                          = VK_STRUCTURE_TYPE_RENDERING_INFO;
const VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO_KHR                               = VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO;
const VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO_KHR                          = VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR              = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES;
const VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDERING_INFO_KHR               = VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDERING_INFO;
const VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_NV                             = VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_AMD;
const VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO_KHR                       = VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES_KHR                      = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES_KHR                    = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2_KHR                              = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2_KHR                            = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2;
const VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2_KHR                                     = VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2;
const VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2_KHR                               = VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2_KHR                     = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2;
const VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR                               = VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2_KHR                     = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2;
const VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2_KHR                        = VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2_KHR              = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2;
const VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO_KHR                              = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO_KHR                     = VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO_KHR                  = VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO_KHR                                = VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO_KHR                           = VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO;
const VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO_KHR                    = VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO;
const VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO_KHR                     = VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT   = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES_KHR                        = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES;
const VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO_KHR                         = VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO_KHR              = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO;
const VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES_KHR                        = VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO_KHR                    = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO;
const VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES_KHR                              = VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES_KHR                           = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES;
const VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO_KHR                      = VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO;
const VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_KHR                       = VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO;
const VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_KHR                             = VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO_KHR                 = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO;
const VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES_KHR                           = VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES;
const VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO_KHR                            = VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR            = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT16_INT8_FEATURES_KHR                   = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES_KHR                  = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES;
const VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO_KHR                  = VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO;
const VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES2_EXT                                   = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_EXT;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES_KHR          = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES;
const VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO_KHR                     = VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO;
const VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO_KHR                       = VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO;
const VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO_KHR                       = VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO;
const VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2_KHR                                = VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2;
const VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2_KHR                                  = VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2;
const VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2_KHR                                   = VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2;
const VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2_KHR                                    = VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2;
const VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2_KHR                               = VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2;
const VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO_KHR                                      = VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO;
const VK_STRUCTURE_TYPE_SUBPASS_END_INFO_KHR                                        = VK_STRUCTURE_TYPE_SUBPASS_END_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO_KHR                     = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO;
const VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES_KHR                               = VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES;
const VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO_KHR                                = VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR               = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES;
const VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO_KHR         = VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO;
const VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO_KHR                            = VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO;
const VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO_KHR   = VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES_KHR              = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR               = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES_KHR;
const VK_STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS_KHR                           = VK_STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS;
const VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO_KHR                          = VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES_EXT        = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES;
const VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT                      = VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES_EXT           = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES_EXT         = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES;
const VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK_EXT               = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK;
const VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO_EXT        = VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO;
const VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR                       = VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2;
const VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR                        = VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2;
const VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR                 = VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2;
const VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR                                   = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2;
const VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR                      = VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2;
const VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO_KHR                           = VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO;
const VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR                    = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO;
const VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO_KHR                           = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO;
const VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO_KHR                            = VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO;
const VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO_KHR                    = VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES_KHR       = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES;
const VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES_KHR        = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES;
const VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR                                 = VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO;
const VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHR                                  = VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO_EXT         = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES_EXT            = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES_EXT          = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO_EXT  = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT_EXT = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES_KHR                = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES;
const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT_KHR                           = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT;
const VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT                = VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_KHR;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES_KHR                   = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR            = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES;
const VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT                               = VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_KHR;
const VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_EXT         = VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_KHR;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT       = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR;
const VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO_EXT                  = VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES_KHR                       = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES_KHR               = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES_KHR        = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES;
const VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE_KHR               = VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV     = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR             = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR           = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES;
const VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO_KHR                              = VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO;
const VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO_KHR                          = VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO;
const VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO_KHR                                     = VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO;
const VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO_KHR                                   = VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO;
const VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO_INTEL                                = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES_KHR            = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR    = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT            = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT        = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES;
const VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT          = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES;
const VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT_KHR                     = VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT;
const VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT_KHR                   = VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT                 = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT;
const VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO_EXT                              = VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT                         = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES;
const VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO_EXT                         = VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_KHR          = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES;
const VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO_KHR                              = VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO;
const VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO_KHR               = VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO;
const VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO_KHR             = VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO;
const VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO_KHR               = VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT             = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR;
const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_EXT           = VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_KHR;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT           = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES_EXT               = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT               = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES_KHR     = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES_KHR   = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES_EXT       = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT                   = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES;
const VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT                         = VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO;
const VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT                           = VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES;
const VK_STRUCTURE_TYPE_MEMORY_BARRIER_2_KHR                                        = VK_STRUCTURE_TYPE_MEMORY_BARRIER_2;
const VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2_KHR                                 = VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2;
const VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2_KHR                                  = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2;
const VK_STRUCTURE_TYPE_DEPENDENCY_INFO_KHR                                         = VK_STRUCTURE_TYPE_DEPENDENCY_INFO;
const VK_STRUCTURE_TYPE_SUBMIT_INFO_2_KHR                                           = VK_STRUCTURE_TYPE_SUBMIT_INFO_2;
const VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO_KHR                                   = VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO;
const VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO_KHR                              = VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES_KHR              = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT               = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES;
const VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR                                      = VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2;
const VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR                                       = VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2;
const VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR                             = VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2;
const VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR                             = VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2;
const VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR                                       = VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2;
const VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR                                    = VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2;
const VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR                                           = VK_STRUCTURE_TYPE_BUFFER_COPY_2;
const VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR                                            = VK_STRUCTURE_TYPE_IMAGE_COPY_2;
const VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR                                            = VK_STRUCTURE_TYPE_IMAGE_BLIT_2;
const VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR                                     = VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2;
const VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR                                         = VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2;
const VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_EXT                                    = VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_KHR;
const VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_EXT                                     = VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_KHR;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_ARM = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_VALVE      = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT;
const VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_VALVE                   = VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_EXT;
const VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3_KHR                                     = VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3;
const VK_STRUCTURE_TYPE_PIPELINE_INFO_EXT                                           = VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_EXT          = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR;
const VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_EXT                 = VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR                  = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES;
const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES_KHR                = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES;
const VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS_KHR                       = VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS;
const VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS_KHR                        = VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS;
const VK_STRUCTURE_TYPE_SHADER_REQUIRED_SUBGROUP_SIZE_CREATE_INFO_EXT               = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO;
const VK_STRUCTURE_TYPE_MAX_ENUM                                                    = $7FFFFFFF;
//} VkStructureType;

//typedef enum VkPipelineCacheHeaderVersion {
type T_VkPipelineCacheHeaderVersion = T_int32_t;  P_VkPipelineCacheHeaderVersion = ^T_VkPipelineCacheHeaderVersion;
const VK_PIPELINE_CACHE_HEADER_VERSION_ONE       = 1;
const VK_PIPELINE_CACHE_HEADER_VERSION_MAX_ENUM  = $7FFFFFFF;
//} VkPipelineCacheHeaderVersion;

//typedef enum VkImageLayout {
type T_VkImageLayout = T_int32_t;  P_VkImageLayout = ^T_VkImageLayout;
const VK_IMAGE_LAYOUT_UNDEFINED                                       = 0;
const VK_IMAGE_LAYOUT_GENERAL                                         = 1;
const VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL                        = 2;
const VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL                = 3;
const VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL                 = 4;
const VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL                        = 5;
const VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL                            = 6;
const VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL                            = 7;
const VK_IMAGE_LAYOUT_PREINITIALIZED                                  = 8;
const VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL      = 1000117000;
const VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL      = 1000117001;
const VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL                        = 1000241000;
const VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL                         = 1000241001;
const VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL                      = 1000241002;
const VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL                       = 1000241003;
const VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL                               = 1000314000;
const VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL                              = 1000314001;
const VK_IMAGE_LAYOUT_PRESENT_SRC_KHR                                 = 1000001002;
const VK_IMAGE_LAYOUT_VIDEO_DECODE_DST_KHR                            = 1000024000;
const VK_IMAGE_LAYOUT_VIDEO_DECODE_SRC_KHR                            = 1000024001;
const VK_IMAGE_LAYOUT_VIDEO_DECODE_DPB_KHR                            = 1000024002;
const VK_IMAGE_LAYOUT_SHARED_PRESENT_KHR                              = 1000111000;
const VK_IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT                = 1000218000;
const VK_IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR    = 1000164003;
const VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ_KHR                        = 1000232000;
const VK_IMAGE_LAYOUT_VIDEO_ENCODE_DST_KHR                            = 1000299000;
const VK_IMAGE_LAYOUT_VIDEO_ENCODE_SRC_KHR                            = 1000299001;
const VK_IMAGE_LAYOUT_VIDEO_ENCODE_DPB_KHR                            = 1000299002;
const VK_IMAGE_LAYOUT_ATTACHMENT_FEEDBACK_LOOP_OPTIMAL_EXT            = 1000339000;
const VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL_KHR  = VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL;
const VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL_KHR  = VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL;
const VK_IMAGE_LAYOUT_SHADING_RATE_OPTIMAL_NV                         = VK_IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR;
const VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL_KHR                    = VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL;
const VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL_KHR                     = VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL;
const VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL_KHR                  = VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL;
const VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL_KHR                   = VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL;
const VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL_KHR                           = VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL;
const VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL_KHR                          = VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL;
const VK_IMAGE_LAYOUT_MAX_ENUM                                        = $7FFFFFFF;
//} VkImageLayout;

//typedef enum VkObjectType {
type T_VkObjectType = T_int32_t;  P_VkObjectType = ^T_VkObjectType;
const VK_OBJECT_TYPE_UNKNOWN                          = 0;
const VK_OBJECT_TYPE_INSTANCE                         = 1;
const VK_OBJECT_TYPE_PHYSICAL_DEVICE                  = 2;
const VK_OBJECT_TYPE_DEVICE                           = 3;
const VK_OBJECT_TYPE_QUEUE                            = 4;
const VK_OBJECT_TYPE_SEMAPHORE                        = 5;
const VK_OBJECT_TYPE_COMMAND_BUFFER                   = 6;
const VK_OBJECT_TYPE_FENCE                            = 7;
const VK_OBJECT_TYPE_DEVICE_MEMORY                    = 8;
const VK_OBJECT_TYPE_BUFFER                           = 9;
const VK_OBJECT_TYPE_IMAGE                            = 10;
const VK_OBJECT_TYPE_EVENT                            = 11;
const VK_OBJECT_TYPE_QUERY_POOL                       = 12;
const VK_OBJECT_TYPE_BUFFER_VIEW                      = 13;
const VK_OBJECT_TYPE_IMAGE_VIEW                       = 14;
const VK_OBJECT_TYPE_SHADER_MODULE                    = 15;
const VK_OBJECT_TYPE_PIPELINE_CACHE                   = 16;
const VK_OBJECT_TYPE_PIPELINE_LAYOUT                  = 17;
const VK_OBJECT_TYPE_RENDER_PASS                      = 18;
const VK_OBJECT_TYPE_PIPELINE                         = 19;
const VK_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT            = 20;
const VK_OBJECT_TYPE_SAMPLER                          = 21;
const VK_OBJECT_TYPE_DESCRIPTOR_POOL                  = 22;
const VK_OBJECT_TYPE_DESCRIPTOR_SET                   = 23;
const VK_OBJECT_TYPE_FRAMEBUFFER                      = 24;
const VK_OBJECT_TYPE_COMMAND_POOL                     = 25;
const VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION         = 1000156000;
const VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE       = 1000085000;
const VK_OBJECT_TYPE_PRIVATE_DATA_SLOT                = 1000295000;
const VK_OBJECT_TYPE_SURFACE_KHR                      = 1000000000;
const VK_OBJECT_TYPE_SWAPCHAIN_KHR                    = 1000001000;
const VK_OBJECT_TYPE_DISPLAY_KHR                      = 1000002000;
const VK_OBJECT_TYPE_DISPLAY_MODE_KHR                 = 1000002001;
const VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT        = 1000011000;
const VK_OBJECT_TYPE_VIDEO_SESSION_KHR                = 1000023000;
const VK_OBJECT_TYPE_VIDEO_SESSION_PARAMETERS_KHR     = 1000023001;
const VK_OBJECT_TYPE_CU_MODULE_NVX                    = 1000029000;
const VK_OBJECT_TYPE_CU_FUNCTION_NVX                  = 1000029001;
const VK_OBJECT_TYPE_DEBUG_UTILS_MESSENGER_EXT        = 1000128000;
const VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR       = 1000150000;
const VK_OBJECT_TYPE_VALIDATION_CACHE_EXT             = 1000160000;
const VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV        = 1000165000;
const VK_OBJECT_TYPE_PERFORMANCE_CONFIGURATION_INTEL  = 1000210000;
const VK_OBJECT_TYPE_DEFERRED_OPERATION_KHR           = 1000268000;
const VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV      = 1000277000;
const VK_OBJECT_TYPE_CUDA_MODULE_NV                   = 1000307000;
const VK_OBJECT_TYPE_CUDA_FUNCTION_NV                 = 1000307001;
const VK_OBJECT_TYPE_BUFFER_COLLECTION_FUCHSIA        = 1000366000;
const VK_OBJECT_TYPE_MICROMAP_EXT                     = 1000396000;
const VK_OBJECT_TYPE_OPTICAL_FLOW_SESSION_NV          = 1000464000;
const VK_OBJECT_TYPE_SHADER_EXT                       = 1000482000;
const VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR   = VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE;
const VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR     = VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION;
const VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT            = VK_OBJECT_TYPE_PRIVATE_DATA_SLOT;
const VK_OBJECT_TYPE_MAX_ENUM                         = $7FFFFFFF;
//} VkObjectType;

//typedef enum VkVendorId {
type T_VkVendorId = T_int32_t;  P_VkVendorId = ^T_VkVendorId;
const VK_VENDOR_ID_VIV       = $10001;
const VK_VENDOR_ID_VSI       = $10002;
const VK_VENDOR_ID_KAZAN     = $10003;
const VK_VENDOR_ID_CODEPLAY  = $10004;
const VK_VENDOR_ID_MESA      = $10005;
const VK_VENDOR_ID_POCL      = $10006;
const VK_VENDOR_ID_MOBILEYE  = $10007;
const VK_VENDOR_ID_MAX_ENUM  = $7FFFFFFF;
//} VkVendorId;

//typedef enum VkSystemAllocationScope {
type T_VkSystemAllocationScope = T_int32_t;  P_VkSystemAllocationScope = ^T_VkSystemAllocationScope;
const VK_SYSTEM_ALLOCATION_SCOPE_COMMAND   = 0;
const VK_SYSTEM_ALLOCATION_SCOPE_OBJECT    = 1;
const VK_SYSTEM_ALLOCATION_SCOPE_CACHE     = 2;
const VK_SYSTEM_ALLOCATION_SCOPE_DEVICE    = 3;
const VK_SYSTEM_ALLOCATION_SCOPE_INSTANCE  = 4;
const VK_SYSTEM_ALLOCATION_SCOPE_MAX_ENUM  = $7FFFFFFF;
//} VkSystemAllocationScope;

//typedef enum VkInternalAllocationType {
type T_VkInternalAllocationType = T_int32_t;  P_VkInternalAllocationType = ^T_VkInternalAllocationType;
const VK_INTERNAL_ALLOCATION_TYPE_EXECUTABLE  = 0;
const VK_INTERNAL_ALLOCATION_TYPE_MAX_ENUM    = $7FFFFFFF;
//} VkInternalAllocationType;

//typedef enum VkFormat {
type T_VkFormat = T_int32_t;  P_VkFormat = ^T_VkFormat;
const VK_FORMAT_UNDEFINED                                       = 0;
const VK_FORMAT_R4G4_UNORM_PACK8                                = 1;
const VK_FORMAT_R4G4B4A4_UNORM_PACK16                           = 2;
const VK_FORMAT_B4G4R4A4_UNORM_PACK16                           = 3;
const VK_FORMAT_R5G6B5_UNORM_PACK16                             = 4;
const VK_FORMAT_B5G6R5_UNORM_PACK16                             = 5;
const VK_FORMAT_R5G5B5A1_UNORM_PACK16                           = 6;
const VK_FORMAT_B5G5R5A1_UNORM_PACK16                           = 7;
const VK_FORMAT_A1R5G5B5_UNORM_PACK16                           = 8;
const VK_FORMAT_R8_UNORM                                        = 9;
const VK_FORMAT_R8_SNORM                                        = 10;
const VK_FORMAT_R8_USCALED                                      = 11;
const VK_FORMAT_R8_SSCALED                                      = 12;
const VK_FORMAT_R8_UINT                                         = 13;
const VK_FORMAT_R8_SINT                                         = 14;
const VK_FORMAT_R8_SRGB                                         = 15;
const VK_FORMAT_R8G8_UNORM                                      = 16;
const VK_FORMAT_R8G8_SNORM                                      = 17;
const VK_FORMAT_R8G8_USCALED                                    = 18;
const VK_FORMAT_R8G8_SSCALED                                    = 19;
const VK_FORMAT_R8G8_UINT                                       = 20;
const VK_FORMAT_R8G8_SINT                                       = 21;
const VK_FORMAT_R8G8_SRGB                                       = 22;
const VK_FORMAT_R8G8B8_UNORM                                    = 23;
const VK_FORMAT_R8G8B8_SNORM                                    = 24;
const VK_FORMAT_R8G8B8_USCALED                                  = 25;
const VK_FORMAT_R8G8B8_SSCALED                                  = 26;
const VK_FORMAT_R8G8B8_UINT                                     = 27;
const VK_FORMAT_R8G8B8_SINT                                     = 28;
const VK_FORMAT_R8G8B8_SRGB                                     = 29;
const VK_FORMAT_B8G8R8_UNORM                                    = 30;
const VK_FORMAT_B8G8R8_SNORM                                    = 31;
const VK_FORMAT_B8G8R8_USCALED                                  = 32;
const VK_FORMAT_B8G8R8_SSCALED                                  = 33;
const VK_FORMAT_B8G8R8_UINT                                     = 34;
const VK_FORMAT_B8G8R8_SINT                                     = 35;
const VK_FORMAT_B8G8R8_SRGB                                     = 36;
const VK_FORMAT_R8G8B8A8_UNORM                                  = 37;
const VK_FORMAT_R8G8B8A8_SNORM                                  = 38;
const VK_FORMAT_R8G8B8A8_USCALED                                = 39;
const VK_FORMAT_R8G8B8A8_SSCALED                                = 40;
const VK_FORMAT_R8G8B8A8_UINT                                   = 41;
const VK_FORMAT_R8G8B8A8_SINT                                   = 42;
const VK_FORMAT_R8G8B8A8_SRGB                                   = 43;
const VK_FORMAT_B8G8R8A8_UNORM                                  = 44;
const VK_FORMAT_B8G8R8A8_SNORM                                  = 45;
const VK_FORMAT_B8G8R8A8_USCALED                                = 46;
const VK_FORMAT_B8G8R8A8_SSCALED                                = 47;
const VK_FORMAT_B8G8R8A8_UINT                                   = 48;
const VK_FORMAT_B8G8R8A8_SINT                                   = 49;
const VK_FORMAT_B8G8R8A8_SRGB                                   = 50;
const VK_FORMAT_A8B8G8R8_UNORM_PACK32                           = 51;
const VK_FORMAT_A8B8G8R8_SNORM_PACK32                           = 52;
const VK_FORMAT_A8B8G8R8_USCALED_PACK32                         = 53;
const VK_FORMAT_A8B8G8R8_SSCALED_PACK32                         = 54;
const VK_FORMAT_A8B8G8R8_UINT_PACK32                            = 55;
const VK_FORMAT_A8B8G8R8_SINT_PACK32                            = 56;
const VK_FORMAT_A8B8G8R8_SRGB_PACK32                            = 57;
const VK_FORMAT_A2R10G10B10_UNORM_PACK32                        = 58;
const VK_FORMAT_A2R10G10B10_SNORM_PACK32                        = 59;
const VK_FORMAT_A2R10G10B10_USCALED_PACK32                      = 60;
const VK_FORMAT_A2R10G10B10_SSCALED_PACK32                      = 61;
const VK_FORMAT_A2R10G10B10_UINT_PACK32                         = 62;
const VK_FORMAT_A2R10G10B10_SINT_PACK32                         = 63;
const VK_FORMAT_A2B10G10R10_UNORM_PACK32                        = 64;
const VK_FORMAT_A2B10G10R10_SNORM_PACK32                        = 65;
const VK_FORMAT_A2B10G10R10_USCALED_PACK32                      = 66;
const VK_FORMAT_A2B10G10R10_SSCALED_PACK32                      = 67;
const VK_FORMAT_A2B10G10R10_UINT_PACK32                         = 68;
const VK_FORMAT_A2B10G10R10_SINT_PACK32                         = 69;
const VK_FORMAT_R16_UNORM                                       = 70;
const VK_FORMAT_R16_SNORM                                       = 71;
const VK_FORMAT_R16_USCALED                                     = 72;
const VK_FORMAT_R16_SSCALED                                     = 73;
const VK_FORMAT_R16_UINT                                        = 74;
const VK_FORMAT_R16_SINT                                        = 75;
const VK_FORMAT_R16_SFLOAT                                      = 76;
const VK_FORMAT_R16G16_UNORM                                    = 77;
const VK_FORMAT_R16G16_SNORM                                    = 78;
const VK_FORMAT_R16G16_USCALED                                  = 79;
const VK_FORMAT_R16G16_SSCALED                                  = 80;
const VK_FORMAT_R16G16_UINT                                     = 81;
const VK_FORMAT_R16G16_SINT                                     = 82;
const VK_FORMAT_R16G16_SFLOAT                                   = 83;
const VK_FORMAT_R16G16B16_UNORM                                 = 84;
const VK_FORMAT_R16G16B16_SNORM                                 = 85;
const VK_FORMAT_R16G16B16_USCALED                               = 86;
const VK_FORMAT_R16G16B16_SSCALED                               = 87;
const VK_FORMAT_R16G16B16_UINT                                  = 88;
const VK_FORMAT_R16G16B16_SINT                                  = 89;
const VK_FORMAT_R16G16B16_SFLOAT                                = 90;
const VK_FORMAT_R16G16B16A16_UNORM                              = 91;
const VK_FORMAT_R16G16B16A16_SNORM                              = 92;
const VK_FORMAT_R16G16B16A16_USCALED                            = 93;
const VK_FORMAT_R16G16B16A16_SSCALED                            = 94;
const VK_FORMAT_R16G16B16A16_UINT                               = 95;
const VK_FORMAT_R16G16B16A16_SINT                               = 96;
const VK_FORMAT_R16G16B16A16_SFLOAT                             = 97;
const VK_FORMAT_R32_UINT                                        = 98;
const VK_FORMAT_R32_SINT                                        = 99;
const VK_FORMAT_R32_SFLOAT                                      = 100;
const VK_FORMAT_R32G32_UINT                                     = 101;
const VK_FORMAT_R32G32_SINT                                     = 102;
const VK_FORMAT_R32G32_SFLOAT                                   = 103;
const VK_FORMAT_R32G32B32_UINT                                  = 104;
const VK_FORMAT_R32G32B32_SINT                                  = 105;
const VK_FORMAT_R32G32B32_SFLOAT                                = 106;
const VK_FORMAT_R32G32B32A32_UINT                               = 107;
const VK_FORMAT_R32G32B32A32_SINT                               = 108;
const VK_FORMAT_R32G32B32A32_SFLOAT                             = 109;
const VK_FORMAT_R64_UINT                                        = 110;
const VK_FORMAT_R64_SINT                                        = 111;
const VK_FORMAT_R64_SFLOAT                                      = 112;
const VK_FORMAT_R64G64_UINT                                     = 113;
const VK_FORMAT_R64G64_SINT                                     = 114;
const VK_FORMAT_R64G64_SFLOAT                                   = 115;
const VK_FORMAT_R64G64B64_UINT                                  = 116;
const VK_FORMAT_R64G64B64_SINT                                  = 117;
const VK_FORMAT_R64G64B64_SFLOAT                                = 118;
const VK_FORMAT_R64G64B64A64_UINT                               = 119;
const VK_FORMAT_R64G64B64A64_SINT                               = 120;
const VK_FORMAT_R64G64B64A64_SFLOAT                             = 121;
const VK_FORMAT_B10G11R11_UFLOAT_PACK32                         = 122;
const VK_FORMAT_E5B9G9R9_UFLOAT_PACK32                          = 123;
const VK_FORMAT_D16_UNORM                                       = 124;
const VK_FORMAT_X8_D24_UNORM_PACK32                             = 125;
const VK_FORMAT_D32_SFLOAT                                      = 126;
const VK_FORMAT_S8_UINT                                         = 127;
const VK_FORMAT_D16_UNORM_S8_UINT                               = 128;
const VK_FORMAT_D24_UNORM_S8_UINT                               = 129;
const VK_FORMAT_D32_SFLOAT_S8_UINT                              = 130;
const VK_FORMAT_BC1_RGB_UNORM_BLOCK                             = 131;
const VK_FORMAT_BC1_RGB_SRGB_BLOCK                              = 132;
const VK_FORMAT_BC1_RGBA_UNORM_BLOCK                            = 133;
const VK_FORMAT_BC1_RGBA_SRGB_BLOCK                             = 134;
const VK_FORMAT_BC2_UNORM_BLOCK                                 = 135;
const VK_FORMAT_BC2_SRGB_BLOCK                                  = 136;
const VK_FORMAT_BC3_UNORM_BLOCK                                 = 137;
const VK_FORMAT_BC3_SRGB_BLOCK                                  = 138;
const VK_FORMAT_BC4_UNORM_BLOCK                                 = 139;
const VK_FORMAT_BC4_SNORM_BLOCK                                 = 140;
const VK_FORMAT_BC5_UNORM_BLOCK                                 = 141;
const VK_FORMAT_BC5_SNORM_BLOCK                                 = 142;
const VK_FORMAT_BC6H_UFLOAT_BLOCK                               = 143;
const VK_FORMAT_BC6H_SFLOAT_BLOCK                               = 144;
const VK_FORMAT_BC7_UNORM_BLOCK                                 = 145;
const VK_FORMAT_BC7_SRGB_BLOCK                                  = 146;
const VK_FORMAT_ETC2_R8G8B8_UNORM_BLOCK                         = 147;
const VK_FORMAT_ETC2_R8G8B8_SRGB_BLOCK                          = 148;
const VK_FORMAT_ETC2_R8G8B8A1_UNORM_BLOCK                       = 149;
const VK_FORMAT_ETC2_R8G8B8A1_SRGB_BLOCK                        = 150;
const VK_FORMAT_ETC2_R8G8B8A8_UNORM_BLOCK                       = 151;
const VK_FORMAT_ETC2_R8G8B8A8_SRGB_BLOCK                        = 152;
const VK_FORMAT_EAC_R11_UNORM_BLOCK                             = 153;
const VK_FORMAT_EAC_R11_SNORM_BLOCK                             = 154;
const VK_FORMAT_EAC_R11G11_UNORM_BLOCK                          = 155;
const VK_FORMAT_EAC_R11G11_SNORM_BLOCK                          = 156;
const VK_FORMAT_ASTC_4x4_UNORM_BLOCK                            = 157;
const VK_FORMAT_ASTC_4x4_SRGB_BLOCK                             = 158;
const VK_FORMAT_ASTC_5x4_UNORM_BLOCK                            = 159;
const VK_FORMAT_ASTC_5x4_SRGB_BLOCK                             = 160;
const VK_FORMAT_ASTC_5x5_UNORM_BLOCK                            = 161;
const VK_FORMAT_ASTC_5x5_SRGB_BLOCK                             = 162;
const VK_FORMAT_ASTC_6x5_UNORM_BLOCK                            = 163;
const VK_FORMAT_ASTC_6x5_SRGB_BLOCK                             = 164;
const VK_FORMAT_ASTC_6x6_UNORM_BLOCK                            = 165;
const VK_FORMAT_ASTC_6x6_SRGB_BLOCK                             = 166;
const VK_FORMAT_ASTC_8x5_UNORM_BLOCK                            = 167;
const VK_FORMAT_ASTC_8x5_SRGB_BLOCK                             = 168;
const VK_FORMAT_ASTC_8x6_UNORM_BLOCK                            = 169;
const VK_FORMAT_ASTC_8x6_SRGB_BLOCK                             = 170;
const VK_FORMAT_ASTC_8x8_UNORM_BLOCK                            = 171;
const VK_FORMAT_ASTC_8x8_SRGB_BLOCK                             = 172;
const VK_FORMAT_ASTC_10x5_UNORM_BLOCK                           = 173;
const VK_FORMAT_ASTC_10x5_SRGB_BLOCK                            = 174;
const VK_FORMAT_ASTC_10x6_UNORM_BLOCK                           = 175;
const VK_FORMAT_ASTC_10x6_SRGB_BLOCK                            = 176;
const VK_FORMAT_ASTC_10x8_UNORM_BLOCK                           = 177;
const VK_FORMAT_ASTC_10x8_SRGB_BLOCK                            = 178;
const VK_FORMAT_ASTC_10x10_UNORM_BLOCK                          = 179;
const VK_FORMAT_ASTC_10x10_SRGB_BLOCK                           = 180;
const VK_FORMAT_ASTC_12x10_UNORM_BLOCK                          = 181;
const VK_FORMAT_ASTC_12x10_SRGB_BLOCK                           = 182;
const VK_FORMAT_ASTC_12x12_UNORM_BLOCK                          = 183;
const VK_FORMAT_ASTC_12x12_SRGB_BLOCK                           = 184;
const VK_FORMAT_G8B8G8R8_422_UNORM                              = 1000156000;
const VK_FORMAT_B8G8R8G8_422_UNORM                              = 1000156001;
const VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM                       = 1000156002;
const VK_FORMAT_G8_B8R8_2PLANE_420_UNORM                        = 1000156003;
const VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM                       = 1000156004;
const VK_FORMAT_G8_B8R8_2PLANE_422_UNORM                        = 1000156005;
const VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM                       = 1000156006;
const VK_FORMAT_R10X6_UNORM_PACK16                              = 1000156007;
const VK_FORMAT_R10X6G10X6_UNORM_2PACK16                        = 1000156008;
const VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16              = 1000156009;
const VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16          = 1000156010;
const VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16          = 1000156011;
const VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16      = 1000156012;
const VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16       = 1000156013;
const VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16      = 1000156014;
const VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16       = 1000156015;
const VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16      = 1000156016;
const VK_FORMAT_R12X4_UNORM_PACK16                              = 1000156017;
const VK_FORMAT_R12X4G12X4_UNORM_2PACK16                        = 1000156018;
const VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16              = 1000156019;
const VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16          = 1000156020;
const VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16          = 1000156021;
const VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16      = 1000156022;
const VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16       = 1000156023;
const VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16      = 1000156024;
const VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16       = 1000156025;
const VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16      = 1000156026;
const VK_FORMAT_G16B16G16R16_422_UNORM                          = 1000156027;
const VK_FORMAT_B16G16R16G16_422_UNORM                          = 1000156028;
const VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM                    = 1000156029;
const VK_FORMAT_G16_B16R16_2PLANE_420_UNORM                     = 1000156030;
const VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM                    = 1000156031;
const VK_FORMAT_G16_B16R16_2PLANE_422_UNORM                     = 1000156032;
const VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM                    = 1000156033;
const VK_FORMAT_G8_B8R8_2PLANE_444_UNORM                        = 1000330000;
const VK_FORMAT_G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16       = 1000330001;
const VK_FORMAT_G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16       = 1000330002;
const VK_FORMAT_G16_B16R16_2PLANE_444_UNORM                     = 1000330003;
const VK_FORMAT_A4R4G4B4_UNORM_PACK16                           = 1000340000;
const VK_FORMAT_A4B4G4R4_UNORM_PACK16                           = 1000340001;
const VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK                           = 1000066000;
const VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK                           = 1000066001;
const VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK                           = 1000066002;
const VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK                           = 1000066003;
const VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK                           = 1000066004;
const VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK                           = 1000066005;
const VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK                           = 1000066006;
const VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK                           = 1000066007;
const VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK                          = 1000066008;
const VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK                          = 1000066009;
const VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK                          = 1000066010;
const VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK                         = 1000066011;
const VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK                         = 1000066012;
const VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK                         = 1000066013;
const VK_FORMAT_PVRTC1_2BPP_UNORM_BLOCK_IMG                     = 1000054000;
const VK_FORMAT_PVRTC1_4BPP_UNORM_BLOCK_IMG                     = 1000054001;
const VK_FORMAT_PVRTC2_2BPP_UNORM_BLOCK_IMG                     = 1000054002;
const VK_FORMAT_PVRTC2_4BPP_UNORM_BLOCK_IMG                     = 1000054003;
const VK_FORMAT_PVRTC1_2BPP_SRGB_BLOCK_IMG                      = 1000054004;
const VK_FORMAT_PVRTC1_4BPP_SRGB_BLOCK_IMG                      = 1000054005;
const VK_FORMAT_PVRTC2_2BPP_SRGB_BLOCK_IMG                      = 1000054006;
const VK_FORMAT_PVRTC2_4BPP_SRGB_BLOCK_IMG                      = 1000054007;
const VK_FORMAT_R16G16_S10_5_NV                                 = 1000464000;
const VK_FORMAT_A1B5G5R5_UNORM_PACK16_KHR                       = 1000470000;
const VK_FORMAT_A8_UNORM_KHR                                    = 1000470001;
const VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK_EXT                       = VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK_EXT                       = VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK_EXT                       = VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK_EXT                       = VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK_EXT                       = VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK_EXT                       = VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK_EXT                       = VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK_EXT                       = VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK_EXT                      = VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK_EXT                      = VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK_EXT                      = VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK_EXT                     = VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK_EXT                     = VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK;
const VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK_EXT                     = VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK;
const VK_FORMAT_G8B8G8R8_422_UNORM_KHR                          = VK_FORMAT_G8B8G8R8_422_UNORM;
const VK_FORMAT_B8G8R8G8_422_UNORM_KHR                          = VK_FORMAT_B8G8R8G8_422_UNORM;
const VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM_KHR                   = VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM;
const VK_FORMAT_G8_B8R8_2PLANE_420_UNORM_KHR                    = VK_FORMAT_G8_B8R8_2PLANE_420_UNORM;
const VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM_KHR                   = VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM;
const VK_FORMAT_G8_B8R8_2PLANE_422_UNORM_KHR                    = VK_FORMAT_G8_B8R8_2PLANE_422_UNORM;
const VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM_KHR                   = VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM;
const VK_FORMAT_R10X6_UNORM_PACK16_KHR                          = VK_FORMAT_R10X6_UNORM_PACK16;
const VK_FORMAT_R10X6G10X6_UNORM_2PACK16_KHR                    = VK_FORMAT_R10X6G10X6_UNORM_2PACK16;
const VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR          = VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16;
const VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16_KHR      = VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16;
const VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16_KHR      = VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16;
const VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16_KHR  = VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16;
const VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16_KHR   = VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16;
const VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16_KHR  = VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16;
const VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16_KHR   = VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16;
const VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16_KHR  = VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16;
const VK_FORMAT_R12X4_UNORM_PACK16_KHR                          = VK_FORMAT_R12X4_UNORM_PACK16;
const VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR                    = VK_FORMAT_R12X4G12X4_UNORM_2PACK16;
const VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR          = VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16;
const VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16_KHR      = VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16;
const VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16_KHR      = VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16;
const VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16_KHR  = VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16;
const VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR   = VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16;
const VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16_KHR  = VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16;
const VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR   = VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16;
const VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16_KHR  = VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16;
const VK_FORMAT_G16B16G16R16_422_UNORM_KHR                      = VK_FORMAT_G16B16G16R16_422_UNORM;
const VK_FORMAT_B16G16R16G16_422_UNORM_KHR                      = VK_FORMAT_B16G16R16G16_422_UNORM;
const VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM_KHR                = VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM;
const VK_FORMAT_G16_B16R16_2PLANE_420_UNORM_KHR                 = VK_FORMAT_G16_B16R16_2PLANE_420_UNORM;
const VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM_KHR                = VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM;
const VK_FORMAT_G16_B16R16_2PLANE_422_UNORM_KHR                 = VK_FORMAT_G16_B16R16_2PLANE_422_UNORM;
const VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM_KHR                = VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM;
const VK_FORMAT_G8_B8R8_2PLANE_444_UNORM_EXT                    = VK_FORMAT_G8_B8R8_2PLANE_444_UNORM;
const VK_FORMAT_G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16_EXT   = VK_FORMAT_G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16;
const VK_FORMAT_G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16_EXT   = VK_FORMAT_G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16;
const VK_FORMAT_G16_B16R16_2PLANE_444_UNORM_EXT                 = VK_FORMAT_G16_B16R16_2PLANE_444_UNORM;
const VK_FORMAT_A4R4G4B4_UNORM_PACK16_EXT                       = VK_FORMAT_A4R4G4B4_UNORM_PACK16;
const VK_FORMAT_A4B4G4R4_UNORM_PACK16_EXT                       = VK_FORMAT_A4B4G4R4_UNORM_PACK16;
const VK_FORMAT_MAX_ENUM                                        = $7FFFFFFF;
//} VkFormat;


//typedef enum VkImageTiling {
type T_VkImageTiling = T_int32_t;  P_VkImageTiling = ^T_VkImageTiling;
const VK_IMAGE_TILING_OPTIMAL                  = 0;
const VK_IMAGE_TILING_LINEAR                   = 1;
const VK_IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT  = 1000158000;
const VK_IMAGE_TILING_MAX_ENUM                 = $7FFFFFFF;
//} VkImageTiling;

//typedef enum VkImageType {
type T_VkImageType = T_int32_t;  P_VkImageType = ^T_VkImageType;
const VK_IMAGE_TYPE_1D        = 0;
const VK_IMAGE_TYPE_2D        = 1;
const VK_IMAGE_TYPE_3D        = 2;
const VK_IMAGE_TYPE_MAX_ENUM  = $7FFFFFFF;
//} VkImageType;

//typedef enum VkPhysicalDeviceType {
type T_VkPhysicalDeviceType = T_int32_t;  P_VkPhysicalDeviceType = ^T_VkPhysicalDeviceType;
const VK_PHYSICAL_DEVICE_TYPE_OTHER           = 0;
const VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU  = 1;
const VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU    = 2;
const VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU     = 3;
const VK_PHYSICAL_DEVICE_TYPE_CPU             = 4;
const VK_PHYSICAL_DEVICE_TYPE_MAX_ENUM        = $7FFFFFFF;
//} VkPhysicalDeviceType;

//typedef enum VkQueryType {
type T_VkQueryType = T_int32_t;  P_VkQueryType = ^T_VkQueryType;
const VK_QUERY_TYPE_OCCLUSION                                                       = 0;
const VK_QUERY_TYPE_PIPELINE_STATISTICS                                             = 1;
const VK_QUERY_TYPE_TIMESTAMP                                                       = 2;
const VK_QUERY_TYPE_RESULT_STATUS_ONLY_KHR                                          = 1000023000;
const VK_QUERY_TYPE_TRANSFORM_FEEDBACK_STREAM_EXT                                   = 1000028004;
const VK_QUERY_TYPE_PERFORMANCE_QUERY_KHR                                           = 1000116000;
const VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR                       = 1000150000;
const VK_QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR                   = 1000150001;
const VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV                        = 1000165000;
const VK_QUERY_TYPE_PERFORMANCE_QUERY_INTEL                                         = 1000210000;
const VK_QUERY_TYPE_VIDEO_ENCODE_FEEDBACK_KHR                                       = 1000299000;
const VK_QUERY_TYPE_MESH_PRIMITIVES_GENERATED_EXT                                   = 1000328000;
const VK_QUERY_TYPE_PRIMITIVES_GENERATED_EXT                                        = 1000382000;
const VK_QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_BOTTOM_LEVEL_POINTERS_KHR  = 1000386000;
const VK_QUERY_TYPE_ACCELERATION_STRUCTURE_SIZE_KHR                                 = 1000386001;
const VK_QUERY_TYPE_MICROMAP_SERIALIZATION_SIZE_EXT                                 = 1000396000;
const VK_QUERY_TYPE_MICROMAP_COMPACTED_SIZE_EXT                                     = 1000396001;
const VK_QUERY_TYPE_MAX_ENUM                                                        = $7FFFFFFF;
//} VkQueryType;

//typedef enum VkSharingMode {
type T_VkSharingMode = T_int32_t;  P_VkSharingMode = ^T_VkSharingMode;
const VK_SHARING_MODE_EXCLUSIVE   = 0;
const VK_SHARING_MODE_CONCURRENT  = 1;
const VK_SHARING_MODE_MAX_ENUM    = $7FFFFFFF;
//} VkSharingMode;

//typedef enum VkComponentSwizzle {
type T_VkComponentSwizzle = T_int32_t;  P_VkComponentSwizzle = ^T_VkComponentSwizzle;
const VK_COMPONENT_SWIZZLE_IDENTITY  = 0;
const VK_COMPONENT_SWIZZLE_ZERO      = 1;
const VK_COMPONENT_SWIZZLE_ONE       = 2;
const VK_COMPONENT_SWIZZLE_R         = 3;
const VK_COMPONENT_SWIZZLE_G         = 4;
const VK_COMPONENT_SWIZZLE_B         = 5;
const VK_COMPONENT_SWIZZLE_A         = 6;
const VK_COMPONENT_SWIZZLE_MAX_ENUM  = $7FFFFFFF;
//} VkComponentSwizzle;

//typedef enum VkImageViewType {
type T_VkImageViewType = T_int32_t;  P_VkImageViewType = ^T_VkImageViewType;
const VK_IMAGE_VIEW_TYPE_1D          = 0;
const VK_IMAGE_VIEW_TYPE_2D          = 1;
const VK_IMAGE_VIEW_TYPE_3D          = 2;
const VK_IMAGE_VIEW_TYPE_CUBE        = 3;
const VK_IMAGE_VIEW_TYPE_1D_ARRAY    = 4;
const VK_IMAGE_VIEW_TYPE_2D_ARRAY    = 5;
const VK_IMAGE_VIEW_TYPE_CUBE_ARRAY  = 6;
const VK_IMAGE_VIEW_TYPE_MAX_ENUM    = $7FFFFFFF;
//} VkImageViewType;

//typedef enum VkBlendFactor {
type T_VkBlendFactor = T_int32_t;  P_VkBlendFactor = ^T_VkBlendFactor;
const VK_BLEND_FACTOR_ZERO                      = 0;
const VK_BLEND_FACTOR_ONE                       = 1;
const VK_BLEND_FACTOR_SRC_COLOR                 = 2;
const VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR       = 3;
const VK_BLEND_FACTOR_DST_COLOR                 = 4;
const VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR       = 5;
const VK_BLEND_FACTOR_SRC_ALPHA                 = 6;
const VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA       = 7;
const VK_BLEND_FACTOR_DST_ALPHA                 = 8;
const VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA       = 9;
const VK_BLEND_FACTOR_CONSTANT_COLOR            = 10;
const VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR  = 11;
const VK_BLEND_FACTOR_CONSTANT_ALPHA            = 12;
const VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_ALPHA  = 13;
const VK_BLEND_FACTOR_SRC_ALPHA_SATURATE        = 14;
const VK_BLEND_FACTOR_SRC1_COLOR                = 15;
const VK_BLEND_FACTOR_ONE_MINUS_SRC1_COLOR      = 16;
const VK_BLEND_FACTOR_SRC1_ALPHA                = 17;
const VK_BLEND_FACTOR_ONE_MINUS_SRC1_ALPHA      = 18;
const VK_BLEND_FACTOR_MAX_ENUM                  = $7FFFFFFF;
//} VkBlendFactor;

//typedef enum VkBlendOp {
type T_VkBlendOp = T_int32_t;  P_VkBlendOp = ^T_VkBlendOp;
const VK_BLEND_OP_ADD                     = 0;
const VK_BLEND_OP_SUBTRACT                = 1;
const VK_BLEND_OP_REVERSE_SUBTRACT        = 2;
const VK_BLEND_OP_MIN                     = 3;
const VK_BLEND_OP_MAX                     = 4;
const VK_BLEND_OP_ZERO_EXT                = 1000148000;
const VK_BLEND_OP_SRC_EXT                 = 1000148001;
const VK_BLEND_OP_DST_EXT                 = 1000148002;
const VK_BLEND_OP_SRC_OVER_EXT            = 1000148003;
const VK_BLEND_OP_DST_OVER_EXT            = 1000148004;
const VK_BLEND_OP_SRC_IN_EXT              = 1000148005;
const VK_BLEND_OP_DST_IN_EXT              = 1000148006;
const VK_BLEND_OP_SRC_OUT_EXT             = 1000148007;
const VK_BLEND_OP_DST_OUT_EXT             = 1000148008;
const VK_BLEND_OP_SRC_ATOP_EXT            = 1000148009;
const VK_BLEND_OP_DST_ATOP_EXT            = 1000148010;
const VK_BLEND_OP_XOR_EXT                 = 1000148011;
const VK_BLEND_OP_MULTIPLY_EXT            = 1000148012;
const VK_BLEND_OP_SCREEN_EXT              = 1000148013;
const VK_BLEND_OP_OVERLAY_EXT             = 1000148014;
const VK_BLEND_OP_DARKEN_EXT              = 1000148015;
const VK_BLEND_OP_LIGHTEN_EXT             = 1000148016;
const VK_BLEND_OP_COLORDODGE_EXT          = 1000148017;
const VK_BLEND_OP_COLORBURN_EXT           = 1000148018;
const VK_BLEND_OP_HARDLIGHT_EXT           = 1000148019;
const VK_BLEND_OP_SOFTLIGHT_EXT           = 1000148020;
const VK_BLEND_OP_DIFFERENCE_EXT          = 1000148021;
const VK_BLEND_OP_EXCLUSION_EXT           = 1000148022;
const VK_BLEND_OP_INVERT_EXT              = 1000148023;
const VK_BLEND_OP_INVERT_RGB_EXT          = 1000148024;
const VK_BLEND_OP_LINEARDODGE_EXT         = 1000148025;
const VK_BLEND_OP_LINEARBURN_EXT          = 1000148026;
const VK_BLEND_OP_VIVIDLIGHT_EXT          = 1000148027;
const VK_BLEND_OP_LINEARLIGHT_EXT         = 1000148028;
const VK_BLEND_OP_PINLIGHT_EXT            = 1000148029;
const VK_BLEND_OP_HARDMIX_EXT             = 1000148030;
const VK_BLEND_OP_HSL_HUE_EXT             = 1000148031;
const VK_BLEND_OP_HSL_SATURATION_EXT      = 1000148032;
const VK_BLEND_OP_HSL_COLOR_EXT           = 1000148033;
const VK_BLEND_OP_HSL_LUMINOSITY_EXT      = 1000148034;
const VK_BLEND_OP_PLUS_EXT                = 1000148035;
const VK_BLEND_OP_PLUS_CLAMPED_EXT        = 1000148036;
const VK_BLEND_OP_PLUS_CLAMPED_ALPHA_EXT  = 1000148037;
const VK_BLEND_OP_PLUS_DARKER_EXT         = 1000148038;
const VK_BLEND_OP_MINUS_EXT               = 1000148039;
const VK_BLEND_OP_MINUS_CLAMPED_EXT       = 1000148040;
const VK_BLEND_OP_CONTRAST_EXT            = 1000148041;
const VK_BLEND_OP_INVERT_OVG_EXT          = 1000148042;
const VK_BLEND_OP_RED_EXT                 = 1000148043;
const VK_BLEND_OP_GREEN_EXT               = 1000148044;
const VK_BLEND_OP_BLUE_EXT                = 1000148045;
const VK_BLEND_OP_MAX_ENUM                = $7FFFFFFF;
//} VkBlendOp;

//typedef enum VkCompareOp {
type T_VkCompareOp = T_int32_t;  P_VkCompareOp = ^T_VkCompareOp;
const VK_COMPARE_OP_NEVER             = 0;
const VK_COMPARE_OP_LESS              = 1;
const VK_COMPARE_OP_EQUAL             = 2;
const VK_COMPARE_OP_LESS_OR_EQUAL     = 3;
const VK_COMPARE_OP_GREATER           = 4;
const VK_COMPARE_OP_NOT_EQUAL         = 5;
const VK_COMPARE_OP_GREATER_OR_EQUAL  = 6;
const VK_COMPARE_OP_ALWAYS            = 7;
const VK_COMPARE_OP_MAX_ENUM          = $7FFFFFFF;
//} VkCompareOp;

//typedef enum VkDynamicState {
type T_VkDynamicState = T_int32_t;  P_VkDynamicState = ^T_VkDynamicState;
const VK_DYNAMIC_STATE_VIEWPORT                                 = 0;
const VK_DYNAMIC_STATE_SCISSOR                                  = 1;
const VK_DYNAMIC_STATE_LINE_WIDTH                               = 2;
const VK_DYNAMIC_STATE_DEPTH_BIAS                               = 3;
const VK_DYNAMIC_STATE_BLEND_CONSTANTS                          = 4;
const VK_DYNAMIC_STATE_DEPTH_BOUNDS                             = 5;
const VK_DYNAMIC_STATE_STENCIL_COMPARE_MASK                     = 6;
const VK_DYNAMIC_STATE_STENCIL_WRITE_MASK                       = 7;
const VK_DYNAMIC_STATE_STENCIL_REFERENCE                        = 8;
const VK_DYNAMIC_STATE_CULL_MODE                                = 1000267000;
const VK_DYNAMIC_STATE_FRONT_FACE                               = 1000267001;
const VK_DYNAMIC_STATE_PRIMITIVE_TOPOLOGY                       = 1000267002;
const VK_DYNAMIC_STATE_VIEWPORT_WITH_COUNT                      = 1000267003;
const VK_DYNAMIC_STATE_SCISSOR_WITH_COUNT                       = 1000267004;
const VK_DYNAMIC_STATE_VERTEX_INPUT_BINDING_STRIDE              = 1000267005;
const VK_DYNAMIC_STATE_DEPTH_TEST_ENABLE                        = 1000267006;
const VK_DYNAMIC_STATE_DEPTH_WRITE_ENABLE                       = 1000267007;
const VK_DYNAMIC_STATE_DEPTH_COMPARE_OP                         = 1000267008;
const VK_DYNAMIC_STATE_DEPTH_BOUNDS_TEST_ENABLE                 = 1000267009;
const VK_DYNAMIC_STATE_STENCIL_TEST_ENABLE                      = 1000267010;
const VK_DYNAMIC_STATE_STENCIL_OP                               = 1000267011;
const VK_DYNAMIC_STATE_RASTERIZER_DISCARD_ENABLE                = 1000377001;
const VK_DYNAMIC_STATE_DEPTH_BIAS_ENABLE                        = 1000377002;
const VK_DYNAMIC_STATE_PRIMITIVE_RESTART_ENABLE                 = 1000377004;
const VK_DYNAMIC_STATE_VIEWPORT_W_SCALING_NV                    = 1000087000;
const VK_DYNAMIC_STATE_DISCARD_RECTANGLE_EXT                    = 1000099000;
const VK_DYNAMIC_STATE_DISCARD_RECTANGLE_ENABLE_EXT             = 1000099001;
const VK_DYNAMIC_STATE_DISCARD_RECTANGLE_MODE_EXT               = 1000099002;
const VK_DYNAMIC_STATE_SAMPLE_LOCATIONS_EXT                     = 1000143000;
const VK_DYNAMIC_STATE_RAY_TRACING_PIPELINE_STACK_SIZE_KHR      = 1000347000;
const VK_DYNAMIC_STATE_VIEWPORT_SHADING_RATE_PALETTE_NV         = 1000164004;
const VK_DYNAMIC_STATE_VIEWPORT_COARSE_SAMPLE_ORDER_NV          = 1000164006;
const VK_DYNAMIC_STATE_EXCLUSIVE_SCISSOR_ENABLE_NV              = 1000205000;
const VK_DYNAMIC_STATE_EXCLUSIVE_SCISSOR_NV                     = 1000205001;
const VK_DYNAMIC_STATE_FRAGMENT_SHADING_RATE_KHR                = 1000226000;
const VK_DYNAMIC_STATE_VERTEX_INPUT_EXT                         = 1000352000;
const VK_DYNAMIC_STATE_PATCH_CONTROL_POINTS_EXT                 = 1000377000;
const VK_DYNAMIC_STATE_LOGIC_OP_EXT                             = 1000377003;
const VK_DYNAMIC_STATE_COLOR_WRITE_ENABLE_EXT                   = 1000381000;
const VK_DYNAMIC_STATE_DEPTH_CLAMP_ENABLE_EXT                   = 1000455003;
const VK_DYNAMIC_STATE_POLYGON_MODE_EXT                         = 1000455004;
const VK_DYNAMIC_STATE_RASTERIZATION_SAMPLES_EXT                = 1000455005;
const VK_DYNAMIC_STATE_SAMPLE_MASK_EXT                          = 1000455006;
const VK_DYNAMIC_STATE_ALPHA_TO_COVERAGE_ENABLE_EXT             = 1000455007;
const VK_DYNAMIC_STATE_ALPHA_TO_ONE_ENABLE_EXT                  = 1000455008;
const VK_DYNAMIC_STATE_LOGIC_OP_ENABLE_EXT                      = 1000455009;
const VK_DYNAMIC_STATE_COLOR_BLEND_ENABLE_EXT                   = 1000455010;
const VK_DYNAMIC_STATE_COLOR_BLEND_EQUATION_EXT                 = 1000455011;
const VK_DYNAMIC_STATE_COLOR_WRITE_MASK_EXT                     = 1000455012;
const VK_DYNAMIC_STATE_TESSELLATION_DOMAIN_ORIGIN_EXT           = 1000455002;
const VK_DYNAMIC_STATE_RASTERIZATION_STREAM_EXT                 = 1000455013;
const VK_DYNAMIC_STATE_CONSERVATIVE_RASTERIZATION_MODE_EXT      = 1000455014;
const VK_DYNAMIC_STATE_EXTRA_PRIMITIVE_OVERESTIMATION_SIZE_EXT  = 1000455015;
const VK_DYNAMIC_STATE_DEPTH_CLIP_ENABLE_EXT                    = 1000455016;
const VK_DYNAMIC_STATE_SAMPLE_LOCATIONS_ENABLE_EXT              = 1000455017;
const VK_DYNAMIC_STATE_COLOR_BLEND_ADVANCED_EXT                 = 1000455018;
const VK_DYNAMIC_STATE_PROVOKING_VERTEX_MODE_EXT                = 1000455019;
const VK_DYNAMIC_STATE_LINE_RASTERIZATION_MODE_EXT              = 1000455020;
const VK_DYNAMIC_STATE_LINE_STIPPLE_ENABLE_EXT                  = 1000455021;
const VK_DYNAMIC_STATE_DEPTH_CLIP_NEGATIVE_ONE_TO_ONE_EXT       = 1000455022;
const VK_DYNAMIC_STATE_VIEWPORT_W_SCALING_ENABLE_NV             = 1000455023;
const VK_DYNAMIC_STATE_VIEWPORT_SWIZZLE_NV                      = 1000455024;
const VK_DYNAMIC_STATE_COVERAGE_TO_COLOR_ENABLE_NV              = 1000455025;
const VK_DYNAMIC_STATE_COVERAGE_TO_COLOR_LOCATION_NV            = 1000455026;
const VK_DYNAMIC_STATE_COVERAGE_MODULATION_MODE_NV              = 1000455027;
const VK_DYNAMIC_STATE_COVERAGE_MODULATION_TABLE_ENABLE_NV      = 1000455028;
const VK_DYNAMIC_STATE_COVERAGE_MODULATION_TABLE_NV             = 1000455029;
const VK_DYNAMIC_STATE_SHADING_RATE_IMAGE_ENABLE_NV             = 1000455030;
const VK_DYNAMIC_STATE_REPRESENTATIVE_FRAGMENT_TEST_ENABLE_NV   = 1000455031;
const VK_DYNAMIC_STATE_COVERAGE_REDUCTION_MODE_NV               = 1000455032;
const VK_DYNAMIC_STATE_ATTACHMENT_FEEDBACK_LOOP_ENABLE_EXT      = 1000524000;
const VK_DYNAMIC_STATE_LINE_STIPPLE_KHR                         = 1000259000;
const VK_DYNAMIC_STATE_LINE_STIPPLE_EXT                         = VK_DYNAMIC_STATE_LINE_STIPPLE_KHR;
const VK_DYNAMIC_STATE_CULL_MODE_EXT                            = VK_DYNAMIC_STATE_CULL_MODE;
const VK_DYNAMIC_STATE_FRONT_FACE_EXT                           = VK_DYNAMIC_STATE_FRONT_FACE;
const VK_DYNAMIC_STATE_PRIMITIVE_TOPOLOGY_EXT                   = VK_DYNAMIC_STATE_PRIMITIVE_TOPOLOGY;
const VK_DYNAMIC_STATE_VIEWPORT_WITH_COUNT_EXT                  = VK_DYNAMIC_STATE_VIEWPORT_WITH_COUNT;
const VK_DYNAMIC_STATE_SCISSOR_WITH_COUNT_EXT                   = VK_DYNAMIC_STATE_SCISSOR_WITH_COUNT;
const VK_DYNAMIC_STATE_VERTEX_INPUT_BINDING_STRIDE_EXT          = VK_DYNAMIC_STATE_VERTEX_INPUT_BINDING_STRIDE;
const VK_DYNAMIC_STATE_DEPTH_TEST_ENABLE_EXT                    = VK_DYNAMIC_STATE_DEPTH_TEST_ENABLE;
const VK_DYNAMIC_STATE_DEPTH_WRITE_ENABLE_EXT                   = VK_DYNAMIC_STATE_DEPTH_WRITE_ENABLE;
const VK_DYNAMIC_STATE_DEPTH_COMPARE_OP_EXT                     = VK_DYNAMIC_STATE_DEPTH_COMPARE_OP;
const VK_DYNAMIC_STATE_DEPTH_BOUNDS_TEST_ENABLE_EXT             = VK_DYNAMIC_STATE_DEPTH_BOUNDS_TEST_ENABLE;
const VK_DYNAMIC_STATE_STENCIL_TEST_ENABLE_EXT                  = VK_DYNAMIC_STATE_STENCIL_TEST_ENABLE;
const VK_DYNAMIC_STATE_STENCIL_OP_EXT                           = VK_DYNAMIC_STATE_STENCIL_OP;
const VK_DYNAMIC_STATE_RASTERIZER_DISCARD_ENABLE_EXT            = VK_DYNAMIC_STATE_RASTERIZER_DISCARD_ENABLE;
const VK_DYNAMIC_STATE_DEPTH_BIAS_ENABLE_EXT                    = VK_DYNAMIC_STATE_DEPTH_BIAS_ENABLE;
const VK_DYNAMIC_STATE_PRIMITIVE_RESTART_ENABLE_EXT             = VK_DYNAMIC_STATE_PRIMITIVE_RESTART_ENABLE;
const VK_DYNAMIC_STATE_MAX_ENUM                                 = $7FFFFFFF;
//} VkDynamicState;

//typedef enum VkFrontFace {
type T_VkFrontFace = T_int32_t;  P_VkFrontFace = ^T_VkFrontFace;
const VK_FRONT_FACE_COUNTER_CLOCKWISE  = 0;
const VK_FRONT_FACE_CLOCKWISE          = 1;
const VK_FRONT_FACE_MAX_ENUM           = $7FFFFFFF;
//} VkFrontFace;

//typedef enum VkVertexInputRate {
type T_VkVertexInputRate = T_int32_t;  P_VkVertexInputRate = ^T_VkVertexInputRate;
const VK_VERTEX_INPUT_RATE_VERTEX    = 0;
const VK_VERTEX_INPUT_RATE_INSTANCE  = 1;
const VK_VERTEX_INPUT_RATE_MAX_ENUM  = $7FFFFFFF;
//} VkVertexInputRate;

//typedef enum VkPrimitiveTopology {
type T_VkPrimitiveTopology = T_int32_t;  P_VkPrimitiveTopology = ^T_VkPrimitiveTopology;
const VK_PRIMITIVE_TOPOLOGY_POINT_LIST                     = 0;
const VK_PRIMITIVE_TOPOLOGY_LINE_LIST                      = 1;
const VK_PRIMITIVE_TOPOLOGY_LINE_STRIP                     = 2;
const VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST                  = 3;
const VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP                 = 4;
const VK_PRIMITIVE_TOPOLOGY_TRIANGLE_FAN                   = 5;
const VK_PRIMITIVE_TOPOLOGY_LINE_LIST_WITH_ADJACENCY       = 6;
const VK_PRIMITIVE_TOPOLOGY_LINE_STRIP_WITH_ADJACENCY      = 7;
const VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST_WITH_ADJACENCY   = 8;
const VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP_WITH_ADJACENCY  = 9;
const VK_PRIMITIVE_TOPOLOGY_PATCH_LIST                     = 10;
const VK_PRIMITIVE_TOPOLOGY_MAX_ENUM                       = $7FFFFFFF;
//} VkPrimitiveTopology;

//typedef enum VkPolygonMode {
type T_VkPolygonMode = T_int32_t;  P_VkPolygonMode = ^T_VkPolygonMode;
const VK_POLYGON_MODE_FILL               = 0;
const VK_POLYGON_MODE_LINE               = 1;
const VK_POLYGON_MODE_POINT              = 2;
const VK_POLYGON_MODE_FILL_RECTANGLE_NV  = 1000153000;
const VK_POLYGON_MODE_MAX_ENUM           = $7FFFFFFF;
//} VkPolygonMode;

//typedef enum VkStencilOp {
type T_VkStencilOp = T_int32_t;  P_VkStencilOp = ^T_VkStencilOp;
const VK_STENCIL_OP_KEEP                 = 0;
const VK_STENCIL_OP_ZERO                 = 1;
const VK_STENCIL_OP_REPLACE              = 2;
const VK_STENCIL_OP_INCREMENT_AND_CLAMP  = 3;
const VK_STENCIL_OP_DECREMENT_AND_CLAMP  = 4;
const VK_STENCIL_OP_INVERT               = 5;
const VK_STENCIL_OP_INCREMENT_AND_WRAP   = 6;
const VK_STENCIL_OP_DECREMENT_AND_WRAP   = 7;
const VK_STENCIL_OP_MAX_ENUM             = $7FFFFFFF;
//} VkStencilOp;

//typedef enum VkLogicOp {
type T_VkLogicOp = T_int32_t;  P_VkLogicOp = ^T_VkLogicOp;
const VK_LOGIC_OP_CLEAR          = 0;
const VK_LOGIC_OP_AND            = 1;
const VK_LOGIC_OP_AND_REVERSE    = 2;
const VK_LOGIC_OP_COPY           = 3;
const VK_LOGIC_OP_AND_INVERTED   = 4;
const VK_LOGIC_OP_NO_OP          = 5;
const VK_LOGIC_OP_XOR            = 6;
const VK_LOGIC_OP_OR             = 7;
const VK_LOGIC_OP_NOR            = 8;
const VK_LOGIC_OP_EQUIVALENT     = 9;
const VK_LOGIC_OP_INVERT         = 10;
const VK_LOGIC_OP_OR_REVERSE     = 11;
const VK_LOGIC_OP_COPY_INVERTED  = 12;
const VK_LOGIC_OP_OR_INVERTED    = 13;
const VK_LOGIC_OP_NAND           = 14;
const VK_LOGIC_OP_SET            = 15;
const VK_LOGIC_OP_MAX_ENUM       = $7FFFFFFF;
//} VkLogicOp;

//typedef enum VkBorderColor {
type T_VkBorderColor = T_int32_t;  P_VkBorderColor = ^T_VkBorderColor;
const VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK  = 0;
const VK_BORDER_COLOR_INT_TRANSPARENT_BLACK    = 1;
const VK_BORDER_COLOR_FLOAT_OPAQUE_BLACK       = 2;
const VK_BORDER_COLOR_INT_OPAQUE_BLACK         = 3;
const VK_BORDER_COLOR_FLOAT_OPAQUE_WHITE       = 4;
const VK_BORDER_COLOR_INT_OPAQUE_WHITE         = 5;
const VK_BORDER_COLOR_FLOAT_CUSTOM_EXT         = 1000287003;
const VK_BORDER_COLOR_INT_CUSTOM_EXT           = 1000287004;
const VK_BORDER_COLOR_MAX_ENUM                 = $7FFFFFFF;
//} VkBorderColor;

//typedef enum VkFilter {
type T_VkFilter = T_int32_t;  P_VkFilter = ^T_VkFilter;
const VK_FILTER_NEAREST    = 0;
const VK_FILTER_LINEAR     = 1;
const VK_FILTER_CUBIC_EXT  = 1000015000;
const VK_FILTER_CUBIC_IMG  = VK_FILTER_CUBIC_EXT;
const VK_FILTER_MAX_ENUM   = $7FFFFFFF;
//} VkFilter;

//typedef enum VkSamplerAddressMode {
type T_VkSamplerAddressMode = T_int32_t;  P_VkSamplerAddressMode = ^T_VkSamplerAddressMode;
const VK_SAMPLER_ADDRESS_MODE_REPEAT                    = 0;
const VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT           = 1;
const VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE             = 2;
const VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_BORDER           = 3;
const VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE      = 4;
const VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE_KHR  = VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE;
const VK_SAMPLER_ADDRESS_MODE_MAX_ENUM                  = $7FFFFFFF;
//} VkSamplerAddressMode;

//typedef enum VkSamplerMipmapMode {
type T_VkSamplerMipmapMode = T_int32_t;  P_VkSamplerMipmapMode = ^T_VkSamplerMipmapMode;
const VK_SAMPLER_MIPMAP_MODE_NEAREST   = 0;
const VK_SAMPLER_MIPMAP_MODE_LINEAR    = 1;
const VK_SAMPLER_MIPMAP_MODE_MAX_ENUM  = $7FFFFFFF;
//} VkSamplerMipmapMode;

//typedef enum VkDescriptorType {
type T_VkDescriptorType = T_int32_t;  P_VkDescriptorType = ^T_VkDescriptorType;
const VK_DESCRIPTOR_TYPE_SAMPLER                     = 0;
const VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER      = 1;
const VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE               = 2;
const VK_DESCRIPTOR_TYPE_STORAGE_IMAGE               = 3;
const VK_DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER        = 4;
const VK_DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER        = 5;
const VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER              = 6;
const VK_DESCRIPTOR_TYPE_STORAGE_BUFFER              = 7;
const VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC      = 8;
const VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC      = 9;
const VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT            = 10;
const VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK        = 1000138000;
const VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_KHR  = 1000150000;
const VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_NV   = 1000165000;
const VK_DESCRIPTOR_TYPE_SAMPLE_WEIGHT_IMAGE_QCOM    = 1000440000;
const VK_DESCRIPTOR_TYPE_BLOCK_MATCH_IMAGE_QCOM      = 1000440001;
const VK_DESCRIPTOR_TYPE_MUTABLE_EXT                 = 1000351000;
const VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK_EXT    = VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK;
const VK_DESCRIPTOR_TYPE_MUTABLE_VALVE               = VK_DESCRIPTOR_TYPE_MUTABLE_EXT;
const VK_DESCRIPTOR_TYPE_MAX_ENUM                    = $7FFFFFFF;
//} VkDescriptorType;

//typedef enum VkAttachmentLoadOp {
type T_VkAttachmentLoadOp = T_int32_t;  P_VkAttachmentLoadOp = ^T_VkAttachmentLoadOp;
const VK_ATTACHMENT_LOAD_OP_LOAD       = 0;
const VK_ATTACHMENT_LOAD_OP_CLEAR      = 1;
const VK_ATTACHMENT_LOAD_OP_DONT_CARE  = 2;
const VK_ATTACHMENT_LOAD_OP_NONE_KHR   = 1000400000;
const VK_ATTACHMENT_LOAD_OP_NONE_EXT   = VK_ATTACHMENT_LOAD_OP_NONE_KHR;
const VK_ATTACHMENT_LOAD_OP_MAX_ENUM   = $7FFFFFFF;
//} VkAttachmentLoadOp;

//typedef enum VkAttachmentStoreOp {
type T_VkAttachmentStoreOp = T_int32_t;  P_VkAttachmentStoreOp = ^T_VkAttachmentStoreOp;
const VK_ATTACHMENT_STORE_OP_STORE      = 0;
const VK_ATTACHMENT_STORE_OP_DONT_CARE  = 1;
const VK_ATTACHMENT_STORE_OP_NONE       = 1000301000;
const VK_ATTACHMENT_STORE_OP_NONE_KHR   = VK_ATTACHMENT_STORE_OP_NONE;
const VK_ATTACHMENT_STORE_OP_NONE_QCOM  = VK_ATTACHMENT_STORE_OP_NONE;
const VK_ATTACHMENT_STORE_OP_NONE_EXT   = VK_ATTACHMENT_STORE_OP_NONE;
const VK_ATTACHMENT_STORE_OP_MAX_ENUM   = $7FFFFFFF;
//} VkAttachmentStoreOp;

//typedef enum VkPipelineBindPoint {
type T_VkPipelineBindPoint = T_int32_t;  P_VkPipelineBindPoint = ^T_VkPipelineBindPoint;
const VK_PIPELINE_BIND_POINT_GRAPHICS                = 0;
const VK_PIPELINE_BIND_POINT_COMPUTE                 = 1;
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_PIPELINE_BIND_POINT_EXECUTION_GRAPH_AMDX    = 1000134000;
//#endif
const VK_PIPELINE_BIND_POINT_RAY_TRACING_KHR         = 1000165000;
const VK_PIPELINE_BIND_POINT_SUBPASS_SHADING_HUAWEI  = 1000369003;
const VK_PIPELINE_BIND_POINT_RAY_TRACING_NV          = VK_PIPELINE_BIND_POINT_RAY_TRACING_KHR;
const VK_PIPELINE_BIND_POINT_MAX_ENUM                = $7FFFFFFF;
//} VkPipelineBindPoint;

//typedef enum VkCommandBufferLevel {
type T_VkCommandBufferLevel = T_int32_t;  P_VkCommandBufferLevel = ^T_VkCommandBufferLevel;
const VK_COMMAND_BUFFER_LEVEL_PRIMARY    = 0;
const VK_COMMAND_BUFFER_LEVEL_SECONDARY  = 1;
const VK_COMMAND_BUFFER_LEVEL_MAX_ENUM   = $7FFFFFFF;
//} VkCommandBufferLevel;

//typedef enum VkIndexType {
type T_VkIndexType = T_int32_t;  P_VkIndexType = ^T_VkIndexType;
const VK_INDEX_TYPE_UINT16     = 0;
const VK_INDEX_TYPE_UINT32     = 1;
const VK_INDEX_TYPE_NONE_KHR   = 1000165000;
const VK_INDEX_TYPE_UINT8_KHR  = 1000265000;
const VK_INDEX_TYPE_NONE_NV    = VK_INDEX_TYPE_NONE_KHR;
const VK_INDEX_TYPE_UINT8_EXT  = VK_INDEX_TYPE_UINT8_KHR;
const VK_INDEX_TYPE_MAX_ENUM   = $7FFFFFFF;
//} VkIndexType;


//typedef enum VkSubpassContents {
type T_VkSubpassContents = T_int32_t;  P_VkSubpassContents = ^T_VkSubpassContents;
const VK_SUBPASS_CONTENTS_INLINE                                    = 0;
const VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS                 = 1;
const VK_SUBPASS_CONTENTS_INLINE_AND_SECONDARY_COMMAND_BUFFERS_EXT  = 1000451000;
const VK_SUBPASS_CONTENTS_MAX_ENUM                                  = $7FFFFFFF;
//} VkSubpassContents;

//typedef enum VkAccessFlagBits {
type T_VkAccessFlagBits = T_int32_t;  P_VkAccessFlagBits = ^T_VkAccessFlagBits;
const VK_ACCESS_INDIRECT_COMMAND_READ_BIT                      = $00000001;
const VK_ACCESS_INDEX_READ_BIT                                 = $00000002;
const VK_ACCESS_VERTEX_ATTRIBUTE_READ_BIT                      = $00000004;
const VK_ACCESS_UNIFORM_READ_BIT                               = $00000008;
const VK_ACCESS_INPUT_ATTACHMENT_READ_BIT                      = $00000010;
const VK_ACCESS_SHADER_READ_BIT                                = $00000020;
const VK_ACCESS_SHADER_WRITE_BIT                               = $00000040;
const VK_ACCESS_COLOR_ATTACHMENT_READ_BIT                      = $00000080;
const VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT                     = $00000100;
const VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT              = $00000200;
const VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT             = $00000400;
const VK_ACCESS_TRANSFER_READ_BIT                              = $00000800;
const VK_ACCESS_TRANSFER_WRITE_BIT                             = $00001000;
const VK_ACCESS_HOST_READ_BIT                                  = $00002000;
const VK_ACCESS_HOST_WRITE_BIT                                 = $00004000;
const VK_ACCESS_MEMORY_READ_BIT                                = $00008000;
const VK_ACCESS_MEMORY_WRITE_BIT                               = $00010000;
const VK_ACCESS_NONE                                           = 0;
const VK_ACCESS_TRANSFORM_FEEDBACK_WRITE_BIT_EXT               = $02000000;
const VK_ACCESS_TRANSFORM_FEEDBACK_COUNTER_READ_BIT_EXT        = $04000000;
const VK_ACCESS_TRANSFORM_FEEDBACK_COUNTER_WRITE_BIT_EXT       = $08000000;
const VK_ACCESS_CONDITIONAL_RENDERING_READ_BIT_EXT             = $00100000;
const VK_ACCESS_COLOR_ATTACHMENT_READ_NONCOHERENT_BIT_EXT      = $00080000;
const VK_ACCESS_ACCELERATION_STRUCTURE_READ_BIT_KHR            = $00200000;
const VK_ACCESS_ACCELERATION_STRUCTURE_WRITE_BIT_KHR           = $00400000;
const VK_ACCESS_FRAGMENT_DENSITY_MAP_READ_BIT_EXT              = $01000000;
const VK_ACCESS_FRAGMENT_SHADING_RATE_ATTACHMENT_READ_BIT_KHR  = $00800000;
const VK_ACCESS_COMMAND_PREPROCESS_READ_BIT_NV                 = $00020000;
const VK_ACCESS_COMMAND_PREPROCESS_WRITE_BIT_NV                = $00040000;
const VK_ACCESS_SHADING_RATE_IMAGE_READ_BIT_NV                 = VK_ACCESS_FRAGMENT_SHADING_RATE_ATTACHMENT_READ_BIT_KHR;
const VK_ACCESS_ACCELERATION_STRUCTURE_READ_BIT_NV             = VK_ACCESS_ACCELERATION_STRUCTURE_READ_BIT_KHR;
const VK_ACCESS_ACCELERATION_STRUCTURE_WRITE_BIT_NV            = VK_ACCESS_ACCELERATION_STRUCTURE_WRITE_BIT_KHR;
const VK_ACCESS_NONE_KHR                                       = VK_ACCESS_NONE;
const VK_ACCESS_FLAG_BITS_MAX_ENUM                             = $7FFFFFFF;
//} VkAccessFlagBits;
type T_VkAccessFlags = T_VkFlags;  P_VkAccessFlags = ^T_VkAccessFlags;

//typedef enum VkImageAspectFlagBits {
type T_VkImageAspectFlagBits = T_int32_t;  P_VkImageAspectFlagBits = ^T_VkImageAspectFlagBits;
const VK_IMAGE_ASPECT_COLOR_BIT               = $00000001;
const VK_IMAGE_ASPECT_DEPTH_BIT               = $00000002;
const VK_IMAGE_ASPECT_STENCIL_BIT             = $00000004;
const VK_IMAGE_ASPECT_METADATA_BIT            = $00000008;
const VK_IMAGE_ASPECT_PLANE_0_BIT             = $00000010;
const VK_IMAGE_ASPECT_PLANE_1_BIT             = $00000020;
const VK_IMAGE_ASPECT_PLANE_2_BIT             = $00000040;
const VK_IMAGE_ASPECT_NONE                    = 0;
const VK_IMAGE_ASPECT_MEMORY_PLANE_0_BIT_EXT  = $00000080;
const VK_IMAGE_ASPECT_MEMORY_PLANE_1_BIT_EXT  = $00000100;
const VK_IMAGE_ASPECT_MEMORY_PLANE_2_BIT_EXT  = $00000200;
const VK_IMAGE_ASPECT_MEMORY_PLANE_3_BIT_EXT  = $00000400;
const VK_IMAGE_ASPECT_PLANE_0_BIT_KHR         = VK_IMAGE_ASPECT_PLANE_0_BIT;
const VK_IMAGE_ASPECT_PLANE_1_BIT_KHR         = VK_IMAGE_ASPECT_PLANE_1_BIT;
const VK_IMAGE_ASPECT_PLANE_2_BIT_KHR         = VK_IMAGE_ASPECT_PLANE_2_BIT;
const VK_IMAGE_ASPECT_NONE_KHR                = VK_IMAGE_ASPECT_NONE;
const VK_IMAGE_ASPECT_FLAG_BITS_MAX_ENUM      = $7FFFFFFF;
//} VkImageAspectFlagBits;
type T_VkImageAspectFlags = T_VkFlags;  P_VkImageAspectFlags = ^T_VkImageAspectFlags;

//typedef enum VkFormatFeatureFlagBits {
type T_VkFormatFeatureFlagBits = T_int32_t;  P_VkFormatFeatureFlagBits = ^T_VkFormatFeatureFlagBits;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT                                                                = $00000001;
const VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT                                                                = $00000002;
const VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT                                                         = $00000004;
const VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT                                                         = $00000008;
const VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT                                                         = $00000010;
const VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT                                                  = $00000020;
const VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT                                                                = $00000040;
const VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT                                                             = $00000080;
const VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT                                                       = $00000100;
const VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT                                                     = $00000200;
const VK_FORMAT_FEATURE_BLIT_SRC_BIT                                                                     = $00000400;
const VK_FORMAT_FEATURE_BLIT_DST_BIT                                                                     = $00000800;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT                                                  = $00001000;
const VK_FORMAT_FEATURE_TRANSFER_SRC_BIT                                                                 = $00004000;
const VK_FORMAT_FEATURE_TRANSFER_DST_BIT                                                                 = $00008000;
const VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT                                                      = $00020000;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT                                 = $00040000;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT                = $00080000;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT                = $00100000;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT      = $00200000;
const VK_FORMAT_FEATURE_DISJOINT_BIT                                                                     = $00400000;
const VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT                                                       = $00800000;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT                                                  = $00010000;
const VK_FORMAT_FEATURE_VIDEO_DECODE_OUTPUT_BIT_KHR                                                      = $02000000;
const VK_FORMAT_FEATURE_VIDEO_DECODE_DPB_BIT_KHR                                                         = $04000000;
const VK_FORMAT_FEATURE_ACCELERATION_STRUCTURE_VERTEX_BUFFER_BIT_KHR                                     = $20000000;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_EXT                                               = $00002000;
const VK_FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT                                                     = $01000000;
const VK_FORMAT_FEATURE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR                                         = $40000000;
const VK_FORMAT_FEATURE_VIDEO_ENCODE_INPUT_BIT_KHR                                                       = $08000000;
const VK_FORMAT_FEATURE_VIDEO_ENCODE_DPB_BIT_KHR                                                         = $10000000;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG                                               = VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_EXT;
const VK_FORMAT_FEATURE_TRANSFER_SRC_BIT_KHR                                                             = VK_FORMAT_FEATURE_TRANSFER_SRC_BIT;
const VK_FORMAT_FEATURE_TRANSFER_DST_BIT_KHR                                                             = VK_FORMAT_FEATURE_TRANSFER_DST_BIT;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT_EXT                                              = VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT;
const VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT_KHR                                                  = VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT_KHR                             = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT_KHR            = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT_KHR            = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT;
const VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT_KHR  = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT;
const VK_FORMAT_FEATURE_DISJOINT_BIT_KHR                                                                 = VK_FORMAT_FEATURE_DISJOINT_BIT;
const VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT_KHR                                                   = VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT;
const VK_FORMAT_FEATURE_FLAG_BITS_MAX_ENUM                                                               = $7FFFFFFF;
//} VkFormatFeatureFlagBits;
type T_VkFormatFeatureFlags = T_VkFlags;  P_VkFormatFeatureFlags = ^T_VkFormatFeatureFlags;

//typedef enum VkImageCreateFlagBits {
type T_VkImageCreateFlagBits = T_int32_t;  P_VkImageCreateFlagBits = ^T_VkImageCreateFlagBits;
const VK_IMAGE_CREATE_SPARSE_BINDING_BIT                             = $00000001;
const VK_IMAGE_CREATE_SPARSE_RESIDENCY_BIT                           = $00000002;
const VK_IMAGE_CREATE_SPARSE_ALIASED_BIT                             = $00000004;
const VK_IMAGE_CREATE_MUTABLE_FORMAT_BIT                             = $00000008;
const VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT                            = $00000010;
const VK_IMAGE_CREATE_ALIAS_BIT                                      = $00000400;
const VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT                = $00000040;
const VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT                        = $00000020;
const VK_IMAGE_CREATE_BLOCK_TEXEL_VIEW_COMPATIBLE_BIT                = $00000080;
const VK_IMAGE_CREATE_EXTENDED_USAGE_BIT                             = $00000100;
const VK_IMAGE_CREATE_PROTECTED_BIT                                  = $00000800;
const VK_IMAGE_CREATE_DISJOINT_BIT                                   = $00000200;
const VK_IMAGE_CREATE_CORNER_SAMPLED_BIT_NV                          = $00002000;
const VK_IMAGE_CREATE_SAMPLE_LOCATIONS_COMPATIBLE_DEPTH_BIT_EXT      = $00001000;
const VK_IMAGE_CREATE_SUBSAMPLED_BIT_EXT                             = $00004000;
const VK_IMAGE_CREATE_DESCRIPTOR_BUFFER_CAPTURE_REPLAY_BIT_EXT       = $00010000;
const VK_IMAGE_CREATE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_BIT_EXT  = $00040000;
const VK_IMAGE_CREATE_2D_VIEW_COMPATIBLE_BIT_EXT                     = $00020000;
const VK_IMAGE_CREATE_FRAGMENT_DENSITY_MAP_OFFSET_BIT_QCOM           = $00008000;
const VK_IMAGE_CREATE_VIDEO_PROFILE_INDEPENDENT_BIT_KHR              = $00100000;
const VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR            = VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT;
const VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT_KHR                    = VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT;
const VK_IMAGE_CREATE_BLOCK_TEXEL_VIEW_COMPATIBLE_BIT_KHR            = VK_IMAGE_CREATE_BLOCK_TEXEL_VIEW_COMPATIBLE_BIT;
const VK_IMAGE_CREATE_EXTENDED_USAGE_BIT_KHR                         = VK_IMAGE_CREATE_EXTENDED_USAGE_BIT;
const VK_IMAGE_CREATE_DISJOINT_BIT_KHR                               = VK_IMAGE_CREATE_DISJOINT_BIT;
const VK_IMAGE_CREATE_ALIAS_BIT_KHR                                  = VK_IMAGE_CREATE_ALIAS_BIT;
const VK_IMAGE_CREATE_FLAG_BITS_MAX_ENUM                             = $7FFFFFFF;
//} VkImageCreateFlagBits;
type T_VkImageCreateFlags = T_VkFlags;  P_VkImageCreateFlags = ^T_VkImageCreateFlags;

//typedef enum VkSampleCountFlagBits {
type T_VkSampleCountFlagBits = T_int32_t;  P_VkSampleCountFlagBits = ^T_VkSampleCountFlagBits;
const VK_SAMPLE_COUNT_1_BIT               = $00000001;
const VK_SAMPLE_COUNT_2_BIT               = $00000002;
const VK_SAMPLE_COUNT_4_BIT               = $00000004;
const VK_SAMPLE_COUNT_8_BIT               = $00000008;
const VK_SAMPLE_COUNT_16_BIT              = $00000010;
const VK_SAMPLE_COUNT_32_BIT              = $00000020;
const VK_SAMPLE_COUNT_64_BIT              = $00000040;
const VK_SAMPLE_COUNT_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkSampleCountFlagBits;
type T_VkSampleCountFlags = T_VkFlags;  P_VkSampleCountFlags = ^T_VkSampleCountFlags;

//typedef enum VkImageUsageFlagBits {
type T_VkImageUsageFlagBits = T_int32_t;  P_VkImageUsageFlagBits = ^T_VkImageUsageFlagBits;
const VK_IMAGE_USAGE_TRANSFER_SRC_BIT                          = $00000001;
const VK_IMAGE_USAGE_TRANSFER_DST_BIT                          = $00000002;
const VK_IMAGE_USAGE_SAMPLED_BIT                               = $00000004;
const VK_IMAGE_USAGE_STORAGE_BIT                               = $00000008;
const VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT                      = $00000010;
const VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT              = $00000020;
const VK_IMAGE_USAGE_TRANSIENT_ATTACHMENT_BIT                  = $00000040;
const VK_IMAGE_USAGE_INPUT_ATTACHMENT_BIT                      = $00000080;
const VK_IMAGE_USAGE_VIDEO_DECODE_DST_BIT_KHR                  = $00000400;
const VK_IMAGE_USAGE_VIDEO_DECODE_SRC_BIT_KHR                  = $00000800;
const VK_IMAGE_USAGE_VIDEO_DECODE_DPB_BIT_KHR                  = $00001000;
const VK_IMAGE_USAGE_FRAGMENT_DENSITY_MAP_BIT_EXT              = $00000200;
const VK_IMAGE_USAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR  = $00000100;
const VK_IMAGE_USAGE_HOST_TRANSFER_BIT_EXT                     = $00400000;
const VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR                  = $00002000;
const VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR                  = $00004000;
const VK_IMAGE_USAGE_VIDEO_ENCODE_DPB_BIT_KHR                  = $00008000;
const VK_IMAGE_USAGE_ATTACHMENT_FEEDBACK_LOOP_BIT_EXT          = $00080000;
const VK_IMAGE_USAGE_INVOCATION_MASK_BIT_HUAWEI                = $00040000;
const VK_IMAGE_USAGE_SAMPLE_WEIGHT_BIT_QCOM                    = $00100000;
const VK_IMAGE_USAGE_SAMPLE_BLOCK_MATCH_BIT_QCOM               = $00200000;
const VK_IMAGE_USAGE_SHADING_RATE_IMAGE_BIT_NV                 = VK_IMAGE_USAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR;
const VK_IMAGE_USAGE_FLAG_BITS_MAX_ENUM                        = $7FFFFFFF;
//} VkImageUsageFlagBits;
type T_VkImageUsageFlags = T_VkFlags;  P_VkImageUsageFlags = ^T_VkImageUsageFlags;

//typedef enum VkInstanceCreateFlagBits {
type T_VkInstanceCreateFlagBits = T_int32_t;  P_VkInstanceCreateFlagBits = ^T_VkInstanceCreateFlagBits;
const VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR  = $00000001;
const VK_INSTANCE_CREATE_FLAG_BITS_MAX_ENUM             = $7FFFFFFF;
//} VkInstanceCreateFlagBits;
type T_VkInstanceCreateFlags = T_VkFlags;  P_VkInstanceCreateFlags = ^T_VkInstanceCreateFlags;

//typedef enum VkMemoryHeapFlagBits {
type T_VkMemoryHeapFlagBits = T_int32_t;  P_VkMemoryHeapFlagBits = ^T_VkMemoryHeapFlagBits;
const VK_MEMORY_HEAP_DEVICE_LOCAL_BIT        = $00000001;
const VK_MEMORY_HEAP_MULTI_INSTANCE_BIT      = $00000002;
const VK_MEMORY_HEAP_MULTI_INSTANCE_BIT_KHR  = VK_MEMORY_HEAP_MULTI_INSTANCE_BIT;
const VK_MEMORY_HEAP_FLAG_BITS_MAX_ENUM      = $7FFFFFFF;
//} VkMemoryHeapFlagBits;
type T_VkMemoryHeapFlags = T_VkFlags;  P_VkMemoryHeapFlags = ^T_VkMemoryHeapFlags;

//typedef enum VkMemoryPropertyFlagBits {
type T_VkMemoryPropertyFlagBits = T_int32_t;  P_VkMemoryPropertyFlagBits = ^T_VkMemoryPropertyFlagBits;
const VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT         = $00000001;
const VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT         = $00000002;
const VK_MEMORY_PROPERTY_HOST_COHERENT_BIT        = $00000004;
const VK_MEMORY_PROPERTY_HOST_CACHED_BIT          = $00000008;
const VK_MEMORY_PROPERTY_LAZILY_ALLOCATED_BIT     = $00000010;
const VK_MEMORY_PROPERTY_PROTECTED_BIT            = $00000020;
const VK_MEMORY_PROPERTY_DEVICE_COHERENT_BIT_AMD  = $00000040;
const VK_MEMORY_PROPERTY_DEVICE_UNCACHED_BIT_AMD  = $00000080;
const VK_MEMORY_PROPERTY_RDMA_CAPABLE_BIT_NV      = $00000100;
const VK_MEMORY_PROPERTY_FLAG_BITS_MAX_ENUM       = $7FFFFFFF;
//} VkMemoryPropertyFlagBits;
type T_VkMemoryPropertyFlags = T_VkFlags;  P_VkMemoryPropertyFlags = ^T_VkMemoryPropertyFlags;

//typedef enum VkQueueFlagBits {
type T_VkQueueFlagBits = T_int32_t;  P_VkQueueFlagBits = ^T_VkQueueFlagBits;
const VK_QUEUE_GRAPHICS_BIT          = $00000001;
const VK_QUEUE_COMPUTE_BIT           = $00000002;
const VK_QUEUE_TRANSFER_BIT          = $00000004;
const VK_QUEUE_SPARSE_BINDING_BIT    = $00000008;
const VK_QUEUE_PROTECTED_BIT         = $00000010;
const VK_QUEUE_VIDEO_DECODE_BIT_KHR  = $00000020;
const VK_QUEUE_VIDEO_ENCODE_BIT_KHR  = $00000040;
const VK_QUEUE_OPTICAL_FLOW_BIT_NV   = $00000100;
const VK_QUEUE_FLAG_BITS_MAX_ENUM    = $7FFFFFFF;
//} VkQueueFlagBits;
type T_VkQueueFlags = T_VkFlags;  P_VkQueueFlags = ^T_VkQueueFlags;
type T_VkDeviceCreateFlags = T_VkFlags;  P_VkDeviceCreateFlags = ^T_VkDeviceCreateFlags;

//typedef enum VkDeviceQueueCreateFlagBits {
type T_VkDeviceQueueCreateFlagBits = T_int32_t;  P_VkDeviceQueueCreateFlagBits = ^T_VkDeviceQueueCreateFlagBits;
const VK_DEVICE_QUEUE_CREATE_PROTECTED_BIT       = $00000001;
const VK_DEVICE_QUEUE_CREATE_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkDeviceQueueCreateFlagBits;
type T_VkDeviceQueueCreateFlags = T_VkFlags;  P_VkDeviceQueueCreateFlags = ^T_VkDeviceQueueCreateFlags;

//typedef enum VkPipelineStageFlagBits {
type T_VkPipelineStageFlagBits = T_int32_t;  P_VkPipelineStageFlagBits = ^T_VkPipelineStageFlagBits;
const VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT                           = $00000001;
const VK_PIPELINE_STAGE_DRAW_INDIRECT_BIT                         = $00000002;
const VK_PIPELINE_STAGE_VERTEX_INPUT_BIT                          = $00000004;
const VK_PIPELINE_STAGE_VERTEX_SHADER_BIT                         = $00000008;
const VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT           = $00000010;
const VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT        = $00000020;
const VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT                       = $00000040;
const VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT                       = $00000080;
const VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT                  = $00000100;
const VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT                   = $00000200;
const VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT               = $00000400;
const VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT                        = $00000800;
const VK_PIPELINE_STAGE_TRANSFER_BIT                              = $00001000;
const VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT                        = $00002000;
const VK_PIPELINE_STAGE_HOST_BIT                                  = $00004000;
const VK_PIPELINE_STAGE_ALL_GRAPHICS_BIT                          = $00008000;
const VK_PIPELINE_STAGE_ALL_COMMANDS_BIT                          = $00010000;
const VK_PIPELINE_STAGE_NONE                                      = 0;
const VK_PIPELINE_STAGE_TRANSFORM_FEEDBACK_BIT_EXT                = $01000000;
const VK_PIPELINE_STAGE_CONDITIONAL_RENDERING_BIT_EXT             = $00040000;
const VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_KHR      = $02000000;
const VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_KHR                = $00200000;
const VK_PIPELINE_STAGE_FRAGMENT_DENSITY_PROCESS_BIT_EXT          = $00800000;
const VK_PIPELINE_STAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR  = $00400000;
const VK_PIPELINE_STAGE_COMMAND_PREPROCESS_BIT_NV                 = $00020000;
const VK_PIPELINE_STAGE_TASK_SHADER_BIT_EXT                       = $00080000;
const VK_PIPELINE_STAGE_MESH_SHADER_BIT_EXT                       = $00100000;
const VK_PIPELINE_STAGE_SHADING_RATE_IMAGE_BIT_NV                 = VK_PIPELINE_STAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR;
const VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_NV                 = VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_KHR;
const VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_NV       = VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_KHR;
const VK_PIPELINE_STAGE_TASK_SHADER_BIT_NV                        = VK_PIPELINE_STAGE_TASK_SHADER_BIT_EXT;
const VK_PIPELINE_STAGE_MESH_SHADER_BIT_NV                        = VK_PIPELINE_STAGE_MESH_SHADER_BIT_EXT;
const VK_PIPELINE_STAGE_NONE_KHR                                  = VK_PIPELINE_STAGE_NONE;
const VK_PIPELINE_STAGE_FLAG_BITS_MAX_ENUM                        = $7FFFFFFF;
//} VkPipelineStageFlagBits;
type T_VkPipelineStageFlags = T_VkFlags;  P_VkPipelineStageFlags = ^T_VkPipelineStageFlags;

//typedef enum VkMemoryMapFlagBits {
type T_VkMemoryMapFlagBits = T_int32_t;  P_VkMemoryMapFlagBits = ^T_VkMemoryMapFlagBits;
const VK_MEMORY_MAP_PLACED_BIT_EXT      = $00000001;
const VK_MEMORY_MAP_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkMemoryMapFlagBits;
type T_VkMemoryMapFlags = T_VkFlags;  P_VkMemoryMapFlags = ^T_VkMemoryMapFlags;

//typedef enum VkSparseMemoryBindFlagBits {
type T_VkSparseMemoryBindFlagBits = T_int32_t;  P_VkSparseMemoryBindFlagBits = ^T_VkSparseMemoryBindFlagBits;
const VK_SPARSE_MEMORY_BIND_METADATA_BIT        = $00000001;
const VK_SPARSE_MEMORY_BIND_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkSparseMemoryBindFlagBits;
type T_VkSparseMemoryBindFlags = T_VkFlags;  P_VkSparseMemoryBindFlags = ^T_VkSparseMemoryBindFlags;

//typedef enum VkSparseImageFormatFlagBits {
type T_VkSparseImageFormatFlagBits = T_int32_t;  P_VkSparseImageFormatFlagBits = ^T_VkSparseImageFormatFlagBits;
const VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT          = $00000001;
const VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT        = $00000002;
const VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT  = $00000004;
const VK_SPARSE_IMAGE_FORMAT_FLAG_BITS_MAX_ENUM          = $7FFFFFFF;
//} VkSparseImageFormatFlagBits;
type T_VkSparseImageFormatFlags = T_VkFlags;  P_VkSparseImageFormatFlags = ^T_VkSparseImageFormatFlags;

//typedef enum VkFenceCreateFlagBits {
type T_VkFenceCreateFlagBits = T_int32_t;  P_VkFenceCreateFlagBits = ^T_VkFenceCreateFlagBits;
const VK_FENCE_CREATE_SIGNALED_BIT        = $00000001;
const VK_FENCE_CREATE_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkFenceCreateFlagBits;
type T_VkFenceCreateFlags = T_VkFlags;  P_VkFenceCreateFlags = ^T_VkFenceCreateFlags;
type T_VkSemaphoreCreateFlags = T_VkFlags;  P_VkSemaphoreCreateFlags = ^T_VkSemaphoreCreateFlags;

//typedef enum VkEventCreateFlagBits {
type T_VkEventCreateFlagBits = T_int32_t;  P_VkEventCreateFlagBits = ^T_VkEventCreateFlagBits;
const VK_EVENT_CREATE_DEVICE_ONLY_BIT      = $00000001;
const VK_EVENT_CREATE_DEVICE_ONLY_BIT_KHR  = VK_EVENT_CREATE_DEVICE_ONLY_BIT;
const VK_EVENT_CREATE_FLAG_BITS_MAX_ENUM   = $7FFFFFFF;
//} VkEventCreateFlagBits;
type T_VkEventCreateFlags = T_VkFlags;  P_VkEventCreateFlags = ^T_VkEventCreateFlags;

//typedef enum VkQueryPipelineStatisticFlagBits {
type T_VkQueryPipelineStatisticFlagBits = T_int32_t;  P_VkQueryPipelineStatisticFlagBits = ^T_VkQueryPipelineStatisticFlagBits;
const VK_QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_VERTICES_BIT                     = $00000001;
const VK_QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_PRIMITIVES_BIT                   = $00000002;
const VK_QUERY_PIPELINE_STATISTIC_VERTEX_SHADER_INVOCATIONS_BIT                   = $00000004;
const VK_QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_INVOCATIONS_BIT                 = $00000008;
const VK_QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_PRIMITIVES_BIT                  = $00000010;
const VK_QUERY_PIPELINE_STATISTIC_CLIPPING_INVOCATIONS_BIT                        = $00000020;
const VK_QUERY_PIPELINE_STATISTIC_CLIPPING_PRIMITIVES_BIT                         = $00000040;
const VK_QUERY_PIPELINE_STATISTIC_FRAGMENT_SHADER_INVOCATIONS_BIT                 = $00000080;
const VK_QUERY_PIPELINE_STATISTIC_TESSELLATION_CONTROL_SHADER_PATCHES_BIT         = $00000100;
const VK_QUERY_PIPELINE_STATISTIC_TESSELLATION_EVALUATION_SHADER_INVOCATIONS_BIT  = $00000200;
const VK_QUERY_PIPELINE_STATISTIC_COMPUTE_SHADER_INVOCATIONS_BIT                  = $00000400;
const VK_QUERY_PIPELINE_STATISTIC_TASK_SHADER_INVOCATIONS_BIT_EXT                 = $00000800;
const VK_QUERY_PIPELINE_STATISTIC_MESH_SHADER_INVOCATIONS_BIT_EXT                 = $00001000;
const VK_QUERY_PIPELINE_STATISTIC_CLUSTER_CULLING_SHADER_INVOCATIONS_BIT_HUAWEI   = $00002000;
const VK_QUERY_PIPELINE_STATISTIC_FLAG_BITS_MAX_ENUM                              = $7FFFFFFF;
//} VkQueryPipelineStatisticFlagBits;
type T_VkQueryPipelineStatisticFlags = T_VkFlags;  P_VkQueryPipelineStatisticFlags = ^T_VkQueryPipelineStatisticFlags;
type T_VkQueryPoolCreateFlags = T_VkFlags;  P_VkQueryPoolCreateFlags = ^T_VkQueryPoolCreateFlags;

//typedef enum VkQueryResultFlagBits {
type T_VkQueryResultFlagBits = T_int32_t;  P_VkQueryResultFlagBits = ^T_VkQueryResultFlagBits;
const VK_QUERY_RESULT_64_BIT                 = $00000001;
const VK_QUERY_RESULT_WAIT_BIT               = $00000002;
const VK_QUERY_RESULT_WITH_AVAILABILITY_BIT  = $00000004;
const VK_QUERY_RESULT_PARTIAL_BIT            = $00000008;
const VK_QUERY_RESULT_WITH_STATUS_BIT_KHR    = $00000010;
const VK_QUERY_RESULT_FLAG_BITS_MAX_ENUM     = $7FFFFFFF;
//} VkQueryResultFlagBits;
type T_VkQueryResultFlags = T_VkFlags;  P_VkQueryResultFlags = ^T_VkQueryResultFlags;

//typedef enum VkBufferCreateFlagBits {
type T_VkBufferCreateFlagBits = T_int32_t;  P_VkBufferCreateFlagBits = ^T_VkBufferCreateFlagBits;
const VK_BUFFER_CREATE_SPARSE_BINDING_BIT                        = $00000001;
const VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT                      = $00000002;
const VK_BUFFER_CREATE_SPARSE_ALIASED_BIT                        = $00000004;
const VK_BUFFER_CREATE_PROTECTED_BIT                             = $00000008;
const VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT         = $00000010;
const VK_BUFFER_CREATE_DESCRIPTOR_BUFFER_CAPTURE_REPLAY_BIT_EXT  = $00000020;
const VK_BUFFER_CREATE_VIDEO_PROFILE_INDEPENDENT_BIT_KHR         = $00000040;
const VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_EXT     = VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT;
const VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR     = VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT;
const VK_BUFFER_CREATE_FLAG_BITS_MAX_ENUM                        = $7FFFFFFF;
//} VkBufferCreateFlagBits;
type T_VkBufferCreateFlags = T_VkFlags;  P_VkBufferCreateFlags = ^T_VkBufferCreateFlags;

//typedef enum VkBufferUsageFlagBits {
type T_VkBufferUsageFlagBits = T_int32_t;  P_VkBufferUsageFlagBits = ^T_VkBufferUsageFlagBits;
const VK_BUFFER_USAGE_TRANSFER_SRC_BIT                                      = $00000001;
const VK_BUFFER_USAGE_TRANSFER_DST_BIT                                      = $00000002;
const VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT                              = $00000004;
const VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT                              = $00000008;
const VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT                                    = $00000010;
const VK_BUFFER_USAGE_STORAGE_BUFFER_BIT                                    = $00000020;
const VK_BUFFER_USAGE_INDEX_BUFFER_BIT                                      = $00000040;
const VK_BUFFER_USAGE_VERTEX_BUFFER_BIT                                     = $00000080;
const VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT                                   = $00000100;
const VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT                             = $00020000;
const VK_BUFFER_USAGE_VIDEO_DECODE_SRC_BIT_KHR                              = $00002000;
const VK_BUFFER_USAGE_VIDEO_DECODE_DST_BIT_KHR                              = $00004000;
const VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_BUFFER_BIT_EXT                     = $00000800;
const VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_COUNTER_BUFFER_BIT_EXT             = $00001000;
const VK_BUFFER_USAGE_CONDITIONAL_RENDERING_BIT_EXT                         = $00000200;
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_BUFFER_USAGE_EXECUTION_GRAPH_SCRATCH_BIT_AMDX                      = $02000000;
//#endif
const VK_BUFFER_USAGE_ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY_BIT_KHR  = $00080000;
const VK_BUFFER_USAGE_ACCELERATION_STRUCTURE_STORAGE_BIT_KHR                = $00100000;
const VK_BUFFER_USAGE_SHADER_BINDING_TABLE_BIT_KHR                          = $00000400;
const VK_BUFFER_USAGE_VIDEO_ENCODE_DST_BIT_KHR                              = $00008000;
const VK_BUFFER_USAGE_VIDEO_ENCODE_SRC_BIT_KHR                              = $00010000;
const VK_BUFFER_USAGE_SAMPLER_DESCRIPTOR_BUFFER_BIT_EXT                     = $00200000;
const VK_BUFFER_USAGE_RESOURCE_DESCRIPTOR_BUFFER_BIT_EXT                    = $00400000;
const VK_BUFFER_USAGE_PUSH_DESCRIPTORS_DESCRIPTOR_BUFFER_BIT_EXT            = $04000000;
const VK_BUFFER_USAGE_MICROMAP_BUILD_INPUT_READ_ONLY_BIT_EXT                = $00800000;
const VK_BUFFER_USAGE_MICROMAP_STORAGE_BIT_EXT                              = $01000000;
const VK_BUFFER_USAGE_RAY_TRACING_BIT_NV                                    = VK_BUFFER_USAGE_SHADER_BINDING_TABLE_BIT_KHR;
const VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT_EXT                         = VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT;
const VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT_KHR                         = VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT;
const VK_BUFFER_USAGE_FLAG_BITS_MAX_ENUM                                    = $7FFFFFFF;
//} VkBufferUsageFlagBits;
type T_VkBufferUsageFlags = T_VkFlags;  P_VkBufferUsageFlags = ^T_VkBufferUsageFlags;
type T_VkBufferViewCreateFlags = T_VkFlags;  P_VkBufferViewCreateFlags = ^T_VkBufferViewCreateFlags;

//typedef enum VkImageViewCreateFlagBits {
type T_VkImageViewCreateFlagBits = T_int32_t;  P_VkImageViewCreateFlagBits = ^T_VkImageViewCreateFlagBits;
const VK_IMAGE_VIEW_CREATE_FRAGMENT_DENSITY_MAP_DYNAMIC_BIT_EXT      = $00000001;
const VK_IMAGE_VIEW_CREATE_DESCRIPTOR_BUFFER_CAPTURE_REPLAY_BIT_EXT  = $00000004;
const VK_IMAGE_VIEW_CREATE_FRAGMENT_DENSITY_MAP_DEFERRED_BIT_EXT     = $00000002;
const VK_IMAGE_VIEW_CREATE_FLAG_BITS_MAX_ENUM                        = $7FFFFFFF;
//} VkImageViewCreateFlagBits;
type T_VkImageViewCreateFlags = T_VkFlags;  P_VkImageViewCreateFlags = ^T_VkImageViewCreateFlags;
type T_VkShaderModuleCreateFlags = T_VkFlags;  P_VkShaderModuleCreateFlags = ^T_VkShaderModuleCreateFlags;

//typedef enum VkPipelineCacheCreateFlagBits {
type T_VkPipelineCacheCreateFlagBits = T_int32_t;  P_VkPipelineCacheCreateFlagBits = ^T_VkPipelineCacheCreateFlagBits;
const VK_PIPELINE_CACHE_CREATE_EXTERNALLY_SYNCHRONIZED_BIT      = $00000001;
const VK_PIPELINE_CACHE_CREATE_EXTERNALLY_SYNCHRONIZED_BIT_EXT  = VK_PIPELINE_CACHE_CREATE_EXTERNALLY_SYNCHRONIZED_BIT;
const VK_PIPELINE_CACHE_CREATE_FLAG_BITS_MAX_ENUM               = $7FFFFFFF;
//} VkPipelineCacheCreateFlagBits;
type T_VkPipelineCacheCreateFlags = T_VkFlags;  P_VkPipelineCacheCreateFlags = ^T_VkPipelineCacheCreateFlags;

//typedef enum VkColorComponentFlagBits {
type T_VkColorComponentFlagBits = T_int32_t;  P_VkColorComponentFlagBits = ^T_VkColorComponentFlagBits;
const VK_COLOR_COMPONENT_R_BIT               = $00000001;
const VK_COLOR_COMPONENT_G_BIT               = $00000002;
const VK_COLOR_COMPONENT_B_BIT               = $00000004;
const VK_COLOR_COMPONENT_A_BIT               = $00000008;
const VK_COLOR_COMPONENT_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkColorComponentFlagBits;
type T_VkColorComponentFlags = T_VkFlags;  P_VkColorComponentFlags = ^T_VkColorComponentFlags;

//typedef enum VkPipelineCreateFlagBits {
type T_VkPipelineCreateFlagBits = T_int32_t;  P_VkPipelineCreateFlagBits = ^T_VkPipelineCreateFlagBits;
const VK_PIPELINE_CREATE_DISABLE_OPTIMIZATION_BIT                                      = $00000001;
const VK_PIPELINE_CREATE_ALLOW_DERIVATIVES_BIT                                         = $00000002;
const VK_PIPELINE_CREATE_DERIVATIVE_BIT                                                = $00000004;
const VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT                              = $00000008;
const VK_PIPELINE_CREATE_DISPATCH_BASE_BIT                                             = $00000010;
const VK_PIPELINE_CREATE_FAIL_ON_PIPELINE_COMPILE_REQUIRED_BIT                         = $00000100;
const VK_PIPELINE_CREATE_EARLY_RETURN_ON_FAILURE_BIT                                   = $00000200;
const VK_PIPELINE_CREATE_RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR            = $00200000;
const VK_PIPELINE_CREATE_RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_BIT_EXT             = $00400000;
const VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_ANY_HIT_SHADERS_BIT_KHR                   = $00004000;
const VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_CLOSEST_HIT_SHADERS_BIT_KHR               = $00008000;
const VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_MISS_SHADERS_BIT_KHR                      = $00010000;
const VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_INTERSECTION_SHADERS_BIT_KHR              = $00020000;
const VK_PIPELINE_CREATE_RAY_TRACING_SKIP_TRIANGLES_BIT_KHR                            = $00001000;
const VK_PIPELINE_CREATE_RAY_TRACING_SKIP_AABBS_BIT_KHR                                = $00002000;
const VK_PIPELINE_CREATE_RAY_TRACING_SHADER_GROUP_HANDLE_CAPTURE_REPLAY_BIT_KHR        = $00080000;
const VK_PIPELINE_CREATE_DEFER_COMPILE_BIT_NV                                          = $00000020;
const VK_PIPELINE_CREATE_CAPTURE_STATISTICS_BIT_KHR                                    = $00000040;
const VK_PIPELINE_CREATE_CAPTURE_INTERNAL_REPRESENTATIONS_BIT_KHR                      = $00000080;
const VK_PIPELINE_CREATE_INDIRECT_BINDABLE_BIT_NV                                      = $00040000;
const VK_PIPELINE_CREATE_LIBRARY_BIT_KHR                                               = $00000800;
const VK_PIPELINE_CREATE_DESCRIPTOR_BUFFER_BIT_EXT                                     = $20000000;
const VK_PIPELINE_CREATE_RETAIN_LINK_TIME_OPTIMIZATION_INFO_BIT_EXT                    = $00800000;
const VK_PIPELINE_CREATE_LINK_TIME_OPTIMIZATION_BIT_EXT                                = $00000400;
const VK_PIPELINE_CREATE_RAY_TRACING_ALLOW_MOTION_BIT_NV                               = $00100000;
const VK_PIPELINE_CREATE_COLOR_ATTACHMENT_FEEDBACK_LOOP_BIT_EXT                        = $02000000;
const VK_PIPELINE_CREATE_DEPTH_STENCIL_ATTACHMENT_FEEDBACK_LOOP_BIT_EXT                = $04000000;
const VK_PIPELINE_CREATE_RAY_TRACING_OPACITY_MICROMAP_BIT_EXT                          = $01000000;
//#ifdef VK_ENABLE_BETA_EXTENSIONS
const VK_PIPELINE_CREATE_RAY_TRACING_DISPLACEMENT_MICROMAP_BIT_NV                      = $10000000;
//#endif
const VK_PIPELINE_CREATE_NO_PROTECTED_ACCESS_BIT_EXT                                   = $08000000;
const VK_PIPELINE_CREATE_PROTECTED_ACCESS_ONLY_BIT_EXT                                 = $40000000;
const VK_PIPELINE_CREATE_DISPATCH_BASE                                                 = VK_PIPELINE_CREATE_DISPATCH_BASE_BIT;
const VK_PIPELINE_RASTERIZATION_STATE_CREATE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR  = VK_PIPELINE_CREATE_RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR;
const VK_PIPELINE_RASTERIZATION_STATE_CREATE_FRAGMENT_DENSITY_MAP_ATTACHMENT_BIT_EXT   = VK_PIPELINE_CREATE_RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_BIT_EXT;
const VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT_KHR                          = VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT;
const VK_PIPELINE_CREATE_DISPATCH_BASE_KHR                                             = VK_PIPELINE_CREATE_DISPATCH_BASE;
const VK_PIPELINE_CREATE_FAIL_ON_PIPELINE_COMPILE_REQUIRED_BIT_EXT                     = VK_PIPELINE_CREATE_FAIL_ON_PIPELINE_COMPILE_REQUIRED_BIT;
const VK_PIPELINE_CREATE_EARLY_RETURN_ON_FAILURE_BIT_EXT                               = VK_PIPELINE_CREATE_EARLY_RETURN_ON_FAILURE_BIT;
const VK_PIPELINE_CREATE_FLAG_BITS_MAX_ENUM                                            = $7FFFFFFF;
//} VkPipelineCreateFlagBits;

type T_VkPipelineCreateFlags = T_VkFlags;  P_VkPipelineCreateFlags = ^T_VkPipelineCreateFlags;

//typedef enum VkPipelineShaderStageCreateFlagBits {
type T_VkPipelineShaderStageCreateFlagBits = T_int32_t;  P_VkPipelineShaderStageCreateFlagBits = ^T_VkPipelineShaderStageCreateFlagBits;
const VK_PIPELINE_SHADER_STAGE_CREATE_ALLOW_VARYING_SUBGROUP_SIZE_BIT     = $00000001;
const VK_PIPELINE_SHADER_STAGE_CREATE_REQUIRE_FULL_SUBGROUPS_BIT          = $00000002;
const VK_PIPELINE_SHADER_STAGE_CREATE_ALLOW_VARYING_SUBGROUP_SIZE_BIT_EXT = VK_PIPELINE_SHADER_STAGE_CREATE_ALLOW_VARYING_SUBGROUP_SIZE_BIT;
const VK_PIPELINE_SHADER_STAGE_CREATE_REQUIRE_FULL_SUBGROUPS_BIT_EXT      = VK_PIPELINE_SHADER_STAGE_CREATE_REQUIRE_FULL_SUBGROUPS_BIT;
const VK_PIPELINE_SHADER_STAGE_CREATE_FLAG_BITS_MAX_ENUM                  = $7FFFFFFF;
//} VkPipelineShaderStageCreateFlagBits;
type T_VkPipelineShaderStageCreateFlags = T_VkFlags;  P_VkPipelineShaderStageCreateFlags = ^T_VkPipelineShaderStageCreateFlags;

//typedef enum VkShaderStageFlagBits {
type T_VkShaderStageFlagBits = T_int32_t;  P_VkShaderStageFlagBits = ^T_VkShaderStageFlagBits;
const VK_SHADER_STAGE_VERTEX_BIT                  = $00000001;
const VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT    = $00000002;
const VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT = $00000004;
const VK_SHADER_STAGE_GEOMETRY_BIT                = $00000008;
const VK_SHADER_STAGE_FRAGMENT_BIT                = $00000010;
const VK_SHADER_STAGE_COMPUTE_BIT                 = $00000020;
const VK_SHADER_STAGE_ALL_GRAPHICS                = $0000001F;
const VK_SHADER_STAGE_ALL                         = $7FFFFFFF;
const VK_SHADER_STAGE_RAYGEN_BIT_KHR              = $00000100;
const VK_SHADER_STAGE_ANY_HIT_BIT_KHR             = $00000200;
const VK_SHADER_STAGE_CLOSEST_HIT_BIT_KHR         = $00000400;
const VK_SHADER_STAGE_MISS_BIT_KHR                = $00000800;
const VK_SHADER_STAGE_INTERSECTION_BIT_KHR        = $00001000;
const VK_SHADER_STAGE_CALLABLE_BIT_KHR            = $00002000;
const VK_SHADER_STAGE_TASK_BIT_EXT                = $00000040;
const VK_SHADER_STAGE_MESH_BIT_EXT                = $00000080;
const VK_SHADER_STAGE_SUBPASS_SHADING_BIT_HUAWEI  = $00004000;
const VK_SHADER_STAGE_CLUSTER_CULLING_BIT_HUAWEI  = $00080000;
const VK_SHADER_STAGE_RAYGEN_BIT_NV               = VK_SHADER_STAGE_RAYGEN_BIT_KHR;
const VK_SHADER_STAGE_ANY_HIT_BIT_NV              = VK_SHADER_STAGE_ANY_HIT_BIT_KHR;
const VK_SHADER_STAGE_CLOSEST_HIT_BIT_NV          = VK_SHADER_STAGE_CLOSEST_HIT_BIT_KHR;
const VK_SHADER_STAGE_MISS_BIT_NV                 = VK_SHADER_STAGE_MISS_BIT_KHR;
const VK_SHADER_STAGE_INTERSECTION_BIT_NV         = VK_SHADER_STAGE_INTERSECTION_BIT_KHR;
const VK_SHADER_STAGE_CALLABLE_BIT_NV             = VK_SHADER_STAGE_CALLABLE_BIT_KHR;
const VK_SHADER_STAGE_TASK_BIT_NV                 = VK_SHADER_STAGE_TASK_BIT_EXT;
const VK_SHADER_STAGE_MESH_BIT_NV                 = VK_SHADER_STAGE_MESH_BIT_EXT;
const VK_SHADER_STAGE_FLAG_BITS_MAX_ENUM          = $7FFFFFFF;
//} VkShaderStageFlagBits;

//typedef enum VkCullModeFlagBits {
type T_VkCullModeFlagBits = T_int32_t;  P_VkCullModeFlagBits = ^T_VkCullModeFlagBits;
const VK_CULL_MODE_NONE               = 0;
const VK_CULL_MODE_FRONT_BIT          = $00000001;
const VK_CULL_MODE_BACK_BIT           = $00000002;
const VK_CULL_MODE_FRONT_AND_BACK     = $00000003;
const VK_CULL_MODE_FLAG_BITS_MAX_ENUM = $7FFFFFFF;
//} VkCullModeFlagBits;
type T_VkCullModeFlags = T_VkFlags;  P_VkCullModeFlags = ^T_VkCullModeFlags;
type T_VkPipelineVertexInputStateCreateFlags = T_VkFlags;  P_VkPipelineVertexInputStateCreateFlags = ^T_VkPipelineVertexInputStateCreateFlags;
type T_VkPipelineInputAssemblyStateCreateFlags = T_VkFlags;  P_VkPipelineInputAssemblyStateCreateFlags = ^T_VkPipelineInputAssemblyStateCreateFlags;
type T_VkPipelineTessellationStateCreateFlags = T_VkFlags;  P_VkPipelineTessellationStateCreateFlags = ^T_VkPipelineTessellationStateCreateFlags;
type T_VkPipelineViewportStateCreateFlags = T_VkFlags;  P_VkPipelineViewportStateCreateFlags = ^T_VkPipelineViewportStateCreateFlags;
type T_VkPipelineRasterizationStateCreateFlags = T_VkFlags;  P_VkPipelineRasterizationStateCreateFlags = ^T_VkPipelineRasterizationStateCreateFlags;
type T_VkPipelineMultisampleStateCreateFlags = T_VkFlags;  P_VkPipelineMultisampleStateCreateFlags = ^T_VkPipelineMultisampleStateCreateFlags;

//typedef enum VkPipelineDepthStencilStateCreateFlagBits {
type T_VkPipelineDepthStencilStateCreateFlagBits = T_int32_t;  P_VkPipelineDepthStencilStateCreateFlagBits = ^T_VkPipelineDepthStencilStateCreateFlagBits;
const VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_EXT   = $00000001;
const VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_EXT = $00000002;
const VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_ARM   = VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_EXT;
const VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_ARM = VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_EXT;
const VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_FLAG_BITS_MAX_ENUM                                    = $7FFFFFFF;
//} VkPipelineDepthStencilStateCreateFlagBits;
type T_VkPipelineDepthStencilStateCreateFlags = T_VkFlags;  P_VkPipelineDepthStencilStateCreateFlags = ^T_VkPipelineDepthStencilStateCreateFlags;

//typedef enum VkPipelineColorBlendStateCreateFlagBits {
type T_VkPipelineColorBlendStateCreateFlagBits = T_int32_t;  P_VkPipelineColorBlendStateCreateFlagBits = ^T_VkPipelineColorBlendStateCreateFlagBits;
const VK_PIPELINE_COLOR_BLEND_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_BIT_EXT = $00000001;
const VK_PIPELINE_COLOR_BLEND_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_BIT_ARM = VK_PIPELINE_COLOR_BLEND_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_BIT_EXT;
const VK_PIPELINE_COLOR_BLEND_STATE_CREATE_FLAG_BITS_MAX_ENUM                            = $7FFFFFFF;
//} VkPipelineColorBlendStateCreateFlagBits;
type T_VkPipelineColorBlendStateCreateFlags = T_VkFlags;  P_VkPipelineColorBlendStateCreateFlags = ^T_VkPipelineColorBlendStateCreateFlags;
type T_VkPipelineDynamicStateCreateFlags = T_VkFlags;  P_VkPipelineDynamicStateCreateFlags = ^T_VkPipelineDynamicStateCreateFlags;

//typedef enum VkPipelineLayoutCreateFlagBits {
type T_VkPipelineLayoutCreateFlagBits = T_int32_t;  P_VkPipelineLayoutCreateFlagBits = ^T_VkPipelineLayoutCreateFlagBits;
const VK_PIPELINE_LAYOUT_CREATE_INDEPENDENT_SETS_BIT_EXT = $00000002;
const VK_PIPELINE_LAYOUT_CREATE_FLAG_BITS_MAX_ENUM       = $7FFFFFFF;
//} VkPipelineLayoutCreateFlagBits;
type T_VkPipelineLayoutCreateFlags = T_VkFlags;  P_VkPipelineLayoutCreateFlags = ^T_VkPipelineLayoutCreateFlags;
type T_VkShaderStageFlags = T_VkFlags;  P_VkShaderStageFlags = ^T_VkShaderStageFlags;

//typedef enum VkSamplerCreateFlagBits {
type T_VkSamplerCreateFlagBits = T_int32_t;  P_VkSamplerCreateFlagBits = ^T_VkSamplerCreateFlagBits;
const VK_SAMPLER_CREATE_SUBSAMPLED_BIT_EXT                       = $00000001;
const VK_SAMPLER_CREATE_SUBSAMPLED_COARSE_RECONSTRUCTION_BIT_EXT = $00000002;
const VK_SAMPLER_CREATE_DESCRIPTOR_BUFFER_CAPTURE_REPLAY_BIT_EXT = $00000008;
const VK_SAMPLER_CREATE_NON_SEAMLESS_CUBE_MAP_BIT_EXT            = $00000004;
const VK_SAMPLER_CREATE_IMAGE_PROCESSING_BIT_QCOM                = $00000010;
const VK_SAMPLER_CREATE_FLAG_BITS_MAX_ENUM                       = $7FFFFFFF;
//} VkSamplerCreateFlagBits;
type T_VkSamplerCreateFlags = T_VkFlags;  P_VkSamplerCreateFlags = ^T_VkSamplerCreateFlags;

//typedef enum VkDescriptorPoolCreateFlagBits {
type T_VkDescriptorPoolCreateFlagBits = T_int32_t;  P_VkDescriptorPoolCreateFlagBits = ^T_VkDescriptorPoolCreateFlagBits;
const VK_DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT           = $00000001;
const VK_DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT             = $00000002;
const VK_DESCRIPTOR_POOL_CREATE_HOST_ONLY_BIT_EXT                 = $00000004;
const VK_DESCRIPTOR_POOL_CREATE_ALLOW_OVERALLOCATION_SETS_BIT_NV  = $00000008;
const VK_DESCRIPTOR_POOL_CREATE_ALLOW_OVERALLOCATION_POOLS_BIT_NV = $00000010;
const VK_DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT_EXT         = VK_DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT;
const VK_DESCRIPTOR_POOL_CREATE_HOST_ONLY_BIT_VALVE               = VK_DESCRIPTOR_POOL_CREATE_HOST_ONLY_BIT_EXT;
const VK_DESCRIPTOR_POOL_CREATE_FLAG_BITS_MAX_ENUM                = $7FFFFFFF;
//} VkDescriptorPoolCreateFlagBits;
type T_VkDescriptorPoolCreateFlags = T_VkFlags;  P_VkDescriptorPoolCreateFlags = ^T_VkDescriptorPoolCreateFlags;
type T_VkDescriptorPoolResetFlags = T_VkFlags;  P_VkDescriptorPoolResetFlags = ^T_VkDescriptorPoolResetFlags;

//typedef enum VkDescriptorSetLayoutCreateFlagBits {
type T_VkDescriptorSetLayoutCreateFlagBits = T_int32_t;  P_VkDescriptorSetLayoutCreateFlagBits = ^T_VkDescriptorSetLayoutCreateFlagBits;
const VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT          = $00000002;
const VK_DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR             = $00000001;
const VK_DESCRIPTOR_SET_LAYOUT_CREATE_DESCRIPTOR_BUFFER_BIT_EXT           = $00000010;
const VK_DESCRIPTOR_SET_LAYOUT_CREATE_EMBEDDED_IMMUTABLE_SAMPLERS_BIT_EXT = $00000020;
const VK_DESCRIPTOR_SET_LAYOUT_CREATE_INDIRECT_BINDABLE_BIT_NV            = $00000080;
const VK_DESCRIPTOR_SET_LAYOUT_CREATE_HOST_ONLY_POOL_BIT_EXT              = $00000004;
const VK_DESCRIPTOR_SET_LAYOUT_CREATE_PER_STAGE_BIT_NV                    = $00000040;
const VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT_EXT      = VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT;
const VK_DESCRIPTOR_SET_LAYOUT_CREATE_HOST_ONLY_POOL_BIT_VALVE            = VK_DESCRIPTOR_SET_LAYOUT_CREATE_HOST_ONLY_POOL_BIT_EXT;
const VK_DESCRIPTOR_SET_LAYOUT_CREATE_FLAG_BITS_MAX_ENUM                  = $7FFFFFFF;
//} VkDescriptorSetLayoutCreateFlagBits;
type T_VkDescriptorSetLayoutCreateFlags = T_VkFlags;  P_VkDescriptorSetLayoutCreateFlags = ^T_VkDescriptorSetLayoutCreateFlags;

//typedef enum VkAttachmentDescriptionFlagBits {
type T_VkAttachmentDescriptionFlagBits = T_int32_t;  P_VkAttachmentDescriptionFlagBits = ^T_VkAttachmentDescriptionFlagBits;
const VK_ATTACHMENT_DESCRIPTION_MAY_ALIAS_BIT      = $00000001;
const VK_ATTACHMENT_DESCRIPTION_FLAG_BITS_MAX_ENUM = $7FFFFFFF;
//} VkAttachmentDescriptionFlagBits;
type T_VkAttachmentDescriptionFlags = T_VkFlags;  P_VkAttachmentDescriptionFlags = ^T_VkAttachmentDescriptionFlags;

//typedef enum VkDependencyFlagBits {
type T_VkDependencyFlagBits = T_int32_t;  P_VkDependencyFlagBits = ^T_VkDependencyFlagBits;
const VK_DEPENDENCY_BY_REGION_BIT         = $00000001;
const VK_DEPENDENCY_DEVICE_GROUP_BIT      = $00000004;
const VK_DEPENDENCY_VIEW_LOCAL_BIT        = $00000002;
const VK_DEPENDENCY_FEEDBACK_LOOP_BIT_EXT = $00000008;
const VK_DEPENDENCY_VIEW_LOCAL_BIT_KHR    = VK_DEPENDENCY_VIEW_LOCAL_BIT;
const VK_DEPENDENCY_DEVICE_GROUP_BIT_KHR  = VK_DEPENDENCY_DEVICE_GROUP_BIT;
const VK_DEPENDENCY_FLAG_BITS_MAX_ENUM    = $7FFFFFFF;
//} VkDependencyFlagBits;
type T_VkDependencyFlags = T_VkFlags;  P_VkDependencyFlags = ^T_VkDependencyFlags;

//typedef enum VkFramebufferCreateFlagBits {
type T_VkFramebufferCreateFlagBits = T_int32_t;  P_VkFramebufferCreateFlagBits = ^T_VkFramebufferCreateFlagBits;
const VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT      = $00000001;
const VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT_KHR  = VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT;
const VK_FRAMEBUFFER_CREATE_FLAG_BITS_MAX_ENUM = $7FFFFFFF;
//} VkFramebufferCreateFlagBits;
type T_VkFramebufferCreateFlags = T_VkFlags;  P_VkFramebufferCreateFlags = ^T_VkFramebufferCreateFlags;

//typedef enum VkRenderPassCreateFlagBits {
type T_VkRenderPassCreateFlagBits = T_int32_t;  P_VkRenderPassCreateFlagBits = ^T_VkRenderPassCreateFlagBits;
const VK_RENDER_PASS_CREATE_TRANSFORM_BIT_QCOM = $00000002;
const VK_RENDER_PASS_CREATE_FLAG_BITS_MAX_ENUM = $7FFFFFFF;
//} VkRenderPassCreateFlagBits;
type T_VkRenderPassCreateFlags = T_VkFlags;  P_VkRenderPassCreateFlags = ^T_VkRenderPassCreateFlags;

//typedef enum VkSubpassDescriptionFlagBits {
type T_VkSubpassDescriptionFlagBits = T_int32_t;  P_VkSubpassDescriptionFlagBits = ^T_VkSubpassDescriptionFlagBits;
const VK_SUBPASS_DESCRIPTION_PER_VIEW_ATTRIBUTES_BIT_NVX                           = $00000001;
const VK_SUBPASS_DESCRIPTION_PER_VIEW_POSITION_X_ONLY_BIT_NVX                      = $00000002;
const VK_SUBPASS_DESCRIPTION_FRAGMENT_REGION_BIT_QCOM                              = $00000004;
const VK_SUBPASS_DESCRIPTION_SHADER_RESOLVE_BIT_QCOM                               = $00000008;
const VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_COLOR_ACCESS_BIT_EXT   = $00000010;
const VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_EXT   = $00000020;
const VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_EXT = $00000040;
const VK_SUBPASS_DESCRIPTION_ENABLE_LEGACY_DITHERING_BIT_EXT                       = $00000080;
const VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_COLOR_ACCESS_BIT_ARM   = VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_COLOR_ACCESS_BIT_EXT;
const VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_ARM   = VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_EXT;
const VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_ARM = VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_EXT;
const VK_SUBPASS_DESCRIPTION_FLAG_BITS_MAX_ENUM                                    = $7FFFFFFF;
//} VkSubpassDescriptionFlagBits;
type T_VkSubpassDescriptionFlags = T_VkFlags;  P_VkSubpassDescriptionFlags = ^T_VkSubpassDescriptionFlags;

//typedef enum VkCommandPoolCreateFlagBits {
type T_VkCommandPoolCreateFlagBits = T_int32_t;  P_VkCommandPoolCreateFlagBits = ^T_VkCommandPoolCreateFlagBits;
const VK_COMMAND_POOL_CREATE_TRANSIENT_BIT            = $00000001;
const VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT = $00000002;
const VK_COMMAND_POOL_CREATE_PROTECTED_BIT            = $00000004;
const VK_COMMAND_POOL_CREATE_FLAG_BITS_MAX_ENUM       = $7FFFFFFF;
//} VkCommandPoolCreateFlagBits;
type T_VkCommandPoolCreateFlags = T_VkFlags;  P_VkCommandPoolCreateFlags = ^T_VkCommandPoolCreateFlags;

//typedef enum VkCommandPoolResetFlagBits {
type T_VkCommandPoolResetFlagBits = T_int32_t;  P_VkCommandPoolResetFlagBits = ^T_VkCommandPoolResetFlagBits;
const VK_COMMAND_POOL_RESET_RELEASE_RESOURCES_BIT = $00000001;
const VK_COMMAND_POOL_RESET_FLAG_BITS_MAX_ENUM    = $7FFFFFFF;
//} VkCommandPoolResetFlagBits;
type T_VkCommandPoolResetFlags = T_VkFlags;  P_VkCommandPoolResetFlags = ^T_VkCommandPoolResetFlags;

//typedef enum VkCommandBufferUsageFlagBits {
type T_VkCommandBufferUsageFlagBits = T_int32_t;  P_VkCommandBufferUsageFlagBits = ^T_VkCommandBufferUsageFlagBits;
const VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT      = $00000001;
const VK_COMMAND_BUFFER_USAGE_RENDER_PASS_CONTINUE_BIT = $00000002;
const VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT     = $00000004;
const VK_COMMAND_BUFFER_USAGE_FLAG_BITS_MAX_ENUM       = $7FFFFFFF;
//} VkCommandBufferUsageFlagBits;
type T_VkCommandBufferUsageFlags = T_VkFlags;  P_VkCommandBufferUsageFlags = ^T_VkCommandBufferUsageFlags;

//typedef enum VkQueryControlFlagBits {
type T_VkQueryControlFlagBits = T_int32_t;  P_VkQueryControlFlagBits = ^T_VkQueryControlFlagBits;
const VK_QUERY_CONTROL_PRECISE_BIT        = $00000001;
const VK_QUERY_CONTROL_FLAG_BITS_MAX_ENUM = $7FFFFFFF;
//} VkQueryControlFlagBits;
type T_VkQueryControlFlags = T_VkFlags;  P_VkQueryControlFlags = ^T_VkQueryControlFlags;

//typedef enum VkCommandBufferResetFlagBits {
type T_VkCommandBufferResetFlagBits = T_int32_t;  P_VkCommandBufferResetFlagBits = ^T_VkCommandBufferResetFlagBits;
const VK_COMMAND_BUFFER_RESET_RELEASE_RESOURCES_BIT = $00000001;
const VK_COMMAND_BUFFER_RESET_FLAG_BITS_MAX_ENUM    = $7FFFFFFF;
//} VkCommandBufferResetFlagBits;
type T_VkCommandBufferResetFlags = T_VkFlags;  P_VkCommandBufferResetFlags = ^T_VkCommandBufferResetFlags;

//typedef enum VkStencilFaceFlagBits {
type T_VkStencilFaceFlagBits = T_int32_t;  P_VkStencilFaceFlagBits = ^T_VkStencilFaceFlagBits;
const VK_STENCIL_FACE_FRONT_BIT          = $00000001;
const VK_STENCIL_FACE_BACK_BIT           = $00000002;
const VK_STENCIL_FACE_FRONT_AND_BACK     = $00000003;
const VK_STENCIL_FRONT_AND_BACK          = VK_STENCIL_FACE_FRONT_AND_BACK;
const VK_STENCIL_FACE_FLAG_BITS_MAX_ENUM = $7FFFFFFF;
//} VkStencilFaceFlagBits;
type T_VkStencilFaceFlags = T_VkFlags;  P_VkStencilFaceFlags = ^T_VkStencilFaceFlags;
type T_VkExtent2D = record
       width  :T_uint32_t;
       height :T_uint32_t;
     end;
     P_VkExtent2D = ^T_VkExtent2D;

type T_VkExtent3D = record
       width  :T_uint32_t;
       height :T_uint32_t;
       depth  :T_uint32_t;
     end;
     P_VkExtent3D = ^T_VkExtent3D;

type T_VkOffset2D = record
       x :T_int32_t;
       y :T_int32_t;
     end;
     P_VkOffset2D = ^T_VkOffset2D;

type T_VkOffset3D = record
       x :T_int32_t;
       y :T_int32_t;
       z :T_int32_t;
     end;
     P_VkOffset3D = ^T_VkOffset3D;

type T_VkRect2D = record
       offset :T_VkOffset2D;
       extent :T_VkExtent2D;
     end;
     P_VkRect2D = ^T_VkRect2D;

type P_VkBaseInStructure = ^T_VkBaseInStructure;
     T_VkBaseInStructure = record
       sType :T_VkStructureType;
       pNext :P_VkBaseInStructure;
     end;

type P_VkBaseOutStructure = ^T_VkBaseOutStructure;
     T_VkBaseOutStructure = record
       sType :T_VkStructureType;
       pNext :P_VkBaseOutStructure;
     end;

type T_VkBufferMemoryBarrier = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       srcAccessMask       :T_VkAccessFlags;
       dstAccessMask       :T_VkAccessFlags;
       srcQueueFamilyIndex :T_uint32_t;
       dstQueueFamilyIndex :T_uint32_t;
       buffer              :T_VkBuffer;
       offset              :T_VkDeviceSize;
       size                :T_VkDeviceSize;
     end;
     P_VkBufferMemoryBarrier = ^T_VkBufferMemoryBarrier;

type T_VkDispatchIndirectCommand = record
       x :T_uint32_t;
       y :T_uint32_t;
       z :T_uint32_t;
     end;
     P_VkDispatchIndirectCommand = ^T_VkDispatchIndirectCommand;

type T_VkDrawIndexedIndirectCommand = record
       indexCount    :T_uint32_t;
       instanceCount :T_uint32_t;
       firstIndex    :T_uint32_t;
       vertexOffset  :T_int32_t;
       firstInstance :T_uint32_t;
     end;
     P_VkDrawIndexedIndirectCommand = ^T_VkDrawIndexedIndirectCommand;

type T_VkDrawIndirectCommand = record
       vertexCount   :T_uint32_t;
       instanceCount :T_uint32_t;
       firstVertex   :T_uint32_t;
       firstInstance :T_uint32_t;
     end;
     P_VkDrawIndirectCommand = ^T_VkDrawIndirectCommand;

type T_VkImageSubresourceRange = record
       aspectMask     :T_VkImageAspectFlags;
       baseMipLevel   :T_uint32_t;
       levelCount     :T_uint32_t;
       baseArrayLayer :T_uint32_t;
       layerCount     :T_uint32_t;
     end;
     P_VkImageSubresourceRange = ^T_VkImageSubresourceRange;

type T_VkImageMemoryBarrier = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       srcAccessMask       :T_VkAccessFlags;
       dstAccessMask       :T_VkAccessFlags;
       oldLayout           :T_VkImageLayout;
       newLayout           :T_VkImageLayout;
       srcQueueFamilyIndex :T_uint32_t;
       dstQueueFamilyIndex :T_uint32_t;
       image               :T_VkImage;
       subresourceRange    :T_VkImageSubresourceRange;
     end;
     P_VkImageMemoryBarrier = ^T_VkImageMemoryBarrier;

type T_VkMemoryBarrier = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       srcAccessMask :T_VkAccessFlags;
       dstAccessMask :T_VkAccessFlags;
     end;
     P_VkMemoryBarrier = ^T_VkMemoryBarrier;

type T_VkPipelineCacheHeaderVersionOne = record
       headerSize        :T_uint32_t;
       headerVersion     :T_VkPipelineCacheHeaderVersion;
       vendorID          :T_uint32_t;
       deviceID          :T_uint32_t;
       pipelineCacheUUID :array [ 0..VK_UUID_SIZE-1 ] of T_uint8_t;
     end;
     P_VkPipelineCacheHeaderVersionOne = ^T_VkPipelineCacheHeaderVersionOne;

type
T_PFN_vkAllocationFunction = function( pUserData_       :P_void;
                                       size_            :T_size_t;
                                       alignment_       :T_size_t;
                                       allocationScope_ :T_VkSystemAllocationScope ) :P_void;
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkFreeFunction = procedure( pUserData_ :P_void;
                                  pMemory_   :P_void );
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkInternalAllocationNotification = procedure( pUserData_       :P_void;
                                                    size_            :T_size_t;
                                                    allocationType_  :T_VkInternalAllocationType;
                                                    allocationScope_ :T_VkSystemAllocationScope );
                                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkInternalFreeNotification = procedure( pUserData_       :P_void;
                                              size_            :T_size_t;
                                              allocationType_  :T_VkInternalAllocationType;
                                              allocationScope_ :T_VkSystemAllocationScope );
                                   {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkReallocationFunction = function( pUserData_       :P_void;
                                         pOriginal_       :P_void;
                                         size_            :T_size_t;
                                         alignment_       :T_size_t;
                                         allocationScope_ :T_VkSystemAllocationScope ) :P_void;
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkVoidFunction = procedure;
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}
type T_VkAllocationCallbacks = record
       pUserData             :P_void;
       pfnAllocation         :T_PFN_vkAllocationFunction;
       pfnReallocation       :T_PFN_vkReallocationFunction;
       pfnFree               :T_PFN_vkFreeFunction;
       pfnInternalAllocation :T_PFN_vkInternalAllocationNotification;
       pfnInternalFree       :T_PFN_vkInternalFreeNotification;
     end;
     P_VkAllocationCallbacks = ^T_VkAllocationCallbacks;

type T_VkApplicationInfo = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       pApplicationName   :P_char;
       applicationVersion :T_uint32_t;
       pEngineName        :P_char;
       engineVersion      :T_uint32_t;
       apiVersion         :T_uint32_t;
     end;
     P_VkApplicationInfo = ^T_VkApplicationInfo;

type T_VkFormatProperties = record
       linearTilingFeatures  :T_VkFormatFeatureFlags;
       optimalTilingFeatures :T_VkFormatFeatureFlags;
       bufferFeatures        :T_VkFormatFeatureFlags;
     end;
     P_VkFormatProperties = ^T_VkFormatProperties;

type T_VkImageFormatProperties = record
       maxExtent       :T_VkExtent3D;
       maxMipLevels    :T_uint32_t;
       maxArrayLayers  :T_uint32_t;
       sampleCounts    :T_VkSampleCountFlags;
       maxResourceSize :T_VkDeviceSize;
     end;
     P_VkImageFormatProperties = ^T_VkImageFormatProperties;

type T_VkInstanceCreateInfo = record
       sType                   :T_VkStructureType;
       pNext                   :P_void;
       flags                   :T_VkInstanceCreateFlags;
       pApplicationInfo        :P_VkApplicationInfo;
       enabledLayerCount       :T_uint32_t;
       ppEnabledLayerNames     :PP_char;
       enabledExtensionCount   :T_uint32_t;
       ppEnabledExtensionNames :PP_char;
     end;
     P_VkInstanceCreateInfo = ^T_VkInstanceCreateInfo;

type T_VkMemoryHeap = record
       size  :T_VkDeviceSize;
       flags :T_VkMemoryHeapFlags;
     end;
     P_VkMemoryHeap = ^T_VkMemoryHeap;

type T_VkMemoryType = record
       propertyFlags :T_VkMemoryPropertyFlags;
       heapIndex     :T_uint32_t;
     end;
     P_VkMemoryType = ^T_VkMemoryType;

type T_VkPhysicalDeviceFeatures = record
       robustBufferAccess                      :T_VkBool32;
       fullDrawIndexUint32                     :T_VkBool32;
       imageCubeArray                          :T_VkBool32;
       independentBlend                        :T_VkBool32;
       geometryShader                          :T_VkBool32;
       tessellationShader                      :T_VkBool32;
       sampleRateShading                       :T_VkBool32;
       dualSrcBlend                            :T_VkBool32;
       logicOp                                 :T_VkBool32;
       multiDrawIndirect                       :T_VkBool32;
       drawIndirectFirstInstance               :T_VkBool32;
       depthClamp                              :T_VkBool32;
       depthBiasClamp                          :T_VkBool32;
       fillModeNonSolid                        :T_VkBool32;
       depthBounds                             :T_VkBool32;
       wideLines                               :T_VkBool32;
       largePoints                             :T_VkBool32;
       alphaToOne                              :T_VkBool32;
       multiViewport                           :T_VkBool32;
       samplerAnisotropy                       :T_VkBool32;
       textureCompressionETC2                  :T_VkBool32;
       textureCompressionASTC_LDR              :T_VkBool32;
       textureCompressionBC                    :T_VkBool32;
       occlusionQueryPrecise                   :T_VkBool32;
       pipelineStatisticsQuery                 :T_VkBool32;
       vertexPipelineStoresAndAtomics          :T_VkBool32;
       fragmentStoresAndAtomics                :T_VkBool32;
       shaderTessellationAndGeometryPointSize  :T_VkBool32;
       shaderImageGatherExtended               :T_VkBool32;
       shaderStorageImageExtendedFormats       :T_VkBool32;
       shaderStorageImageMultisample           :T_VkBool32;
       shaderStorageImageReadWithoutFormat     :T_VkBool32;
       shaderStorageImageWriteWithoutFormat    :T_VkBool32;
       shaderUniformBufferArrayDynamicIndexing :T_VkBool32;
       shaderSampledImageArrayDynamicIndexing  :T_VkBool32;
       shaderStorageBufferArrayDynamicIndexing :T_VkBool32;
       shaderStorageImageArrayDynamicIndexing  :T_VkBool32;
       shaderClipDistance                      :T_VkBool32;
       shaderCullDistance                      :T_VkBool32;
       shaderFloat64                           :T_VkBool32;
       shaderInt64                             :T_VkBool32;
       shaderInt16                             :T_VkBool32;
       shaderResourceResidency                 :T_VkBool32;
       shaderResourceMinLod                    :T_VkBool32;
       sparseBinding                           :T_VkBool32;
       sparseResidencyBuffer                   :T_VkBool32;
       sparseResidencyImage2D                  :T_VkBool32;
       sparseResidencyImage3D                  :T_VkBool32;
       sparseResidency2Samples                 :T_VkBool32;
       sparseResidency4Samples                 :T_VkBool32;
       sparseResidency8Samples                 :T_VkBool32;
       sparseResidency16Samples                :T_VkBool32;
       sparseResidencyAliased                  :T_VkBool32;
       variableMultisampleRate                 :T_VkBool32;
       inheritedQueries                        :T_VkBool32;
     end;
     P_VkPhysicalDeviceFeatures = ^T_VkPhysicalDeviceFeatures;

type T_VkPhysicalDeviceLimits = record
       maxImageDimension1D                             :T_uint32_t;
       maxImageDimension2D                             :T_uint32_t;
       maxImageDimension3D                             :T_uint32_t;
       maxImageDimensionCube                           :T_uint32_t;
       maxImageArrayLayers                             :T_uint32_t;
       maxTexelBufferElements                          :T_uint32_t;
       maxUniformBufferRange                           :T_uint32_t;
       maxStorageBufferRange                           :T_uint32_t;
       maxPushConstantsSize                            :T_uint32_t;
       maxMemoryAllocationCount                        :T_uint32_t;
       maxSamplerAllocationCount                       :T_uint32_t;
       bufferImageGranularity                          :T_VkDeviceSize;
       sparseAddressSpaceSize                          :T_VkDeviceSize;
       maxBoundDescriptorSets                          :T_uint32_t;
       maxPerStageDescriptorSamplers                   :T_uint32_t;
       maxPerStageDescriptorUniformBuffers             :T_uint32_t;
       maxPerStageDescriptorStorageBuffers             :T_uint32_t;
       maxPerStageDescriptorSampledImages              :T_uint32_t;
       maxPerStageDescriptorStorageImages              :T_uint32_t;
       maxPerStageDescriptorInputAttachments           :T_uint32_t;
       maxPerStageResources                            :T_uint32_t;
       maxDescriptorSetSamplers                        :T_uint32_t;
       maxDescriptorSetUniformBuffers                  :T_uint32_t;
       maxDescriptorSetUniformBuffersDynamic           :T_uint32_t;
       maxDescriptorSetStorageBuffers                  :T_uint32_t;
       maxDescriptorSetStorageBuffersDynamic           :T_uint32_t;
       maxDescriptorSetSampledImages                   :T_uint32_t;
       maxDescriptorSetStorageImages                   :T_uint32_t;
       maxDescriptorSetInputAttachments                :T_uint32_t;
       maxVertexInputAttributes                        :T_uint32_t;
       maxVertexInputBindings                          :T_uint32_t;
       maxVertexInputAttributeOffset                   :T_uint32_t;
       maxVertexInputBindingStride                     :T_uint32_t;
       maxVertexOutputComponents                       :T_uint32_t;
       maxTessellationGenerationLevel                  :T_uint32_t;
       maxTessellationPatchSize                        :T_uint32_t;
       maxTessellationControlPerVertexInputComponents  :T_uint32_t;
       maxTessellationControlPerVertexOutputComponents :T_uint32_t;
       maxTessellationControlPerPatchOutputComponents  :T_uint32_t;
       maxTessellationControlTotalOutputComponents     :T_uint32_t;
       maxTessellationEvaluationInputComponents        :T_uint32_t;
       maxTessellationEvaluationOutputComponents       :T_uint32_t;
       maxGeometryShaderInvocations                    :T_uint32_t;
       maxGeometryInputComponents                      :T_uint32_t;
       maxGeometryOutputComponents                     :T_uint32_t;
       maxGeometryOutputVertices                       :T_uint32_t;
       maxGeometryTotalOutputComponents                :T_uint32_t;
       maxFragmentInputComponents                      :T_uint32_t;
       maxFragmentOutputAttachments                    :T_uint32_t;
       maxFragmentDualSrcAttachments                   :T_uint32_t;
       maxFragmentCombinedOutputResources              :T_uint32_t;
       maxComputeSharedMemorySize                      :T_uint32_t;
       maxComputeWorkGroupCount                        :array [ 0..2 ] of T_uint32_t;
       maxComputeWorkGroupInvocations                  :T_uint32_t;
       maxComputeWorkGroupSize                         :array [ 0..2 ] of T_uint32_t;
       subPixelPrecisionBits                           :T_uint32_t;
       subTexelPrecisionBits                           :T_uint32_t;
       mipmapPrecisionBits                             :T_uint32_t;
       maxDrawIndexedIndexValue                        :T_uint32_t;
       maxDrawIndirectCount                            :T_uint32_t;
       maxSamplerLodBias                               :T_float;
       maxSamplerAnisotropy                            :T_float;
       maxViewports                                    :T_uint32_t;
       maxViewportDimensions                           :array [ 0..1 ] of T_uint32_t;
       viewportBoundsRange                             :array [ 0..1 ] of T_float;
       viewportSubPixelBits                            :T_uint32_t;
       minMemoryMapAlignment                           :T_size_t;
       minTexelBufferOffsetAlignment                   :T_VkDeviceSize;
       minUniformBufferOffsetAlignment                 :T_VkDeviceSize;
       minStorageBufferOffsetAlignment                 :T_VkDeviceSize;
       minTexelOffset                                  :T_int32_t;
       maxTexelOffset                                  :T_uint32_t;
       minTexelGatherOffset                            :T_int32_t;
       maxTexelGatherOffset                            :T_uint32_t;
       minInterpolationOffset                          :T_float;
       maxInterpolationOffset                          :T_float;
       subPixelInterpolationOffsetBits                 :T_uint32_t;
       maxFramebufferWidth                             :T_uint32_t;
       maxFramebufferHeight                            :T_uint32_t;
       maxFramebufferLayers                            :T_uint32_t;
       framebufferColorSampleCounts                    :T_VkSampleCountFlags;
       framebufferDepthSampleCounts                    :T_VkSampleCountFlags;
       framebufferStencilSampleCounts                  :T_VkSampleCountFlags;
       framebufferNoAttachmentsSampleCounts            :T_VkSampleCountFlags;
       maxColorAttachments                             :T_uint32_t;
       sampledImageColorSampleCounts                   :T_VkSampleCountFlags;
       sampledImageIntegerSampleCounts                 :T_VkSampleCountFlags;
       sampledImageDepthSampleCounts                   :T_VkSampleCountFlags;
       sampledImageStencilSampleCounts                 :T_VkSampleCountFlags;
       storageImageSampleCounts                        :T_VkSampleCountFlags;
       maxSampleMaskWords                              :T_uint32_t;
       timestampComputeAndGraphics                     :T_VkBool32;
       timestampPeriod                                 :T_float;
       maxClipDistances                                :T_uint32_t;
       maxCullDistances                                :T_uint32_t;
       maxCombinedClipAndCullDistances                 :T_uint32_t;
       discreteQueuePriorities                         :T_uint32_t;
       pointSizeRange                                  :array [ 0..1 ] of T_float;
       lineWidthRange                                  :array [ 0..1 ] of T_float;
       pointSizeGranularity                            :T_float;
       lineWidthGranularity                            :T_float;
       strictLines                                     :T_VkBool32;
       standardSampleLocations                         :T_VkBool32;
       optimalBufferCopyOffsetAlignment                :T_VkDeviceSize;
       optimalBufferCopyRowPitchAlignment              :T_VkDeviceSize;
       nonCoherentAtomSize                             :T_VkDeviceSize;
     end;
     P_VkPhysicalDeviceLimits = ^T_VkPhysicalDeviceLimits;

type T_VkPhysicalDeviceMemoryProperties = record
       memoryTypeCount :T_uint32_t;
       memoryTypes     :array [ 0..VK_MAX_MEMORY_TYPES-1 ] of T_VkMemoryType;
       memoryHeapCount :T_uint32_t;
       memoryHeaps     :array [ 0..VK_MAX_MEMORY_HEAPS-1 ] of T_VkMemoryHeap;
     end;
     P_VkPhysicalDeviceMemoryProperties = ^T_VkPhysicalDeviceMemoryProperties;

type T_VkPhysicalDeviceSparseProperties = record
       residencyStandard2DBlockShape            :T_VkBool32;
       residencyStandard2DMultisampleBlockShape :T_VkBool32;
       residencyStandard3DBlockShape            :T_VkBool32;
       residencyAlignedMipSize                  :T_VkBool32;
       residencyNonResidentStrict               :T_VkBool32;
     end;
     P_VkPhysicalDeviceSparseProperties = ^T_VkPhysicalDeviceSparseProperties;

type T_VkPhysicalDeviceProperties = record
       apiVersion        :T_uint32_t;
       driverVersion     :T_uint32_t;
       vendorID          :T_uint32_t;
       deviceID          :T_uint32_t;
       deviceType        :T_VkPhysicalDeviceType;
       deviceName        :array [ 0..VK_MAX_PHYSICAL_DEVICE_NAME_SIZE-1 ] of T_char;
       pipelineCacheUUID :array [ 0..VK_UUID_SIZE-1 ] of T_uint8_t;
       limits            :T_VkPhysicalDeviceLimits;
       sparseProperties  :T_VkPhysicalDeviceSparseProperties;
     end;
     P_VkPhysicalDeviceProperties = ^T_VkPhysicalDeviceProperties;

type T_VkQueueFamilyProperties = record
       queueFlags                  :T_VkQueueFlags;
       queueCount                  :T_uint32_t;
       timestampValidBits          :T_uint32_t;
       minImageTransferGranularity :T_VkExtent3D;
     end;
     P_VkQueueFamilyProperties = ^T_VkQueueFamilyProperties;

type T_VkDeviceQueueCreateInfo = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       flags            :T_VkDeviceQueueCreateFlags;
       queueFamilyIndex :T_uint32_t;
       queueCount       :T_uint32_t;
       pQueuePriorities :P_float;
     end;
     P_VkDeviceQueueCreateInfo = ^T_VkDeviceQueueCreateInfo;

type T_VkDeviceCreateInfo = record
       sType                   :T_VkStructureType;
       pNext                   :P_void;
       flags                   :T_VkDeviceCreateFlags;
       queueCreateInfoCount    :T_uint32_t;
       pQueueCreateInfos       :P_VkDeviceQueueCreateInfo;
       enabledLayerCount       :T_uint32_t;
       ppEnabledLayerNames     :PP_char;
       enabledExtensionCount   :T_uint32_t;
       ppEnabledExtensionNames :PP_char;
       pEnabledFeatures        :P_VkPhysicalDeviceFeatures;
     end;
     P_VkDeviceCreateInfo = ^T_VkDeviceCreateInfo;

type T_VkExtensionProperties = record
       extensionName :array [ 0..VK_MAX_EXTENSION_NAME_SIZE-1 ] of T_char;
       specVersion   :T_uint32_t;
     end;
     P_VkExtensionProperties = ^T_VkExtensionProperties;

type T_VkLayerProperties = record
       layerName             :array [ 0..VK_MAX_EXTENSION_NAME_SIZE-1 ] of T_char;
       specVersion           :T_uint32_t;
       implementationVersion :T_uint32_t;
       description           :array [ 0..VK_MAX_DESCRIPTION_SIZE-1 ] of T_char;
     end;
     P_VkLayerProperties = ^T_VkLayerProperties;

type T_VkSubmitInfo = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       waitSemaphoreCount   :T_uint32_t;
       pWaitSemaphores      :P_VkSemaphore;
       pWaitDstStageMask    :P_VkPipelineStageFlags;
       commandBufferCount   :T_uint32_t;
       pCommandBuffers      :P_VkCommandBuffer;
       signalSemaphoreCount :T_uint32_t;
       pSignalSemaphores    :P_VkSemaphore;
     end;
     P_VkSubmitInfo = ^T_VkSubmitInfo;

type T_VkMappedMemoryRange = record
       sType  :T_VkStructureType;
       pNext  :P_void;
       memory :T_VkDeviceMemory;
       offset :T_VkDeviceSize;
       size   :T_VkDeviceSize;
     end;
     P_VkMappedMemoryRange = ^T_VkMappedMemoryRange;

type T_VkMemoryAllocateInfo = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       allocationSize  :T_VkDeviceSize;
       memoryTypeIndex :T_uint32_t;
     end;
     P_VkMemoryAllocateInfo = ^T_VkMemoryAllocateInfo;

type T_VkMemoryRequirements = record
       size           :T_VkDeviceSize;
       alignment      :T_VkDeviceSize;
       memoryTypeBits :T_uint32_t;
     end;
     P_VkMemoryRequirements = ^T_VkMemoryRequirements;

type T_VkSparseMemoryBind = record
       resourceOffset :T_VkDeviceSize;
       size           :T_VkDeviceSize;
       memory         :T_VkDeviceMemory;
       memoryOffset   :T_VkDeviceSize;
       flags          :T_VkSparseMemoryBindFlags;
     end;
     P_VkSparseMemoryBind = ^T_VkSparseMemoryBind;

type T_VkSparseBufferMemoryBindInfo = record
       buffer    :T_VkBuffer;
       bindCount :T_uint32_t;
       pBinds    :P_VkSparseMemoryBind;
     end;
     P_VkSparseBufferMemoryBindInfo = ^T_VkSparseBufferMemoryBindInfo;

type T_VkSparseImageOpaqueMemoryBindInfo = record
       image     :T_VkImage;
       bindCount :T_uint32_t;
       pBinds    :P_VkSparseMemoryBind;
     end;
     P_VkSparseImageOpaqueMemoryBindInfo = ^T_VkSparseImageOpaqueMemoryBindInfo;

type T_VkImageSubresource = record
       aspectMask :T_VkImageAspectFlags;
       mipLevel   :T_uint32_t;
       arrayLayer :T_uint32_t;
     end;
     P_VkImageSubresource = ^T_VkImageSubresource;

type T_VkSparseImageMemoryBind = record
       subresource  :T_VkImageSubresource;
       offset       :T_VkOffset3D;
       extent       :T_VkExtent3D;
       memory       :T_VkDeviceMemory;
       memoryOffset :T_VkDeviceSize;
       flags        :T_VkSparseMemoryBindFlags;
     end;
     P_VkSparseImageMemoryBind = ^T_VkSparseImageMemoryBind;

type T_VkSparseImageMemoryBindInfo = record
       image     :T_VkImage;
       bindCount :T_uint32_t;
       pBinds    :P_VkSparseImageMemoryBind;
     end;
     P_VkSparseImageMemoryBindInfo = ^T_VkSparseImageMemoryBindInfo;

type T_VkBindSparseInfo = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       waitSemaphoreCount   :T_uint32_t;
       pWaitSemaphores      :P_VkSemaphore;
       bufferBindCount      :T_uint32_t;
       pBufferBinds         :P_VkSparseBufferMemoryBindInfo;
       imageOpaqueBindCount :T_uint32_t;
       pImageOpaqueBinds    :P_VkSparseImageOpaqueMemoryBindInfo;
       imageBindCount       :T_uint32_t;
       pImageBinds          :P_VkSparseImageMemoryBindInfo;
       signalSemaphoreCount :T_uint32_t;
       pSignalSemaphores    :P_VkSemaphore;
     end;
     P_VkBindSparseInfo = ^T_VkBindSparseInfo;

type T_VkSparseImageFormatProperties = record
       aspectMask       :T_VkImageAspectFlags;
       imageGranularity :T_VkExtent3D;
       flags            :T_VkSparseImageFormatFlags;
     end;
     P_VkSparseImageFormatProperties = ^T_VkSparseImageFormatProperties;

type T_VkSparseImageMemoryRequirements = record
       formatProperties     :T_VkSparseImageFormatProperties;
       imageMipTailFirstLod :T_uint32_t;
       imageMipTailSize     :T_VkDeviceSize;
       imageMipTailOffset   :T_VkDeviceSize;
       imageMipTailStride   :T_VkDeviceSize;
     end;
     P_VkSparseImageMemoryRequirements = ^T_VkSparseImageMemoryRequirements;

type T_VkFenceCreateInfo = record
       sType :T_VkStructureType;
       pNext :P_void;
       flags :T_VkFenceCreateFlags;
     end;
     P_VkFenceCreateInfo = ^T_VkFenceCreateInfo;

type T_VkSemaphoreCreateInfo = record
       sType :T_VkStructureType;
       pNext :P_void;
       flags :T_VkSemaphoreCreateFlags;
     end;
     P_VkSemaphoreCreateInfo = ^T_VkSemaphoreCreateInfo;

type T_VkEventCreateInfo = record
       sType :T_VkStructureType;
       pNext :P_void;
       flags :T_VkEventCreateFlags;
     end;
     P_VkEventCreateInfo = ^T_VkEventCreateInfo;

type T_VkQueryPoolCreateInfo = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       flags              :T_VkQueryPoolCreateFlags;
       queryType          :T_VkQueryType;
       queryCount         :T_uint32_t;
       pipelineStatistics :T_VkQueryPipelineStatisticFlags;
     end;
     P_VkQueryPoolCreateInfo = ^T_VkQueryPoolCreateInfo;

type T_VkBufferCreateInfo = record
       sType                 :T_VkStructureType;
       pNext                 :P_void;
       flags                 :T_VkBufferCreateFlags;
       size                  :T_VkDeviceSize;
       usage                 :T_VkBufferUsageFlags;
       sharingMode           :T_VkSharingMode;
       queueFamilyIndexCount :T_uint32_t;
       pQueueFamilyIndices   :P_uint32_t;
     end;
     P_VkBufferCreateInfo = ^T_VkBufferCreateInfo;

type T_VkBufferViewCreateInfo = record
       sType  :T_VkStructureType;
       pNext  :P_void;
       flags  :T_VkBufferViewCreateFlags;
       buffer :T_VkBuffer;
       format :T_VkFormat;
       offset :T_VkDeviceSize;
       range  :T_VkDeviceSize;
     end;
     P_VkBufferViewCreateInfo = ^T_VkBufferViewCreateInfo;

type T_VkImageCreateInfo = record
       sType                 :T_VkStructureType;
       pNext                 :P_void;
       flags                 :T_VkImageCreateFlags;
       imageType             :T_VkImageType;
       format                :T_VkFormat;
       extent                :T_VkExtent3D;
       mipLevels             :T_uint32_t;
       arrayLayers           :T_uint32_t;
       samples               :T_VkSampleCountFlagBits;
       tiling                :T_VkImageTiling;
       usage                 :T_VkImageUsageFlags;
       sharingMode           :T_VkSharingMode;
       queueFamilyIndexCount :T_uint32_t;
       pQueueFamilyIndices   :P_uint32_t;
       initialLayout         :T_VkImageLayout;
     end;
     P_VkImageCreateInfo = ^T_VkImageCreateInfo;

type T_VkSubresourceLayout = record
       offset     :T_VkDeviceSize;
       size       :T_VkDeviceSize;
       rowPitch   :T_VkDeviceSize;
       arrayPitch :T_VkDeviceSize;
       depthPitch :T_VkDeviceSize;
     end;
     P_VkSubresourceLayout = ^T_VkSubresourceLayout;

type T_VkComponentMapping = record
       r :T_VkComponentSwizzle;
       g :T_VkComponentSwizzle;
       b :T_VkComponentSwizzle;
       a :T_VkComponentSwizzle;
     end;
     P_VkComponentMapping = ^T_VkComponentMapping;

type T_VkImageViewCreateInfo = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       flags            :T_VkImageViewCreateFlags;
       image            :T_VkImage;
       viewType         :T_VkImageViewType;
       format           :T_VkFormat;
       components       :T_VkComponentMapping;
       subresourceRange :T_VkImageSubresourceRange;
     end;
     P_VkImageViewCreateInfo = ^T_VkImageViewCreateInfo;

type T_VkShaderModuleCreateInfo = record
       sType    :T_VkStructureType;
       pNext    :P_void;
       flags    :T_VkShaderModuleCreateFlags;
       codeSize :T_size_t;
       pCode    :P_uint32_t;
     end;
     P_VkShaderModuleCreateInfo = ^T_VkShaderModuleCreateInfo;

type T_VkPipelineCacheCreateInfo = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       flags           :T_VkPipelineCacheCreateFlags;
       initialDataSize :T_size_t;
       pInitialData    :P_void;
     end;
     P_VkPipelineCacheCreateInfo = ^T_VkPipelineCacheCreateInfo;

type T_VkSpecializationMapEntry = record
       constantID :T_uint32_t;
       offset     :T_uint32_t;
       size       :T_size_t;
     end;
     P_VkSpecializationMapEntry = ^T_VkSpecializationMapEntry;

type T_VkSpecializationInfo = record
       mapEntryCount :T_uint32_t;
       pMapEntries   :P_VkSpecializationMapEntry;
       dataSize      :T_size_t;
       pData         :P_void;
     end;
     P_VkSpecializationInfo = ^T_VkSpecializationInfo;

type T_VkPipelineShaderStageCreateInfo = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       flags               :T_VkPipelineShaderStageCreateFlags;
       stage               :T_VkShaderStageFlagBits;
       module              :T_VkShaderModule;
       pName               :P_char;
       pSpecializationInfo :P_VkSpecializationInfo;
     end;
     P_VkPipelineShaderStageCreateInfo = ^T_VkPipelineShaderStageCreateInfo;

type T_VkComputePipelineCreateInfo = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       flags              :T_VkPipelineCreateFlags;
       stage              :T_VkPipelineShaderStageCreateInfo;
       layout             :T_VkPipelineLayout;
       basePipelineHandle :T_VkPipeline;
       basePipelineIndex  :T_int32_t;
     end;
     P_VkComputePipelineCreateInfo = ^T_VkComputePipelineCreateInfo;

type T_VkVertexInputBindingDescription = record
       binding   :T_uint32_t;
       stride    :T_uint32_t;
       inputRate :T_VkVertexInputRate;
     end;
     P_VkVertexInputBindingDescription = ^T_VkVertexInputBindingDescription;

type T_VkVertexInputAttributeDescription = record
       location :T_uint32_t;
       binding  :T_uint32_t;
       format   :T_VkFormat;
       offset   :T_uint32_t;
     end;
     P_VkVertexInputAttributeDescription = ^T_VkVertexInputAttributeDescription;

type T_VkPipelineVertexInputStateCreateInfo = record
       sType                           :T_VkStructureType;
       pNext                           :P_void;
       flags                           :T_VkPipelineVertexInputStateCreateFlags;
       vertexBindingDescriptionCount   :T_uint32_t;
       pVertexBindingDescriptions      :P_VkVertexInputBindingDescription;
       vertexAttributeDescriptionCount :T_uint32_t;
       pVertexAttributeDescriptions    :P_VkVertexInputAttributeDescription;
     end;
     P_VkPipelineVertexInputStateCreateInfo = ^T_VkPipelineVertexInputStateCreateInfo;

type T_VkPipelineInputAssemblyStateCreateInfo = record
       sType                  :T_VkStructureType;
       pNext                  :P_void;
       flags                  :T_VkPipelineInputAssemblyStateCreateFlags;
       topology               :T_VkPrimitiveTopology;
       primitiveRestartEnable :T_VkBool32;
     end;
     P_VkPipelineInputAssemblyStateCreateInfo = ^T_VkPipelineInputAssemblyStateCreateInfo;

type T_VkPipelineTessellationStateCreateInfo = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       flags              :T_VkPipelineTessellationStateCreateFlags;
       patchControlPoints :T_uint32_t;
     end;
     P_VkPipelineTessellationStateCreateInfo = ^T_VkPipelineTessellationStateCreateInfo;

type T_VkViewport = record
       x        :T_float;
       y        :T_float;
       width    :T_float;
       height   :T_float;
       minDepth :T_float;
       maxDepth :T_float;
     end;
     P_VkViewport = ^T_VkViewport;

type T_VkPipelineViewportStateCreateInfo = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       flags         :T_VkPipelineViewportStateCreateFlags;
       viewportCount :T_uint32_t;
       pViewports    :P_VkViewport;
       scissorCount  :T_uint32_t;
       pScissors     :P_VkRect2D;
     end;
     P_VkPipelineViewportStateCreateInfo = ^T_VkPipelineViewportStateCreateInfo;

type T_VkPipelineRasterizationStateCreateInfo = record
       sType                   :T_VkStructureType;
       pNext                   :P_void;
       flags                   :T_VkPipelineRasterizationStateCreateFlags;
       depthClampEnable        :T_VkBool32;
       rasterizerDiscardEnable :T_VkBool32;
       polygonMode             :T_VkPolygonMode;
       cullMode                :T_VkCullModeFlags;
       frontFace               :T_VkFrontFace;
       depthBiasEnable         :T_VkBool32;
       depthBiasConstantFactor :T_float;
       depthBiasClamp          :T_float;
       depthBiasSlopeFactor    :T_float;
       lineWidth               :T_float;
     end;
     P_VkPipelineRasterizationStateCreateInfo = ^T_VkPipelineRasterizationStateCreateInfo;

type T_VkPipelineMultisampleStateCreateInfo = record
       sType                 :T_VkStructureType;
       pNext                 :P_void;
       flags                 :T_VkPipelineMultisampleStateCreateFlags;
       rasterizationSamples  :T_VkSampleCountFlagBits;
       sampleShadingEnable   :T_VkBool32;
       minSampleShading      :T_float;
       pSampleMask           :P_VkSampleMask;
       alphaToCoverageEnable :T_VkBool32;
       alphaToOneEnable      :T_VkBool32;
     end;
     P_VkPipelineMultisampleStateCreateInfo = ^T_VkPipelineMultisampleStateCreateInfo;

type T_VkStencilOpState = record
       failOp      :T_VkStencilOp;
       passOp      :T_VkStencilOp;
       depthFailOp :T_VkStencilOp;
       compareOp   :T_VkCompareOp;
       compareMask :T_uint32_t;
       writeMask   :T_uint32_t;
       reference   :T_uint32_t;
     end;
     P_VkStencilOpState = ^T_VkStencilOpState;

type T_VkPipelineDepthStencilStateCreateInfo = record
       sType                 :T_VkStructureType;
       pNext                 :P_void;
       flags                 :T_VkPipelineDepthStencilStateCreateFlags;
       depthTestEnable       :T_VkBool32;
       depthWriteEnable      :T_VkBool32;
       depthCompareOp        :T_VkCompareOp;
       depthBoundsTestEnable :T_VkBool32;
       stencilTestEnable     :T_VkBool32;
       front                 :T_VkStencilOpState;
       back                  :T_VkStencilOpState;
       minDepthBounds        :T_float;
       maxDepthBounds        :T_float;
     end;
     P_VkPipelineDepthStencilStateCreateInfo = ^T_VkPipelineDepthStencilStateCreateInfo;

type T_VkPipelineColorBlendAttachmentState = record
       blendEnable         :T_VkBool32;
       srcColorBlendFactor :T_VkBlendFactor;
       dstColorBlendFactor :T_VkBlendFactor;
       colorBlendOp        :T_VkBlendOp;
       srcAlphaBlendFactor :T_VkBlendFactor;
       dstAlphaBlendFactor :T_VkBlendFactor;
       alphaBlendOp        :T_VkBlendOp;
       colorWriteMask      :T_VkColorComponentFlags;
     end;
     P_VkPipelineColorBlendAttachmentState = ^T_VkPipelineColorBlendAttachmentState;

type T_VkPipelineColorBlendStateCreateInfo = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       flags           :T_VkPipelineColorBlendStateCreateFlags;
       logicOpEnable   :T_VkBool32;
       logicOp         :T_VkLogicOp;
       attachmentCount :T_uint32_t;
       pAttachments    :P_VkPipelineColorBlendAttachmentState;
       blendConstants  :array [ 0..3 ] of T_float;
     end;
     P_VkPipelineColorBlendStateCreateInfo = ^T_VkPipelineColorBlendStateCreateInfo;

type T_VkPipelineDynamicStateCreateInfo = record
       sType             :T_VkStructureType;
       pNext             :P_void;
       flags             :T_VkPipelineDynamicStateCreateFlags;
       dynamicStateCount :T_uint32_t;
       pDynamicStates    :P_VkDynamicState;
     end;
     P_VkPipelineDynamicStateCreateInfo = ^T_VkPipelineDynamicStateCreateInfo;

type T_VkGraphicsPipelineCreateInfo = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       flags               :T_VkPipelineCreateFlags;
       stageCount          :T_uint32_t;
       pStages             :P_VkPipelineShaderStageCreateInfo;
       pVertexInputState   :P_VkPipelineVertexInputStateCreateInfo;
       pInputAssemblyState :P_VkPipelineInputAssemblyStateCreateInfo;
       pTessellationState  :P_VkPipelineTessellationStateCreateInfo;
       pViewportState      :P_VkPipelineViewportStateCreateInfo;
       pRasterizationState :P_VkPipelineRasterizationStateCreateInfo;
       pMultisampleState   :P_VkPipelineMultisampleStateCreateInfo;
       pDepthStencilState  :P_VkPipelineDepthStencilStateCreateInfo;
       pColorBlendState    :P_VkPipelineColorBlendStateCreateInfo;
       pDynamicState       :P_VkPipelineDynamicStateCreateInfo;
       layout              :T_VkPipelineLayout;
       renderPass          :T_VkRenderPass;
       subpass             :T_uint32_t;
       basePipelineHandle  :T_VkPipeline;
       basePipelineIndex   :T_int32_t;
     end;
     P_VkGraphicsPipelineCreateInfo = ^T_VkGraphicsPipelineCreateInfo;

type T_VkPushConstantRange = record
       stageFlags :T_VkShaderStageFlags;
       offset     :T_uint32_t;
       size       :T_uint32_t;
     end;
     P_VkPushConstantRange = ^T_VkPushConstantRange;

type T_VkPipelineLayoutCreateInfo = record
       sType                  :T_VkStructureType;
       pNext                  :P_void;
       flags                  :T_VkPipelineLayoutCreateFlags;
       setLayoutCount         :T_uint32_t;
       pSetLayouts            :P_VkDescriptorSetLayout;
       pushConstantRangeCount :T_uint32_t;
       pPushConstantRanges    :P_VkPushConstantRange;
     end;
     P_VkPipelineLayoutCreateInfo = ^T_VkPipelineLayoutCreateInfo;

type T_VkSamplerCreateInfo = record
       sType                   :T_VkStructureType;
       pNext                   :P_void;
       flags                   :T_VkSamplerCreateFlags;
       magFilter               :T_VkFilter;
       minFilter               :T_VkFilter;
       mipmapMode              :T_VkSamplerMipmapMode;
       addressModeU            :T_VkSamplerAddressMode;
       addressModeV            :T_VkSamplerAddressMode;
       addressModeW            :T_VkSamplerAddressMode;
       mipLodBias              :T_float;
       anisotropyEnable        :T_VkBool32;
       maxAnisotropy           :T_float;
       compareEnable           :T_VkBool32;
       compareOp               :T_VkCompareOp;
       minLod                  :T_float;
       maxLod                  :T_float;
       borderColor             :T_VkBorderColor;
       unnormalizedCoordinates :T_VkBool32;
     end;
     P_VkSamplerCreateInfo = ^T_VkSamplerCreateInfo;

type T_VkCopyDescriptorSet = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       srcSet          :T_VkDescriptorSet;
       srcBinding      :T_uint32_t;
       srcArrayElement :T_uint32_t;
       dstSet          :T_VkDescriptorSet;
       dstBinding      :T_uint32_t;
       dstArrayElement :T_uint32_t;
       descriptorCount :T_uint32_t;
     end;
     P_VkCopyDescriptorSet = ^T_VkCopyDescriptorSet;

type T_VkDescriptorBufferInfo = record
       buffer :T_VkBuffer;
       offset :T_VkDeviceSize;
       range  :T_VkDeviceSize;
     end;
     P_VkDescriptorBufferInfo = ^T_VkDescriptorBufferInfo;

type T_VkDescriptorImageInfo = record
       sampler     :T_VkSampler;
       imageView   :T_VkImageView;
       imageLayout :T_VkImageLayout;
     end;
     P_VkDescriptorImageInfo = ^T_VkDescriptorImageInfo;

type T_VkDescriptorPoolSize = record
       &type           :T_VkDescriptorType;
       descriptorCount :T_uint32_t;
     end;
     P_VkDescriptorPoolSize = ^T_VkDescriptorPoolSize;

type T_VkDescriptorPoolCreateInfo = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       flags         :T_VkDescriptorPoolCreateFlags;
       maxSets       :T_uint32_t;
       poolSizeCount :T_uint32_t;
       pPoolSizes    :P_VkDescriptorPoolSize;
     end;
     P_VkDescriptorPoolCreateInfo = ^T_VkDescriptorPoolCreateInfo;

type T_VkDescriptorSetAllocateInfo = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       descriptorPool     :T_VkDescriptorPool;
       descriptorSetCount :T_uint32_t;
       pSetLayouts        :P_VkDescriptorSetLayout;
     end;
     P_VkDescriptorSetAllocateInfo = ^T_VkDescriptorSetAllocateInfo;

type T_VkDescriptorSetLayoutBinding = record
       binding            :T_uint32_t;
       descriptorType     :T_VkDescriptorType;
       descriptorCount    :T_uint32_t;
       stageFlags         :T_VkShaderStageFlags;
       pImmutableSamplers :P_VkSampler;
     end;
     P_VkDescriptorSetLayoutBinding = ^T_VkDescriptorSetLayoutBinding;

type T_VkDescriptorSetLayoutCreateInfo = record
       sType        :T_VkStructureType;
       pNext        :P_void;
       flags        :T_VkDescriptorSetLayoutCreateFlags;
       bindingCount :T_uint32_t;
       pBindings    :P_VkDescriptorSetLayoutBinding;
     end;
     P_VkDescriptorSetLayoutCreateInfo = ^T_VkDescriptorSetLayoutCreateInfo;

type T_VkWriteDescriptorSet = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       dstSet           :T_VkDescriptorSet;
       dstBinding       :T_uint32_t;
       dstArrayElement  :T_uint32_t;
       descriptorCount  :T_uint32_t;
       descriptorType   :T_VkDescriptorType;
       pImageInfo       :P_VkDescriptorImageInfo;
       pBufferInfo      :P_VkDescriptorBufferInfo;
       pTexelBufferView :P_VkBufferView;
     end;
     P_VkWriteDescriptorSet = ^T_VkWriteDescriptorSet;

type T_VkAttachmentDescription = record
       flags          :T_VkAttachmentDescriptionFlags;
       format         :T_VkFormat;
       samples        :T_VkSampleCountFlagBits;
       loadOp         :T_VkAttachmentLoadOp;
       storeOp        :T_VkAttachmentStoreOp;
       stencilLoadOp  :T_VkAttachmentLoadOp;
       stencilStoreOp :T_VkAttachmentStoreOp;
       initialLayout  :T_VkImageLayout;
       finalLayout    :T_VkImageLayout;
     end;
     P_VkAttachmentDescription = ^T_VkAttachmentDescription;

type T_VkAttachmentReference = record
       attachment :T_uint32_t;
       layout     :T_VkImageLayout;
     end;
     P_VkAttachmentReference = ^T_VkAttachmentReference;

type T_VkFramebufferCreateInfo = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       flags           :T_VkFramebufferCreateFlags;
       renderPass      :T_VkRenderPass;
       attachmentCount :T_uint32_t;
       pAttachments    :P_VkImageView;
       width           :T_uint32_t;
       height          :T_uint32_t;
       layers          :T_uint32_t;
     end;
     P_VkFramebufferCreateInfo = ^T_VkFramebufferCreateInfo;

type T_VkSubpassDescription = record
       flags                   :T_VkSubpassDescriptionFlags;
       pipelineBindPoint       :T_VkPipelineBindPoint;
       inputAttachmentCount    :T_uint32_t;
       pInputAttachments       :P_VkAttachmentReference;
       colorAttachmentCount    :T_uint32_t;
       pColorAttachments       :P_VkAttachmentReference;
       pResolveAttachments     :P_VkAttachmentReference;
       pDepthStencilAttachment :P_VkAttachmentReference;
       preserveAttachmentCount :T_uint32_t;
       pPreserveAttachments    :P_uint32_t;
     end;
     P_VkSubpassDescription = ^T_VkSubpassDescription;

type T_VkSubpassDependency = record
       srcSubpass      :T_uint32_t;
       dstSubpass      :T_uint32_t;
       srcStageMask    :T_VkPipelineStageFlags;
       dstStageMask    :T_VkPipelineStageFlags;
       srcAccessMask   :T_VkAccessFlags;
       dstAccessMask   :T_VkAccessFlags;
       dependencyFlags :T_VkDependencyFlags;
     end;
     P_VkSubpassDependency = ^T_VkSubpassDependency;

type T_VkRenderPassCreateInfo = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       flags           :T_VkRenderPassCreateFlags;
       attachmentCount :T_uint32_t;
       pAttachments    :P_VkAttachmentDescription;
       subpassCount    :T_uint32_t;
       pSubpasses      :P_VkSubpassDescription;
       dependencyCount :T_uint32_t;
       pDependencies   :P_VkSubpassDependency;
     end;
     P_VkRenderPassCreateInfo = ^T_VkRenderPassCreateInfo;

type T_VkCommandPoolCreateInfo = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       flags            :T_VkCommandPoolCreateFlags;
       queueFamilyIndex :T_uint32_t;
     end;
     P_VkCommandPoolCreateInfo = ^T_VkCommandPoolCreateInfo;

type T_VkCommandBufferAllocateInfo = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       commandPool        :T_VkCommandPool;
       level              :T_VkCommandBufferLevel;
       commandBufferCount :T_uint32_t;
     end;
     P_VkCommandBufferAllocateInfo = ^T_VkCommandBufferAllocateInfo;

type T_VkCommandBufferInheritanceInfo = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       renderPass           :T_VkRenderPass;
       subpass              :T_uint32_t;
       framebuffer          :T_VkFramebuffer;
       occlusionQueryEnable :T_VkBool32;
       queryFlags           :T_VkQueryControlFlags;
       pipelineStatistics   :T_VkQueryPipelineStatisticFlags;
     end;
     P_VkCommandBufferInheritanceInfo = ^T_VkCommandBufferInheritanceInfo;

type T_VkCommandBufferBeginInfo = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       flags            :T_VkCommandBufferUsageFlags;
       pInheritanceInfo :P_VkCommandBufferInheritanceInfo;
     end;
     P_VkCommandBufferBeginInfo = ^T_VkCommandBufferBeginInfo;

type T_VkBufferCopy = record
       srcOffset :T_VkDeviceSize;
       dstOffset :T_VkDeviceSize;
       size      :T_VkDeviceSize;
     end;
     P_VkBufferCopy = ^T_VkBufferCopy;

type T_VkImageSubresourceLayers = record
       aspectMask     :T_VkImageAspectFlags;
       mipLevel       :T_uint32_t;
       baseArrayLayer :T_uint32_t;
       layerCount     :T_uint32_t;
     end;
     P_VkImageSubresourceLayers = ^T_VkImageSubresourceLayers;

type T_VkBufferImageCopy = record
       bufferOffset      :T_VkDeviceSize;
       bufferRowLength   :T_uint32_t;
       bufferImageHeight :T_uint32_t;
       imageSubresource  :T_VkImageSubresourceLayers;
       imageOffset       :T_VkOffset3D;
       imageExtent       :T_VkExtent3D;
     end;
     P_VkBufferImageCopy = ^T_VkBufferImageCopy;

type T_VkClearColorValue = record
       case Byte of
         0: ( float32 :array [ 0..3 ] of T_float;    );
         1: ( int32   :array [ 0..3 ] of T_int32_t;  );
         2: ( uint32  :array [ 0..3 ] of T_uint32_t; );
     end;
     P_VkClearColorValue = ^T_VkClearColorValue;

type T_VkClearDepthStencilValue = record
       depth   :T_float;
       stencil :T_uint32_t;
     end;
     P_VkClearDepthStencilValue = ^T_VkClearDepthStencilValue;

type T_VkClearValue = record
       case Byte of
         0: ( color        :T_VkClearColorValue;        );
         1: ( depthStencil :T_VkClearDepthStencilValue; );
     end;
     P_VkClearValue = ^T_VkClearValue;

type T_VkClearAttachment = record
       aspectMask      :T_VkImageAspectFlags;
       colorAttachment :T_uint32_t;
       clearValue      :T_VkClearValue;
     end;
     P_VkClearAttachment = ^T_VkClearAttachment;

type T_VkClearRect = record
       rect           :T_VkRect2D;
       baseArrayLayer :T_uint32_t;
       layerCount     :T_uint32_t;
     end;
     P_VkClearRect = ^T_VkClearRect;


type T_VkImageBlit = record
       srcSubresource :T_VkImageSubresourceLayers;
       srcOffsets     :array [ 0..1 ] of T_VkOffset3D;
       dstSubresource :T_VkImageSubresourceLayers;
       dstOffsets     :array [ 0..1 ] of T_VkOffset3D;
     end;
     P_VkImageBlit = ^T_VkImageBlit;

type T_VkImageCopy = record
       srcSubresource :T_VkImageSubresourceLayers;
       srcOffset      :T_VkOffset3D;
       dstSubresource :T_VkImageSubresourceLayers;
       dstOffset      :T_VkOffset3D;
       extent         :T_VkExtent3D;
     end;
     P_VkImageCopy = ^T_VkImageCopy;

type T_VkImageResolve = record
       srcSubresource :T_VkImageSubresourceLayers;
       srcOffset      :T_VkOffset3D;
       dstSubresource :T_VkImageSubresourceLayers;
       dstOffset      :T_VkOffset3D;
       extent         :T_VkExtent3D;
     end;
     P_VkImageResolve = ^T_VkImageResolve;

type T_VkRenderPassBeginInfo = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       renderPass      :T_VkRenderPass;
       framebuffer     :T_VkFramebuffer;
       renderArea      :T_VkRect2D;
       clearValueCount :T_uint32_t;
       pClearValues    :P_VkClearValue;
     end;
     P_VkRenderPassBeginInfo = ^T_VkRenderPassBeginInfo;

type
T_PFN_vkCreateInstance = function( const pCreateInfo_ :P_VkInstanceCreateInfo;
                                   const pAllocator_  :P_VkAllocationCallbacks;
                                         pInstance_   :P_VkInstance ) :T_VkResult;
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyInstance = procedure(       instance_   :T_VkInstance;
                                     const pAllocator_ :P_VkAllocationCallbacks );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkEnumeratePhysicalDevices = function( instance_             :T_VkInstance;
                                             pPhysicalDeviceCount_ :P_uint32_t;
                                             pPhysicalDevices_     :P_VkPhysicalDevice ) :T_VkResult;
                                   {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceFeatures = procedure( physicalDevice_ :T_VkPhysicalDevice;
                                               pFeatures_      :P_VkPhysicalDeviceFeatures );
                                    {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceFormatProperties = procedure( physicalDevice_    :T_VkPhysicalDevice;
                                                       format_            :T_VkFormat;
                                                       pFormatProperties_ :P_VkFormatProperties );
                                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceImageFormatProperties = function( physicalDevice_         :T_VkPhysicalDevice;
                                                           format_                 :T_VkFormat;
                                                           type_                   :T_VkImageType;
                                                           tiling_                 :T_VkImageTiling;
                                                           usage_                  :T_VkImageUsageFlags;
                                                           flags_                  :T_VkImageCreateFlags;
                                                           pImageFormatProperties_ :P_VkImageFormatProperties ) :T_VkResult;
                                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceProperties = procedure( physicalDevice_ :T_VkPhysicalDevice;
                                                 pProperties_    :P_VkPhysicalDeviceProperties );
                                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceQueueFamilyProperties = procedure( physicalDevice_            :T_VkPhysicalDevice;
                                                            pQueueFamilyPropertyCount_ :P_uint32_t;
                                                            pQueueFamilyProperties_    :P_VkQueueFamilyProperties );
                                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceMemoryProperties = procedure( physicalDevice_    :T_VkPhysicalDevice;
                                                       pMemoryProperties_ :P_VkPhysicalDeviceMemoryProperties );
                                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetInstanceProcAddr = function(       instance_ :T_VkInstance;
                                        const pName_    :P_char ) :T_PFN_vkVoidFunction;
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceProcAddr = function(       device_ :T_VkDevice;
                                      const pName_  :P_char ) :T_PFN_vkVoidFunction;
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateDevice = function(       physicalDevice_ :T_VkPhysicalDevice;
                                 const pCreateInfo_    :P_VkDeviceCreateInfo;
                                 const pAllocator_     :P_VkAllocationCallbacks;
                                       pDevice_        :P_VkDevice ) :T_VkResult;
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyDevice = procedure(       device_     :T_VkDevice;
                                   const pAllocator_ :P_VkAllocationCallbacks );
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkEnumerateInstanceExtensionProperties = function( const pLayerName_     :P_char;
                                                               pPropertyCount_ :P_uint32_t;
                                                               pProperties_    :P_VkExtensionProperties ) :T_VkResult;
                                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkEnumerateDeviceExtensionProperties = function(       physicalDevice_ :T_VkPhysicalDevice;
                                                       const pLayerName_     :P_char;
                                                             pPropertyCount_ :P_uint32_t;
                                                             pProperties_    :P_VkExtensionProperties ) :T_VkResult;
                                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkEnumerateInstanceLayerProperties = function( pPropertyCount_ :P_uint32_t;
                                                     pProperties_    :P_VkLayerProperties ) :T_VkResult;
                                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkEnumerateDeviceLayerProperties = function( physicalDevice_ :T_VkPhysicalDevice;
                                                   pPropertyCount_ :P_uint32_t;
                                                   pProperties_    :P_VkLayerProperties ) :T_VkResult;
                                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceQueue = procedure( device_           :T_VkDevice;
                                    queueFamilyIndex_ :T_uint32_t;
                                    queueIndex_       :T_uint32_t;
                                    pQueue_           :P_VkQueue );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkQueueSubmit = function(       queue_       :T_VkQueue;
                                      submitCount_ :T_uint32_t;
                                const pSubmits_    :P_VkSubmitInfo;
                                      fence_       :T_VkFence ) :T_VkResult;
                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkQueueWaitIdle = function( queue_ :T_VkQueue ) :T_VkResult;
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDeviceWaitIdle = function( device_ :T_VkDevice ) :T_VkResult;
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkAllocateMemory = function(       device_        :T_VkDevice;
                                   const pAllocateInfo_ :P_VkMemoryAllocateInfo;
                                   const pAllocator_    :P_VkAllocationCallbacks;
                                         pMemory_       :P_VkDeviceMemory ) :T_VkResult;
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkFreeMemory = procedure(       device_     :T_VkDevice;
                                      memory_     :T_VkDeviceMemory;
                                const pAllocator_ :P_VkAllocationCallbacks );
                     {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkMapMemory = function( device_ :T_VkDevice;
                              memory_ :T_VkDeviceMemory;
                              offset_ :T_VkDeviceSize;
                              size_   :T_VkDeviceSize;
                              flags_  :T_VkMemoryMapFlags;
                              ppData_ :PP_void ) :T_VkResult;
                    {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkUnmapMemory = procedure( device_ :T_VkDevice;
                                 memory_ :T_VkDeviceMemory );
                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkFlushMappedMemoryRanges = function(       device_           :T_VkDevice;
                                                  memoryRangeCount_ :T_uint32_t;
                                            const pMemoryRanges_    :P_VkMappedMemoryRange ) :T_VkResult;
                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkInvalidateMappedMemoryRanges = function(       device_           :T_VkDevice;
                                                       memoryRangeCount_ :T_uint32_t;
                                                 const pMemoryRanges_    :P_VkMappedMemoryRange ) :T_VkResult;
                                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceMemoryCommitment = procedure( device_                  :T_VkDevice;
                                               memory_                  :T_VkDeviceMemory;
                                               pCommittedMemoryInBytes_ :P_VkDeviceSize );
                                    {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkBindBufferMemory = function( device_       :T_VkDevice;
                                     buffer_       :T_VkBuffer;
                                     memory_       :T_VkDeviceMemory;
                                     memoryOffset_ :T_VkDeviceSize ) :T_VkResult;
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkBindImageMemory = function( device_       :T_VkDevice;
                                    image_        :T_VkImage;
                                    memory_       :T_VkDeviceMemory;
                                    memoryOffset_ :T_VkDeviceSize ) :T_VkResult;
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetBufferMemoryRequirements = procedure( device_              :T_VkDevice;
                                                 buffer_              :T_VkBuffer;
                                                 pMemoryRequirements_ :P_VkMemoryRequirements );
                                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetImageMemoryRequirements = procedure( device_              :T_VkDevice;
                                                image_               :T_VkImage;
                                                pMemoryRequirements_ :P_VkMemoryRequirements );
                                     {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetImageSparseMemoryRequirements = procedure( device_                        :T_VkDevice;
                                                      image_                         :T_VkImage;
                                                      pSparseMemoryRequirementCount_ :P_uint32_t;
                                                      pSparseMemoryRequirements_     :P_VkSparseImageMemoryRequirements );
                                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceSparseImageFormatProperties = procedure( physicalDevice_ :T_VkPhysicalDevice;
                                                                  format_         :T_VkFormat;
                                                                  type_           :T_VkImageType;
                                                                  samples_        :T_VkSampleCountFlagBits;
                                                                  usage_          :T_VkImageUsageFlags;
                                                                  tiling_         :T_VkImageTiling;
                                                                  pPropertyCount_ :P_uint32_t;
                                                                  pProperties_    :P_VkSparseImageFormatProperties );
                                                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkQueueBindSparse = function(       queue_         :T_VkQueue;
                                          bindInfoCount_ :T_uint32_t;
                                    const pBindInfo_     :P_VkBindSparseInfo;
                                          fence_         :T_VkFence ) :T_VkResult;
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateFence = function(       device_      :T_VkDevice;
                                const pCreateInfo_ :P_VkFenceCreateInfo;
                                const pAllocator_  :P_VkAllocationCallbacks;
                                      pFence_      :P_VkFence ) :T_VkResult;
                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyFence = procedure(       device_     :T_VkDevice;
                                        fence_      :T_VkFence;
                                  const pAllocator_ :P_VkAllocationCallbacks );
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkResetFences = function(       device_     :T_VkDevice;
                                      fenceCount_ :T_uint32_t;
                                const pFences_    :P_VkFence ) :T_VkResult;
                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetFenceStatus = function( device_ :T_VkDevice;
                                   fence_  :T_VkFence ) :T_VkResult;
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkWaitForFences = function(       device_     :T_VkDevice;
                                        fenceCount_ :T_uint32_t;
                                  const pFences_    :P_VkFence;
                                        waitAll_    :T_VkBool32;
                                        timeout_    :T_uint64_t ) :T_VkResult;
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateSemaphore = function(       device_      :T_VkDevice;
                                    const pCreateInfo_ :P_VkSemaphoreCreateInfo;
                                    const pAllocator_  :P_VkAllocationCallbacks;
                                          pSemaphore_  :P_VkSemaphore ) :T_VkResult;
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroySemaphore = procedure(       device_     :T_VkDevice;
                                            semaphore_  :T_VkSemaphore;
                                      const pAllocator_ :P_VkAllocationCallbacks );
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateEvent = function(       device_      :T_VkDevice;
                                const pCreateInfo_ :P_VkEventCreateInfo;
                                const pAllocator_  :P_VkAllocationCallbacks;
                                      pEvent_      :P_VkEvent ) :T_VkResult;
                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyEvent = procedure(       device_     :T_VkDevice;
                                        event_      :T_VkEvent;
                                  const pAllocator_ :P_VkAllocationCallbacks );
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetEventStatus = function( device_ :T_VkDevice;
                                   event_  :T_VkEvent ) :T_VkResult;
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkSetEvent = function( device_ :T_VkDevice;
                             event_  :T_VkEvent ) :T_VkResult;
                   {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkResetEvent = function( device_ :T_VkDevice;
                               event_  :T_VkEvent ) :T_VkResult;
                     {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateQueryPool = function(       device_      :T_VkDevice;
                                    const pCreateInfo_ :P_VkQueryPoolCreateInfo;
                                    const pAllocator_  :P_VkAllocationCallbacks;
                                          pQueryPool_  :P_VkQueryPool ) :T_VkResult;
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyQueryPool = procedure(       device_     :T_VkDevice;
                                            queryPool_  :T_VkQueryPool;
                                      const pAllocator_ :P_VkAllocationCallbacks );
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetQueryPoolResults = function( device_     :T_VkDevice;
                                        queryPool_  :T_VkQueryPool;
                                        firstQuery_ :T_uint32_t;
                                        queryCount_ :T_uint32_t;
                                        dataSize_   :T_size_t;
                                        pData_      :P_void;
                                        stride_     :T_VkDeviceSize;
                                        flags_      :T_VkQueryResultFlags ) :T_VkResult;
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateBuffer = function(       device_      :T_VkDevice;
                                 const pCreateInfo_ :P_VkBufferCreateInfo;
                                 const pAllocator_  :P_VkAllocationCallbacks;
                                       pBuffer_     :P_VkBuffer ) :T_VkResult;
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyBuffer = procedure(       device_     :T_VkDevice;
                                         buffer_     :T_VkBuffer;
                                   const pAllocator_ :P_VkAllocationCallbacks );
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateBufferView = function(       device_      :T_VkDevice;
                                     const pCreateInfo_ :P_VkBufferViewCreateInfo;
                                     const pAllocator_  :P_VkAllocationCallbacks;
                                           pView_       :P_VkBufferView ) :T_VkResult;
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyBufferView = procedure(       device_     :T_VkDevice;
                                             bufferView_ :T_VkBufferView;
                                       const pAllocator_ :P_VkAllocationCallbacks );
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateImage = function(       device_      :T_VkDevice;
                                const pCreateInfo_ :P_VkImageCreateInfo;
                                const pAllocator_  :P_VkAllocationCallbacks;
                                      pImage_      :P_VkImage ) :T_VkResult;
                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyImage = procedure(       device_     :T_VkDevice;
                                        image_      :T_VkImage;
                                  const pAllocator_ :P_VkAllocationCallbacks );
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetImageSubresourceLayout = procedure(       device_       :T_VkDevice;
                                                     image_        :T_VkImage;
                                               const pSubresource_ :P_VkImageSubresource;
                                                     pLayout_      :P_VkSubresourceLayout );
                                    {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateImageView = function(       device_      :T_VkDevice;
                                    const pCreateInfo_ :P_VkImageViewCreateInfo;
                                    const pAllocator_  :P_VkAllocationCallbacks;
                                          pView_       :P_VkImageView ) :T_VkResult;
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyImageView = procedure(       device_     :T_VkDevice;
                                            imageView_  :T_VkImageView;
                                      const pAllocator_ :P_VkAllocationCallbacks );
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateShaderModule = function(       device_        :T_VkDevice;
                                       const pCreateInfo_   :P_VkShaderModuleCreateInfo;
                                       const pAllocator_    :P_VkAllocationCallbacks;
                                             pShaderModule_ :P_VkShaderModule ) :T_VkResult;
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyShaderModule = procedure(       device_       :T_VkDevice;
                                               shaderModule_ :T_VkShaderModule;
                                         const pAllocator_   :P_VkAllocationCallbacks );
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreatePipelineCache = function(       device_         :T_VkDevice;
                                        const pCreateInfo_    :P_VkPipelineCacheCreateInfo;
                                        const pAllocator_     :P_VkAllocationCallbacks;
                                              pPipelineCache_ :P_VkPipelineCache ) :T_VkResult;
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyPipelineCache = procedure(       device_        :T_VkDevice;
                                                pipelineCache_ :T_VkPipelineCache;
                                          const pAllocator_    :P_VkAllocationCallbacks );
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPipelineCacheData = function( device_        :T_VkDevice;
                                         pipelineCache_ :T_VkPipelineCache;
                                         pDataSize_     :P_size_t;
                                         pData_         :P_void ) :T_VkResult;
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkMergePipelineCaches = function(       device_        :T_VkDevice;
                                              dstCache_      :T_VkPipelineCache;
                                              srcCacheCount_ :T_uint32_t;
                                        const pSrcCaches_    :P_VkPipelineCache ) :T_VkResult;
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateGraphicsPipelines = function(       device_          :T_VkDevice;
                                                  pipelineCache_   :T_VkPipelineCache;
                                                  createInfoCount_ :T_uint32_t;
                                            const pCreateInfos_    :P_VkGraphicsPipelineCreateInfo;
                                            const pAllocator_      :P_VkAllocationCallbacks;
                                                  pPipelines_      :P_VkPipeline ) :T_VkResult;
                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateComputePipelines = function(       device_          :T_VkDevice;
                                                 pipelineCache_   :T_VkPipelineCache;
                                                 createInfoCount_ :T_uint32_t;
                                           const pCreateInfos_    :P_VkComputePipelineCreateInfo;
                                           const pAllocator_      :P_VkAllocationCallbacks;
                                                 pPipelines_      :P_VkPipeline ) :T_VkResult;
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyPipeline = procedure(       device_     :T_VkDevice;
                                           pipeline_   :T_VkPipeline;
                                     const pAllocator_ :P_VkAllocationCallbacks );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreatePipelineLayout = function(       device_          :T_VkDevice;
                                         const pCreateInfo_     :P_VkPipelineLayoutCreateInfo;
                                         const pAllocator_      :P_VkAllocationCallbacks;
                                               pPipelineLayout_ :P_VkPipelineLayout ) :T_VkResult;
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyPipelineLayout = procedure(       device_         :T_VkDevice;
                                                 pipelineLayout_ :T_VkPipelineLayout;
                                           const pAllocator_     :P_VkAllocationCallbacks );
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateSampler = function(       device_      :T_VkDevice;
                                  const pCreateInfo_ :P_VkSamplerCreateInfo;
                                  const pAllocator_  :P_VkAllocationCallbacks;
                                        pSampler_    :P_VkSampler ) :T_VkResult;
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroySampler = procedure(       device_     :T_VkDevice;
                                          sampler_    :T_VkSampler;
                                    const pAllocator_ :P_VkAllocationCallbacks );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateDescriptorSetLayout = function(       device_      :T_VkDevice;
                                              const pCreateInfo_ :P_VkDescriptorSetLayoutCreateInfo;
                                              const pAllocator_  :P_VkAllocationCallbacks;
                                                    pSetLayout_  :P_VkDescriptorSetLayout ) :T_VkResult;
                                    {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyDescriptorSetLayout = procedure(       device_              :T_VkDevice;
                                                      descriptorSetLayout_ :T_VkDescriptorSetLayout;
                                                const pAllocator_          :P_VkAllocationCallbacks );
                                     {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateDescriptorPool = function(       device_          :T_VkDevice;
                                         const pCreateInfo_     :P_VkDescriptorPoolCreateInfo;
                                         const pAllocator_      :P_VkAllocationCallbacks;
                                               pDescriptorPool_ :P_VkDescriptorPool ) :T_VkResult;
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyDescriptorPool = procedure(       device_         :T_VkDevice;
                                                 descriptorPool_ :T_VkDescriptorPool;
                                           const pAllocator_     :P_VkAllocationCallbacks );
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkResetDescriptorPool = function( device_         :T_VkDevice;
                                        descriptorPool_ :T_VkDescriptorPool;
                                        flags_          :T_VkDescriptorPoolResetFlags ) :T_VkResult;
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkAllocateDescriptorSets = function(       device_          :T_VkDevice;
                                           const pAllocateInfo_   :P_VkDescriptorSetAllocateInfo;
                                                 pDescriptorSets_ :P_VkDescriptorSet ) :T_VkResult;
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkFreeDescriptorSets = function(       device_             :T_VkDevice;
                                             descriptorPool_     :T_VkDescriptorPool;
                                             descriptorSetCount_ :T_uint32_t;
                                       const pDescriptorSets_    :P_VkDescriptorSet ) :T_VkResult;
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkUpdateDescriptorSets = procedure(       device_               :T_VkDevice;
                                                descriptorWriteCount_ :T_uint32_t;
                                          const pDescriptorWrites_    :P_VkWriteDescriptorSet;
                                                descriptorCopyCount_  :T_uint32_t;
                                          const pDescriptorCopies_    :P_VkCopyDescriptorSet );
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateFramebuffer = function(       device_       :T_VkDevice;
                                      const pCreateInfo_  :P_VkFramebufferCreateInfo;
                                      const pAllocator_   :P_VkAllocationCallbacks;
                                            pFramebuffer_ :P_VkFramebuffer ) :T_VkResult;
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyFramebuffer = procedure(       device_      :T_VkDevice;
                                              framebuffer_ :T_VkFramebuffer;
                                        const pAllocator_  :P_VkAllocationCallbacks );
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateRenderPass = function(       device_      :T_VkDevice;
                                     const pCreateInfo_ :P_VkRenderPassCreateInfo;
                                     const pAllocator_  :P_VkAllocationCallbacks;
                                           pRenderPass_ :P_VkRenderPass ) :T_VkResult;
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyRenderPass = procedure(       device_     :T_VkDevice;
                                             renderPass_ :T_VkRenderPass;
                                       const pAllocator_ :P_VkAllocationCallbacks );
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetRenderAreaGranularity = procedure( device_       :T_VkDevice;
                                              renderPass_   :T_VkRenderPass;
                                              pGranularity_ :P_VkExtent2D );
                                   {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateCommandPool = function(       device_       :T_VkDevice;
                                      const pCreateInfo_  :P_VkCommandPoolCreateInfo;
                                      const pAllocator_   :P_VkAllocationCallbacks;
                                            pCommandPool_ :P_VkCommandPool ) :T_VkResult;
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyCommandPool = procedure(       device_      :T_VkDevice;
                                              commandPool_ :T_VkCommandPool;
                                        const pAllocator_  :P_VkAllocationCallbacks );
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkResetCommandPool = function( device_      :T_VkDevice;
                                     commandPool_ :T_VkCommandPool;
                                     flags_       :T_VkCommandPoolResetFlags ) :T_VkResult;
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkAllocateCommandBuffers = function(       device_          :T_VkDevice;
                                           const pAllocateInfo_   :P_VkCommandBufferAllocateInfo;
                                                 pCommandBuffers_ :P_VkCommandBuffer ) :T_VkResult;
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkFreeCommandBuffers = procedure(       device_             :T_VkDevice;
                                              commandPool_        :T_VkCommandPool;
                                              commandBufferCount_ :T_uint32_t;
                                        const pCommandBuffers_    :P_VkCommandBuffer );
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkBeginCommandBuffer = function(       commandBuffer_ :T_VkCommandBuffer;
                                       const pBeginInfo_    :P_VkCommandBufferBeginInfo ) :T_VkResult;
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkEndCommandBuffer = function( commandBuffer_ :T_VkCommandBuffer ) :T_VkResult;
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkResetCommandBuffer = function( commandBuffer_ :T_VkCommandBuffer;
                                       flags_         :T_VkCommandBufferResetFlags ) :T_VkResult;
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBindPipeline = procedure( commandBuffer_     :T_VkCommandBuffer;
                                     pipelineBindPoint_ :T_VkPipelineBindPoint;
                                     pipeline_          :T_VkPipeline );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetViewport = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                          firstViewport_ :T_uint32_t;
                                          viewportCount_ :T_uint32_t;
                                    const pViewports_    :P_VkViewport );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetScissor = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                         firstScissor_  :T_uint32_t;
                                         scissorCount_  :T_uint32_t;
                                   const pScissors_     :P_VkRect2D );
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetLineWidth = procedure( commandBuffer_ :T_VkCommandBuffer;
                                     lineWidth_     :T_float );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetDepthBias = procedure( commandBuffer_           :T_VkCommandBuffer;
                                     depthBiasConstantFactor_ :T_float;
                                     depthBiasClamp_          :T_float;
                                     depthBiasSlopeFactor_    :T_float );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetBlendConstants = procedure(       commandBuffer_  :T_VkCommandBuffer;
                                          const blendConstants_ :P_float );
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetDepthBounds = procedure( commandBuffer_  :T_VkCommandBuffer;
                                       minDepthBounds_ :T_float;
                                       maxDepthBounds_ :T_float );
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetStencilCompareMask = procedure( commandBuffer_ :T_VkCommandBuffer;
                                              faceMask_      :T_VkStencilFaceFlags;
                                              compareMask_   :T_uint32_t );
                                   {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetStencilWriteMask = procedure( commandBuffer_ :T_VkCommandBuffer;
                                            faceMask_      :T_VkStencilFaceFlags;
                                            writeMask_     :T_uint32_t );
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetStencilReference = procedure( commandBuffer_ :T_VkCommandBuffer;
                                            faceMask_      :T_VkStencilFaceFlags;
                                            reference_     :T_uint32_t );
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBindDescriptorSets = procedure(       commandBuffer_      :T_VkCommandBuffer;
                                                 pipelineBindPoint_  :T_VkPipelineBindPoint;
                                                 layout_             :T_VkPipelineLayout;
                                                 firstSet_           :T_uint32_t;
                                                 descriptorSetCount_ :T_uint32_t;
                                           const pDescriptorSets_    :P_VkDescriptorSet;
                                                 dynamicOffsetCount_ :T_uint32_t;
                                           const pDynamicOffsets_    :P_uint32_t );
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBindIndexBuffer = procedure( commandBuffer_ :T_VkCommandBuffer;
                                        buffer_        :T_VkBuffer;
                                        offset_        :T_VkDeviceSize;
                                        indexType_     :T_VkIndexType );
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBindVertexBuffers = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                                firstBinding_  :T_uint32_t;
                                                bindingCount_  :T_uint32_t;
                                          const pBuffers_      :P_VkBuffer;
                                          const pOffsets_      :P_VkDeviceSize );
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdDraw = procedure( commandBuffer_ :T_VkCommandBuffer;
                             vertexCount_   :T_uint32_t;
                             instanceCount_ :T_uint32_t;
                             firstVertex_   :T_uint32_t;
                             firstInstance_ :T_uint32_t );
                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdDrawIndexed = procedure( commandBuffer_ :T_VkCommandBuffer;
                                    indexCount_    :T_uint32_t;
                                    instanceCount_ :T_uint32_t;
                                    firstIndex_    :T_uint32_t;
                                    vertexOffset_  :T_int32_t;
                                    firstInstance_ :T_uint32_t );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdDrawIndirect = procedure( commandBuffer_ :T_VkCommandBuffer;
                                     buffer_        :T_VkBuffer;
                                     offset_        :T_VkDeviceSize;
                                     drawCount_     :T_uint32_t;
                                     stride_        :T_uint32_t );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdDrawIndexedIndirect = procedure( commandBuffer_ :T_VkCommandBuffer;
                                            buffer_        :T_VkBuffer;
                                            offset_        :T_VkDeviceSize;
                                            drawCount_     :T_uint32_t;
                                            stride_        :T_uint32_t );
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdDispatch = procedure( commandBuffer_ :T_VkCommandBuffer;
                                 groupCountX_   :T_uint32_t;
                                 groupCountY_   :T_uint32_t;
                                 groupCountZ_   :T_uint32_t );
                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdDispatchIndirect = procedure( commandBuffer_ :T_VkCommandBuffer;
                                         buffer_        :T_VkBuffer;
                                         offset_        :T_VkDeviceSize );
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdCopyBuffer = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                         srcBuffer_     :T_VkBuffer;
                                         dstBuffer_     :T_VkBuffer;
                                         regionCount_   :T_uint32_t;
                                   const pRegions_      :P_VkBufferCopy );
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdCopyImage = procedure(       commandBuffer_  :T_VkCommandBuffer;
                                        srcImage_       :T_VkImage;
                                        srcImageLayout_ :T_VkImageLayout;
                                        dstImage_       :T_VkImage;
                                        dstImageLayout_ :T_VkImageLayout;
                                        regionCount_    :T_uint32_t;
                                  const pRegions_       :P_VkImageCopy );
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBlitImage = procedure(       commandBuffer_  :T_VkCommandBuffer;
                                        srcImage_       :T_VkImage;
                                        srcImageLayout_ :T_VkImageLayout;
                                        dstImage_       :T_VkImage;
                                        dstImageLayout_ :T_VkImageLayout;
                                        regionCount_    :T_uint32_t;
                                  const pRegions_       :P_VkImageBlit;
                                        filter_         :T_VkFilter );
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdCopyBufferToImage = procedure(       commandBuffer_  :T_VkCommandBuffer;
                                                srcBuffer_      :T_VkBuffer;
                                                dstImage_       :T_VkImage;
                                                dstImageLayout_ :T_VkImageLayout;
                                                regionCount_    :T_uint32_t;
                                          const pRegions_       :P_VkBufferImageCopy );
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdCopyImageToBuffer = procedure(       commandBuffer_  :T_VkCommandBuffer;
                                                srcImage_       :T_VkImage;
                                                srcImageLayout_ :T_VkImageLayout;
                                                dstBuffer_      :T_VkBuffer;
                                                regionCount_    :T_uint32_t;
                                          const pRegions_       :P_VkBufferImageCopy );
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdUpdateBuffer = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                           dstBuffer_     :T_VkBuffer;
                                           dstOffset_     :T_VkDeviceSize;
                                           dataSize_      :T_VkDeviceSize;
                                     const pData_         :P_void );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdFillBuffer = procedure( commandBuffer_ :T_VkCommandBuffer;
                                   dstBuffer_     :T_VkBuffer;
                                   dstOffset_     :T_VkDeviceSize;
                                   size_          :T_VkDeviceSize;
                                   data_          :T_uint32_t );
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdClearColorImage = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                              image_         :T_VkImage;
                                              imageLayout_   :T_VkImageLayout;
                                        const pColor_        :P_VkClearColorValue;
                                              rangeCount_    :T_uint32_t;
                                        const pRanges_       :P_VkImageSubresourceRange );
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdClearDepthStencilImage = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                                     image_         :T_VkImage;
                                                     imageLayout_   :T_VkImageLayout;
                                               const pDepthStencil_ :P_VkClearDepthStencilValue;
                                                     rangeCount_    :T_uint32_t;
                                               const pRanges_       :P_VkImageSubresourceRange );
                                    {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdClearAttachments = procedure(       commandBuffer_   :T_VkCommandBuffer;
                                               attachmentCount_ :T_uint32_t;
                                         const pAttachments_    :P_VkClearAttachment;
                                               rectCount_       :T_uint32_t;
                                         const pRects_          :P_VkClearRect );
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdResolveImage = procedure(       commandBuffer_  :T_VkCommandBuffer;
                                           srcImage_       :T_VkImage;
                                           srcImageLayout_ :T_VkImageLayout;
                                           dstImage_       :T_VkImage;
                                           dstImageLayout_ :T_VkImageLayout;
                                           regionCount_    :T_uint32_t;
                                     const pRegions_       :P_VkImageResolve );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetEvent = procedure( commandBuffer_ :T_VkCommandBuffer;
                                 event_         :T_VkEvent;
                                 stageMask_     :T_VkPipelineStageFlags );
                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdResetEvent = procedure( commandBuffer_ :T_VkCommandBuffer;
                                   event_         :T_VkEvent;
                                   stageMask_     :T_VkPipelineStageFlags );
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdWaitEvents = procedure(       commandBuffer_            :T_VkCommandBuffer;
                                         eventCount_               :T_uint32_t;
                                   const pEvents_                  :P_VkEvent;
                                         srcStageMask_             :T_VkPipelineStageFlags;
                                         dstStageMask_             :T_VkPipelineStageFlags;
                                         memoryBarrierCount_       :T_uint32_t;
                                   const pMemoryBarriers_          :P_VkMemoryBarrier;
                                         bufferMemoryBarrierCount_ :T_uint32_t;
                                   const pBufferMemoryBarriers_    :P_VkBufferMemoryBarrier;
                                         imageMemoryBarrierCount_  :T_uint32_t;
                                   const pImageMemoryBarriers_     :P_VkImageMemoryBarrier );
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdPipelineBarrier = procedure(       commandBuffer_            :T_VkCommandBuffer;
                                              srcStageMask_             :T_VkPipelineStageFlags;
                                              dstStageMask_             :T_VkPipelineStageFlags;
                                              dependencyFlags_          :T_VkDependencyFlags;
                                              memoryBarrierCount_       :T_uint32_t;
                                        const pMemoryBarriers_          :P_VkMemoryBarrier;
                                              bufferMemoryBarrierCount_ :T_uint32_t;
                                        const pBufferMemoryBarriers_    :P_VkBufferMemoryBarrier;
                                              imageMemoryBarrierCount_  :T_uint32_t;
                                        const pImageMemoryBarriers_     :P_VkImageMemoryBarrier );
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBeginQuery = procedure( commandBuffer_ :T_VkCommandBuffer;
                                   queryPool_     :T_VkQueryPool;
                                   query_         :T_uint32_t;
                                   flags_         :T_VkQueryControlFlags );
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdEndQuery = procedure( commandBuffer_ :T_VkCommandBuffer;
                                 queryPool_     :T_VkQueryPool;
                                 query_         :T_uint32_t );
                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdResetQueryPool = procedure( commandBuffer_ :T_VkCommandBuffer;
                                       queryPool_     :T_VkQueryPool;
                                       firstQuery_    :T_uint32_t;
                                       queryCount_    :T_uint32_t );
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdWriteTimestamp = procedure( commandBuffer_ :T_VkCommandBuffer;
                                       pipelineStage_ :T_VkPipelineStageFlagBits;
                                       queryPool_     :T_VkQueryPool;
                                       query_         :T_uint32_t );
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdCopyQueryPoolResults = procedure( commandBuffer_ :T_VkCommandBuffer;
                                             queryPool_     :T_VkQueryPool;
                                             firstQuery_    :T_uint32_t;
                                             queryCount_    :T_uint32_t;
                                             dstBuffer_     :T_VkBuffer;
                                             dstOffset_     :T_VkDeviceSize;
                                             stride_        :T_VkDeviceSize;
                                             flags_         :T_VkQueryResultFlags );
                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdPushConstants = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                            layout_        :T_VkPipelineLayout;
                                            stageFlags_    :T_VkShaderStageFlags;
                                            offset_        :T_uint32_t;
                                            size_          :T_uint32_t;
                                      const pValues_       :P_void );
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBeginRenderPass = procedure(       commandBuffer_    :T_VkCommandBuffer;
                                        const pRenderPassBegin_ :P_VkRenderPassBeginInfo;
                                              contents_         :T_VkSubpassContents );
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdNextSubpass = procedure( commandBuffer_ :T_VkCommandBuffer;
                                    contents_      :T_VkSubpassContents );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdEndRenderPass = procedure( commandBuffer_ :T_VkCommandBuffer );
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdExecuteCommands = procedure(       commandBuffer_      :T_VkCommandBuffer;
                                              commandBufferCount_ :T_uint32_t;
                                        const pCommandBuffers_    :P_VkCommandBuffer );
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}



// VK_VERSION_1_1 is a preprocessor guard. Do not pass it to API calls.

const VK_VERSION_1_1 = 1;
// Vulkan 1.1 version number
const VK_API_VERSION_1_1 = ( 0 shl 29 ) or ( 1 shl 22 ) or ( 1 shl 12 ) or 0;// Patch version should always be set to 0

//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkSamplerYcbcrConversion)
{$IF Defined( CPU64BITS ) }
type T_VkSamplerYcbcrConversion = ^T__VkSamplerYcbcrConversion;  T__VkSamplerYcbcrConversion = record end;  P_VkSamplerYcbcrConversion = ^T_VkSamplerYcbcrConversion;
{$ELSE}
type T_VkSamplerYcbcrConversion = T_uint64_t;  P_VkSamplerYcbcrConversion = ^T_VkSamplerYcbcrConversion;
{$ENDIF}
//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkDescriptorUpdateTemplate)
{$IF Defined( CPU64BITS ) }
type T_VkDescriptorUpdateTemplate = ^T__VkDescriptorUpdateTemplate;  T__VkDescriptorUpdateTemplate = record end;  P_VkDescriptorUpdateTemplate = ^T_VkDescriptorUpdateTemplate;
{$ELSE}
type T_VkDescriptorUpdateTemplate = T_uint64_t;  P_VkDescriptorUpdateTemplate = ^T_VkDescriptorUpdateTemplate;
{$ENDIF}
const VK_MAX_DEVICE_GROUP_SIZE = 32;
const VK_LUID_SIZE = 8;
const VK_QUEUE_FAMILY_EXTERNAL = T_uint32_t( $FFFFFFFE );

//typedef enum VkPointClippingBehavior {
type T_VkPointClippingBehavior = T_int32_t;  P_VkPointClippingBehavior = ^T_VkPointClippingBehavior;
const VK_POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES            = 0;
const VK_POINT_CLIPPING_BEHAVIOR_USER_CLIP_PLANES_ONLY      = 1;
const VK_POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES_KHR        = VK_POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES;
const VK_POINT_CLIPPING_BEHAVIOR_USER_CLIP_PLANES_ONLY_KHR  = VK_POINT_CLIPPING_BEHAVIOR_USER_CLIP_PLANES_ONLY;
const VK_POINT_CLIPPING_BEHAVIOR_MAX_ENUM                   = $7FFFFFFF;
//} VkPointClippingBehavior;

//typedef enum VkTessellationDomainOrigin {
type T_VkTessellationDomainOrigin = T_int32_t;  P_VkTessellationDomainOrigin = ^T_VkTessellationDomainOrigin;
const VK_TESSELLATION_DOMAIN_ORIGIN_UPPER_LEFT      = 0;
const VK_TESSELLATION_DOMAIN_ORIGIN_LOWER_LEFT      = 1;
const VK_TESSELLATION_DOMAIN_ORIGIN_UPPER_LEFT_KHR  = VK_TESSELLATION_DOMAIN_ORIGIN_UPPER_LEFT;
const VK_TESSELLATION_DOMAIN_ORIGIN_LOWER_LEFT_KHR  = VK_TESSELLATION_DOMAIN_ORIGIN_LOWER_LEFT;
const VK_TESSELLATION_DOMAIN_ORIGIN_MAX_ENUM        = $7FFFFFFF;
//} VkTessellationDomainOrigin;

//typedef enum VkSamplerYcbcrModelConversion {
type T_VkSamplerYcbcrModelConversion = T_int32_t;  P_VkSamplerYcbcrModelConversion = ^T_VkSamplerYcbcrModelConversion;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY        = 0;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY      = 1;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709           = 2;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601           = 3;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020          = 4;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR    = VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR  = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR       = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR       = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR      = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020;
const VK_SAMPLER_YCBCR_MODEL_CONVERSION_MAX_ENUM            = $7FFFFFFF;
//} VkSamplerYcbcrModelConversion;

//typedef enum VkSamplerYcbcrRange {
type T_VkSamplerYcbcrRange = T_int32_t;  P_VkSamplerYcbcrRange = ^T_VkSamplerYcbcrRange;
const VK_SAMPLER_YCBCR_RANGE_ITU_FULL        = 0;
const VK_SAMPLER_YCBCR_RANGE_ITU_NARROW      = 1;
const VK_SAMPLER_YCBCR_RANGE_ITU_FULL_KHR    = VK_SAMPLER_YCBCR_RANGE_ITU_FULL;
const VK_SAMPLER_YCBCR_RANGE_ITU_NARROW_KHR  = VK_SAMPLER_YCBCR_RANGE_ITU_NARROW;
const VK_SAMPLER_YCBCR_RANGE_MAX_ENUM        = $7FFFFFFF;
//} VkSamplerYcbcrRange;

//typedef enum VkChromaLocation {
type T_VkChromaLocation = T_int32_t;  P_VkChromaLocation = ^T_VkChromaLocation;
const VK_CHROMA_LOCATION_COSITED_EVEN      = 0;
const VK_CHROMA_LOCATION_MIDPOINT          = 1;
const VK_CHROMA_LOCATION_COSITED_EVEN_KHR  = VK_CHROMA_LOCATION_COSITED_EVEN;
const VK_CHROMA_LOCATION_MIDPOINT_KHR      = VK_CHROMA_LOCATION_MIDPOINT;
const VK_CHROMA_LOCATION_MAX_ENUM          = $7FFFFFFF;
//} VkChromaLocation;

//typedef enum VkDescriptorUpdateTemplateType {
type T_VkDescriptorUpdateTemplateType = T_int32_t;  P_VkDescriptorUpdateTemplateType = ^T_VkDescriptorUpdateTemplateType;
const VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET        = 0;
const VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_PUSH_DESCRIPTORS_KHR  = 1;
const VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET_KHR    = VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET;
const VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_MAX_ENUM              = $7FFFFFFF;
//} VkDescriptorUpdateTemplateType;

//typedef enum VkSubgroupFeatureFlagBits {
type T_VkSubgroupFeatureFlagBits = T_int32_t;  P_VkSubgroupFeatureFlagBits = ^T_VkSubgroupFeatureFlagBits;
const VK_SUBGROUP_FEATURE_BASIC_BIT                 = $00000001;
const VK_SUBGROUP_FEATURE_VOTE_BIT                  = $00000002;
const VK_SUBGROUP_FEATURE_ARITHMETIC_BIT            = $00000004;
const VK_SUBGROUP_FEATURE_BALLOT_BIT                = $00000008;
const VK_SUBGROUP_FEATURE_SHUFFLE_BIT               = $00000010;
const VK_SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT      = $00000020;
const VK_SUBGROUP_FEATURE_CLUSTERED_BIT             = $00000040;
const VK_SUBGROUP_FEATURE_QUAD_BIT                  = $00000080;
const VK_SUBGROUP_FEATURE_PARTITIONED_BIT_NV        = $00000100;
const VK_SUBGROUP_FEATURE_ROTATE_BIT_KHR            = $00000200;
const VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT_KHR  = $00000400;
const VK_SUBGROUP_FEATURE_FLAG_BITS_MAX_ENUM        = $7FFFFFFF;
//} VkSubgroupFeatureFlagBits;
type T_VkSubgroupFeatureFlags = T_VkFlags;  P_VkSubgroupFeatureFlags = ^T_VkSubgroupFeatureFlags;

//typedef enum VkPeerMemoryFeatureFlagBits {
type T_VkPeerMemoryFeatureFlagBits = T_int32_t;  P_VkPeerMemoryFeatureFlagBits = ^T_VkPeerMemoryFeatureFlagBits;
const VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT         = $00000001;
const VK_PEER_MEMORY_FEATURE_COPY_DST_BIT         = $00000002;
const VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT      = $00000004;
const VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT      = $00000008;
const VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT_KHR     = VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT;
const VK_PEER_MEMORY_FEATURE_COPY_DST_BIT_KHR     = VK_PEER_MEMORY_FEATURE_COPY_DST_BIT;
const VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT_KHR  = VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT;
const VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT_KHR  = VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT;
const VK_PEER_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM   = $7FFFFFFF;
//} VkPeerMemoryFeatureFlagBits;
type T_VkPeerMemoryFeatureFlags = T_VkFlags;  P_VkPeerMemoryFeatureFlags = ^T_VkPeerMemoryFeatureFlags;

//typedef enum VkMemoryAllocateFlagBits {
type T_VkMemoryAllocateFlagBits = T_int32_t;  P_VkMemoryAllocateFlagBits = ^T_VkMemoryAllocateFlagBits;
const VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT                        = $00000001;
const VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT                     = $00000002;
const VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT      = $00000004;
const VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT_KHR                    = VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT;
const VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT_KHR                 = VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT;
const VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR  = VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT;
const VK_MEMORY_ALLOCATE_FLAG_BITS_MAX_ENUM                     = $7FFFFFFF;
//} VkMemoryAllocateFlagBits;
type T_VkMemoryAllocateFlags = T_VkFlags;  P_VkMemoryAllocateFlags = ^T_VkMemoryAllocateFlags;
type T_VkCommandPoolTrimFlags = T_VkFlags;  P_VkCommandPoolTrimFlags = ^T_VkCommandPoolTrimFlags;
type T_VkDescriptorUpdateTemplateCreateFlags = T_VkFlags;  P_VkDescriptorUpdateTemplateCreateFlags = ^T_VkDescriptorUpdateTemplateCreateFlags;

//typedef enum VkExternalMemoryHandleTypeFlagBits {
type T_VkExternalMemoryHandleTypeFlagBits = T_int32_t;  P_VkExternalMemoryHandleTypeFlagBits = ^T_VkExternalMemoryHandleTypeFlagBits;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT                        = $00000001;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT                     = $00000002;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT                 = $00000004;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT                    = $00000008;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT                = $00000010;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT                       = $00000020;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT                   = $00000040;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT                      = $00000200;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID  = $00000400;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT              = $00000080;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_MAPPED_FOREIGN_MEMORY_BIT_EXT   = $00000100;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_ZIRCON_VMO_BIT_FUCHSIA               = $00000800;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_RDMA_ADDRESS_BIT_NV                  = $00001000;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_SCREEN_BUFFER_BIT_QNX                = $00004000;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT_KHR                    = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR                 = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR             = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT_KHR                = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT_KHR            = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT_KHR                   = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT_KHR               = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT;
const VK_EXTERNAL_MEMORY_HANDLE_TYPE_FLAG_BITS_MAX_ENUM                   = $7FFFFFFF;
//} VkExternalMemoryHandleTypeFlagBits;
type T_VkExternalMemoryHandleTypeFlags = T_VkFlags;  P_VkExternalMemoryHandleTypeFlags = ^T_VkExternalMemoryHandleTypeFlags;

//typedef enum VkExternalMemoryFeatureFlagBits {
type T_VkExternalMemoryFeatureFlagBits = T_int32_t;  P_VkExternalMemoryFeatureFlagBits = ^T_VkExternalMemoryFeatureFlagBits;
const VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT      = $00000001;
const VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT          = $00000002;
const VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT          = $00000004;
const VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT_KHR  = VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT;
const VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT_KHR      = VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT;
const VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT_KHR      = VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT;
const VK_EXTERNAL_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM      = $7FFFFFFF;
//} VkExternalMemoryFeatureFlagBits;
type T_VkExternalMemoryFeatureFlags = T_VkFlags;  P_VkExternalMemoryFeatureFlags = ^T_VkExternalMemoryFeatureFlags;

//typedef enum VkExternalFenceHandleTypeFlagBits {
type T_VkExternalFenceHandleTypeFlagBits = T_int32_t;  P_VkExternalFenceHandleTypeFlagBits = ^T_VkExternalFenceHandleTypeFlagBits;
const VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT             = $00000001;
const VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_BIT          = $00000002;
const VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT      = $00000004;
const VK_EXTERNAL_FENCE_HANDLE_TYPE_SYNC_FD_BIT               = $00000008;
const VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT_KHR         = VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT;
const VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR      = VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_BIT;
const VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR  = VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT;
const VK_EXTERNAL_FENCE_HANDLE_TYPE_SYNC_FD_BIT_KHR           = VK_EXTERNAL_FENCE_HANDLE_TYPE_SYNC_FD_BIT;
const VK_EXTERNAL_FENCE_HANDLE_TYPE_FLAG_BITS_MAX_ENUM        = $7FFFFFFF;
//} VkExternalFenceHandleTypeFlagBits;
type T_VkExternalFenceHandleTypeFlags = T_VkFlags;  P_VkExternalFenceHandleTypeFlags = ^T_VkExternalFenceHandleTypeFlags;

//typedef enum VkExternalFenceFeatureFlagBits {
type T_VkExternalFenceFeatureFlagBits = T_int32_t;  P_VkExternalFenceFeatureFlagBits = ^T_VkExternalFenceFeatureFlagBits;
const VK_EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT      = $00000001;
const VK_EXTERNAL_FENCE_FEATURE_IMPORTABLE_BIT      = $00000002;
const VK_EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT_KHR  = VK_EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT;
const VK_EXTERNAL_FENCE_FEATURE_IMPORTABLE_BIT_KHR  = VK_EXTERNAL_FENCE_FEATURE_IMPORTABLE_BIT;
const VK_EXTERNAL_FENCE_FEATURE_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkExternalFenceFeatureFlagBits;
type T_VkExternalFenceFeatureFlags = T_VkFlags;  P_VkExternalFenceFeatureFlags = ^T_VkExternalFenceFeatureFlags;

//typedef enum VkFenceImportFlagBits {
type T_VkFenceImportFlagBits = T_int32_t;  P_VkFenceImportFlagBits = ^T_VkFenceImportFlagBits;
const VK_FENCE_IMPORT_TEMPORARY_BIT       = $00000001;
const VK_FENCE_IMPORT_TEMPORARY_BIT_KHR   = VK_FENCE_IMPORT_TEMPORARY_BIT;
const VK_FENCE_IMPORT_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkFenceImportFlagBits;
type T_VkFenceImportFlags = T_VkFlags;  P_VkFenceImportFlags = ^T_VkFenceImportFlags;

//typedef enum VkSemaphoreImportFlagBits {
type T_VkSemaphoreImportFlagBits = T_int32_t;  P_VkSemaphoreImportFlagBits = ^T_VkSemaphoreImportFlagBits;
const VK_SEMAPHORE_IMPORT_TEMPORARY_BIT       = $00000001;
const VK_SEMAPHORE_IMPORT_TEMPORARY_BIT_KHR   = VK_SEMAPHORE_IMPORT_TEMPORARY_BIT;
const VK_SEMAPHORE_IMPORT_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkSemaphoreImportFlagBits;
type T_VkSemaphoreImportFlags = T_VkFlags;  P_VkSemaphoreImportFlags = ^T_VkSemaphoreImportFlags;

//typedef enum VkExternalSemaphoreHandleTypeFlagBits {
type T_VkExternalSemaphoreHandleTypeFlagBits = T_int32_t;  P_VkExternalSemaphoreHandleTypeFlagBits = ^T_VkExternalSemaphoreHandleTypeFlagBits;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT             = $00000001;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT          = $00000002;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT      = $00000004;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT           = $00000008;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT               = $00000010;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_ZIRCON_EVENT_BIT_FUCHSIA  = $00000080;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D11_FENCE_BIT           = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT_KHR         = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR      = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR  = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT_KHR       = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT_KHR           = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT;
const VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_FLAG_BITS_MAX_ENUM        = $7FFFFFFF;
//} VkExternalSemaphoreHandleTypeFlagBits;
type T_VkExternalSemaphoreHandleTypeFlags = T_VkFlags;  P_VkExternalSemaphoreHandleTypeFlags = ^T_VkExternalSemaphoreHandleTypeFlags;

//typedef enum VkExternalSemaphoreFeatureFlagBits {
type T_VkExternalSemaphoreFeatureFlagBits = T_int32_t;  P_VkExternalSemaphoreFeatureFlagBits = ^T_VkExternalSemaphoreFeatureFlagBits;
const VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT      = $00000001;
const VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT      = $00000002;
const VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT_KHR  = VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT;
const VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT_KHR  = VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT;
const VK_EXTERNAL_SEMAPHORE_FEATURE_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkExternalSemaphoreFeatureFlagBits;
type T_VkExternalSemaphoreFeatureFlags = T_VkFlags;  P_VkExternalSemaphoreFeatureFlags = ^T_VkExternalSemaphoreFeatureFlags;
type T_VkPhysicalDeviceSubgroupProperties = record
       sType                     :T_VkStructureType;
       pNext                     :P_void;
       subgroupSize              :T_uint32_t;
       supportedStages           :T_VkShaderStageFlags;
       supportedOperations       :T_VkSubgroupFeatureFlags;
       quadOperationsInAllStages :T_VkBool32;
     end;
     P_VkPhysicalDeviceSubgroupProperties = ^T_VkPhysicalDeviceSubgroupProperties;

type T_VkBindBufferMemoryInfo = record
       sType        :T_VkStructureType;
       pNext        :P_void;
       buffer       :T_VkBuffer;
       memory       :T_VkDeviceMemory;
       memoryOffset :T_VkDeviceSize;
     end;
     P_VkBindBufferMemoryInfo = ^T_VkBindBufferMemoryInfo;

type T_VkBindImageMemoryInfo = record
       sType        :T_VkStructureType;
       pNext        :P_void;
       image        :T_VkImage;
       memory       :T_VkDeviceMemory;
       memoryOffset :T_VkDeviceSize;
     end;
     P_VkBindImageMemoryInfo = ^T_VkBindImageMemoryInfo;

type T_VkPhysicalDevice16BitStorageFeatures = record
       sType                              :T_VkStructureType;
       pNext                              :P_void;
       storageBuffer16BitAccess           :T_VkBool32;
       uniformAndStorageBuffer16BitAccess :T_VkBool32;
       storagePushConstant16              :T_VkBool32;
       storageInputOutput16               :T_VkBool32;
     end;
     P_VkPhysicalDevice16BitStorageFeatures = ^T_VkPhysicalDevice16BitStorageFeatures;

type T_VkMemoryDedicatedRequirements = record
       sType                       :T_VkStructureType;
       pNext                       :P_void;
       prefersDedicatedAllocation  :T_VkBool32;
       requiresDedicatedAllocation :T_VkBool32;
     end;
     P_VkMemoryDedicatedRequirements = ^T_VkMemoryDedicatedRequirements;

type T_VkMemoryDedicatedAllocateInfo = record
       sType  :T_VkStructureType;
       pNext  :P_void;
       image  :T_VkImage;
       buffer :T_VkBuffer;
     end;
     P_VkMemoryDedicatedAllocateInfo = ^T_VkMemoryDedicatedAllocateInfo;

type T_VkMemoryAllocateFlagsInfo = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       flags      :T_VkMemoryAllocateFlags;
       deviceMask :T_uint32_t;
     end;
     P_VkMemoryAllocateFlagsInfo = ^T_VkMemoryAllocateFlagsInfo;

type T_VkDeviceGroupRenderPassBeginInfo = record
       sType                 :T_VkStructureType;
       pNext                 :P_void;
       deviceMask            :T_uint32_t;
       deviceRenderAreaCount :T_uint32_t;
       pDeviceRenderAreas    :P_VkRect2D;
     end;
     P_VkDeviceGroupRenderPassBeginInfo = ^T_VkDeviceGroupRenderPassBeginInfo;

type T_VkDeviceGroupCommandBufferBeginInfo = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       deviceMask :T_uint32_t;
     end;
     P_VkDeviceGroupCommandBufferBeginInfo = ^T_VkDeviceGroupCommandBufferBeginInfo;

type T_VkDeviceGroupSubmitInfo = record
       sType                         :T_VkStructureType;
       pNext                         :P_void;
       waitSemaphoreCount            :T_uint32_t;
       pWaitSemaphoreDeviceIndices   :P_uint32_t;
       commandBufferCount            :T_uint32_t;
       pCommandBufferDeviceMasks     :P_uint32_t;
       signalSemaphoreCount          :T_uint32_t;
       pSignalSemaphoreDeviceIndices :P_uint32_t;
     end;
     P_VkDeviceGroupSubmitInfo = ^T_VkDeviceGroupSubmitInfo;

type T_VkDeviceGroupBindSparseInfo = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       resourceDeviceIndex :T_uint32_t;
       memoryDeviceIndex   :T_uint32_t;
     end;
     P_VkDeviceGroupBindSparseInfo = ^T_VkDeviceGroupBindSparseInfo;

type T_VkBindBufferMemoryDeviceGroupInfo = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       deviceIndexCount :T_uint32_t;
       pDeviceIndices   :P_uint32_t;
     end;
     P_VkBindBufferMemoryDeviceGroupInfo = ^T_VkBindBufferMemoryDeviceGroupInfo;

type T_VkBindImageMemoryDeviceGroupInfo = record
       sType                        :T_VkStructureType;
       pNext                        :P_void;
       deviceIndexCount             :T_uint32_t;
       pDeviceIndices               :P_uint32_t;
       splitInstanceBindRegionCount :T_uint32_t;
       pSplitInstanceBindRegions    :P_VkRect2D;
     end;
     P_VkBindImageMemoryDeviceGroupInfo = ^T_VkBindImageMemoryDeviceGroupInfo;

type T_VkPhysicalDeviceGroupProperties = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       physicalDeviceCount :T_uint32_t;
       physicalDevices     :array [ 0..VK_MAX_DEVICE_GROUP_SIZE-1 ] of T_VkPhysicalDevice;
       subsetAllocation    :T_VkBool32;
     end;
     P_VkPhysicalDeviceGroupProperties = ^T_VkPhysicalDeviceGroupProperties;

type T_VkDeviceGroupDeviceCreateInfo = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       physicalDeviceCount :T_uint32_t;
       pPhysicalDevices    :P_VkPhysicalDevice;
     end;
     P_VkDeviceGroupDeviceCreateInfo = ^T_VkDeviceGroupDeviceCreateInfo;

type T_VkBufferMemoryRequirementsInfo2 = record
       sType  :T_VkStructureType;
       pNext  :P_void;
       buffer :T_VkBuffer;
     end;
     P_VkBufferMemoryRequirementsInfo2 = ^T_VkBufferMemoryRequirementsInfo2;

type T_VkImageMemoryRequirementsInfo2 = record
       sType :T_VkStructureType;
       pNext :P_void;
       image :T_VkImage;
     end;
     P_VkImageMemoryRequirementsInfo2 = ^T_VkImageMemoryRequirementsInfo2;

type T_VkImageSparseMemoryRequirementsInfo2 = record
       sType :T_VkStructureType;
       pNext :P_void;
       image :T_VkImage;
     end;
     P_VkImageSparseMemoryRequirementsInfo2 = ^T_VkImageSparseMemoryRequirementsInfo2;

type T_VkMemoryRequirements2 = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       memoryRequirements :T_VkMemoryRequirements;
     end;
     P_VkMemoryRequirements2 = ^T_VkMemoryRequirements2;

type T_VkSparseImageMemoryRequirements2 = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       memoryRequirements :T_VkSparseImageMemoryRequirements;
     end;
     P_VkSparseImageMemoryRequirements2 = ^T_VkSparseImageMemoryRequirements2;

type T_VkPhysicalDeviceFeatures2 = record
       sType    :T_VkStructureType;
       pNext    :P_void;
       features :T_VkPhysicalDeviceFeatures;
     end;
     P_VkPhysicalDeviceFeatures2 = ^T_VkPhysicalDeviceFeatures2;

type T_VkPhysicalDeviceProperties2 = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       properties :T_VkPhysicalDeviceProperties;
     end;
     P_VkPhysicalDeviceProperties2 = ^T_VkPhysicalDeviceProperties2;

type T_VkFormatProperties2 = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       formatProperties :T_VkFormatProperties;
     end;
     P_VkFormatProperties2 = ^T_VkFormatProperties2;

type T_VkImageFormatProperties2 = record
       sType                 :T_VkStructureType;
       pNext                 :P_void;
       imageFormatProperties :T_VkImageFormatProperties;
     end;
     P_VkImageFormatProperties2 = ^T_VkImageFormatProperties2;

type T_VkPhysicalDeviceImageFormatInfo2 = record
       sType  :T_VkStructureType;
       pNext  :P_void;
       format :T_VkFormat;
       &type  :T_VkImageType;
       tiling :T_VkImageTiling;
       usage  :T_VkImageUsageFlags;
       flags  :T_VkImageCreateFlags;
     end;
     P_VkPhysicalDeviceImageFormatInfo2 = ^T_VkPhysicalDeviceImageFormatInfo2;

type T_VkQueueFamilyProperties2 = record
       sType                 :T_VkStructureType;
       pNext                 :P_void;
       queueFamilyProperties :T_VkQueueFamilyProperties;
     end;
     P_VkQueueFamilyProperties2 = ^T_VkQueueFamilyProperties2;

type T_VkPhysicalDeviceMemoryProperties2 = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       memoryProperties :T_VkPhysicalDeviceMemoryProperties;
     end;
     P_VkPhysicalDeviceMemoryProperties2 = ^T_VkPhysicalDeviceMemoryProperties2;

type T_VkSparseImageFormatProperties2 = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       properties :T_VkSparseImageFormatProperties;
     end;
     P_VkSparseImageFormatProperties2 = ^T_VkSparseImageFormatProperties2;

type T_VkPhysicalDeviceSparseImageFormatInfo2 = record
       sType   :T_VkStructureType;
       pNext   :P_void;
       format  :T_VkFormat;
       &type   :T_VkImageType;
       samples :T_VkSampleCountFlagBits;
       usage   :T_VkImageUsageFlags;
       tiling  :T_VkImageTiling;
     end;
     P_VkPhysicalDeviceSparseImageFormatInfo2 = ^T_VkPhysicalDeviceSparseImageFormatInfo2;

type T_VkPhysicalDevicePointClippingProperties = record
       sType                 :T_VkStructureType;
       pNext                 :P_void;
       pointClippingBehavior :T_VkPointClippingBehavior;
     end;
     P_VkPhysicalDevicePointClippingProperties = ^T_VkPhysicalDevicePointClippingProperties;

type T_VkInputAttachmentAspectReference = record
       subpass              :T_uint32_t;
       inputAttachmentIndex :T_uint32_t;
       aspectMask           :T_VkImageAspectFlags;
     end;
     P_VkInputAttachmentAspectReference = ^T_VkInputAttachmentAspectReference;

type T_VkRenderPassInputAttachmentAspectCreateInfo = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       aspectReferenceCount :T_uint32_t;
       pAspectReferences    :P_VkInputAttachmentAspectReference;
     end;
     P_VkRenderPassInputAttachmentAspectCreateInfo = ^T_VkRenderPassInputAttachmentAspectCreateInfo;

type T_VkImageViewUsageCreateInfo = record
       sType :T_VkStructureType;
       pNext :P_void;
       usage :T_VkImageUsageFlags;
     end;
     P_VkImageViewUsageCreateInfo = ^T_VkImageViewUsageCreateInfo;

type T_VkPipelineTessellationDomainOriginStateCreateInfo = record
       sType        :T_VkStructureType;
       pNext        :P_void;
       domainOrigin :T_VkTessellationDomainOrigin;
     end;
     P_VkPipelineTessellationDomainOriginStateCreateInfo = ^T_VkPipelineTessellationDomainOriginStateCreateInfo;

type T_VkRenderPassMultiviewCreateInfo = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       subpassCount         :T_uint32_t;
       pViewMasks           :P_uint32_t;
       dependencyCount      :T_uint32_t;
       pViewOffsets         :P_int32_t;
       correlationMaskCount :T_uint32_t;
       pCorrelationMasks    :P_uint32_t;
     end;
     P_VkRenderPassMultiviewCreateInfo = ^T_VkRenderPassMultiviewCreateInfo;

type T_VkPhysicalDeviceMultiviewFeatures = record
       sType                       :T_VkStructureType;
       pNext                       :P_void;
       multiview                   :T_VkBool32;
       multiviewGeometryShader     :T_VkBool32;
       multiviewTessellationShader :T_VkBool32;
     end;
     P_VkPhysicalDeviceMultiviewFeatures = ^T_VkPhysicalDeviceMultiviewFeatures;

type T_VkPhysicalDeviceMultiviewProperties = record
       sType                     :T_VkStructureType;
       pNext                     :P_void;
       maxMultiviewViewCount     :T_uint32_t;
       maxMultiviewInstanceIndex :T_uint32_t;
     end;
     P_VkPhysicalDeviceMultiviewProperties = ^T_VkPhysicalDeviceMultiviewProperties;

type T_VkPhysicalDeviceVariablePointersFeatures = record
       sType                         :T_VkStructureType;
       pNext                         :P_void;
       variablePointersStorageBuffer :T_VkBool32;
       variablePointers              :T_VkBool32;
     end;
     P_VkPhysicalDeviceVariablePointersFeatures = ^T_VkPhysicalDeviceVariablePointersFeatures;

type T_VkPhysicalDeviceVariablePointerFeatures = T_VkPhysicalDeviceVariablePointersFeatures;  P_VkPhysicalDeviceVariablePointerFeatures = ^T_VkPhysicalDeviceVariablePointerFeatures;

type T_VkPhysicalDeviceProtectedMemoryFeatures = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       protectedMemory :T_VkBool32;
     end;
     P_VkPhysicalDeviceProtectedMemoryFeatures = ^T_VkPhysicalDeviceProtectedMemoryFeatures;

type T_VkPhysicalDeviceProtectedMemoryProperties = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       protectedNoFault :T_VkBool32;
     end;
     P_VkPhysicalDeviceProtectedMemoryProperties = ^T_VkPhysicalDeviceProtectedMemoryProperties;

type T_VkDeviceQueueInfo2 = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       flags            :T_VkDeviceQueueCreateFlags;
       queueFamilyIndex :T_uint32_t;
       queueIndex       :T_uint32_t;
     end;
     P_VkDeviceQueueInfo2 = ^T_VkDeviceQueueInfo2;

type T_VkProtectedSubmitInfo = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       protectedSubmit :T_VkBool32;
     end;
     P_VkProtectedSubmitInfo = ^T_VkProtectedSubmitInfo;

type T_VkSamplerYcbcrConversionCreateInfo = record
       sType                       :T_VkStructureType;
       pNext                       :P_void;
       format                      :T_VkFormat;
       ycbcrModel                  :T_VkSamplerYcbcrModelConversion;
       ycbcrRange                  :T_VkSamplerYcbcrRange;
       components                  :T_VkComponentMapping;
       xChromaOffset               :T_VkChromaLocation;
       yChromaOffset               :T_VkChromaLocation;
       chromaFilter                :T_VkFilter;
       forceExplicitReconstruction :T_VkBool32;
     end;
     P_VkSamplerYcbcrConversionCreateInfo = ^T_VkSamplerYcbcrConversionCreateInfo;

type T_VkSamplerYcbcrConversionInfo = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       conversion :T_VkSamplerYcbcrConversion;
     end;
     P_VkSamplerYcbcrConversionInfo = ^T_VkSamplerYcbcrConversionInfo;

type T_VkBindImagePlaneMemoryInfo = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       planeAspect :T_VkImageAspectFlagBits;
     end;
     P_VkBindImagePlaneMemoryInfo = ^T_VkBindImagePlaneMemoryInfo;

type T_VkImagePlaneMemoryRequirementsInfo = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       planeAspect :T_VkImageAspectFlagBits;
     end;
     P_VkImagePlaneMemoryRequirementsInfo = ^T_VkImagePlaneMemoryRequirementsInfo;

type T_VkPhysicalDeviceSamplerYcbcrConversionFeatures = record
       sType                  :T_VkStructureType;
       pNext                  :P_void;
       samplerYcbcrConversion :T_VkBool32;
     end;
     P_VkPhysicalDeviceSamplerYcbcrConversionFeatures = ^T_VkPhysicalDeviceSamplerYcbcrConversionFeatures;

type T_VkSamplerYcbcrConversionImageFormatProperties = record
       sType                               :T_VkStructureType;
       pNext                               :P_void;
       combinedImageSamplerDescriptorCount :T_uint32_t;
     end;
     P_VkSamplerYcbcrConversionImageFormatProperties = ^T_VkSamplerYcbcrConversionImageFormatProperties;

type T_VkDescriptorUpdateTemplateEntry = record
       dstBinding      :T_uint32_t;
       dstArrayElement :T_uint32_t;
       descriptorCount :T_uint32_t;
       descriptorType  :T_VkDescriptorType;
       offset          :T_size_t;
       stride          :T_size_t;
     end;
     P_VkDescriptorUpdateTemplateEntry = ^T_VkDescriptorUpdateTemplateEntry;

type T_VkDescriptorUpdateTemplateCreateInfo = record
       sType                      :T_VkStructureType;
       pNext                      :P_void;
       flags                      :T_VkDescriptorUpdateTemplateCreateFlags;
       descriptorUpdateEntryCount :T_uint32_t;
       pDescriptorUpdateEntries   :P_VkDescriptorUpdateTemplateEntry;
       templateType               :T_VkDescriptorUpdateTemplateType;
       descriptorSetLayout        :T_VkDescriptorSetLayout;
       pipelineBindPoint          :T_VkPipelineBindPoint;
       pipelineLayout             :T_VkPipelineLayout;
       &set                       :T_uint32_t;
     end;
     P_VkDescriptorUpdateTemplateCreateInfo = ^T_VkDescriptorUpdateTemplateCreateInfo;

type T_VkExternalMemoryProperties = record
       externalMemoryFeatures        :T_VkExternalMemoryFeatureFlags;
       exportFromImportedHandleTypes :T_VkExternalMemoryHandleTypeFlags;
       compatibleHandleTypes         :T_VkExternalMemoryHandleTypeFlags;
     end;
     P_VkExternalMemoryProperties = ^T_VkExternalMemoryProperties;

type T_VkPhysicalDeviceExternalImageFormatInfo = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       handleType :T_VkExternalMemoryHandleTypeFlagBits;
     end;
     P_VkPhysicalDeviceExternalImageFormatInfo = ^T_VkPhysicalDeviceExternalImageFormatInfo;

type T_VkExternalImageFormatProperties = record
       sType                    :T_VkStructureType;
       pNext                    :P_void;
       externalMemoryProperties :T_VkExternalMemoryProperties;
     end;
     P_VkExternalImageFormatProperties = ^T_VkExternalImageFormatProperties;

type T_VkPhysicalDeviceExternalBufferInfo = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       flags      :T_VkBufferCreateFlags;
       usage      :T_VkBufferUsageFlags;
       handleType :T_VkExternalMemoryHandleTypeFlagBits;
     end;
     P_VkPhysicalDeviceExternalBufferInfo = ^T_VkPhysicalDeviceExternalBufferInfo;

type T_VkExternalBufferProperties = record
       sType                    :T_VkStructureType;
       pNext                    :P_void;
       externalMemoryProperties :T_VkExternalMemoryProperties;
     end;
     P_VkExternalBufferProperties = ^T_VkExternalBufferProperties;

type T_VkPhysicalDeviceIDProperties = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       deviceUUID      :array [ 0..VK_UUID_SIZE-1 ] of T_uint8_t;
       driverUUID      :array [ 0..VK_UUID_SIZE-1 ] of T_uint8_t;
       deviceLUID      :array [ 0..VK_LUID_SIZE-1 ] of T_uint8_t;
       deviceNodeMask  :T_uint32_t;
       deviceLUIDValid :T_VkBool32;
     end;
     P_VkPhysicalDeviceIDProperties = ^T_VkPhysicalDeviceIDProperties;

type T_VkExternalMemoryImageCreateInfo = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       handleTypes :T_VkExternalMemoryHandleTypeFlags;
     end;
     P_VkExternalMemoryImageCreateInfo = ^T_VkExternalMemoryImageCreateInfo;

type T_VkExternalMemoryBufferCreateInfo = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       handleTypes :T_VkExternalMemoryHandleTypeFlags;
     end;
     P_VkExternalMemoryBufferCreateInfo = ^T_VkExternalMemoryBufferCreateInfo;

type T_VkExportMemoryAllocateInfo = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       handleTypes :T_VkExternalMemoryHandleTypeFlags;
     end;
     P_VkExportMemoryAllocateInfo = ^T_VkExportMemoryAllocateInfo;

type T_VkPhysicalDeviceExternalFenceInfo = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       handleType :T_VkExternalFenceHandleTypeFlagBits;
     end;
     P_VkPhysicalDeviceExternalFenceInfo = ^T_VkPhysicalDeviceExternalFenceInfo;

type T_VkExternalFenceProperties = record
       sType                         :T_VkStructureType;
       pNext                         :P_void;
       exportFromImportedHandleTypes :T_VkExternalFenceHandleTypeFlags;
       compatibleHandleTypes         :T_VkExternalFenceHandleTypeFlags;
       externalFenceFeatures         :T_VkExternalFenceFeatureFlags;
     end;
     P_VkExternalFenceProperties = ^T_VkExternalFenceProperties;

type T_VkExportFenceCreateInfo = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       handleTypes :T_VkExternalFenceHandleTypeFlags;
     end;
     P_VkExportFenceCreateInfo = ^T_VkExportFenceCreateInfo;

type T_VkExportSemaphoreCreateInfo = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       handleTypes :T_VkExternalSemaphoreHandleTypeFlags;
     end;
     P_VkExportSemaphoreCreateInfo = ^T_VkExportSemaphoreCreateInfo;

type T_VkPhysicalDeviceExternalSemaphoreInfo = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       handleType :T_VkExternalSemaphoreHandleTypeFlagBits;
     end;
     P_VkPhysicalDeviceExternalSemaphoreInfo = ^T_VkPhysicalDeviceExternalSemaphoreInfo;

type T_VkExternalSemaphoreProperties = record
       sType                         :T_VkStructureType;
       pNext                         :P_void;
       exportFromImportedHandleTypes :T_VkExternalSemaphoreHandleTypeFlags;
       compatibleHandleTypes         :T_VkExternalSemaphoreHandleTypeFlags;
       externalSemaphoreFeatures     :T_VkExternalSemaphoreFeatureFlags;
     end;
     P_VkExternalSemaphoreProperties = ^T_VkExternalSemaphoreProperties;

type T_VkPhysicalDeviceMaintenance3Properties = record
       sType                   :T_VkStructureType;
       pNext                   :P_void;
       maxPerSetDescriptors    :T_uint32_t;
       maxMemoryAllocationSize :T_VkDeviceSize;
     end;
     P_VkPhysicalDeviceMaintenance3Properties = ^T_VkPhysicalDeviceMaintenance3Properties;

type T_VkDescriptorSetLayoutSupport = record
       sType     :T_VkStructureType;
       pNext     :P_void;
       supported :T_VkBool32;
     end;
     P_VkDescriptorSetLayoutSupport = ^T_VkDescriptorSetLayoutSupport;

type T_VkPhysicalDeviceShaderDrawParametersFeatures = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       shaderDrawParameters :T_VkBool32;
     end;
     P_VkPhysicalDeviceShaderDrawParametersFeatures = ^T_VkPhysicalDeviceShaderDrawParametersFeatures;

type T_VkPhysicalDeviceShaderDrawParameterFeatures = T_VkPhysicalDeviceShaderDrawParametersFeatures;  P_VkPhysicalDeviceShaderDrawParameterFeatures = ^T_VkPhysicalDeviceShaderDrawParameterFeatures;

type
T_PFN_vkEnumerateInstanceVersion = function( pApiVersion_ :P_uint32_t ) :T_VkResult;
                                   {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkBindBufferMemory2 = function(       device_        :T_VkDevice;
                                            bindInfoCount_ :T_uint32_t;
                                      const pBindInfos_    :P_VkBindBufferMemoryInfo ) :T_VkResult;
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkBindImageMemory2 = function(       device_        :T_VkDevice;
                                           bindInfoCount_ :T_uint32_t;
                                     const pBindInfos_    :P_VkBindImageMemoryInfo ) :T_VkResult;
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceGroupPeerMemoryFeatures = procedure( device_              :T_VkDevice;
                                                      heapIndex_           :T_uint32_t;
                                                      localDeviceIndex_    :T_uint32_t;
                                                      remoteDeviceIndex_   :T_uint32_t;
                                                      pPeerMemoryFeatures_ :P_VkPeerMemoryFeatureFlags );
                                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetDeviceMask = procedure( commandBuffer_ :T_VkCommandBuffer;
                                      deviceMask_    :T_uint32_t );
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdDispatchBase = procedure( commandBuffer_ :T_VkCommandBuffer;
                                     baseGroupX_    :T_uint32_t;
                                     baseGroupY_    :T_uint32_t;
                                     baseGroupZ_    :T_uint32_t;
                                     groupCountX_   :T_uint32_t;
                                     groupCountY_   :T_uint32_t;
                                     groupCountZ_   :T_uint32_t );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkEnumeratePhysicalDeviceGroups = function( instance_                       :T_VkInstance;
                                                  pPhysicalDeviceGroupCount_      :P_uint32_t;
                                                  pPhysicalDeviceGroupProperties_ :P_VkPhysicalDeviceGroupProperties ) :T_VkResult;
                                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetImageMemoryRequirements2 = procedure(       device_              :T_VkDevice;
                                                 const pInfo_               :P_VkImageMemoryRequirementsInfo2;
                                                       pMemoryRequirements_ :P_VkMemoryRequirements2 );
                                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetBufferMemoryRequirements2 = procedure(       device_              :T_VkDevice;
                                                  const pInfo_               :P_VkBufferMemoryRequirementsInfo2;
                                                        pMemoryRequirements_ :P_VkMemoryRequirements2 );
                                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetImageSparseMemoryRequirements2 = procedure(       device_                        :T_VkDevice;
                                                       const pInfo_                         :P_VkImageSparseMemoryRequirementsInfo2;
                                                             pSparseMemoryRequirementCount_ :P_uint32_t;
                                                             pSparseMemoryRequirements_     :P_VkSparseImageMemoryRequirements2 );
                                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceFeatures2 = procedure( physicalDevice_ :T_VkPhysicalDevice;
                                                pFeatures_      :P_VkPhysicalDeviceFeatures2 );
                                     {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceProperties2 = procedure( physicalDevice_ :T_VkPhysicalDevice;
                                                  pProperties_    :P_VkPhysicalDeviceProperties2 );
                                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceFormatProperties2 = procedure( physicalDevice_    :T_VkPhysicalDevice;
                                                        format_            :T_VkFormat;
                                                        pFormatProperties_ :P_VkFormatProperties2 );
                                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceImageFormatProperties2 = function(       physicalDevice_         :T_VkPhysicalDevice;
                                                            const pImageFormatInfo_       :P_VkPhysicalDeviceImageFormatInfo2;
                                                                  pImageFormatProperties_ :P_VkImageFormatProperties2 ) :T_VkResult;
                                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceQueueFamilyProperties2 = procedure( physicalDevice_            :T_VkPhysicalDevice;
                                                             pQueueFamilyPropertyCount_ :P_uint32_t;
                                                             pQueueFamilyProperties_    :P_VkQueueFamilyProperties2 );
                                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceMemoryProperties2 = procedure( physicalDevice_    :T_VkPhysicalDevice;
                                                        pMemoryProperties_ :P_VkPhysicalDeviceMemoryProperties2 );
                                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceSparseImageFormatProperties2 = procedure(       physicalDevice_ :T_VkPhysicalDevice;
                                                                   const pFormatInfo_    :P_VkPhysicalDeviceSparseImageFormatInfo2;
                                                                         pPropertyCount_ :P_uint32_t;
                                                                         pProperties_    :P_VkSparseImageFormatProperties2 );
                                                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkTrimCommandPool = procedure( device_      :T_VkDevice;
                                     commandPool_ :T_VkCommandPool;
                                     flags_       :T_VkCommandPoolTrimFlags );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceQueue2 = procedure(       device_     :T_VkDevice;
                                     const pQueueInfo_ :P_VkDeviceQueueInfo2;
                                           pQueue_     :P_VkQueue );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateSamplerYcbcrConversion = function(       device_           :T_VkDevice;
                                                 const pCreateInfo_      :P_VkSamplerYcbcrConversionCreateInfo;
                                                 const pAllocator_       :P_VkAllocationCallbacks;
                                                       pYcbcrConversion_ :P_VkSamplerYcbcrConversion ) :T_VkResult;
                                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroySamplerYcbcrConversion = procedure(       device_          :T_VkDevice;
                                                         ycbcrConversion_ :T_VkSamplerYcbcrConversion;
                                                   const pAllocator_      :P_VkAllocationCallbacks );
                                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateDescriptorUpdateTemplate = function(       device_                    :T_VkDevice;
                                                   const pCreateInfo_               :P_VkDescriptorUpdateTemplateCreateInfo;
                                                   const pAllocator_                :P_VkAllocationCallbacks;
                                                         pDescriptorUpdateTemplate_ :P_VkDescriptorUpdateTemplate ) :T_VkResult;
                                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyDescriptorUpdateTemplate = procedure(       device_                   :T_VkDevice;
                                                           descriptorUpdateTemplate_ :T_VkDescriptorUpdateTemplate;
                                                     const pAllocator_               :P_VkAllocationCallbacks );
                                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkUpdateDescriptorSetWithTemplate = procedure(       device_                   :T_VkDevice;
                                                           descriptorSet_            :T_VkDescriptorSet;
                                                           descriptorUpdateTemplate_ :T_VkDescriptorUpdateTemplate;
                                                     const pData_                    :P_void );
                                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceExternalBufferProperties = procedure(       physicalDevice_            :T_VkPhysicalDevice;
                                                               const pExternalBufferInfo_       :P_VkPhysicalDeviceExternalBufferInfo;
                                                                     pExternalBufferProperties_ :P_VkExternalBufferProperties );
                                                    {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceExternalFenceProperties = procedure(       physicalDevice_           :T_VkPhysicalDevice;
                                                              const pExternalFenceInfo_       :P_VkPhysicalDeviceExternalFenceInfo;
                                                                    pExternalFenceProperties_ :P_VkExternalFenceProperties );
                                                   {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceExternalSemaphoreProperties = procedure(       physicalDevice_               :T_VkPhysicalDevice;
                                                                  const pExternalSemaphoreInfo_       :P_VkPhysicalDeviceExternalSemaphoreInfo;
                                                                        pExternalSemaphoreProperties_ :P_VkExternalSemaphoreProperties );
                                                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDescriptorSetLayoutSupport = procedure(       device_      :T_VkDevice;
                                                   const pCreateInfo_ :P_VkDescriptorSetLayoutCreateInfo;
                                                         pSupport_    :P_VkDescriptorSetLayoutSupport );
                                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}


// VK_VERSION_1_2 is a preprocessor guard. Do not pass it to API calls.

const VK_VERSION_1_2 = 1;
// Vulkan 1.2 version number
const VK_API_VERSION_1_2 = ( 0 shl 29 ) or ( 1 shl 22 ) or ( 2 shl 12 ) or 0;// Patch version should always be set to 0

const VK_MAX_DRIVER_NAME_SIZE = 256;
const VK_MAX_DRIVER_INFO_SIZE = 256;

//typedef enum VkDriverId {
type T_VkDriverId = T_int32_t;  P_VkDriverId = ^T_VkDriverId;
const VK_DRIVER_ID_AMD_PROPRIETARY                = 1;
const VK_DRIVER_ID_AMD_OPEN_SOURCE                = 2;
const VK_DRIVER_ID_MESA_RADV                      = 3;
const VK_DRIVER_ID_NVIDIA_PROPRIETARY             = 4;
const VK_DRIVER_ID_INTEL_PROPRIETARY_WINDOWS      = 5;
const VK_DRIVER_ID_INTEL_OPEN_SOURCE_MESA         = 6;
const VK_DRIVER_ID_IMAGINATION_PROPRIETARY        = 7;
const VK_DRIVER_ID_QUALCOMM_PROPRIETARY           = 8;
const VK_DRIVER_ID_ARM_PROPRIETARY                = 9;
const VK_DRIVER_ID_GOOGLE_SWIFTSHADER             = 10;
const VK_DRIVER_ID_GGP_PROPRIETARY                = 11;
const VK_DRIVER_ID_BROADCOM_PROPRIETARY           = 12;
const VK_DRIVER_ID_MESA_LLVMPIPE                  = 13;
const VK_DRIVER_ID_MOLTENVK                       = 14;
const VK_DRIVER_ID_COREAVI_PROPRIETARY            = 15;
const VK_DRIVER_ID_JUICE_PROPRIETARY              = 16;
const VK_DRIVER_ID_VERISILICON_PROPRIETARY        = 17;
const VK_DRIVER_ID_MESA_TURNIP                    = 18;
const VK_DRIVER_ID_MESA_V3DV                      = 19;
const VK_DRIVER_ID_MESA_PANVK                     = 20;
const VK_DRIVER_ID_SAMSUNG_PROPRIETARY            = 21;
const VK_DRIVER_ID_MESA_VENUS                     = 22;
const VK_DRIVER_ID_MESA_DOZEN                     = 23;
const VK_DRIVER_ID_MESA_NVK                       = 24;
const VK_DRIVER_ID_IMAGINATION_OPEN_SOURCE_MESA   = 25;
const VK_DRIVER_ID_MESA_AGXV                      = 26;
const VK_DRIVER_ID_AMD_PROPRIETARY_KHR            = VK_DRIVER_ID_AMD_PROPRIETARY;
const VK_DRIVER_ID_AMD_OPEN_SOURCE_KHR            = VK_DRIVER_ID_AMD_OPEN_SOURCE;
const VK_DRIVER_ID_MESA_RADV_KHR                  = VK_DRIVER_ID_MESA_RADV;
const VK_DRIVER_ID_NVIDIA_PROPRIETARY_KHR         = VK_DRIVER_ID_NVIDIA_PROPRIETARY;
const VK_DRIVER_ID_INTEL_PROPRIETARY_WINDOWS_KHR  = VK_DRIVER_ID_INTEL_PROPRIETARY_WINDOWS;
const VK_DRIVER_ID_INTEL_OPEN_SOURCE_MESA_KHR     = VK_DRIVER_ID_INTEL_OPEN_SOURCE_MESA;
const VK_DRIVER_ID_IMAGINATION_PROPRIETARY_KHR    = VK_DRIVER_ID_IMAGINATION_PROPRIETARY;
const VK_DRIVER_ID_QUALCOMM_PROPRIETARY_KHR       = VK_DRIVER_ID_QUALCOMM_PROPRIETARY;
const VK_DRIVER_ID_ARM_PROPRIETARY_KHR            = VK_DRIVER_ID_ARM_PROPRIETARY;
const VK_DRIVER_ID_GOOGLE_SWIFTSHADER_KHR         = VK_DRIVER_ID_GOOGLE_SWIFTSHADER;
const VK_DRIVER_ID_GGP_PROPRIETARY_KHR            = VK_DRIVER_ID_GGP_PROPRIETARY;
const VK_DRIVER_ID_BROADCOM_PROPRIETARY_KHR       = VK_DRIVER_ID_BROADCOM_PROPRIETARY;
const VK_DRIVER_ID_MAX_ENUM                       = $7FFFFFFF;
//} VkDriverId;

//typedef enum VkShaderFloatControlsIndependence {
type T_VkShaderFloatControlsIndependence = T_int32_t;  P_VkShaderFloatControlsIndependence = ^T_VkShaderFloatControlsIndependence;
const VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY      = 0;
const VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL              = 1;
const VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_NONE             = 2;
const VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY_KHR  = VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY;
const VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL_KHR          = VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL;
const VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_NONE_KHR         = VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_NONE;
const VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_MAX_ENUM         = $7FFFFFFF;
//} VkShaderFloatControlsIndependence;

//typedef enum VkSamplerReductionMode {
type T_VkSamplerReductionMode = T_int32_t;  P_VkSamplerReductionMode = ^T_VkSamplerReductionMode;
const VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE                  = 0;
const VK_SAMPLER_REDUCTION_MODE_MIN                               = 1;
const VK_SAMPLER_REDUCTION_MODE_MAX                               = 2;
const VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE_RANGECLAMP_QCOM  = 1000521000;
const VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE_EXT              = VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE;
const VK_SAMPLER_REDUCTION_MODE_MIN_EXT                           = VK_SAMPLER_REDUCTION_MODE_MIN;
const VK_SAMPLER_REDUCTION_MODE_MAX_EXT                           = VK_SAMPLER_REDUCTION_MODE_MAX;
const VK_SAMPLER_REDUCTION_MODE_MAX_ENUM                          = $7FFFFFFF;
//} VkSamplerReductionMode;

//typedef enum VkSemaphoreType {
type T_VkSemaphoreType = T_int32_t;  P_VkSemaphoreType = ^T_VkSemaphoreType;
const VK_SEMAPHORE_TYPE_BINARY        = 0;
const VK_SEMAPHORE_TYPE_TIMELINE      = 1;
const VK_SEMAPHORE_TYPE_BINARY_KHR    = VK_SEMAPHORE_TYPE_BINARY;
const VK_SEMAPHORE_TYPE_TIMELINE_KHR  = VK_SEMAPHORE_TYPE_TIMELINE;
const VK_SEMAPHORE_TYPE_MAX_ENUM      = $7FFFFFFF;
//} VkSemaphoreType;

//typedef enum VkResolveModeFlagBits {
type T_VkResolveModeFlagBits = T_int32_t;  P_VkResolveModeFlagBits = ^T_VkResolveModeFlagBits;
const VK_RESOLVE_MODE_NONE                                = 0;
const VK_RESOLVE_MODE_SAMPLE_ZERO_BIT                     = $00000001;
const VK_RESOLVE_MODE_AVERAGE_BIT                         = $00000002;
const VK_RESOLVE_MODE_MIN_BIT                             = $00000004;
const VK_RESOLVE_MODE_MAX_BIT                             = $00000008;
const VK_RESOLVE_MODE_EXTERNAL_FORMAT_DOWNSAMPLE_ANDROID  = $00000010;
const VK_RESOLVE_MODE_NONE_KHR                            = VK_RESOLVE_MODE_NONE;
const VK_RESOLVE_MODE_SAMPLE_ZERO_BIT_KHR                 = VK_RESOLVE_MODE_SAMPLE_ZERO_BIT;
const VK_RESOLVE_MODE_AVERAGE_BIT_KHR                     = VK_RESOLVE_MODE_AVERAGE_BIT;
const VK_RESOLVE_MODE_MIN_BIT_KHR                         = VK_RESOLVE_MODE_MIN_BIT;
const VK_RESOLVE_MODE_MAX_BIT_KHR                         = VK_RESOLVE_MODE_MAX_BIT;
const VK_RESOLVE_MODE_FLAG_BITS_MAX_ENUM                  = $7FFFFFFF;
//} VkResolveModeFlagBits;
type T_VkResolveModeFlags = T_VkFlags;  P_VkResolveModeFlags = ^T_VkResolveModeFlags;

//typedef enum VkDescriptorBindingFlagBits {
type T_VkDescriptorBindingFlagBits = T_int32_t;  P_VkDescriptorBindingFlagBits = ^T_VkDescriptorBindingFlagBits;
const VK_DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT                = $00000001;
const VK_DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT      = $00000002;
const VK_DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT                  = $00000004;
const VK_DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT        = $00000008;
const VK_DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT_EXT            = VK_DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT;
const VK_DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT_EXT  = VK_DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT;
const VK_DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT_EXT              = VK_DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT;
const VK_DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT_EXT    = VK_DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT;
const VK_DESCRIPTOR_BINDING_FLAG_BITS_MAX_ENUM                   = $7FFFFFFF;
//} VkDescriptorBindingFlagBits;
type T_VkDescriptorBindingFlags = T_VkFlags;  P_VkDescriptorBindingFlags = ^T_VkDescriptorBindingFlags;

//typedef enum VkSemaphoreWaitFlagBits {
type T_VkSemaphoreWaitFlagBits = T_int32_t;  P_VkSemaphoreWaitFlagBits = ^T_VkSemaphoreWaitFlagBits;
const VK_SEMAPHORE_WAIT_ANY_BIT             = $00000001;
const VK_SEMAPHORE_WAIT_ANY_BIT_KHR         = VK_SEMAPHORE_WAIT_ANY_BIT;
const VK_SEMAPHORE_WAIT_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkSemaphoreWaitFlagBits;
type T_VkSemaphoreWaitFlags = T_VkFlags;  P_VkSemaphoreWaitFlags = ^T_VkSemaphoreWaitFlags;
type T_VkPhysicalDeviceVulkan11Features = record
       sType                               :T_VkStructureType;
       pNext                               :P_void;
       storageBuffer16BitAccess            :T_VkBool32;
       uniformAndStorageBuffer16BitAccess  :T_VkBool32;
       storagePushConstant16               :T_VkBool32;
       storageInputOutput16                :T_VkBool32;
       multiview                           :T_VkBool32;
       multiviewGeometryShader             :T_VkBool32;
       multiviewTessellationShader         :T_VkBool32;
       variablePointersStorageBuffer       :T_VkBool32;
       variablePointers                    :T_VkBool32;
       protectedMemory                     :T_VkBool32;
       samplerYcbcrConversion              :T_VkBool32;
       shaderDrawParameters                :T_VkBool32;
     end;
     P_VkPhysicalDeviceVulkan11Features = ^T_VkPhysicalDeviceVulkan11Features;

type T_VkPhysicalDeviceVulkan11Properties = record
       sType                              :T_VkStructureType;
       pNext                              :P_void;
       deviceUUID                         :array [ 0..VK_UUID_SIZE-1 ] of T_uint8_t;
       driverUUID                         :array [ 0..VK_UUID_SIZE-1 ] of T_uint8_t;
       deviceLUID                         :array [ 0..VK_LUID_SIZE-1 ] of T_uint8_t;
       deviceNodeMask                     :T_uint32_t;
       deviceLUIDValid                    :T_VkBool32;
       subgroupSize                       :T_uint32_t;
       subgroupSupportedStages            :T_VkShaderStageFlags;
       subgroupSupportedOperations        :T_VkSubgroupFeatureFlags;
       subgroupQuadOperationsInAllStages  :T_VkBool32;
       pointClippingBehavior              :T_VkPointClippingBehavior;
       maxMultiviewViewCount              :T_uint32_t;
       maxMultiviewInstanceIndex          :T_uint32_t;
       protectedNoFault                   :T_VkBool32;
       maxPerSetDescriptors               :T_uint32_t;
       maxMemoryAllocationSize            :T_VkDeviceSize;
     end;
     P_VkPhysicalDeviceVulkan11Properties = ^T_VkPhysicalDeviceVulkan11Properties;

type T_VkPhysicalDeviceVulkan12Features = record
       sType                                               :T_VkStructureType;
       pNext                                               :P_void;
       samplerMirrorClampToEdge                            :T_VkBool32;
       drawIndirectCount                                   :T_VkBool32;
       storageBuffer8BitAccess                             :T_VkBool32;
       uniformAndStorageBuffer8BitAccess                   :T_VkBool32;
       storagePushConstant8                                :T_VkBool32;
       shaderBufferInt64Atomics                            :T_VkBool32;
       shaderSharedInt64Atomics                            :T_VkBool32;
       shaderFloat16                                       :T_VkBool32;
       shaderInt8                                          :T_VkBool32;
       descriptorIndexing                                  :T_VkBool32;
       shaderInputAttachmentArrayDynamicIndexing           :T_VkBool32;
       shaderUniformTexelBufferArrayDynamicIndexing        :T_VkBool32;
       shaderStorageTexelBufferArrayDynamicIndexing        :T_VkBool32;
       shaderUniformBufferArrayNonUniformIndexing          :T_VkBool32;
       shaderSampledImageArrayNonUniformIndexing           :T_VkBool32;
       shaderStorageBufferArrayNonUniformIndexing          :T_VkBool32;
       shaderStorageImageArrayNonUniformIndexing           :T_VkBool32;
       shaderInputAttachmentArrayNonUniformIndexing        :T_VkBool32;
       shaderUniformTexelBufferArrayNonUniformIndexing     :T_VkBool32;
       shaderStorageTexelBufferArrayNonUniformIndexing     :T_VkBool32;
       descriptorBindingUniformBufferUpdateAfterBind       :T_VkBool32;
       descriptorBindingSampledImageUpdateAfterBind        :T_VkBool32;
       descriptorBindingStorageImageUpdateAfterBind        :T_VkBool32;
       descriptorBindingStorageBufferUpdateAfterBind       :T_VkBool32;
       descriptorBindingUniformTexelBufferUpdateAfterBind  :T_VkBool32;
       descriptorBindingStorageTexelBufferUpdateAfterBind  :T_VkBool32;
       descriptorBindingUpdateUnusedWhilePending           :T_VkBool32;
       descriptorBindingPartiallyBound                     :T_VkBool32;
       descriptorBindingVariableDescriptorCount            :T_VkBool32;
       runtimeDescriptorArray                              :T_VkBool32;
       samplerFilterMinmax                                 :T_VkBool32;
       scalarBlockLayout                                   :T_VkBool32;
       imagelessFramebuffer                                :T_VkBool32;
       uniformBufferStandardLayout                         :T_VkBool32;
       shaderSubgroupExtendedTypes                         :T_VkBool32;
       separateDepthStencilLayouts                         :T_VkBool32;
       hostQueryReset                                      :T_VkBool32;
       timelineSemaphore                                   :T_VkBool32;
       bufferDeviceAddress                                 :T_VkBool32;
       bufferDeviceAddressCaptureReplay                    :T_VkBool32;
       bufferDeviceAddressMultiDevice                      :T_VkBool32;
       vulkanMemoryModel                                   :T_VkBool32;
       vulkanMemoryModelDeviceScope                        :T_VkBool32;
       vulkanMemoryModelAvailabilityVisibilityChains       :T_VkBool32;
       shaderOutputViewportIndex                           :T_VkBool32;
       shaderOutputLayer                                   :T_VkBool32;
       subgroupBroadcastDynamicId                          :T_VkBool32;
     end;
     P_VkPhysicalDeviceVulkan12Features = ^T_VkPhysicalDeviceVulkan12Features;

type T_VkConformanceVersion = record
       major    :T_uint8_t;
       minor    :T_uint8_t;
       subminor :T_uint8_t;
       patch    :T_uint8_t;
     end;
     P_VkConformanceVersion = ^T_VkConformanceVersion;

type T_VkPhysicalDeviceVulkan12Properties = record
       sType                                                 :T_VkStructureType;
       pNext                                                 :P_void;
       driverID                                              :T_VkDriverId;
       driverName                                            :array [ 0..VK_MAX_DRIVER_NAME_SIZE-1 ] of T_char;
       driverInfo                                            :array [ 0..VK_MAX_DRIVER_INFO_SIZE-1 ] of T_char;
       conformanceVersion                                    :T_VkConformanceVersion;
       denormBehaviorIndependence                            :T_VkShaderFloatControlsIndependence;
       roundingModeIndependence                              :T_VkShaderFloatControlsIndependence;
       shaderSignedZeroInfNanPreserveFloat16                 :T_VkBool32;
       shaderSignedZeroInfNanPreserveFloat32                 :T_VkBool32;
       shaderSignedZeroInfNanPreserveFloat64                 :T_VkBool32;
       shaderDenormPreserveFloat16                           :T_VkBool32;
       shaderDenormPreserveFloat32                           :T_VkBool32;
       shaderDenormPreserveFloat64                           :T_VkBool32;
       shaderDenormFlushToZeroFloat16                        :T_VkBool32;
       shaderDenormFlushToZeroFloat32                        :T_VkBool32;
       shaderDenormFlushToZeroFloat64                        :T_VkBool32;
       shaderRoundingModeRTEFloat16                          :T_VkBool32;
       shaderRoundingModeRTEFloat32                          :T_VkBool32;
       shaderRoundingModeRTEFloat64                          :T_VkBool32;
       shaderRoundingModeRTZFloat16                          :T_VkBool32;
       shaderRoundingModeRTZFloat32                          :T_VkBool32;
       shaderRoundingModeRTZFloat64                          :T_VkBool32;
       maxUpdateAfterBindDescriptorsInAllPools               :T_uint32_t;
       shaderUniformBufferArrayNonUniformIndexingNative      :T_VkBool32;
       shaderSampledImageArrayNonUniformIndexingNative       :T_VkBool32;
       shaderStorageBufferArrayNonUniformIndexingNative      :T_VkBool32;
       shaderStorageImageArrayNonUniformIndexingNative       :T_VkBool32;
       shaderInputAttachmentArrayNonUniformIndexingNative    :T_VkBool32;
       robustBufferAccessUpdateAfterBind                     :T_VkBool32;
       quadDivergentImplicitLod                              :T_VkBool32;
       maxPerStageDescriptorUpdateAfterBindSamplers          :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindUniformBuffers    :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindStorageBuffers    :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindSampledImages     :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindStorageImages     :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindInputAttachments  :T_uint32_t;
       maxPerStageUpdateAfterBindResources                   :T_uint32_t;
       maxDescriptorSetUpdateAfterBindSamplers               :T_uint32_t;
       maxDescriptorSetUpdateAfterBindUniformBuffers         :T_uint32_t;
       maxDescriptorSetUpdateAfterBindUniformBuffersDynamic  :T_uint32_t;
       maxDescriptorSetUpdateAfterBindStorageBuffers         :T_uint32_t;
       maxDescriptorSetUpdateAfterBindStorageBuffersDynamic  :T_uint32_t;
       maxDescriptorSetUpdateAfterBindSampledImages          :T_uint32_t;
       maxDescriptorSetUpdateAfterBindStorageImages          :T_uint32_t;
       maxDescriptorSetUpdateAfterBindInputAttachments       :T_uint32_t;
       supportedDepthResolveModes                            :T_VkResolveModeFlags;
       supportedStencilResolveModes                          :T_VkResolveModeFlags;
       independentResolveNone                                :T_VkBool32;
       independentResolve                                    :T_VkBool32;
       filterMinmaxSingleComponentFormats                    :T_VkBool32;
       filterMinmaxImageComponentMapping                     :T_VkBool32;
       maxTimelineSemaphoreValueDifference                   :T_uint64_t;
       framebufferIntegerColorSampleCounts                   :T_VkSampleCountFlags;
     end;
     P_VkPhysicalDeviceVulkan12Properties = ^T_VkPhysicalDeviceVulkan12Properties;

type T_VkImageFormatListCreateInfo = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       viewFormatCount :T_uint32_t;
       pViewFormats    :P_VkFormat;
     end;
     P_VkImageFormatListCreateInfo = ^T_VkImageFormatListCreateInfo;

type T_VkAttachmentDescription2 = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       flags          :T_VkAttachmentDescriptionFlags;
       format         :T_VkFormat;
       samples        :T_VkSampleCountFlagBits;
       loadOp         :T_VkAttachmentLoadOp;
       storeOp        :T_VkAttachmentStoreOp;
       stencilLoadOp  :T_VkAttachmentLoadOp;
       stencilStoreOp :T_VkAttachmentStoreOp;
       initialLayout  :T_VkImageLayout;
       finalLayout    :T_VkImageLayout;
     end;
     P_VkAttachmentDescription2 = ^T_VkAttachmentDescription2;

type T_VkAttachmentReference2 = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       attachment :T_uint32_t;
       layout     :T_VkImageLayout;
       aspectMask :T_VkImageAspectFlags;
     end;
     P_VkAttachmentReference2 = ^T_VkAttachmentReference2;

type T_VkSubpassDescription2 = record
       sType                   :T_VkStructureType;
       pNext                   :P_void;
       flags                   :T_VkSubpassDescriptionFlags;
       pipelineBindPoint       :T_VkPipelineBindPoint;
       viewMask                :T_uint32_t;
       inputAttachmentCount    :T_uint32_t;
       pInputAttachments       :P_VkAttachmentReference2;
       colorAttachmentCount    :T_uint32_t;
       pColorAttachments       :P_VkAttachmentReference2;
       pResolveAttachments     :P_VkAttachmentReference2;
       pDepthStencilAttachment :P_VkAttachmentReference2;
       preserveAttachmentCount :T_uint32_t;
       pPreserveAttachments    :P_uint32_t;
     end;
     P_VkSubpassDescription2 = ^T_VkSubpassDescription2;

type T_VkSubpassDependency2 = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       srcSubpass      :T_uint32_t;
       dstSubpass      :T_uint32_t;
       srcStageMask    :T_VkPipelineStageFlags;
       dstStageMask    :T_VkPipelineStageFlags;
       srcAccessMask   :T_VkAccessFlags;
       dstAccessMask   :T_VkAccessFlags;
       dependencyFlags :T_VkDependencyFlags;
       viewOffset      :T_int32_t;
     end;
     P_VkSubpassDependency2 = ^T_VkSubpassDependency2;

type T_VkRenderPassCreateInfo2 = record
       sType                   :T_VkStructureType;
       pNext                   :P_void;
       flags                   :T_VkRenderPassCreateFlags;
       attachmentCount         :T_uint32_t;
       pAttachments            :P_VkAttachmentDescription2;
       subpassCount            :T_uint32_t;
       pSubpasses              :P_VkSubpassDescription2;
       dependencyCount         :T_uint32_t;
       pDependencies           :P_VkSubpassDependency2;
       correlatedViewMaskCount :T_uint32_t;
       pCorrelatedViewMasks    :P_uint32_t;
     end;
     P_VkRenderPassCreateInfo2 = ^T_VkRenderPassCreateInfo2;

type T_VkSubpassBeginInfo = record
       sType    :T_VkStructureType;
       pNext    :P_void;
       contents :T_VkSubpassContents;
     end;
     P_VkSubpassBeginInfo = ^T_VkSubpassBeginInfo;

type T_VkSubpassEndInfo = record
       sType :T_VkStructureType;
       pNext :P_void;
     end;
     P_VkSubpassEndInfo = ^T_VkSubpassEndInfo;

type T_VkPhysicalDevice8BitStorageFeatures = record
       sType                             :T_VkStructureType;
       pNext                             :P_void;
       storageBuffer8BitAccess           :T_VkBool32;
       uniformAndStorageBuffer8BitAccess :T_VkBool32;
       storagePushConstant8              :T_VkBool32;
     end;
     P_VkPhysicalDevice8BitStorageFeatures = ^T_VkPhysicalDevice8BitStorageFeatures;

type T_VkPhysicalDeviceDriverProperties = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       driverID           :T_VkDriverId;
       driverName         :array [ 0..VK_MAX_DRIVER_NAME_SIZE-1 ] of T_char;
       driverInfo         :array [ 0..VK_MAX_DRIVER_INFO_SIZE-1 ] of T_char;
       conformanceVersion :T_VkConformanceVersion;
     end;
     P_VkPhysicalDeviceDriverProperties = ^T_VkPhysicalDeviceDriverProperties;

type T_VkPhysicalDeviceShaderAtomicInt64Features = record
       sType                    :T_VkStructureType;
       pNext                    :P_void;
       shaderBufferInt64Atomics :T_VkBool32;
       shaderSharedInt64Atomics :T_VkBool32;
     end;
     P_VkPhysicalDeviceShaderAtomicInt64Features = ^T_VkPhysicalDeviceShaderAtomicInt64Features;

type T_VkPhysicalDeviceShaderFloat16Int8Features = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       shaderFloat16 :T_VkBool32;
       shaderInt8    :T_VkBool32;
     end;
     P_VkPhysicalDeviceShaderFloat16Int8Features = ^T_VkPhysicalDeviceShaderFloat16Int8Features;

type T_VkPhysicalDeviceFloatControlsProperties = record
       sType                                 :T_VkStructureType;
       pNext                                 :P_void;
       denormBehaviorIndependence            :T_VkShaderFloatControlsIndependence;
       roundingModeIndependence              :T_VkShaderFloatControlsIndependence;
       shaderSignedZeroInfNanPreserveFloat16 :T_VkBool32;
       shaderSignedZeroInfNanPreserveFloat32 :T_VkBool32;
       shaderSignedZeroInfNanPreserveFloat64 :T_VkBool32;
       shaderDenormPreserveFloat16           :T_VkBool32;
       shaderDenormPreserveFloat32           :T_VkBool32;
       shaderDenormPreserveFloat64           :T_VkBool32;
       shaderDenormFlushToZeroFloat16        :T_VkBool32;
       shaderDenormFlushToZeroFloat32        :T_VkBool32;
       shaderDenormFlushToZeroFloat64        :T_VkBool32;
       shaderRoundingModeRTEFloat16          :T_VkBool32;
       shaderRoundingModeRTEFloat32          :T_VkBool32;
       shaderRoundingModeRTEFloat64          :T_VkBool32;
       shaderRoundingModeRTZFloat16          :T_VkBool32;
       shaderRoundingModeRTZFloat32          :T_VkBool32;
       shaderRoundingModeRTZFloat64          :T_VkBool32;
     end;
     P_VkPhysicalDeviceFloatControlsProperties = ^T_VkPhysicalDeviceFloatControlsProperties;

type T_VkDescriptorSetLayoutBindingFlagsCreateInfo = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       bindingCount  :T_uint32_t;
       pBindingFlags :P_VkDescriptorBindingFlags;
     end;
     P_VkDescriptorSetLayoutBindingFlagsCreateInfo = ^T_VkDescriptorSetLayoutBindingFlagsCreateInfo;

type T_VkPhysicalDeviceDescriptorIndexingFeatures = record
       sType                                               :T_VkStructureType;
       pNext                                               :P_void;
       shaderInputAttachmentArrayDynamicIndexing           :T_VkBool32;
       shaderUniformTexelBufferArrayDynamicIndexing        :T_VkBool32;
       shaderStorageTexelBufferArrayDynamicIndexing        :T_VkBool32;
       shaderUniformBufferArrayNonUniformIndexing          :T_VkBool32;
       shaderSampledImageArrayNonUniformIndexing           :T_VkBool32;
       shaderStorageBufferArrayNonUniformIndexing          :T_VkBool32;
       shaderStorageImageArrayNonUniformIndexing           :T_VkBool32;
       shaderInputAttachmentArrayNonUniformIndexing        :T_VkBool32;
       shaderUniformTexelBufferArrayNonUniformIndexing     :T_VkBool32;
       shaderStorageTexelBufferArrayNonUniformIndexing     :T_VkBool32;
       descriptorBindingUniformBufferUpdateAfterBind       :T_VkBool32;
       descriptorBindingSampledImageUpdateAfterBind        :T_VkBool32;
       descriptorBindingStorageImageUpdateAfterBind        :T_VkBool32;
       descriptorBindingStorageBufferUpdateAfterBind       :T_VkBool32;
       descriptorBindingUniformTexelBufferUpdateAfterBind  :T_VkBool32;
       descriptorBindingStorageTexelBufferUpdateAfterBind  :T_VkBool32;
       descriptorBindingUpdateUnusedWhilePending           :T_VkBool32;
       descriptorBindingPartiallyBound                     :T_VkBool32;
       descriptorBindingVariableDescriptorCount            :T_VkBool32;
       runtimeDescriptorArray                              :T_VkBool32;
     end;
     P_VkPhysicalDeviceDescriptorIndexingFeatures = ^T_VkPhysicalDeviceDescriptorIndexingFeatures;

type T_VkPhysicalDeviceDescriptorIndexingProperties = record
       sType                                                :T_VkStructureType;
       pNext                                                :P_void;
       maxUpdateAfterBindDescriptorsInAllPools              :T_uint32_t;
       shaderUniformBufferArrayNonUniformIndexingNative     :T_VkBool32;
       shaderSampledImageArrayNonUniformIndexingNative      :T_VkBool32;
       shaderStorageBufferArrayNonUniformIndexingNative     :T_VkBool32;
       shaderStorageImageArrayNonUniformIndexingNative      :T_VkBool32;
       shaderInputAttachmentArrayNonUniformIndexingNative   :T_VkBool32;
       robustBufferAccessUpdateAfterBind                    :T_VkBool32;
       quadDivergentImplicitLod                             :T_VkBool32;
       maxPerStageDescriptorUpdateAfterBindSamplers         :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindUniformBuffers   :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindStorageBuffers   :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindSampledImages    :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindStorageImages    :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindInputAttachments :T_uint32_t;
       maxPerStageUpdateAfterBindResources                  :T_uint32_t;
       maxDescriptorSetUpdateAfterBindSamplers              :T_uint32_t;
       maxDescriptorSetUpdateAfterBindUniformBuffers        :T_uint32_t;
       maxDescriptorSetUpdateAfterBindUniformBuffersDynamic :T_uint32_t;
       maxDescriptorSetUpdateAfterBindStorageBuffers        :T_uint32_t;
       maxDescriptorSetUpdateAfterBindStorageBuffersDynamic :T_uint32_t;
       maxDescriptorSetUpdateAfterBindSampledImages         :T_uint32_t;
       maxDescriptorSetUpdateAfterBindStorageImages         :T_uint32_t;
       maxDescriptorSetUpdateAfterBindInputAttachments      :T_uint32_t;
     end;
     P_VkPhysicalDeviceDescriptorIndexingProperties = ^T_VkPhysicalDeviceDescriptorIndexingProperties;

type T_VkDescriptorSetVariableDescriptorCountAllocateInfo = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       descriptorSetCount :T_uint32_t;
       pDescriptorCounts  :P_uint32_t;
     end;
     P_VkDescriptorSetVariableDescriptorCountAllocateInfo = ^T_VkDescriptorSetVariableDescriptorCountAllocateInfo;

type T_VkDescriptorSetVariableDescriptorCountLayoutSupport = record
       sType                      :T_VkStructureType;
       pNext                      :P_void;
       maxVariableDescriptorCount :T_uint32_t;
     end;
     P_VkDescriptorSetVariableDescriptorCountLayoutSupport = ^T_VkDescriptorSetVariableDescriptorCountLayoutSupport;

type T_VkSubpassDescriptionDepthStencilResolve = record
       sType                          :T_VkStructureType;
       pNext                          :P_void;
       depthResolveMode               :T_VkResolveModeFlagBits;
       stencilResolveMode             :T_VkResolveModeFlagBits;
       pDepthStencilResolveAttachment :P_VkAttachmentReference2;
     end;
     P_VkSubpassDescriptionDepthStencilResolve = ^T_VkSubpassDescriptionDepthStencilResolve;

type T_VkPhysicalDeviceDepthStencilResolveProperties = record
       sType                        :T_VkStructureType;
       pNext                        :P_void;
       supportedDepthResolveModes   :T_VkResolveModeFlags;
       supportedStencilResolveModes :T_VkResolveModeFlags;
       independentResolveNone       :T_VkBool32;
       independentResolve           :T_VkBool32;
     end;
     P_VkPhysicalDeviceDepthStencilResolveProperties = ^T_VkPhysicalDeviceDepthStencilResolveProperties;

type T_VkPhysicalDeviceScalarBlockLayoutFeatures = record
       sType             :T_VkStructureType;
       pNext             :P_void;
       scalarBlockLayout :T_VkBool32;
     end;
     P_VkPhysicalDeviceScalarBlockLayoutFeatures = ^T_VkPhysicalDeviceScalarBlockLayoutFeatures;

type T_VkImageStencilUsageCreateInfo = record
       sType        :T_VkStructureType;
       pNext        :P_void;
       stencilUsage :T_VkImageUsageFlags;
     end;
     P_VkImageStencilUsageCreateInfo = ^T_VkImageStencilUsageCreateInfo;

type T_VkSamplerReductionModeCreateInfo = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       reductionMode :T_VkSamplerReductionMode;
     end;
     P_VkSamplerReductionModeCreateInfo = ^T_VkSamplerReductionModeCreateInfo;

type T_VkPhysicalDeviceSamplerFilterMinmaxProperties = record
       sType                              :T_VkStructureType;
       pNext                              :P_void;
       filterMinmaxSingleComponentFormats :T_VkBool32;
       filterMinmaxImageComponentMapping  :T_VkBool32;
     end;
     P_VkPhysicalDeviceSamplerFilterMinmaxProperties = ^T_VkPhysicalDeviceSamplerFilterMinmaxProperties;

type T_VkPhysicalDeviceVulkanMemoryModelFeatures = record
       sType                                         :T_VkStructureType;
       pNext                                         :P_void;
       vulkanMemoryModel                             :T_VkBool32;
       vulkanMemoryModelDeviceScope                  :T_VkBool32;
       vulkanMemoryModelAvailabilityVisibilityChains :T_VkBool32;
     end;
     P_VkPhysicalDeviceVulkanMemoryModelFeatures = ^T_VkPhysicalDeviceVulkanMemoryModelFeatures;

type T_VkPhysicalDeviceImagelessFramebufferFeatures = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       imagelessFramebuffer :T_VkBool32;
     end;
     P_VkPhysicalDeviceImagelessFramebufferFeatures = ^T_VkPhysicalDeviceImagelessFramebufferFeatures;

type T_VkFramebufferAttachmentImageInfo = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       flags           :T_VkImageCreateFlags;
       usage           :T_VkImageUsageFlags;
       width           :T_uint32_t;
       height          :T_uint32_t;
       layerCount      :T_uint32_t;
       viewFormatCount :T_uint32_t;
       pViewFormats    :P_VkFormat;
     end;
     P_VkFramebufferAttachmentImageInfo = ^T_VkFramebufferAttachmentImageInfo;

type T_VkFramebufferAttachmentsCreateInfo = record
       sType                    :T_VkStructureType;
       pNext                    :P_void;
       attachmentImageInfoCount :T_uint32_t;
       pAttachmentImageInfos    :P_VkFramebufferAttachmentImageInfo;
     end;
     P_VkFramebufferAttachmentsCreateInfo = ^T_VkFramebufferAttachmentsCreateInfo;

type T_VkRenderPassAttachmentBeginInfo = record
       sType           :T_VkStructureType;
       pNext           :P_void;
       attachmentCount :T_uint32_t;
       pAttachments    :P_VkImageView;
     end;
     P_VkRenderPassAttachmentBeginInfo = ^T_VkRenderPassAttachmentBeginInfo;

type T_VkPhysicalDeviceUniformBufferStandardLayoutFeatures = record
       sType                       :T_VkStructureType;
       pNext                       :P_void;
       uniformBufferStandardLayout :T_VkBool32;
     end;
     P_VkPhysicalDeviceUniformBufferStandardLayoutFeatures = ^T_VkPhysicalDeviceUniformBufferStandardLayoutFeatures;

type T_VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures = record
       sType                       :T_VkStructureType;
       pNext                       :P_void;
       shaderSubgroupExtendedTypes :T_VkBool32;
     end;
     P_VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures = ^T_VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures;

type T_VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures = record
       sType                       :T_VkStructureType;
       pNext                       :P_void;
       separateDepthStencilLayouts :T_VkBool32;
     end;
     P_VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures = ^T_VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures;

type T_VkAttachmentReferenceStencilLayout = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       stencilLayout :T_VkImageLayout;
     end;
     P_VkAttachmentReferenceStencilLayout = ^T_VkAttachmentReferenceStencilLayout;

type T_VkAttachmentDescriptionStencilLayout = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       stencilInitialLayout :T_VkImageLayout;
       stencilFinalLayout   :T_VkImageLayout;
     end;
     P_VkAttachmentDescriptionStencilLayout = ^T_VkAttachmentDescriptionStencilLayout;

type T_VkPhysicalDeviceHostQueryResetFeatures = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       hostQueryReset :T_VkBool32;
     end;
     P_VkPhysicalDeviceHostQueryResetFeatures = ^T_VkPhysicalDeviceHostQueryResetFeatures;

type T_VkPhysicalDeviceTimelineSemaphoreFeatures = record
       sType             :T_VkStructureType;
       pNext             :P_void;
       timelineSemaphore :T_VkBool32;
     end;
     P_VkPhysicalDeviceTimelineSemaphoreFeatures = ^T_VkPhysicalDeviceTimelineSemaphoreFeatures;

type T_VkPhysicalDeviceTimelineSemaphoreProperties = record
       sType                               :T_VkStructureType;
       pNext                               :P_void;
       maxTimelineSemaphoreValueDifference :T_uint64_t;
     end;
     P_VkPhysicalDeviceTimelineSemaphoreProperties = ^T_VkPhysicalDeviceTimelineSemaphoreProperties;

type T_VkSemaphoreTypeCreateInfo = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       semaphoreType :T_VkSemaphoreType;
       initialValue  :T_uint64_t;
     end;
     P_VkSemaphoreTypeCreateInfo = ^T_VkSemaphoreTypeCreateInfo;

type T_VkTimelineSemaphoreSubmitInfo = record
       sType                     :T_VkStructureType;
       pNext                     :P_void;
       waitSemaphoreValueCount   :T_uint32_t;
       pWaitSemaphoreValues      :P_uint64_t;
       signalSemaphoreValueCount :T_uint32_t;
       pSignalSemaphoreValues    :P_uint64_t;
     end;
     P_VkTimelineSemaphoreSubmitInfo = ^T_VkTimelineSemaphoreSubmitInfo;

type T_VkSemaphoreWaitInfo = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       flags          :T_VkSemaphoreWaitFlags;
       semaphoreCount :T_uint32_t;
       pSemaphores    :P_VkSemaphore;
       pValues        :P_uint64_t;
     end;
     P_VkSemaphoreWaitInfo = ^T_VkSemaphoreWaitInfo;

type T_VkSemaphoreSignalInfo = record
       sType     :T_VkStructureType;
       pNext     :P_void;
       semaphore :T_VkSemaphore;
       value     :T_uint64_t;
     end;
     P_VkSemaphoreSignalInfo = ^T_VkSemaphoreSignalInfo;

type T_VkPhysicalDeviceBufferDeviceAddressFeatures = record
       sType                            :T_VkStructureType;
       pNext                            :P_void;
       bufferDeviceAddress              :T_VkBool32;
       bufferDeviceAddressCaptureReplay :T_VkBool32;
       bufferDeviceAddressMultiDevice   :T_VkBool32;
     end;
     P_VkPhysicalDeviceBufferDeviceAddressFeatures = ^T_VkPhysicalDeviceBufferDeviceAddressFeatures;

type T_VkBufferDeviceAddressInfo = record
       sType  :T_VkStructureType;
       pNext  :P_void;
       buffer :T_VkBuffer;
     end;
     P_VkBufferDeviceAddressInfo = ^T_VkBufferDeviceAddressInfo;

type T_VkBufferOpaqueCaptureAddressCreateInfo = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       opaqueCaptureAddress :T_uint64_t;
     end;
     P_VkBufferOpaqueCaptureAddressCreateInfo = ^T_VkBufferOpaqueCaptureAddressCreateInfo;

type T_VkMemoryOpaqueCaptureAddressAllocateInfo = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       opaqueCaptureAddress :T_uint64_t;
     end;
     P_VkMemoryOpaqueCaptureAddressAllocateInfo = ^T_VkMemoryOpaqueCaptureAddressAllocateInfo;

type T_VkDeviceMemoryOpaqueCaptureAddressInfo = record
       sType  :T_VkStructureType;
       pNext  :P_void;
       memory :T_VkDeviceMemory;
     end;
     P_VkDeviceMemoryOpaqueCaptureAddressInfo = ^T_VkDeviceMemoryOpaqueCaptureAddressInfo;

type
T_PFN_vkCmdDrawIndirectCount = procedure( commandBuffer_     :T_VkCommandBuffer;
                                          buffer_            :T_VkBuffer;
                                          offset_            :T_VkDeviceSize;
                                          countBuffer_       :T_VkBuffer;
                                          countBufferOffset_ :T_VkDeviceSize;
                                          maxDrawCount_      :T_uint32_t;
                                          stride_            :T_uint32_t );
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdDrawIndexedIndirectCount = procedure( commandBuffer_     :T_VkCommandBuffer;
                                                 buffer_            :T_VkBuffer;
                                                 offset_            :T_VkDeviceSize;
                                                 countBuffer_       :T_VkBuffer;
                                                 countBufferOffset_ :T_VkDeviceSize;
                                                 maxDrawCount_      :T_uint32_t;
                                                 stride_            :T_uint32_t );
                                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreateRenderPass2 = function(       device_      :T_VkDevice;
                                      const pCreateInfo_ :P_VkRenderPassCreateInfo2;
                                      const pAllocator_  :P_VkAllocationCallbacks;
                                            pRenderPass_ :P_VkRenderPass ) :T_VkResult;
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBeginRenderPass2 = procedure(       commandBuffer_     :T_VkCommandBuffer;
                                         const pRenderPassBegin_  :P_VkRenderPassBeginInfo;
                                         const pSubpassBeginInfo_ :P_VkSubpassBeginInfo );
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdNextSubpass2 = procedure(       commandBuffer_     :T_VkCommandBuffer;
                                     const pSubpassBeginInfo_ :P_VkSubpassBeginInfo;
                                     const pSubpassEndInfo_   :P_VkSubpassEndInfo );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdEndRenderPass2 = procedure(       commandBuffer_   :T_VkCommandBuffer;
                                       const pSubpassEndInfo_ :P_VkSubpassEndInfo );
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkResetQueryPool = procedure( device_     :T_VkDevice;
                                    queryPool_  :T_VkQueryPool;
                                    firstQuery_ :T_uint32_t;
                                    queryCount_ :T_uint32_t );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetSemaphoreCounterValue = function( device_    :T_VkDevice;
                                             semaphore_ :T_VkSemaphore;
                                             pValue_    :P_uint64_t ) :T_VkResult;
                                   {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkWaitSemaphores = function(       device_    :T_VkDevice;
                                   const pWaitInfo_ :P_VkSemaphoreWaitInfo;
                                         timeout_   :T_uint64_t ) :T_VkResult;
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkSignalSemaphore = function(       device_      :T_VkDevice;
                                    const pSignalInfo_ :P_VkSemaphoreSignalInfo ) :T_VkResult;
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetBufferDeviceAddress = function(       device_ :T_VkDevice;
                                           const pInfo_  :P_VkBufferDeviceAddressInfo ) :T_VkDeviceAddress;
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetBufferOpaqueCaptureAddress = function(       device_ :T_VkDevice;
                                                  const pInfo_  :P_VkBufferDeviceAddressInfo ) :T_uint64_t;
                                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceMemoryOpaqueCaptureAddress = function(       device_ :T_VkDevice;
                                                        const pInfo_  :P_VkDeviceMemoryOpaqueCaptureAddressInfo ) :T_uint64_t;
                                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

// VK_VERSION_1_3 is a preprocessor guard. Do not pass it to API calls.

const VK_VERSION_1_3 = 1;
// Vulkan 1.3 version number
const VK_API_VERSION_1_3 = ( 0 shl 29 ) or ( 1 shl 22 ) or ( 3 shl 12 ) or 0;// Patch version should always be set to 0

type T_VkFlags64 = T_uint64_t;  P_VkFlags64 = ^T_VkFlags64;
//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkPrivateDataSlot)
{$IF Defined( CPU64BITS ) }
type T_VkPrivateDataSlot = ^T__VkPrivateDataSlot;  T__VkPrivateDataSlot = record end;  P_VkPrivateDataSlot = ^T_VkPrivateDataSlot;
{$ELSE}
type T_VkPrivateDataSlot = T_uint64_t;  P_VkPrivateDataSlot = ^T_VkPrivateDataSlot;
{$ENDIF}

//typedef enum VkPipelineCreationFeedbackFlagBits {
type T_VkPipelineCreationFeedbackFlagBits = T_int32_t;  P_VkPipelineCreationFeedbackFlagBits = ^T_VkPipelineCreationFeedbackFlagBits;
const VK_PIPELINE_CREATION_FEEDBACK_VALID_BIT                               = $00000001;
const VK_PIPELINE_CREATION_FEEDBACK_APPLICATION_PIPELINE_CACHE_HIT_BIT      = $00000002;
const VK_PIPELINE_CREATION_FEEDBACK_BASE_PIPELINE_ACCELERATION_BIT          = $00000004;
const VK_PIPELINE_CREATION_FEEDBACK_VALID_BIT_EXT                           = VK_PIPELINE_CREATION_FEEDBACK_VALID_BIT;
const VK_PIPELINE_CREATION_FEEDBACK_APPLICATION_PIPELINE_CACHE_HIT_BIT_EXT  = VK_PIPELINE_CREATION_FEEDBACK_APPLICATION_PIPELINE_CACHE_HIT_BIT;
const VK_PIPELINE_CREATION_FEEDBACK_BASE_PIPELINE_ACCELERATION_BIT_EXT      = VK_PIPELINE_CREATION_FEEDBACK_BASE_PIPELINE_ACCELERATION_BIT;
const VK_PIPELINE_CREATION_FEEDBACK_FLAG_BITS_MAX_ENUM                      = $7FFFFFFF;
//} VkPipelineCreationFeedbackFlagBits;
type T_VkPipelineCreationFeedbackFlags = T_VkFlags;  P_VkPipelineCreationFeedbackFlags = ^T_VkPipelineCreationFeedbackFlags;

//typedef enum VkToolPurposeFlagBits {
type T_VkToolPurposeFlagBits = T_int32_t;  P_VkToolPurposeFlagBits = ^T_VkToolPurposeFlagBits;
const VK_TOOL_PURPOSE_VALIDATION_BIT               = $00000001;
const VK_TOOL_PURPOSE_PROFILING_BIT                = $00000002;
const VK_TOOL_PURPOSE_TRACING_BIT                  = $00000004;
const VK_TOOL_PURPOSE_ADDITIONAL_FEATURES_BIT      = $00000008;
const VK_TOOL_PURPOSE_MODIFYING_FEATURES_BIT       = $00000010;
const VK_TOOL_PURPOSE_DEBUG_REPORTING_BIT_EXT      = $00000020;
const VK_TOOL_PURPOSE_DEBUG_MARKERS_BIT_EXT        = $00000040;
const VK_TOOL_PURPOSE_VALIDATION_BIT_EXT           = VK_TOOL_PURPOSE_VALIDATION_BIT;
const VK_TOOL_PURPOSE_PROFILING_BIT_EXT            = VK_TOOL_PURPOSE_PROFILING_BIT;
const VK_TOOL_PURPOSE_TRACING_BIT_EXT              = VK_TOOL_PURPOSE_TRACING_BIT;
const VK_TOOL_PURPOSE_ADDITIONAL_FEATURES_BIT_EXT  = VK_TOOL_PURPOSE_ADDITIONAL_FEATURES_BIT;
const VK_TOOL_PURPOSE_MODIFYING_FEATURES_BIT_EXT   = VK_TOOL_PURPOSE_MODIFYING_FEATURES_BIT;
const VK_TOOL_PURPOSE_FLAG_BITS_MAX_ENUM           = $7FFFFFFF;
//} VkToolPurposeFlagBits;
type T_VkToolPurposeFlags = T_VkFlags;  P_VkToolPurposeFlags = ^T_VkToolPurposeFlags;
type T_VkPrivateDataSlotCreateFlags = T_VkFlags;  P_VkPrivateDataSlotCreateFlags = ^T_VkPrivateDataSlotCreateFlags;
type T_VkPipelineStageFlags2 = T_VkFlags64;  P_VkPipelineStageFlags2 = ^T_VkPipelineStageFlags2;

// Flag bits for VkPipelineStageFlagBits2
type T_VkPipelineStageFlagBits2 = T_VkFlags64;  P_VkPipelineStageFlagBits2 = ^T_VkPipelineStageFlagBits2;
const VK_PIPELINE_STAGE_2_NONE                                      = T_VkPipelineStageFlagBits2( 0 );
const VK_PIPELINE_STAGE_2_NONE_KHR                                  = T_VkPipelineStageFlagBits2( 0 );
const VK_PIPELINE_STAGE_2_TOP_OF_PIPE_BIT                           = T_VkPipelineStageFlagBits2( $00000001 );
const VK_PIPELINE_STAGE_2_TOP_OF_PIPE_BIT_KHR                       = T_VkPipelineStageFlagBits2( $00000001 );
const VK_PIPELINE_STAGE_2_DRAW_INDIRECT_BIT                         = T_VkPipelineStageFlagBits2( $00000002 );
const VK_PIPELINE_STAGE_2_DRAW_INDIRECT_BIT_KHR                     = T_VkPipelineStageFlagBits2( $00000002 );
const VK_PIPELINE_STAGE_2_VERTEX_INPUT_BIT                          = T_VkPipelineStageFlagBits2( $00000004 );
const VK_PIPELINE_STAGE_2_VERTEX_INPUT_BIT_KHR                      = T_VkPipelineStageFlagBits2( $00000004 );
const VK_PIPELINE_STAGE_2_VERTEX_SHADER_BIT                         = T_VkPipelineStageFlagBits2( $00000008 );
const VK_PIPELINE_STAGE_2_VERTEX_SHADER_BIT_KHR                     = T_VkPipelineStageFlagBits2( $00000008 );
const VK_PIPELINE_STAGE_2_TESSELLATION_CONTROL_SHADER_BIT           = T_VkPipelineStageFlagBits2( $00000010 );
const VK_PIPELINE_STAGE_2_TESSELLATION_CONTROL_SHADER_BIT_KHR       = T_VkPipelineStageFlagBits2( $00000010 );
const VK_PIPELINE_STAGE_2_TESSELLATION_EVALUATION_SHADER_BIT        = T_VkPipelineStageFlagBits2( $00000020 );
const VK_PIPELINE_STAGE_2_TESSELLATION_EVALUATION_SHADER_BIT_KHR    = T_VkPipelineStageFlagBits2( $00000020 );
const VK_PIPELINE_STAGE_2_GEOMETRY_SHADER_BIT                       = T_VkPipelineStageFlagBits2( $00000040 );
const VK_PIPELINE_STAGE_2_GEOMETRY_SHADER_BIT_KHR                   = T_VkPipelineStageFlagBits2( $00000040 );
const VK_PIPELINE_STAGE_2_FRAGMENT_SHADER_BIT                       = T_VkPipelineStageFlagBits2( $00000080 );
const VK_PIPELINE_STAGE_2_FRAGMENT_SHADER_BIT_KHR                   = T_VkPipelineStageFlagBits2( $00000080 );
const VK_PIPELINE_STAGE_2_EARLY_FRAGMENT_TESTS_BIT                  = T_VkPipelineStageFlagBits2( $00000100 );
const VK_PIPELINE_STAGE_2_EARLY_FRAGMENT_TESTS_BIT_KHR              = T_VkPipelineStageFlagBits2( $00000100 );
const VK_PIPELINE_STAGE_2_LATE_FRAGMENT_TESTS_BIT                   = T_VkPipelineStageFlagBits2( $00000200 );
const VK_PIPELINE_STAGE_2_LATE_FRAGMENT_TESTS_BIT_KHR               = T_VkPipelineStageFlagBits2( $00000200 );
const VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT               = T_VkPipelineStageFlagBits2( $00000400 );
const VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT_KHR           = T_VkPipelineStageFlagBits2( $00000400 );
const VK_PIPELINE_STAGE_2_COMPUTE_SHADER_BIT                        = T_VkPipelineStageFlagBits2( $00000800 );
const VK_PIPELINE_STAGE_2_COMPUTE_SHADER_BIT_KHR                    = T_VkPipelineStageFlagBits2( $00000800 );
const VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT                          = T_VkPipelineStageFlagBits2( $00001000 );
const VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT_KHR                      = T_VkPipelineStageFlagBits2( $00001000 );
const VK_PIPELINE_STAGE_2_TRANSFER_BIT                              = T_VkPipelineStageFlagBits2( $00001000 );
const VK_PIPELINE_STAGE_2_TRANSFER_BIT_KHR                          = T_VkPipelineStageFlagBits2( $00001000 );
const VK_PIPELINE_STAGE_2_BOTTOM_OF_PIPE_BIT                        = T_VkPipelineStageFlagBits2( $00002000 );
const VK_PIPELINE_STAGE_2_BOTTOM_OF_PIPE_BIT_KHR                    = T_VkPipelineStageFlagBits2( $00002000 );
const VK_PIPELINE_STAGE_2_HOST_BIT                                  = T_VkPipelineStageFlagBits2( $00004000 );
const VK_PIPELINE_STAGE_2_HOST_BIT_KHR                              = T_VkPipelineStageFlagBits2( $00004000 );
const VK_PIPELINE_STAGE_2_ALL_GRAPHICS_BIT                          = T_VkPipelineStageFlagBits2( $00008000 );
const VK_PIPELINE_STAGE_2_ALL_GRAPHICS_BIT_KHR                      = T_VkPipelineStageFlagBits2( $00008000 );
const VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT                          = T_VkPipelineStageFlagBits2( $00010000 );
const VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT_KHR                      = T_VkPipelineStageFlagBits2( $00010000 );
const VK_PIPELINE_STAGE_2_COPY_BIT                                  = T_VkPipelineStageFlagBits2( $100000000 );
const VK_PIPELINE_STAGE_2_COPY_BIT_KHR                              = T_VkPipelineStageFlagBits2( $100000000 );
const VK_PIPELINE_STAGE_2_RESOLVE_BIT                               = T_VkPipelineStageFlagBits2( $200000000 );
const VK_PIPELINE_STAGE_2_RESOLVE_BIT_KHR                           = T_VkPipelineStageFlagBits2( $200000000 );
const VK_PIPELINE_STAGE_2_BLIT_BIT                                  = T_VkPipelineStageFlagBits2( $400000000 );
const VK_PIPELINE_STAGE_2_BLIT_BIT_KHR                              = T_VkPipelineStageFlagBits2( $400000000 );
const VK_PIPELINE_STAGE_2_CLEAR_BIT                                 = T_VkPipelineStageFlagBits2( $800000000 );
const VK_PIPELINE_STAGE_2_CLEAR_BIT_KHR                             = T_VkPipelineStageFlagBits2( $800000000 );
const VK_PIPELINE_STAGE_2_INDEX_INPUT_BIT                           = T_VkPipelineStageFlagBits2( $1000000000 );
const VK_PIPELINE_STAGE_2_INDEX_INPUT_BIT_KHR                       = T_VkPipelineStageFlagBits2( $1000000000 );
const VK_PIPELINE_STAGE_2_VERTEX_ATTRIBUTE_INPUT_BIT                = T_VkPipelineStageFlagBits2( $2000000000 );
const VK_PIPELINE_STAGE_2_VERTEX_ATTRIBUTE_INPUT_BIT_KHR            = T_VkPipelineStageFlagBits2( $2000000000 );
const VK_PIPELINE_STAGE_2_PRE_RASTERIZATION_SHADERS_BIT             = T_VkPipelineStageFlagBits2( $4000000000 );
const VK_PIPELINE_STAGE_2_PRE_RASTERIZATION_SHADERS_BIT_KHR         = T_VkPipelineStageFlagBits2( $4000000000 );
const VK_PIPELINE_STAGE_2_VIDEO_DECODE_BIT_KHR                      = T_VkPipelineStageFlagBits2( $04000000 );
const VK_PIPELINE_STAGE_2_VIDEO_ENCODE_BIT_KHR                      = T_VkPipelineStageFlagBits2( $08000000 );
const VK_PIPELINE_STAGE_2_TRANSFORM_FEEDBACK_BIT_EXT                = T_VkPipelineStageFlagBits2( $01000000 );
const VK_PIPELINE_STAGE_2_CONDITIONAL_RENDERING_BIT_EXT             = T_VkPipelineStageFlagBits2( $00040000 );
const VK_PIPELINE_STAGE_2_COMMAND_PREPROCESS_BIT_NV                 = T_VkPipelineStageFlagBits2( $00020000 );
const VK_PIPELINE_STAGE_2_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR  = T_VkPipelineStageFlagBits2( $00400000 );
const VK_PIPELINE_STAGE_2_SHADING_RATE_IMAGE_BIT_NV                 = T_VkPipelineStageFlagBits2( $00400000 );
const VK_PIPELINE_STAGE_2_ACCELERATION_STRUCTURE_BUILD_BIT_KHR      = T_VkPipelineStageFlagBits2( $02000000 );
const VK_PIPELINE_STAGE_2_RAY_TRACING_SHADER_BIT_KHR                = T_VkPipelineStageFlagBits2( $00200000 );
const VK_PIPELINE_STAGE_2_RAY_TRACING_SHADER_BIT_NV                 = T_VkPipelineStageFlagBits2( $00200000 );
const VK_PIPELINE_STAGE_2_ACCELERATION_STRUCTURE_BUILD_BIT_NV       = T_VkPipelineStageFlagBits2( $02000000 );
const VK_PIPELINE_STAGE_2_FRAGMENT_DENSITY_PROCESS_BIT_EXT          = T_VkPipelineStageFlagBits2( $00800000 );
const VK_PIPELINE_STAGE_2_TASK_SHADER_BIT_NV                        = T_VkPipelineStageFlagBits2( $00080000 );
const VK_PIPELINE_STAGE_2_MESH_SHADER_BIT_NV                        = T_VkPipelineStageFlagBits2( $00100000 );
const VK_PIPELINE_STAGE_2_TASK_SHADER_BIT_EXT                       = T_VkPipelineStageFlagBits2( $00080000 );
const VK_PIPELINE_STAGE_2_MESH_SHADER_BIT_EXT                       = T_VkPipelineStageFlagBits2( $00100000 );
const VK_PIPELINE_STAGE_2_SUBPASS_SHADER_BIT_HUAWEI                 = T_VkPipelineStageFlagBits2( $8000000000 );
const VK_PIPELINE_STAGE_2_SUBPASS_SHADING_BIT_HUAWEI                = T_VkPipelineStageFlagBits2( $8000000000 );
const VK_PIPELINE_STAGE_2_INVOCATION_MASK_BIT_HUAWEI                = T_VkPipelineStageFlagBits2( $10000000000 );
const VK_PIPELINE_STAGE_2_ACCELERATION_STRUCTURE_COPY_BIT_KHR       = T_VkPipelineStageFlagBits2( $10000000 );
const VK_PIPELINE_STAGE_2_MICROMAP_BUILD_BIT_EXT                    = T_VkPipelineStageFlagBits2( $40000000 );
const VK_PIPELINE_STAGE_2_CLUSTER_CULLING_SHADER_BIT_HUAWEI         = T_VkPipelineStageFlagBits2( $20000000000 );
const VK_PIPELINE_STAGE_2_OPTICAL_FLOW_BIT_NV                       = T_VkPipelineStageFlagBits2( $20000000 );

type T_VkAccessFlags2 = T_VkFlags64;  P_VkAccessFlags2 = ^T_VkAccessFlags2;

// Flag bits for VkAccessFlagBits2
type T_VkAccessFlagBits2 = T_VkFlags64;  P_VkAccessFlagBits2 = ^T_VkAccessFlagBits2;
const VK_ACCESS_2_NONE                                           = T_VkAccessFlagBits2( 0 );
const VK_ACCESS_2_NONE_KHR                                       = T_VkAccessFlagBits2( 0 );
const VK_ACCESS_2_INDIRECT_COMMAND_READ_BIT                      = T_VkAccessFlagBits2( $00000001 );
const VK_ACCESS_2_INDIRECT_COMMAND_READ_BIT_KHR                  = T_VkAccessFlagBits2( $00000001 );
const VK_ACCESS_2_INDEX_READ_BIT                                 = T_VkAccessFlagBits2( $00000002 );
const VK_ACCESS_2_INDEX_READ_BIT_KHR                             = T_VkAccessFlagBits2( $00000002 );
const VK_ACCESS_2_VERTEX_ATTRIBUTE_READ_BIT                      = T_VkAccessFlagBits2( $00000004 );
const VK_ACCESS_2_VERTEX_ATTRIBUTE_READ_BIT_KHR                  = T_VkAccessFlagBits2( $00000004 );
const VK_ACCESS_2_UNIFORM_READ_BIT                               = T_VkAccessFlagBits2( $00000008 );
const VK_ACCESS_2_UNIFORM_READ_BIT_KHR                           = T_VkAccessFlagBits2( $00000008 );
const VK_ACCESS_2_INPUT_ATTACHMENT_READ_BIT                      = T_VkAccessFlagBits2( $00000010 );
const VK_ACCESS_2_INPUT_ATTACHMENT_READ_BIT_KHR                  = T_VkAccessFlagBits2( $00000010 );
const VK_ACCESS_2_SHADER_READ_BIT                                = T_VkAccessFlagBits2( $00000020 );
const VK_ACCESS_2_SHADER_READ_BIT_KHR                            = T_VkAccessFlagBits2( $00000020 );
const VK_ACCESS_2_SHADER_WRITE_BIT                               = T_VkAccessFlagBits2( $00000040 );
const VK_ACCESS_2_SHADER_WRITE_BIT_KHR                           = T_VkAccessFlagBits2( $00000040 );
const VK_ACCESS_2_COLOR_ATTACHMENT_READ_BIT                      = T_VkAccessFlagBits2( $00000080 );
const VK_ACCESS_2_COLOR_ATTACHMENT_READ_BIT_KHR                  = T_VkAccessFlagBits2( $00000080 );
const VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT                     = T_VkAccessFlagBits2( $00000100 );
const VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT_KHR                 = T_VkAccessFlagBits2( $00000100 );
const VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_READ_BIT              = T_VkAccessFlagBits2( $00000200 );
const VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_READ_BIT_KHR          = T_VkAccessFlagBits2( $00000200 );
const VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT             = T_VkAccessFlagBits2( $00000400 );
const VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT_KHR         = T_VkAccessFlagBits2( $00000400 );
const VK_ACCESS_2_TRANSFER_READ_BIT                              = T_VkAccessFlagBits2( $00000800 );
const VK_ACCESS_2_TRANSFER_READ_BIT_KHR                          = T_VkAccessFlagBits2( $00000800 );
const VK_ACCESS_2_TRANSFER_WRITE_BIT                             = T_VkAccessFlagBits2( $00001000 );
const VK_ACCESS_2_TRANSFER_WRITE_BIT_KHR                         = T_VkAccessFlagBits2( $00001000 );
const VK_ACCESS_2_HOST_READ_BIT                                  = T_VkAccessFlagBits2( $00002000 );
const VK_ACCESS_2_HOST_READ_BIT_KHR                              = T_VkAccessFlagBits2( $00002000 );
const VK_ACCESS_2_HOST_WRITE_BIT                                 = T_VkAccessFlagBits2( $00004000 );
const VK_ACCESS_2_HOST_WRITE_BIT_KHR                             = T_VkAccessFlagBits2( $00004000 );
const VK_ACCESS_2_MEMORY_READ_BIT                                = T_VkAccessFlagBits2( $00008000 );
const VK_ACCESS_2_MEMORY_READ_BIT_KHR                            = T_VkAccessFlagBits2( $00008000 );
const VK_ACCESS_2_MEMORY_WRITE_BIT                               = T_VkAccessFlagBits2( $00010000 );
const VK_ACCESS_2_MEMORY_WRITE_BIT_KHR                           = T_VkAccessFlagBits2( $00010000 );
const VK_ACCESS_2_SHADER_SAMPLED_READ_BIT                        = T_VkAccessFlagBits2( $100000000 );
const VK_ACCESS_2_SHADER_SAMPLED_READ_BIT_KHR                    = T_VkAccessFlagBits2( $100000000 );
const VK_ACCESS_2_SHADER_STORAGE_READ_BIT                        = T_VkAccessFlagBits2( $200000000 );
const VK_ACCESS_2_SHADER_STORAGE_READ_BIT_KHR                    = T_VkAccessFlagBits2( $200000000 );
const VK_ACCESS_2_SHADER_STORAGE_WRITE_BIT                       = T_VkAccessFlagBits2( $400000000 );
const VK_ACCESS_2_SHADER_STORAGE_WRITE_BIT_KHR                   = T_VkAccessFlagBits2( $400000000 );
const VK_ACCESS_2_VIDEO_DECODE_READ_BIT_KHR                      = T_VkAccessFlagBits2( $800000000 );
const VK_ACCESS_2_VIDEO_DECODE_WRITE_BIT_KHR                     = T_VkAccessFlagBits2( $1000000000 );
const VK_ACCESS_2_VIDEO_ENCODE_READ_BIT_KHR                      = T_VkAccessFlagBits2( $2000000000 );
const VK_ACCESS_2_VIDEO_ENCODE_WRITE_BIT_KHR                     = T_VkAccessFlagBits2( $4000000000 );
const VK_ACCESS_2_TRANSFORM_FEEDBACK_WRITE_BIT_EXT               = T_VkAccessFlagBits2( $02000000 );
const VK_ACCESS_2_TRANSFORM_FEEDBACK_COUNTER_READ_BIT_EXT        = T_VkAccessFlagBits2( $04000000 );
const VK_ACCESS_2_TRANSFORM_FEEDBACK_COUNTER_WRITE_BIT_EXT       = T_VkAccessFlagBits2( $08000000 );
const VK_ACCESS_2_CONDITIONAL_RENDERING_READ_BIT_EXT             = T_VkAccessFlagBits2( $00100000 );
const VK_ACCESS_2_COMMAND_PREPROCESS_READ_BIT_NV                 = T_VkAccessFlagBits2( $00020000 );
const VK_ACCESS_2_COMMAND_PREPROCESS_WRITE_BIT_NV                = T_VkAccessFlagBits2( $00040000 );
const VK_ACCESS_2_FRAGMENT_SHADING_RATE_ATTACHMENT_READ_BIT_KHR  = T_VkAccessFlagBits2( $00800000 );
const VK_ACCESS_2_SHADING_RATE_IMAGE_READ_BIT_NV                 = T_VkAccessFlagBits2( $00800000 );
const VK_ACCESS_2_ACCELERATION_STRUCTURE_READ_BIT_KHR            = T_VkAccessFlagBits2( $00200000 );
const VK_ACCESS_2_ACCELERATION_STRUCTURE_WRITE_BIT_KHR           = T_VkAccessFlagBits2( $00400000 );
const VK_ACCESS_2_ACCELERATION_STRUCTURE_READ_BIT_NV             = T_VkAccessFlagBits2( $00200000 );
const VK_ACCESS_2_ACCELERATION_STRUCTURE_WRITE_BIT_NV            = T_VkAccessFlagBits2( $00400000 );
const VK_ACCESS_2_FRAGMENT_DENSITY_MAP_READ_BIT_EXT              = T_VkAccessFlagBits2( $01000000 );
const VK_ACCESS_2_COLOR_ATTACHMENT_READ_NONCOHERENT_BIT_EXT      = T_VkAccessFlagBits2( $00080000 );
const VK_ACCESS_2_DESCRIPTOR_BUFFER_READ_BIT_EXT                 = T_VkAccessFlagBits2( $20000000000 );
const VK_ACCESS_2_INVOCATION_MASK_READ_BIT_HUAWEI                = T_VkAccessFlagBits2( $8000000000 );
const VK_ACCESS_2_SHADER_BINDING_TABLE_READ_BIT_KHR              = T_VkAccessFlagBits2( $10000000000 );
const VK_ACCESS_2_MICROMAP_READ_BIT_EXT                          = T_VkAccessFlagBits2( $100000000000 );
const VK_ACCESS_2_MICROMAP_WRITE_BIT_EXT                         = T_VkAccessFlagBits2( $200000000000 );
const VK_ACCESS_2_OPTICAL_FLOW_READ_BIT_NV                       = T_VkAccessFlagBits2( $40000000000 );
const VK_ACCESS_2_OPTICAL_FLOW_WRITE_BIT_NV                      = T_VkAccessFlagBits2( $80000000000 );


//typedef enum VkSubmitFlagBits {
type T_VkSubmitFlagBits = T_int32_t;  P_VkSubmitFlagBits = ^T_VkSubmitFlagBits;
const VK_SUBMIT_PROTECTED_BIT       = $00000001;
const VK_SUBMIT_PROTECTED_BIT_KHR   = VK_SUBMIT_PROTECTED_BIT;
const VK_SUBMIT_FLAG_BITS_MAX_ENUM  = $7FFFFFFF;
//} VkSubmitFlagBits;
type T_VkSubmitFlags = T_VkFlags;  P_VkSubmitFlags = ^T_VkSubmitFlags;

//typedef enum VkRenderingFlagBits {
type T_VkRenderingFlagBits = T_int32_t;  P_VkRenderingFlagBits = ^T_VkRenderingFlagBits;
const VK_RENDERING_CONTENTS_SECONDARY_COMMAND_BUFFERS_BIT      = $00000001;
const VK_RENDERING_SUSPENDING_BIT                              = $00000002;
const VK_RENDERING_RESUMING_BIT                                = $00000004;
const VK_RENDERING_CONTENTS_INLINE_BIT_EXT                     = $00000010;
const VK_RENDERING_ENABLE_LEGACY_DITHERING_BIT_EXT             = $00000008;
const VK_RENDERING_CONTENTS_SECONDARY_COMMAND_BUFFERS_BIT_KHR  = VK_RENDERING_CONTENTS_SECONDARY_COMMAND_BUFFERS_BIT;
const VK_RENDERING_SUSPENDING_BIT_KHR                          = VK_RENDERING_SUSPENDING_BIT;
const VK_RENDERING_RESUMING_BIT_KHR                            = VK_RENDERING_RESUMING_BIT;
const VK_RENDERING_FLAG_BITS_MAX_ENUM                          = $7FFFFFFF;
//} VkRenderingFlagBits;
type T_VkRenderingFlags = T_VkFlags;  P_VkRenderingFlags = ^T_VkRenderingFlags;
type T_VkFormatFeatureFlags2 = T_VkFlags64;  P_VkFormatFeatureFlags2 = ^T_VkFormatFeatureFlags2;

// Flag bits for VkFormatFeatureFlagBits2
type T_VkFormatFeatureFlagBits2 = T_VkFlags64;  P_VkFormatFeatureFlagBits2 = ^T_VkFormatFeatureFlagBits2;
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_BIT                                                                = T_VkFormatFeatureFlagBits2( $00000001 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_BIT_KHR                                                            = T_VkFormatFeatureFlagBits2( $00000001 );
const VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT                                                                = T_VkFormatFeatureFlagBits2( $00000002 );
const VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT_KHR                                                            = T_VkFormatFeatureFlagBits2( $00000002 );
const VK_FORMAT_FEATURE_2_STORAGE_IMAGE_ATOMIC_BIT                                                         = T_VkFormatFeatureFlagBits2( $00000004 );
const VK_FORMAT_FEATURE_2_STORAGE_IMAGE_ATOMIC_BIT_KHR                                                     = T_VkFormatFeatureFlagBits2( $00000004 );
const VK_FORMAT_FEATURE_2_UNIFORM_TEXEL_BUFFER_BIT                                                         = T_VkFormatFeatureFlagBits2( $00000008 );
const VK_FORMAT_FEATURE_2_UNIFORM_TEXEL_BUFFER_BIT_KHR                                                     = T_VkFormatFeatureFlagBits2( $00000008 );
const VK_FORMAT_FEATURE_2_STORAGE_TEXEL_BUFFER_BIT                                                         = T_VkFormatFeatureFlagBits2( $00000010 );
const VK_FORMAT_FEATURE_2_STORAGE_TEXEL_BUFFER_BIT_KHR                                                     = T_VkFormatFeatureFlagBits2( $00000010 );
const VK_FORMAT_FEATURE_2_STORAGE_TEXEL_BUFFER_ATOMIC_BIT                                                  = T_VkFormatFeatureFlagBits2( $00000020 );
const VK_FORMAT_FEATURE_2_STORAGE_TEXEL_BUFFER_ATOMIC_BIT_KHR                                              = T_VkFormatFeatureFlagBits2( $00000020 );
const VK_FORMAT_FEATURE_2_VERTEX_BUFFER_BIT                                                                = T_VkFormatFeatureFlagBits2( $00000040 );
const VK_FORMAT_FEATURE_2_VERTEX_BUFFER_BIT_KHR                                                            = T_VkFormatFeatureFlagBits2( $00000040 );
const VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BIT                                                             = T_VkFormatFeatureFlagBits2( $00000080 );
const VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BIT_KHR                                                         = T_VkFormatFeatureFlagBits2( $00000080 );
const VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BLEND_BIT                                                       = T_VkFormatFeatureFlagBits2( $00000100 );
const VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BLEND_BIT_KHR                                                   = T_VkFormatFeatureFlagBits2( $00000100 );
const VK_FORMAT_FEATURE_2_DEPTH_STENCIL_ATTACHMENT_BIT                                                     = T_VkFormatFeatureFlagBits2( $00000200 );
const VK_FORMAT_FEATURE_2_DEPTH_STENCIL_ATTACHMENT_BIT_KHR                                                 = T_VkFormatFeatureFlagBits2( $00000200 );
const VK_FORMAT_FEATURE_2_BLIT_SRC_BIT                                                                     = T_VkFormatFeatureFlagBits2( $00000400 );
const VK_FORMAT_FEATURE_2_BLIT_SRC_BIT_KHR                                                                 = T_VkFormatFeatureFlagBits2( $00000400 );
const VK_FORMAT_FEATURE_2_BLIT_DST_BIT                                                                     = T_VkFormatFeatureFlagBits2( $00000800 );
const VK_FORMAT_FEATURE_2_BLIT_DST_BIT_KHR                                                                 = T_VkFormatFeatureFlagBits2( $00000800 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_LINEAR_BIT                                                  = T_VkFormatFeatureFlagBits2( $00001000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_LINEAR_BIT_KHR                                              = T_VkFormatFeatureFlagBits2( $00001000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_CUBIC_BIT                                                   = T_VkFormatFeatureFlagBits2( $00002000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_CUBIC_BIT_EXT                                               = T_VkFormatFeatureFlagBits2( $00002000 );
const VK_FORMAT_FEATURE_2_TRANSFER_SRC_BIT                                                                 = T_VkFormatFeatureFlagBits2( $00004000 );
const VK_FORMAT_FEATURE_2_TRANSFER_SRC_BIT_KHR                                                             = T_VkFormatFeatureFlagBits2( $00004000 );
const VK_FORMAT_FEATURE_2_TRANSFER_DST_BIT                                                                 = T_VkFormatFeatureFlagBits2( $00008000 );
const VK_FORMAT_FEATURE_2_TRANSFER_DST_BIT_KHR                                                             = T_VkFormatFeatureFlagBits2( $00008000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_MINMAX_BIT                                                  = T_VkFormatFeatureFlagBits2( $00010000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_MINMAX_BIT_KHR                                              = T_VkFormatFeatureFlagBits2( $00010000 );
const VK_FORMAT_FEATURE_2_MIDPOINT_CHROMA_SAMPLES_BIT                                                      = T_VkFormatFeatureFlagBits2( $00020000 );
const VK_FORMAT_FEATURE_2_MIDPOINT_CHROMA_SAMPLES_BIT_KHR                                                  = T_VkFormatFeatureFlagBits2( $00020000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT                                 = T_VkFormatFeatureFlagBits2( $00040000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT_KHR                             = T_VkFormatFeatureFlagBits2( $00040000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT                = T_VkFormatFeatureFlagBits2( $00080000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT_KHR            = T_VkFormatFeatureFlagBits2( $00080000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT                = T_VkFormatFeatureFlagBits2( $00100000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT_KHR            = T_VkFormatFeatureFlagBits2( $00100000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT      = T_VkFormatFeatureFlagBits2( $00200000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT_KHR  = T_VkFormatFeatureFlagBits2( $00200000 );
const VK_FORMAT_FEATURE_2_DISJOINT_BIT                                                                     = T_VkFormatFeatureFlagBits2( $00400000 );
const VK_FORMAT_FEATURE_2_DISJOINT_BIT_KHR                                                                 = T_VkFormatFeatureFlagBits2( $00400000 );
const VK_FORMAT_FEATURE_2_COSITED_CHROMA_SAMPLES_BIT                                                       = T_VkFormatFeatureFlagBits2( $00800000 );
const VK_FORMAT_FEATURE_2_COSITED_CHROMA_SAMPLES_BIT_KHR                                                   = T_VkFormatFeatureFlagBits2( $00800000 );
const VK_FORMAT_FEATURE_2_STORAGE_READ_WITHOUT_FORMAT_BIT                                                  = T_VkFormatFeatureFlagBits2( $80000000 );
const VK_FORMAT_FEATURE_2_STORAGE_READ_WITHOUT_FORMAT_BIT_KHR                                              = T_VkFormatFeatureFlagBits2( $80000000 );
const VK_FORMAT_FEATURE_2_STORAGE_WRITE_WITHOUT_FORMAT_BIT                                                 = T_VkFormatFeatureFlagBits2( $100000000 );
const VK_FORMAT_FEATURE_2_STORAGE_WRITE_WITHOUT_FORMAT_BIT_KHR                                             = T_VkFormatFeatureFlagBits2( $100000000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_DEPTH_COMPARISON_BIT                                               = T_VkFormatFeatureFlagBits2( $200000000 );
const VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_DEPTH_COMPARISON_BIT_KHR                                           = T_VkFormatFeatureFlagBits2( $200000000 );
const VK_FORMAT_FEATURE_2_VIDEO_DECODE_OUTPUT_BIT_KHR                                                      = T_VkFormatFeatureFlagBits2( $02000000 );
const VK_FORMAT_FEATURE_2_VIDEO_DECODE_DPB_BIT_KHR                                                         = T_VkFormatFeatureFlagBits2( $04000000 );
const VK_FORMAT_FEATURE_2_ACCELERATION_STRUCTURE_VERTEX_BUFFER_BIT_KHR                                     = T_VkFormatFeatureFlagBits2( $20000000 );
const VK_FORMAT_FEATURE_2_FRAGMENT_DENSITY_MAP_BIT_EXT                                                     = T_VkFormatFeatureFlagBits2( $01000000 );
const VK_FORMAT_FEATURE_2_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR                                         = T_VkFormatFeatureFlagBits2( $40000000 );
const VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT_EXT                                                      = T_VkFormatFeatureFlagBits2( $400000000000 );
const VK_FORMAT_FEATURE_2_VIDEO_ENCODE_INPUT_BIT_KHR                                                       = T_VkFormatFeatureFlagBits2( $08000000 );
const VK_FORMAT_FEATURE_2_VIDEO_ENCODE_DPB_BIT_KHR                                                         = T_VkFormatFeatureFlagBits2( $10000000 );
const VK_FORMAT_FEATURE_2_LINEAR_COLOR_ATTACHMENT_BIT_NV                                                   = T_VkFormatFeatureFlagBits2( $4000000000 );
const VK_FORMAT_FEATURE_2_WEIGHT_IMAGE_BIT_QCOM                                                            = T_VkFormatFeatureFlagBits2( $400000000 );
const VK_FORMAT_FEATURE_2_WEIGHT_SAMPLED_IMAGE_BIT_QCOM                                                    = T_VkFormatFeatureFlagBits2( $800000000 );
const VK_FORMAT_FEATURE_2_BLOCK_MATCHING_BIT_QCOM                                                          = T_VkFormatFeatureFlagBits2( $1000000000 );
const VK_FORMAT_FEATURE_2_BOX_FILTER_SAMPLED_BIT_QCOM                                                      = T_VkFormatFeatureFlagBits2( $2000000000 );
const VK_FORMAT_FEATURE_2_OPTICAL_FLOW_IMAGE_BIT_NV                                                        = T_VkFormatFeatureFlagBits2( $10000000000 );
const VK_FORMAT_FEATURE_2_OPTICAL_FLOW_VECTOR_BIT_NV                                                       = T_VkFormatFeatureFlagBits2( $20000000000 );
const VK_FORMAT_FEATURE_2_OPTICAL_FLOW_COST_BIT_NV                                                         = T_VkFormatFeatureFlagBits2( $40000000000 );

type T_VkPhysicalDeviceVulkan13Features = record
       sType                                              :T_VkStructureType;
       pNext                                              :P_void;
       robustImageAccess                                  :T_VkBool32;
       inlineUniformBlock                                 :T_VkBool32;
       descriptorBindingInlineUniformBlockUpdateAfterBind :T_VkBool32;
       pipelineCreationCacheControl                       :T_VkBool32;
       privateData                                        :T_VkBool32;
       shaderDemoteToHelperInvocation                     :T_VkBool32;
       shaderTerminateInvocation                          :T_VkBool32;
       subgroupSizeControl                                :T_VkBool32;
       computeFullSubgroups                               :T_VkBool32;
       synchronization2                                   :T_VkBool32;
       textureCompressionASTC_HDR                         :T_VkBool32;
       shaderZeroInitializeWorkgroupMemory                :T_VkBool32;
       dynamicRendering                                   :T_VkBool32;
       shaderIntegerDotProduct                            :T_VkBool32;
       maintenance4                                       :T_VkBool32;
     end;
     P_VkPhysicalDeviceVulkan13Features = ^T_VkPhysicalDeviceVulkan13Features;

type T_VkPhysicalDeviceVulkan13Properties = record
       sType                                                                         :T_VkStructureType;
       pNext                                                                         :P_void;
       minSubgroupSize                                                               :T_uint32_t;
       maxSubgroupSize                                                               :T_uint32_t;
       maxComputeWorkgroupSubgroups                                                  :T_uint32_t;
       requiredSubgroupSizeStages                                                    :T_VkShaderStageFlags;
       maxInlineUniformBlockSize                                                     :T_uint32_t;
       maxPerStageDescriptorInlineUniformBlocks                                      :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks                       :T_uint32_t;
       maxDescriptorSetInlineUniformBlocks                                           :T_uint32_t;
       maxDescriptorSetUpdateAfterBindInlineUniformBlocks                            :T_uint32_t;
       maxInlineUniformTotalSize                                                     :T_uint32_t;
       integerDotProduct8BitUnsignedAccelerated                                      :T_VkBool32;
       integerDotProduct8BitSignedAccelerated                                        :T_VkBool32;
       integerDotProduct8BitMixedSignednessAccelerated                               :T_VkBool32;
       integerDotProduct4x8BitPackedUnsignedAccelerated                              :T_VkBool32;
       integerDotProduct4x8BitPackedSignedAccelerated                                :T_VkBool32;
       integerDotProduct4x8BitPackedMixedSignednessAccelerated                       :T_VkBool32;
       integerDotProduct16BitUnsignedAccelerated                                     :T_VkBool32;
       integerDotProduct16BitSignedAccelerated                                       :T_VkBool32;
       integerDotProduct16BitMixedSignednessAccelerated                              :T_VkBool32;
       integerDotProduct32BitUnsignedAccelerated                                     :T_VkBool32;
       integerDotProduct32BitSignedAccelerated                                       :T_VkBool32;
       integerDotProduct32BitMixedSignednessAccelerated                              :T_VkBool32;
       integerDotProduct64BitUnsignedAccelerated                                     :T_VkBool32;
       integerDotProduct64BitSignedAccelerated                                       :T_VkBool32;
       integerDotProduct64BitMixedSignednessAccelerated                              :T_VkBool32;
       integerDotProductAccumulatingSaturating8BitUnsignedAccelerated                :T_VkBool32;
       integerDotProductAccumulatingSaturating8BitSignedAccelerated                  :T_VkBool32;
       integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated         :T_VkBool32;
       integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated        :T_VkBool32;
       integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated          :T_VkBool32;
       integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated :T_VkBool32;
       integerDotProductAccumulatingSaturating16BitUnsignedAccelerated               :T_VkBool32;
       integerDotProductAccumulatingSaturating16BitSignedAccelerated                 :T_VkBool32;
       integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated        :T_VkBool32;
       integerDotProductAccumulatingSaturating32BitUnsignedAccelerated               :T_VkBool32;
       integerDotProductAccumulatingSaturating32BitSignedAccelerated                 :T_VkBool32;
       integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated        :T_VkBool32;
       integerDotProductAccumulatingSaturating64BitUnsignedAccelerated               :T_VkBool32;
       integerDotProductAccumulatingSaturating64BitSignedAccelerated                 :T_VkBool32;
       integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated        :T_VkBool32;
       storageTexelBufferOffsetAlignmentBytes                                        :T_VkDeviceSize;
       storageTexelBufferOffsetSingleTexelAlignment                                  :T_VkBool32;
       uniformTexelBufferOffsetAlignmentBytes                                        :T_VkDeviceSize;
       uniformTexelBufferOffsetSingleTexelAlignment                                  :T_VkBool32;
       maxBufferSize                                                                 :T_VkDeviceSize;
     end;
     P_VkPhysicalDeviceVulkan13Properties = ^T_VkPhysicalDeviceVulkan13Properties;

type T_VkPipelineCreationFeedback = record
       flags    :T_VkPipelineCreationFeedbackFlags;
       duration :T_uint64_t;
     end;
     P_VkPipelineCreationFeedback = ^T_VkPipelineCreationFeedback;

type T_VkPipelineCreationFeedbackCreateInfo = record
       sType                              :T_VkStructureType;
       pNext                              :P_void;
       pPipelineCreationFeedback          :P_VkPipelineCreationFeedback;
       pipelineStageCreationFeedbackCount :T_uint32_t;
       pPipelineStageCreationFeedbacks    :P_VkPipelineCreationFeedback;
     end;
     P_VkPipelineCreationFeedbackCreateInfo = ^T_VkPipelineCreationFeedbackCreateInfo;

type T_VkPhysicalDeviceShaderTerminateInvocationFeatures = record
       sType                     :T_VkStructureType;
       pNext                     :P_void;
       shaderTerminateInvocation :T_VkBool32;
     end;
     P_VkPhysicalDeviceShaderTerminateInvocationFeatures = ^T_VkPhysicalDeviceShaderTerminateInvocationFeatures;

type T_VkPhysicalDeviceToolProperties = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       name        :array [ 0..VK_MAX_EXTENSION_NAME_SIZE-1 ] of T_char;
       version     :array [ 0..VK_MAX_EXTENSION_NAME_SIZE-1 ] of T_char;
       purposes    :T_VkToolPurposeFlags;
       description :array [ 0..VK_MAX_DESCRIPTION_SIZE-1 ] of T_char;
       layer       :array [ 0..VK_MAX_EXTENSION_NAME_SIZE-1 ] of T_char;
     end;
     P_VkPhysicalDeviceToolProperties = ^T_VkPhysicalDeviceToolProperties;

type T_VkPhysicalDeviceShaderDemoteToHelperInvocationFeatures = record
       sType                          :T_VkStructureType;
       pNext                          :P_void;
       shaderDemoteToHelperInvocation :T_VkBool32;
     end;
     P_VkPhysicalDeviceShaderDemoteToHelperInvocationFeatures = ^T_VkPhysicalDeviceShaderDemoteToHelperInvocationFeatures;

type T_VkPhysicalDevicePrivateDataFeatures = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       privateData :T_VkBool32;
     end;
     P_VkPhysicalDevicePrivateDataFeatures = ^T_VkPhysicalDevicePrivateDataFeatures;

type T_VkDevicePrivateDataCreateInfo = record
       sType                       :T_VkStructureType;
       pNext                       :P_void;
       privateDataSlotRequestCount :T_uint32_t;
     end;
     P_VkDevicePrivateDataCreateInfo = ^T_VkDevicePrivateDataCreateInfo;

type T_VkPrivateDataSlotCreateInfo = record
       sType :T_VkStructureType;
       pNext :P_void;
       flags :T_VkPrivateDataSlotCreateFlags;
     end;
     P_VkPrivateDataSlotCreateInfo = ^T_VkPrivateDataSlotCreateInfo;

type T_VkPhysicalDevicePipelineCreationCacheControlFeatures = record
       sType                        :T_VkStructureType;
       pNext                        :P_void;
       pipelineCreationCacheControl :T_VkBool32;
     end;
     P_VkPhysicalDevicePipelineCreationCacheControlFeatures = ^T_VkPhysicalDevicePipelineCreationCacheControlFeatures;

type T_VkMemoryBarrier2 = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       srcStageMask  :T_VkPipelineStageFlags2;
       srcAccessMask :T_VkAccessFlags2;
       dstStageMask  :T_VkPipelineStageFlags2;
       dstAccessMask :T_VkAccessFlags2;
     end;
     P_VkMemoryBarrier2 = ^T_VkMemoryBarrier2;


type T_VkBufferMemoryBarrier2 = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       srcStageMask        :T_VkPipelineStageFlags2;
       srcAccessMask       :T_VkAccessFlags2;
       dstStageMask        :T_VkPipelineStageFlags2;
       dstAccessMask       :T_VkAccessFlags2;
       srcQueueFamilyIndex :T_uint32_t;
       dstQueueFamilyIndex :T_uint32_t;
       buffer              :T_VkBuffer;
       offset              :T_VkDeviceSize;
       size                :T_VkDeviceSize;
     end;
     P_VkBufferMemoryBarrier2 = ^T_VkBufferMemoryBarrier2;

type T_VkImageMemoryBarrier2 = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       srcStageMask        :T_VkPipelineStageFlags2;
       srcAccessMask       :T_VkAccessFlags2;
       dstStageMask        :T_VkPipelineStageFlags2;
       dstAccessMask       :T_VkAccessFlags2;
       oldLayout           :T_VkImageLayout;
       newLayout           :T_VkImageLayout;
       srcQueueFamilyIndex :T_uint32_t;
       dstQueueFamilyIndex :T_uint32_t;
       image               :T_VkImage;
       subresourceRange    :T_VkImageSubresourceRange;
     end;
     P_VkImageMemoryBarrier2 = ^T_VkImageMemoryBarrier2;

type T_VkDependencyInfo = record
       sType                    :T_VkStructureType;
       pNext                    :P_void;
       dependencyFlags          :T_VkDependencyFlags;
       memoryBarrierCount       :T_uint32_t;
       pMemoryBarriers          :P_VkMemoryBarrier2;
       bufferMemoryBarrierCount :T_uint32_t;
       pBufferMemoryBarriers    :P_VkBufferMemoryBarrier2;
       imageMemoryBarrierCount  :T_uint32_t;
       pImageMemoryBarriers     :P_VkImageMemoryBarrier2;
     end;
     P_VkDependencyInfo = ^T_VkDependencyInfo;

type T_VkSemaphoreSubmitInfo = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       semaphore   :T_VkSemaphore;
       value       :T_uint64_t;
       stageMask   :T_VkPipelineStageFlags2;
       deviceIndex :T_uint32_t;
     end;
     P_VkSemaphoreSubmitInfo = ^T_VkSemaphoreSubmitInfo;

type T_VkCommandBufferSubmitInfo = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       commandBuffer :T_VkCommandBuffer;
       deviceMask    :T_uint32_t;
     end;
     P_VkCommandBufferSubmitInfo = ^T_VkCommandBufferSubmitInfo;

type T_VkSubmitInfo2 = record
       sType                    :T_VkStructureType;
       pNext                    :P_void;
       flags                    :T_VkSubmitFlags;
       waitSemaphoreInfoCount   :T_uint32_t;
       pWaitSemaphoreInfos      :P_VkSemaphoreSubmitInfo;
       commandBufferInfoCount   :T_uint32_t;
       pCommandBufferInfos      :P_VkCommandBufferSubmitInfo;
       signalSemaphoreInfoCount :T_uint32_t;
       pSignalSemaphoreInfos    :P_VkSemaphoreSubmitInfo;
     end;
     P_VkSubmitInfo2 = ^T_VkSubmitInfo2;

type T_VkPhysicalDeviceSynchronization2Features = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       synchronization2 :T_VkBool32;
     end;
     P_VkPhysicalDeviceSynchronization2Features = ^T_VkPhysicalDeviceSynchronization2Features;

type T_VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeatures = record
       sType                               :T_VkStructureType;
       pNext                               :P_void;
       shaderZeroInitializeWorkgroupMemory :T_VkBool32;
     end;
     P_VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeatures = ^T_VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeatures;

type T_VkPhysicalDeviceImageRobustnessFeatures = record
       sType             :T_VkStructureType;
       pNext             :P_void;
       robustImageAccess :T_VkBool32;
     end;
     P_VkPhysicalDeviceImageRobustnessFeatures = ^T_VkPhysicalDeviceImageRobustnessFeatures;

type T_VkBufferCopy2 = record
       sType     :T_VkStructureType;
       pNext     :P_void;
       srcOffset :T_VkDeviceSize;
       dstOffset :T_VkDeviceSize;
       size      :T_VkDeviceSize;
     end;
     P_VkBufferCopy2 = ^T_VkBufferCopy2;

type T_VkCopyBufferInfo2 = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       srcBuffer   :T_VkBuffer;
       dstBuffer   :T_VkBuffer;
       regionCount :T_uint32_t;
       pRegions    :P_VkBufferCopy2;
     end;
     P_VkCopyBufferInfo2 = ^T_VkCopyBufferInfo2;

type T_VkImageCopy2 = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       srcSubresource :T_VkImageSubresourceLayers;
       srcOffset      :T_VkOffset3D;
       dstSubresource :T_VkImageSubresourceLayers;
       dstOffset      :T_VkOffset3D;
       extent         :T_VkExtent3D;
     end;
     P_VkImageCopy2 = ^T_VkImageCopy2;

type T_VkCopyImageInfo2 = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       srcImage       :T_VkImage;
       srcImageLayout :T_VkImageLayout;
       dstImage       :T_VkImage;
       dstImageLayout :T_VkImageLayout;
       regionCount    :T_uint32_t;
       pRegions       :P_VkImageCopy2;
     end;
     P_VkCopyImageInfo2 = ^T_VkCopyImageInfo2;

type T_VkBufferImageCopy2 = record
       sType             :T_VkStructureType;
       pNext             :P_void;
       bufferOffset      :T_VkDeviceSize;
       bufferRowLength   :T_uint32_t;
       bufferImageHeight :T_uint32_t;
       imageSubresource  :T_VkImageSubresourceLayers;
       imageOffset       :T_VkOffset3D;
       imageExtent       :T_VkExtent3D;
     end;
     P_VkBufferImageCopy2 = ^T_VkBufferImageCopy2;

type T_VkCopyBufferToImageInfo2 = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       srcBuffer      :T_VkBuffer;
       dstImage       :T_VkImage;
       dstImageLayout :T_VkImageLayout;
       regionCount    :T_uint32_t;
       pRegions       :P_VkBufferImageCopy2;
     end;
     P_VkCopyBufferToImageInfo2 = ^T_VkCopyBufferToImageInfo2;

type T_VkCopyImageToBufferInfo2 = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       srcImage       :T_VkImage;
       srcImageLayout :T_VkImageLayout;
       dstBuffer      :T_VkBuffer;
       regionCount    :T_uint32_t;
       pRegions       :P_VkBufferImageCopy2;
     end;
     P_VkCopyImageToBufferInfo2 = ^T_VkCopyImageToBufferInfo2;

type T_VkImageBlit2 = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       srcSubresource :T_VkImageSubresourceLayers;
       srcOffsets     :array [ 0..1 ] of T_VkOffset3D;
       dstSubresource :T_VkImageSubresourceLayers;
       dstOffsets     :array [ 0..1 ] of T_VkOffset3D;
     end;
     P_VkImageBlit2 = ^T_VkImageBlit2;

type T_VkBlitImageInfo2 = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       srcImage       :T_VkImage;
       srcImageLayout :T_VkImageLayout;
       dstImage       :T_VkImage;
       dstImageLayout :T_VkImageLayout;
       regionCount    :T_uint32_t;
       pRegions       :P_VkImageBlit2;
       filter         :T_VkFilter;
     end;
     P_VkBlitImageInfo2 = ^T_VkBlitImageInfo2;

type T_VkImageResolve2 = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       srcSubresource :T_VkImageSubresourceLayers;
       srcOffset      :T_VkOffset3D;
       dstSubresource :T_VkImageSubresourceLayers;
       dstOffset      :T_VkOffset3D;
       extent         :T_VkExtent3D;
     end;
     P_VkImageResolve2 = ^T_VkImageResolve2;

type T_VkResolveImageInfo2 = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       srcImage       :T_VkImage;
       srcImageLayout :T_VkImageLayout;
       dstImage       :T_VkImage;
       dstImageLayout :T_VkImageLayout;
       regionCount    :T_uint32_t;
       pRegions       :P_VkImageResolve2;
     end;
     P_VkResolveImageInfo2 = ^T_VkResolveImageInfo2;

type T_VkPhysicalDeviceSubgroupSizeControlFeatures = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       subgroupSizeControl  :T_VkBool32;
       computeFullSubgroups :T_VkBool32;
     end;
     P_VkPhysicalDeviceSubgroupSizeControlFeatures = ^T_VkPhysicalDeviceSubgroupSizeControlFeatures;

type T_VkPhysicalDeviceSubgroupSizeControlProperties = record
       sType                        :T_VkStructureType;
       pNext                        :P_void;
       minSubgroupSize              :T_uint32_t;
       maxSubgroupSize              :T_uint32_t;
       maxComputeWorkgroupSubgroups :T_uint32_t;
       requiredSubgroupSizeStages   :T_VkShaderStageFlags;
     end;
     P_VkPhysicalDeviceSubgroupSizeControlProperties = ^T_VkPhysicalDeviceSubgroupSizeControlProperties;

type T_VkPipelineShaderStageRequiredSubgroupSizeCreateInfo = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       requiredSubgroupSize :T_uint32_t;
     end;
     P_VkPipelineShaderStageRequiredSubgroupSizeCreateInfo = ^T_VkPipelineShaderStageRequiredSubgroupSizeCreateInfo;

type T_VkPhysicalDeviceInlineUniformBlockFeatures = record
       sType                                              :T_VkStructureType;
       pNext                                              :P_void;
       inlineUniformBlock                                 :T_VkBool32;
       descriptorBindingInlineUniformBlockUpdateAfterBind :T_VkBool32;
     end;
     P_VkPhysicalDeviceInlineUniformBlockFeatures = ^T_VkPhysicalDeviceInlineUniformBlockFeatures;

type T_VkPhysicalDeviceInlineUniformBlockProperties = record
       sType                                                   :T_VkStructureType;
       pNext                                                   :P_void;
       maxInlineUniformBlockSize                               :T_uint32_t;
       maxPerStageDescriptorInlineUniformBlocks                :T_uint32_t;
       maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks :T_uint32_t;
       maxDescriptorSetInlineUniformBlocks                     :T_uint32_t;
       maxDescriptorSetUpdateAfterBindInlineUniformBlocks      :T_uint32_t;
     end;
     P_VkPhysicalDeviceInlineUniformBlockProperties = ^T_VkPhysicalDeviceInlineUniformBlockProperties;

type T_VkWriteDescriptorSetInlineUniformBlock = record
       sType    :T_VkStructureType;
       pNext    :P_void;
       dataSize :T_uint32_t;
       pData    :P_void;
     end;
     P_VkWriteDescriptorSetInlineUniformBlock = ^T_VkWriteDescriptorSetInlineUniformBlock;

type T_VkDescriptorPoolInlineUniformBlockCreateInfo = record
       sType                         :T_VkStructureType;
       pNext                         :P_void;
       maxInlineUniformBlockBindings :T_uint32_t;
     end;
     P_VkDescriptorPoolInlineUniformBlockCreateInfo = ^T_VkDescriptorPoolInlineUniformBlockCreateInfo;

type T_VkPhysicalDeviceTextureCompressionASTCHDRFeatures = record
       sType                      :T_VkStructureType;
       pNext                      :P_void;
       textureCompressionASTC_HDR :T_VkBool32;
     end;
     P_VkPhysicalDeviceTextureCompressionASTCHDRFeatures = ^T_VkPhysicalDeviceTextureCompressionASTCHDRFeatures;

type T_VkRenderingAttachmentInfo = record
       sType              :T_VkStructureType;
       pNext              :P_void;
       imageView          :T_VkImageView;
       imageLayout        :T_VkImageLayout;
       resolveMode        :T_VkResolveModeFlagBits;
       resolveImageView   :T_VkImageView;
       resolveImageLayout :T_VkImageLayout;
       loadOp             :T_VkAttachmentLoadOp;
       storeOp            :T_VkAttachmentStoreOp;
       clearValue         :T_VkClearValue;
     end;
     P_VkRenderingAttachmentInfo = ^T_VkRenderingAttachmentInfo;

type T_VkRenderingInfo = record
       sType                :T_VkStructureType;
       pNext                :P_void;
       flags                :T_VkRenderingFlags;
       renderArea           :T_VkRect2D;
       layerCount           :T_uint32_t;
       viewMask             :T_uint32_t;
       colorAttachmentCount :T_uint32_t;
       pColorAttachments    :P_VkRenderingAttachmentInfo;
       pDepthAttachment     :P_VkRenderingAttachmentInfo;
       pStencilAttachment   :P_VkRenderingAttachmentInfo;
     end;
     P_VkRenderingInfo = ^T_VkRenderingInfo;

type T_VkPipelineRenderingCreateInfo = record
       sType                   :T_VkStructureType;
       pNext                   :P_void;
       viewMask                :T_uint32_t;
       colorAttachmentCount    :T_uint32_t;
       pColorAttachmentFormats :P_VkFormat;
       depthAttachmentFormat   :T_VkFormat;
       stencilAttachmentFormat :T_VkFormat;
     end;
     P_VkPipelineRenderingCreateInfo = ^T_VkPipelineRenderingCreateInfo;

type T_VkPhysicalDeviceDynamicRenderingFeatures = record
       sType            :T_VkStructureType;
       pNext            :P_void;
       dynamicRendering :T_VkBool32;
     end;
     P_VkPhysicalDeviceDynamicRenderingFeatures = ^T_VkPhysicalDeviceDynamicRenderingFeatures;

type T_VkCommandBufferInheritanceRenderingInfo = record
       sType                   :T_VkStructureType;
       pNext                   :P_void;
       flags                   :T_VkRenderingFlags;
       viewMask                :T_uint32_t;
       colorAttachmentCount    :T_uint32_t;
       pColorAttachmentFormats :P_VkFormat;
       depthAttachmentFormat   :T_VkFormat;
       stencilAttachmentFormat :T_VkFormat;
       rasterizationSamples    :T_VkSampleCountFlagBits;
     end;
     P_VkCommandBufferInheritanceRenderingInfo = ^T_VkCommandBufferInheritanceRenderingInfo;

type T_VkPhysicalDeviceShaderIntegerDotProductFeatures = record
       sType                   :T_VkStructureType;
       pNext                   :P_void;
       shaderIntegerDotProduct :T_VkBool32;
     end;
     P_VkPhysicalDeviceShaderIntegerDotProductFeatures = ^T_VkPhysicalDeviceShaderIntegerDotProductFeatures;

type T_VkPhysicalDeviceShaderIntegerDotProductProperties = record
       sType                                                                         :T_VkStructureType;
       pNext                                                                         :P_void;
       integerDotProduct8BitUnsignedAccelerated                                      :T_VkBool32;
       integerDotProduct8BitSignedAccelerated                                        :T_VkBool32;
       integerDotProduct8BitMixedSignednessAccelerated                               :T_VkBool32;
       integerDotProduct4x8BitPackedUnsignedAccelerated                              :T_VkBool32;
       integerDotProduct4x8BitPackedSignedAccelerated                                :T_VkBool32;
       integerDotProduct4x8BitPackedMixedSignednessAccelerated                       :T_VkBool32;
       integerDotProduct16BitUnsignedAccelerated                                     :T_VkBool32;
       integerDotProduct16BitSignedAccelerated                                       :T_VkBool32;
       integerDotProduct16BitMixedSignednessAccelerated                              :T_VkBool32;
       integerDotProduct32BitUnsignedAccelerated                                     :T_VkBool32;
       integerDotProduct32BitSignedAccelerated                                       :T_VkBool32;
       integerDotProduct32BitMixedSignednessAccelerated                              :T_VkBool32;
       integerDotProduct64BitUnsignedAccelerated                                     :T_VkBool32;
       integerDotProduct64BitSignedAccelerated                                       :T_VkBool32;
       integerDotProduct64BitMixedSignednessAccelerated                              :T_VkBool32;
       integerDotProductAccumulatingSaturating8BitUnsignedAccelerated                :T_VkBool32;
       integerDotProductAccumulatingSaturating8BitSignedAccelerated                  :T_VkBool32;
       integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated         :T_VkBool32;
       integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated        :T_VkBool32;
       integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated          :T_VkBool32;
       integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated :T_VkBool32;
       integerDotProductAccumulatingSaturating16BitUnsignedAccelerated               :T_VkBool32;
       integerDotProductAccumulatingSaturating16BitSignedAccelerated                 :T_VkBool32;
       integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated        :T_VkBool32;
       integerDotProductAccumulatingSaturating32BitUnsignedAccelerated               :T_VkBool32;
       integerDotProductAccumulatingSaturating32BitSignedAccelerated                 :T_VkBool32;
       integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated        :T_VkBool32;
       integerDotProductAccumulatingSaturating64BitUnsignedAccelerated               :T_VkBool32;
       integerDotProductAccumulatingSaturating64BitSignedAccelerated                 :T_VkBool32;
       integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated        :T_VkBool32;
     end;
     P_VkPhysicalDeviceShaderIntegerDotProductProperties = ^T_VkPhysicalDeviceShaderIntegerDotProductProperties;

type T_VkPhysicalDeviceTexelBufferAlignmentProperties = record
       sType                                        :T_VkStructureType;
       pNext                                        :P_void;
       storageTexelBufferOffsetAlignmentBytes       :T_VkDeviceSize;
       storageTexelBufferOffsetSingleTexelAlignment :T_VkBool32;
       uniformTexelBufferOffsetAlignmentBytes       :T_VkDeviceSize;
       uniformTexelBufferOffsetSingleTexelAlignment :T_VkBool32;
     end;
     P_VkPhysicalDeviceTexelBufferAlignmentProperties = ^T_VkPhysicalDeviceTexelBufferAlignmentProperties;

type T_VkFormatProperties3 = record
       sType                 :T_VkStructureType;
       pNext                 :P_void;
       linearTilingFeatures  :T_VkFormatFeatureFlags2;
       optimalTilingFeatures :T_VkFormatFeatureFlags2;
       bufferFeatures        :T_VkFormatFeatureFlags2;
     end;
     P_VkFormatProperties3 = ^T_VkFormatProperties3;

type T_VkPhysicalDeviceMaintenance4Features = record
       sType        :T_VkStructureType;
       pNext        :P_void;
       maintenance4 :T_VkBool32;
     end;
     P_VkPhysicalDeviceMaintenance4Features = ^T_VkPhysicalDeviceMaintenance4Features;

type T_VkPhysicalDeviceMaintenance4Properties = record
       sType         :T_VkStructureType;
       pNext         :P_void;
       maxBufferSize :T_VkDeviceSize;
     end;
     P_VkPhysicalDeviceMaintenance4Properties = ^T_VkPhysicalDeviceMaintenance4Properties;

type T_VkDeviceBufferMemoryRequirements = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       pCreateInfo :P_VkBufferCreateInfo;
     end;
     P_VkDeviceBufferMemoryRequirements = ^T_VkDeviceBufferMemoryRequirements;

type T_VkDeviceImageMemoryRequirements = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       pCreateInfo :P_VkImageCreateInfo;
       planeAspect :T_VkImageAspectFlagBits;
     end;
     P_VkDeviceImageMemoryRequirements = ^T_VkDeviceImageMemoryRequirements;

type
T_PFN_vkGetPhysicalDeviceToolProperties = function( physicalDevice_  :T_VkPhysicalDevice;
                                                    pToolCount_      :P_uint32_t;
                                                    pToolProperties_ :P_VkPhysicalDeviceToolProperties ) :T_VkResult;
                                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCreatePrivateDataSlot = function(       device_           :T_VkDevice;
                                          const pCreateInfo_      :P_VkPrivateDataSlotCreateInfo;
                                          const pAllocator_       :P_VkAllocationCallbacks;
                                                pPrivateDataSlot_ :P_VkPrivateDataSlot ) :T_VkResult;
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroyPrivateDataSlot = procedure(       device_          :T_VkDevice;
                                                  privateDataSlot_ :T_VkPrivateDataSlot;
                                            const pAllocator_      :P_VkAllocationCallbacks );
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkSetPrivateData = function( device_          :T_VkDevice;
                                   objectType_      :T_VkObjectType;
                                   objectHandle_    :T_uint64_t;
                                   privateDataSlot_ :T_VkPrivateDataSlot;
                                   data_            :T_uint64_t ) :T_VkResult;
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPrivateData = procedure( device_          :T_VkDevice;
                                    objectType_      :T_VkObjectType;
                                    objectHandle_    :T_uint64_t;
                                    privateDataSlot_ :T_VkPrivateDataSlot;
                                    pData_           :P_uint64_t );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetEvent2 = procedure(       commandBuffer_   :T_VkCommandBuffer;
                                        event_           :T_VkEvent;
                                  const pDependencyInfo_ :P_VkDependencyInfo );
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdResetEvent2 = procedure( commandBuffer_ :T_VkCommandBuffer;
                                    event_         :T_VkEvent;
                                    stageMask_     :T_VkPipelineStageFlags2 );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdWaitEvents2 = procedure(       commandBuffer_    :T_VkCommandBuffer;
                                          eventCount_       :T_uint32_t;
                                    const pEvents_          :P_VkEvent;
                                    const pDependencyInfos_ :P_VkDependencyInfo );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdPipelineBarrier2 = procedure(       commandBuffer_   :T_VkCommandBuffer;
                                         const pDependencyInfo_ :P_VkDependencyInfo );
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdWriteTimestamp2 = procedure( commandBuffer_ :T_VkCommandBuffer;
                                        stage_         :T_VkPipelineStageFlags2;
                                        queryPool_     :T_VkQueryPool;
                                        query_         :T_uint32_t );
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkQueueSubmit2 = function(       queue_       :T_VkQueue;
                                       submitCount_ :T_uint32_t;
                                 const pSubmits_    :P_VkSubmitInfo2;
                                       fence_       :T_VkFence ) :T_VkResult;
                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdCopyBuffer2 = procedure(       commandBuffer_   :T_VkCommandBuffer;
                                    const pCopyBufferInfo_ :P_VkCopyBufferInfo2 );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdCopyImage2 = procedure(       commandBuffer_  :T_VkCommandBuffer;
                                   const pCopyImageInfo_ :P_VkCopyImageInfo2 );
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdCopyBufferToImage2 = procedure(       commandBuffer_          :T_VkCommandBuffer;
                                           const pCopyBufferToImageInfo_ :P_VkCopyBufferToImageInfo2 );
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdCopyImageToBuffer2 = procedure(       commandBuffer_          :T_VkCommandBuffer;
                                           const pCopyImageToBufferInfo_ :P_VkCopyImageToBufferInfo2 );
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBlitImage2 = procedure(       commandBuffer_  :T_VkCommandBuffer;
                                   const pBlitImageInfo_ :P_VkBlitImageInfo2 );
                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdResolveImage2 = procedure(       commandBuffer_     :T_VkCommandBuffer;
                                      const pResolveImageInfo_ :P_VkResolveImageInfo2 );
                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBeginRendering = procedure(       commandBuffer_  :T_VkCommandBuffer;
                                       const pRenderingInfo_ :P_VkRenderingInfo );
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdEndRendering = procedure( commandBuffer_ :T_VkCommandBuffer );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetCullMode = procedure( commandBuffer_ :T_VkCommandBuffer;
                                    cullMode_      :T_VkCullModeFlags );
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetFrontFace = procedure( commandBuffer_ :T_VkCommandBuffer;
                                     frontFace_     :T_VkFrontFace );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetPrimitiveTopology = procedure( commandBuffer_     :T_VkCommandBuffer;
                                             primitiveTopology_ :T_VkPrimitiveTopology );
                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetViewportWithCount = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                                   viewportCount_ :T_uint32_t;
                                             const pViewports_    :P_VkViewport );
                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetScissorWithCount = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                                  scissorCount_  :T_uint32_t;
                                            const pScissors_     :P_VkRect2D );
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdBindVertexBuffers2 = procedure(       commandBuffer_ :T_VkCommandBuffer;
                                                 firstBinding_  :T_uint32_t;
                                                 bindingCount_  :T_uint32_t;
                                           const pBuffers_      :P_VkBuffer;
                                           const pOffsets_      :P_VkDeviceSize;
                                           const pSizes_        :P_VkDeviceSize;
                                           const pStrides_      :P_VkDeviceSize );
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetDepthTestEnable = procedure( commandBuffer_   :T_VkCommandBuffer;
                                           depthTestEnable_ :T_VkBool32 );
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetDepthWriteEnable = procedure( commandBuffer_    :T_VkCommandBuffer;
                                            depthWriteEnable_ :T_VkBool32 );
                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetDepthCompareOp = procedure( commandBuffer_  :T_VkCommandBuffer;
                                          depthCompareOp_ :T_VkCompareOp );
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetDepthBoundsTestEnable = procedure( commandBuffer_         :T_VkCommandBuffer;
                                                 depthBoundsTestEnable_ :T_VkBool32 );
                                      {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetStencilTestEnable = procedure( commandBuffer_     :T_VkCommandBuffer;
                                             stencilTestEnable_ :T_VkBool32 );
                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetStencilOp = procedure( commandBuffer_ :T_VkCommandBuffer;
                                     faceMask_      :T_VkStencilFaceFlags;
                                     failOp_        :T_VkStencilOp;
                                     passOp_        :T_VkStencilOp;
                                     depthFailOp_   :T_VkStencilOp;
                                     compareOp_     :T_VkCompareOp );
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetRasterizerDiscardEnable = procedure( commandBuffer_           :T_VkCommandBuffer;
                                                   rasterizerDiscardEnable_ :T_VkBool32 );
                                        {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetDepthBiasEnable = procedure( commandBuffer_   :T_VkCommandBuffer;
                                           depthBiasEnable_ :T_VkBool32 );
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkCmdSetPrimitiveRestartEnable = procedure( commandBuffer_          :T_VkCommandBuffer;
                                                  primitiveRestartEnable_ :T_VkBool32 );
                                       {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceBufferMemoryRequirements = procedure(       device_              :T_VkDevice;
                                                       const pInfo_               :P_VkDeviceBufferMemoryRequirements;
                                                             pMemoryRequirements_ :P_VkMemoryRequirements2 );
                                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceImageMemoryRequirements = procedure(       device_              :T_VkDevice;
                                                      const pInfo_               :P_VkDeviceImageMemoryRequirements;
                                                            pMemoryRequirements_ :P_VkMemoryRequirements2 );
                                           {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceImageSparseMemoryRequirements = procedure(       device_                        :T_VkDevice;
                                                            const pInfo_                         :P_VkDeviceImageMemoryRequirements;
                                                                  pSparseMemoryRequirementCount_ :P_uint32_t;
                                                                  pSparseMemoryRequirements_     :P_VkSparseImageMemoryRequirements2 );
                                                 {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

// VK_KHR_surface is a preprocessor guard. Do not pass it to API calls.

const VK_KHR_surface = 1;
//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkSurfaceKHR)
{$IF Defined( CPU64BITS ) }
type T_VkSurfaceKHR = ^T__VkSurfaceKHR;  T__VkSurfaceKHR = record end;  P_VkSurfaceKHR = ^T_VkSurfaceKHR;
{$ELSE}
type T_VkSurfaceKHR = T_uint64_t;  P_VkSurfaceKHR = ^T_VkSurfaceKHR;
{$ENDIF}
const VK_KHR_SURFACE_SPEC_VERSION = 25;
const VK_KHR_SURFACE_EXTENSION_NAME = 'VK_KHR_surface';

//typedef enum VkPresentModeKHR {
type T_VkPresentModeKHR = T_int32_t;  P_VkPresentModeKHR = ^T_VkPresentModeKHR;
const VK_PRESENT_MODE_IMMEDIATE_KHR                 = 0;
const VK_PRESENT_MODE_MAILBOX_KHR                   = 1;
const VK_PRESENT_MODE_FIFO_KHR                      = 2;
const VK_PRESENT_MODE_FIFO_RELAXED_KHR              = 3;
const VK_PRESENT_MODE_SHARED_DEMAND_REFRESH_KHR     = 1000111000;
const VK_PRESENT_MODE_SHARED_CONTINUOUS_REFRESH_KHR = 1000111001;
const VK_PRESENT_MODE_MAX_ENUM_KHR                  = $7FFFFFFF;
//} VkPresentModeKHR;

//typedef enum VkColorSpaceKHR {
type T_VkColorSpaceKHR = T_int32_t;  P_VkColorSpaceKHR = ^T_VkColorSpaceKHR;
const VK_COLOR_SPACE_SRGB_NONLINEAR_KHR          = 0;
const VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT    = 1000104001;
const VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT    = 1000104002;
const VK_COLOR_SPACE_DISPLAY_P3_LINEAR_EXT       = 1000104003;
const VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT        = 1000104004;
const VK_COLOR_SPACE_BT709_LINEAR_EXT            = 1000104005;
const VK_COLOR_SPACE_BT709_NONLINEAR_EXT         = 1000104006;
const VK_COLOR_SPACE_BT2020_LINEAR_EXT           = 1000104007;
const VK_COLOR_SPACE_HDR10_ST2084_EXT            = 1000104008;
const VK_COLOR_SPACE_DOLBYVISION_EXT             = 1000104009;
const VK_COLOR_SPACE_HDR10_HLG_EXT               = 1000104010;
const VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT         = 1000104011;
const VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT      = 1000104012;
const VK_COLOR_SPACE_PASS_THROUGH_EXT            = 1000104013;
const VK_COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT = 1000104014;
const VK_COLOR_SPACE_DISPLAY_NATIVE_AMD          = 1000213000;
const VK_COLORSPACE_SRGB_NONLINEAR_KHR           = VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
const VK_COLOR_SPACE_DCI_P3_LINEAR_EXT           = VK_COLOR_SPACE_DISPLAY_P3_LINEAR_EXT;
const VK_COLOR_SPACE_MAX_ENUM_KHR                = $7FFFFFFF;
//} VkColorSpaceKHR;

//typedef enum VkSurfaceTransformFlagBitsKHR {
type T_VkSurfaceTransformFlagBitsKHR = T_int32_t;  P_VkSurfaceTransformFlagBitsKHR = ^T_VkSurfaceTransformFlagBitsKHR;
const VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR                   = $00000001;
const VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR                  = $00000002;
const VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR                 = $00000004;
const VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR                 = $00000008;
const VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR          = $00000010;
const VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR  = $00000020;
const VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR = $00000040;
const VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR = $00000080;
const VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR                    = $00000100;
const VK_SURFACE_TRANSFORM_FLAG_BITS_MAX_ENUM_KHR             = $7FFFFFFF;
//} VkSurfaceTransformFlagBitsKHR;

//typedef enum VkCompositeAlphaFlagBitsKHR {
type T_VkCompositeAlphaFlagBitsKHR = T_int32_t;  P_VkCompositeAlphaFlagBitsKHR = ^T_VkCompositeAlphaFlagBitsKHR;
const VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR          = $00000001;
const VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR  = $00000002;
const VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR = $00000004;
const VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR         = $00000008;
const VK_COMPOSITE_ALPHA_FLAG_BITS_MAX_ENUM_KHR  = $7FFFFFFF;
//} VkCompositeAlphaFlagBitsKHR;
type T_VkCompositeAlphaFlagsKHR = T_VkFlags;  P_VkCompositeAlphaFlagsKHR = ^T_VkCompositeAlphaFlagsKHR;
type T_VkSurfaceTransformFlagsKHR = T_VkFlags;  P_VkSurfaceTransformFlagsKHR = ^T_VkSurfaceTransformFlagsKHR;
type T_VkSurfaceCapabilitiesKHR = record
       minImageCount           :T_uint32_t;
       maxImageCount           :T_uint32_t;
       currentExtent           :T_VkExtent2D;
       minImageExtent          :T_VkExtent2D;
       maxImageExtent          :T_VkExtent2D;
       maxImageArrayLayers     :T_uint32_t;
       supportedTransforms     :T_VkSurfaceTransformFlagsKHR;
       currentTransform        :T_VkSurfaceTransformFlagBitsKHR;
       supportedCompositeAlpha :T_VkCompositeAlphaFlagsKHR;
       supportedUsageFlags     :T_VkImageUsageFlags;
     end;
     P_VkSurfaceCapabilitiesKHR = ^T_VkSurfaceCapabilitiesKHR;

type T_VkSurfaceFormatKHR = record
       format     :T_VkFormat;
       colorSpace :T_VkColorSpaceKHR;
     end;
     P_VkSurfaceFormatKHR = ^T_VkSurfaceFormatKHR;

type
T_PFN_vkDestroySurfaceKHR = procedure(       instance_   :T_VkInstance;
                                             surface_    :T_VkSurfaceKHR;
                                       const pAllocator_ :P_VkAllocationCallbacks );
                            {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceSurfaceSupportKHR = function( physicalDevice_   :T_VkPhysicalDevice;
                                                       queueFamilyIndex_ :T_uint32_t;
                                                       surface_          :T_VkSurfaceKHR;
                                                       pSupported_       :P_VkBool32 ) :T_VkResult;
                                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = function( physicalDevice_       :T_VkPhysicalDevice;
                                                            surface_              :T_VkSurfaceKHR;
                                                            pSurfaceCapabilities_ :P_VkSurfaceCapabilitiesKHR ) :T_VkResult;
                                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceSurfaceFormatsKHR = function( physicalDevice_      :T_VkPhysicalDevice;
                                                       surface_             :T_VkSurfaceKHR;
                                                       pSurfaceFormatCount_ :P_uint32_t;
                                                       pSurfaceFormats_     :P_VkSurfaceFormatKHR ) :T_VkResult;
                                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDeviceSurfacePresentModesKHR = function( physicalDevice_    :T_VkPhysicalDevice;
                                                            surface_           :T_VkSurfaceKHR;
                                                            pPresentModeCount_ :P_uint32_t;
                                                            pPresentModes_     :P_VkPresentModeKHR ) :T_VkResult;
                                                  {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}


// VK_KHR_swapchain is a preprocessor guard. Do not pass it to API calls.

const VK_KHR_swapchain = 1;
//VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkSwapchainKHR)
{$IF Defined( CPU64BITS ) }
type T_VkSwapchainKHR = ^T__VkSwapchainKHR;  T__VkSwapchainKHR = record end;  P_VkSwapchainKHR = ^T_VkSwapchainKHR;
{$ELSE}
type T_VkSwapchainKHR = T_uint64_t;  P_VkSwapchainKHR = ^T_VkSwapchainKHR;
{$ENDIF}
const VK_KHR_SWAPCHAIN_SPEC_VERSION = 70;
const VK_KHR_SWAPCHAIN_EXTENSION_NAME = 'VK_KHR_swapchain';

//typedef enum VkSwapchainCreateFlagBitsKHR {
type T_VkSwapchainCreateFlagBitsKHR = T_int32_t;  P_VkSwapchainCreateFlagBitsKHR = ^T_VkSwapchainCreateFlagBitsKHR;
const VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR = $00000001;
const VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR                   = $00000002;
const VK_SWAPCHAIN_CREATE_MUTABLE_FORMAT_BIT_KHR              = $00000004;
const VK_SWAPCHAIN_CREATE_DEFERRED_MEMORY_ALLOCATION_BIT_EXT  = $00000008;
const VK_SWAPCHAIN_CREATE_FLAG_BITS_MAX_ENUM_KHR              = $7FFFFFFF;
//} VkSwapchainCreateFlagBitsKHR;
type T_VkSwapchainCreateFlagsKHR = T_VkFlags;  P_VkSwapchainCreateFlagsKHR = ^T_VkSwapchainCreateFlagsKHR;

//typedef enum VkDeviceGroupPresentModeFlagBitsKHR {
type T_VkDeviceGroupPresentModeFlagBitsKHR = T_int32_t;  P_VkDeviceGroupPresentModeFlagBitsKHR = ^T_VkDeviceGroupPresentModeFlagBitsKHR;
const VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR              = $00000001;
const VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR             = $00000002;
const VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR                = $00000004;
const VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR = $00000008;
const VK_DEVICE_GROUP_PRESENT_MODE_FLAG_BITS_MAX_ENUM_KHR     = $7FFFFFFF;
//} VkDeviceGroupPresentModeFlagBitsKHR;
type T_VkDeviceGroupPresentModeFlagsKHR = T_VkFlags;  P_VkDeviceGroupPresentModeFlagsKHR = ^T_VkDeviceGroupPresentModeFlagsKHR;
type T_VkSwapchainCreateInfoKHR = record
       sType                  :T_VkStructureType;
       pNext                  :P_void;
       flags                  :T_VkSwapchainCreateFlagsKHR;
       surface                :T_VkSurfaceKHR;
       minImageCount          :T_uint32_t;
       imageFormat            :T_VkFormat;
       imageColorSpace        :T_VkColorSpaceKHR;
       imageExtent            :T_VkExtent2D;
       imageArrayLayers       :T_uint32_t;
       imageUsage             :T_VkImageUsageFlags;
       imageSharingMode       :T_VkSharingMode;
       queueFamilyIndexCount  :T_uint32_t;
       pQueueFamilyIndices    :P_uint32_t;
       preTransform           :T_VkSurfaceTransformFlagBitsKHR;
       compositeAlpha         :T_VkCompositeAlphaFlagBitsKHR;
       presentMode            :T_VkPresentModeKHR;
       clipped                :T_VkBool32;
       oldSwapchain           :T_VkSwapchainKHR;
     end;
     P_VkSwapchainCreateInfoKHR = ^T_VkSwapchainCreateInfoKHR;

type T_VkPresentInfoKHR = record
       sType               :T_VkStructureType;
       pNext               :P_void;
       waitSemaphoreCount  :T_uint32_t;
       pWaitSemaphores     :P_VkSemaphore;
       swapchainCount      :T_uint32_t;
       pSwapchains         :P_VkSwapchainKHR;
       pImageIndices       :P_uint32_t;
       pResults            :P_VkResult;
     end;
     P_VkPresentInfoKHR = ^T_VkPresentInfoKHR;

type T_VkImageSwapchainCreateInfoKHR = record
       sType     :T_VkStructureType;
       pNext     :P_void;
       swapchain :T_VkSwapchainKHR;
     end;
     P_VkImageSwapchainCreateInfoKHR = ^T_VkImageSwapchainCreateInfoKHR;

type T_VkBindImageMemorySwapchainInfoKHR = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       swapchain  :T_VkSwapchainKHR;
       imageIndex :T_uint32_t;
     end;
     P_VkBindImageMemorySwapchainInfoKHR = ^T_VkBindImageMemorySwapchainInfoKHR;

type T_VkAcquireNextImageInfoKHR = record
       sType      :T_VkStructureType;
       pNext      :P_void;
       swapchain  :T_VkSwapchainKHR;
       timeout    :T_uint64_t;
       semaphore  :T_VkSemaphore;
       fence      :T_VkFence;
       deviceMask :T_uint32_t;
     end;
     P_VkAcquireNextImageInfoKHR = ^T_VkAcquireNextImageInfoKHR;

type T_VkDeviceGroupPresentCapabilitiesKHR = record
       sType       :T_VkStructureType;
       pNext       :P_void;
       presentMask :array [ 0..VK_MAX_DEVICE_GROUP_SIZE-1 ] of T_uint32_t;
       modes       :T_VkDeviceGroupPresentModeFlagsKHR;
     end;
     P_VkDeviceGroupPresentCapabilitiesKHR = ^T_VkDeviceGroupPresentCapabilitiesKHR;

type T_VkDeviceGroupPresentInfoKHR = record
       sType          :T_VkStructureType;
       pNext          :P_void;
       swapchainCount :T_uint32_t;
       pDeviceMasks   :P_uint32_t;
       mode           :T_VkDeviceGroupPresentModeFlagBitsKHR;
     end;
     P_VkDeviceGroupPresentInfoKHR = ^T_VkDeviceGroupPresentInfoKHR;

type T_VkDeviceGroupSwapchainCreateInfoKHR = record
       sType :T_VkStructureType;
       pNext :P_void;
       modes :T_VkDeviceGroupPresentModeFlagsKHR;
     end;
     P_VkDeviceGroupSwapchainCreateInfoKHR = ^T_VkDeviceGroupSwapchainCreateInfoKHR;

type
T_PFN_vkCreateSwapchainKHR = function(       device_      :T_VkDevice;
                                       const pCreateInfo_ :P_VkSwapchainCreateInfoKHR;
                                       const pAllocator_  :P_VkAllocationCallbacks;
                                             pSwapchain_  :P_VkSwapchainKHR ) :T_VkResult;
                             {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkDestroySwapchainKHR = procedure(       device_     :T_VkDevice;
                                               swapchain_  :T_VkSwapchainKHR;
                                         const pAllocator_ :P_VkAllocationCallbacks );
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetSwapchainImagesKHR = function( device_               :T_VkDevice;
                                          swapchain_            :T_VkSwapchainKHR;
                                          pSwapchainImageCount_ :P_uint32_t;
                                          pSwapchainImages_     :P_VkImage ) :T_VkResult;
                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkAcquireNextImageKHR = function( device_      :T_VkDevice;
                                        swapchain_   :T_VkSwapchainKHR;
                                        timeout_     :T_uint64_t;
                                        semaphore_   :T_VkSemaphore;
                                        fence_       :T_VkFence;
                                        pImageIndex_ :P_uint32_t ) :T_VkResult;
                              {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkQueuePresentKHR = function(       queue_        :T_VkQueue;
                                    const pPresentInfo_ :P_VkPresentInfoKHR ) :T_VkResult;
                          {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceGroupPresentCapabilitiesKHR = function( device_                          :T_VkDevice;
                                                         pDeviceGroupPresentCapabilities_ :P_VkDeviceGroupPresentCapabilitiesKHR ) :T_VkResult;
                                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetDeviceGroupSurfacePresentModesKHR = function( device_  :T_VkDevice;
                                                         surface_ :T_VkSurfaceKHR;
                                                         pModes_  :P_VkDeviceGroupPresentModeFlagsKHR ) :T_VkResult;
                                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkGetPhysicalDevicePresentRectanglesKHR = function( physicalDevice_ :T_VkPhysicalDevice;
                                                          surface_        :T_VkSurfaceKHR;
                                                          pRectCount_     :P_uint32_t;
                                                          pRects_         :P_VkRect2D ) :T_VkResult;
                                                {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

type
T_PFN_vkAcquireNextImage2KHR = function(       device_       :T_VkDevice;
                                         const pAcquireInfo_ :P_VkAcquireNextImageInfoKHR;
                                               pImageIndex_  :P_uint32_t ) :T_VkResult;
                               {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}


implementation //############################################################### ■

function VK_MAKE_API_VERSION( const variant_,major_,minor_,patch_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( variant_ shl 29 ) or ( major_ shl 22 ) or ( minor_ shl 12 ) or patch_;
end;

function VK_MAKE_VERSION( const major_,minor_,patch_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( major_ shl 22 ) or ( minor_ shl 12 ) or patch_;
end;

function VK_VERSION_MAJOR( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := version_ shr 22;
end;

function VK_VERSION_MINOR( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( version_ shr 12 ) and $3FF;
end;

function VK_VERSION_PATCH( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := version_ and $FFF;
end;

function VK_API_VERSION_VARIANT( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := version_ shr 29;
end;

function VK_API_VERSION_MAJOR( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( version_ shr 22 ) and $7F;
end;

function VK_API_VERSION_MINOR( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( version_ shr 12 ) and $3FF;
end;

function VK_API_VERSION_PATCH( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := version_ and $FFF;
end;

end. //######################################################################### ■
