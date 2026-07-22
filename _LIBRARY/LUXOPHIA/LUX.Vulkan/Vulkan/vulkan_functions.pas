unit vulkan_functions;

interface //#################################################################### ■

uses vk_platform,
     vulkan_core
     {$IFDEF MSWINDOWS}, vulkan_win32 {$ENDIF};

const
     {$IF Defined(MSWINDOWS)} DLLNAME = 'vulkan-1.dll';
     {$ELSEIF Defined(MACOS)} DLLNAME = 'libvulkan.1.dylib';
     {$ELSEIF Defined(ANDROID)} DLLNAME = 'libvulkan.so';
     {$ELSE} DLLNAME = 'libvulkan.so.1';
     {$ENDIF}

var vkCreateInstance                                :T_PFN_vkCreateInstance                               ;

var vkDestroyInstance                               :T_PFN_vkDestroyInstance                              ;

var vkEnumeratePhysicalDevices                      :T_PFN_vkEnumeratePhysicalDevices                     ;

var vkGetPhysicalDeviceFeatures                     :T_PFN_vkGetPhysicalDeviceFeatures                    ;

var vkGetPhysicalDeviceFormatProperties             :T_PFN_vkGetPhysicalDeviceFormatProperties            ;

var vkGetPhysicalDeviceImageFormatProperties        :T_PFN_vkGetPhysicalDeviceImageFormatProperties       ;

var vkGetPhysicalDeviceProperties                   :T_PFN_vkGetPhysicalDeviceProperties                  ;

var vkGetPhysicalDeviceQueueFamilyProperties        :T_PFN_vkGetPhysicalDeviceQueueFamilyProperties       ;

var vkGetPhysicalDeviceMemoryProperties             :T_PFN_vkGetPhysicalDeviceMemoryProperties            ;

var vkGetInstanceProcAddr                           :T_PFN_vkGetInstanceProcAddr                          ;

var vkGetDeviceProcAddr                             :T_PFN_vkGetDeviceProcAddr                            ;

var vkCreateDevice                                  :T_PFN_vkCreateDevice                                 ;

var vkDestroyDevice                                 :T_PFN_vkDestroyDevice                                ;

var vkEnumerateInstanceExtensionProperties          :T_PFN_vkEnumerateInstanceExtensionProperties         ;

var vkEnumerateDeviceExtensionProperties            :T_PFN_vkEnumerateDeviceExtensionProperties           ;

var vkEnumerateInstanceLayerProperties              :T_PFN_vkEnumerateInstanceLayerProperties             ;

var vkEnumerateDeviceLayerProperties                :T_PFN_vkEnumerateDeviceLayerProperties               ;

var vkGetDeviceQueue                                :T_PFN_vkGetDeviceQueue                               ;

var vkQueueSubmit                                   :T_PFN_vkQueueSubmit                                  ;

var vkQueueWaitIdle                                 :T_PFN_vkQueueWaitIdle                                ;

var vkDeviceWaitIdle                                :T_PFN_vkDeviceWaitIdle                               ;

var vkAllocateMemory                                :T_PFN_vkAllocateMemory                               ;

var vkFreeMemory                                    :T_PFN_vkFreeMemory                                   ;

var vkMapMemory                                     :T_PFN_vkMapMemory                                    ;

var vkUnmapMemory                                   :T_PFN_vkUnmapMemory                                  ;

var vkFlushMappedMemoryRanges                       :T_PFN_vkFlushMappedMemoryRanges                      ;

var vkInvalidateMappedMemoryRanges                  :T_PFN_vkInvalidateMappedMemoryRanges                 ;

var vkGetDeviceMemoryCommitment                     :T_PFN_vkGetDeviceMemoryCommitment                    ;

var vkBindBufferMemory                              :T_PFN_vkBindBufferMemory                             ;

var vkBindImageMemory                               :T_PFN_vkBindImageMemory                              ;

var vkGetBufferMemoryRequirements                   :T_PFN_vkGetBufferMemoryRequirements                  ;

var vkGetImageMemoryRequirements                    :T_PFN_vkGetImageMemoryRequirements                   ;

var vkGetImageSparseMemoryRequirements              :T_PFN_vkGetImageSparseMemoryRequirements             ;

var vkGetPhysicalDeviceSparseImageFormatProperties  :T_PFN_vkGetPhysicalDeviceSparseImageFormatProperties ;

var vkQueueBindSparse                               :T_PFN_vkQueueBindSparse                              ;

var vkCreateFence                                   :T_PFN_vkCreateFence                                  ;

var vkDestroyFence                                  :T_PFN_vkDestroyFence                                 ;

var vkResetFences                                   :T_PFN_vkResetFences                                  ;

var vkGetFenceStatus                                :T_PFN_vkGetFenceStatus                               ;

var vkWaitForFences                                 :T_PFN_vkWaitForFences                                ;

var vkCreateSemaphore                               :T_PFN_vkCreateSemaphore                              ;

var vkDestroySemaphore                              :T_PFN_vkDestroySemaphore                             ;

var vkCreateEvent                                   :T_PFN_vkCreateEvent                                  ;

var vkDestroyEvent                                  :T_PFN_vkDestroyEvent                                 ;

var vkGetEventStatus                                :T_PFN_vkGetEventStatus                               ;

var vkSetEvent                                      :T_PFN_vkSetEvent                                     ;

var vkResetEvent                                    :T_PFN_vkResetEvent                                   ;

var vkCreateQueryPool                               :T_PFN_vkCreateQueryPool                              ;

var vkDestroyQueryPool                              :T_PFN_vkDestroyQueryPool                             ;

var vkGetQueryPoolResults                           :T_PFN_vkGetQueryPoolResults                          ;

var vkCreateBuffer                                  :T_PFN_vkCreateBuffer                                 ;

var vkDestroyBuffer                                 :T_PFN_vkDestroyBuffer                                ;

var vkCreateBufferView                              :T_PFN_vkCreateBufferView                             ;

var vkDestroyBufferView                             :T_PFN_vkDestroyBufferView                            ;

var vkCreateImage                                   :T_PFN_vkCreateImage                                  ;

var vkDestroyImage                                  :T_PFN_vkDestroyImage                                 ;

var vkGetImageSubresourceLayout                     :T_PFN_vkGetImageSubresourceLayout                    ;

var vkCreateImageView                               :T_PFN_vkCreateImageView                              ;

var vkDestroyImageView                              :T_PFN_vkDestroyImageView                             ;

var vkCreateShaderModule                            :T_PFN_vkCreateShaderModule                           ;

var vkDestroyShaderModule                           :T_PFN_vkDestroyShaderModule                          ;

var vkCreatePipelineCache                           :T_PFN_vkCreatePipelineCache                          ;

var vkDestroyPipelineCache                          :T_PFN_vkDestroyPipelineCache                         ;

var vkGetPipelineCacheData                          :T_PFN_vkGetPipelineCacheData                         ;

var vkMergePipelineCaches                           :T_PFN_vkMergePipelineCaches                          ;

var vkCreateGraphicsPipelines                       :T_PFN_vkCreateGraphicsPipelines                      ;

var vkCreateComputePipelines                        :T_PFN_vkCreateComputePipelines                       ;

var vkDestroyPipeline                               :T_PFN_vkDestroyPipeline                              ;

var vkCreatePipelineLayout                          :T_PFN_vkCreatePipelineLayout                         ;

var vkDestroyPipelineLayout                         :T_PFN_vkDestroyPipelineLayout                        ;

var vkCreateSampler                                 :T_PFN_vkCreateSampler                                ;

var vkDestroySampler                                :T_PFN_vkDestroySampler                               ;

var vkCreateDescriptorSetLayout                     :T_PFN_vkCreateDescriptorSetLayout                    ;

var vkDestroyDescriptorSetLayout                    :T_PFN_vkDestroyDescriptorSetLayout                   ;

var vkCreateDescriptorPool                          :T_PFN_vkCreateDescriptorPool                         ;

var vkDestroyDescriptorPool                         :T_PFN_vkDestroyDescriptorPool                        ;

var vkResetDescriptorPool                           :T_PFN_vkResetDescriptorPool                          ;

var vkAllocateDescriptorSets                        :T_PFN_vkAllocateDescriptorSets                       ;

var vkFreeDescriptorSets                            :T_PFN_vkFreeDescriptorSets                           ;

var vkUpdateDescriptorSets                          :T_PFN_vkUpdateDescriptorSets                         ;

var vkCreateFramebuffer                             :T_PFN_vkCreateFramebuffer                            ;

var vkDestroyFramebuffer                            :T_PFN_vkDestroyFramebuffer                           ;

var vkCreateRenderPass                              :T_PFN_vkCreateRenderPass                             ;

var vkDestroyRenderPass                             :T_PFN_vkDestroyRenderPass                            ;

var vkGetRenderAreaGranularity                      :T_PFN_vkGetRenderAreaGranularity                     ;

var vkCreateCommandPool                             :T_PFN_vkCreateCommandPool                            ;

var vkDestroyCommandPool                            :T_PFN_vkDestroyCommandPool                           ;

var vkResetCommandPool                              :T_PFN_vkResetCommandPool                             ;

var vkAllocateCommandBuffers                        :T_PFN_vkAllocateCommandBuffers                       ;

var vkFreeCommandBuffers                            :T_PFN_vkFreeCommandBuffers                           ;

var vkBeginCommandBuffer                            :T_PFN_vkBeginCommandBuffer                           ;

var vkEndCommandBuffer                              :T_PFN_vkEndCommandBuffer                             ;

var vkResetCommandBuffer                            :T_PFN_vkResetCommandBuffer                           ;

var vkCmdBindPipeline                               :T_PFN_vkCmdBindPipeline                              ;

var vkCmdSetViewport                                :T_PFN_vkCmdSetViewport                               ;

var vkCmdSetScissor                                 :T_PFN_vkCmdSetScissor                                ;

var vkCmdSetLineWidth                               :T_PFN_vkCmdSetLineWidth                              ;

var vkCmdSetDepthBias                               :T_PFN_vkCmdSetDepthBias                              ;

var vkCmdSetBlendConstants                          :T_PFN_vkCmdSetBlendConstants                         ;

var vkCmdSetDepthBounds                             :T_PFN_vkCmdSetDepthBounds                            ;

var vkCmdSetStencilCompareMask                      :T_PFN_vkCmdSetStencilCompareMask                     ;

var vkCmdSetStencilWriteMask                        :T_PFN_vkCmdSetStencilWriteMask                       ;

var vkCmdSetStencilReference                        :T_PFN_vkCmdSetStencilReference                       ;

var vkCmdBindDescriptorSets                         :T_PFN_vkCmdBindDescriptorSets                        ;

var vkCmdBindIndexBuffer                            :T_PFN_vkCmdBindIndexBuffer                           ;

var vkCmdBindVertexBuffers                          :T_PFN_vkCmdBindVertexBuffers                         ;

var vkCmdDraw                                       :T_PFN_vkCmdDraw                                      ;

var vkCmdDrawIndexed                                :T_PFN_vkCmdDrawIndexed                               ;

var vkCmdDrawIndirect                               :T_PFN_vkCmdDrawIndirect                              ;

var vkCmdDrawIndexedIndirect                        :T_PFN_vkCmdDrawIndexedIndirect                       ;

var vkCmdDispatch                                   :T_PFN_vkCmdDispatch                                  ;

var vkCmdDispatchIndirect                           :T_PFN_vkCmdDispatchIndirect                          ;

var vkCmdCopyBuffer                                 :T_PFN_vkCmdCopyBuffer                                ;

var vkCmdCopyImage                                  :T_PFN_vkCmdCopyImage                                 ;

var vkCmdBlitImage                                  :T_PFN_vkCmdBlitImage                                 ;

var vkCmdCopyBufferToImage                          :T_PFN_vkCmdCopyBufferToImage                         ;

var vkCmdCopyImageToBuffer                          :T_PFN_vkCmdCopyImageToBuffer                         ;

var vkCmdUpdateBuffer                               :T_PFN_vkCmdUpdateBuffer                              ;

var vkCmdFillBuffer                                 :T_PFN_vkCmdFillBuffer                                ;

var vkCmdClearColorImage                            :T_PFN_vkCmdClearColorImage                           ;

var vkCmdClearDepthStencilImage                     :T_PFN_vkCmdClearDepthStencilImage                    ;

var vkCmdClearAttachments                           :T_PFN_vkCmdClearAttachments                          ;

var vkCmdResolveImage                               :T_PFN_vkCmdResolveImage                              ;

var vkCmdSetEvent                                   :T_PFN_vkCmdSetEvent                                  ;

var vkCmdResetEvent                                 :T_PFN_vkCmdResetEvent                                ;

var vkCmdWaitEvents                                 :T_PFN_vkCmdWaitEvents                                ;

var vkCmdPipelineBarrier                            :T_PFN_vkCmdPipelineBarrier                           ;

var vkCmdBeginQuery                                 :T_PFN_vkCmdBeginQuery                                ;

var vkCmdEndQuery                                   :T_PFN_vkCmdEndQuery                                  ;

var vkCmdResetQueryPool                             :T_PFN_vkCmdResetQueryPool                            ;

var vkCmdWriteTimestamp                             :T_PFN_vkCmdWriteTimestamp                            ;

var vkCmdCopyQueryPoolResults                       :T_PFN_vkCmdCopyQueryPoolResults                      ;

var vkCmdPushConstants                              :T_PFN_vkCmdPushConstants                             ;

var vkCmdBeginRenderPass                            :T_PFN_vkCmdBeginRenderPass                           ;

var vkCmdNextSubpass                                :T_PFN_vkCmdNextSubpass                               ;

var vkCmdEndRenderPass                              :T_PFN_vkCmdEndRenderPass                             ;

var vkCmdExecuteCommands                            :T_PFN_vkCmdExecuteCommands                           ;

var vkEnumerateInstanceVersion                      :T_PFN_vkEnumerateInstanceVersion                     ;

var vkBindBufferMemory2                             :T_PFN_vkBindBufferMemory2                            ;

var vkBindImageMemory2                              :T_PFN_vkBindImageMemory2                             ;

var vkGetDeviceGroupPeerMemoryFeatures              :T_PFN_vkGetDeviceGroupPeerMemoryFeatures             ;

var vkCmdSetDeviceMask                              :T_PFN_vkCmdSetDeviceMask                             ;

var vkCmdDispatchBase                               :T_PFN_vkCmdDispatchBase                              ;

var vkEnumeratePhysicalDeviceGroups                 :T_PFN_vkEnumeratePhysicalDeviceGroups                ;

var vkGetImageMemoryRequirements2                   :T_PFN_vkGetImageMemoryRequirements2                  ;

var vkGetBufferMemoryRequirements2                  :T_PFN_vkGetBufferMemoryRequirements2                 ;

var vkGetImageSparseMemoryRequirements2             :T_PFN_vkGetImageSparseMemoryRequirements2            ;

var vkGetPhysicalDeviceFeatures2                    :T_PFN_vkGetPhysicalDeviceFeatures2                   ;

var vkGetPhysicalDeviceProperties2                  :T_PFN_vkGetPhysicalDeviceProperties2                 ;

var vkGetPhysicalDeviceFormatProperties2            :T_PFN_vkGetPhysicalDeviceFormatProperties2           ;

var vkGetPhysicalDeviceImageFormatProperties2       :T_PFN_vkGetPhysicalDeviceImageFormatProperties2      ;

var vkGetPhysicalDeviceQueueFamilyProperties2       :T_PFN_vkGetPhysicalDeviceQueueFamilyProperties2      ;

var vkGetPhysicalDeviceMemoryProperties2            :T_PFN_vkGetPhysicalDeviceMemoryProperties2           ;

var vkGetPhysicalDeviceSparseImageFormatProperties2 :T_PFN_vkGetPhysicalDeviceSparseImageFormatProperties2;

var vkTrimCommandPool                               :T_PFN_vkTrimCommandPool                              ;

var vkGetDeviceQueue2                               :T_PFN_vkGetDeviceQueue2                              ;

var vkCreateSamplerYcbcrConversion                  :T_PFN_vkCreateSamplerYcbcrConversion                 ;

var vkDestroySamplerYcbcrConversion                 :T_PFN_vkDestroySamplerYcbcrConversion                ;

var vkCreateDescriptorUpdateTemplate                :T_PFN_vkCreateDescriptorUpdateTemplate               ;

var vkDestroyDescriptorUpdateTemplate               :T_PFN_vkDestroyDescriptorUpdateTemplate              ;

var vkUpdateDescriptorSetWithTemplate               :T_PFN_vkUpdateDescriptorSetWithTemplate              ;

var vkGetPhysicalDeviceExternalBufferProperties     :T_PFN_vkGetPhysicalDeviceExternalBufferProperties    ;

var vkGetPhysicalDeviceExternalFenceProperties      :T_PFN_vkGetPhysicalDeviceExternalFenceProperties     ;

var vkGetPhysicalDeviceExternalSemaphoreProperties  :T_PFN_vkGetPhysicalDeviceExternalSemaphoreProperties ;

var vkGetDescriptorSetLayoutSupport                 :T_PFN_vkGetDescriptorSetLayoutSupport                ;

var vkCmdDrawIndirectCount                          :T_PFN_vkCmdDrawIndirectCount                         ;

var vkCmdDrawIndexedIndirectCount                   :T_PFN_vkCmdDrawIndexedIndirectCount                  ;

var vkCreateRenderPass2                             :T_PFN_vkCreateRenderPass2                            ;

var vkCmdBeginRenderPass2                           :T_PFN_vkCmdBeginRenderPass2                          ;

var vkCmdNextSubpass2                               :T_PFN_vkCmdNextSubpass2                              ;

var vkCmdEndRenderPass2                             :T_PFN_vkCmdEndRenderPass2                            ;

var vkResetQueryPool                                :T_PFN_vkResetQueryPool                               ;

var vkGetSemaphoreCounterValue                      :T_PFN_vkGetSemaphoreCounterValue                     ;

var vkWaitSemaphores                                :T_PFN_vkWaitSemaphores                               ;

var vkSignalSemaphore                               :T_PFN_vkSignalSemaphore                              ;

var vkGetBufferDeviceAddress                        :T_PFN_vkGetBufferDeviceAddress                       ;

var vkGetBufferOpaqueCaptureAddress                 :T_PFN_vkGetBufferOpaqueCaptureAddress                ;

var vkGetDeviceMemoryOpaqueCaptureAddress           :T_PFN_vkGetDeviceMemoryOpaqueCaptureAddress          ;

var vkGetPhysicalDeviceToolProperties               :T_PFN_vkGetPhysicalDeviceToolProperties              ;

var vkCreatePrivateDataSlot                         :T_PFN_vkCreatePrivateDataSlot                        ;

var vkDestroyPrivateDataSlot                        :T_PFN_vkDestroyPrivateDataSlot                       ;

var vkSetPrivateData                                :T_PFN_vkSetPrivateData                               ;

var vkGetPrivateData                                :T_PFN_vkGetPrivateData                               ;

var vkCmdSetEvent2                                  :T_PFN_vkCmdSetEvent2                                 ;

var vkCmdResetEvent2                                :T_PFN_vkCmdResetEvent2                               ;

var vkCmdWaitEvents2                                :T_PFN_vkCmdWaitEvents2                               ;

var vkCmdPipelineBarrier2                           :T_PFN_vkCmdPipelineBarrier2                          ;

var vkCmdWriteTimestamp2                            :T_PFN_vkCmdWriteTimestamp2                           ;

var vkQueueSubmit2                                  :T_PFN_vkQueueSubmit2                                 ;

var vkCmdCopyBuffer2                                :T_PFN_vkCmdCopyBuffer2                               ;

var vkCmdCopyImage2                                 :T_PFN_vkCmdCopyImage2                                ;

var vkCmdCopyBufferToImage2                         :T_PFN_vkCmdCopyBufferToImage2                        ;

var vkCmdCopyImageToBuffer2                         :T_PFN_vkCmdCopyImageToBuffer2                        ;

var vkCmdBlitImage2                                 :T_PFN_vkCmdBlitImage2                                ;

var vkCmdResolveImage2                              :T_PFN_vkCmdResolveImage2                             ;

var vkCmdBeginRendering                             :T_PFN_vkCmdBeginRendering                            ;

var vkCmdEndRendering                               :T_PFN_vkCmdEndRendering                              ;

var vkCmdSetCullMode                                :T_PFN_vkCmdSetCullMode                               ;

var vkCmdSetFrontFace                               :T_PFN_vkCmdSetFrontFace                              ;

var vkCmdSetPrimitiveTopology                       :T_PFN_vkCmdSetPrimitiveTopology                      ;

var vkCmdSetViewportWithCount                       :T_PFN_vkCmdSetViewportWithCount                      ;

var vkCmdSetScissorWithCount                        :T_PFN_vkCmdSetScissorWithCount                       ;

var vkCmdBindVertexBuffers2                         :T_PFN_vkCmdBindVertexBuffers2                        ;

var vkCmdSetDepthTestEnable                         :T_PFN_vkCmdSetDepthTestEnable                        ;

var vkCmdSetDepthWriteEnable                        :T_PFN_vkCmdSetDepthWriteEnable                       ;

var vkCmdSetDepthCompareOp                          :T_PFN_vkCmdSetDepthCompareOp                         ;

var vkCmdSetDepthBoundsTestEnable                   :T_PFN_vkCmdSetDepthBoundsTestEnable                  ;

var vkCmdSetStencilTestEnable                       :T_PFN_vkCmdSetStencilTestEnable                      ;

var vkCmdSetStencilOp                               :T_PFN_vkCmdSetStencilOp                              ;

var vkCmdSetRasterizerDiscardEnable                 :T_PFN_vkCmdSetRasterizerDiscardEnable                ;

var vkCmdSetDepthBiasEnable                         :T_PFN_vkCmdSetDepthBiasEnable                        ;

var vkCmdSetPrimitiveRestartEnable                  :T_PFN_vkCmdSetPrimitiveRestartEnable                 ;

var vkGetDeviceBufferMemoryRequirements             :T_PFN_vkGetDeviceBufferMemoryRequirements            ;

var vkGetDeviceImageMemoryRequirements              :T_PFN_vkGetDeviceImageMemoryRequirements             ;

var vkGetDeviceImageSparseMemoryRequirements        :T_PFN_vkGetDeviceImageSparseMemoryRequirements       ;

var vkDestroySurfaceKHR                             :T_PFN_vkDestroySurfaceKHR                            ;

var vkGetPhysicalDeviceSurfaceSupportKHR            :T_PFN_vkGetPhysicalDeviceSurfaceSupportKHR           ;

var vkGetPhysicalDeviceSurfaceCapabilitiesKHR       :T_PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR      ;

var vkGetPhysicalDeviceSurfaceFormatsKHR            :T_PFN_vkGetPhysicalDeviceSurfaceFormatsKHR           ;

var vkGetPhysicalDeviceSurfacePresentModesKHR       :T_PFN_vkGetPhysicalDeviceSurfacePresentModesKHR      ;

var vkCreateSwapchainKHR                            :T_PFN_vkCreateSwapchainKHR                           ;

var vkDestroySwapchainKHR                           :T_PFN_vkDestroySwapchainKHR                          ;

var vkGetSwapchainImagesKHR                         :T_PFN_vkGetSwapchainImagesKHR                        ;

var vkAcquireNextImageKHR                           :T_PFN_vkAcquireNextImageKHR                          ;

var vkQueuePresentKHR                               :T_PFN_vkQueuePresentKHR                              ;

var vkGetDeviceGroupPresentCapabilitiesKHR          :T_PFN_vkGetDeviceGroupPresentCapabilitiesKHR         ;

var vkGetDeviceGroupSurfacePresentModesKHR          :T_PFN_vkGetDeviceGroupSurfacePresentModesKHR         ;

var vkGetPhysicalDevicePresentRectanglesKHR         :T_PFN_vkGetPhysicalDevicePresentRectanglesKHR        ;

var vkAcquireNextImage2KHR                          :T_PFN_vkAcquireNextImage2KHR                         ;

{$IFDEF MSWINDOWS}

var vkCreateWin32SurfaceKHR                         :T_PFN_vkCreateWin32SurfaceKHR                        ;

var vkGetPhysicalDeviceWin32PresentationSupportKHR  :T_PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR ;

{$ENDIF}

function LoadFunctions( const LibName_:String = DLLNAME ) :Boolean;

implementation //############################################################### ■

uses {$IFDEF MSWINDOWS} Winapi.Windows, {$ENDIF} System.SysUtils;

var
   _VulkanLib :HMODULE = 0;

function LoadFunctions( const LibName_:String ) :Boolean;
begin
     if _VulkanLib <> 0 then Exit( True );

     _VulkanLib := SafeLoadLibrary( LibName_ );

     Result := _VulkanLib <> 0;

     if not Result then Exit;

     vkCreateInstance                                := GetProcAddress( _VulkanLib, 'vkCreateInstance' );
     vkDestroyInstance                               := GetProcAddress( _VulkanLib, 'vkDestroyInstance' );
     vkEnumeratePhysicalDevices                      := GetProcAddress( _VulkanLib, 'vkEnumeratePhysicalDevices' );
     vkGetPhysicalDeviceFeatures                     := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFeatures' );
     vkGetPhysicalDeviceFormatProperties             := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFormatProperties' );
     vkGetPhysicalDeviceImageFormatProperties        := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceImageFormatProperties' );
     vkGetPhysicalDeviceProperties                   := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceProperties' );
     vkGetPhysicalDeviceQueueFamilyProperties        := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceQueueFamilyProperties' );
     vkGetPhysicalDeviceMemoryProperties             := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceMemoryProperties' );
     vkGetInstanceProcAddr                           := GetProcAddress( _VulkanLib, 'vkGetInstanceProcAddr' );
     vkGetDeviceProcAddr                             := GetProcAddress( _VulkanLib, 'vkGetDeviceProcAddr' );
     vkCreateDevice                                  := GetProcAddress( _VulkanLib, 'vkCreateDevice' );
     vkDestroyDevice                                 := GetProcAddress( _VulkanLib, 'vkDestroyDevice' );
     vkEnumerateInstanceExtensionProperties          := GetProcAddress( _VulkanLib, 'vkEnumerateInstanceExtensionProperties' );
     vkEnumerateDeviceExtensionProperties            := GetProcAddress( _VulkanLib, 'vkEnumerateDeviceExtensionProperties' );
     vkEnumerateInstanceLayerProperties              := GetProcAddress( _VulkanLib, 'vkEnumerateInstanceLayerProperties' );
     vkEnumerateDeviceLayerProperties                := GetProcAddress( _VulkanLib, 'vkEnumerateDeviceLayerProperties' );
     vkGetDeviceQueue                                := GetProcAddress( _VulkanLib, 'vkGetDeviceQueue' );
     vkQueueSubmit                                   := GetProcAddress( _VulkanLib, 'vkQueueSubmit' );
     vkQueueWaitIdle                                 := GetProcAddress( _VulkanLib, 'vkQueueWaitIdle' );
     vkDeviceWaitIdle                                := GetProcAddress( _VulkanLib, 'vkDeviceWaitIdle' );
     vkAllocateMemory                                := GetProcAddress( _VulkanLib, 'vkAllocateMemory' );
     vkFreeMemory                                    := GetProcAddress( _VulkanLib, 'vkFreeMemory' );
     vkMapMemory                                     := GetProcAddress( _VulkanLib, 'vkMapMemory' );
     vkUnmapMemory                                   := GetProcAddress( _VulkanLib, 'vkUnmapMemory' );
     vkFlushMappedMemoryRanges                       := GetProcAddress( _VulkanLib, 'vkFlushMappedMemoryRanges' );
     vkInvalidateMappedMemoryRanges                  := GetProcAddress( _VulkanLib, 'vkInvalidateMappedMemoryRanges' );
     vkGetDeviceMemoryCommitment                     := GetProcAddress( _VulkanLib, 'vkGetDeviceMemoryCommitment' );
     vkBindBufferMemory                              := GetProcAddress( _VulkanLib, 'vkBindBufferMemory' );
     vkBindImageMemory                               := GetProcAddress( _VulkanLib, 'vkBindImageMemory' );
     vkGetBufferMemoryRequirements                   := GetProcAddress( _VulkanLib, 'vkGetBufferMemoryRequirements' );
     vkGetImageMemoryRequirements                    := GetProcAddress( _VulkanLib, 'vkGetImageMemoryRequirements' );
     vkGetImageSparseMemoryRequirements              := GetProcAddress( _VulkanLib, 'vkGetImageSparseMemoryRequirements' );
     vkGetPhysicalDeviceSparseImageFormatProperties  := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSparseImageFormatProperties' );
     vkQueueBindSparse                               := GetProcAddress( _VulkanLib, 'vkQueueBindSparse' );
     vkCreateFence                                   := GetProcAddress( _VulkanLib, 'vkCreateFence' );
     vkDestroyFence                                  := GetProcAddress( _VulkanLib, 'vkDestroyFence' );
     vkResetFences                                   := GetProcAddress( _VulkanLib, 'vkResetFences' );
     vkGetFenceStatus                                := GetProcAddress( _VulkanLib, 'vkGetFenceStatus' );
     vkWaitForFences                                 := GetProcAddress( _VulkanLib, 'vkWaitForFences' );
     vkCreateSemaphore                               := GetProcAddress( _VulkanLib, 'vkCreateSemaphore' );
     vkDestroySemaphore                              := GetProcAddress( _VulkanLib, 'vkDestroySemaphore' );
     vkCreateEvent                                   := GetProcAddress( _VulkanLib, 'vkCreateEvent' );
     vkDestroyEvent                                  := GetProcAddress( _VulkanLib, 'vkDestroyEvent' );
     vkGetEventStatus                                := GetProcAddress( _VulkanLib, 'vkGetEventStatus' );
     vkSetEvent                                      := GetProcAddress( _VulkanLib, 'vkSetEvent' );
     vkResetEvent                                    := GetProcAddress( _VulkanLib, 'vkResetEvent' );
     vkCreateQueryPool                               := GetProcAddress( _VulkanLib, 'vkCreateQueryPool' );
     vkDestroyQueryPool                              := GetProcAddress( _VulkanLib, 'vkDestroyQueryPool' );
     vkGetQueryPoolResults                           := GetProcAddress( _VulkanLib, 'vkGetQueryPoolResults' );
     vkCreateBuffer                                  := GetProcAddress( _VulkanLib, 'vkCreateBuffer' );
     vkDestroyBuffer                                 := GetProcAddress( _VulkanLib, 'vkDestroyBuffer' );
     vkCreateBufferView                              := GetProcAddress( _VulkanLib, 'vkCreateBufferView' );
     vkDestroyBufferView                             := GetProcAddress( _VulkanLib, 'vkDestroyBufferView' );
     vkCreateImage                                   := GetProcAddress( _VulkanLib, 'vkCreateImage' );
     vkDestroyImage                                  := GetProcAddress( _VulkanLib, 'vkDestroyImage' );
     vkGetImageSubresourceLayout                     := GetProcAddress( _VulkanLib, 'vkGetImageSubresourceLayout' );
     vkCreateImageView                               := GetProcAddress( _VulkanLib, 'vkCreateImageView' );
     vkDestroyImageView                              := GetProcAddress( _VulkanLib, 'vkDestroyImageView' );
     vkCreateShaderModule                            := GetProcAddress( _VulkanLib, 'vkCreateShaderModule' );
     vkDestroyShaderModule                           := GetProcAddress( _VulkanLib, 'vkDestroyShaderModule' );
     vkCreatePipelineCache                           := GetProcAddress( _VulkanLib, 'vkCreatePipelineCache' );
     vkDestroyPipelineCache                          := GetProcAddress( _VulkanLib, 'vkDestroyPipelineCache' );
     vkGetPipelineCacheData                          := GetProcAddress( _VulkanLib, 'vkGetPipelineCacheData' );
     vkMergePipelineCaches                           := GetProcAddress( _VulkanLib, 'vkMergePipelineCaches' );
     vkCreateGraphicsPipelines                       := GetProcAddress( _VulkanLib, 'vkCreateGraphicsPipelines' );
     vkCreateComputePipelines                        := GetProcAddress( _VulkanLib, 'vkCreateComputePipelines' );
     vkDestroyPipeline                               := GetProcAddress( _VulkanLib, 'vkDestroyPipeline' );
     vkCreatePipelineLayout                          := GetProcAddress( _VulkanLib, 'vkCreatePipelineLayout' );
     vkDestroyPipelineLayout                         := GetProcAddress( _VulkanLib, 'vkDestroyPipelineLayout' );
     vkCreateSampler                                 := GetProcAddress( _VulkanLib, 'vkCreateSampler' );
     vkDestroySampler                                := GetProcAddress( _VulkanLib, 'vkDestroySampler' );
     vkCreateDescriptorSetLayout                     := GetProcAddress( _VulkanLib, 'vkCreateDescriptorSetLayout' );
     vkDestroyDescriptorSetLayout                    := GetProcAddress( _VulkanLib, 'vkDestroyDescriptorSetLayout' );
     vkCreateDescriptorPool                          := GetProcAddress( _VulkanLib, 'vkCreateDescriptorPool' );
     vkDestroyDescriptorPool                         := GetProcAddress( _VulkanLib, 'vkDestroyDescriptorPool' );
     vkResetDescriptorPool                           := GetProcAddress( _VulkanLib, 'vkResetDescriptorPool' );
     vkAllocateDescriptorSets                        := GetProcAddress( _VulkanLib, 'vkAllocateDescriptorSets' );
     vkFreeDescriptorSets                            := GetProcAddress( _VulkanLib, 'vkFreeDescriptorSets' );
     vkUpdateDescriptorSets                          := GetProcAddress( _VulkanLib, 'vkUpdateDescriptorSets' );
     vkCreateFramebuffer                             := GetProcAddress( _VulkanLib, 'vkCreateFramebuffer' );
     vkDestroyFramebuffer                            := GetProcAddress( _VulkanLib, 'vkDestroyFramebuffer' );
     vkCreateRenderPass                              := GetProcAddress( _VulkanLib, 'vkCreateRenderPass' );
     vkDestroyRenderPass                             := GetProcAddress( _VulkanLib, 'vkDestroyRenderPass' );
     vkGetRenderAreaGranularity                      := GetProcAddress( _VulkanLib, 'vkGetRenderAreaGranularity' );
     vkCreateCommandPool                             := GetProcAddress( _VulkanLib, 'vkCreateCommandPool' );
     vkDestroyCommandPool                            := GetProcAddress( _VulkanLib, 'vkDestroyCommandPool' );
     vkResetCommandPool                              := GetProcAddress( _VulkanLib, 'vkResetCommandPool' );
     vkAllocateCommandBuffers                        := GetProcAddress( _VulkanLib, 'vkAllocateCommandBuffers' );
     vkFreeCommandBuffers                            := GetProcAddress( _VulkanLib, 'vkFreeCommandBuffers' );
     vkBeginCommandBuffer                            := GetProcAddress( _VulkanLib, 'vkBeginCommandBuffer' );
     vkEndCommandBuffer                              := GetProcAddress( _VulkanLib, 'vkEndCommandBuffer' );
     vkResetCommandBuffer                            := GetProcAddress( _VulkanLib, 'vkResetCommandBuffer' );
     vkCmdBindPipeline                               := GetProcAddress( _VulkanLib, 'vkCmdBindPipeline' );
     vkCmdSetViewport                                := GetProcAddress( _VulkanLib, 'vkCmdSetViewport' );
     vkCmdSetScissor                                 := GetProcAddress( _VulkanLib, 'vkCmdSetScissor' );
     vkCmdSetLineWidth                               := GetProcAddress( _VulkanLib, 'vkCmdSetLineWidth' );
     vkCmdSetDepthBias                               := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBias' );
     vkCmdSetBlendConstants                          := GetProcAddress( _VulkanLib, 'vkCmdSetBlendConstants' );
     vkCmdSetDepthBounds                             := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBounds' );
     vkCmdSetStencilCompareMask                      := GetProcAddress( _VulkanLib, 'vkCmdSetStencilCompareMask' );
     vkCmdSetStencilWriteMask                        := GetProcAddress( _VulkanLib, 'vkCmdSetStencilWriteMask' );
     vkCmdSetStencilReference                        := GetProcAddress( _VulkanLib, 'vkCmdSetStencilReference' );
     vkCmdBindDescriptorSets                         := GetProcAddress( _VulkanLib, 'vkCmdBindDescriptorSets' );
     vkCmdBindIndexBuffer                            := GetProcAddress( _VulkanLib, 'vkCmdBindIndexBuffer' );
     vkCmdBindVertexBuffers                          := GetProcAddress( _VulkanLib, 'vkCmdBindVertexBuffers' );
     vkCmdDraw                                       := GetProcAddress( _VulkanLib, 'vkCmdDraw' );
     vkCmdDrawIndexed                                := GetProcAddress( _VulkanLib, 'vkCmdDrawIndexed' );
     vkCmdDrawIndirect                               := GetProcAddress( _VulkanLib, 'vkCmdDrawIndirect' );
     vkCmdDrawIndexedIndirect                        := GetProcAddress( _VulkanLib, 'vkCmdDrawIndexedIndirect' );
     vkCmdDispatch                                   := GetProcAddress( _VulkanLib, 'vkCmdDispatch' );
     vkCmdDispatchIndirect                           := GetProcAddress( _VulkanLib, 'vkCmdDispatchIndirect' );
     vkCmdCopyBuffer                                 := GetProcAddress( _VulkanLib, 'vkCmdCopyBuffer' );
     vkCmdCopyImage                                  := GetProcAddress( _VulkanLib, 'vkCmdCopyImage' );
     vkCmdBlitImage                                  := GetProcAddress( _VulkanLib, 'vkCmdBlitImage' );
     vkCmdCopyBufferToImage                          := GetProcAddress( _VulkanLib, 'vkCmdCopyBufferToImage' );
     vkCmdCopyImageToBuffer                          := GetProcAddress( _VulkanLib, 'vkCmdCopyImageToBuffer' );
     vkCmdUpdateBuffer                               := GetProcAddress( _VulkanLib, 'vkCmdUpdateBuffer' );
     vkCmdFillBuffer                                 := GetProcAddress( _VulkanLib, 'vkCmdFillBuffer' );
     vkCmdClearColorImage                            := GetProcAddress( _VulkanLib, 'vkCmdClearColorImage' );
     vkCmdClearDepthStencilImage                     := GetProcAddress( _VulkanLib, 'vkCmdClearDepthStencilImage' );
     vkCmdClearAttachments                           := GetProcAddress( _VulkanLib, 'vkCmdClearAttachments' );
     vkCmdResolveImage                               := GetProcAddress( _VulkanLib, 'vkCmdResolveImage' );
     vkCmdSetEvent                                   := GetProcAddress( _VulkanLib, 'vkCmdSetEvent' );
     vkCmdResetEvent                                 := GetProcAddress( _VulkanLib, 'vkCmdResetEvent' );
     vkCmdWaitEvents                                 := GetProcAddress( _VulkanLib, 'vkCmdWaitEvents' );
     vkCmdPipelineBarrier                            := GetProcAddress( _VulkanLib, 'vkCmdPipelineBarrier' );
     vkCmdBeginQuery                                 := GetProcAddress( _VulkanLib, 'vkCmdBeginQuery' );
     vkCmdEndQuery                                   := GetProcAddress( _VulkanLib, 'vkCmdEndQuery' );
     vkCmdResetQueryPool                             := GetProcAddress( _VulkanLib, 'vkCmdResetQueryPool' );
     vkCmdWriteTimestamp                             := GetProcAddress( _VulkanLib, 'vkCmdWriteTimestamp' );
     vkCmdCopyQueryPoolResults                       := GetProcAddress( _VulkanLib, 'vkCmdCopyQueryPoolResults' );
     vkCmdPushConstants                              := GetProcAddress( _VulkanLib, 'vkCmdPushConstants' );
     vkCmdBeginRenderPass                            := GetProcAddress( _VulkanLib, 'vkCmdBeginRenderPass' );
     vkCmdNextSubpass                                := GetProcAddress( _VulkanLib, 'vkCmdNextSubpass' );
     vkCmdEndRenderPass                              := GetProcAddress( _VulkanLib, 'vkCmdEndRenderPass' );
     vkCmdExecuteCommands                            := GetProcAddress( _VulkanLib, 'vkCmdExecuteCommands' );
     vkEnumerateInstanceVersion                      := GetProcAddress( _VulkanLib, 'vkEnumerateInstanceVersion' );
     vkBindBufferMemory2                             := GetProcAddress( _VulkanLib, 'vkBindBufferMemory2' );
     vkBindImageMemory2                              := GetProcAddress( _VulkanLib, 'vkBindImageMemory2' );
     vkGetDeviceGroupPeerMemoryFeatures              := GetProcAddress( _VulkanLib, 'vkGetDeviceGroupPeerMemoryFeatures' );
     vkCmdSetDeviceMask                              := GetProcAddress( _VulkanLib, 'vkCmdSetDeviceMask' );
     vkCmdDispatchBase                               := GetProcAddress( _VulkanLib, 'vkCmdDispatchBase' );
     vkEnumeratePhysicalDeviceGroups                 := GetProcAddress( _VulkanLib, 'vkEnumeratePhysicalDeviceGroups' );
     vkGetImageMemoryRequirements2                   := GetProcAddress( _VulkanLib, 'vkGetImageMemoryRequirements2' );
     vkGetBufferMemoryRequirements2                  := GetProcAddress( _VulkanLib, 'vkGetBufferMemoryRequirements2' );
     vkGetImageSparseMemoryRequirements2             := GetProcAddress( _VulkanLib, 'vkGetImageSparseMemoryRequirements2' );
     vkGetPhysicalDeviceFeatures2                    := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFeatures2' );
     vkGetPhysicalDeviceProperties2                  := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceProperties2' );
     vkGetPhysicalDeviceFormatProperties2            := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFormatProperties2' );
     vkGetPhysicalDeviceImageFormatProperties2       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceImageFormatProperties2' );
     vkGetPhysicalDeviceQueueFamilyProperties2       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceQueueFamilyProperties2' );
     vkGetPhysicalDeviceMemoryProperties2            := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceMemoryProperties2' );
     vkGetPhysicalDeviceSparseImageFormatProperties2 := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSparseImageFormatProperties2' );
     vkTrimCommandPool                               := GetProcAddress( _VulkanLib, 'vkTrimCommandPool' );
     vkGetDeviceQueue2                               := GetProcAddress( _VulkanLib, 'vkGetDeviceQueue2' );
     vkCreateSamplerYcbcrConversion                  := GetProcAddress( _VulkanLib, 'vkCreateSamplerYcbcrConversion' );
     vkDestroySamplerYcbcrConversion                 := GetProcAddress( _VulkanLib, 'vkDestroySamplerYcbcrConversion' );
     vkCreateDescriptorUpdateTemplate                := GetProcAddress( _VulkanLib, 'vkCreateDescriptorUpdateTemplate' );
     vkDestroyDescriptorUpdateTemplate               := GetProcAddress( _VulkanLib, 'vkDestroyDescriptorUpdateTemplate' );
     vkUpdateDescriptorSetWithTemplate               := GetProcAddress( _VulkanLib, 'vkUpdateDescriptorSetWithTemplate' );
     vkGetPhysicalDeviceExternalBufferProperties     := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalBufferProperties' );
     vkGetPhysicalDeviceExternalFenceProperties      := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalFenceProperties' );
     vkGetPhysicalDeviceExternalSemaphoreProperties  := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalSemaphoreProperties' );
     vkGetDescriptorSetLayoutSupport                 := GetProcAddress( _VulkanLib, 'vkGetDescriptorSetLayoutSupport' );
     vkCmdDrawIndirectCount                          := GetProcAddress( _VulkanLib, 'vkCmdDrawIndirectCount' );
     vkCmdDrawIndexedIndirectCount                   := GetProcAddress( _VulkanLib, 'vkCmdDrawIndexedIndirectCount' );
     vkCreateRenderPass2                             := GetProcAddress( _VulkanLib, 'vkCreateRenderPass2' );
     vkCmdBeginRenderPass2                           := GetProcAddress( _VulkanLib, 'vkCmdBeginRenderPass2' );
     vkCmdNextSubpass2                               := GetProcAddress( _VulkanLib, 'vkCmdNextSubpass2' );
     vkCmdEndRenderPass2                             := GetProcAddress( _VulkanLib, 'vkCmdEndRenderPass2' );
     vkResetQueryPool                                := GetProcAddress( _VulkanLib, 'vkResetQueryPool' );
     vkGetSemaphoreCounterValue                      := GetProcAddress( _VulkanLib, 'vkGetSemaphoreCounterValue' );
     vkWaitSemaphores                                := GetProcAddress( _VulkanLib, 'vkWaitSemaphores' );
     vkSignalSemaphore                               := GetProcAddress( _VulkanLib, 'vkSignalSemaphore' );
     vkGetBufferDeviceAddress                        := GetProcAddress( _VulkanLib, 'vkGetBufferDeviceAddress' );
     vkGetBufferOpaqueCaptureAddress                 := GetProcAddress( _VulkanLib, 'vkGetBufferOpaqueCaptureAddress' );
     vkGetDeviceMemoryOpaqueCaptureAddress           := GetProcAddress( _VulkanLib, 'vkGetDeviceMemoryOpaqueCaptureAddress' );
     vkGetPhysicalDeviceToolProperties               := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceToolProperties' );
     vkCreatePrivateDataSlot                         := GetProcAddress( _VulkanLib, 'vkCreatePrivateDataSlot' );
     vkDestroyPrivateDataSlot                        := GetProcAddress( _VulkanLib, 'vkDestroyPrivateDataSlot' );
     vkSetPrivateData                                := GetProcAddress( _VulkanLib, 'vkSetPrivateData' );
     vkGetPrivateData                                := GetProcAddress( _VulkanLib, 'vkGetPrivateData' );
     vkCmdSetEvent2                                  := GetProcAddress( _VulkanLib, 'vkCmdSetEvent2' );
     vkCmdResetEvent2                                := GetProcAddress( _VulkanLib, 'vkCmdResetEvent2' );
     vkCmdWaitEvents2                                := GetProcAddress( _VulkanLib, 'vkCmdWaitEvents2' );
     vkCmdPipelineBarrier2                           := GetProcAddress( _VulkanLib, 'vkCmdPipelineBarrier2' );
     vkCmdWriteTimestamp2                            := GetProcAddress( _VulkanLib, 'vkCmdWriteTimestamp2' );
     vkQueueSubmit2                                  := GetProcAddress( _VulkanLib, 'vkQueueSubmit2' );
     vkCmdCopyBuffer2                                := GetProcAddress( _VulkanLib, 'vkCmdCopyBuffer2' );
     vkCmdCopyImage2                                 := GetProcAddress( _VulkanLib, 'vkCmdCopyImage2' );
     vkCmdCopyBufferToImage2                         := GetProcAddress( _VulkanLib, 'vkCmdCopyBufferToImage2' );
     vkCmdCopyImageToBuffer2                         := GetProcAddress( _VulkanLib, 'vkCmdCopyImageToBuffer2' );
     vkCmdBlitImage2                                 := GetProcAddress( _VulkanLib, 'vkCmdBlitImage2' );
     vkCmdResolveImage2                              := GetProcAddress( _VulkanLib, 'vkCmdResolveImage2' );
     vkCmdBeginRendering                             := GetProcAddress( _VulkanLib, 'vkCmdBeginRendering' );
     vkCmdEndRendering                               := GetProcAddress( _VulkanLib, 'vkCmdEndRendering' );
     vkCmdSetCullMode                                := GetProcAddress( _VulkanLib, 'vkCmdSetCullMode' );
     vkCmdSetFrontFace                               := GetProcAddress( _VulkanLib, 'vkCmdSetFrontFace' );
     vkCmdSetPrimitiveTopology                       := GetProcAddress( _VulkanLib, 'vkCmdSetPrimitiveTopology' );
     vkCmdSetViewportWithCount                       := GetProcAddress( _VulkanLib, 'vkCmdSetViewportWithCount' );
     vkCmdSetScissorWithCount                        := GetProcAddress( _VulkanLib, 'vkCmdSetScissorWithCount' );
     vkCmdBindVertexBuffers2                         := GetProcAddress( _VulkanLib, 'vkCmdBindVertexBuffers2' );
     vkCmdSetDepthTestEnable                         := GetProcAddress( _VulkanLib, 'vkCmdSetDepthTestEnable' );
     vkCmdSetDepthWriteEnable                        := GetProcAddress( _VulkanLib, 'vkCmdSetDepthWriteEnable' );
     vkCmdSetDepthCompareOp                          := GetProcAddress( _VulkanLib, 'vkCmdSetDepthCompareOp' );
     vkCmdSetDepthBoundsTestEnable                   := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBoundsTestEnable' );
     vkCmdSetStencilTestEnable                       := GetProcAddress( _VulkanLib, 'vkCmdSetStencilTestEnable' );
     vkCmdSetStencilOp                               := GetProcAddress( _VulkanLib, 'vkCmdSetStencilOp' );
     vkCmdSetRasterizerDiscardEnable                 := GetProcAddress( _VulkanLib, 'vkCmdSetRasterizerDiscardEnable' );
     vkCmdSetDepthBiasEnable                         := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBiasEnable' );
     vkCmdSetPrimitiveRestartEnable                  := GetProcAddress( _VulkanLib, 'vkCmdSetPrimitiveRestartEnable' );
     vkGetDeviceBufferMemoryRequirements             := GetProcAddress( _VulkanLib, 'vkGetDeviceBufferMemoryRequirements' );
     vkGetDeviceImageMemoryRequirements              := GetProcAddress( _VulkanLib, 'vkGetDeviceImageMemoryRequirements' );
     vkGetDeviceImageSparseMemoryRequirements        := GetProcAddress( _VulkanLib, 'vkGetDeviceImageSparseMemoryRequirements' );
     vkDestroySurfaceKHR                             := GetProcAddress( _VulkanLib, 'vkDestroySurfaceKHR' );
     vkGetPhysicalDeviceSurfaceSupportKHR            := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfaceSupportKHR' );
     vkGetPhysicalDeviceSurfaceCapabilitiesKHR       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfaceCapabilitiesKHR' );
     vkGetPhysicalDeviceSurfaceFormatsKHR            := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfaceFormatsKHR' );
     vkGetPhysicalDeviceSurfacePresentModesKHR       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfacePresentModesKHR' );
     vkCreateSwapchainKHR                            := GetProcAddress( _VulkanLib, 'vkCreateSwapchainKHR' );
     vkDestroySwapchainKHR                           := GetProcAddress( _VulkanLib, 'vkDestroySwapchainKHR' );
     vkGetSwapchainImagesKHR                         := GetProcAddress( _VulkanLib, 'vkGetSwapchainImagesKHR' );
     vkAcquireNextImageKHR                           := GetProcAddress( _VulkanLib, 'vkAcquireNextImageKHR' );
     vkQueuePresentKHR                               := GetProcAddress( _VulkanLib, 'vkQueuePresentKHR' );
     vkGetDeviceGroupPresentCapabilitiesKHR          := GetProcAddress( _VulkanLib, 'vkGetDeviceGroupPresentCapabilitiesKHR' );
     vkGetDeviceGroupSurfacePresentModesKHR          := GetProcAddress( _VulkanLib, 'vkGetDeviceGroupSurfacePresentModesKHR' );
     vkGetPhysicalDevicePresentRectanglesKHR         := GetProcAddress( _VulkanLib, 'vkGetPhysicalDevicePresentRectanglesKHR' );
     vkAcquireNextImage2KHR                          := GetProcAddress( _VulkanLib, 'vkAcquireNextImage2KHR' );

     {$IFDEF MSWINDOWS}
     vkCreateWin32SurfaceKHR                         := GetProcAddress( _VulkanLib, 'vkCreateWin32SurfaceKHR' );
     vkGetPhysicalDeviceWin32PresentationSupportKHR  := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceWin32PresentationSupportKHR' );
     {$ENDIF}
end;

end. //######################################################################### ■
