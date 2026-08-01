unit vulkan_functions;

interface //#################################################################### ■

uses LUX.Code.C,
     vk_platform,
     vulkan_core
     {$IFDEF MSWINDOWS}, vulkan_win32 {$ENDIF};

const
     {$IF Defined(MSWINDOWS)} DLLNAME = 'vulkan-1.dll';
     {$ELSEIF Defined(MACOS)} DLLNAME = 'libvulkan.1.dylib';
     {$ELSEIF Defined(ANDROID)} DLLNAME = 'libvulkan.so';
     {$ELSE} DLLNAME = 'libvulkan.so.1';
     {$ENDIF}


// VK_VERSION_1_0
var vkCreateInstance                                                     :T_PFN_vkCreateInstance                                                      ;
var vkDestroyInstance                                                    :T_PFN_vkDestroyInstance                                                     ;
var vkEnumeratePhysicalDevices                                           :T_PFN_vkEnumeratePhysicalDevices                                            ;
var vkGetPhysicalDeviceFeatures                                          :T_PFN_vkGetPhysicalDeviceFeatures                                           ;
var vkGetPhysicalDeviceFormatProperties                                  :T_PFN_vkGetPhysicalDeviceFormatProperties                                   ;
var vkGetPhysicalDeviceImageFormatProperties                             :T_PFN_vkGetPhysicalDeviceImageFormatProperties                              ;
var vkGetPhysicalDeviceProperties                                        :T_PFN_vkGetPhysicalDeviceProperties                                         ;
var vkGetPhysicalDeviceQueueFamilyProperties                             :T_PFN_vkGetPhysicalDeviceQueueFamilyProperties                              ;
var vkGetPhysicalDeviceMemoryProperties                                  :T_PFN_vkGetPhysicalDeviceMemoryProperties                                   ;
var vkGetInstanceProcAddr                                                :T_PFN_vkGetInstanceProcAddr                                                 ;
var vkGetDeviceProcAddr                                                  :T_PFN_vkGetDeviceProcAddr                                                   ;
var vkCreateDevice                                                       :T_PFN_vkCreateDevice                                                        ;
var vkDestroyDevice                                                      :T_PFN_vkDestroyDevice                                                       ;
var vkEnumerateInstanceExtensionProperties                               :T_PFN_vkEnumerateInstanceExtensionProperties                                ;
var vkEnumerateDeviceExtensionProperties                                 :T_PFN_vkEnumerateDeviceExtensionProperties                                  ;
var vkEnumerateInstanceLayerProperties                                   :T_PFN_vkEnumerateInstanceLayerProperties                                    ;
var vkEnumerateDeviceLayerProperties                                     :T_PFN_vkEnumerateDeviceLayerProperties                                      ;
var vkGetDeviceQueue                                                     :T_PFN_vkGetDeviceQueue                                                      ;
var vkQueueSubmit                                                        :T_PFN_vkQueueSubmit                                                         ;
var vkQueueWaitIdle                                                      :T_PFN_vkQueueWaitIdle                                                       ;
var vkDeviceWaitIdle                                                     :T_PFN_vkDeviceWaitIdle                                                      ;
var vkAllocateMemory                                                     :T_PFN_vkAllocateMemory                                                      ;
var vkFreeMemory                                                         :T_PFN_vkFreeMemory                                                          ;
var vkMapMemory                                                          :T_PFN_vkMapMemory                                                           ;
var vkUnmapMemory                                                        :T_PFN_vkUnmapMemory                                                         ;
var vkFlushMappedMemoryRanges                                            :T_PFN_vkFlushMappedMemoryRanges                                             ;
var vkInvalidateMappedMemoryRanges                                       :T_PFN_vkInvalidateMappedMemoryRanges                                        ;
var vkGetDeviceMemoryCommitment                                          :T_PFN_vkGetDeviceMemoryCommitment                                           ;
var vkBindBufferMemory                                                   :T_PFN_vkBindBufferMemory                                                    ;
var vkBindImageMemory                                                    :T_PFN_vkBindImageMemory                                                     ;
var vkGetBufferMemoryRequirements                                        :T_PFN_vkGetBufferMemoryRequirements                                         ;
var vkGetImageMemoryRequirements                                         :T_PFN_vkGetImageMemoryRequirements                                          ;
var vkGetImageSparseMemoryRequirements                                   :T_PFN_vkGetImageSparseMemoryRequirements                                    ;
var vkGetPhysicalDeviceSparseImageFormatProperties                       :T_PFN_vkGetPhysicalDeviceSparseImageFormatProperties                        ;
var vkQueueBindSparse                                                    :T_PFN_vkQueueBindSparse                                                     ;
var vkCreateFence                                                        :T_PFN_vkCreateFence                                                         ;
var vkDestroyFence                                                       :T_PFN_vkDestroyFence                                                        ;
var vkResetFences                                                        :T_PFN_vkResetFences                                                         ;
var vkGetFenceStatus                                                     :T_PFN_vkGetFenceStatus                                                      ;
var vkWaitForFences                                                      :T_PFN_vkWaitForFences                                                       ;
var vkCreateSemaphore                                                    :T_PFN_vkCreateSemaphore                                                     ;
var vkDestroySemaphore                                                   :T_PFN_vkDestroySemaphore                                                    ;
var vkCreateQueryPool                                                    :T_PFN_vkCreateQueryPool                                                     ;
var vkDestroyQueryPool                                                   :T_PFN_vkDestroyQueryPool                                                    ;
var vkGetQueryPoolResults                                                :T_PFN_vkGetQueryPoolResults                                                 ;
var vkCreateBuffer                                                       :T_PFN_vkCreateBuffer                                                        ;
var vkDestroyBuffer                                                      :T_PFN_vkDestroyBuffer                                                       ;
var vkCreateImage                                                        :T_PFN_vkCreateImage                                                         ;
var vkDestroyImage                                                       :T_PFN_vkDestroyImage                                                        ;
var vkGetImageSubresourceLayout                                          :T_PFN_vkGetImageSubresourceLayout                                           ;
var vkCreateImageView                                                    :T_PFN_vkCreateImageView                                                     ;
var vkDestroyImageView                                                   :T_PFN_vkDestroyImageView                                                    ;
var vkCreateCommandPool                                                  :T_PFN_vkCreateCommandPool                                                   ;
var vkDestroyCommandPool                                                 :T_PFN_vkDestroyCommandPool                                                  ;
var vkResetCommandPool                                                   :T_PFN_vkResetCommandPool                                                    ;
var vkAllocateCommandBuffers                                             :T_PFN_vkAllocateCommandBuffers                                              ;
var vkFreeCommandBuffers                                                 :T_PFN_vkFreeCommandBuffers                                                  ;
var vkBeginCommandBuffer                                                 :T_PFN_vkBeginCommandBuffer                                                  ;
var vkEndCommandBuffer                                                   :T_PFN_vkEndCommandBuffer                                                    ;
var vkResetCommandBuffer                                                 :T_PFN_vkResetCommandBuffer                                                  ;
var vkCmdCopyBuffer                                                      :T_PFN_vkCmdCopyBuffer                                                       ;
var vkCmdCopyImage                                                       :T_PFN_vkCmdCopyImage                                                        ;
var vkCmdCopyBufferToImage                                               :T_PFN_vkCmdCopyBufferToImage                                                ;
var vkCmdCopyImageToBuffer                                               :T_PFN_vkCmdCopyImageToBuffer                                                ;
var vkCmdUpdateBuffer                                                    :T_PFN_vkCmdUpdateBuffer                                                     ;
var vkCmdFillBuffer                                                      :T_PFN_vkCmdFillBuffer                                                       ;
var vkCmdPipelineBarrier                                                 :T_PFN_vkCmdPipelineBarrier                                                  ;
var vkCmdBeginQuery                                                      :T_PFN_vkCmdBeginQuery                                                       ;
var vkCmdEndQuery                                                        :T_PFN_vkCmdEndQuery                                                         ;
var vkCmdResetQueryPool                                                  :T_PFN_vkCmdResetQueryPool                                                   ;
var vkCmdWriteTimestamp                                                  :T_PFN_vkCmdWriteTimestamp                                                   ;
var vkCmdCopyQueryPoolResults                                            :T_PFN_vkCmdCopyQueryPoolResults                                             ;
var vkCmdExecuteCommands                                                 :T_PFN_vkCmdExecuteCommands                                                  ;
var vkCreateEvent                                                        :T_PFN_vkCreateEvent                                                         ;
var vkDestroyEvent                                                       :T_PFN_vkDestroyEvent                                                        ;
var vkGetEventStatus                                                     :T_PFN_vkGetEventStatus                                                      ;
var vkSetEvent                                                           :T_PFN_vkSetEvent                                                            ;
var vkResetEvent                                                         :T_PFN_vkResetEvent                                                          ;
var vkCreateBufferView                                                   :T_PFN_vkCreateBufferView                                                    ;
var vkDestroyBufferView                                                  :T_PFN_vkDestroyBufferView                                                   ;
var vkCreateShaderModule                                                 :T_PFN_vkCreateShaderModule                                                  ;
var vkDestroyShaderModule                                                :T_PFN_vkDestroyShaderModule                                                 ;
var vkCreatePipelineCache                                                :T_PFN_vkCreatePipelineCache                                                 ;
var vkDestroyPipelineCache                                               :T_PFN_vkDestroyPipelineCache                                                ;
var vkGetPipelineCacheData                                               :T_PFN_vkGetPipelineCacheData                                                ;
var vkMergePipelineCaches                                                :T_PFN_vkMergePipelineCaches                                                 ;
var vkCreateComputePipelines                                             :T_PFN_vkCreateComputePipelines                                              ;
var vkDestroyPipeline                                                    :T_PFN_vkDestroyPipeline                                                     ;
var vkCreatePipelineLayout                                               :T_PFN_vkCreatePipelineLayout                                                ;
var vkDestroyPipelineLayout                                              :T_PFN_vkDestroyPipelineLayout                                               ;
var vkCreateSampler                                                      :T_PFN_vkCreateSampler                                                       ;
var vkDestroySampler                                                     :T_PFN_vkDestroySampler                                                      ;
var vkCreateDescriptorSetLayout                                          :T_PFN_vkCreateDescriptorSetLayout                                           ;
var vkDestroyDescriptorSetLayout                                         :T_PFN_vkDestroyDescriptorSetLayout                                          ;
var vkCreateDescriptorPool                                               :T_PFN_vkCreateDescriptorPool                                                ;
var vkDestroyDescriptorPool                                              :T_PFN_vkDestroyDescriptorPool                                               ;
var vkResetDescriptorPool                                                :T_PFN_vkResetDescriptorPool                                                 ;
var vkAllocateDescriptorSets                                             :T_PFN_vkAllocateDescriptorSets                                              ;
var vkFreeDescriptorSets                                                 :T_PFN_vkFreeDescriptorSets                                                  ;
var vkUpdateDescriptorSets                                               :T_PFN_vkUpdateDescriptorSets                                                ;
var vkCmdBindPipeline                                                    :T_PFN_vkCmdBindPipeline                                                     ;
var vkCmdBindDescriptorSets                                              :T_PFN_vkCmdBindDescriptorSets                                               ;
var vkCmdClearColorImage                                                 :T_PFN_vkCmdClearColorImage                                                  ;
var vkCmdDispatch                                                        :T_PFN_vkCmdDispatch                                                         ;
var vkCmdDispatchIndirect                                                :T_PFN_vkCmdDispatchIndirect                                                 ;
var vkCmdSetEvent                                                        :T_PFN_vkCmdSetEvent                                                         ;
var vkCmdResetEvent                                                      :T_PFN_vkCmdResetEvent                                                       ;
var vkCmdWaitEvents                                                      :T_PFN_vkCmdWaitEvents                                                       ;
var vkCmdPushConstants                                                   :T_PFN_vkCmdPushConstants                                                    ;
var vkCreateGraphicsPipelines                                            :T_PFN_vkCreateGraphicsPipelines                                             ;
var vkCreateFramebuffer                                                  :T_PFN_vkCreateFramebuffer                                                   ;
var vkDestroyFramebuffer                                                 :T_PFN_vkDestroyFramebuffer                                                  ;
var vkCreateRenderPass                                                   :T_PFN_vkCreateRenderPass                                                    ;
var vkDestroyRenderPass                                                  :T_PFN_vkDestroyRenderPass                                                   ;
var vkGetRenderAreaGranularity                                           :T_PFN_vkGetRenderAreaGranularity                                            ;
var vkCmdSetViewport                                                     :T_PFN_vkCmdSetViewport                                                      ;
var vkCmdSetScissor                                                      :T_PFN_vkCmdSetScissor                                                       ;
var vkCmdSetLineWidth                                                    :T_PFN_vkCmdSetLineWidth                                                     ;
var vkCmdSetDepthBias                                                    :T_PFN_vkCmdSetDepthBias                                                     ;
var vkCmdSetBlendConstants                                               :T_PFN_vkCmdSetBlendConstants                                                ;
var vkCmdSetDepthBounds                                                  :T_PFN_vkCmdSetDepthBounds                                                   ;
var vkCmdSetStencilCompareMask                                           :T_PFN_vkCmdSetStencilCompareMask                                            ;
var vkCmdSetStencilWriteMask                                             :T_PFN_vkCmdSetStencilWriteMask                                              ;
var vkCmdSetStencilReference                                             :T_PFN_vkCmdSetStencilReference                                              ;
var vkCmdBindIndexBuffer                                                 :T_PFN_vkCmdBindIndexBuffer                                                  ;
var vkCmdBindVertexBuffers                                               :T_PFN_vkCmdBindVertexBuffers                                                ;
var vkCmdDraw                                                            :T_PFN_vkCmdDraw                                                             ;
var vkCmdDrawIndexed                                                     :T_PFN_vkCmdDrawIndexed                                                      ;
var vkCmdDrawIndirect                                                    :T_PFN_vkCmdDrawIndirect                                                     ;
var vkCmdDrawIndexedIndirect                                             :T_PFN_vkCmdDrawIndexedIndirect                                              ;
var vkCmdBlitImage                                                       :T_PFN_vkCmdBlitImage                                                        ;
var vkCmdClearDepthStencilImage                                          :T_PFN_vkCmdClearDepthStencilImage                                           ;
var vkCmdClearAttachments                                                :T_PFN_vkCmdClearAttachments                                                 ;
var vkCmdResolveImage                                                    :T_PFN_vkCmdResolveImage                                                     ;
var vkCmdBeginRenderPass                                                 :T_PFN_vkCmdBeginRenderPass                                                  ;
var vkCmdNextSubpass                                                     :T_PFN_vkCmdNextSubpass                                                      ;
var vkCmdEndRenderPass                                                   :T_PFN_vkCmdEndRenderPass                                                    ;

// VK_VERSION_1_1
var vkEnumerateInstanceVersion                                           :T_PFN_vkEnumerateInstanceVersion                                            ;
var vkBindBufferMemory2                                                  :T_PFN_vkBindBufferMemory2                                                   ;
var vkBindImageMemory2                                                   :T_PFN_vkBindImageMemory2                                                    ;
var vkGetDeviceGroupPeerMemoryFeatures                                   :T_PFN_vkGetDeviceGroupPeerMemoryFeatures                                    ;
var vkCmdSetDeviceMask                                                   :T_PFN_vkCmdSetDeviceMask                                                    ;
var vkEnumeratePhysicalDeviceGroups                                      :T_PFN_vkEnumeratePhysicalDeviceGroups                                       ;
var vkGetImageMemoryRequirements2                                        :T_PFN_vkGetImageMemoryRequirements2                                         ;
var vkGetBufferMemoryRequirements2                                       :T_PFN_vkGetBufferMemoryRequirements2                                        ;
var vkGetImageSparseMemoryRequirements2                                  :T_PFN_vkGetImageSparseMemoryRequirements2                                   ;
var vkGetPhysicalDeviceFeatures2                                         :T_PFN_vkGetPhysicalDeviceFeatures2                                          ;
var vkGetPhysicalDeviceProperties2                                       :T_PFN_vkGetPhysicalDeviceProperties2                                        ;
var vkGetPhysicalDeviceFormatProperties2                                 :T_PFN_vkGetPhysicalDeviceFormatProperties2                                  ;
var vkGetPhysicalDeviceImageFormatProperties2                            :T_PFN_vkGetPhysicalDeviceImageFormatProperties2                             ;
var vkGetPhysicalDeviceQueueFamilyProperties2                            :T_PFN_vkGetPhysicalDeviceQueueFamilyProperties2                             ;
var vkGetPhysicalDeviceMemoryProperties2                                 :T_PFN_vkGetPhysicalDeviceMemoryProperties2                                  ;
var vkGetPhysicalDeviceSparseImageFormatProperties2                      :T_PFN_vkGetPhysicalDeviceSparseImageFormatProperties2                       ;
var vkTrimCommandPool                                                    :T_PFN_vkTrimCommandPool                                                     ;
var vkGetDeviceQueue2                                                    :T_PFN_vkGetDeviceQueue2                                                     ;
var vkGetPhysicalDeviceExternalBufferProperties                          :T_PFN_vkGetPhysicalDeviceExternalBufferProperties                           ;
var vkGetPhysicalDeviceExternalFenceProperties                           :T_PFN_vkGetPhysicalDeviceExternalFenceProperties                            ;
var vkGetPhysicalDeviceExternalSemaphoreProperties                       :T_PFN_vkGetPhysicalDeviceExternalSemaphoreProperties                        ;
var vkCmdDispatchBase                                                    :T_PFN_vkCmdDispatchBase                                                     ;
var vkCreateDescriptorUpdateTemplate                                     :T_PFN_vkCreateDescriptorUpdateTemplate                                      ;
var vkDestroyDescriptorUpdateTemplate                                    :T_PFN_vkDestroyDescriptorUpdateTemplate                                     ;
var vkUpdateDescriptorSetWithTemplate                                    :T_PFN_vkUpdateDescriptorSetWithTemplate                                     ;
var vkGetDescriptorSetLayoutSupport                                      :T_PFN_vkGetDescriptorSetLayoutSupport                                       ;
var vkCreateSamplerYcbcrConversion                                       :T_PFN_vkCreateSamplerYcbcrConversion                                        ;
var vkDestroySamplerYcbcrConversion                                      :T_PFN_vkDestroySamplerYcbcrConversion                                       ;

// VK_VERSION_1_2
var vkResetQueryPool                                                     :T_PFN_vkResetQueryPool                                                      ;
var vkGetSemaphoreCounterValue                                           :T_PFN_vkGetSemaphoreCounterValue                                            ;
var vkWaitSemaphores                                                     :T_PFN_vkWaitSemaphores                                                      ;
var vkSignalSemaphore                                                    :T_PFN_vkSignalSemaphore                                                     ;
var vkGetBufferDeviceAddress                                             :T_PFN_vkGetBufferDeviceAddress                                              ;
var vkGetBufferOpaqueCaptureAddress                                      :T_PFN_vkGetBufferOpaqueCaptureAddress                                       ;
var vkGetDeviceMemoryOpaqueCaptureAddress                                :T_PFN_vkGetDeviceMemoryOpaqueCaptureAddress                                 ;
var vkCmdDrawIndirectCount                                               :T_PFN_vkCmdDrawIndirectCount                                                ;
var vkCmdDrawIndexedIndirectCount                                        :T_PFN_vkCmdDrawIndexedIndirectCount                                         ;
var vkCreateRenderPass2                                                  :T_PFN_vkCreateRenderPass2                                                   ;
var vkCmdBeginRenderPass2                                                :T_PFN_vkCmdBeginRenderPass2                                                 ;
var vkCmdNextSubpass2                                                    :T_PFN_vkCmdNextSubpass2                                                     ;
var vkCmdEndRenderPass2                                                  :T_PFN_vkCmdEndRenderPass2                                                   ;

// VK_VERSION_1_3
var vkGetPhysicalDeviceToolProperties                                    :T_PFN_vkGetPhysicalDeviceToolProperties                                     ;
var vkCreatePrivateDataSlot                                              :T_PFN_vkCreatePrivateDataSlot                                               ;
var vkDestroyPrivateDataSlot                                             :T_PFN_vkDestroyPrivateDataSlot                                              ;
var vkSetPrivateData                                                     :T_PFN_vkSetPrivateData                                                      ;
var vkGetPrivateData                                                     :T_PFN_vkGetPrivateData                                                      ;
var vkCmdPipelineBarrier2                                                :T_PFN_vkCmdPipelineBarrier2                                                 ;
var vkCmdWriteTimestamp2                                                 :T_PFN_vkCmdWriteTimestamp2                                                  ;
var vkQueueSubmit2                                                       :T_PFN_vkQueueSubmit2                                                        ;
var vkCmdCopyBuffer2                                                     :T_PFN_vkCmdCopyBuffer2                                                      ;
var vkCmdCopyImage2                                                      :T_PFN_vkCmdCopyImage2                                                       ;
var vkCmdCopyBufferToImage2                                              :T_PFN_vkCmdCopyBufferToImage2                                               ;
var vkCmdCopyImageToBuffer2                                              :T_PFN_vkCmdCopyImageToBuffer2                                               ;
var vkGetDeviceBufferMemoryRequirements                                  :T_PFN_vkGetDeviceBufferMemoryRequirements                                   ;
var vkGetDeviceImageMemoryRequirements                                   :T_PFN_vkGetDeviceImageMemoryRequirements                                    ;
var vkGetDeviceImageSparseMemoryRequirements                             :T_PFN_vkGetDeviceImageSparseMemoryRequirements                              ;
var vkCmdSetEvent2                                                       :T_PFN_vkCmdSetEvent2                                                        ;
var vkCmdResetEvent2                                                     :T_PFN_vkCmdResetEvent2                                                      ;
var vkCmdWaitEvents2                                                     :T_PFN_vkCmdWaitEvents2                                                      ;
var vkCmdBlitImage2                                                      :T_PFN_vkCmdBlitImage2                                                       ;
var vkCmdResolveImage2                                                   :T_PFN_vkCmdResolveImage2                                                    ;
var vkCmdBeginRendering                                                  :T_PFN_vkCmdBeginRendering                                                   ;
var vkCmdEndRendering                                                    :T_PFN_vkCmdEndRendering                                                     ;
var vkCmdSetCullMode                                                     :T_PFN_vkCmdSetCullMode                                                      ;
var vkCmdSetFrontFace                                                    :T_PFN_vkCmdSetFrontFace                                                     ;
var vkCmdSetPrimitiveTopology                                            :T_PFN_vkCmdSetPrimitiveTopology                                             ;
var vkCmdSetViewportWithCount                                            :T_PFN_vkCmdSetViewportWithCount                                             ;
var vkCmdSetScissorWithCount                                             :T_PFN_vkCmdSetScissorWithCount                                              ;
var vkCmdBindVertexBuffers2                                              :T_PFN_vkCmdBindVertexBuffers2                                               ;
var vkCmdSetDepthTestEnable                                              :T_PFN_vkCmdSetDepthTestEnable                                               ;
var vkCmdSetDepthWriteEnable                                             :T_PFN_vkCmdSetDepthWriteEnable                                              ;
var vkCmdSetDepthCompareOp                                               :T_PFN_vkCmdSetDepthCompareOp                                                ;
var vkCmdSetDepthBoundsTestEnable                                        :T_PFN_vkCmdSetDepthBoundsTestEnable                                         ;
var vkCmdSetStencilTestEnable                                            :T_PFN_vkCmdSetStencilTestEnable                                             ;
var vkCmdSetStencilOp                                                    :T_PFN_vkCmdSetStencilOp                                                     ;
var vkCmdSetRasterizerDiscardEnable                                      :T_PFN_vkCmdSetRasterizerDiscardEnable                                       ;
var vkCmdSetDepthBiasEnable                                              :T_PFN_vkCmdSetDepthBiasEnable                                               ;
var vkCmdSetPrimitiveRestartEnable                                       :T_PFN_vkCmdSetPrimitiveRestartEnable                                        ;

// VK_VERSION_1_4
var vkMapMemory2                                                         :T_PFN_vkMapMemory2                                                          ;
var vkUnmapMemory2                                                       :T_PFN_vkUnmapMemory2                                                        ;
var vkGetDeviceImageSubresourceLayout                                    :T_PFN_vkGetDeviceImageSubresourceLayout                                     ;
var vkGetImageSubresourceLayout2                                         :T_PFN_vkGetImageSubresourceLayout2                                          ;
var vkCopyMemoryToImage                                                  :T_PFN_vkCopyMemoryToImage                                                   ;
var vkCopyImageToMemory                                                  :T_PFN_vkCopyImageToMemory                                                   ;
var vkCopyImageToImage                                                   :T_PFN_vkCopyImageToImage                                                    ;
var vkTransitionImageLayout                                              :T_PFN_vkTransitionImageLayout                                               ;
var vkCmdPushDescriptorSet                                               :T_PFN_vkCmdPushDescriptorSet                                                ;
var vkCmdPushDescriptorSetWithTemplate                                   :T_PFN_vkCmdPushDescriptorSetWithTemplate                                    ;
var vkCmdBindDescriptorSets2                                             :T_PFN_vkCmdBindDescriptorSets2                                              ;
var vkCmdPushConstants2                                                  :T_PFN_vkCmdPushConstants2                                                   ;
var vkCmdPushDescriptorSet2                                              :T_PFN_vkCmdPushDescriptorSet2                                               ;
var vkCmdPushDescriptorSetWithTemplate2                                  :T_PFN_vkCmdPushDescriptorSetWithTemplate2                                   ;
var vkCmdSetLineStipple                                                  :T_PFN_vkCmdSetLineStipple                                                   ;
var vkCmdBindIndexBuffer2                                                :T_PFN_vkCmdBindIndexBuffer2                                                 ;
var vkGetRenderingAreaGranularity                                        :T_PFN_vkGetRenderingAreaGranularity                                         ;
var vkCmdSetRenderingAttachmentLocations                                 :T_PFN_vkCmdSetRenderingAttachmentLocations                                  ;
var vkCmdSetRenderingInputAttachmentIndices                              :T_PFN_vkCmdSetRenderingInputAttachmentIndices                               ;

// VK_KHR_surface
var vkDestroySurfaceKHR                                                  :T_PFN_vkDestroySurfaceKHR                                                   ;
var vkGetPhysicalDeviceSurfaceSupportKHR                                 :T_PFN_vkGetPhysicalDeviceSurfaceSupportKHR                                  ;
var vkGetPhysicalDeviceSurfaceCapabilitiesKHR                            :T_PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR                             ;
var vkGetPhysicalDeviceSurfaceFormatsKHR                                 :T_PFN_vkGetPhysicalDeviceSurfaceFormatsKHR                                  ;
var vkGetPhysicalDeviceSurfacePresentModesKHR                            :T_PFN_vkGetPhysicalDeviceSurfacePresentModesKHR                             ;

// VK_KHR_swapchain
var vkCreateSwapchainKHR                                                 :T_PFN_vkCreateSwapchainKHR                                                  ;
var vkDestroySwapchainKHR                                                :T_PFN_vkDestroySwapchainKHR                                                 ;
var vkGetSwapchainImagesKHR                                              :T_PFN_vkGetSwapchainImagesKHR                                               ;
var vkAcquireNextImageKHR                                                :T_PFN_vkAcquireNextImageKHR                                                 ;
var vkQueuePresentKHR                                                    :T_PFN_vkQueuePresentKHR                                                     ;
var vkGetDeviceGroupPresentCapabilitiesKHR                               :T_PFN_vkGetDeviceGroupPresentCapabilitiesKHR                                ;
var vkGetDeviceGroupSurfacePresentModesKHR                               :T_PFN_vkGetDeviceGroupSurfacePresentModesKHR                                ;
var vkGetPhysicalDevicePresentRectanglesKHR                              :T_PFN_vkGetPhysicalDevicePresentRectanglesKHR                               ;
var vkAcquireNextImage2KHR                                               :T_PFN_vkAcquireNextImage2KHR                                                ;

// VK_KHR_display
var vkGetPhysicalDeviceDisplayPropertiesKHR                              :T_PFN_vkGetPhysicalDeviceDisplayPropertiesKHR                               ;
var vkGetPhysicalDeviceDisplayPlanePropertiesKHR                         :T_PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR                          ;
var vkGetDisplayPlaneSupportedDisplaysKHR                                :T_PFN_vkGetDisplayPlaneSupportedDisplaysKHR                                 ;
var vkGetDisplayModePropertiesKHR                                        :T_PFN_vkGetDisplayModePropertiesKHR                                         ;
var vkCreateDisplayModeKHR                                               :T_PFN_vkCreateDisplayModeKHR                                                ;
var vkGetDisplayPlaneCapabilitiesKHR                                     :T_PFN_vkGetDisplayPlaneCapabilitiesKHR                                      ;
var vkCreateDisplayPlaneSurfaceKHR                                       :T_PFN_vkCreateDisplayPlaneSurfaceKHR                                        ;

// VK_KHR_display_swapchain
var vkCreateSharedSwapchainsKHR                                          :T_PFN_vkCreateSharedSwapchainsKHR                                           ;

// VK_KHR_video_queue
var vkGetPhysicalDeviceVideoCapabilitiesKHR                              :T_PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR                               ;
var vkGetPhysicalDeviceVideoFormatPropertiesKHR                          :T_PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR                           ;
var vkCreateVideoSessionKHR                                              :T_PFN_vkCreateVideoSessionKHR                                               ;
var vkDestroyVideoSessionKHR                                             :T_PFN_vkDestroyVideoSessionKHR                                              ;
var vkGetVideoSessionMemoryRequirementsKHR                               :T_PFN_vkGetVideoSessionMemoryRequirementsKHR                                ;
var vkBindVideoSessionMemoryKHR                                          :T_PFN_vkBindVideoSessionMemoryKHR                                           ;
var vkCreateVideoSessionParametersKHR                                    :T_PFN_vkCreateVideoSessionParametersKHR                                     ;
var vkUpdateVideoSessionParametersKHR                                    :T_PFN_vkUpdateVideoSessionParametersKHR                                     ;
var vkDestroyVideoSessionParametersKHR                                   :T_PFN_vkDestroyVideoSessionParametersKHR                                    ;
var vkCmdBeginVideoCodingKHR                                             :T_PFN_vkCmdBeginVideoCodingKHR                                              ;
var vkCmdEndVideoCodingKHR                                               :T_PFN_vkCmdEndVideoCodingKHR                                                ;
var vkCmdControlVideoCodingKHR                                           :T_PFN_vkCmdControlVideoCodingKHR                                            ;

// VK_KHR_video_decode_queue
var vkCmdDecodeVideoKHR                                                  :T_PFN_vkCmdDecodeVideoKHR                                                   ;

// VK_KHR_DYNAMIC_RENDERING_SPEC_VERSION
var vkCmdBeginRenderingKHR                                               :T_PFN_vkCmdBeginRenderingKHR                                                ;
var vkCmdEndRenderingKHR                                                 :T_PFN_vkCmdEndRenderingKHR                                                  ;

// VK_KHR_get_physical_device_properties2
var vkGetPhysicalDeviceFeatures2KHR                                      :T_PFN_vkGetPhysicalDeviceFeatures2KHR                                       ;
var vkGetPhysicalDeviceProperties2KHR                                    :T_PFN_vkGetPhysicalDeviceProperties2KHR                                     ;
var vkGetPhysicalDeviceFormatProperties2KHR                              :T_PFN_vkGetPhysicalDeviceFormatProperties2KHR                               ;
var vkGetPhysicalDeviceImageFormatProperties2KHR                         :T_PFN_vkGetPhysicalDeviceImageFormatProperties2KHR                          ;
var vkGetPhysicalDeviceQueueFamilyProperties2KHR                         :T_PFN_vkGetPhysicalDeviceQueueFamilyProperties2KHR                          ;
var vkGetPhysicalDeviceMemoryProperties2KHR                              :T_PFN_vkGetPhysicalDeviceMemoryProperties2KHR                               ;
var vkGetPhysicalDeviceSparseImageFormatProperties2KHR                   :T_PFN_vkGetPhysicalDeviceSparseImageFormatProperties2KHR                    ;

// VK_KHR_device_group
var vkGetDeviceGroupPeerMemoryFeaturesKHR                                :T_PFN_vkGetDeviceGroupPeerMemoryFeaturesKHR                                 ;
var vkCmdSetDeviceMaskKHR                                                :T_PFN_vkCmdSetDeviceMaskKHR                                                 ;
var vkCmdDispatchBaseKHR                                                 :T_PFN_vkCmdDispatchBaseKHR                                                  ;

// VK_KHR_maintenance1
var vkTrimCommandPoolKHR                                                 :T_PFN_vkTrimCommandPoolKHR                                                  ;

// VK_KHR_DEVICE_GROUP_CREATION_SPEC_VERSION
var vkEnumeratePhysicalDeviceGroupsKHR                                   :T_PFN_vkEnumeratePhysicalDeviceGroupsKHR                                    ;

// VK_KHR_EXTERNAL_MEMORY_CAPABILITIES_SPEC_VERSION
var vkGetPhysicalDeviceExternalBufferPropertiesKHR                       :T_PFN_vkGetPhysicalDeviceExternalBufferPropertiesKHR                        ;

// VK_KHR_EXTERNAL_MEMORY_FD_SPEC_VERSION
var vkGetMemoryFdKHR                                                     :T_PFN_vkGetMemoryFdKHR                                                      ;
var vkGetMemoryFdPropertiesKHR                                           :T_PFN_vkGetMemoryFdPropertiesKHR                                            ;

// VK_KHR_EXTERNAL_SEMAPHORE_CAPABILITIES_SPEC_VERSION
var vkGetPhysicalDeviceExternalSemaphorePropertiesKHR                    :T_PFN_vkGetPhysicalDeviceExternalSemaphorePropertiesKHR                     ;

// VK_KHR_EXTERNAL_SEMAPHORE_FD_SPEC_VERSION
var vkImportSemaphoreFdKHR                                               :T_PFN_vkImportSemaphoreFdKHR                                                ;
var vkGetSemaphoreFdKHR                                                  :T_PFN_vkGetSemaphoreFdKHR                                                   ;

// VK_KHR_push_descriptor
var vkCmdPushDescriptorSetKHR                                            :T_PFN_vkCmdPushDescriptorSetKHR                                             ;
var vkCmdPushDescriptorSetWithTemplateKHR                                :T_PFN_vkCmdPushDescriptorSetWithTemplateKHR                                 ;

// VK_KHR_DESCRIPTOR_UPDATE_TEMPLATE_SPEC_VERSION
var vkCreateDescriptorUpdateTemplateKHR                                  :T_PFN_vkCreateDescriptorUpdateTemplateKHR                                   ;
var vkDestroyDescriptorUpdateTemplateKHR                                 :T_PFN_vkDestroyDescriptorUpdateTemplateKHR                                  ;
var vkUpdateDescriptorSetWithTemplateKHR                                 :T_PFN_vkUpdateDescriptorSetWithTemplateKHR                                  ;

// VK_KHR_CREATE_RENDERPASS_2_SPEC_VERSION
var vkCreateRenderPass2KHR                                               :T_PFN_vkCreateRenderPass2KHR                                                ;
var vkCmdBeginRenderPass2KHR                                             :T_PFN_vkCmdBeginRenderPass2KHR                                              ;
var vkCmdNextSubpass2KHR                                                 :T_PFN_vkCmdNextSubpass2KHR                                                  ;
var vkCmdEndRenderPass2KHR                                               :T_PFN_vkCmdEndRenderPass2KHR                                                ;

// VK_KHR_SHARED_PRESENTABLE_IMAGE_SPEC_VERSION
var vkGetSwapchainStatusKHR                                              :T_PFN_vkGetSwapchainStatusKHR                                               ;

// VK_KHR_EXTERNAL_FENCE_CAPABILITIES_SPEC_VERSION
var vkGetPhysicalDeviceExternalFencePropertiesKHR                        :T_PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR                         ;

// VK_KHR_EXTERNAL_FENCE_FD_SPEC_VERSION
var vkImportFenceFdKHR                                                   :T_PFN_vkImportFenceFdKHR                                                    ;
var vkGetFenceFdKHR                                                      :T_PFN_vkGetFenceFdKHR                                                       ;

// VK_KHR_PERFORMANCE_QUERY_SPEC_VERSION
var vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR      :T_PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR       ;
var vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR              :T_PFN_vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR               ;
var vkAcquireProfilingLockKHR                                            :T_PFN_vkAcquireProfilingLockKHR                                             ;
var vkReleaseProfilingLockKHR                                            :T_PFN_vkReleaseProfilingLockKHR                                             ;

// VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION
var vkGetPhysicalDeviceSurfaceCapabilities2KHR                           :T_PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR                            ;
var vkGetPhysicalDeviceSurfaceFormats2KHR                                :T_PFN_vkGetPhysicalDeviceSurfaceFormats2KHR                                 ;

// VK_KHR_GET_DISPLAY_PROPERTIES_2_SPEC_VERSION
var vkGetPhysicalDeviceDisplayProperties2KHR                             :T_PFN_vkGetPhysicalDeviceDisplayProperties2KHR                              ;
var vkGetPhysicalDeviceDisplayPlaneProperties2KHR                        :T_PFN_vkGetPhysicalDeviceDisplayPlaneProperties2KHR                         ;
var vkGetDisplayModeProperties2KHR                                       :T_PFN_vkGetDisplayModeProperties2KHR                                        ;
var vkGetDisplayPlaneCapabilities2KHR                                    :T_PFN_vkGetDisplayPlaneCapabilities2KHR                                     ;

// VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION
var vkGetImageMemoryRequirements2KHR                                     :T_PFN_vkGetImageMemoryRequirements2KHR                                      ;
var vkGetBufferMemoryRequirements2KHR                                    :T_PFN_vkGetBufferMemoryRequirements2KHR                                     ;
var vkGetImageSparseMemoryRequirements2KHR                               :T_PFN_vkGetImageSparseMemoryRequirements2KHR                                ;

// VK_KHR_sampler_ycbcr_conversion
var vkCreateSamplerYcbcrConversionKHR                                    :T_PFN_vkCreateSamplerYcbcrConversionKHR                                     ;
var vkDestroySamplerYcbcrConversionKHR                                   :T_PFN_vkDestroySamplerYcbcrConversionKHR                                    ;

// VK_KHR_BIND_MEMORY_2_SPEC_VERSION
var vkBindBufferMemory2KHR                                               :T_PFN_vkBindBufferMemory2KHR                                                ;
var vkBindImageMemory2KHR                                                :T_PFN_vkBindImageMemory2KHR                                                 ;

// VK_KHR_MAINTENANCE_3_SPEC_VERSION
var vkGetDescriptorSetLayoutSupportKHR                                   :T_PFN_vkGetDescriptorSetLayoutSupportKHR                                    ;

// VK_KHR_DRAW_INDIRECT_COUNT_SPEC_VERSION
var vkCmdDrawIndirectCountKHR                                            :T_PFN_vkCmdDrawIndirectCountKHR                                             ;
var vkCmdDrawIndexedIndirectCountKHR                                     :T_PFN_vkCmdDrawIndexedIndirectCountKHR                                      ;

// VK_KHR_timeline_semaphore
var vkGetSemaphoreCounterValueKHR                                        :T_PFN_vkGetSemaphoreCounterValueKHR                                         ;
var vkWaitSemaphoresKHR                                                  :T_PFN_vkWaitSemaphoresKHR                                                   ;
var vkSignalSemaphoreKHR                                                 :T_PFN_vkSignalSemaphoreKHR                                                  ;

// VK_KHR_fragment_shading_rate
var vkGetPhysicalDeviceFragmentShadingRatesKHR                           :T_PFN_vkGetPhysicalDeviceFragmentShadingRatesKHR                            ;
var vkCmdSetFragmentShadingRateKHR                                       :T_PFN_vkCmdSetFragmentShadingRateKHR                                        ;

// VK_KHR_DYNAMIC_RENDERING_LOCAL_READ_SPEC_VERSION
var vkCmdSetRenderingAttachmentLocationsKHR                              :T_PFN_vkCmdSetRenderingAttachmentLocationsKHR                               ;
var vkCmdSetRenderingInputAttachmentIndicesKHR                           :T_PFN_vkCmdSetRenderingInputAttachmentIndicesKHR                            ;

// VK_KHR_PRESENT_WAIT_SPEC_VERSION
var vkWaitForPresentKHR                                                  :T_PFN_vkWaitForPresentKHR                                                   ;

// VK_KHR_BUFFER_DEVICE_ADDRESS_SPEC_VERSION
var vkGetBufferDeviceAddressKHR                                          :T_PFN_vkGetBufferDeviceAddressKHR                                           ;
var vkGetBufferOpaqueCaptureAddressKHR                                   :T_PFN_vkGetBufferOpaqueCaptureAddressKHR                                    ;
var vkGetDeviceMemoryOpaqueCaptureAddressKHR                             :T_PFN_vkGetDeviceMemoryOpaqueCaptureAddressKHR                              ;

// VK_KHR_deferred_host_operations
var vkCreateDeferredOperationKHR                                         :T_PFN_vkCreateDeferredOperationKHR                                          ;
var vkDestroyDeferredOperationKHR                                        :T_PFN_vkDestroyDeferredOperationKHR                                         ;
var vkGetDeferredOperationMaxConcurrencyKHR                              :T_PFN_vkGetDeferredOperationMaxConcurrencyKHR                               ;
var vkGetDeferredOperationResultKHR                                      :T_PFN_vkGetDeferredOperationResultKHR                                       ;
var vkDeferredOperationJoinKHR                                           :T_PFN_vkDeferredOperationJoinKHR                                            ;

// VK_KHR_PIPELINE_EXECUTABLE_PROPERTIES_SPEC_VERSION
var vkGetPipelineExecutablePropertiesKHR                                 :T_PFN_vkGetPipelineExecutablePropertiesKHR                                  ;
var vkGetPipelineExecutableStatisticsKHR                                 :T_PFN_vkGetPipelineExecutableStatisticsKHR                                  ;
var vkGetPipelineExecutableInternalRepresentationsKHR                    :T_PFN_vkGetPipelineExecutableInternalRepresentationsKHR                     ;

// VK_KHR_MAP_MEMORY_2_SPEC_VERSION
var vkMapMemory2KHR                                                      :T_PFN_vkMapMemory2KHR                                                       ;
var vkUnmapMemory2KHR                                                    :T_PFN_vkUnmapMemory2KHR                                                     ;

// VK_KHR_video_encode_queue
var vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR              :T_PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR               ;
var vkGetEncodedVideoSessionParametersKHR                                :T_PFN_vkGetEncodedVideoSessionParametersKHR                                 ;
var vkCmdEncodeVideoKHR                                                  :T_PFN_vkCmdEncodeVideoKHR                                                   ;

// VK_KHR_SYNCHRONIZATION_2_SPEC_VERSION
var vkCmdSetEvent2KHR                                                    :T_PFN_vkCmdSetEvent2KHR                                                     ;
var vkCmdResetEvent2KHR                                                  :T_PFN_vkCmdResetEvent2KHR                                                   ;
var vkCmdWaitEvents2KHR                                                  :T_PFN_vkCmdWaitEvents2KHR                                                   ;
var vkCmdPipelineBarrier2KHR                                             :T_PFN_vkCmdPipelineBarrier2KHR                                              ;
var vkCmdWriteTimestamp2KHR                                              :T_PFN_vkCmdWriteTimestamp2KHR                                               ;
var vkQueueSubmit2KHR                                                    :T_PFN_vkQueueSubmit2KHR                                                     ;

// VK_KHR_DEVICE_ADDRESS_COMMANDS_SPEC_VERSION
var vkCmdBindIndexBuffer3KHR                                             :T_PFN_vkCmdBindIndexBuffer3KHR                                              ;
var vkCmdBindVertexBuffers3KHR                                           :T_PFN_vkCmdBindVertexBuffers3KHR                                            ;
var vkCmdDrawIndirect2KHR                                                :T_PFN_vkCmdDrawIndirect2KHR                                                 ;
var vkCmdDrawIndexedIndirect2KHR                                         :T_PFN_vkCmdDrawIndexedIndirect2KHR                                          ;
var vkCmdDispatchIndirect2KHR                                            :T_PFN_vkCmdDispatchIndirect2KHR                                             ;
var vkCmdCopyMemoryKHR                                                   :T_PFN_vkCmdCopyMemoryKHR                                                    ;
var vkCmdCopyMemoryToImageKHR                                            :T_PFN_vkCmdCopyMemoryToImageKHR                                             ;
var vkCmdCopyImageToMemoryKHR                                            :T_PFN_vkCmdCopyImageToMemoryKHR                                             ;
var vkCmdUpdateMemoryKHR                                                 :T_PFN_vkCmdUpdateMemoryKHR                                                  ;
var vkCmdFillMemoryKHR                                                   :T_PFN_vkCmdFillMemoryKHR                                                    ;
var vkCmdCopyQueryPoolResultsToMemoryKHR                                 :T_PFN_vkCmdCopyQueryPoolResultsToMemoryKHR                                  ;
var vkCmdDrawIndirectCount2KHR                                           :T_PFN_vkCmdDrawIndirectCount2KHR                                            ;
var vkCmdDrawIndexedIndirectCount2KHR                                    :T_PFN_vkCmdDrawIndexedIndirectCount2KHR                                     ;
var vkCmdBeginConditionalRendering2EXT                                   :T_PFN_vkCmdBeginConditionalRendering2EXT                                    ;
var vkCmdBindTransformFeedbackBuffers2EXT                                :T_PFN_vkCmdBindTransformFeedbackBuffers2EXT                                 ;
var vkCmdBeginTransformFeedback2EXT                                      :T_PFN_vkCmdBeginTransformFeedback2EXT                                       ;
var vkCmdEndTransformFeedback2EXT                                        :T_PFN_vkCmdEndTransformFeedback2EXT                                         ;
var vkCmdDrawIndirectByteCount2EXT                                       :T_PFN_vkCmdDrawIndirectByteCount2EXT                                        ;
var vkCmdDrawMeshTasksIndirect2EXT                                       :T_PFN_vkCmdDrawMeshTasksIndirect2EXT                                        ;
var vkCmdDrawMeshTasksIndirectCount2EXT                                  :T_PFN_vkCmdDrawMeshTasksIndirectCount2EXT                                   ;
var vkCmdWriteMarkerToMemoryAMD                                          :T_PFN_vkCmdWriteMarkerToMemoryAMD                                           ;
var vkCreateAccelerationStructure2KHR                                    :T_PFN_vkCreateAccelerationStructure2KHR                                     ;

// VK_KHR_COPY_COMMANDS_2_SPEC_VERSION
var vkCmdCopyBuffer2KHR                                                  :T_PFN_vkCmdCopyBuffer2KHR                                                   ;
var vkCmdCopyImage2KHR                                                   :T_PFN_vkCmdCopyImage2KHR                                                    ;
var vkCmdCopyBufferToImage2KHR                                           :T_PFN_vkCmdCopyBufferToImage2KHR                                            ;
var vkCmdCopyImageToBuffer2KHR                                           :T_PFN_vkCmdCopyImageToBuffer2KHR                                            ;
var vkCmdBlitImage2KHR                                                   :T_PFN_vkCmdBlitImage2KHR                                                    ;
var vkCmdResolveImage2KHR                                                :T_PFN_vkCmdResolveImage2KHR                                                 ;

// VK_KHR_RAY_TRACING_MAINTENANCE_1_SPEC_VERSION
var vkCmdTraceRaysIndirect2KHR                                           :T_PFN_vkCmdTraceRaysIndirect2KHR                                            ;

// VK_KHR_maintenance4
var vkGetDeviceBufferMemoryRequirementsKHR                               :T_PFN_vkGetDeviceBufferMemoryRequirementsKHR                                ;
var vkGetDeviceImageMemoryRequirementsKHR                                :T_PFN_vkGetDeviceImageMemoryRequirementsKHR                                 ;
var vkGetDeviceImageSparseMemoryRequirementsKHR                          :T_PFN_vkGetDeviceImageSparseMemoryRequirementsKHR                           ;

// VK_KHR_MAINTENANCE_5_SPEC_VERSION
var vkCmdBindIndexBuffer2KHR                                             :T_PFN_vkCmdBindIndexBuffer2KHR                                              ;
var vkGetRenderingAreaGranularityKHR                                     :T_PFN_vkGetRenderingAreaGranularityKHR                                      ;
var vkGetDeviceImageSubresourceLayoutKHR                                 :T_PFN_vkGetDeviceImageSubresourceLayoutKHR                                  ;
var vkGetImageSubresourceLayout2KHR                                      :T_PFN_vkGetImageSubresourceLayout2KHR                                       ;

// VK_KHR_PRESENT_WAIT_2_SPEC_VERSION
var vkWaitForPresent2KHR                                                 :T_PFN_vkWaitForPresent2KHR                                                  ;

// VK_KHR_PIPELINE_BINARY_SPEC_VERSION
var vkCreatePipelineBinariesKHR                                          :T_PFN_vkCreatePipelineBinariesKHR                                           ;
var vkDestroyPipelineBinaryKHR                                           :T_PFN_vkDestroyPipelineBinaryKHR                                            ;
var vkGetPipelineKeyKHR                                                  :T_PFN_vkGetPipelineKeyKHR                                                   ;
var vkGetPipelineBinaryDataKHR                                           :T_PFN_vkGetPipelineBinaryDataKHR                                            ;
var vkReleaseCapturedPipelineDataKHR                                     :T_PFN_vkReleaseCapturedPipelineDataKHR                                      ;

// VK_KHR_SWAPCHAIN_MAINTENANCE_1_SPEC_VERSION
var vkReleaseSwapchainImagesKHR                                          :T_PFN_vkReleaseSwapchainImagesKHR                                           ;

// VK_KHR_cooperative_matrix
var vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR                    :T_PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR                     ;

// VK_KHR_LINE_RASTERIZATION_SPEC_VERSION
var vkCmdSetLineStippleKHR                                               :T_PFN_vkCmdSetLineStippleKHR                                                ;

// VK_KHR_CALIBRATED_TIMESTAMPS_SPEC_VERSION
var vkGetPhysicalDeviceCalibrateableTimeDomainsKHR                       :T_PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR                        ;
var vkGetCalibratedTimestampsKHR                                         :T_PFN_vkGetCalibratedTimestampsKHR                                          ;

// VK_KHR_MAINTENANCE_6_SPEC_VERSION
var vkCmdBindDescriptorSets2KHR                                          :T_PFN_vkCmdBindDescriptorSets2KHR                                           ;
var vkCmdPushConstants2KHR                                               :T_PFN_vkCmdPushConstants2KHR                                                ;
var vkCmdPushDescriptorSet2KHR                                           :T_PFN_vkCmdPushDescriptorSet2KHR                                            ;
var vkCmdPushDescriptorSetWithTemplate2KHR                               :T_PFN_vkCmdPushDescriptorSetWithTemplate2KHR                                ;
var vkCmdSetDescriptorBufferOffsets2EXT                                  :T_PFN_vkCmdSetDescriptorBufferOffsets2EXT                                   ;
var vkCmdBindDescriptorBufferEmbeddedSamplers2EXT                        :T_PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT                         ;

// VK_KHR_COPY_MEMORY_INDIRECT_SPEC_VERSION
var vkCmdCopyMemoryIndirectKHR                                           :T_PFN_vkCmdCopyMemoryIndirectKHR                                            ;
var vkCmdCopyMemoryToImageIndirectKHR                                    :T_PFN_vkCmdCopyMemoryToImageIndirectKHR                                     ;

// VK_KHR_DEVICE_FAULT_SPEC_VERSION
var vkGetDeviceFaultReportsKHR                                           :T_PFN_vkGetDeviceFaultReportsKHR                                            ;
var vkGetDeviceFaultDebugInfoKHR                                         :T_PFN_vkGetDeviceFaultDebugInfoKHR                                          ;

// VK_KHR_MAINTENANCE_10_SPEC_VERSION
var vkCmdEndRendering2KHR                                                :T_PFN_vkCmdEndRendering2KHR                                                 ;

// VK_EXT_debug_report
var vkCreateDebugReportCallbackEXT                                       :T_PFN_vkCreateDebugReportCallbackEXT                                        ;
var vkDestroyDebugReportCallbackEXT                                      :T_PFN_vkDestroyDebugReportCallbackEXT                                       ;
var vkDebugReportMessageEXT                                              :T_PFN_vkDebugReportMessageEXT                                               ;

// VK_EXT_debug_marker
var vkDebugMarkerSetObjectTagEXT                                         :T_PFN_vkDebugMarkerSetObjectTagEXT                                          ;
var vkDebugMarkerSetObjectNameEXT                                        :T_PFN_vkDebugMarkerSetObjectNameEXT                                         ;
var vkCmdDebugMarkerBeginEXT                                             :T_PFN_vkCmdDebugMarkerBeginEXT                                              ;
var vkCmdDebugMarkerEndEXT                                               :T_PFN_vkCmdDebugMarkerEndEXT                                                ;
var vkCmdDebugMarkerInsertEXT                                            :T_PFN_vkCmdDebugMarkerInsertEXT                                             ;

// VK_EXT_TRANSFORM_FEEDBACK_SPEC_VERSION
var vkCmdBindTransformFeedbackBuffersEXT                                 :T_PFN_vkCmdBindTransformFeedbackBuffersEXT                                  ;
var vkCmdBeginTransformFeedbackEXT                                       :T_PFN_vkCmdBeginTransformFeedbackEXT                                        ;
var vkCmdEndTransformFeedbackEXT                                         :T_PFN_vkCmdEndTransformFeedbackEXT                                          ;
var vkCmdBeginQueryIndexedEXT                                            :T_PFN_vkCmdBeginQueryIndexedEXT                                             ;
var vkCmdEndQueryIndexedEXT                                              :T_PFN_vkCmdEndQueryIndexedEXT                                               ;
var vkCmdDrawIndirectByteCountEXT                                        :T_PFN_vkCmdDrawIndirectByteCountEXT                                         ;

// VK_NVX_binary_import
var vkCreateCuModuleNVX                                                  :T_PFN_vkCreateCuModuleNVX                                                   ;
var vkCreateCuFunctionNVX                                                :T_PFN_vkCreateCuFunctionNVX                                                 ;
var vkDestroyCuModuleNVX                                                 :T_PFN_vkDestroyCuModuleNVX                                                  ;
var vkDestroyCuFunctionNVX                                               :T_PFN_vkDestroyCuFunctionNVX                                                ;
var vkCmdCuLaunchKernelNVX                                               :T_PFN_vkCmdCuLaunchKernelNVX                                                ;

// VK_NVX_image_view_handle
var vkGetImageViewHandleNVX                                              :T_PFN_vkGetImageViewHandleNVX                                               ;
var vkGetImageViewHandle64NVX                                            :T_PFN_vkGetImageViewHandle64NVX                                             ;
var vkGetImageViewAddressNVX                                             :T_PFN_vkGetImageViewAddressNVX                                              ;
var vkGetDeviceCombinedImageSamplerIndexNVX                              :T_PFN_vkGetDeviceCombinedImageSamplerIndexNVX                               ;

// VK_AMD_draw_indirect_count
var vkCmdDrawIndirectCountAMD                                            :T_PFN_vkCmdDrawIndirectCountAMD                                             ;
var vkCmdDrawIndexedIndirectCountAMD                                     :T_PFN_vkCmdDrawIndexedIndirectCountAMD                                      ;

// VK_AMD_SHADER_INFO_SPEC_VERSION
var vkGetShaderInfoAMD                                                   :T_PFN_vkGetShaderInfoAMD                                                    ;

// VK_NV_EXTERNAL_MEMORY_CAPABILITIES_SPEC_VERSION
var vkGetPhysicalDeviceExternalImageFormatPropertiesNV                   :T_PFN_vkGetPhysicalDeviceExternalImageFormatPropertiesNV                    ;

// VK_EXT_conditional_rendering
var vkCmdBeginConditionalRenderingEXT                                    :T_PFN_vkCmdBeginConditionalRenderingEXT                                     ;
var vkCmdEndConditionalRenderingEXT                                      :T_PFN_vkCmdEndConditionalRenderingEXT                                       ;

// VK_NV_CLIP_SPACE_W_SCALING_SPEC_VERSION
var vkCmdSetViewportWScalingNV                                           :T_PFN_vkCmdSetViewportWScalingNV                                            ;

// VK_EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION
var vkReleaseDisplayEXT                                                  :T_PFN_vkReleaseDisplayEXT                                                   ;

// VK_EXT_DISPLAY_SURFACE_COUNTER_SPEC_VERSION
var vkGetPhysicalDeviceSurfaceCapabilities2EXT                           :T_PFN_vkGetPhysicalDeviceSurfaceCapabilities2EXT                            ;

// VK_EXT_DISPLAY_CONTROL_SPEC_VERSION
var vkDisplayPowerControlEXT                                             :T_PFN_vkDisplayPowerControlEXT                                              ;
var vkRegisterDeviceEventEXT                                             :T_PFN_vkRegisterDeviceEventEXT                                              ;
var vkRegisterDisplayEventEXT                                            :T_PFN_vkRegisterDisplayEventEXT                                             ;
var vkGetSwapchainCounterEXT                                             :T_PFN_vkGetSwapchainCounterEXT                                              ;

// VK_GOOGLE_DISPLAY_TIMING_SPEC_VERSION
var vkGetRefreshCycleDurationGOOGLE                                      :T_PFN_vkGetRefreshCycleDurationGOOGLE                                       ;
var vkGetPastPresentationTimingGOOGLE                                    :T_PFN_vkGetPastPresentationTimingGOOGLE                                     ;

// VK_EXT_discard_rectangles
var vkCmdSetDiscardRectangleEXT                                          :T_PFN_vkCmdSetDiscardRectangleEXT                                           ;
var vkCmdSetDiscardRectangleEnableEXT                                    :T_PFN_vkCmdSetDiscardRectangleEnableEXT                                     ;
var vkCmdSetDiscardRectangleModeEXT                                      :T_PFN_vkCmdSetDiscardRectangleModeEXT                                       ;

// VK_EXT_hdr_metadata
var vkSetHdrMetadataEXT                                                  :T_PFN_vkSetHdrMetadataEXT                                                   ;

// VK_EXT_debug_utils
var vkSetDebugUtilsObjectNameEXT                                         :T_PFN_vkSetDebugUtilsObjectNameEXT                                          ;
var vkSetDebugUtilsObjectTagEXT                                          :T_PFN_vkSetDebugUtilsObjectTagEXT                                           ;
var vkQueueBeginDebugUtilsLabelEXT                                       :T_PFN_vkQueueBeginDebugUtilsLabelEXT                                        ;
var vkQueueEndDebugUtilsLabelEXT                                         :T_PFN_vkQueueEndDebugUtilsLabelEXT                                          ;
var vkQueueInsertDebugUtilsLabelEXT                                      :T_PFN_vkQueueInsertDebugUtilsLabelEXT                                       ;
var vkCmdBeginDebugUtilsLabelEXT                                         :T_PFN_vkCmdBeginDebugUtilsLabelEXT                                          ;
var vkCmdEndDebugUtilsLabelEXT                                           :T_PFN_vkCmdEndDebugUtilsLabelEXT                                            ;
var vkCmdInsertDebugUtilsLabelEXT                                        :T_PFN_vkCmdInsertDebugUtilsLabelEXT                                         ;
var vkCreateDebugUtilsMessengerEXT                                       :T_PFN_vkCreateDebugUtilsMessengerEXT                                        ;
var vkDestroyDebugUtilsMessengerEXT                                      :T_PFN_vkDestroyDebugUtilsMessengerEXT                                       ;
var vkSubmitDebugUtilsMessageEXT                                         :T_PFN_vkSubmitDebugUtilsMessageEXT                                          ;

// VK_AMD_GPA_INTERFACE_SPEC_VERSION
var vkCreateGpaSessionAMD                                                :T_PFN_vkCreateGpaSessionAMD                                                 ;
var vkDestroyGpaSessionAMD                                               :T_PFN_vkDestroyGpaSessionAMD                                                ;
var vkSetGpaDeviceClockModeAMD                                           :T_PFN_vkSetGpaDeviceClockModeAMD                                            ;
var vkGetGpaDeviceClockInfoAMD                                           :T_PFN_vkGetGpaDeviceClockInfoAMD                                            ;
var vkCmdBeginGpaSessionAMD                                              :T_PFN_vkCmdBeginGpaSessionAMD                                               ;
var vkCmdEndGpaSessionAMD                                                :T_PFN_vkCmdEndGpaSessionAMD                                                 ;
var vkCmdBeginGpaSampleAMD                                               :T_PFN_vkCmdBeginGpaSampleAMD                                                ;
var vkCmdEndGpaSampleAMD                                                 :T_PFN_vkCmdEndGpaSampleAMD                                                  ;
var vkGetGpaSessionStatusAMD                                             :T_PFN_vkGetGpaSessionStatusAMD                                              ;
var vkGetGpaSessionResultsAMD                                            :T_PFN_vkGetGpaSessionResultsAMD                                             ;
var vkResetGpaSessionAMD                                                 :T_PFN_vkResetGpaSessionAMD                                                  ;
var vkCmdCopyGpaSessionResultsAMD                                        :T_PFN_vkCmdCopyGpaSessionResultsAMD                                         ;

// VK_EXT_DESCRIPTOR_HEAP_SPEC_VERSION
var vkWriteSamplerDescriptorsEXT                                         :T_PFN_vkWriteSamplerDescriptorsEXT                                          ;
var vkWriteResourceDescriptorsEXT                                        :T_PFN_vkWriteResourceDescriptorsEXT                                         ;
var vkCmdBindSamplerHeapEXT                                              :T_PFN_vkCmdBindSamplerHeapEXT                                               ;
var vkCmdBindResourceHeapEXT                                             :T_PFN_vkCmdBindResourceHeapEXT                                              ;
var vkCmdPushDataEXT                                                     :T_PFN_vkCmdPushDataEXT                                                      ;
var vkGetImageOpaqueCaptureDataEXT                                       :T_PFN_vkGetImageOpaqueCaptureDataEXT                                        ;
var vkGetPhysicalDeviceDescriptorSizeEXT                                 :T_PFN_vkGetPhysicalDeviceDescriptorSizeEXT                                  ;
var vkRegisterCustomBorderColorEXT                                       :T_PFN_vkRegisterCustomBorderColorEXT                                        ;
var vkUnregisterCustomBorderColorEXT                                     :T_PFN_vkUnregisterCustomBorderColorEXT                                      ;
var vkGetTensorOpaqueCaptureDataARM                                      :T_PFN_vkGetTensorOpaqueCaptureDataARM                                       ;

// VK_EXT_SAMPLE_LOCATIONS_SPEC_VERSION
var vkCmdSetSampleLocationsEXT                                           :T_PFN_vkCmdSetSampleLocationsEXT                                            ;
var vkGetPhysicalDeviceMultisamplePropertiesEXT                          :T_PFN_vkGetPhysicalDeviceMultisamplePropertiesEXT                           ;

// VK_EXT_image_drm_format_modifier
var vkGetImageDrmFormatModifierPropertiesEXT                             :T_PFN_vkGetImageDrmFormatModifierPropertiesEXT                              ;

// VK_EXT_VALIDATION_CACHE_SPEC_VERSION
var vkCreateValidationCacheEXT                                           :T_PFN_vkCreateValidationCacheEXT                                            ;
var vkDestroyValidationCacheEXT                                          :T_PFN_vkDestroyValidationCacheEXT                                           ;
var vkMergeValidationCachesEXT                                           :T_PFN_vkMergeValidationCachesEXT                                            ;
var vkGetValidationCacheDataEXT                                          :T_PFN_vkGetValidationCacheDataEXT                                           ;

// VK_NV_shading_rate_image
var vkCmdBindShadingRateImageNV                                          :T_PFN_vkCmdBindShadingRateImageNV                                           ;
var vkCmdSetViewportShadingRatePaletteNV                                 :T_PFN_vkCmdSetViewportShadingRatePaletteNV                                  ;
var vkCmdSetCoarseSampleOrderNV                                          :T_PFN_vkCmdSetCoarseSampleOrderNV                                           ;

// VK_NV_ray_tracing
var vkCreateAccelerationStructureNV                                      :T_PFN_vkCreateAccelerationStructureNV                                       ;
var vkDestroyAccelerationStructureNV                                     :T_PFN_vkDestroyAccelerationStructureNV                                      ;
var vkGetAccelerationStructureMemoryRequirementsNV                       :T_PFN_vkGetAccelerationStructureMemoryRequirementsNV                        ;
var vkBindAccelerationStructureMemoryNV                                  :T_PFN_vkBindAccelerationStructureMemoryNV                                   ;
var vkCmdBuildAccelerationStructureNV                                    :T_PFN_vkCmdBuildAccelerationStructureNV                                     ;
var vkCmdCopyAccelerationStructureNV                                     :T_PFN_vkCmdCopyAccelerationStructureNV                                      ;
var vkCmdTraceRaysNV                                                     :T_PFN_vkCmdTraceRaysNV                                                      ;
var vkCreateRayTracingPipelinesNV                                        :T_PFN_vkCreateRayTracingPipelinesNV                                         ;
var vkGetRayTracingShaderGroupHandlesKHR                                 :T_PFN_vkGetRayTracingShaderGroupHandlesKHR                                  ;
var vkGetRayTracingShaderGroupHandlesNV                                  :T_PFN_vkGetRayTracingShaderGroupHandlesNV                                   ;
var vkGetAccelerationStructureHandleNV                                   :T_PFN_vkGetAccelerationStructureHandleNV                                    ;
var vkCmdWriteAccelerationStructuresPropertiesNV                         :T_PFN_vkCmdWriteAccelerationStructuresPropertiesNV                          ;
var vkCompileDeferredNV                                                  :T_PFN_vkCompileDeferredNV                                                   ;

// VK_EXT_EXTERNAL_MEMORY_HOST_SPEC_VERSION
var vkGetMemoryHostPointerPropertiesEXT                                  :T_PFN_vkGetMemoryHostPointerPropertiesEXT                                   ;

// VK_AMD_BUFFER_MARKER_SPEC_VERSION
var vkCmdWriteBufferMarkerAMD                                            :T_PFN_vkCmdWriteBufferMarkerAMD                                             ;
var vkCmdWriteBufferMarker2AMD                                           :T_PFN_vkCmdWriteBufferMarker2AMD                                            ;

// VK_EXT_calibrated_timestamps
var vkGetPhysicalDeviceCalibrateableTimeDomainsEXT                       :T_PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT                        ;
var vkGetCalibratedTimestampsEXT                                         :T_PFN_vkGetCalibratedTimestampsEXT                                          ;

// VK_NV_MESH_SHADER_SPEC_VERSION
var vkCmdDrawMeshTasksNV                                                 :T_PFN_vkCmdDrawMeshTasksNV                                                  ;
var vkCmdDrawMeshTasksIndirectNV                                         :T_PFN_vkCmdDrawMeshTasksIndirectNV                                          ;
var vkCmdDrawMeshTasksIndirectCountNV                                    :T_PFN_vkCmdDrawMeshTasksIndirectCountNV                                     ;

// VK_NV_scissor_exclusive
var vkCmdSetExclusiveScissorEnableNV                                     :T_PFN_vkCmdSetExclusiveScissorEnableNV                                      ;
var vkCmdSetExclusiveScissorNV                                           :T_PFN_vkCmdSetExclusiveScissorNV                                            ;

// VK_NV_device_diagnostic_checkpoints
var vkCmdSetCheckpointNV                                                 :T_PFN_vkCmdSetCheckpointNV                                                  ;
var vkGetQueueCheckpointDataNV                                           :T_PFN_vkGetQueueCheckpointDataNV                                            ;
var vkGetQueueCheckpointData2NV                                          :T_PFN_vkGetQueueCheckpointData2NV                                           ;

// VK_EXT_present_timing
var vkSetSwapchainPresentTimingQueueSizeEXT                              :T_PFN_vkSetSwapchainPresentTimingQueueSizeEXT                               ;
var vkGetSwapchainTimingPropertiesEXT                                    :T_PFN_vkGetSwapchainTimingPropertiesEXT                                     ;
var vkGetSwapchainTimeDomainPropertiesEXT                                :T_PFN_vkGetSwapchainTimeDomainPropertiesEXT                                 ;
var vkGetPastPresentationTimingEXT                                       :T_PFN_vkGetPastPresentationTimingEXT                                        ;

// VK_INTEL_performance_query
var vkInitializePerformanceApiINTEL                                      :T_PFN_vkInitializePerformanceApiINTEL                                       ;
var vkUninitializePerformanceApiINTEL                                    :T_PFN_vkUninitializePerformanceApiINTEL                                     ;
var vkCmdSetPerformanceMarkerINTEL                                       :T_PFN_vkCmdSetPerformanceMarkerINTEL                                        ;
var vkCmdSetPerformanceStreamMarkerINTEL                                 :T_PFN_vkCmdSetPerformanceStreamMarkerINTEL                                  ;
var vkCmdSetPerformanceOverrideINTEL                                     :T_PFN_vkCmdSetPerformanceOverrideINTEL                                      ;
var vkAcquirePerformanceConfigurationINTEL                               :T_PFN_vkAcquirePerformanceConfigurationINTEL                                ;
var vkReleasePerformanceConfigurationINTEL                               :T_PFN_vkReleasePerformanceConfigurationINTEL                                ;
var vkQueueSetPerformanceConfigurationINTEL                              :T_PFN_vkQueueSetPerformanceConfigurationINTEL                               ;
var vkGetPerformanceParameterINTEL                                       :T_PFN_vkGetPerformanceParameterINTEL                                        ;

// VK_AMD_DISPLAY_NATIVE_HDR_SPEC_VERSION
var vkSetLocalDimmingAMD                                                 :T_PFN_vkSetLocalDimmingAMD                                                  ;

// VK_EXT_buffer_device_address
var vkGetBufferDeviceAddressEXT                                          :T_PFN_vkGetBufferDeviceAddressEXT                                           ;

// VK_EXT_TOOLING_INFO_SPEC_VERSION
var vkGetPhysicalDeviceToolPropertiesEXT                                 :T_PFN_vkGetPhysicalDeviceToolPropertiesEXT                                  ;

// VK_NV_COOPERATIVE_MATRIX_SPEC_VERSION
var vkGetPhysicalDeviceCooperativeMatrixPropertiesNV                     :T_PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV                      ;

// VK_NV_COVERAGE_REDUCTION_MODE_SPEC_VERSION
var vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV    :T_PFN_vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV     ;

// VK_EXT_HEADLESS_SURFACE_SPEC_VERSION
var vkCreateHeadlessSurfaceEXT                                           :T_PFN_vkCreateHeadlessSurfaceEXT                                            ;

// VK_EXT_LINE_RASTERIZATION_SPEC_VERSION
var vkCmdSetLineStippleEXT                                               :T_PFN_vkCmdSetLineStippleEXT                                                ;

// VK_EXT_HOST_QUERY_RESET_SPEC_VERSION
var vkResetQueryPoolEXT                                                  :T_PFN_vkResetQueryPoolEXT                                                   ;

// VK_EXT_EXTENDED_DYNAMIC_STATE_SPEC_VERSION
var vkCmdSetCullModeEXT                                                  :T_PFN_vkCmdSetCullModeEXT                                                   ;
var vkCmdSetFrontFaceEXT                                                 :T_PFN_vkCmdSetFrontFaceEXT                                                  ;
var vkCmdSetPrimitiveTopologyEXT                                         :T_PFN_vkCmdSetPrimitiveTopologyEXT                                          ;
var vkCmdSetViewportWithCountEXT                                         :T_PFN_vkCmdSetViewportWithCountEXT                                          ;
var vkCmdSetScissorWithCountEXT                                          :T_PFN_vkCmdSetScissorWithCountEXT                                           ;
var vkCmdBindVertexBuffers2EXT                                           :T_PFN_vkCmdBindVertexBuffers2EXT                                            ;
var vkCmdSetDepthTestEnableEXT                                           :T_PFN_vkCmdSetDepthTestEnableEXT                                            ;
var vkCmdSetDepthWriteEnableEXT                                          :T_PFN_vkCmdSetDepthWriteEnableEXT                                           ;
var vkCmdSetDepthCompareOpEXT                                            :T_PFN_vkCmdSetDepthCompareOpEXT                                             ;
var vkCmdSetDepthBoundsTestEnableEXT                                     :T_PFN_vkCmdSetDepthBoundsTestEnableEXT                                      ;
var vkCmdSetStencilTestEnableEXT                                         :T_PFN_vkCmdSetStencilTestEnableEXT                                          ;
var vkCmdSetStencilOpEXT                                                 :T_PFN_vkCmdSetStencilOpEXT                                                  ;

// VK_EXT_HOST_IMAGE_COPY_SPEC_VERSION
var vkCopyMemoryToImageEXT                                               :T_PFN_vkCopyMemoryToImageEXT                                                ;
var vkCopyImageToMemoryEXT                                               :T_PFN_vkCopyImageToMemoryEXT                                                ;
var vkCopyImageToImageEXT                                                :T_PFN_vkCopyImageToImageEXT                                                 ;
var vkTransitionImageLayoutEXT                                           :T_PFN_vkTransitionImageLayoutEXT                                            ;
var vkGetImageSubresourceLayout2EXT                                      :T_PFN_vkGetImageSubresourceLayout2EXT                                       ;

// VK_EXT_SWAPCHAIN_MAINTENANCE_1_SPEC_VERSION
var vkReleaseSwapchainImagesEXT                                          :T_PFN_vkReleaseSwapchainImagesEXT                                           ;

// VK_NV_device_generated_commands
var vkGetGeneratedCommandsMemoryRequirementsNV                           :T_PFN_vkGetGeneratedCommandsMemoryRequirementsNV                            ;
var vkCmdPreprocessGeneratedCommandsNV                                   :T_PFN_vkCmdPreprocessGeneratedCommandsNV                                    ;
var vkCmdExecuteGeneratedCommandsNV                                      :T_PFN_vkCmdExecuteGeneratedCommandsNV                                       ;
var vkCmdBindPipelineShaderGroupNV                                       :T_PFN_vkCmdBindPipelineShaderGroupNV                                        ;
var vkCreateIndirectCommandsLayoutNV                                     :T_PFN_vkCreateIndirectCommandsLayoutNV                                      ;
var vkDestroyIndirectCommandsLayoutNV                                    :T_PFN_vkDestroyIndirectCommandsLayoutNV                                     ;

// VK_EXT_DEPTH_BIAS_CONTROL_SPEC_VERSION
var vkCmdSetDepthBias2EXT                                                :T_PFN_vkCmdSetDepthBias2EXT                                                 ;

// VK_EXT_ACQUIRE_DRM_DISPLAY_SPEC_VERSION
var vkAcquireDrmDisplayEXT                                               :T_PFN_vkAcquireDrmDisplayEXT                                                ;
var vkGetDrmDisplayEXT                                                   :T_PFN_vkGetDrmDisplayEXT                                                    ;

// VK_EXT_PRIVATE_DATA_SPEC_VERSION
var vkCreatePrivateDataSlotEXT                                           :T_PFN_vkCreatePrivateDataSlotEXT                                            ;
var vkDestroyPrivateDataSlotEXT                                          :T_PFN_vkDestroyPrivateDataSlotEXT                                           ;
var vkSetPrivateDataEXT                                                  :T_PFN_vkSetPrivateDataEXT                                                   ;
var vkGetPrivateDataEXT                                                  :T_PFN_vkGetPrivateDataEXT                                                   ;

// VK_QCOM_QUEUE_PERF_HINT_SPEC_VERSION
var vkQueueSetPerfHintQCOM                                               :T_PFN_vkQueueSetPerfHintQCOM                                                ;

// VK_QCOM_tile_shading
var vkCmdDispatchTileQCOM                                                :T_PFN_vkCmdDispatchTileQCOM                                                 ;
var vkCmdBeginPerTileExecutionQCOM                                       :T_PFN_vkCmdBeginPerTileExecutionQCOM                                        ;
var vkCmdEndPerTileExecutionQCOM                                         :T_PFN_vkCmdEndPerTileExecutionQCOM                                          ;

// VK_NV_low_latency
var vkSetLatencySleepModeLegacyNV                                        :T_PFN_vkSetLatencySleepModeLegacyNV                                         ;
var vkLatencySleepLegacyNV                                               :T_PFN_vkLatencySleepLegacyNV                                                ;
var vkSetLatencyMarkerLegacyNV                                           :T_PFN_vkSetLatencyMarkerLegacyNV                                            ;
var vkGetLatencyTimingsLegacyNV                                          :T_PFN_vkGetLatencyTimingsLegacyNV                                           ;
var vkQueueNotifyOutOfBandLegacyNV                                       :T_PFN_vkQueueNotifyOutOfBandLegacyNV                                        ;
var vkGetSleepStatusLegacyNV                                             :T_PFN_vkGetSleepStatusLegacyNV                                              ;
var vkShutdownLatencyDeviceLegacyNV                                      :T_PFN_vkShutdownLatencyDeviceLegacyNV                                       ;

// VK_EXT_DESCRIPTOR_BUFFER_SPEC_VERSION
var vkGetDescriptorSetLayoutSizeEXT                                      :T_PFN_vkGetDescriptorSetLayoutSizeEXT                                       ;
var vkGetDescriptorSetLayoutBindingOffsetEXT                             :T_PFN_vkGetDescriptorSetLayoutBindingOffsetEXT                              ;
var vkGetDescriptorEXT                                                   :T_PFN_vkGetDescriptorEXT                                                    ;
var vkCmdBindDescriptorBuffersEXT                                        :T_PFN_vkCmdBindDescriptorBuffersEXT                                         ;
var vkCmdSetDescriptorBufferOffsetsEXT                                   :T_PFN_vkCmdSetDescriptorBufferOffsetsEXT                                    ;
var vkCmdBindDescriptorBufferEmbeddedSamplersEXT                         :T_PFN_vkCmdBindDescriptorBufferEmbeddedSamplersEXT                          ;
var vkGetBufferOpaqueCaptureDescriptorDataEXT                            :T_PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT                             ;
var vkGetImageOpaqueCaptureDescriptorDataEXT                             :T_PFN_vkGetImageOpaqueCaptureDescriptorDataEXT                              ;
var vkGetImageViewOpaqueCaptureDescriptorDataEXT                         :T_PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT                          ;
var vkGetSamplerOpaqueCaptureDescriptorDataEXT                           :T_PFN_vkGetSamplerOpaqueCaptureDescriptorDataEXT                            ;
var vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT             :T_PFN_vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT              ;

// VK_NV_FRAGMENT_SHADING_RATE_ENUMS_SPEC_VERSION
var vkCmdSetFragmentShadingRateEnumNV                                    :T_PFN_vkCmdSetFragmentShadingRateEnumNV                                     ;

// VK_EXT_device_fault
var vkGetDeviceFaultInfoEXT                                              :T_PFN_vkGetDeviceFaultInfoEXT                                               ;

// VK_EXT_vertex_input_dynamic_state
var vkCmdSetVertexInputEXT                                               :T_PFN_vkCmdSetVertexInputEXT                                                ;

// VK_HUAWEI_subpass_shading
var vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI                      :T_PFN_vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI                       ;
var vkCmdSubpassShadingHUAWEI                                            :T_PFN_vkCmdSubpassShadingHUAWEI                                             ;

// VK_HUAWEI_INVOCATION_MASK_SPEC_VERSION
var vkCmdBindInvocationMaskHUAWEI                                        :T_PFN_vkCmdBindInvocationMaskHUAWEI                                         ;

// VK_NV_EXTERNAL_MEMORY_RDMA_SPEC_VERSION
var vkGetMemoryRemoteAddressNV                                           :T_PFN_vkGetMemoryRemoteAddressNV                                            ;

// VK_EXT_PIPELINE_PROPERTIES_SPEC_VERSION
var vkGetPipelinePropertiesEXT                                           :T_PFN_vkGetPipelinePropertiesEXT                                            ;

// VK_EXT_EXTENDED_DYNAMIC_STATE_2_SPEC_VERSION
var vkCmdSetPatchControlPointsEXT                                        :T_PFN_vkCmdSetPatchControlPointsEXT                                         ;
var vkCmdSetRasterizerDiscardEnableEXT                                   :T_PFN_vkCmdSetRasterizerDiscardEnableEXT                                    ;
var vkCmdSetDepthBiasEnableEXT                                           :T_PFN_vkCmdSetDepthBiasEnableEXT                                            ;
var vkCmdSetLogicOpEXT                                                   :T_PFN_vkCmdSetLogicOpEXT                                                    ;
var vkCmdSetPrimitiveRestartEnableEXT                                    :T_PFN_vkCmdSetPrimitiveRestartEnableEXT                                     ;

// VK_EXT_COLOR_WRITE_ENABLE_SPEC_VERSION
var vkCmdSetColorWriteEnableEXT                                          :T_PFN_vkCmdSetColorWriteEnableEXT                                           ;

// VK_EXT_MULTI_DRAW_SPEC_VERSION
var vkCmdDrawMultiEXT                                                    :T_PFN_vkCmdDrawMultiEXT                                                     ;
var vkCmdDrawMultiIndexedEXT                                             :T_PFN_vkCmdDrawMultiIndexedEXT                                              ;

// VK_EXT_opacity_micromap
var vkCreateMicromapEXT                                                  :T_PFN_vkCreateMicromapEXT                                                   ;
var vkDestroyMicromapEXT                                                 :T_PFN_vkDestroyMicromapEXT                                                  ;
var vkCmdBuildMicromapsEXT                                               :T_PFN_vkCmdBuildMicromapsEXT                                                ;
var vkBuildMicromapsEXT                                                  :T_PFN_vkBuildMicromapsEXT                                                   ;
var vkCopyMicromapEXT                                                    :T_PFN_vkCopyMicromapEXT                                                     ;
var vkCopyMicromapToMemoryEXT                                            :T_PFN_vkCopyMicromapToMemoryEXT                                             ;
var vkCopyMemoryToMicromapEXT                                            :T_PFN_vkCopyMemoryToMicromapEXT                                             ;
var vkWriteMicromapsPropertiesEXT                                        :T_PFN_vkWriteMicromapsPropertiesEXT                                         ;
var vkCmdCopyMicromapEXT                                                 :T_PFN_vkCmdCopyMicromapEXT                                                  ;
var vkCmdCopyMicromapToMemoryEXT                                         :T_PFN_vkCmdCopyMicromapToMemoryEXT                                          ;
var vkCmdCopyMemoryToMicromapEXT                                         :T_PFN_vkCmdCopyMemoryToMicromapEXT                                          ;
var vkCmdWriteMicromapsPropertiesEXT                                     :T_PFN_vkCmdWriteMicromapsPropertiesEXT                                      ;
var vkGetDeviceMicromapCompatibilityEXT                                  :T_PFN_vkGetDeviceMicromapCompatibilityEXT                                   ;
var vkGetMicromapBuildSizesEXT                                           :T_PFN_vkGetMicromapBuildSizesEXT                                            ;

// VK_HUAWEI_cluster_culling_shader
var vkCmdDrawClusterHUAWEI                                               :T_PFN_vkCmdDrawClusterHUAWEI                                                ;
var vkCmdDrawClusterIndirectHUAWEI                                       :T_PFN_vkCmdDrawClusterIndirectHUAWEI                                        ;

// VK_EXT_PAGEABLE_DEVICE_LOCAL_MEMORY_SPEC_VERSION
var vkSetDeviceMemoryPriorityEXT                                         :T_PFN_vkSetDeviceMemoryPriorityEXT                                          ;

// VK_ARM_scheduling_controls
var vkCmdSetDispatchParametersARM                                        :T_PFN_vkCmdSetDispatchParametersARM                                         ;

// VK_VALVE_DESCRIPTOR_SET_HOST_MAPPING_SPEC_VERSION
var vkGetDescriptorSetLayoutHostMappingInfoVALVE                         :T_PFN_vkGetDescriptorSetLayoutHostMappingInfoVALVE                          ;
var vkGetDescriptorSetHostMappingVALVE                                   :T_PFN_vkGetDescriptorSetHostMappingVALVE                                    ;

// VK_NV_COPY_MEMORY_INDIRECT_SPEC_VERSION
var vkCmdCopyMemoryIndirectNV                                            :T_PFN_vkCmdCopyMemoryIndirectNV                                             ;
var vkCmdCopyMemoryToImageIndirectNV                                     :T_PFN_vkCmdCopyMemoryToImageIndirectNV                                      ;

// VK_NV_MEMORY_DECOMPRESSION_SPEC_VERSION
var vkCmdDecompressMemoryNV                                              :T_PFN_vkCmdDecompressMemoryNV                                               ;
var vkCmdDecompressMemoryIndirectCountNV                                 :T_PFN_vkCmdDecompressMemoryIndirectCountNV                                  ;

// VK_NV_device_generated_commands_compute
var vkGetPipelineIndirectMemoryRequirementsNV                            :T_PFN_vkGetPipelineIndirectMemoryRequirementsNV                             ;
var vkCmdUpdatePipelineIndirectBufferNV                                  :T_PFN_vkCmdUpdatePipelineIndirectBufferNV                                   ;
var vkGetPipelineIndirectDeviceAddressNV                                 :T_PFN_vkGetPipelineIndirectDeviceAddressNV                                  ;

// VK_EXT_extended_dynamic_state3
var vkCmdSetDepthClampEnableEXT                                          :T_PFN_vkCmdSetDepthClampEnableEXT                                           ;
var vkCmdSetPolygonModeEXT                                               :T_PFN_vkCmdSetPolygonModeEXT                                                ;
var vkCmdSetRasterizationSamplesEXT                                      :T_PFN_vkCmdSetRasterizationSamplesEXT                                       ;
var vkCmdSetSampleMaskEXT                                                :T_PFN_vkCmdSetSampleMaskEXT                                                 ;
var vkCmdSetAlphaToCoverageEnableEXT                                     :T_PFN_vkCmdSetAlphaToCoverageEnableEXT                                      ;
var vkCmdSetAlphaToOneEnableEXT                                          :T_PFN_vkCmdSetAlphaToOneEnableEXT                                           ;
var vkCmdSetLogicOpEnableEXT                                             :T_PFN_vkCmdSetLogicOpEnableEXT                                              ;
var vkCmdSetColorBlendEnableEXT                                          :T_PFN_vkCmdSetColorBlendEnableEXT                                           ;
var vkCmdSetColorBlendEquationEXT                                        :T_PFN_vkCmdSetColorBlendEquationEXT                                         ;
var vkCmdSetColorWriteMaskEXT                                            :T_PFN_vkCmdSetColorWriteMaskEXT                                             ;
var vkCmdSetTessellationDomainOriginEXT                                  :T_PFN_vkCmdSetTessellationDomainOriginEXT                                   ;
var vkCmdSetRasterizationStreamEXT                                       :T_PFN_vkCmdSetRasterizationStreamEXT                                        ;
var vkCmdSetConservativeRasterizationModeEXT                             :T_PFN_vkCmdSetConservativeRasterizationModeEXT                              ;
var vkCmdSetExtraPrimitiveOverestimationSizeEXT                          :T_PFN_vkCmdSetExtraPrimitiveOverestimationSizeEXT                           ;
var vkCmdSetDepthClipEnableEXT                                           :T_PFN_vkCmdSetDepthClipEnableEXT                                            ;
var vkCmdSetSampleLocationsEnableEXT                                     :T_PFN_vkCmdSetSampleLocationsEnableEXT                                      ;
var vkCmdSetColorBlendAdvancedEXT                                        :T_PFN_vkCmdSetColorBlendAdvancedEXT                                         ;
var vkCmdSetProvokingVertexModeEXT                                       :T_PFN_vkCmdSetProvokingVertexModeEXT                                        ;
var vkCmdSetLineRasterizationModeEXT                                     :T_PFN_vkCmdSetLineRasterizationModeEXT                                      ;
var vkCmdSetLineStippleEnableEXT                                         :T_PFN_vkCmdSetLineStippleEnableEXT                                          ;
var vkCmdSetDepthClipNegativeOneToOneEXT                                 :T_PFN_vkCmdSetDepthClipNegativeOneToOneEXT                                  ;
var vkCmdSetViewportWScalingEnableNV                                     :T_PFN_vkCmdSetViewportWScalingEnableNV                                      ;
var vkCmdSetViewportSwizzleNV                                            :T_PFN_vkCmdSetViewportSwizzleNV                                             ;
var vkCmdSetCoverageToColorEnableNV                                      :T_PFN_vkCmdSetCoverageToColorEnableNV                                       ;
var vkCmdSetCoverageToColorLocationNV                                    :T_PFN_vkCmdSetCoverageToColorLocationNV                                     ;
var vkCmdSetCoverageModulationModeNV                                     :T_PFN_vkCmdSetCoverageModulationModeNV                                      ;
var vkCmdSetCoverageModulationTableEnableNV                              :T_PFN_vkCmdSetCoverageModulationTableEnableNV                               ;
var vkCmdSetCoverageModulationTableNV                                    :T_PFN_vkCmdSetCoverageModulationTableNV                                     ;
var vkCmdSetShadingRateImageEnableNV                                     :T_PFN_vkCmdSetShadingRateImageEnableNV                                      ;
var vkCmdSetRepresentativeFragmentTestEnableNV                           :T_PFN_vkCmdSetRepresentativeFragmentTestEnableNV                            ;
var vkCmdSetCoverageReductionModeNV                                      :T_PFN_vkCmdSetCoverageReductionModeNV                                       ;

// VK_ARM_tensors
var vkCreateTensorARM                                                    :T_PFN_vkCreateTensorARM                                                     ;
var vkDestroyTensorARM                                                   :T_PFN_vkDestroyTensorARM                                                    ;
var vkCreateTensorViewARM                                                :T_PFN_vkCreateTensorViewARM                                                 ;
var vkDestroyTensorViewARM                                               :T_PFN_vkDestroyTensorViewARM                                                ;
var vkGetTensorMemoryRequirementsARM                                     :T_PFN_vkGetTensorMemoryRequirementsARM                                      ;
var vkBindTensorMemoryARM                                                :T_PFN_vkBindTensorMemoryARM                                                 ;
var vkGetDeviceTensorMemoryRequirementsARM                               :T_PFN_vkGetDeviceTensorMemoryRequirementsARM                                ;
var vkCmdCopyTensorARM                                                   :T_PFN_vkCmdCopyTensorARM                                                    ;
var vkGetPhysicalDeviceExternalTensorPropertiesARM                       :T_PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM                        ;
var vkGetTensorOpaqueCaptureDescriptorDataARM                            :T_PFN_vkGetTensorOpaqueCaptureDescriptorDataARM                             ;
var vkGetTensorViewOpaqueCaptureDescriptorDataARM                        :T_PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM                         ;

// VK_EXT_SHADER_MODULE_IDENTIFIER_SPEC_VERSION
var vkGetShaderModuleIdentifierEXT                                       :T_PFN_vkGetShaderModuleIdentifierEXT                                        ;
var vkGetShaderModuleCreateInfoIdentifierEXT                             :T_PFN_vkGetShaderModuleCreateInfoIdentifierEXT                              ;

// VK_NV_OPTICAL_FLOW_SPEC_VERSION
var vkGetPhysicalDeviceOpticalFlowImageFormatsNV                         :T_PFN_vkGetPhysicalDeviceOpticalFlowImageFormatsNV                          ;
var vkCreateOpticalFlowSessionNV                                         :T_PFN_vkCreateOpticalFlowSessionNV                                          ;
var vkDestroyOpticalFlowSessionNV                                        :T_PFN_vkDestroyOpticalFlowSessionNV                                         ;
var vkBindOpticalFlowSessionImageNV                                      :T_PFN_vkBindOpticalFlowSessionImageNV                                       ;
var vkCmdOpticalFlowExecuteNV                                            :T_PFN_vkCmdOpticalFlowExecuteNV                                             ;

// VK_AMD_ANTI_LAG_SPEC_VERSION
var vkAntiLagUpdateAMD                                                   :T_PFN_vkAntiLagUpdateAMD                                                    ;

// VK_EXT_SHADER_OBJECT_SPEC_VERSION
var vkCreateShadersEXT                                                   :T_PFN_vkCreateShadersEXT                                                    ;
var vkDestroyShaderEXT                                                   :T_PFN_vkDestroyShaderEXT                                                    ;
var vkGetShaderBinaryDataEXT                                             :T_PFN_vkGetShaderBinaryDataEXT                                              ;
var vkCmdBindShadersEXT                                                  :T_PFN_vkCmdBindShadersEXT                                                   ;
var vkCmdSetDepthClampRangeEXT                                           :T_PFN_vkCmdSetDepthClampRangeEXT                                            ;

// VK_QCOM_TILE_PROPERTIES_SPEC_VERSION
var vkGetFramebufferTilePropertiesQCOM                                   :T_PFN_vkGetFramebufferTilePropertiesQCOM                                    ;
var vkGetDynamicRenderingTilePropertiesQCOM                              :T_PFN_vkGetDynamicRenderingTilePropertiesQCOM                               ;

// VK_NV_cooperative_vector
var vkGetPhysicalDeviceCooperativeVectorPropertiesNV                     :T_PFN_vkGetPhysicalDeviceCooperativeVectorPropertiesNV                      ;
var vkConvertCooperativeVectorMatrixNV                                   :T_PFN_vkConvertCooperativeVectorMatrixNV                                    ;
var vkCmdConvertCooperativeVectorMatrixNV                                :T_PFN_vkCmdConvertCooperativeVectorMatrixNV                                 ;

// VK_NV_low_latency2
var vkSetLatencySleepModeNV                                              :T_PFN_vkSetLatencySleepModeNV                                               ;
var vkLatencySleepNV                                                     :T_PFN_vkLatencySleepNV                                                      ;
var vkSetLatencyMarkerNV                                                 :T_PFN_vkSetLatencyMarkerNV                                                  ;
var vkGetLatencyTimingsNV                                                :T_PFN_vkGetLatencyTimingsNV                                                 ;
var vkQueueNotifyOutOfBandNV                                             :T_PFN_vkQueueNotifyOutOfBandNV                                              ;

// VK_ARM_DATA_GRAPH_SPEC_VERSION
var vkCreateDataGraphPipelinesARM                                        :T_PFN_vkCreateDataGraphPipelinesARM                                         ;
var vkCreateDataGraphPipelineSessionARM                                  :T_PFN_vkCreateDataGraphPipelineSessionARM                                   ;
var vkGetDataGraphPipelineSessionBindPointRequirementsARM                :T_PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM                 ;
var vkGetDataGraphPipelineSessionMemoryRequirementsARM                   :T_PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM                    ;
var vkBindDataGraphPipelineSessionMemoryARM                              :T_PFN_vkBindDataGraphPipelineSessionMemoryARM                               ;
var vkDestroyDataGraphPipelineSessionARM                                 :T_PFN_vkDestroyDataGraphPipelineSessionARM                                  ;
var vkCmdDispatchDataGraphARM                                            :T_PFN_vkCmdDispatchDataGraphARM                                             ;
var vkGetDataGraphPipelineAvailablePropertiesARM                         :T_PFN_vkGetDataGraphPipelineAvailablePropertiesARM                          ;
var vkGetDataGraphPipelinePropertiesARM                                  :T_PFN_vkGetDataGraphPipelinePropertiesARM                                   ;
var vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM                 :T_PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM                  ;
var vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM :T_PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM  ;

// VK_ARM_DATA_GRAPH_INSTRUCTION_SET_TOSA_SPEC_VERSION
var vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM  :T_PFN_vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM   ;

// VK_EXT_ATTACHMENT_FEEDBACK_LOOP_DYNAMIC_STATE_SPEC_VERSION
var vkCmdSetAttachmentFeedbackLoopEnableEXT                              :T_PFN_vkCmdSetAttachmentFeedbackLoopEnableEXT                               ;

// VK_QCOM_TILE_MEMORY_HEAP_SPEC_VERSION
var vkCmdBindTileMemoryQCOM                                              :T_PFN_vkCmdBindTileMemoryQCOM                                               ;

// VK_EXT_MEMORY_DECOMPRESSION_SPEC_VERSION
var vkCmdDecompressMemoryEXT                                             :T_PFN_vkCmdDecompressMemoryEXT                                              ;
var vkCmdDecompressMemoryIndirectCountEXT                                :T_PFN_vkCmdDecompressMemoryIndirectCountEXT                                 ;

// VK_NV_EXTERNAL_COMPUTE_QUEUE_SPEC_VERSION
var vkCreateExternalComputeQueueNV                                       :T_PFN_vkCreateExternalComputeQueueNV                                        ;
var vkDestroyExternalComputeQueueNV                                      :T_PFN_vkDestroyExternalComputeQueueNV                                       ;
var vkGetExternalComputeQueueDataNV                                      :T_PFN_vkGetExternalComputeQueueDataNV                                       ;

// VK_NV_cluster_acceleration_structure
var vkGetClusterAccelerationStructureBuildSizesNV                        :T_PFN_vkGetClusterAccelerationStructureBuildSizesNV                         ;
var vkCmdBuildClusterAccelerationStructureIndirectNV                     :T_PFN_vkCmdBuildClusterAccelerationStructureIndirectNV                      ;

// VK_NV_PARTITIONED_ACCELERATION_STRUCTURE_SPEC_VERSION
var vkGetPartitionedAccelerationStructuresBuildSizesNV                   :T_PFN_vkGetPartitionedAccelerationStructuresBuildSizesNV                    ;
var vkCmdBuildPartitionedAccelerationStructuresNV                        :T_PFN_vkCmdBuildPartitionedAccelerationStructuresNV                         ;

// VK_EXT_DEVICE_GENERATED_COMMANDS_SPEC_VERSION
var vkGetGeneratedCommandsMemoryRequirementsEXT                          :T_PFN_vkGetGeneratedCommandsMemoryRequirementsEXT                           ;
var vkCmdPreprocessGeneratedCommandsEXT                                  :T_PFN_vkCmdPreprocessGeneratedCommandsEXT                                   ;
var vkCmdExecuteGeneratedCommandsEXT                                     :T_PFN_vkCmdExecuteGeneratedCommandsEXT                                      ;
var vkCreateIndirectCommandsLayoutEXT                                    :T_PFN_vkCreateIndirectCommandsLayoutEXT                                     ;
var vkDestroyIndirectCommandsLayoutEXT                                   :T_PFN_vkDestroyIndirectCommandsLayoutEXT                                    ;
var vkCreateIndirectExecutionSetEXT                                      :T_PFN_vkCreateIndirectExecutionSetEXT                                       ;
var vkDestroyIndirectExecutionSetEXT                                     :T_PFN_vkDestroyIndirectExecutionSetEXT                                      ;
var vkUpdateIndirectExecutionSetPipelineEXT                              :T_PFN_vkUpdateIndirectExecutionSetPipelineEXT                               ;
var vkUpdateIndirectExecutionSetShaderEXT                                :T_PFN_vkUpdateIndirectExecutionSetShaderEXT                                 ;

// VK_NV_COOPERATIVE_MATRIX_2_SPEC_VERSION
var vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV   :T_PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV    ;

// VK_ARM_PERFORMANCE_COUNTERS_BY_REGION_SPEC_VERSION
var vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM   :T_PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM    ;

// VK_ARM_SHADER_INSTRUMENTATION_SPEC_VERSION
var vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM             :T_PFN_vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM              ;
var vkCreateShaderInstrumentationARM                                     :T_PFN_vkCreateShaderInstrumentationARM                                      ;
var vkDestroyShaderInstrumentationARM                                    :T_PFN_vkDestroyShaderInstrumentationARM                                     ;
var vkCmdBeginShaderInstrumentationARM                                   :T_PFN_vkCmdBeginShaderInstrumentationARM                                    ;
var vkCmdEndShaderInstrumentationARM                                     :T_PFN_vkCmdEndShaderInstrumentationARM                                      ;
var vkGetShaderInstrumentationValuesARM                                  :T_PFN_vkGetShaderInstrumentationValuesARM                                   ;
var vkClearShaderInstrumentationMetricsARM                               :T_PFN_vkClearShaderInstrumentationMetricsARM                                ;

// VK_EXT_FRAGMENT_DENSITY_MAP_OFFSET_SPEC_VERSION
var vkCmdEndRendering2EXT                                                :T_PFN_vkCmdEndRendering2EXT                                                 ;

// VK_EXT_CUSTOM_RESOLVE_SPEC_VERSION
var vkCmdBeginCustomResolveEXT                                           :T_PFN_vkCmdBeginCustomResolveEXT                                            ;

// VK_ARM_DATA_GRAPH_OPTICAL_FLOW_SPEC_VERSION
var vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM    :T_PFN_vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM     ;

// VK_NV_COMPUTE_OCCUPANCY_PRIORITY_SPEC_VERSION
var vkCmdSetComputeOccupancyPriorityNV                                   :T_PFN_vkCmdSetComputeOccupancyPriorityNV                                    ;

// VK_EXT_PRIMITIVE_RESTART_INDEX_SPEC_VERSION
var vkCmdSetPrimitiveRestartIndexEXT                                     :T_PFN_vkCmdSetPrimitiveRestartIndexEXT                                      ;

// VK_KHR_acceleration_structure
var vkCreateAccelerationStructureKHR                                     :T_PFN_vkCreateAccelerationStructureKHR                                      ;
var vkDestroyAccelerationStructureKHR                                    :T_PFN_vkDestroyAccelerationStructureKHR                                     ;
var vkCmdBuildAccelerationStructuresKHR                                  :T_PFN_vkCmdBuildAccelerationStructuresKHR                                   ;
var vkCmdBuildAccelerationStructuresIndirectKHR                          :T_PFN_vkCmdBuildAccelerationStructuresIndirectKHR                           ;
var vkBuildAccelerationStructuresKHR                                     :T_PFN_vkBuildAccelerationStructuresKHR                                      ;
var vkCopyAccelerationStructureKHR                                       :T_PFN_vkCopyAccelerationStructureKHR                                        ;
var vkCopyAccelerationStructureToMemoryKHR                               :T_PFN_vkCopyAccelerationStructureToMemoryKHR                                ;
var vkCopyMemoryToAccelerationStructureKHR                               :T_PFN_vkCopyMemoryToAccelerationStructureKHR                                ;
var vkWriteAccelerationStructuresPropertiesKHR                           :T_PFN_vkWriteAccelerationStructuresPropertiesKHR                            ;
var vkCmdCopyAccelerationStructureKHR                                    :T_PFN_vkCmdCopyAccelerationStructureKHR                                     ;
var vkCmdCopyAccelerationStructureToMemoryKHR                            :T_PFN_vkCmdCopyAccelerationStructureToMemoryKHR                             ;
var vkCmdCopyMemoryToAccelerationStructureKHR                            :T_PFN_vkCmdCopyMemoryToAccelerationStructureKHR                             ;
var vkGetAccelerationStructureDeviceAddressKHR                           :T_PFN_vkGetAccelerationStructureDeviceAddressKHR                            ;
var vkCmdWriteAccelerationStructuresPropertiesKHR                        :T_PFN_vkCmdWriteAccelerationStructuresPropertiesKHR                         ;
var vkGetDeviceAccelerationStructureCompatibilityKHR                     :T_PFN_vkGetDeviceAccelerationStructureCompatibilityKHR                      ;
var vkGetAccelerationStructureBuildSizesKHR                              :T_PFN_vkGetAccelerationStructureBuildSizesKHR                               ;

// VK_KHR_RAY_TRACING_PIPELINE_SPEC_VERSION
var vkCmdTraceRaysKHR                                                    :T_PFN_vkCmdTraceRaysKHR                                                     ;
var vkCreateRayTracingPipelinesKHR                                       :T_PFN_vkCreateRayTracingPipelinesKHR                                        ;
var vkGetRayTracingCaptureReplayShaderGroupHandlesKHR                    :T_PFN_vkGetRayTracingCaptureReplayShaderGroupHandlesKHR                     ;
var vkCmdTraceRaysIndirectKHR                                            :T_PFN_vkCmdTraceRaysIndirectKHR                                             ;
var vkGetRayTracingShaderGroupStackSizeKHR                               :T_PFN_vkGetRayTracingShaderGroupStackSizeKHR                                ;
var vkCmdSetRayTracingPipelineStackSizeKHR                               :T_PFN_vkCmdSetRayTracingPipelineStackSizeKHR                                ;

// VK_EXT_MESH_SHADER_SPEC_VERSION
var vkCmdDrawMeshTasksEXT                                                :T_PFN_vkCmdDrawMeshTasksEXT                                                 ;
var vkCmdDrawMeshTasksIndirectEXT                                        :T_PFN_vkCmdDrawMeshTasksIndirectEXT                                         ;
var vkCmdDrawMeshTasksIndirectCountEXT                                   :T_PFN_vkCmdDrawMeshTasksIndirectCountEXT                                    ;

{$IFDEF MSWINDOWS}

// VK_KHR_win32_surface
var vkCreateWin32SurfaceKHR                                              :T_PFN_vkCreateWin32SurfaceKHR                                               ;
var vkGetPhysicalDeviceWin32PresentationSupportKHR                       :T_PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR                        ;

// VK_KHR_EXTERNAL_MEMORY_WIN32_SPEC_VERSION
var vkGetMemoryWin32HandleKHR                                            :T_PFN_vkGetMemoryWin32HandleKHR                                             ;
var vkGetMemoryWin32HandlePropertiesKHR                                  :T_PFN_vkGetMemoryWin32HandlePropertiesKHR                                   ;

// VK_KHR_EXTERNAL_SEMAPHORE_WIN32_SPEC_VERSION
var vkImportSemaphoreWin32HandleKHR                                      :T_PFN_vkImportSemaphoreWin32HandleKHR                                       ;
var vkGetSemaphoreWin32HandleKHR                                         :T_PFN_vkGetSemaphoreWin32HandleKHR                                          ;

// VK_KHR_EXTERNAL_FENCE_WIN32_SPEC_VERSION
var vkImportFenceWin32HandleKHR                                          :T_PFN_vkImportFenceWin32HandleKHR                                           ;
var vkGetFenceWin32HandleKHR                                             :T_PFN_vkGetFenceWin32HandleKHR                                              ;

// VK_NV_EXTERNAL_MEMORY_WIN32_SPEC_VERSION
var vkGetMemoryWin32HandleNV                                             :T_PFN_vkGetMemoryWin32HandleNV                                              ;

// VK_EXT_full_screen_exclusive
var vkGetPhysicalDeviceSurfacePresentModes2EXT                           :T_PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT                            ;
var vkAcquireFullScreenExclusiveModeEXT                                  :T_PFN_vkAcquireFullScreenExclusiveModeEXT                                   ;
var vkReleaseFullScreenExclusiveModeEXT                                  :T_PFN_vkReleaseFullScreenExclusiveModeEXT                                   ;
var vkGetDeviceGroupSurfacePresentModes2EXT                              :T_PFN_vkGetDeviceGroupSurfacePresentModes2EXT                               ;

// VK_NV_ACQUIRE_WINRT_DISPLAY_SPEC_VERSION
var vkAcquireWinrtDisplayNV                                              :T_PFN_vkAcquireWinrtDisplayNV                                               ;
var vkGetWinrtDisplayNV                                                  :T_PFN_vkGetWinrtDisplayNV                                                   ;

{$ENDIF}

// vulkan-1.dll が公開している入口（コア＋一部の WSI）を取得する。
function LoadFunctions( const LibName_:String = DLLNAME ) :Boolean;

// vkGetInstanceProcAddr 経由で、インスタンス以下の全入口を取得する。
// 拡張の関数は DLL から公開されていないので、拡張を使うにはこちらが必須。
// （TVkDevices がインスタンス生成直後に自動で呼ぶ。取得される入口はローダの
//   トランポリンなので、デバイスが何個あっても正しく振り分けられる）
procedure LoadInstanceFunctions( const instance_:T_VkInstance );

// vkGetDeviceProcAddr 経由で、デバイス階層の入口を取得し直す。
// ローダのトランポリンを介さなくなるので、呼び出しが速くなるだけの最適化。
// ※ 取得した入口は指定デバイス専用。関数ポインタはグローバル変数なので、
//    VkDevice を複数使うアプリで呼ぶと他デバイスの呼び出しが壊れる。
//    単一デバイスと分かっているアプリだけが任意で呼ぶこと（自動では呼ばれない）。
procedure LoadDeviceFunctions( const device_:T_VkDevice );

implementation //############################################################### ■

uses {$IFDEF MSWINDOWS} Winapi.Windows, {$ENDIF} System.SysUtils;

type
     T_GetInstanceProc = function( instance_:T_VkInstance; const pName_:P_char ) :Pointer;
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}
     T_GetDeviceProc   = function( device_:T_VkDevice; const pName_:P_char ) :Pointer;
                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

var
   _VulkanLib       :HMODULE = 0;
   _GetInstanceProc :T_GetInstanceProc = nil;
   _GetDeviceProc   :T_GetDeviceProc   = nil;

function LoadFunctions( const LibName_:String ) :Boolean;
begin
     if _VulkanLib <> 0 then Exit( True );

     _VulkanLib := SafeLoadLibrary( LibName_ );

     Result := _VulkanLib <> 0;

     if not Result then Exit;

     vkCreateInstance                                                     := GetProcAddress( _VulkanLib, 'vkCreateInstance' );
     vkDestroyInstance                                                    := GetProcAddress( _VulkanLib, 'vkDestroyInstance' );
     vkEnumeratePhysicalDevices                                           := GetProcAddress( _VulkanLib, 'vkEnumeratePhysicalDevices' );
     vkGetPhysicalDeviceFeatures                                          := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFeatures' );
     vkGetPhysicalDeviceFormatProperties                                  := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFormatProperties' );
     vkGetPhysicalDeviceImageFormatProperties                             := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceImageFormatProperties' );
     vkGetPhysicalDeviceProperties                                        := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceProperties' );
     vkGetPhysicalDeviceQueueFamilyProperties                             := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceQueueFamilyProperties' );
     vkGetPhysicalDeviceMemoryProperties                                  := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceMemoryProperties' );
     vkGetInstanceProcAddr                                                := GetProcAddress( _VulkanLib, 'vkGetInstanceProcAddr' );
     vkGetDeviceProcAddr                                                  := GetProcAddress( _VulkanLib, 'vkGetDeviceProcAddr' );
     vkCreateDevice                                                       := GetProcAddress( _VulkanLib, 'vkCreateDevice' );
     vkDestroyDevice                                                      := GetProcAddress( _VulkanLib, 'vkDestroyDevice' );
     vkEnumerateInstanceExtensionProperties                               := GetProcAddress( _VulkanLib, 'vkEnumerateInstanceExtensionProperties' );
     vkEnumerateDeviceExtensionProperties                                 := GetProcAddress( _VulkanLib, 'vkEnumerateDeviceExtensionProperties' );
     vkEnumerateInstanceLayerProperties                                   := GetProcAddress( _VulkanLib, 'vkEnumerateInstanceLayerProperties' );
     vkEnumerateDeviceLayerProperties                                     := GetProcAddress( _VulkanLib, 'vkEnumerateDeviceLayerProperties' );
     vkGetDeviceQueue                                                     := GetProcAddress( _VulkanLib, 'vkGetDeviceQueue' );
     vkQueueSubmit                                                        := GetProcAddress( _VulkanLib, 'vkQueueSubmit' );
     vkQueueWaitIdle                                                      := GetProcAddress( _VulkanLib, 'vkQueueWaitIdle' );
     vkDeviceWaitIdle                                                     := GetProcAddress( _VulkanLib, 'vkDeviceWaitIdle' );
     vkAllocateMemory                                                     := GetProcAddress( _VulkanLib, 'vkAllocateMemory' );
     vkFreeMemory                                                         := GetProcAddress( _VulkanLib, 'vkFreeMemory' );
     vkMapMemory                                                          := GetProcAddress( _VulkanLib, 'vkMapMemory' );
     vkUnmapMemory                                                        := GetProcAddress( _VulkanLib, 'vkUnmapMemory' );
     vkFlushMappedMemoryRanges                                            := GetProcAddress( _VulkanLib, 'vkFlushMappedMemoryRanges' );
     vkInvalidateMappedMemoryRanges                                       := GetProcAddress( _VulkanLib, 'vkInvalidateMappedMemoryRanges' );
     vkGetDeviceMemoryCommitment                                          := GetProcAddress( _VulkanLib, 'vkGetDeviceMemoryCommitment' );
     vkBindBufferMemory                                                   := GetProcAddress( _VulkanLib, 'vkBindBufferMemory' );
     vkBindImageMemory                                                    := GetProcAddress( _VulkanLib, 'vkBindImageMemory' );
     vkGetBufferMemoryRequirements                                        := GetProcAddress( _VulkanLib, 'vkGetBufferMemoryRequirements' );
     vkGetImageMemoryRequirements                                         := GetProcAddress( _VulkanLib, 'vkGetImageMemoryRequirements' );
     vkGetImageSparseMemoryRequirements                                   := GetProcAddress( _VulkanLib, 'vkGetImageSparseMemoryRequirements' );
     vkGetPhysicalDeviceSparseImageFormatProperties                       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSparseImageFormatProperties' );
     vkQueueBindSparse                                                    := GetProcAddress( _VulkanLib, 'vkQueueBindSparse' );
     vkCreateFence                                                        := GetProcAddress( _VulkanLib, 'vkCreateFence' );
     vkDestroyFence                                                       := GetProcAddress( _VulkanLib, 'vkDestroyFence' );
     vkResetFences                                                        := GetProcAddress( _VulkanLib, 'vkResetFences' );
     vkGetFenceStatus                                                     := GetProcAddress( _VulkanLib, 'vkGetFenceStatus' );
     vkWaitForFences                                                      := GetProcAddress( _VulkanLib, 'vkWaitForFences' );
     vkCreateSemaphore                                                    := GetProcAddress( _VulkanLib, 'vkCreateSemaphore' );
     vkDestroySemaphore                                                   := GetProcAddress( _VulkanLib, 'vkDestroySemaphore' );
     vkCreateQueryPool                                                    := GetProcAddress( _VulkanLib, 'vkCreateQueryPool' );
     vkDestroyQueryPool                                                   := GetProcAddress( _VulkanLib, 'vkDestroyQueryPool' );
     vkGetQueryPoolResults                                                := GetProcAddress( _VulkanLib, 'vkGetQueryPoolResults' );
     vkCreateBuffer                                                       := GetProcAddress( _VulkanLib, 'vkCreateBuffer' );
     vkDestroyBuffer                                                      := GetProcAddress( _VulkanLib, 'vkDestroyBuffer' );
     vkCreateImage                                                        := GetProcAddress( _VulkanLib, 'vkCreateImage' );
     vkDestroyImage                                                       := GetProcAddress( _VulkanLib, 'vkDestroyImage' );
     vkGetImageSubresourceLayout                                          := GetProcAddress( _VulkanLib, 'vkGetImageSubresourceLayout' );
     vkCreateImageView                                                    := GetProcAddress( _VulkanLib, 'vkCreateImageView' );
     vkDestroyImageView                                                   := GetProcAddress( _VulkanLib, 'vkDestroyImageView' );
     vkCreateCommandPool                                                  := GetProcAddress( _VulkanLib, 'vkCreateCommandPool' );
     vkDestroyCommandPool                                                 := GetProcAddress( _VulkanLib, 'vkDestroyCommandPool' );
     vkResetCommandPool                                                   := GetProcAddress( _VulkanLib, 'vkResetCommandPool' );
     vkAllocateCommandBuffers                                             := GetProcAddress( _VulkanLib, 'vkAllocateCommandBuffers' );
     vkFreeCommandBuffers                                                 := GetProcAddress( _VulkanLib, 'vkFreeCommandBuffers' );
     vkBeginCommandBuffer                                                 := GetProcAddress( _VulkanLib, 'vkBeginCommandBuffer' );
     vkEndCommandBuffer                                                   := GetProcAddress( _VulkanLib, 'vkEndCommandBuffer' );
     vkResetCommandBuffer                                                 := GetProcAddress( _VulkanLib, 'vkResetCommandBuffer' );
     vkCmdCopyBuffer                                                      := GetProcAddress( _VulkanLib, 'vkCmdCopyBuffer' );
     vkCmdCopyImage                                                       := GetProcAddress( _VulkanLib, 'vkCmdCopyImage' );
     vkCmdCopyBufferToImage                                               := GetProcAddress( _VulkanLib, 'vkCmdCopyBufferToImage' );
     vkCmdCopyImageToBuffer                                               := GetProcAddress( _VulkanLib, 'vkCmdCopyImageToBuffer' );
     vkCmdUpdateBuffer                                                    := GetProcAddress( _VulkanLib, 'vkCmdUpdateBuffer' );
     vkCmdFillBuffer                                                      := GetProcAddress( _VulkanLib, 'vkCmdFillBuffer' );
     vkCmdPipelineBarrier                                                 := GetProcAddress( _VulkanLib, 'vkCmdPipelineBarrier' );
     vkCmdBeginQuery                                                      := GetProcAddress( _VulkanLib, 'vkCmdBeginQuery' );
     vkCmdEndQuery                                                        := GetProcAddress( _VulkanLib, 'vkCmdEndQuery' );
     vkCmdResetQueryPool                                                  := GetProcAddress( _VulkanLib, 'vkCmdResetQueryPool' );
     vkCmdWriteTimestamp                                                  := GetProcAddress( _VulkanLib, 'vkCmdWriteTimestamp' );
     vkCmdCopyQueryPoolResults                                            := GetProcAddress( _VulkanLib, 'vkCmdCopyQueryPoolResults' );
     vkCmdExecuteCommands                                                 := GetProcAddress( _VulkanLib, 'vkCmdExecuteCommands' );
     vkCreateEvent                                                        := GetProcAddress( _VulkanLib, 'vkCreateEvent' );
     vkDestroyEvent                                                       := GetProcAddress( _VulkanLib, 'vkDestroyEvent' );
     vkGetEventStatus                                                     := GetProcAddress( _VulkanLib, 'vkGetEventStatus' );
     vkSetEvent                                                           := GetProcAddress( _VulkanLib, 'vkSetEvent' );
     vkResetEvent                                                         := GetProcAddress( _VulkanLib, 'vkResetEvent' );
     vkCreateBufferView                                                   := GetProcAddress( _VulkanLib, 'vkCreateBufferView' );
     vkDestroyBufferView                                                  := GetProcAddress( _VulkanLib, 'vkDestroyBufferView' );
     vkCreateShaderModule                                                 := GetProcAddress( _VulkanLib, 'vkCreateShaderModule' );
     vkDestroyShaderModule                                                := GetProcAddress( _VulkanLib, 'vkDestroyShaderModule' );
     vkCreatePipelineCache                                                := GetProcAddress( _VulkanLib, 'vkCreatePipelineCache' );
     vkDestroyPipelineCache                                               := GetProcAddress( _VulkanLib, 'vkDestroyPipelineCache' );
     vkGetPipelineCacheData                                               := GetProcAddress( _VulkanLib, 'vkGetPipelineCacheData' );
     vkMergePipelineCaches                                                := GetProcAddress( _VulkanLib, 'vkMergePipelineCaches' );
     vkCreateComputePipelines                                             := GetProcAddress( _VulkanLib, 'vkCreateComputePipelines' );
     vkDestroyPipeline                                                    := GetProcAddress( _VulkanLib, 'vkDestroyPipeline' );
     vkCreatePipelineLayout                                               := GetProcAddress( _VulkanLib, 'vkCreatePipelineLayout' );
     vkDestroyPipelineLayout                                              := GetProcAddress( _VulkanLib, 'vkDestroyPipelineLayout' );
     vkCreateSampler                                                      := GetProcAddress( _VulkanLib, 'vkCreateSampler' );
     vkDestroySampler                                                     := GetProcAddress( _VulkanLib, 'vkDestroySampler' );
     vkCreateDescriptorSetLayout                                          := GetProcAddress( _VulkanLib, 'vkCreateDescriptorSetLayout' );
     vkDestroyDescriptorSetLayout                                         := GetProcAddress( _VulkanLib, 'vkDestroyDescriptorSetLayout' );
     vkCreateDescriptorPool                                               := GetProcAddress( _VulkanLib, 'vkCreateDescriptorPool' );
     vkDestroyDescriptorPool                                              := GetProcAddress( _VulkanLib, 'vkDestroyDescriptorPool' );
     vkResetDescriptorPool                                                := GetProcAddress( _VulkanLib, 'vkResetDescriptorPool' );
     vkAllocateDescriptorSets                                             := GetProcAddress( _VulkanLib, 'vkAllocateDescriptorSets' );
     vkFreeDescriptorSets                                                 := GetProcAddress( _VulkanLib, 'vkFreeDescriptorSets' );
     vkUpdateDescriptorSets                                               := GetProcAddress( _VulkanLib, 'vkUpdateDescriptorSets' );
     vkCmdBindPipeline                                                    := GetProcAddress( _VulkanLib, 'vkCmdBindPipeline' );
     vkCmdBindDescriptorSets                                              := GetProcAddress( _VulkanLib, 'vkCmdBindDescriptorSets' );
     vkCmdClearColorImage                                                 := GetProcAddress( _VulkanLib, 'vkCmdClearColorImage' );
     vkCmdDispatch                                                        := GetProcAddress( _VulkanLib, 'vkCmdDispatch' );
     vkCmdDispatchIndirect                                                := GetProcAddress( _VulkanLib, 'vkCmdDispatchIndirect' );
     vkCmdSetEvent                                                        := GetProcAddress( _VulkanLib, 'vkCmdSetEvent' );
     vkCmdResetEvent                                                      := GetProcAddress( _VulkanLib, 'vkCmdResetEvent' );
     vkCmdWaitEvents                                                      := GetProcAddress( _VulkanLib, 'vkCmdWaitEvents' );
     vkCmdPushConstants                                                   := GetProcAddress( _VulkanLib, 'vkCmdPushConstants' );
     vkCreateGraphicsPipelines                                            := GetProcAddress( _VulkanLib, 'vkCreateGraphicsPipelines' );
     vkCreateFramebuffer                                                  := GetProcAddress( _VulkanLib, 'vkCreateFramebuffer' );
     vkDestroyFramebuffer                                                 := GetProcAddress( _VulkanLib, 'vkDestroyFramebuffer' );
     vkCreateRenderPass                                                   := GetProcAddress( _VulkanLib, 'vkCreateRenderPass' );
     vkDestroyRenderPass                                                  := GetProcAddress( _VulkanLib, 'vkDestroyRenderPass' );
     vkGetRenderAreaGranularity                                           := GetProcAddress( _VulkanLib, 'vkGetRenderAreaGranularity' );
     vkCmdSetViewport                                                     := GetProcAddress( _VulkanLib, 'vkCmdSetViewport' );
     vkCmdSetScissor                                                      := GetProcAddress( _VulkanLib, 'vkCmdSetScissor' );
     vkCmdSetLineWidth                                                    := GetProcAddress( _VulkanLib, 'vkCmdSetLineWidth' );
     vkCmdSetDepthBias                                                    := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBias' );
     vkCmdSetBlendConstants                                               := GetProcAddress( _VulkanLib, 'vkCmdSetBlendConstants' );
     vkCmdSetDepthBounds                                                  := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBounds' );
     vkCmdSetStencilCompareMask                                           := GetProcAddress( _VulkanLib, 'vkCmdSetStencilCompareMask' );
     vkCmdSetStencilWriteMask                                             := GetProcAddress( _VulkanLib, 'vkCmdSetStencilWriteMask' );
     vkCmdSetStencilReference                                             := GetProcAddress( _VulkanLib, 'vkCmdSetStencilReference' );
     vkCmdBindIndexBuffer                                                 := GetProcAddress( _VulkanLib, 'vkCmdBindIndexBuffer' );
     vkCmdBindVertexBuffers                                               := GetProcAddress( _VulkanLib, 'vkCmdBindVertexBuffers' );
     vkCmdDraw                                                            := GetProcAddress( _VulkanLib, 'vkCmdDraw' );
     vkCmdDrawIndexed                                                     := GetProcAddress( _VulkanLib, 'vkCmdDrawIndexed' );
     vkCmdDrawIndirect                                                    := GetProcAddress( _VulkanLib, 'vkCmdDrawIndirect' );
     vkCmdDrawIndexedIndirect                                             := GetProcAddress( _VulkanLib, 'vkCmdDrawIndexedIndirect' );
     vkCmdBlitImage                                                       := GetProcAddress( _VulkanLib, 'vkCmdBlitImage' );
     vkCmdClearDepthStencilImage                                          := GetProcAddress( _VulkanLib, 'vkCmdClearDepthStencilImage' );
     vkCmdClearAttachments                                                := GetProcAddress( _VulkanLib, 'vkCmdClearAttachments' );
     vkCmdResolveImage                                                    := GetProcAddress( _VulkanLib, 'vkCmdResolveImage' );
     vkCmdBeginRenderPass                                                 := GetProcAddress( _VulkanLib, 'vkCmdBeginRenderPass' );
     vkCmdNextSubpass                                                     := GetProcAddress( _VulkanLib, 'vkCmdNextSubpass' );
     vkCmdEndRenderPass                                                   := GetProcAddress( _VulkanLib, 'vkCmdEndRenderPass' );
     vkEnumerateInstanceVersion                                           := GetProcAddress( _VulkanLib, 'vkEnumerateInstanceVersion' );
     vkBindBufferMemory2                                                  := GetProcAddress( _VulkanLib, 'vkBindBufferMemory2' );
     vkBindImageMemory2                                                   := GetProcAddress( _VulkanLib, 'vkBindImageMemory2' );
     vkGetDeviceGroupPeerMemoryFeatures                                   := GetProcAddress( _VulkanLib, 'vkGetDeviceGroupPeerMemoryFeatures' );
     vkCmdSetDeviceMask                                                   := GetProcAddress( _VulkanLib, 'vkCmdSetDeviceMask' );
     vkEnumeratePhysicalDeviceGroups                                      := GetProcAddress( _VulkanLib, 'vkEnumeratePhysicalDeviceGroups' );
     vkGetImageMemoryRequirements2                                        := GetProcAddress( _VulkanLib, 'vkGetImageMemoryRequirements2' );
     vkGetBufferMemoryRequirements2                                       := GetProcAddress( _VulkanLib, 'vkGetBufferMemoryRequirements2' );
     vkGetImageSparseMemoryRequirements2                                  := GetProcAddress( _VulkanLib, 'vkGetImageSparseMemoryRequirements2' );
     vkGetPhysicalDeviceFeatures2                                         := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFeatures2' );
     vkGetPhysicalDeviceProperties2                                       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceProperties2' );
     vkGetPhysicalDeviceFormatProperties2                                 := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFormatProperties2' );
     vkGetPhysicalDeviceImageFormatProperties2                            := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceImageFormatProperties2' );
     vkGetPhysicalDeviceQueueFamilyProperties2                            := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceQueueFamilyProperties2' );
     vkGetPhysicalDeviceMemoryProperties2                                 := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceMemoryProperties2' );
     vkGetPhysicalDeviceSparseImageFormatProperties2                      := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSparseImageFormatProperties2' );
     vkTrimCommandPool                                                    := GetProcAddress( _VulkanLib, 'vkTrimCommandPool' );
     vkGetDeviceQueue2                                                    := GetProcAddress( _VulkanLib, 'vkGetDeviceQueue2' );
     vkGetPhysicalDeviceExternalBufferProperties                          := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalBufferProperties' );
     vkGetPhysicalDeviceExternalFenceProperties                           := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalFenceProperties' );
     vkGetPhysicalDeviceExternalSemaphoreProperties                       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalSemaphoreProperties' );
     vkCmdDispatchBase                                                    := GetProcAddress( _VulkanLib, 'vkCmdDispatchBase' );
     vkCreateDescriptorUpdateTemplate                                     := GetProcAddress( _VulkanLib, 'vkCreateDescriptorUpdateTemplate' );
     vkDestroyDescriptorUpdateTemplate                                    := GetProcAddress( _VulkanLib, 'vkDestroyDescriptorUpdateTemplate' );
     vkUpdateDescriptorSetWithTemplate                                    := GetProcAddress( _VulkanLib, 'vkUpdateDescriptorSetWithTemplate' );
     vkGetDescriptorSetLayoutSupport                                      := GetProcAddress( _VulkanLib, 'vkGetDescriptorSetLayoutSupport' );
     vkCreateSamplerYcbcrConversion                                       := GetProcAddress( _VulkanLib, 'vkCreateSamplerYcbcrConversion' );
     vkDestroySamplerYcbcrConversion                                      := GetProcAddress( _VulkanLib, 'vkDestroySamplerYcbcrConversion' );
     vkResetQueryPool                                                     := GetProcAddress( _VulkanLib, 'vkResetQueryPool' );
     vkGetSemaphoreCounterValue                                           := GetProcAddress( _VulkanLib, 'vkGetSemaphoreCounterValue' );
     vkWaitSemaphores                                                     := GetProcAddress( _VulkanLib, 'vkWaitSemaphores' );
     vkSignalSemaphore                                                    := GetProcAddress( _VulkanLib, 'vkSignalSemaphore' );
     vkGetBufferDeviceAddress                                             := GetProcAddress( _VulkanLib, 'vkGetBufferDeviceAddress' );
     vkGetBufferOpaqueCaptureAddress                                      := GetProcAddress( _VulkanLib, 'vkGetBufferOpaqueCaptureAddress' );
     vkGetDeviceMemoryOpaqueCaptureAddress                                := GetProcAddress( _VulkanLib, 'vkGetDeviceMemoryOpaqueCaptureAddress' );
     vkCmdDrawIndirectCount                                               := GetProcAddress( _VulkanLib, 'vkCmdDrawIndirectCount' );
     vkCmdDrawIndexedIndirectCount                                        := GetProcAddress( _VulkanLib, 'vkCmdDrawIndexedIndirectCount' );
     vkCreateRenderPass2                                                  := GetProcAddress( _VulkanLib, 'vkCreateRenderPass2' );
     vkCmdBeginRenderPass2                                                := GetProcAddress( _VulkanLib, 'vkCmdBeginRenderPass2' );
     vkCmdNextSubpass2                                                    := GetProcAddress( _VulkanLib, 'vkCmdNextSubpass2' );
     vkCmdEndRenderPass2                                                  := GetProcAddress( _VulkanLib, 'vkCmdEndRenderPass2' );
     vkGetPhysicalDeviceToolProperties                                    := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceToolProperties' );
     vkCreatePrivateDataSlot                                              := GetProcAddress( _VulkanLib, 'vkCreatePrivateDataSlot' );
     vkDestroyPrivateDataSlot                                             := GetProcAddress( _VulkanLib, 'vkDestroyPrivateDataSlot' );
     vkSetPrivateData                                                     := GetProcAddress( _VulkanLib, 'vkSetPrivateData' );
     vkGetPrivateData                                                     := GetProcAddress( _VulkanLib, 'vkGetPrivateData' );
     vkCmdPipelineBarrier2                                                := GetProcAddress( _VulkanLib, 'vkCmdPipelineBarrier2' );
     vkCmdWriteTimestamp2                                                 := GetProcAddress( _VulkanLib, 'vkCmdWriteTimestamp2' );
     vkQueueSubmit2                                                       := GetProcAddress( _VulkanLib, 'vkQueueSubmit2' );
     vkCmdCopyBuffer2                                                     := GetProcAddress( _VulkanLib, 'vkCmdCopyBuffer2' );
     vkCmdCopyImage2                                                      := GetProcAddress( _VulkanLib, 'vkCmdCopyImage2' );
     vkCmdCopyBufferToImage2                                              := GetProcAddress( _VulkanLib, 'vkCmdCopyBufferToImage2' );
     vkCmdCopyImageToBuffer2                                              := GetProcAddress( _VulkanLib, 'vkCmdCopyImageToBuffer2' );
     vkGetDeviceBufferMemoryRequirements                                  := GetProcAddress( _VulkanLib, 'vkGetDeviceBufferMemoryRequirements' );
     vkGetDeviceImageMemoryRequirements                                   := GetProcAddress( _VulkanLib, 'vkGetDeviceImageMemoryRequirements' );
     vkGetDeviceImageSparseMemoryRequirements                             := GetProcAddress( _VulkanLib, 'vkGetDeviceImageSparseMemoryRequirements' );
     vkCmdSetEvent2                                                       := GetProcAddress( _VulkanLib, 'vkCmdSetEvent2' );
     vkCmdResetEvent2                                                     := GetProcAddress( _VulkanLib, 'vkCmdResetEvent2' );
     vkCmdWaitEvents2                                                     := GetProcAddress( _VulkanLib, 'vkCmdWaitEvents2' );
     vkCmdBlitImage2                                                      := GetProcAddress( _VulkanLib, 'vkCmdBlitImage2' );
     vkCmdResolveImage2                                                   := GetProcAddress( _VulkanLib, 'vkCmdResolveImage2' );
     vkCmdBeginRendering                                                  := GetProcAddress( _VulkanLib, 'vkCmdBeginRendering' );
     vkCmdEndRendering                                                    := GetProcAddress( _VulkanLib, 'vkCmdEndRendering' );
     vkCmdSetCullMode                                                     := GetProcAddress( _VulkanLib, 'vkCmdSetCullMode' );
     vkCmdSetFrontFace                                                    := GetProcAddress( _VulkanLib, 'vkCmdSetFrontFace' );
     vkCmdSetPrimitiveTopology                                            := GetProcAddress( _VulkanLib, 'vkCmdSetPrimitiveTopology' );
     vkCmdSetViewportWithCount                                            := GetProcAddress( _VulkanLib, 'vkCmdSetViewportWithCount' );
     vkCmdSetScissorWithCount                                             := GetProcAddress( _VulkanLib, 'vkCmdSetScissorWithCount' );
     vkCmdBindVertexBuffers2                                              := GetProcAddress( _VulkanLib, 'vkCmdBindVertexBuffers2' );
     vkCmdSetDepthTestEnable                                              := GetProcAddress( _VulkanLib, 'vkCmdSetDepthTestEnable' );
     vkCmdSetDepthWriteEnable                                             := GetProcAddress( _VulkanLib, 'vkCmdSetDepthWriteEnable' );
     vkCmdSetDepthCompareOp                                               := GetProcAddress( _VulkanLib, 'vkCmdSetDepthCompareOp' );
     vkCmdSetDepthBoundsTestEnable                                        := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBoundsTestEnable' );
     vkCmdSetStencilTestEnable                                            := GetProcAddress( _VulkanLib, 'vkCmdSetStencilTestEnable' );
     vkCmdSetStencilOp                                                    := GetProcAddress( _VulkanLib, 'vkCmdSetStencilOp' );
     vkCmdSetRasterizerDiscardEnable                                      := GetProcAddress( _VulkanLib, 'vkCmdSetRasterizerDiscardEnable' );
     vkCmdSetDepthBiasEnable                                              := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBiasEnable' );
     vkCmdSetPrimitiveRestartEnable                                       := GetProcAddress( _VulkanLib, 'vkCmdSetPrimitiveRestartEnable' );
     vkMapMemory2                                                         := GetProcAddress( _VulkanLib, 'vkMapMemory2' );
     vkUnmapMemory2                                                       := GetProcAddress( _VulkanLib, 'vkUnmapMemory2' );
     vkGetDeviceImageSubresourceLayout                                    := GetProcAddress( _VulkanLib, 'vkGetDeviceImageSubresourceLayout' );
     vkGetImageSubresourceLayout2                                         := GetProcAddress( _VulkanLib, 'vkGetImageSubresourceLayout2' );
     vkCopyMemoryToImage                                                  := GetProcAddress( _VulkanLib, 'vkCopyMemoryToImage' );
     vkCopyImageToMemory                                                  := GetProcAddress( _VulkanLib, 'vkCopyImageToMemory' );
     vkCopyImageToImage                                                   := GetProcAddress( _VulkanLib, 'vkCopyImageToImage' );
     vkTransitionImageLayout                                              := GetProcAddress( _VulkanLib, 'vkTransitionImageLayout' );
     vkCmdPushDescriptorSet                                               := GetProcAddress( _VulkanLib, 'vkCmdPushDescriptorSet' );
     vkCmdPushDescriptorSetWithTemplate                                   := GetProcAddress( _VulkanLib, 'vkCmdPushDescriptorSetWithTemplate' );
     vkCmdBindDescriptorSets2                                             := GetProcAddress( _VulkanLib, 'vkCmdBindDescriptorSets2' );
     vkCmdPushConstants2                                                  := GetProcAddress( _VulkanLib, 'vkCmdPushConstants2' );
     vkCmdPushDescriptorSet2                                              := GetProcAddress( _VulkanLib, 'vkCmdPushDescriptorSet2' );
     vkCmdPushDescriptorSetWithTemplate2                                  := GetProcAddress( _VulkanLib, 'vkCmdPushDescriptorSetWithTemplate2' );
     vkCmdSetLineStipple                                                  := GetProcAddress( _VulkanLib, 'vkCmdSetLineStipple' );
     vkCmdBindIndexBuffer2                                                := GetProcAddress( _VulkanLib, 'vkCmdBindIndexBuffer2' );
     vkGetRenderingAreaGranularity                                        := GetProcAddress( _VulkanLib, 'vkGetRenderingAreaGranularity' );
     vkCmdSetRenderingAttachmentLocations                                 := GetProcAddress( _VulkanLib, 'vkCmdSetRenderingAttachmentLocations' );
     vkCmdSetRenderingInputAttachmentIndices                              := GetProcAddress( _VulkanLib, 'vkCmdSetRenderingInputAttachmentIndices' );
     vkDestroySurfaceKHR                                                  := GetProcAddress( _VulkanLib, 'vkDestroySurfaceKHR' );
     vkGetPhysicalDeviceSurfaceSupportKHR                                 := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfaceSupportKHR' );
     vkGetPhysicalDeviceSurfaceCapabilitiesKHR                            := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfaceCapabilitiesKHR' );
     vkGetPhysicalDeviceSurfaceFormatsKHR                                 := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfaceFormatsKHR' );
     vkGetPhysicalDeviceSurfacePresentModesKHR                            := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfacePresentModesKHR' );
     vkCreateSwapchainKHR                                                 := GetProcAddress( _VulkanLib, 'vkCreateSwapchainKHR' );
     vkDestroySwapchainKHR                                                := GetProcAddress( _VulkanLib, 'vkDestroySwapchainKHR' );
     vkGetSwapchainImagesKHR                                              := GetProcAddress( _VulkanLib, 'vkGetSwapchainImagesKHR' );
     vkAcquireNextImageKHR                                                := GetProcAddress( _VulkanLib, 'vkAcquireNextImageKHR' );
     vkQueuePresentKHR                                                    := GetProcAddress( _VulkanLib, 'vkQueuePresentKHR' );
     vkGetDeviceGroupPresentCapabilitiesKHR                               := GetProcAddress( _VulkanLib, 'vkGetDeviceGroupPresentCapabilitiesKHR' );
     vkGetDeviceGroupSurfacePresentModesKHR                               := GetProcAddress( _VulkanLib, 'vkGetDeviceGroupSurfacePresentModesKHR' );
     vkGetPhysicalDevicePresentRectanglesKHR                              := GetProcAddress( _VulkanLib, 'vkGetPhysicalDevicePresentRectanglesKHR' );
     vkAcquireNextImage2KHR                                               := GetProcAddress( _VulkanLib, 'vkAcquireNextImage2KHR' );
     vkGetPhysicalDeviceDisplayPropertiesKHR                              := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceDisplayPropertiesKHR' );
     vkGetPhysicalDeviceDisplayPlanePropertiesKHR                         := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceDisplayPlanePropertiesKHR' );
     vkGetDisplayPlaneSupportedDisplaysKHR                                := GetProcAddress( _VulkanLib, 'vkGetDisplayPlaneSupportedDisplaysKHR' );
     vkGetDisplayModePropertiesKHR                                        := GetProcAddress( _VulkanLib, 'vkGetDisplayModePropertiesKHR' );
     vkCreateDisplayModeKHR                                               := GetProcAddress( _VulkanLib, 'vkCreateDisplayModeKHR' );
     vkGetDisplayPlaneCapabilitiesKHR                                     := GetProcAddress( _VulkanLib, 'vkGetDisplayPlaneCapabilitiesKHR' );
     vkCreateDisplayPlaneSurfaceKHR                                       := GetProcAddress( _VulkanLib, 'vkCreateDisplayPlaneSurfaceKHR' );
     vkCreateSharedSwapchainsKHR                                          := GetProcAddress( _VulkanLib, 'vkCreateSharedSwapchainsKHR' );
     vkGetPhysicalDeviceVideoCapabilitiesKHR                              := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceVideoCapabilitiesKHR' );
     vkGetPhysicalDeviceVideoFormatPropertiesKHR                          := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceVideoFormatPropertiesKHR' );
     vkCreateVideoSessionKHR                                              := GetProcAddress( _VulkanLib, 'vkCreateVideoSessionKHR' );
     vkDestroyVideoSessionKHR                                             := GetProcAddress( _VulkanLib, 'vkDestroyVideoSessionKHR' );
     vkGetVideoSessionMemoryRequirementsKHR                               := GetProcAddress( _VulkanLib, 'vkGetVideoSessionMemoryRequirementsKHR' );
     vkBindVideoSessionMemoryKHR                                          := GetProcAddress( _VulkanLib, 'vkBindVideoSessionMemoryKHR' );
     vkCreateVideoSessionParametersKHR                                    := GetProcAddress( _VulkanLib, 'vkCreateVideoSessionParametersKHR' );
     vkUpdateVideoSessionParametersKHR                                    := GetProcAddress( _VulkanLib, 'vkUpdateVideoSessionParametersKHR' );
     vkDestroyVideoSessionParametersKHR                                   := GetProcAddress( _VulkanLib, 'vkDestroyVideoSessionParametersKHR' );
     vkCmdBeginVideoCodingKHR                                             := GetProcAddress( _VulkanLib, 'vkCmdBeginVideoCodingKHR' );
     vkCmdEndVideoCodingKHR                                               := GetProcAddress( _VulkanLib, 'vkCmdEndVideoCodingKHR' );
     vkCmdControlVideoCodingKHR                                           := GetProcAddress( _VulkanLib, 'vkCmdControlVideoCodingKHR' );
     vkCmdDecodeVideoKHR                                                  := GetProcAddress( _VulkanLib, 'vkCmdDecodeVideoKHR' );
     vkCmdBeginRenderingKHR                                               := GetProcAddress( _VulkanLib, 'vkCmdBeginRenderingKHR' );
     vkCmdEndRenderingKHR                                                 := GetProcAddress( _VulkanLib, 'vkCmdEndRenderingKHR' );
     vkGetPhysicalDeviceFeatures2KHR                                      := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFeatures2KHR' );
     vkGetPhysicalDeviceProperties2KHR                                    := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceProperties2KHR' );
     vkGetPhysicalDeviceFormatProperties2KHR                              := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFormatProperties2KHR' );
     vkGetPhysicalDeviceImageFormatProperties2KHR                         := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceImageFormatProperties2KHR' );
     vkGetPhysicalDeviceQueueFamilyProperties2KHR                         := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceQueueFamilyProperties2KHR' );
     vkGetPhysicalDeviceMemoryProperties2KHR                              := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceMemoryProperties2KHR' );
     vkGetPhysicalDeviceSparseImageFormatProperties2KHR                   := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSparseImageFormatProperties2KHR' );
     vkGetDeviceGroupPeerMemoryFeaturesKHR                                := GetProcAddress( _VulkanLib, 'vkGetDeviceGroupPeerMemoryFeaturesKHR' );
     vkCmdSetDeviceMaskKHR                                                := GetProcAddress( _VulkanLib, 'vkCmdSetDeviceMaskKHR' );
     vkCmdDispatchBaseKHR                                                 := GetProcAddress( _VulkanLib, 'vkCmdDispatchBaseKHR' );
     vkTrimCommandPoolKHR                                                 := GetProcAddress( _VulkanLib, 'vkTrimCommandPoolKHR' );
     vkEnumeratePhysicalDeviceGroupsKHR                                   := GetProcAddress( _VulkanLib, 'vkEnumeratePhysicalDeviceGroupsKHR' );
     vkGetPhysicalDeviceExternalBufferPropertiesKHR                       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalBufferPropertiesKHR' );
     vkGetMemoryFdKHR                                                     := GetProcAddress( _VulkanLib, 'vkGetMemoryFdKHR' );
     vkGetMemoryFdPropertiesKHR                                           := GetProcAddress( _VulkanLib, 'vkGetMemoryFdPropertiesKHR' );
     vkGetPhysicalDeviceExternalSemaphorePropertiesKHR                    := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalSemaphorePropertiesKHR' );
     vkImportSemaphoreFdKHR                                               := GetProcAddress( _VulkanLib, 'vkImportSemaphoreFdKHR' );
     vkGetSemaphoreFdKHR                                                  := GetProcAddress( _VulkanLib, 'vkGetSemaphoreFdKHR' );
     vkCmdPushDescriptorSetKHR                                            := GetProcAddress( _VulkanLib, 'vkCmdPushDescriptorSetKHR' );
     vkCmdPushDescriptorSetWithTemplateKHR                                := GetProcAddress( _VulkanLib, 'vkCmdPushDescriptorSetWithTemplateKHR' );
     vkCreateDescriptorUpdateTemplateKHR                                  := GetProcAddress( _VulkanLib, 'vkCreateDescriptorUpdateTemplateKHR' );
     vkDestroyDescriptorUpdateTemplateKHR                                 := GetProcAddress( _VulkanLib, 'vkDestroyDescriptorUpdateTemplateKHR' );
     vkUpdateDescriptorSetWithTemplateKHR                                 := GetProcAddress( _VulkanLib, 'vkUpdateDescriptorSetWithTemplateKHR' );
     vkCreateRenderPass2KHR                                               := GetProcAddress( _VulkanLib, 'vkCreateRenderPass2KHR' );
     vkCmdBeginRenderPass2KHR                                             := GetProcAddress( _VulkanLib, 'vkCmdBeginRenderPass2KHR' );
     vkCmdNextSubpass2KHR                                                 := GetProcAddress( _VulkanLib, 'vkCmdNextSubpass2KHR' );
     vkCmdEndRenderPass2KHR                                               := GetProcAddress( _VulkanLib, 'vkCmdEndRenderPass2KHR' );
     vkGetSwapchainStatusKHR                                              := GetProcAddress( _VulkanLib, 'vkGetSwapchainStatusKHR' );
     vkGetPhysicalDeviceExternalFencePropertiesKHR                        := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalFencePropertiesKHR' );
     vkImportFenceFdKHR                                                   := GetProcAddress( _VulkanLib, 'vkImportFenceFdKHR' );
     vkGetFenceFdKHR                                                      := GetProcAddress( _VulkanLib, 'vkGetFenceFdKHR' );
     vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR      := GetProcAddress( _VulkanLib, 'vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR' );
     vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR              := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR' );
     vkAcquireProfilingLockKHR                                            := GetProcAddress( _VulkanLib, 'vkAcquireProfilingLockKHR' );
     vkReleaseProfilingLockKHR                                            := GetProcAddress( _VulkanLib, 'vkReleaseProfilingLockKHR' );
     vkGetPhysicalDeviceSurfaceCapabilities2KHR                           := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfaceCapabilities2KHR' );
     vkGetPhysicalDeviceSurfaceFormats2KHR                                := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfaceFormats2KHR' );
     vkGetPhysicalDeviceDisplayProperties2KHR                             := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceDisplayProperties2KHR' );
     vkGetPhysicalDeviceDisplayPlaneProperties2KHR                        := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceDisplayPlaneProperties2KHR' );
     vkGetDisplayModeProperties2KHR                                       := GetProcAddress( _VulkanLib, 'vkGetDisplayModeProperties2KHR' );
     vkGetDisplayPlaneCapabilities2KHR                                    := GetProcAddress( _VulkanLib, 'vkGetDisplayPlaneCapabilities2KHR' );
     vkGetImageMemoryRequirements2KHR                                     := GetProcAddress( _VulkanLib, 'vkGetImageMemoryRequirements2KHR' );
     vkGetBufferMemoryRequirements2KHR                                    := GetProcAddress( _VulkanLib, 'vkGetBufferMemoryRequirements2KHR' );
     vkGetImageSparseMemoryRequirements2KHR                               := GetProcAddress( _VulkanLib, 'vkGetImageSparseMemoryRequirements2KHR' );
     vkCreateSamplerYcbcrConversionKHR                                    := GetProcAddress( _VulkanLib, 'vkCreateSamplerYcbcrConversionKHR' );
     vkDestroySamplerYcbcrConversionKHR                                   := GetProcAddress( _VulkanLib, 'vkDestroySamplerYcbcrConversionKHR' );
     vkBindBufferMemory2KHR                                               := GetProcAddress( _VulkanLib, 'vkBindBufferMemory2KHR' );
     vkBindImageMemory2KHR                                                := GetProcAddress( _VulkanLib, 'vkBindImageMemory2KHR' );
     vkGetDescriptorSetLayoutSupportKHR                                   := GetProcAddress( _VulkanLib, 'vkGetDescriptorSetLayoutSupportKHR' );
     vkCmdDrawIndirectCountKHR                                            := GetProcAddress( _VulkanLib, 'vkCmdDrawIndirectCountKHR' );
     vkCmdDrawIndexedIndirectCountKHR                                     := GetProcAddress( _VulkanLib, 'vkCmdDrawIndexedIndirectCountKHR' );
     vkGetSemaphoreCounterValueKHR                                        := GetProcAddress( _VulkanLib, 'vkGetSemaphoreCounterValueKHR' );
     vkWaitSemaphoresKHR                                                  := GetProcAddress( _VulkanLib, 'vkWaitSemaphoresKHR' );
     vkSignalSemaphoreKHR                                                 := GetProcAddress( _VulkanLib, 'vkSignalSemaphoreKHR' );
     vkGetPhysicalDeviceFragmentShadingRatesKHR                           := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceFragmentShadingRatesKHR' );
     vkCmdSetFragmentShadingRateKHR                                       := GetProcAddress( _VulkanLib, 'vkCmdSetFragmentShadingRateKHR' );
     vkCmdSetRenderingAttachmentLocationsKHR                              := GetProcAddress( _VulkanLib, 'vkCmdSetRenderingAttachmentLocationsKHR' );
     vkCmdSetRenderingInputAttachmentIndicesKHR                           := GetProcAddress( _VulkanLib, 'vkCmdSetRenderingInputAttachmentIndicesKHR' );
     vkWaitForPresentKHR                                                  := GetProcAddress( _VulkanLib, 'vkWaitForPresentKHR' );
     vkGetBufferDeviceAddressKHR                                          := GetProcAddress( _VulkanLib, 'vkGetBufferDeviceAddressKHR' );
     vkGetBufferOpaqueCaptureAddressKHR                                   := GetProcAddress( _VulkanLib, 'vkGetBufferOpaqueCaptureAddressKHR' );
     vkGetDeviceMemoryOpaqueCaptureAddressKHR                             := GetProcAddress( _VulkanLib, 'vkGetDeviceMemoryOpaqueCaptureAddressKHR' );
     vkCreateDeferredOperationKHR                                         := GetProcAddress( _VulkanLib, 'vkCreateDeferredOperationKHR' );
     vkDestroyDeferredOperationKHR                                        := GetProcAddress( _VulkanLib, 'vkDestroyDeferredOperationKHR' );
     vkGetDeferredOperationMaxConcurrencyKHR                              := GetProcAddress( _VulkanLib, 'vkGetDeferredOperationMaxConcurrencyKHR' );
     vkGetDeferredOperationResultKHR                                      := GetProcAddress( _VulkanLib, 'vkGetDeferredOperationResultKHR' );
     vkDeferredOperationJoinKHR                                           := GetProcAddress( _VulkanLib, 'vkDeferredOperationJoinKHR' );
     vkGetPipelineExecutablePropertiesKHR                                 := GetProcAddress( _VulkanLib, 'vkGetPipelineExecutablePropertiesKHR' );
     vkGetPipelineExecutableStatisticsKHR                                 := GetProcAddress( _VulkanLib, 'vkGetPipelineExecutableStatisticsKHR' );
     vkGetPipelineExecutableInternalRepresentationsKHR                    := GetProcAddress( _VulkanLib, 'vkGetPipelineExecutableInternalRepresentationsKHR' );
     vkMapMemory2KHR                                                      := GetProcAddress( _VulkanLib, 'vkMapMemory2KHR' );
     vkUnmapMemory2KHR                                                    := GetProcAddress( _VulkanLib, 'vkUnmapMemory2KHR' );
     vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR              := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR' );
     vkGetEncodedVideoSessionParametersKHR                                := GetProcAddress( _VulkanLib, 'vkGetEncodedVideoSessionParametersKHR' );
     vkCmdEncodeVideoKHR                                                  := GetProcAddress( _VulkanLib, 'vkCmdEncodeVideoKHR' );
     vkCmdSetEvent2KHR                                                    := GetProcAddress( _VulkanLib, 'vkCmdSetEvent2KHR' );
     vkCmdResetEvent2KHR                                                  := GetProcAddress( _VulkanLib, 'vkCmdResetEvent2KHR' );
     vkCmdWaitEvents2KHR                                                  := GetProcAddress( _VulkanLib, 'vkCmdWaitEvents2KHR' );
     vkCmdPipelineBarrier2KHR                                             := GetProcAddress( _VulkanLib, 'vkCmdPipelineBarrier2KHR' );
     vkCmdWriteTimestamp2KHR                                              := GetProcAddress( _VulkanLib, 'vkCmdWriteTimestamp2KHR' );
     vkQueueSubmit2KHR                                                    := GetProcAddress( _VulkanLib, 'vkQueueSubmit2KHR' );
     vkCmdBindIndexBuffer3KHR                                             := GetProcAddress( _VulkanLib, 'vkCmdBindIndexBuffer3KHR' );
     vkCmdBindVertexBuffers3KHR                                           := GetProcAddress( _VulkanLib, 'vkCmdBindVertexBuffers3KHR' );
     vkCmdDrawIndirect2KHR                                                := GetProcAddress( _VulkanLib, 'vkCmdDrawIndirect2KHR' );
     vkCmdDrawIndexedIndirect2KHR                                         := GetProcAddress( _VulkanLib, 'vkCmdDrawIndexedIndirect2KHR' );
     vkCmdDispatchIndirect2KHR                                            := GetProcAddress( _VulkanLib, 'vkCmdDispatchIndirect2KHR' );
     vkCmdCopyMemoryKHR                                                   := GetProcAddress( _VulkanLib, 'vkCmdCopyMemoryKHR' );
     vkCmdCopyMemoryToImageKHR                                            := GetProcAddress( _VulkanLib, 'vkCmdCopyMemoryToImageKHR' );
     vkCmdCopyImageToMemoryKHR                                            := GetProcAddress( _VulkanLib, 'vkCmdCopyImageToMemoryKHR' );
     vkCmdUpdateMemoryKHR                                                 := GetProcAddress( _VulkanLib, 'vkCmdUpdateMemoryKHR' );
     vkCmdFillMemoryKHR                                                   := GetProcAddress( _VulkanLib, 'vkCmdFillMemoryKHR' );
     vkCmdCopyQueryPoolResultsToMemoryKHR                                 := GetProcAddress( _VulkanLib, 'vkCmdCopyQueryPoolResultsToMemoryKHR' );
     vkCmdDrawIndirectCount2KHR                                           := GetProcAddress( _VulkanLib, 'vkCmdDrawIndirectCount2KHR' );
     vkCmdDrawIndexedIndirectCount2KHR                                    := GetProcAddress( _VulkanLib, 'vkCmdDrawIndexedIndirectCount2KHR' );
     vkCmdBeginConditionalRendering2EXT                                   := GetProcAddress( _VulkanLib, 'vkCmdBeginConditionalRendering2EXT' );
     vkCmdBindTransformFeedbackBuffers2EXT                                := GetProcAddress( _VulkanLib, 'vkCmdBindTransformFeedbackBuffers2EXT' );
     vkCmdBeginTransformFeedback2EXT                                      := GetProcAddress( _VulkanLib, 'vkCmdBeginTransformFeedback2EXT' );
     vkCmdEndTransformFeedback2EXT                                        := GetProcAddress( _VulkanLib, 'vkCmdEndTransformFeedback2EXT' );
     vkCmdDrawIndirectByteCount2EXT                                       := GetProcAddress( _VulkanLib, 'vkCmdDrawIndirectByteCount2EXT' );
     vkCmdDrawMeshTasksIndirect2EXT                                       := GetProcAddress( _VulkanLib, 'vkCmdDrawMeshTasksIndirect2EXT' );
     vkCmdDrawMeshTasksIndirectCount2EXT                                  := GetProcAddress( _VulkanLib, 'vkCmdDrawMeshTasksIndirectCount2EXT' );
     vkCmdWriteMarkerToMemoryAMD                                          := GetProcAddress( _VulkanLib, 'vkCmdWriteMarkerToMemoryAMD' );
     vkCreateAccelerationStructure2KHR                                    := GetProcAddress( _VulkanLib, 'vkCreateAccelerationStructure2KHR' );
     vkCmdCopyBuffer2KHR                                                  := GetProcAddress( _VulkanLib, 'vkCmdCopyBuffer2KHR' );
     vkCmdCopyImage2KHR                                                   := GetProcAddress( _VulkanLib, 'vkCmdCopyImage2KHR' );
     vkCmdCopyBufferToImage2KHR                                           := GetProcAddress( _VulkanLib, 'vkCmdCopyBufferToImage2KHR' );
     vkCmdCopyImageToBuffer2KHR                                           := GetProcAddress( _VulkanLib, 'vkCmdCopyImageToBuffer2KHR' );
     vkCmdBlitImage2KHR                                                   := GetProcAddress( _VulkanLib, 'vkCmdBlitImage2KHR' );
     vkCmdResolveImage2KHR                                                := GetProcAddress( _VulkanLib, 'vkCmdResolveImage2KHR' );
     vkCmdTraceRaysIndirect2KHR                                           := GetProcAddress( _VulkanLib, 'vkCmdTraceRaysIndirect2KHR' );
     vkGetDeviceBufferMemoryRequirementsKHR                               := GetProcAddress( _VulkanLib, 'vkGetDeviceBufferMemoryRequirementsKHR' );
     vkGetDeviceImageMemoryRequirementsKHR                                := GetProcAddress( _VulkanLib, 'vkGetDeviceImageMemoryRequirementsKHR' );
     vkGetDeviceImageSparseMemoryRequirementsKHR                          := GetProcAddress( _VulkanLib, 'vkGetDeviceImageSparseMemoryRequirementsKHR' );
     vkCmdBindIndexBuffer2KHR                                             := GetProcAddress( _VulkanLib, 'vkCmdBindIndexBuffer2KHR' );
     vkGetRenderingAreaGranularityKHR                                     := GetProcAddress( _VulkanLib, 'vkGetRenderingAreaGranularityKHR' );
     vkGetDeviceImageSubresourceLayoutKHR                                 := GetProcAddress( _VulkanLib, 'vkGetDeviceImageSubresourceLayoutKHR' );
     vkGetImageSubresourceLayout2KHR                                      := GetProcAddress( _VulkanLib, 'vkGetImageSubresourceLayout2KHR' );
     vkWaitForPresent2KHR                                                 := GetProcAddress( _VulkanLib, 'vkWaitForPresent2KHR' );
     vkCreatePipelineBinariesKHR                                          := GetProcAddress( _VulkanLib, 'vkCreatePipelineBinariesKHR' );
     vkDestroyPipelineBinaryKHR                                           := GetProcAddress( _VulkanLib, 'vkDestroyPipelineBinaryKHR' );
     vkGetPipelineKeyKHR                                                  := GetProcAddress( _VulkanLib, 'vkGetPipelineKeyKHR' );
     vkGetPipelineBinaryDataKHR                                           := GetProcAddress( _VulkanLib, 'vkGetPipelineBinaryDataKHR' );
     vkReleaseCapturedPipelineDataKHR                                     := GetProcAddress( _VulkanLib, 'vkReleaseCapturedPipelineDataKHR' );
     vkReleaseSwapchainImagesKHR                                          := GetProcAddress( _VulkanLib, 'vkReleaseSwapchainImagesKHR' );
     vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR                    := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR' );
     vkCmdSetLineStippleKHR                                               := GetProcAddress( _VulkanLib, 'vkCmdSetLineStippleKHR' );
     vkGetPhysicalDeviceCalibrateableTimeDomainsKHR                       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceCalibrateableTimeDomainsKHR' );
     vkGetCalibratedTimestampsKHR                                         := GetProcAddress( _VulkanLib, 'vkGetCalibratedTimestampsKHR' );
     vkCmdBindDescriptorSets2KHR                                          := GetProcAddress( _VulkanLib, 'vkCmdBindDescriptorSets2KHR' );
     vkCmdPushConstants2KHR                                               := GetProcAddress( _VulkanLib, 'vkCmdPushConstants2KHR' );
     vkCmdPushDescriptorSet2KHR                                           := GetProcAddress( _VulkanLib, 'vkCmdPushDescriptorSet2KHR' );
     vkCmdPushDescriptorSetWithTemplate2KHR                               := GetProcAddress( _VulkanLib, 'vkCmdPushDescriptorSetWithTemplate2KHR' );
     vkCmdSetDescriptorBufferOffsets2EXT                                  := GetProcAddress( _VulkanLib, 'vkCmdSetDescriptorBufferOffsets2EXT' );
     vkCmdBindDescriptorBufferEmbeddedSamplers2EXT                        := GetProcAddress( _VulkanLib, 'vkCmdBindDescriptorBufferEmbeddedSamplers2EXT' );
     vkCmdCopyMemoryIndirectKHR                                           := GetProcAddress( _VulkanLib, 'vkCmdCopyMemoryIndirectKHR' );
     vkCmdCopyMemoryToImageIndirectKHR                                    := GetProcAddress( _VulkanLib, 'vkCmdCopyMemoryToImageIndirectKHR' );
     vkGetDeviceFaultReportsKHR                                           := GetProcAddress( _VulkanLib, 'vkGetDeviceFaultReportsKHR' );
     vkGetDeviceFaultDebugInfoKHR                                         := GetProcAddress( _VulkanLib, 'vkGetDeviceFaultDebugInfoKHR' );
     vkCmdEndRendering2KHR                                                := GetProcAddress( _VulkanLib, 'vkCmdEndRendering2KHR' );
     vkCreateDebugReportCallbackEXT                                       := GetProcAddress( _VulkanLib, 'vkCreateDebugReportCallbackEXT' );
     vkDestroyDebugReportCallbackEXT                                      := GetProcAddress( _VulkanLib, 'vkDestroyDebugReportCallbackEXT' );
     vkDebugReportMessageEXT                                              := GetProcAddress( _VulkanLib, 'vkDebugReportMessageEXT' );
     vkDebugMarkerSetObjectTagEXT                                         := GetProcAddress( _VulkanLib, 'vkDebugMarkerSetObjectTagEXT' );
     vkDebugMarkerSetObjectNameEXT                                        := GetProcAddress( _VulkanLib, 'vkDebugMarkerSetObjectNameEXT' );
     vkCmdDebugMarkerBeginEXT                                             := GetProcAddress( _VulkanLib, 'vkCmdDebugMarkerBeginEXT' );
     vkCmdDebugMarkerEndEXT                                               := GetProcAddress( _VulkanLib, 'vkCmdDebugMarkerEndEXT' );
     vkCmdDebugMarkerInsertEXT                                            := GetProcAddress( _VulkanLib, 'vkCmdDebugMarkerInsertEXT' );
     vkCmdBindTransformFeedbackBuffersEXT                                 := GetProcAddress( _VulkanLib, 'vkCmdBindTransformFeedbackBuffersEXT' );
     vkCmdBeginTransformFeedbackEXT                                       := GetProcAddress( _VulkanLib, 'vkCmdBeginTransformFeedbackEXT' );
     vkCmdEndTransformFeedbackEXT                                         := GetProcAddress( _VulkanLib, 'vkCmdEndTransformFeedbackEXT' );
     vkCmdBeginQueryIndexedEXT                                            := GetProcAddress( _VulkanLib, 'vkCmdBeginQueryIndexedEXT' );
     vkCmdEndQueryIndexedEXT                                              := GetProcAddress( _VulkanLib, 'vkCmdEndQueryIndexedEXT' );
     vkCmdDrawIndirectByteCountEXT                                        := GetProcAddress( _VulkanLib, 'vkCmdDrawIndirectByteCountEXT' );
     vkCreateCuModuleNVX                                                  := GetProcAddress( _VulkanLib, 'vkCreateCuModuleNVX' );
     vkCreateCuFunctionNVX                                                := GetProcAddress( _VulkanLib, 'vkCreateCuFunctionNVX' );
     vkDestroyCuModuleNVX                                                 := GetProcAddress( _VulkanLib, 'vkDestroyCuModuleNVX' );
     vkDestroyCuFunctionNVX                                               := GetProcAddress( _VulkanLib, 'vkDestroyCuFunctionNVX' );
     vkCmdCuLaunchKernelNVX                                               := GetProcAddress( _VulkanLib, 'vkCmdCuLaunchKernelNVX' );
     vkGetImageViewHandleNVX                                              := GetProcAddress( _VulkanLib, 'vkGetImageViewHandleNVX' );
     vkGetImageViewHandle64NVX                                            := GetProcAddress( _VulkanLib, 'vkGetImageViewHandle64NVX' );
     vkGetImageViewAddressNVX                                             := GetProcAddress( _VulkanLib, 'vkGetImageViewAddressNVX' );
     vkGetDeviceCombinedImageSamplerIndexNVX                              := GetProcAddress( _VulkanLib, 'vkGetDeviceCombinedImageSamplerIndexNVX' );
     vkCmdDrawIndirectCountAMD                                            := GetProcAddress( _VulkanLib, 'vkCmdDrawIndirectCountAMD' );
     vkCmdDrawIndexedIndirectCountAMD                                     := GetProcAddress( _VulkanLib, 'vkCmdDrawIndexedIndirectCountAMD' );
     vkGetShaderInfoAMD                                                   := GetProcAddress( _VulkanLib, 'vkGetShaderInfoAMD' );
     vkGetPhysicalDeviceExternalImageFormatPropertiesNV                   := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalImageFormatPropertiesNV' );
     vkCmdBeginConditionalRenderingEXT                                    := GetProcAddress( _VulkanLib, 'vkCmdBeginConditionalRenderingEXT' );
     vkCmdEndConditionalRenderingEXT                                      := GetProcAddress( _VulkanLib, 'vkCmdEndConditionalRenderingEXT' );
     vkCmdSetViewportWScalingNV                                           := GetProcAddress( _VulkanLib, 'vkCmdSetViewportWScalingNV' );
     vkReleaseDisplayEXT                                                  := GetProcAddress( _VulkanLib, 'vkReleaseDisplayEXT' );
     vkGetPhysicalDeviceSurfaceCapabilities2EXT                           := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfaceCapabilities2EXT' );
     vkDisplayPowerControlEXT                                             := GetProcAddress( _VulkanLib, 'vkDisplayPowerControlEXT' );
     vkRegisterDeviceEventEXT                                             := GetProcAddress( _VulkanLib, 'vkRegisterDeviceEventEXT' );
     vkRegisterDisplayEventEXT                                            := GetProcAddress( _VulkanLib, 'vkRegisterDisplayEventEXT' );
     vkGetSwapchainCounterEXT                                             := GetProcAddress( _VulkanLib, 'vkGetSwapchainCounterEXT' );
     vkGetRefreshCycleDurationGOOGLE                                      := GetProcAddress( _VulkanLib, 'vkGetRefreshCycleDurationGOOGLE' );
     vkGetPastPresentationTimingGOOGLE                                    := GetProcAddress( _VulkanLib, 'vkGetPastPresentationTimingGOOGLE' );
     vkCmdSetDiscardRectangleEXT                                          := GetProcAddress( _VulkanLib, 'vkCmdSetDiscardRectangleEXT' );
     vkCmdSetDiscardRectangleEnableEXT                                    := GetProcAddress( _VulkanLib, 'vkCmdSetDiscardRectangleEnableEXT' );
     vkCmdSetDiscardRectangleModeEXT                                      := GetProcAddress( _VulkanLib, 'vkCmdSetDiscardRectangleModeEXT' );
     vkSetHdrMetadataEXT                                                  := GetProcAddress( _VulkanLib, 'vkSetHdrMetadataEXT' );
     vkSetDebugUtilsObjectNameEXT                                         := GetProcAddress( _VulkanLib, 'vkSetDebugUtilsObjectNameEXT' );
     vkSetDebugUtilsObjectTagEXT                                          := GetProcAddress( _VulkanLib, 'vkSetDebugUtilsObjectTagEXT' );
     vkQueueBeginDebugUtilsLabelEXT                                       := GetProcAddress( _VulkanLib, 'vkQueueBeginDebugUtilsLabelEXT' );
     vkQueueEndDebugUtilsLabelEXT                                         := GetProcAddress( _VulkanLib, 'vkQueueEndDebugUtilsLabelEXT' );
     vkQueueInsertDebugUtilsLabelEXT                                      := GetProcAddress( _VulkanLib, 'vkQueueInsertDebugUtilsLabelEXT' );
     vkCmdBeginDebugUtilsLabelEXT                                         := GetProcAddress( _VulkanLib, 'vkCmdBeginDebugUtilsLabelEXT' );
     vkCmdEndDebugUtilsLabelEXT                                           := GetProcAddress( _VulkanLib, 'vkCmdEndDebugUtilsLabelEXT' );
     vkCmdInsertDebugUtilsLabelEXT                                        := GetProcAddress( _VulkanLib, 'vkCmdInsertDebugUtilsLabelEXT' );
     vkCreateDebugUtilsMessengerEXT                                       := GetProcAddress( _VulkanLib, 'vkCreateDebugUtilsMessengerEXT' );
     vkDestroyDebugUtilsMessengerEXT                                      := GetProcAddress( _VulkanLib, 'vkDestroyDebugUtilsMessengerEXT' );
     vkSubmitDebugUtilsMessageEXT                                         := GetProcAddress( _VulkanLib, 'vkSubmitDebugUtilsMessageEXT' );
     vkCreateGpaSessionAMD                                                := GetProcAddress( _VulkanLib, 'vkCreateGpaSessionAMD' );
     vkDestroyGpaSessionAMD                                               := GetProcAddress( _VulkanLib, 'vkDestroyGpaSessionAMD' );
     vkSetGpaDeviceClockModeAMD                                           := GetProcAddress( _VulkanLib, 'vkSetGpaDeviceClockModeAMD' );
     vkGetGpaDeviceClockInfoAMD                                           := GetProcAddress( _VulkanLib, 'vkGetGpaDeviceClockInfoAMD' );
     vkCmdBeginGpaSessionAMD                                              := GetProcAddress( _VulkanLib, 'vkCmdBeginGpaSessionAMD' );
     vkCmdEndGpaSessionAMD                                                := GetProcAddress( _VulkanLib, 'vkCmdEndGpaSessionAMD' );
     vkCmdBeginGpaSampleAMD                                               := GetProcAddress( _VulkanLib, 'vkCmdBeginGpaSampleAMD' );
     vkCmdEndGpaSampleAMD                                                 := GetProcAddress( _VulkanLib, 'vkCmdEndGpaSampleAMD' );
     vkGetGpaSessionStatusAMD                                             := GetProcAddress( _VulkanLib, 'vkGetGpaSessionStatusAMD' );
     vkGetGpaSessionResultsAMD                                            := GetProcAddress( _VulkanLib, 'vkGetGpaSessionResultsAMD' );
     vkResetGpaSessionAMD                                                 := GetProcAddress( _VulkanLib, 'vkResetGpaSessionAMD' );
     vkCmdCopyGpaSessionResultsAMD                                        := GetProcAddress( _VulkanLib, 'vkCmdCopyGpaSessionResultsAMD' );
     vkWriteSamplerDescriptorsEXT                                         := GetProcAddress( _VulkanLib, 'vkWriteSamplerDescriptorsEXT' );
     vkWriteResourceDescriptorsEXT                                        := GetProcAddress( _VulkanLib, 'vkWriteResourceDescriptorsEXT' );
     vkCmdBindSamplerHeapEXT                                              := GetProcAddress( _VulkanLib, 'vkCmdBindSamplerHeapEXT' );
     vkCmdBindResourceHeapEXT                                             := GetProcAddress( _VulkanLib, 'vkCmdBindResourceHeapEXT' );
     vkCmdPushDataEXT                                                     := GetProcAddress( _VulkanLib, 'vkCmdPushDataEXT' );
     vkGetImageOpaqueCaptureDataEXT                                       := GetProcAddress( _VulkanLib, 'vkGetImageOpaqueCaptureDataEXT' );
     vkGetPhysicalDeviceDescriptorSizeEXT                                 := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceDescriptorSizeEXT' );
     vkRegisterCustomBorderColorEXT                                       := GetProcAddress( _VulkanLib, 'vkRegisterCustomBorderColorEXT' );
     vkUnregisterCustomBorderColorEXT                                     := GetProcAddress( _VulkanLib, 'vkUnregisterCustomBorderColorEXT' );
     vkGetTensorOpaqueCaptureDataARM                                      := GetProcAddress( _VulkanLib, 'vkGetTensorOpaqueCaptureDataARM' );
     vkCmdSetSampleLocationsEXT                                           := GetProcAddress( _VulkanLib, 'vkCmdSetSampleLocationsEXT' );
     vkGetPhysicalDeviceMultisamplePropertiesEXT                          := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceMultisamplePropertiesEXT' );
     vkGetImageDrmFormatModifierPropertiesEXT                             := GetProcAddress( _VulkanLib, 'vkGetImageDrmFormatModifierPropertiesEXT' );
     vkCreateValidationCacheEXT                                           := GetProcAddress( _VulkanLib, 'vkCreateValidationCacheEXT' );
     vkDestroyValidationCacheEXT                                          := GetProcAddress( _VulkanLib, 'vkDestroyValidationCacheEXT' );
     vkMergeValidationCachesEXT                                           := GetProcAddress( _VulkanLib, 'vkMergeValidationCachesEXT' );
     vkGetValidationCacheDataEXT                                          := GetProcAddress( _VulkanLib, 'vkGetValidationCacheDataEXT' );
     vkCmdBindShadingRateImageNV                                          := GetProcAddress( _VulkanLib, 'vkCmdBindShadingRateImageNV' );
     vkCmdSetViewportShadingRatePaletteNV                                 := GetProcAddress( _VulkanLib, 'vkCmdSetViewportShadingRatePaletteNV' );
     vkCmdSetCoarseSampleOrderNV                                          := GetProcAddress( _VulkanLib, 'vkCmdSetCoarseSampleOrderNV' );
     vkCreateAccelerationStructureNV                                      := GetProcAddress( _VulkanLib, 'vkCreateAccelerationStructureNV' );
     vkDestroyAccelerationStructureNV                                     := GetProcAddress( _VulkanLib, 'vkDestroyAccelerationStructureNV' );
     vkGetAccelerationStructureMemoryRequirementsNV                       := GetProcAddress( _VulkanLib, 'vkGetAccelerationStructureMemoryRequirementsNV' );
     vkBindAccelerationStructureMemoryNV                                  := GetProcAddress( _VulkanLib, 'vkBindAccelerationStructureMemoryNV' );
     vkCmdBuildAccelerationStructureNV                                    := GetProcAddress( _VulkanLib, 'vkCmdBuildAccelerationStructureNV' );
     vkCmdCopyAccelerationStructureNV                                     := GetProcAddress( _VulkanLib, 'vkCmdCopyAccelerationStructureNV' );
     vkCmdTraceRaysNV                                                     := GetProcAddress( _VulkanLib, 'vkCmdTraceRaysNV' );
     vkCreateRayTracingPipelinesNV                                        := GetProcAddress( _VulkanLib, 'vkCreateRayTracingPipelinesNV' );
     vkGetRayTracingShaderGroupHandlesKHR                                 := GetProcAddress( _VulkanLib, 'vkGetRayTracingShaderGroupHandlesKHR' );
     vkGetRayTracingShaderGroupHandlesNV                                  := GetProcAddress( _VulkanLib, 'vkGetRayTracingShaderGroupHandlesNV' );
     vkGetAccelerationStructureHandleNV                                   := GetProcAddress( _VulkanLib, 'vkGetAccelerationStructureHandleNV' );
     vkCmdWriteAccelerationStructuresPropertiesNV                         := GetProcAddress( _VulkanLib, 'vkCmdWriteAccelerationStructuresPropertiesNV' );
     vkCompileDeferredNV                                                  := GetProcAddress( _VulkanLib, 'vkCompileDeferredNV' );
     vkGetMemoryHostPointerPropertiesEXT                                  := GetProcAddress( _VulkanLib, 'vkGetMemoryHostPointerPropertiesEXT' );
     vkCmdWriteBufferMarkerAMD                                            := GetProcAddress( _VulkanLib, 'vkCmdWriteBufferMarkerAMD' );
     vkCmdWriteBufferMarker2AMD                                           := GetProcAddress( _VulkanLib, 'vkCmdWriteBufferMarker2AMD' );
     vkGetPhysicalDeviceCalibrateableTimeDomainsEXT                       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceCalibrateableTimeDomainsEXT' );
     vkGetCalibratedTimestampsEXT                                         := GetProcAddress( _VulkanLib, 'vkGetCalibratedTimestampsEXT' );
     vkCmdDrawMeshTasksNV                                                 := GetProcAddress( _VulkanLib, 'vkCmdDrawMeshTasksNV' );
     vkCmdDrawMeshTasksIndirectNV                                         := GetProcAddress( _VulkanLib, 'vkCmdDrawMeshTasksIndirectNV' );
     vkCmdDrawMeshTasksIndirectCountNV                                    := GetProcAddress( _VulkanLib, 'vkCmdDrawMeshTasksIndirectCountNV' );
     vkCmdSetExclusiveScissorEnableNV                                     := GetProcAddress( _VulkanLib, 'vkCmdSetExclusiveScissorEnableNV' );
     vkCmdSetExclusiveScissorNV                                           := GetProcAddress( _VulkanLib, 'vkCmdSetExclusiveScissorNV' );
     vkCmdSetCheckpointNV                                                 := GetProcAddress( _VulkanLib, 'vkCmdSetCheckpointNV' );
     vkGetQueueCheckpointDataNV                                           := GetProcAddress( _VulkanLib, 'vkGetQueueCheckpointDataNV' );
     vkGetQueueCheckpointData2NV                                          := GetProcAddress( _VulkanLib, 'vkGetQueueCheckpointData2NV' );
     vkSetSwapchainPresentTimingQueueSizeEXT                              := GetProcAddress( _VulkanLib, 'vkSetSwapchainPresentTimingQueueSizeEXT' );
     vkGetSwapchainTimingPropertiesEXT                                    := GetProcAddress( _VulkanLib, 'vkGetSwapchainTimingPropertiesEXT' );
     vkGetSwapchainTimeDomainPropertiesEXT                                := GetProcAddress( _VulkanLib, 'vkGetSwapchainTimeDomainPropertiesEXT' );
     vkGetPastPresentationTimingEXT                                       := GetProcAddress( _VulkanLib, 'vkGetPastPresentationTimingEXT' );
     vkInitializePerformanceApiINTEL                                      := GetProcAddress( _VulkanLib, 'vkInitializePerformanceApiINTEL' );
     vkUninitializePerformanceApiINTEL                                    := GetProcAddress( _VulkanLib, 'vkUninitializePerformanceApiINTEL' );
     vkCmdSetPerformanceMarkerINTEL                                       := GetProcAddress( _VulkanLib, 'vkCmdSetPerformanceMarkerINTEL' );
     vkCmdSetPerformanceStreamMarkerINTEL                                 := GetProcAddress( _VulkanLib, 'vkCmdSetPerformanceStreamMarkerINTEL' );
     vkCmdSetPerformanceOverrideINTEL                                     := GetProcAddress( _VulkanLib, 'vkCmdSetPerformanceOverrideINTEL' );
     vkAcquirePerformanceConfigurationINTEL                               := GetProcAddress( _VulkanLib, 'vkAcquirePerformanceConfigurationINTEL' );
     vkReleasePerformanceConfigurationINTEL                               := GetProcAddress( _VulkanLib, 'vkReleasePerformanceConfigurationINTEL' );
     vkQueueSetPerformanceConfigurationINTEL                              := GetProcAddress( _VulkanLib, 'vkQueueSetPerformanceConfigurationINTEL' );
     vkGetPerformanceParameterINTEL                                       := GetProcAddress( _VulkanLib, 'vkGetPerformanceParameterINTEL' );
     vkSetLocalDimmingAMD                                                 := GetProcAddress( _VulkanLib, 'vkSetLocalDimmingAMD' );
     vkGetBufferDeviceAddressEXT                                          := GetProcAddress( _VulkanLib, 'vkGetBufferDeviceAddressEXT' );
     vkGetPhysicalDeviceToolPropertiesEXT                                 := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceToolPropertiesEXT' );
     vkGetPhysicalDeviceCooperativeMatrixPropertiesNV                     := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceCooperativeMatrixPropertiesNV' );
     vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV    := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV' );
     vkCreateHeadlessSurfaceEXT                                           := GetProcAddress( _VulkanLib, 'vkCreateHeadlessSurfaceEXT' );
     vkCmdSetLineStippleEXT                                               := GetProcAddress( _VulkanLib, 'vkCmdSetLineStippleEXT' );
     vkResetQueryPoolEXT                                                  := GetProcAddress( _VulkanLib, 'vkResetQueryPoolEXT' );
     vkCmdSetCullModeEXT                                                  := GetProcAddress( _VulkanLib, 'vkCmdSetCullModeEXT' );
     vkCmdSetFrontFaceEXT                                                 := GetProcAddress( _VulkanLib, 'vkCmdSetFrontFaceEXT' );
     vkCmdSetPrimitiveTopologyEXT                                         := GetProcAddress( _VulkanLib, 'vkCmdSetPrimitiveTopologyEXT' );
     vkCmdSetViewportWithCountEXT                                         := GetProcAddress( _VulkanLib, 'vkCmdSetViewportWithCountEXT' );
     vkCmdSetScissorWithCountEXT                                          := GetProcAddress( _VulkanLib, 'vkCmdSetScissorWithCountEXT' );
     vkCmdBindVertexBuffers2EXT                                           := GetProcAddress( _VulkanLib, 'vkCmdBindVertexBuffers2EXT' );
     vkCmdSetDepthTestEnableEXT                                           := GetProcAddress( _VulkanLib, 'vkCmdSetDepthTestEnableEXT' );
     vkCmdSetDepthWriteEnableEXT                                          := GetProcAddress( _VulkanLib, 'vkCmdSetDepthWriteEnableEXT' );
     vkCmdSetDepthCompareOpEXT                                            := GetProcAddress( _VulkanLib, 'vkCmdSetDepthCompareOpEXT' );
     vkCmdSetDepthBoundsTestEnableEXT                                     := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBoundsTestEnableEXT' );
     vkCmdSetStencilTestEnableEXT                                         := GetProcAddress( _VulkanLib, 'vkCmdSetStencilTestEnableEXT' );
     vkCmdSetStencilOpEXT                                                 := GetProcAddress( _VulkanLib, 'vkCmdSetStencilOpEXT' );
     vkCopyMemoryToImageEXT                                               := GetProcAddress( _VulkanLib, 'vkCopyMemoryToImageEXT' );
     vkCopyImageToMemoryEXT                                               := GetProcAddress( _VulkanLib, 'vkCopyImageToMemoryEXT' );
     vkCopyImageToImageEXT                                                := GetProcAddress( _VulkanLib, 'vkCopyImageToImageEXT' );
     vkTransitionImageLayoutEXT                                           := GetProcAddress( _VulkanLib, 'vkTransitionImageLayoutEXT' );
     vkGetImageSubresourceLayout2EXT                                      := GetProcAddress( _VulkanLib, 'vkGetImageSubresourceLayout2EXT' );
     vkReleaseSwapchainImagesEXT                                          := GetProcAddress( _VulkanLib, 'vkReleaseSwapchainImagesEXT' );
     vkGetGeneratedCommandsMemoryRequirementsNV                           := GetProcAddress( _VulkanLib, 'vkGetGeneratedCommandsMemoryRequirementsNV' );
     vkCmdPreprocessGeneratedCommandsNV                                   := GetProcAddress( _VulkanLib, 'vkCmdPreprocessGeneratedCommandsNV' );
     vkCmdExecuteGeneratedCommandsNV                                      := GetProcAddress( _VulkanLib, 'vkCmdExecuteGeneratedCommandsNV' );
     vkCmdBindPipelineShaderGroupNV                                       := GetProcAddress( _VulkanLib, 'vkCmdBindPipelineShaderGroupNV' );
     vkCreateIndirectCommandsLayoutNV                                     := GetProcAddress( _VulkanLib, 'vkCreateIndirectCommandsLayoutNV' );
     vkDestroyIndirectCommandsLayoutNV                                    := GetProcAddress( _VulkanLib, 'vkDestroyIndirectCommandsLayoutNV' );
     vkCmdSetDepthBias2EXT                                                := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBias2EXT' );
     vkAcquireDrmDisplayEXT                                               := GetProcAddress( _VulkanLib, 'vkAcquireDrmDisplayEXT' );
     vkGetDrmDisplayEXT                                                   := GetProcAddress( _VulkanLib, 'vkGetDrmDisplayEXT' );
     vkCreatePrivateDataSlotEXT                                           := GetProcAddress( _VulkanLib, 'vkCreatePrivateDataSlotEXT' );
     vkDestroyPrivateDataSlotEXT                                          := GetProcAddress( _VulkanLib, 'vkDestroyPrivateDataSlotEXT' );
     vkSetPrivateDataEXT                                                  := GetProcAddress( _VulkanLib, 'vkSetPrivateDataEXT' );
     vkGetPrivateDataEXT                                                  := GetProcAddress( _VulkanLib, 'vkGetPrivateDataEXT' );
     vkQueueSetPerfHintQCOM                                               := GetProcAddress( _VulkanLib, 'vkQueueSetPerfHintQCOM' );
     vkCmdDispatchTileQCOM                                                := GetProcAddress( _VulkanLib, 'vkCmdDispatchTileQCOM' );
     vkCmdBeginPerTileExecutionQCOM                                       := GetProcAddress( _VulkanLib, 'vkCmdBeginPerTileExecutionQCOM' );
     vkCmdEndPerTileExecutionQCOM                                         := GetProcAddress( _VulkanLib, 'vkCmdEndPerTileExecutionQCOM' );
     vkSetLatencySleepModeLegacyNV                                        := GetProcAddress( _VulkanLib, 'vkSetLatencySleepModeLegacyNV' );
     vkLatencySleepLegacyNV                                               := GetProcAddress( _VulkanLib, 'vkLatencySleepLegacyNV' );
     vkSetLatencyMarkerLegacyNV                                           := GetProcAddress( _VulkanLib, 'vkSetLatencyMarkerLegacyNV' );
     vkGetLatencyTimingsLegacyNV                                          := GetProcAddress( _VulkanLib, 'vkGetLatencyTimingsLegacyNV' );
     vkQueueNotifyOutOfBandLegacyNV                                       := GetProcAddress( _VulkanLib, 'vkQueueNotifyOutOfBandLegacyNV' );
     vkGetSleepStatusLegacyNV                                             := GetProcAddress( _VulkanLib, 'vkGetSleepStatusLegacyNV' );
     vkShutdownLatencyDeviceLegacyNV                                      := GetProcAddress( _VulkanLib, 'vkShutdownLatencyDeviceLegacyNV' );
     vkGetDescriptorSetLayoutSizeEXT                                      := GetProcAddress( _VulkanLib, 'vkGetDescriptorSetLayoutSizeEXT' );
     vkGetDescriptorSetLayoutBindingOffsetEXT                             := GetProcAddress( _VulkanLib, 'vkGetDescriptorSetLayoutBindingOffsetEXT' );
     vkGetDescriptorEXT                                                   := GetProcAddress( _VulkanLib, 'vkGetDescriptorEXT' );
     vkCmdBindDescriptorBuffersEXT                                        := GetProcAddress( _VulkanLib, 'vkCmdBindDescriptorBuffersEXT' );
     vkCmdSetDescriptorBufferOffsetsEXT                                   := GetProcAddress( _VulkanLib, 'vkCmdSetDescriptorBufferOffsetsEXT' );
     vkCmdBindDescriptorBufferEmbeddedSamplersEXT                         := GetProcAddress( _VulkanLib, 'vkCmdBindDescriptorBufferEmbeddedSamplersEXT' );
     vkGetBufferOpaqueCaptureDescriptorDataEXT                            := GetProcAddress( _VulkanLib, 'vkGetBufferOpaqueCaptureDescriptorDataEXT' );
     vkGetImageOpaqueCaptureDescriptorDataEXT                             := GetProcAddress( _VulkanLib, 'vkGetImageOpaqueCaptureDescriptorDataEXT' );
     vkGetImageViewOpaqueCaptureDescriptorDataEXT                         := GetProcAddress( _VulkanLib, 'vkGetImageViewOpaqueCaptureDescriptorDataEXT' );
     vkGetSamplerOpaqueCaptureDescriptorDataEXT                           := GetProcAddress( _VulkanLib, 'vkGetSamplerOpaqueCaptureDescriptorDataEXT' );
     vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT             := GetProcAddress( _VulkanLib, 'vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT' );
     vkCmdSetFragmentShadingRateEnumNV                                    := GetProcAddress( _VulkanLib, 'vkCmdSetFragmentShadingRateEnumNV' );
     vkGetDeviceFaultInfoEXT                                              := GetProcAddress( _VulkanLib, 'vkGetDeviceFaultInfoEXT' );
     vkCmdSetVertexInputEXT                                               := GetProcAddress( _VulkanLib, 'vkCmdSetVertexInputEXT' );
     vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI                      := GetProcAddress( _VulkanLib, 'vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI' );
     vkCmdSubpassShadingHUAWEI                                            := GetProcAddress( _VulkanLib, 'vkCmdSubpassShadingHUAWEI' );
     vkCmdBindInvocationMaskHUAWEI                                        := GetProcAddress( _VulkanLib, 'vkCmdBindInvocationMaskHUAWEI' );
     vkGetMemoryRemoteAddressNV                                           := GetProcAddress( _VulkanLib, 'vkGetMemoryRemoteAddressNV' );
     vkGetPipelinePropertiesEXT                                           := GetProcAddress( _VulkanLib, 'vkGetPipelinePropertiesEXT' );
     vkCmdSetPatchControlPointsEXT                                        := GetProcAddress( _VulkanLib, 'vkCmdSetPatchControlPointsEXT' );
     vkCmdSetRasterizerDiscardEnableEXT                                   := GetProcAddress( _VulkanLib, 'vkCmdSetRasterizerDiscardEnableEXT' );
     vkCmdSetDepthBiasEnableEXT                                           := GetProcAddress( _VulkanLib, 'vkCmdSetDepthBiasEnableEXT' );
     vkCmdSetLogicOpEXT                                                   := GetProcAddress( _VulkanLib, 'vkCmdSetLogicOpEXT' );
     vkCmdSetPrimitiveRestartEnableEXT                                    := GetProcAddress( _VulkanLib, 'vkCmdSetPrimitiveRestartEnableEXT' );
     vkCmdSetColorWriteEnableEXT                                          := GetProcAddress( _VulkanLib, 'vkCmdSetColorWriteEnableEXT' );
     vkCmdDrawMultiEXT                                                    := GetProcAddress( _VulkanLib, 'vkCmdDrawMultiEXT' );
     vkCmdDrawMultiIndexedEXT                                             := GetProcAddress( _VulkanLib, 'vkCmdDrawMultiIndexedEXT' );
     vkCreateMicromapEXT                                                  := GetProcAddress( _VulkanLib, 'vkCreateMicromapEXT' );
     vkDestroyMicromapEXT                                                 := GetProcAddress( _VulkanLib, 'vkDestroyMicromapEXT' );
     vkCmdBuildMicromapsEXT                                               := GetProcAddress( _VulkanLib, 'vkCmdBuildMicromapsEXT' );
     vkBuildMicromapsEXT                                                  := GetProcAddress( _VulkanLib, 'vkBuildMicromapsEXT' );
     vkCopyMicromapEXT                                                    := GetProcAddress( _VulkanLib, 'vkCopyMicromapEXT' );
     vkCopyMicromapToMemoryEXT                                            := GetProcAddress( _VulkanLib, 'vkCopyMicromapToMemoryEXT' );
     vkCopyMemoryToMicromapEXT                                            := GetProcAddress( _VulkanLib, 'vkCopyMemoryToMicromapEXT' );
     vkWriteMicromapsPropertiesEXT                                        := GetProcAddress( _VulkanLib, 'vkWriteMicromapsPropertiesEXT' );
     vkCmdCopyMicromapEXT                                                 := GetProcAddress( _VulkanLib, 'vkCmdCopyMicromapEXT' );
     vkCmdCopyMicromapToMemoryEXT                                         := GetProcAddress( _VulkanLib, 'vkCmdCopyMicromapToMemoryEXT' );
     vkCmdCopyMemoryToMicromapEXT                                         := GetProcAddress( _VulkanLib, 'vkCmdCopyMemoryToMicromapEXT' );
     vkCmdWriteMicromapsPropertiesEXT                                     := GetProcAddress( _VulkanLib, 'vkCmdWriteMicromapsPropertiesEXT' );
     vkGetDeviceMicromapCompatibilityEXT                                  := GetProcAddress( _VulkanLib, 'vkGetDeviceMicromapCompatibilityEXT' );
     vkGetMicromapBuildSizesEXT                                           := GetProcAddress( _VulkanLib, 'vkGetMicromapBuildSizesEXT' );
     vkCmdDrawClusterHUAWEI                                               := GetProcAddress( _VulkanLib, 'vkCmdDrawClusterHUAWEI' );
     vkCmdDrawClusterIndirectHUAWEI                                       := GetProcAddress( _VulkanLib, 'vkCmdDrawClusterIndirectHUAWEI' );
     vkSetDeviceMemoryPriorityEXT                                         := GetProcAddress( _VulkanLib, 'vkSetDeviceMemoryPriorityEXT' );
     vkCmdSetDispatchParametersARM                                        := GetProcAddress( _VulkanLib, 'vkCmdSetDispatchParametersARM' );
     vkGetDescriptorSetLayoutHostMappingInfoVALVE                         := GetProcAddress( _VulkanLib, 'vkGetDescriptorSetLayoutHostMappingInfoVALVE' );
     vkGetDescriptorSetHostMappingVALVE                                   := GetProcAddress( _VulkanLib, 'vkGetDescriptorSetHostMappingVALVE' );
     vkCmdCopyMemoryIndirectNV                                            := GetProcAddress( _VulkanLib, 'vkCmdCopyMemoryIndirectNV' );
     vkCmdCopyMemoryToImageIndirectNV                                     := GetProcAddress( _VulkanLib, 'vkCmdCopyMemoryToImageIndirectNV' );
     vkCmdDecompressMemoryNV                                              := GetProcAddress( _VulkanLib, 'vkCmdDecompressMemoryNV' );
     vkCmdDecompressMemoryIndirectCountNV                                 := GetProcAddress( _VulkanLib, 'vkCmdDecompressMemoryIndirectCountNV' );
     vkGetPipelineIndirectMemoryRequirementsNV                            := GetProcAddress( _VulkanLib, 'vkGetPipelineIndirectMemoryRequirementsNV' );
     vkCmdUpdatePipelineIndirectBufferNV                                  := GetProcAddress( _VulkanLib, 'vkCmdUpdatePipelineIndirectBufferNV' );
     vkGetPipelineIndirectDeviceAddressNV                                 := GetProcAddress( _VulkanLib, 'vkGetPipelineIndirectDeviceAddressNV' );
     vkCmdSetDepthClampEnableEXT                                          := GetProcAddress( _VulkanLib, 'vkCmdSetDepthClampEnableEXT' );
     vkCmdSetPolygonModeEXT                                               := GetProcAddress( _VulkanLib, 'vkCmdSetPolygonModeEXT' );
     vkCmdSetRasterizationSamplesEXT                                      := GetProcAddress( _VulkanLib, 'vkCmdSetRasterizationSamplesEXT' );
     vkCmdSetSampleMaskEXT                                                := GetProcAddress( _VulkanLib, 'vkCmdSetSampleMaskEXT' );
     vkCmdSetAlphaToCoverageEnableEXT                                     := GetProcAddress( _VulkanLib, 'vkCmdSetAlphaToCoverageEnableEXT' );
     vkCmdSetAlphaToOneEnableEXT                                          := GetProcAddress( _VulkanLib, 'vkCmdSetAlphaToOneEnableEXT' );
     vkCmdSetLogicOpEnableEXT                                             := GetProcAddress( _VulkanLib, 'vkCmdSetLogicOpEnableEXT' );
     vkCmdSetColorBlendEnableEXT                                          := GetProcAddress( _VulkanLib, 'vkCmdSetColorBlendEnableEXT' );
     vkCmdSetColorBlendEquationEXT                                        := GetProcAddress( _VulkanLib, 'vkCmdSetColorBlendEquationEXT' );
     vkCmdSetColorWriteMaskEXT                                            := GetProcAddress( _VulkanLib, 'vkCmdSetColorWriteMaskEXT' );
     vkCmdSetTessellationDomainOriginEXT                                  := GetProcAddress( _VulkanLib, 'vkCmdSetTessellationDomainOriginEXT' );
     vkCmdSetRasterizationStreamEXT                                       := GetProcAddress( _VulkanLib, 'vkCmdSetRasterizationStreamEXT' );
     vkCmdSetConservativeRasterizationModeEXT                             := GetProcAddress( _VulkanLib, 'vkCmdSetConservativeRasterizationModeEXT' );
     vkCmdSetExtraPrimitiveOverestimationSizeEXT                          := GetProcAddress( _VulkanLib, 'vkCmdSetExtraPrimitiveOverestimationSizeEXT' );
     vkCmdSetDepthClipEnableEXT                                           := GetProcAddress( _VulkanLib, 'vkCmdSetDepthClipEnableEXT' );
     vkCmdSetSampleLocationsEnableEXT                                     := GetProcAddress( _VulkanLib, 'vkCmdSetSampleLocationsEnableEXT' );
     vkCmdSetColorBlendAdvancedEXT                                        := GetProcAddress( _VulkanLib, 'vkCmdSetColorBlendAdvancedEXT' );
     vkCmdSetProvokingVertexModeEXT                                       := GetProcAddress( _VulkanLib, 'vkCmdSetProvokingVertexModeEXT' );
     vkCmdSetLineRasterizationModeEXT                                     := GetProcAddress( _VulkanLib, 'vkCmdSetLineRasterizationModeEXT' );
     vkCmdSetLineStippleEnableEXT                                         := GetProcAddress( _VulkanLib, 'vkCmdSetLineStippleEnableEXT' );
     vkCmdSetDepthClipNegativeOneToOneEXT                                 := GetProcAddress( _VulkanLib, 'vkCmdSetDepthClipNegativeOneToOneEXT' );
     vkCmdSetViewportWScalingEnableNV                                     := GetProcAddress( _VulkanLib, 'vkCmdSetViewportWScalingEnableNV' );
     vkCmdSetViewportSwizzleNV                                            := GetProcAddress( _VulkanLib, 'vkCmdSetViewportSwizzleNV' );
     vkCmdSetCoverageToColorEnableNV                                      := GetProcAddress( _VulkanLib, 'vkCmdSetCoverageToColorEnableNV' );
     vkCmdSetCoverageToColorLocationNV                                    := GetProcAddress( _VulkanLib, 'vkCmdSetCoverageToColorLocationNV' );
     vkCmdSetCoverageModulationModeNV                                     := GetProcAddress( _VulkanLib, 'vkCmdSetCoverageModulationModeNV' );
     vkCmdSetCoverageModulationTableEnableNV                              := GetProcAddress( _VulkanLib, 'vkCmdSetCoverageModulationTableEnableNV' );
     vkCmdSetCoverageModulationTableNV                                    := GetProcAddress( _VulkanLib, 'vkCmdSetCoverageModulationTableNV' );
     vkCmdSetShadingRateImageEnableNV                                     := GetProcAddress( _VulkanLib, 'vkCmdSetShadingRateImageEnableNV' );
     vkCmdSetRepresentativeFragmentTestEnableNV                           := GetProcAddress( _VulkanLib, 'vkCmdSetRepresentativeFragmentTestEnableNV' );
     vkCmdSetCoverageReductionModeNV                                      := GetProcAddress( _VulkanLib, 'vkCmdSetCoverageReductionModeNV' );
     vkCreateTensorARM                                                    := GetProcAddress( _VulkanLib, 'vkCreateTensorARM' );
     vkDestroyTensorARM                                                   := GetProcAddress( _VulkanLib, 'vkDestroyTensorARM' );
     vkCreateTensorViewARM                                                := GetProcAddress( _VulkanLib, 'vkCreateTensorViewARM' );
     vkDestroyTensorViewARM                                               := GetProcAddress( _VulkanLib, 'vkDestroyTensorViewARM' );
     vkGetTensorMemoryRequirementsARM                                     := GetProcAddress( _VulkanLib, 'vkGetTensorMemoryRequirementsARM' );
     vkBindTensorMemoryARM                                                := GetProcAddress( _VulkanLib, 'vkBindTensorMemoryARM' );
     vkGetDeviceTensorMemoryRequirementsARM                               := GetProcAddress( _VulkanLib, 'vkGetDeviceTensorMemoryRequirementsARM' );
     vkCmdCopyTensorARM                                                   := GetProcAddress( _VulkanLib, 'vkCmdCopyTensorARM' );
     vkGetPhysicalDeviceExternalTensorPropertiesARM                       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceExternalTensorPropertiesARM' );
     vkGetTensorOpaqueCaptureDescriptorDataARM                            := GetProcAddress( _VulkanLib, 'vkGetTensorOpaqueCaptureDescriptorDataARM' );
     vkGetTensorViewOpaqueCaptureDescriptorDataARM                        := GetProcAddress( _VulkanLib, 'vkGetTensorViewOpaqueCaptureDescriptorDataARM' );
     vkGetShaderModuleIdentifierEXT                                       := GetProcAddress( _VulkanLib, 'vkGetShaderModuleIdentifierEXT' );
     vkGetShaderModuleCreateInfoIdentifierEXT                             := GetProcAddress( _VulkanLib, 'vkGetShaderModuleCreateInfoIdentifierEXT' );
     vkGetPhysicalDeviceOpticalFlowImageFormatsNV                         := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceOpticalFlowImageFormatsNV' );
     vkCreateOpticalFlowSessionNV                                         := GetProcAddress( _VulkanLib, 'vkCreateOpticalFlowSessionNV' );
     vkDestroyOpticalFlowSessionNV                                        := GetProcAddress( _VulkanLib, 'vkDestroyOpticalFlowSessionNV' );
     vkBindOpticalFlowSessionImageNV                                      := GetProcAddress( _VulkanLib, 'vkBindOpticalFlowSessionImageNV' );
     vkCmdOpticalFlowExecuteNV                                            := GetProcAddress( _VulkanLib, 'vkCmdOpticalFlowExecuteNV' );
     vkAntiLagUpdateAMD                                                   := GetProcAddress( _VulkanLib, 'vkAntiLagUpdateAMD' );
     vkCreateShadersEXT                                                   := GetProcAddress( _VulkanLib, 'vkCreateShadersEXT' );
     vkDestroyShaderEXT                                                   := GetProcAddress( _VulkanLib, 'vkDestroyShaderEXT' );
     vkGetShaderBinaryDataEXT                                             := GetProcAddress( _VulkanLib, 'vkGetShaderBinaryDataEXT' );
     vkCmdBindShadersEXT                                                  := GetProcAddress( _VulkanLib, 'vkCmdBindShadersEXT' );
     vkCmdSetDepthClampRangeEXT                                           := GetProcAddress( _VulkanLib, 'vkCmdSetDepthClampRangeEXT' );
     vkGetFramebufferTilePropertiesQCOM                                   := GetProcAddress( _VulkanLib, 'vkGetFramebufferTilePropertiesQCOM' );
     vkGetDynamicRenderingTilePropertiesQCOM                              := GetProcAddress( _VulkanLib, 'vkGetDynamicRenderingTilePropertiesQCOM' );
     vkGetPhysicalDeviceCooperativeVectorPropertiesNV                     := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceCooperativeVectorPropertiesNV' );
     vkConvertCooperativeVectorMatrixNV                                   := GetProcAddress( _VulkanLib, 'vkConvertCooperativeVectorMatrixNV' );
     vkCmdConvertCooperativeVectorMatrixNV                                := GetProcAddress( _VulkanLib, 'vkCmdConvertCooperativeVectorMatrixNV' );
     vkSetLatencySleepModeNV                                              := GetProcAddress( _VulkanLib, 'vkSetLatencySleepModeNV' );
     vkLatencySleepNV                                                     := GetProcAddress( _VulkanLib, 'vkLatencySleepNV' );
     vkSetLatencyMarkerNV                                                 := GetProcAddress( _VulkanLib, 'vkSetLatencyMarkerNV' );
     vkGetLatencyTimingsNV                                                := GetProcAddress( _VulkanLib, 'vkGetLatencyTimingsNV' );
     vkQueueNotifyOutOfBandNV                                             := GetProcAddress( _VulkanLib, 'vkQueueNotifyOutOfBandNV' );
     vkCreateDataGraphPipelinesARM                                        := GetProcAddress( _VulkanLib, 'vkCreateDataGraphPipelinesARM' );
     vkCreateDataGraphPipelineSessionARM                                  := GetProcAddress( _VulkanLib, 'vkCreateDataGraphPipelineSessionARM' );
     vkGetDataGraphPipelineSessionBindPointRequirementsARM                := GetProcAddress( _VulkanLib, 'vkGetDataGraphPipelineSessionBindPointRequirementsARM' );
     vkGetDataGraphPipelineSessionMemoryRequirementsARM                   := GetProcAddress( _VulkanLib, 'vkGetDataGraphPipelineSessionMemoryRequirementsARM' );
     vkBindDataGraphPipelineSessionMemoryARM                              := GetProcAddress( _VulkanLib, 'vkBindDataGraphPipelineSessionMemoryARM' );
     vkDestroyDataGraphPipelineSessionARM                                 := GetProcAddress( _VulkanLib, 'vkDestroyDataGraphPipelineSessionARM' );
     vkCmdDispatchDataGraphARM                                            := GetProcAddress( _VulkanLib, 'vkCmdDispatchDataGraphARM' );
     vkGetDataGraphPipelineAvailablePropertiesARM                         := GetProcAddress( _VulkanLib, 'vkGetDataGraphPipelineAvailablePropertiesARM' );
     vkGetDataGraphPipelinePropertiesARM                                  := GetProcAddress( _VulkanLib, 'vkGetDataGraphPipelinePropertiesARM' );
     vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM                 := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM' );
     vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM' );
     vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM  := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM' );
     vkCmdSetAttachmentFeedbackLoopEnableEXT                              := GetProcAddress( _VulkanLib, 'vkCmdSetAttachmentFeedbackLoopEnableEXT' );
     vkCmdBindTileMemoryQCOM                                              := GetProcAddress( _VulkanLib, 'vkCmdBindTileMemoryQCOM' );
     vkCmdDecompressMemoryEXT                                             := GetProcAddress( _VulkanLib, 'vkCmdDecompressMemoryEXT' );
     vkCmdDecompressMemoryIndirectCountEXT                                := GetProcAddress( _VulkanLib, 'vkCmdDecompressMemoryIndirectCountEXT' );
     vkCreateExternalComputeQueueNV                                       := GetProcAddress( _VulkanLib, 'vkCreateExternalComputeQueueNV' );
     vkDestroyExternalComputeQueueNV                                      := GetProcAddress( _VulkanLib, 'vkDestroyExternalComputeQueueNV' );
     vkGetExternalComputeQueueDataNV                                      := GetProcAddress( _VulkanLib, 'vkGetExternalComputeQueueDataNV' );
     vkGetClusterAccelerationStructureBuildSizesNV                        := GetProcAddress( _VulkanLib, 'vkGetClusterAccelerationStructureBuildSizesNV' );
     vkCmdBuildClusterAccelerationStructureIndirectNV                     := GetProcAddress( _VulkanLib, 'vkCmdBuildClusterAccelerationStructureIndirectNV' );
     vkGetPartitionedAccelerationStructuresBuildSizesNV                   := GetProcAddress( _VulkanLib, 'vkGetPartitionedAccelerationStructuresBuildSizesNV' );
     vkCmdBuildPartitionedAccelerationStructuresNV                        := GetProcAddress( _VulkanLib, 'vkCmdBuildPartitionedAccelerationStructuresNV' );
     vkGetGeneratedCommandsMemoryRequirementsEXT                          := GetProcAddress( _VulkanLib, 'vkGetGeneratedCommandsMemoryRequirementsEXT' );
     vkCmdPreprocessGeneratedCommandsEXT                                  := GetProcAddress( _VulkanLib, 'vkCmdPreprocessGeneratedCommandsEXT' );
     vkCmdExecuteGeneratedCommandsEXT                                     := GetProcAddress( _VulkanLib, 'vkCmdExecuteGeneratedCommandsEXT' );
     vkCreateIndirectCommandsLayoutEXT                                    := GetProcAddress( _VulkanLib, 'vkCreateIndirectCommandsLayoutEXT' );
     vkDestroyIndirectCommandsLayoutEXT                                   := GetProcAddress( _VulkanLib, 'vkDestroyIndirectCommandsLayoutEXT' );
     vkCreateIndirectExecutionSetEXT                                      := GetProcAddress( _VulkanLib, 'vkCreateIndirectExecutionSetEXT' );
     vkDestroyIndirectExecutionSetEXT                                     := GetProcAddress( _VulkanLib, 'vkDestroyIndirectExecutionSetEXT' );
     vkUpdateIndirectExecutionSetPipelineEXT                              := GetProcAddress( _VulkanLib, 'vkUpdateIndirectExecutionSetPipelineEXT' );
     vkUpdateIndirectExecutionSetShaderEXT                                := GetProcAddress( _VulkanLib, 'vkUpdateIndirectExecutionSetShaderEXT' );
     vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV   := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV' );
     vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM   := GetProcAddress( _VulkanLib, 'vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM' );
     vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM             := GetProcAddress( _VulkanLib, 'vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM' );
     vkCreateShaderInstrumentationARM                                     := GetProcAddress( _VulkanLib, 'vkCreateShaderInstrumentationARM' );
     vkDestroyShaderInstrumentationARM                                    := GetProcAddress( _VulkanLib, 'vkDestroyShaderInstrumentationARM' );
     vkCmdBeginShaderInstrumentationARM                                   := GetProcAddress( _VulkanLib, 'vkCmdBeginShaderInstrumentationARM' );
     vkCmdEndShaderInstrumentationARM                                     := GetProcAddress( _VulkanLib, 'vkCmdEndShaderInstrumentationARM' );
     vkGetShaderInstrumentationValuesARM                                  := GetProcAddress( _VulkanLib, 'vkGetShaderInstrumentationValuesARM' );
     vkClearShaderInstrumentationMetricsARM                               := GetProcAddress( _VulkanLib, 'vkClearShaderInstrumentationMetricsARM' );
     vkCmdEndRendering2EXT                                                := GetProcAddress( _VulkanLib, 'vkCmdEndRendering2EXT' );
     vkCmdBeginCustomResolveEXT                                           := GetProcAddress( _VulkanLib, 'vkCmdBeginCustomResolveEXT' );
     vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM    := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM' );
     vkCmdSetComputeOccupancyPriorityNV                                   := GetProcAddress( _VulkanLib, 'vkCmdSetComputeOccupancyPriorityNV' );
     vkCmdSetPrimitiveRestartIndexEXT                                     := GetProcAddress( _VulkanLib, 'vkCmdSetPrimitiveRestartIndexEXT' );
     vkCreateAccelerationStructureKHR                                     := GetProcAddress( _VulkanLib, 'vkCreateAccelerationStructureKHR' );
     vkDestroyAccelerationStructureKHR                                    := GetProcAddress( _VulkanLib, 'vkDestroyAccelerationStructureKHR' );
     vkCmdBuildAccelerationStructuresKHR                                  := GetProcAddress( _VulkanLib, 'vkCmdBuildAccelerationStructuresKHR' );
     vkCmdBuildAccelerationStructuresIndirectKHR                          := GetProcAddress( _VulkanLib, 'vkCmdBuildAccelerationStructuresIndirectKHR' );
     vkBuildAccelerationStructuresKHR                                     := GetProcAddress( _VulkanLib, 'vkBuildAccelerationStructuresKHR' );
     vkCopyAccelerationStructureKHR                                       := GetProcAddress( _VulkanLib, 'vkCopyAccelerationStructureKHR' );
     vkCopyAccelerationStructureToMemoryKHR                               := GetProcAddress( _VulkanLib, 'vkCopyAccelerationStructureToMemoryKHR' );
     vkCopyMemoryToAccelerationStructureKHR                               := GetProcAddress( _VulkanLib, 'vkCopyMemoryToAccelerationStructureKHR' );
     vkWriteAccelerationStructuresPropertiesKHR                           := GetProcAddress( _VulkanLib, 'vkWriteAccelerationStructuresPropertiesKHR' );
     vkCmdCopyAccelerationStructureKHR                                    := GetProcAddress( _VulkanLib, 'vkCmdCopyAccelerationStructureKHR' );
     vkCmdCopyAccelerationStructureToMemoryKHR                            := GetProcAddress( _VulkanLib, 'vkCmdCopyAccelerationStructureToMemoryKHR' );
     vkCmdCopyMemoryToAccelerationStructureKHR                            := GetProcAddress( _VulkanLib, 'vkCmdCopyMemoryToAccelerationStructureKHR' );
     vkGetAccelerationStructureDeviceAddressKHR                           := GetProcAddress( _VulkanLib, 'vkGetAccelerationStructureDeviceAddressKHR' );
     vkCmdWriteAccelerationStructuresPropertiesKHR                        := GetProcAddress( _VulkanLib, 'vkCmdWriteAccelerationStructuresPropertiesKHR' );
     vkGetDeviceAccelerationStructureCompatibilityKHR                     := GetProcAddress( _VulkanLib, 'vkGetDeviceAccelerationStructureCompatibilityKHR' );
     vkGetAccelerationStructureBuildSizesKHR                              := GetProcAddress( _VulkanLib, 'vkGetAccelerationStructureBuildSizesKHR' );
     vkCmdTraceRaysKHR                                                    := GetProcAddress( _VulkanLib, 'vkCmdTraceRaysKHR' );
     vkCreateRayTracingPipelinesKHR                                       := GetProcAddress( _VulkanLib, 'vkCreateRayTracingPipelinesKHR' );
     vkGetRayTracingCaptureReplayShaderGroupHandlesKHR                    := GetProcAddress( _VulkanLib, 'vkGetRayTracingCaptureReplayShaderGroupHandlesKHR' );
     vkCmdTraceRaysIndirectKHR                                            := GetProcAddress( _VulkanLib, 'vkCmdTraceRaysIndirectKHR' );
     vkGetRayTracingShaderGroupStackSizeKHR                               := GetProcAddress( _VulkanLib, 'vkGetRayTracingShaderGroupStackSizeKHR' );
     vkCmdSetRayTracingPipelineStackSizeKHR                               := GetProcAddress( _VulkanLib, 'vkCmdSetRayTracingPipelineStackSizeKHR' );
     vkCmdDrawMeshTasksEXT                                                := GetProcAddress( _VulkanLib, 'vkCmdDrawMeshTasksEXT' );
     vkCmdDrawMeshTasksIndirectEXT                                        := GetProcAddress( _VulkanLib, 'vkCmdDrawMeshTasksIndirectEXT' );
     vkCmdDrawMeshTasksIndirectCountEXT                                   := GetProcAddress( _VulkanLib, 'vkCmdDrawMeshTasksIndirectCountEXT' );

     {$IFDEF MSWINDOWS}
     vkCreateWin32SurfaceKHR                                              := GetProcAddress( _VulkanLib, 'vkCreateWin32SurfaceKHR' );
     vkGetPhysicalDeviceWin32PresentationSupportKHR                       := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceWin32PresentationSupportKHR' );
     vkGetMemoryWin32HandleKHR                                            := GetProcAddress( _VulkanLib, 'vkGetMemoryWin32HandleKHR' );
     vkGetMemoryWin32HandlePropertiesKHR                                  := GetProcAddress( _VulkanLib, 'vkGetMemoryWin32HandlePropertiesKHR' );
     vkImportSemaphoreWin32HandleKHR                                      := GetProcAddress( _VulkanLib, 'vkImportSemaphoreWin32HandleKHR' );
     vkGetSemaphoreWin32HandleKHR                                         := GetProcAddress( _VulkanLib, 'vkGetSemaphoreWin32HandleKHR' );
     vkImportFenceWin32HandleKHR                                          := GetProcAddress( _VulkanLib, 'vkImportFenceWin32HandleKHR' );
     vkGetFenceWin32HandleKHR                                             := GetProcAddress( _VulkanLib, 'vkGetFenceWin32HandleKHR' );
     vkGetMemoryWin32HandleNV                                             := GetProcAddress( _VulkanLib, 'vkGetMemoryWin32HandleNV' );
     vkGetPhysicalDeviceSurfacePresentModes2EXT                           := GetProcAddress( _VulkanLib, 'vkGetPhysicalDeviceSurfacePresentModes2EXT' );
     vkAcquireFullScreenExclusiveModeEXT                                  := GetProcAddress( _VulkanLib, 'vkAcquireFullScreenExclusiveModeEXT' );
     vkReleaseFullScreenExclusiveModeEXT                                  := GetProcAddress( _VulkanLib, 'vkReleaseFullScreenExclusiveModeEXT' );
     vkGetDeviceGroupSurfacePresentModes2EXT                              := GetProcAddress( _VulkanLib, 'vkGetDeviceGroupSurfacePresentModes2EXT' );
     vkAcquireWinrtDisplayNV                                              := GetProcAddress( _VulkanLib, 'vkAcquireWinrtDisplayNV' );
     vkGetWinrtDisplayNV                                                  := GetProcAddress( _VulkanLib, 'vkGetWinrtDisplayNV' );
     {$ENDIF}

     _GetInstanceProc := GetProcAddress( _VulkanLib, 'vkGetInstanceProcAddr' );
     _GetDeviceProc   := GetProcAddress( _VulkanLib, 'vkGetDeviceProcAddr'   );
end;

procedure LoadInstanceFunctions( const instance_:T_VkInstance );

     procedure P( var Proc_; const Name_:P_char );
     begin
          Pointer( Proc_ ) := _GetInstanceProc( instance_, Name_ );
     end;

begin
     if not Assigned( _GetInstanceProc ) then Exit;

     P( vkDestroyInstance                                                   , 'vkDestroyInstance' );
     P( vkEnumeratePhysicalDevices                                          , 'vkEnumeratePhysicalDevices' );
     P( vkGetPhysicalDeviceFeatures                                         , 'vkGetPhysicalDeviceFeatures' );
     P( vkGetPhysicalDeviceFormatProperties                                 , 'vkGetPhysicalDeviceFormatProperties' );
     P( vkGetPhysicalDeviceImageFormatProperties                            , 'vkGetPhysicalDeviceImageFormatProperties' );
     P( vkGetPhysicalDeviceProperties                                       , 'vkGetPhysicalDeviceProperties' );
     P( vkGetPhysicalDeviceQueueFamilyProperties                            , 'vkGetPhysicalDeviceQueueFamilyProperties' );
     P( vkGetPhysicalDeviceMemoryProperties                                 , 'vkGetPhysicalDeviceMemoryProperties' );
     P( vkGetInstanceProcAddr                                               , 'vkGetInstanceProcAddr' );
     P( vkGetDeviceProcAddr                                                 , 'vkGetDeviceProcAddr' );
     P( vkCreateDevice                                                      , 'vkCreateDevice' );
     P( vkDestroyDevice                                                     , 'vkDestroyDevice' );
     P( vkEnumerateDeviceExtensionProperties                                , 'vkEnumerateDeviceExtensionProperties' );
     P( vkEnumerateDeviceLayerProperties                                    , 'vkEnumerateDeviceLayerProperties' );
     P( vkGetDeviceQueue                                                    , 'vkGetDeviceQueue' );
     P( vkQueueSubmit                                                       , 'vkQueueSubmit' );
     P( vkQueueWaitIdle                                                     , 'vkQueueWaitIdle' );
     P( vkDeviceWaitIdle                                                    , 'vkDeviceWaitIdle' );
     P( vkAllocateMemory                                                    , 'vkAllocateMemory' );
     P( vkFreeMemory                                                        , 'vkFreeMemory' );
     P( vkMapMemory                                                         , 'vkMapMemory' );
     P( vkUnmapMemory                                                       , 'vkUnmapMemory' );
     P( vkFlushMappedMemoryRanges                                           , 'vkFlushMappedMemoryRanges' );
     P( vkInvalidateMappedMemoryRanges                                      , 'vkInvalidateMappedMemoryRanges' );
     P( vkGetDeviceMemoryCommitment                                         , 'vkGetDeviceMemoryCommitment' );
     P( vkBindBufferMemory                                                  , 'vkBindBufferMemory' );
     P( vkBindImageMemory                                                   , 'vkBindImageMemory' );
     P( vkGetBufferMemoryRequirements                                       , 'vkGetBufferMemoryRequirements' );
     P( vkGetImageMemoryRequirements                                        , 'vkGetImageMemoryRequirements' );
     P( vkGetImageSparseMemoryRequirements                                  , 'vkGetImageSparseMemoryRequirements' );
     P( vkGetPhysicalDeviceSparseImageFormatProperties                      , 'vkGetPhysicalDeviceSparseImageFormatProperties' );
     P( vkQueueBindSparse                                                   , 'vkQueueBindSparse' );
     P( vkCreateFence                                                       , 'vkCreateFence' );
     P( vkDestroyFence                                                      , 'vkDestroyFence' );
     P( vkResetFences                                                       , 'vkResetFences' );
     P( vkGetFenceStatus                                                    , 'vkGetFenceStatus' );
     P( vkWaitForFences                                                     , 'vkWaitForFences' );
     P( vkCreateSemaphore                                                   , 'vkCreateSemaphore' );
     P( vkDestroySemaphore                                                  , 'vkDestroySemaphore' );
     P( vkCreateQueryPool                                                   , 'vkCreateQueryPool' );
     P( vkDestroyQueryPool                                                  , 'vkDestroyQueryPool' );
     P( vkGetQueryPoolResults                                               , 'vkGetQueryPoolResults' );
     P( vkCreateBuffer                                                      , 'vkCreateBuffer' );
     P( vkDestroyBuffer                                                     , 'vkDestroyBuffer' );
     P( vkCreateImage                                                       , 'vkCreateImage' );
     P( vkDestroyImage                                                      , 'vkDestroyImage' );
     P( vkGetImageSubresourceLayout                                         , 'vkGetImageSubresourceLayout' );
     P( vkCreateImageView                                                   , 'vkCreateImageView' );
     P( vkDestroyImageView                                                  , 'vkDestroyImageView' );
     P( vkCreateCommandPool                                                 , 'vkCreateCommandPool' );
     P( vkDestroyCommandPool                                                , 'vkDestroyCommandPool' );
     P( vkResetCommandPool                                                  , 'vkResetCommandPool' );
     P( vkAllocateCommandBuffers                                            , 'vkAllocateCommandBuffers' );
     P( vkFreeCommandBuffers                                                , 'vkFreeCommandBuffers' );
     P( vkBeginCommandBuffer                                                , 'vkBeginCommandBuffer' );
     P( vkEndCommandBuffer                                                  , 'vkEndCommandBuffer' );
     P( vkResetCommandBuffer                                                , 'vkResetCommandBuffer' );
     P( vkCmdCopyBuffer                                                     , 'vkCmdCopyBuffer' );
     P( vkCmdCopyImage                                                      , 'vkCmdCopyImage' );
     P( vkCmdCopyBufferToImage                                              , 'vkCmdCopyBufferToImage' );
     P( vkCmdCopyImageToBuffer                                              , 'vkCmdCopyImageToBuffer' );
     P( vkCmdUpdateBuffer                                                   , 'vkCmdUpdateBuffer' );
     P( vkCmdFillBuffer                                                     , 'vkCmdFillBuffer' );
     P( vkCmdPipelineBarrier                                                , 'vkCmdPipelineBarrier' );
     P( vkCmdBeginQuery                                                     , 'vkCmdBeginQuery' );
     P( vkCmdEndQuery                                                       , 'vkCmdEndQuery' );
     P( vkCmdResetQueryPool                                                 , 'vkCmdResetQueryPool' );
     P( vkCmdWriteTimestamp                                                 , 'vkCmdWriteTimestamp' );
     P( vkCmdCopyQueryPoolResults                                           , 'vkCmdCopyQueryPoolResults' );
     P( vkCmdExecuteCommands                                                , 'vkCmdExecuteCommands' );
     P( vkCreateEvent                                                       , 'vkCreateEvent' );
     P( vkDestroyEvent                                                      , 'vkDestroyEvent' );
     P( vkGetEventStatus                                                    , 'vkGetEventStatus' );
     P( vkSetEvent                                                          , 'vkSetEvent' );
     P( vkResetEvent                                                        , 'vkResetEvent' );
     P( vkCreateBufferView                                                  , 'vkCreateBufferView' );
     P( vkDestroyBufferView                                                 , 'vkDestroyBufferView' );
     P( vkCreateShaderModule                                                , 'vkCreateShaderModule' );
     P( vkDestroyShaderModule                                               , 'vkDestroyShaderModule' );
     P( vkCreatePipelineCache                                               , 'vkCreatePipelineCache' );
     P( vkDestroyPipelineCache                                              , 'vkDestroyPipelineCache' );
     P( vkGetPipelineCacheData                                              , 'vkGetPipelineCacheData' );
     P( vkMergePipelineCaches                                               , 'vkMergePipelineCaches' );
     P( vkCreateComputePipelines                                            , 'vkCreateComputePipelines' );
     P( vkDestroyPipeline                                                   , 'vkDestroyPipeline' );
     P( vkCreatePipelineLayout                                              , 'vkCreatePipelineLayout' );
     P( vkDestroyPipelineLayout                                             , 'vkDestroyPipelineLayout' );
     P( vkCreateSampler                                                     , 'vkCreateSampler' );
     P( vkDestroySampler                                                    , 'vkDestroySampler' );
     P( vkCreateDescriptorSetLayout                                         , 'vkCreateDescriptorSetLayout' );
     P( vkDestroyDescriptorSetLayout                                        , 'vkDestroyDescriptorSetLayout' );
     P( vkCreateDescriptorPool                                              , 'vkCreateDescriptorPool' );
     P( vkDestroyDescriptorPool                                             , 'vkDestroyDescriptorPool' );
     P( vkResetDescriptorPool                                               , 'vkResetDescriptorPool' );
     P( vkAllocateDescriptorSets                                            , 'vkAllocateDescriptorSets' );
     P( vkFreeDescriptorSets                                                , 'vkFreeDescriptorSets' );
     P( vkUpdateDescriptorSets                                              , 'vkUpdateDescriptorSets' );
     P( vkCmdBindPipeline                                                   , 'vkCmdBindPipeline' );
     P( vkCmdBindDescriptorSets                                             , 'vkCmdBindDescriptorSets' );
     P( vkCmdClearColorImage                                                , 'vkCmdClearColorImage' );
     P( vkCmdDispatch                                                       , 'vkCmdDispatch' );
     P( vkCmdDispatchIndirect                                               , 'vkCmdDispatchIndirect' );
     P( vkCmdSetEvent                                                       , 'vkCmdSetEvent' );
     P( vkCmdResetEvent                                                     , 'vkCmdResetEvent' );
     P( vkCmdWaitEvents                                                     , 'vkCmdWaitEvents' );
     P( vkCmdPushConstants                                                  , 'vkCmdPushConstants' );
     P( vkCreateGraphicsPipelines                                           , 'vkCreateGraphicsPipelines' );
     P( vkCreateFramebuffer                                                 , 'vkCreateFramebuffer' );
     P( vkDestroyFramebuffer                                                , 'vkDestroyFramebuffer' );
     P( vkCreateRenderPass                                                  , 'vkCreateRenderPass' );
     P( vkDestroyRenderPass                                                 , 'vkDestroyRenderPass' );
     P( vkGetRenderAreaGranularity                                          , 'vkGetRenderAreaGranularity' );
     P( vkCmdSetViewport                                                    , 'vkCmdSetViewport' );
     P( vkCmdSetScissor                                                     , 'vkCmdSetScissor' );
     P( vkCmdSetLineWidth                                                   , 'vkCmdSetLineWidth' );
     P( vkCmdSetDepthBias                                                   , 'vkCmdSetDepthBias' );
     P( vkCmdSetBlendConstants                                              , 'vkCmdSetBlendConstants' );
     P( vkCmdSetDepthBounds                                                 , 'vkCmdSetDepthBounds' );
     P( vkCmdSetStencilCompareMask                                          , 'vkCmdSetStencilCompareMask' );
     P( vkCmdSetStencilWriteMask                                            , 'vkCmdSetStencilWriteMask' );
     P( vkCmdSetStencilReference                                            , 'vkCmdSetStencilReference' );
     P( vkCmdBindIndexBuffer                                                , 'vkCmdBindIndexBuffer' );
     P( vkCmdBindVertexBuffers                                              , 'vkCmdBindVertexBuffers' );
     P( vkCmdDraw                                                           , 'vkCmdDraw' );
     P( vkCmdDrawIndexed                                                    , 'vkCmdDrawIndexed' );
     P( vkCmdDrawIndirect                                                   , 'vkCmdDrawIndirect' );
     P( vkCmdDrawIndexedIndirect                                            , 'vkCmdDrawIndexedIndirect' );
     P( vkCmdBlitImage                                                      , 'vkCmdBlitImage' );
     P( vkCmdClearDepthStencilImage                                         , 'vkCmdClearDepthStencilImage' );
     P( vkCmdClearAttachments                                               , 'vkCmdClearAttachments' );
     P( vkCmdResolveImage                                                   , 'vkCmdResolveImage' );
     P( vkCmdBeginRenderPass                                                , 'vkCmdBeginRenderPass' );
     P( vkCmdNextSubpass                                                    , 'vkCmdNextSubpass' );
     P( vkCmdEndRenderPass                                                  , 'vkCmdEndRenderPass' );
     P( vkBindBufferMemory2                                                 , 'vkBindBufferMemory2' );
     P( vkBindImageMemory2                                                  , 'vkBindImageMemory2' );
     P( vkGetDeviceGroupPeerMemoryFeatures                                  , 'vkGetDeviceGroupPeerMemoryFeatures' );
     P( vkCmdSetDeviceMask                                                  , 'vkCmdSetDeviceMask' );
     P( vkEnumeratePhysicalDeviceGroups                                     , 'vkEnumeratePhysicalDeviceGroups' );
     P( vkGetImageMemoryRequirements2                                       , 'vkGetImageMemoryRequirements2' );
     P( vkGetBufferMemoryRequirements2                                      , 'vkGetBufferMemoryRequirements2' );
     P( vkGetImageSparseMemoryRequirements2                                 , 'vkGetImageSparseMemoryRequirements2' );
     P( vkGetPhysicalDeviceFeatures2                                        , 'vkGetPhysicalDeviceFeatures2' );
     P( vkGetPhysicalDeviceProperties2                                      , 'vkGetPhysicalDeviceProperties2' );
     P( vkGetPhysicalDeviceFormatProperties2                                , 'vkGetPhysicalDeviceFormatProperties2' );
     P( vkGetPhysicalDeviceImageFormatProperties2                           , 'vkGetPhysicalDeviceImageFormatProperties2' );
     P( vkGetPhysicalDeviceQueueFamilyProperties2                           , 'vkGetPhysicalDeviceQueueFamilyProperties2' );
     P( vkGetPhysicalDeviceMemoryProperties2                                , 'vkGetPhysicalDeviceMemoryProperties2' );
     P( vkGetPhysicalDeviceSparseImageFormatProperties2                     , 'vkGetPhysicalDeviceSparseImageFormatProperties2' );
     P( vkTrimCommandPool                                                   , 'vkTrimCommandPool' );
     P( vkGetDeviceQueue2                                                   , 'vkGetDeviceQueue2' );
     P( vkGetPhysicalDeviceExternalBufferProperties                         , 'vkGetPhysicalDeviceExternalBufferProperties' );
     P( vkGetPhysicalDeviceExternalFenceProperties                          , 'vkGetPhysicalDeviceExternalFenceProperties' );
     P( vkGetPhysicalDeviceExternalSemaphoreProperties                      , 'vkGetPhysicalDeviceExternalSemaphoreProperties' );
     P( vkCmdDispatchBase                                                   , 'vkCmdDispatchBase' );
     P( vkCreateDescriptorUpdateTemplate                                    , 'vkCreateDescriptorUpdateTemplate' );
     P( vkDestroyDescriptorUpdateTemplate                                   , 'vkDestroyDescriptorUpdateTemplate' );
     P( vkUpdateDescriptorSetWithTemplate                                   , 'vkUpdateDescriptorSetWithTemplate' );
     P( vkGetDescriptorSetLayoutSupport                                     , 'vkGetDescriptorSetLayoutSupport' );
     P( vkCreateSamplerYcbcrConversion                                      , 'vkCreateSamplerYcbcrConversion' );
     P( vkDestroySamplerYcbcrConversion                                     , 'vkDestroySamplerYcbcrConversion' );
     P( vkResetQueryPool                                                    , 'vkResetQueryPool' );
     P( vkGetSemaphoreCounterValue                                          , 'vkGetSemaphoreCounterValue' );
     P( vkWaitSemaphores                                                    , 'vkWaitSemaphores' );
     P( vkSignalSemaphore                                                   , 'vkSignalSemaphore' );
     P( vkGetBufferDeviceAddress                                            , 'vkGetBufferDeviceAddress' );
     P( vkGetBufferOpaqueCaptureAddress                                     , 'vkGetBufferOpaqueCaptureAddress' );
     P( vkGetDeviceMemoryOpaqueCaptureAddress                               , 'vkGetDeviceMemoryOpaqueCaptureAddress' );
     P( vkCmdDrawIndirectCount                                              , 'vkCmdDrawIndirectCount' );
     P( vkCmdDrawIndexedIndirectCount                                       , 'vkCmdDrawIndexedIndirectCount' );
     P( vkCreateRenderPass2                                                 , 'vkCreateRenderPass2' );
     P( vkCmdBeginRenderPass2                                               , 'vkCmdBeginRenderPass2' );
     P( vkCmdNextSubpass2                                                   , 'vkCmdNextSubpass2' );
     P( vkCmdEndRenderPass2                                                 , 'vkCmdEndRenderPass2' );
     P( vkGetPhysicalDeviceToolProperties                                   , 'vkGetPhysicalDeviceToolProperties' );
     P( vkCreatePrivateDataSlot                                             , 'vkCreatePrivateDataSlot' );
     P( vkDestroyPrivateDataSlot                                            , 'vkDestroyPrivateDataSlot' );
     P( vkSetPrivateData                                                    , 'vkSetPrivateData' );
     P( vkGetPrivateData                                                    , 'vkGetPrivateData' );
     P( vkCmdPipelineBarrier2                                               , 'vkCmdPipelineBarrier2' );
     P( vkCmdWriteTimestamp2                                                , 'vkCmdWriteTimestamp2' );
     P( vkQueueSubmit2                                                      , 'vkQueueSubmit2' );
     P( vkCmdCopyBuffer2                                                    , 'vkCmdCopyBuffer2' );
     P( vkCmdCopyImage2                                                     , 'vkCmdCopyImage2' );
     P( vkCmdCopyBufferToImage2                                             , 'vkCmdCopyBufferToImage2' );
     P( vkCmdCopyImageToBuffer2                                             , 'vkCmdCopyImageToBuffer2' );
     P( vkGetDeviceBufferMemoryRequirements                                 , 'vkGetDeviceBufferMemoryRequirements' );
     P( vkGetDeviceImageMemoryRequirements                                  , 'vkGetDeviceImageMemoryRequirements' );
     P( vkGetDeviceImageSparseMemoryRequirements                            , 'vkGetDeviceImageSparseMemoryRequirements' );
     P( vkCmdSetEvent2                                                      , 'vkCmdSetEvent2' );
     P( vkCmdResetEvent2                                                    , 'vkCmdResetEvent2' );
     P( vkCmdWaitEvents2                                                    , 'vkCmdWaitEvents2' );
     P( vkCmdBlitImage2                                                     , 'vkCmdBlitImage2' );
     P( vkCmdResolveImage2                                                  , 'vkCmdResolveImage2' );
     P( vkCmdBeginRendering                                                 , 'vkCmdBeginRendering' );
     P( vkCmdEndRendering                                                   , 'vkCmdEndRendering' );
     P( vkCmdSetCullMode                                                    , 'vkCmdSetCullMode' );
     P( vkCmdSetFrontFace                                                   , 'vkCmdSetFrontFace' );
     P( vkCmdSetPrimitiveTopology                                           , 'vkCmdSetPrimitiveTopology' );
     P( vkCmdSetViewportWithCount                                           , 'vkCmdSetViewportWithCount' );
     P( vkCmdSetScissorWithCount                                            , 'vkCmdSetScissorWithCount' );
     P( vkCmdBindVertexBuffers2                                             , 'vkCmdBindVertexBuffers2' );
     P( vkCmdSetDepthTestEnable                                             , 'vkCmdSetDepthTestEnable' );
     P( vkCmdSetDepthWriteEnable                                            , 'vkCmdSetDepthWriteEnable' );
     P( vkCmdSetDepthCompareOp                                              , 'vkCmdSetDepthCompareOp' );
     P( vkCmdSetDepthBoundsTestEnable                                       , 'vkCmdSetDepthBoundsTestEnable' );
     P( vkCmdSetStencilTestEnable                                           , 'vkCmdSetStencilTestEnable' );
     P( vkCmdSetStencilOp                                                   , 'vkCmdSetStencilOp' );
     P( vkCmdSetRasterizerDiscardEnable                                     , 'vkCmdSetRasterizerDiscardEnable' );
     P( vkCmdSetDepthBiasEnable                                             , 'vkCmdSetDepthBiasEnable' );
     P( vkCmdSetPrimitiveRestartEnable                                      , 'vkCmdSetPrimitiveRestartEnable' );
     P( vkMapMemory2                                                        , 'vkMapMemory2' );
     P( vkUnmapMemory2                                                      , 'vkUnmapMemory2' );
     P( vkGetDeviceImageSubresourceLayout                                   , 'vkGetDeviceImageSubresourceLayout' );
     P( vkGetImageSubresourceLayout2                                        , 'vkGetImageSubresourceLayout2' );
     P( vkCopyMemoryToImage                                                 , 'vkCopyMemoryToImage' );
     P( vkCopyImageToMemory                                                 , 'vkCopyImageToMemory' );
     P( vkCopyImageToImage                                                  , 'vkCopyImageToImage' );
     P( vkTransitionImageLayout                                             , 'vkTransitionImageLayout' );
     P( vkCmdPushDescriptorSet                                              , 'vkCmdPushDescriptorSet' );
     P( vkCmdPushDescriptorSetWithTemplate                                  , 'vkCmdPushDescriptorSetWithTemplate' );
     P( vkCmdBindDescriptorSets2                                            , 'vkCmdBindDescriptorSets2' );
     P( vkCmdPushConstants2                                                 , 'vkCmdPushConstants2' );
     P( vkCmdPushDescriptorSet2                                             , 'vkCmdPushDescriptorSet2' );
     P( vkCmdPushDescriptorSetWithTemplate2                                 , 'vkCmdPushDescriptorSetWithTemplate2' );
     P( vkCmdSetLineStipple                                                 , 'vkCmdSetLineStipple' );
     P( vkCmdBindIndexBuffer2                                               , 'vkCmdBindIndexBuffer2' );
     P( vkGetRenderingAreaGranularity                                       , 'vkGetRenderingAreaGranularity' );
     P( vkCmdSetRenderingAttachmentLocations                                , 'vkCmdSetRenderingAttachmentLocations' );
     P( vkCmdSetRenderingInputAttachmentIndices                             , 'vkCmdSetRenderingInputAttachmentIndices' );
     P( vkDestroySurfaceKHR                                                 , 'vkDestroySurfaceKHR' );
     P( vkGetPhysicalDeviceSurfaceSupportKHR                                , 'vkGetPhysicalDeviceSurfaceSupportKHR' );
     P( vkGetPhysicalDeviceSurfaceCapabilitiesKHR                           , 'vkGetPhysicalDeviceSurfaceCapabilitiesKHR' );
     P( vkGetPhysicalDeviceSurfaceFormatsKHR                                , 'vkGetPhysicalDeviceSurfaceFormatsKHR' );
     P( vkGetPhysicalDeviceSurfacePresentModesKHR                           , 'vkGetPhysicalDeviceSurfacePresentModesKHR' );
     P( vkCreateSwapchainKHR                                                , 'vkCreateSwapchainKHR' );
     P( vkDestroySwapchainKHR                                               , 'vkDestroySwapchainKHR' );
     P( vkGetSwapchainImagesKHR                                             , 'vkGetSwapchainImagesKHR' );
     P( vkAcquireNextImageKHR                                               , 'vkAcquireNextImageKHR' );
     P( vkQueuePresentKHR                                                   , 'vkQueuePresentKHR' );
     P( vkGetDeviceGroupPresentCapabilitiesKHR                              , 'vkGetDeviceGroupPresentCapabilitiesKHR' );
     P( vkGetDeviceGroupSurfacePresentModesKHR                              , 'vkGetDeviceGroupSurfacePresentModesKHR' );
     P( vkGetPhysicalDevicePresentRectanglesKHR                             , 'vkGetPhysicalDevicePresentRectanglesKHR' );
     P( vkAcquireNextImage2KHR                                              , 'vkAcquireNextImage2KHR' );
     P( vkGetPhysicalDeviceDisplayPropertiesKHR                             , 'vkGetPhysicalDeviceDisplayPropertiesKHR' );
     P( vkGetPhysicalDeviceDisplayPlanePropertiesKHR                        , 'vkGetPhysicalDeviceDisplayPlanePropertiesKHR' );
     P( vkGetDisplayPlaneSupportedDisplaysKHR                               , 'vkGetDisplayPlaneSupportedDisplaysKHR' );
     P( vkGetDisplayModePropertiesKHR                                       , 'vkGetDisplayModePropertiesKHR' );
     P( vkCreateDisplayModeKHR                                              , 'vkCreateDisplayModeKHR' );
     P( vkGetDisplayPlaneCapabilitiesKHR                                    , 'vkGetDisplayPlaneCapabilitiesKHR' );
     P( vkCreateDisplayPlaneSurfaceKHR                                      , 'vkCreateDisplayPlaneSurfaceKHR' );
     P( vkCreateSharedSwapchainsKHR                                         , 'vkCreateSharedSwapchainsKHR' );
     P( vkGetPhysicalDeviceVideoCapabilitiesKHR                             , 'vkGetPhysicalDeviceVideoCapabilitiesKHR' );
     P( vkGetPhysicalDeviceVideoFormatPropertiesKHR                         , 'vkGetPhysicalDeviceVideoFormatPropertiesKHR' );
     P( vkCreateVideoSessionKHR                                             , 'vkCreateVideoSessionKHR' );
     P( vkDestroyVideoSessionKHR                                            , 'vkDestroyVideoSessionKHR' );
     P( vkGetVideoSessionMemoryRequirementsKHR                              , 'vkGetVideoSessionMemoryRequirementsKHR' );
     P( vkBindVideoSessionMemoryKHR                                         , 'vkBindVideoSessionMemoryKHR' );
     P( vkCreateVideoSessionParametersKHR                                   , 'vkCreateVideoSessionParametersKHR' );
     P( vkUpdateVideoSessionParametersKHR                                   , 'vkUpdateVideoSessionParametersKHR' );
     P( vkDestroyVideoSessionParametersKHR                                  , 'vkDestroyVideoSessionParametersKHR' );
     P( vkCmdBeginVideoCodingKHR                                            , 'vkCmdBeginVideoCodingKHR' );
     P( vkCmdEndVideoCodingKHR                                              , 'vkCmdEndVideoCodingKHR' );
     P( vkCmdControlVideoCodingKHR                                          , 'vkCmdControlVideoCodingKHR' );
     P( vkCmdDecodeVideoKHR                                                 , 'vkCmdDecodeVideoKHR' );
     P( vkCmdBeginRenderingKHR                                              , 'vkCmdBeginRenderingKHR' );
     P( vkCmdEndRenderingKHR                                                , 'vkCmdEndRenderingKHR' );
     P( vkGetPhysicalDeviceFeatures2KHR                                     , 'vkGetPhysicalDeviceFeatures2KHR' );
     P( vkGetPhysicalDeviceProperties2KHR                                   , 'vkGetPhysicalDeviceProperties2KHR' );
     P( vkGetPhysicalDeviceFormatProperties2KHR                             , 'vkGetPhysicalDeviceFormatProperties2KHR' );
     P( vkGetPhysicalDeviceImageFormatProperties2KHR                        , 'vkGetPhysicalDeviceImageFormatProperties2KHR' );
     P( vkGetPhysicalDeviceQueueFamilyProperties2KHR                        , 'vkGetPhysicalDeviceQueueFamilyProperties2KHR' );
     P( vkGetPhysicalDeviceMemoryProperties2KHR                             , 'vkGetPhysicalDeviceMemoryProperties2KHR' );
     P( vkGetPhysicalDeviceSparseImageFormatProperties2KHR                  , 'vkGetPhysicalDeviceSparseImageFormatProperties2KHR' );
     P( vkGetDeviceGroupPeerMemoryFeaturesKHR                               , 'vkGetDeviceGroupPeerMemoryFeaturesKHR' );
     P( vkCmdSetDeviceMaskKHR                                               , 'vkCmdSetDeviceMaskKHR' );
     P( vkCmdDispatchBaseKHR                                                , 'vkCmdDispatchBaseKHR' );
     P( vkTrimCommandPoolKHR                                                , 'vkTrimCommandPoolKHR' );
     P( vkEnumeratePhysicalDeviceGroupsKHR                                  , 'vkEnumeratePhysicalDeviceGroupsKHR' );
     P( vkGetPhysicalDeviceExternalBufferPropertiesKHR                      , 'vkGetPhysicalDeviceExternalBufferPropertiesKHR' );
     P( vkGetMemoryFdKHR                                                    , 'vkGetMemoryFdKHR' );
     P( vkGetMemoryFdPropertiesKHR                                          , 'vkGetMemoryFdPropertiesKHR' );
     P( vkGetPhysicalDeviceExternalSemaphorePropertiesKHR                   , 'vkGetPhysicalDeviceExternalSemaphorePropertiesKHR' );
     P( vkImportSemaphoreFdKHR                                              , 'vkImportSemaphoreFdKHR' );
     P( vkGetSemaphoreFdKHR                                                 , 'vkGetSemaphoreFdKHR' );
     P( vkCmdPushDescriptorSetKHR                                           , 'vkCmdPushDescriptorSetKHR' );
     P( vkCmdPushDescriptorSetWithTemplateKHR                               , 'vkCmdPushDescriptorSetWithTemplateKHR' );
     P( vkCreateDescriptorUpdateTemplateKHR                                 , 'vkCreateDescriptorUpdateTemplateKHR' );
     P( vkDestroyDescriptorUpdateTemplateKHR                                , 'vkDestroyDescriptorUpdateTemplateKHR' );
     P( vkUpdateDescriptorSetWithTemplateKHR                                , 'vkUpdateDescriptorSetWithTemplateKHR' );
     P( vkCreateRenderPass2KHR                                              , 'vkCreateRenderPass2KHR' );
     P( vkCmdBeginRenderPass2KHR                                            , 'vkCmdBeginRenderPass2KHR' );
     P( vkCmdNextSubpass2KHR                                                , 'vkCmdNextSubpass2KHR' );
     P( vkCmdEndRenderPass2KHR                                              , 'vkCmdEndRenderPass2KHR' );
     P( vkGetSwapchainStatusKHR                                             , 'vkGetSwapchainStatusKHR' );
     P( vkGetPhysicalDeviceExternalFencePropertiesKHR                       , 'vkGetPhysicalDeviceExternalFencePropertiesKHR' );
     P( vkImportFenceFdKHR                                                  , 'vkImportFenceFdKHR' );
     P( vkGetFenceFdKHR                                                     , 'vkGetFenceFdKHR' );
     P( vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR     , 'vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR' );
     P( vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR             , 'vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR' );
     P( vkAcquireProfilingLockKHR                                           , 'vkAcquireProfilingLockKHR' );
     P( vkReleaseProfilingLockKHR                                           , 'vkReleaseProfilingLockKHR' );
     P( vkGetPhysicalDeviceSurfaceCapabilities2KHR                          , 'vkGetPhysicalDeviceSurfaceCapabilities2KHR' );
     P( vkGetPhysicalDeviceSurfaceFormats2KHR                               , 'vkGetPhysicalDeviceSurfaceFormats2KHR' );
     P( vkGetPhysicalDeviceDisplayProperties2KHR                            , 'vkGetPhysicalDeviceDisplayProperties2KHR' );
     P( vkGetPhysicalDeviceDisplayPlaneProperties2KHR                       , 'vkGetPhysicalDeviceDisplayPlaneProperties2KHR' );
     P( vkGetDisplayModeProperties2KHR                                      , 'vkGetDisplayModeProperties2KHR' );
     P( vkGetDisplayPlaneCapabilities2KHR                                   , 'vkGetDisplayPlaneCapabilities2KHR' );
     P( vkGetImageMemoryRequirements2KHR                                    , 'vkGetImageMemoryRequirements2KHR' );
     P( vkGetBufferMemoryRequirements2KHR                                   , 'vkGetBufferMemoryRequirements2KHR' );
     P( vkGetImageSparseMemoryRequirements2KHR                              , 'vkGetImageSparseMemoryRequirements2KHR' );
     P( vkCreateSamplerYcbcrConversionKHR                                   , 'vkCreateSamplerYcbcrConversionKHR' );
     P( vkDestroySamplerYcbcrConversionKHR                                  , 'vkDestroySamplerYcbcrConversionKHR' );
     P( vkBindBufferMemory2KHR                                              , 'vkBindBufferMemory2KHR' );
     P( vkBindImageMemory2KHR                                               , 'vkBindImageMemory2KHR' );
     P( vkGetDescriptorSetLayoutSupportKHR                                  , 'vkGetDescriptorSetLayoutSupportKHR' );
     P( vkCmdDrawIndirectCountKHR                                           , 'vkCmdDrawIndirectCountKHR' );
     P( vkCmdDrawIndexedIndirectCountKHR                                    , 'vkCmdDrawIndexedIndirectCountKHR' );
     P( vkGetSemaphoreCounterValueKHR                                       , 'vkGetSemaphoreCounterValueKHR' );
     P( vkWaitSemaphoresKHR                                                 , 'vkWaitSemaphoresKHR' );
     P( vkSignalSemaphoreKHR                                                , 'vkSignalSemaphoreKHR' );
     P( vkGetPhysicalDeviceFragmentShadingRatesKHR                          , 'vkGetPhysicalDeviceFragmentShadingRatesKHR' );
     P( vkCmdSetFragmentShadingRateKHR                                      , 'vkCmdSetFragmentShadingRateKHR' );
     P( vkCmdSetRenderingAttachmentLocationsKHR                             , 'vkCmdSetRenderingAttachmentLocationsKHR' );
     P( vkCmdSetRenderingInputAttachmentIndicesKHR                          , 'vkCmdSetRenderingInputAttachmentIndicesKHR' );
     P( vkWaitForPresentKHR                                                 , 'vkWaitForPresentKHR' );
     P( vkGetBufferDeviceAddressKHR                                         , 'vkGetBufferDeviceAddressKHR' );
     P( vkGetBufferOpaqueCaptureAddressKHR                                  , 'vkGetBufferOpaqueCaptureAddressKHR' );
     P( vkGetDeviceMemoryOpaqueCaptureAddressKHR                            , 'vkGetDeviceMemoryOpaqueCaptureAddressKHR' );
     P( vkCreateDeferredOperationKHR                                        , 'vkCreateDeferredOperationKHR' );
     P( vkDestroyDeferredOperationKHR                                       , 'vkDestroyDeferredOperationKHR' );
     P( vkGetDeferredOperationMaxConcurrencyKHR                             , 'vkGetDeferredOperationMaxConcurrencyKHR' );
     P( vkGetDeferredOperationResultKHR                                     , 'vkGetDeferredOperationResultKHR' );
     P( vkDeferredOperationJoinKHR                                          , 'vkDeferredOperationJoinKHR' );
     P( vkGetPipelineExecutablePropertiesKHR                                , 'vkGetPipelineExecutablePropertiesKHR' );
     P( vkGetPipelineExecutableStatisticsKHR                                , 'vkGetPipelineExecutableStatisticsKHR' );
     P( vkGetPipelineExecutableInternalRepresentationsKHR                   , 'vkGetPipelineExecutableInternalRepresentationsKHR' );
     P( vkMapMemory2KHR                                                     , 'vkMapMemory2KHR' );
     P( vkUnmapMemory2KHR                                                   , 'vkUnmapMemory2KHR' );
     P( vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR             , 'vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR' );
     P( vkGetEncodedVideoSessionParametersKHR                               , 'vkGetEncodedVideoSessionParametersKHR' );
     P( vkCmdEncodeVideoKHR                                                 , 'vkCmdEncodeVideoKHR' );
     P( vkCmdSetEvent2KHR                                                   , 'vkCmdSetEvent2KHR' );
     P( vkCmdResetEvent2KHR                                                 , 'vkCmdResetEvent2KHR' );
     P( vkCmdWaitEvents2KHR                                                 , 'vkCmdWaitEvents2KHR' );
     P( vkCmdPipelineBarrier2KHR                                            , 'vkCmdPipelineBarrier2KHR' );
     P( vkCmdWriteTimestamp2KHR                                             , 'vkCmdWriteTimestamp2KHR' );
     P( vkQueueSubmit2KHR                                                   , 'vkQueueSubmit2KHR' );
     P( vkCmdBindIndexBuffer3KHR                                            , 'vkCmdBindIndexBuffer3KHR' );
     P( vkCmdBindVertexBuffers3KHR                                          , 'vkCmdBindVertexBuffers3KHR' );
     P( vkCmdDrawIndirect2KHR                                               , 'vkCmdDrawIndirect2KHR' );
     P( vkCmdDrawIndexedIndirect2KHR                                        , 'vkCmdDrawIndexedIndirect2KHR' );
     P( vkCmdDispatchIndirect2KHR                                           , 'vkCmdDispatchIndirect2KHR' );
     P( vkCmdCopyMemoryKHR                                                  , 'vkCmdCopyMemoryKHR' );
     P( vkCmdCopyMemoryToImageKHR                                           , 'vkCmdCopyMemoryToImageKHR' );
     P( vkCmdCopyImageToMemoryKHR                                           , 'vkCmdCopyImageToMemoryKHR' );
     P( vkCmdUpdateMemoryKHR                                                , 'vkCmdUpdateMemoryKHR' );
     P( vkCmdFillMemoryKHR                                                  , 'vkCmdFillMemoryKHR' );
     P( vkCmdCopyQueryPoolResultsToMemoryKHR                                , 'vkCmdCopyQueryPoolResultsToMemoryKHR' );
     P( vkCmdDrawIndirectCount2KHR                                          , 'vkCmdDrawIndirectCount2KHR' );
     P( vkCmdDrawIndexedIndirectCount2KHR                                   , 'vkCmdDrawIndexedIndirectCount2KHR' );
     P( vkCmdBeginConditionalRendering2EXT                                  , 'vkCmdBeginConditionalRendering2EXT' );
     P( vkCmdBindTransformFeedbackBuffers2EXT                               , 'vkCmdBindTransformFeedbackBuffers2EXT' );
     P( vkCmdBeginTransformFeedback2EXT                                     , 'vkCmdBeginTransformFeedback2EXT' );
     P( vkCmdEndTransformFeedback2EXT                                       , 'vkCmdEndTransformFeedback2EXT' );
     P( vkCmdDrawIndirectByteCount2EXT                                      , 'vkCmdDrawIndirectByteCount2EXT' );
     P( vkCmdDrawMeshTasksIndirect2EXT                                      , 'vkCmdDrawMeshTasksIndirect2EXT' );
     P( vkCmdDrawMeshTasksIndirectCount2EXT                                 , 'vkCmdDrawMeshTasksIndirectCount2EXT' );
     P( vkCmdWriteMarkerToMemoryAMD                                         , 'vkCmdWriteMarkerToMemoryAMD' );
     P( vkCreateAccelerationStructure2KHR                                   , 'vkCreateAccelerationStructure2KHR' );
     P( vkCmdCopyBuffer2KHR                                                 , 'vkCmdCopyBuffer2KHR' );
     P( vkCmdCopyImage2KHR                                                  , 'vkCmdCopyImage2KHR' );
     P( vkCmdCopyBufferToImage2KHR                                          , 'vkCmdCopyBufferToImage2KHR' );
     P( vkCmdCopyImageToBuffer2KHR                                          , 'vkCmdCopyImageToBuffer2KHR' );
     P( vkCmdBlitImage2KHR                                                  , 'vkCmdBlitImage2KHR' );
     P( vkCmdResolveImage2KHR                                               , 'vkCmdResolveImage2KHR' );
     P( vkCmdTraceRaysIndirect2KHR                                          , 'vkCmdTraceRaysIndirect2KHR' );
     P( vkGetDeviceBufferMemoryRequirementsKHR                              , 'vkGetDeviceBufferMemoryRequirementsKHR' );
     P( vkGetDeviceImageMemoryRequirementsKHR                               , 'vkGetDeviceImageMemoryRequirementsKHR' );
     P( vkGetDeviceImageSparseMemoryRequirementsKHR                         , 'vkGetDeviceImageSparseMemoryRequirementsKHR' );
     P( vkCmdBindIndexBuffer2KHR                                            , 'vkCmdBindIndexBuffer2KHR' );
     P( vkGetRenderingAreaGranularityKHR                                    , 'vkGetRenderingAreaGranularityKHR' );
     P( vkGetDeviceImageSubresourceLayoutKHR                                , 'vkGetDeviceImageSubresourceLayoutKHR' );
     P( vkGetImageSubresourceLayout2KHR                                     , 'vkGetImageSubresourceLayout2KHR' );
     P( vkWaitForPresent2KHR                                                , 'vkWaitForPresent2KHR' );
     P( vkCreatePipelineBinariesKHR                                         , 'vkCreatePipelineBinariesKHR' );
     P( vkDestroyPipelineBinaryKHR                                          , 'vkDestroyPipelineBinaryKHR' );
     P( vkGetPipelineKeyKHR                                                 , 'vkGetPipelineKeyKHR' );
     P( vkGetPipelineBinaryDataKHR                                          , 'vkGetPipelineBinaryDataKHR' );
     P( vkReleaseCapturedPipelineDataKHR                                    , 'vkReleaseCapturedPipelineDataKHR' );
     P( vkReleaseSwapchainImagesKHR                                         , 'vkReleaseSwapchainImagesKHR' );
     P( vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR                   , 'vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR' );
     P( vkCmdSetLineStippleKHR                                              , 'vkCmdSetLineStippleKHR' );
     P( vkGetPhysicalDeviceCalibrateableTimeDomainsKHR                      , 'vkGetPhysicalDeviceCalibrateableTimeDomainsKHR' );
     P( vkGetCalibratedTimestampsKHR                                        , 'vkGetCalibratedTimestampsKHR' );
     P( vkCmdBindDescriptorSets2KHR                                         , 'vkCmdBindDescriptorSets2KHR' );
     P( vkCmdPushConstants2KHR                                              , 'vkCmdPushConstants2KHR' );
     P( vkCmdPushDescriptorSet2KHR                                          , 'vkCmdPushDescriptorSet2KHR' );
     P( vkCmdPushDescriptorSetWithTemplate2KHR                              , 'vkCmdPushDescriptorSetWithTemplate2KHR' );
     P( vkCmdSetDescriptorBufferOffsets2EXT                                 , 'vkCmdSetDescriptorBufferOffsets2EXT' );
     P( vkCmdBindDescriptorBufferEmbeddedSamplers2EXT                       , 'vkCmdBindDescriptorBufferEmbeddedSamplers2EXT' );
     P( vkCmdCopyMemoryIndirectKHR                                          , 'vkCmdCopyMemoryIndirectKHR' );
     P( vkCmdCopyMemoryToImageIndirectKHR                                   , 'vkCmdCopyMemoryToImageIndirectKHR' );
     P( vkGetDeviceFaultReportsKHR                                          , 'vkGetDeviceFaultReportsKHR' );
     P( vkGetDeviceFaultDebugInfoKHR                                        , 'vkGetDeviceFaultDebugInfoKHR' );
     P( vkCmdEndRendering2KHR                                               , 'vkCmdEndRendering2KHR' );
     P( vkCreateDebugReportCallbackEXT                                      , 'vkCreateDebugReportCallbackEXT' );
     P( vkDestroyDebugReportCallbackEXT                                     , 'vkDestroyDebugReportCallbackEXT' );
     P( vkDebugReportMessageEXT                                             , 'vkDebugReportMessageEXT' );
     P( vkDebugMarkerSetObjectTagEXT                                        , 'vkDebugMarkerSetObjectTagEXT' );
     P( vkDebugMarkerSetObjectNameEXT                                       , 'vkDebugMarkerSetObjectNameEXT' );
     P( vkCmdDebugMarkerBeginEXT                                            , 'vkCmdDebugMarkerBeginEXT' );
     P( vkCmdDebugMarkerEndEXT                                              , 'vkCmdDebugMarkerEndEXT' );
     P( vkCmdDebugMarkerInsertEXT                                           , 'vkCmdDebugMarkerInsertEXT' );
     P( vkCmdBindTransformFeedbackBuffersEXT                                , 'vkCmdBindTransformFeedbackBuffersEXT' );
     P( vkCmdBeginTransformFeedbackEXT                                      , 'vkCmdBeginTransformFeedbackEXT' );
     P( vkCmdEndTransformFeedbackEXT                                        , 'vkCmdEndTransformFeedbackEXT' );
     P( vkCmdBeginQueryIndexedEXT                                           , 'vkCmdBeginQueryIndexedEXT' );
     P( vkCmdEndQueryIndexedEXT                                             , 'vkCmdEndQueryIndexedEXT' );
     P( vkCmdDrawIndirectByteCountEXT                                       , 'vkCmdDrawIndirectByteCountEXT' );
     P( vkCreateCuModuleNVX                                                 , 'vkCreateCuModuleNVX' );
     P( vkCreateCuFunctionNVX                                               , 'vkCreateCuFunctionNVX' );
     P( vkDestroyCuModuleNVX                                                , 'vkDestroyCuModuleNVX' );
     P( vkDestroyCuFunctionNVX                                              , 'vkDestroyCuFunctionNVX' );
     P( vkCmdCuLaunchKernelNVX                                              , 'vkCmdCuLaunchKernelNVX' );
     P( vkGetImageViewHandleNVX                                             , 'vkGetImageViewHandleNVX' );
     P( vkGetImageViewHandle64NVX                                           , 'vkGetImageViewHandle64NVX' );
     P( vkGetImageViewAddressNVX                                            , 'vkGetImageViewAddressNVX' );
     P( vkGetDeviceCombinedImageSamplerIndexNVX                             , 'vkGetDeviceCombinedImageSamplerIndexNVX' );
     P( vkCmdDrawIndirectCountAMD                                           , 'vkCmdDrawIndirectCountAMD' );
     P( vkCmdDrawIndexedIndirectCountAMD                                    , 'vkCmdDrawIndexedIndirectCountAMD' );
     P( vkGetShaderInfoAMD                                                  , 'vkGetShaderInfoAMD' );
     P( vkGetPhysicalDeviceExternalImageFormatPropertiesNV                  , 'vkGetPhysicalDeviceExternalImageFormatPropertiesNV' );
     P( vkCmdBeginConditionalRenderingEXT                                   , 'vkCmdBeginConditionalRenderingEXT' );
     P( vkCmdEndConditionalRenderingEXT                                     , 'vkCmdEndConditionalRenderingEXT' );
     P( vkCmdSetViewportWScalingNV                                          , 'vkCmdSetViewportWScalingNV' );
     P( vkReleaseDisplayEXT                                                 , 'vkReleaseDisplayEXT' );
     P( vkGetPhysicalDeviceSurfaceCapabilities2EXT                          , 'vkGetPhysicalDeviceSurfaceCapabilities2EXT' );
     P( vkDisplayPowerControlEXT                                            , 'vkDisplayPowerControlEXT' );
     P( vkRegisterDeviceEventEXT                                            , 'vkRegisterDeviceEventEXT' );
     P( vkRegisterDisplayEventEXT                                           , 'vkRegisterDisplayEventEXT' );
     P( vkGetSwapchainCounterEXT                                            , 'vkGetSwapchainCounterEXT' );
     P( vkGetRefreshCycleDurationGOOGLE                                     , 'vkGetRefreshCycleDurationGOOGLE' );
     P( vkGetPastPresentationTimingGOOGLE                                   , 'vkGetPastPresentationTimingGOOGLE' );
     P( vkCmdSetDiscardRectangleEXT                                         , 'vkCmdSetDiscardRectangleEXT' );
     P( vkCmdSetDiscardRectangleEnableEXT                                   , 'vkCmdSetDiscardRectangleEnableEXT' );
     P( vkCmdSetDiscardRectangleModeEXT                                     , 'vkCmdSetDiscardRectangleModeEXT' );
     P( vkSetHdrMetadataEXT                                                 , 'vkSetHdrMetadataEXT' );
     P( vkSetDebugUtilsObjectNameEXT                                        , 'vkSetDebugUtilsObjectNameEXT' );
     P( vkSetDebugUtilsObjectTagEXT                                         , 'vkSetDebugUtilsObjectTagEXT' );
     P( vkQueueBeginDebugUtilsLabelEXT                                      , 'vkQueueBeginDebugUtilsLabelEXT' );
     P( vkQueueEndDebugUtilsLabelEXT                                        , 'vkQueueEndDebugUtilsLabelEXT' );
     P( vkQueueInsertDebugUtilsLabelEXT                                     , 'vkQueueInsertDebugUtilsLabelEXT' );
     P( vkCmdBeginDebugUtilsLabelEXT                                        , 'vkCmdBeginDebugUtilsLabelEXT' );
     P( vkCmdEndDebugUtilsLabelEXT                                          , 'vkCmdEndDebugUtilsLabelEXT' );
     P( vkCmdInsertDebugUtilsLabelEXT                                       , 'vkCmdInsertDebugUtilsLabelEXT' );
     P( vkCreateDebugUtilsMessengerEXT                                      , 'vkCreateDebugUtilsMessengerEXT' );
     P( vkDestroyDebugUtilsMessengerEXT                                     , 'vkDestroyDebugUtilsMessengerEXT' );
     P( vkSubmitDebugUtilsMessageEXT                                        , 'vkSubmitDebugUtilsMessageEXT' );
     P( vkCreateGpaSessionAMD                                               , 'vkCreateGpaSessionAMD' );
     P( vkDestroyGpaSessionAMD                                              , 'vkDestroyGpaSessionAMD' );
     P( vkSetGpaDeviceClockModeAMD                                          , 'vkSetGpaDeviceClockModeAMD' );
     P( vkGetGpaDeviceClockInfoAMD                                          , 'vkGetGpaDeviceClockInfoAMD' );
     P( vkCmdBeginGpaSessionAMD                                             , 'vkCmdBeginGpaSessionAMD' );
     P( vkCmdEndGpaSessionAMD                                               , 'vkCmdEndGpaSessionAMD' );
     P( vkCmdBeginGpaSampleAMD                                              , 'vkCmdBeginGpaSampleAMD' );
     P( vkCmdEndGpaSampleAMD                                                , 'vkCmdEndGpaSampleAMD' );
     P( vkGetGpaSessionStatusAMD                                            , 'vkGetGpaSessionStatusAMD' );
     P( vkGetGpaSessionResultsAMD                                           , 'vkGetGpaSessionResultsAMD' );
     P( vkResetGpaSessionAMD                                                , 'vkResetGpaSessionAMD' );
     P( vkCmdCopyGpaSessionResultsAMD                                       , 'vkCmdCopyGpaSessionResultsAMD' );
     P( vkWriteSamplerDescriptorsEXT                                        , 'vkWriteSamplerDescriptorsEXT' );
     P( vkWriteResourceDescriptorsEXT                                       , 'vkWriteResourceDescriptorsEXT' );
     P( vkCmdBindSamplerHeapEXT                                             , 'vkCmdBindSamplerHeapEXT' );
     P( vkCmdBindResourceHeapEXT                                            , 'vkCmdBindResourceHeapEXT' );
     P( vkCmdPushDataEXT                                                    , 'vkCmdPushDataEXT' );
     P( vkGetImageOpaqueCaptureDataEXT                                      , 'vkGetImageOpaqueCaptureDataEXT' );
     P( vkGetPhysicalDeviceDescriptorSizeEXT                                , 'vkGetPhysicalDeviceDescriptorSizeEXT' );
     P( vkRegisterCustomBorderColorEXT                                      , 'vkRegisterCustomBorderColorEXT' );
     P( vkUnregisterCustomBorderColorEXT                                    , 'vkUnregisterCustomBorderColorEXT' );
     P( vkGetTensorOpaqueCaptureDataARM                                     , 'vkGetTensorOpaqueCaptureDataARM' );
     P( vkCmdSetSampleLocationsEXT                                          , 'vkCmdSetSampleLocationsEXT' );
     P( vkGetPhysicalDeviceMultisamplePropertiesEXT                         , 'vkGetPhysicalDeviceMultisamplePropertiesEXT' );
     P( vkGetImageDrmFormatModifierPropertiesEXT                            , 'vkGetImageDrmFormatModifierPropertiesEXT' );
     P( vkCreateValidationCacheEXT                                          , 'vkCreateValidationCacheEXT' );
     P( vkDestroyValidationCacheEXT                                         , 'vkDestroyValidationCacheEXT' );
     P( vkMergeValidationCachesEXT                                          , 'vkMergeValidationCachesEXT' );
     P( vkGetValidationCacheDataEXT                                         , 'vkGetValidationCacheDataEXT' );
     P( vkCmdBindShadingRateImageNV                                         , 'vkCmdBindShadingRateImageNV' );
     P( vkCmdSetViewportShadingRatePaletteNV                                , 'vkCmdSetViewportShadingRatePaletteNV' );
     P( vkCmdSetCoarseSampleOrderNV                                         , 'vkCmdSetCoarseSampleOrderNV' );
     P( vkCreateAccelerationStructureNV                                     , 'vkCreateAccelerationStructureNV' );
     P( vkDestroyAccelerationStructureNV                                    , 'vkDestroyAccelerationStructureNV' );
     P( vkGetAccelerationStructureMemoryRequirementsNV                      , 'vkGetAccelerationStructureMemoryRequirementsNV' );
     P( vkBindAccelerationStructureMemoryNV                                 , 'vkBindAccelerationStructureMemoryNV' );
     P( vkCmdBuildAccelerationStructureNV                                   , 'vkCmdBuildAccelerationStructureNV' );
     P( vkCmdCopyAccelerationStructureNV                                    , 'vkCmdCopyAccelerationStructureNV' );
     P( vkCmdTraceRaysNV                                                    , 'vkCmdTraceRaysNV' );
     P( vkCreateRayTracingPipelinesNV                                       , 'vkCreateRayTracingPipelinesNV' );
     P( vkGetRayTracingShaderGroupHandlesKHR                                , 'vkGetRayTracingShaderGroupHandlesKHR' );
     P( vkGetRayTracingShaderGroupHandlesNV                                 , 'vkGetRayTracingShaderGroupHandlesNV' );
     P( vkGetAccelerationStructureHandleNV                                  , 'vkGetAccelerationStructureHandleNV' );
     P( vkCmdWriteAccelerationStructuresPropertiesNV                        , 'vkCmdWriteAccelerationStructuresPropertiesNV' );
     P( vkCompileDeferredNV                                                 , 'vkCompileDeferredNV' );
     P( vkGetMemoryHostPointerPropertiesEXT                                 , 'vkGetMemoryHostPointerPropertiesEXT' );
     P( vkCmdWriteBufferMarkerAMD                                           , 'vkCmdWriteBufferMarkerAMD' );
     P( vkCmdWriteBufferMarker2AMD                                          , 'vkCmdWriteBufferMarker2AMD' );
     P( vkGetPhysicalDeviceCalibrateableTimeDomainsEXT                      , 'vkGetPhysicalDeviceCalibrateableTimeDomainsEXT' );
     P( vkGetCalibratedTimestampsEXT                                        , 'vkGetCalibratedTimestampsEXT' );
     P( vkCmdDrawMeshTasksNV                                                , 'vkCmdDrawMeshTasksNV' );
     P( vkCmdDrawMeshTasksIndirectNV                                        , 'vkCmdDrawMeshTasksIndirectNV' );
     P( vkCmdDrawMeshTasksIndirectCountNV                                   , 'vkCmdDrawMeshTasksIndirectCountNV' );
     P( vkCmdSetExclusiveScissorEnableNV                                    , 'vkCmdSetExclusiveScissorEnableNV' );
     P( vkCmdSetExclusiveScissorNV                                          , 'vkCmdSetExclusiveScissorNV' );
     P( vkCmdSetCheckpointNV                                                , 'vkCmdSetCheckpointNV' );
     P( vkGetQueueCheckpointDataNV                                          , 'vkGetQueueCheckpointDataNV' );
     P( vkGetQueueCheckpointData2NV                                         , 'vkGetQueueCheckpointData2NV' );
     P( vkSetSwapchainPresentTimingQueueSizeEXT                             , 'vkSetSwapchainPresentTimingQueueSizeEXT' );
     P( vkGetSwapchainTimingPropertiesEXT                                   , 'vkGetSwapchainTimingPropertiesEXT' );
     P( vkGetSwapchainTimeDomainPropertiesEXT                               , 'vkGetSwapchainTimeDomainPropertiesEXT' );
     P( vkGetPastPresentationTimingEXT                                      , 'vkGetPastPresentationTimingEXT' );
     P( vkInitializePerformanceApiINTEL                                     , 'vkInitializePerformanceApiINTEL' );
     P( vkUninitializePerformanceApiINTEL                                   , 'vkUninitializePerformanceApiINTEL' );
     P( vkCmdSetPerformanceMarkerINTEL                                      , 'vkCmdSetPerformanceMarkerINTEL' );
     P( vkCmdSetPerformanceStreamMarkerINTEL                                , 'vkCmdSetPerformanceStreamMarkerINTEL' );
     P( vkCmdSetPerformanceOverrideINTEL                                    , 'vkCmdSetPerformanceOverrideINTEL' );
     P( vkAcquirePerformanceConfigurationINTEL                              , 'vkAcquirePerformanceConfigurationINTEL' );
     P( vkReleasePerformanceConfigurationINTEL                              , 'vkReleasePerformanceConfigurationINTEL' );
     P( vkQueueSetPerformanceConfigurationINTEL                             , 'vkQueueSetPerformanceConfigurationINTEL' );
     P( vkGetPerformanceParameterINTEL                                      , 'vkGetPerformanceParameterINTEL' );
     P( vkSetLocalDimmingAMD                                                , 'vkSetLocalDimmingAMD' );
     P( vkGetBufferDeviceAddressEXT                                         , 'vkGetBufferDeviceAddressEXT' );
     P( vkGetPhysicalDeviceToolPropertiesEXT                                , 'vkGetPhysicalDeviceToolPropertiesEXT' );
     P( vkGetPhysicalDeviceCooperativeMatrixPropertiesNV                    , 'vkGetPhysicalDeviceCooperativeMatrixPropertiesNV' );
     P( vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV   , 'vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV' );
     P( vkCreateHeadlessSurfaceEXT                                          , 'vkCreateHeadlessSurfaceEXT' );
     P( vkCmdSetLineStippleEXT                                              , 'vkCmdSetLineStippleEXT' );
     P( vkResetQueryPoolEXT                                                 , 'vkResetQueryPoolEXT' );
     P( vkCmdSetCullModeEXT                                                 , 'vkCmdSetCullModeEXT' );
     P( vkCmdSetFrontFaceEXT                                                , 'vkCmdSetFrontFaceEXT' );
     P( vkCmdSetPrimitiveTopologyEXT                                        , 'vkCmdSetPrimitiveTopologyEXT' );
     P( vkCmdSetViewportWithCountEXT                                        , 'vkCmdSetViewportWithCountEXT' );
     P( vkCmdSetScissorWithCountEXT                                         , 'vkCmdSetScissorWithCountEXT' );
     P( vkCmdBindVertexBuffers2EXT                                          , 'vkCmdBindVertexBuffers2EXT' );
     P( vkCmdSetDepthTestEnableEXT                                          , 'vkCmdSetDepthTestEnableEXT' );
     P( vkCmdSetDepthWriteEnableEXT                                         , 'vkCmdSetDepthWriteEnableEXT' );
     P( vkCmdSetDepthCompareOpEXT                                           , 'vkCmdSetDepthCompareOpEXT' );
     P( vkCmdSetDepthBoundsTestEnableEXT                                    , 'vkCmdSetDepthBoundsTestEnableEXT' );
     P( vkCmdSetStencilTestEnableEXT                                        , 'vkCmdSetStencilTestEnableEXT' );
     P( vkCmdSetStencilOpEXT                                                , 'vkCmdSetStencilOpEXT' );
     P( vkCopyMemoryToImageEXT                                              , 'vkCopyMemoryToImageEXT' );
     P( vkCopyImageToMemoryEXT                                              , 'vkCopyImageToMemoryEXT' );
     P( vkCopyImageToImageEXT                                               , 'vkCopyImageToImageEXT' );
     P( vkTransitionImageLayoutEXT                                          , 'vkTransitionImageLayoutEXT' );
     P( vkGetImageSubresourceLayout2EXT                                     , 'vkGetImageSubresourceLayout2EXT' );
     P( vkReleaseSwapchainImagesEXT                                         , 'vkReleaseSwapchainImagesEXT' );
     P( vkGetGeneratedCommandsMemoryRequirementsNV                          , 'vkGetGeneratedCommandsMemoryRequirementsNV' );
     P( vkCmdPreprocessGeneratedCommandsNV                                  , 'vkCmdPreprocessGeneratedCommandsNV' );
     P( vkCmdExecuteGeneratedCommandsNV                                     , 'vkCmdExecuteGeneratedCommandsNV' );
     P( vkCmdBindPipelineShaderGroupNV                                      , 'vkCmdBindPipelineShaderGroupNV' );
     P( vkCreateIndirectCommandsLayoutNV                                    , 'vkCreateIndirectCommandsLayoutNV' );
     P( vkDestroyIndirectCommandsLayoutNV                                   , 'vkDestroyIndirectCommandsLayoutNV' );
     P( vkCmdSetDepthBias2EXT                                               , 'vkCmdSetDepthBias2EXT' );
     P( vkAcquireDrmDisplayEXT                                              , 'vkAcquireDrmDisplayEXT' );
     P( vkGetDrmDisplayEXT                                                  , 'vkGetDrmDisplayEXT' );
     P( vkCreatePrivateDataSlotEXT                                          , 'vkCreatePrivateDataSlotEXT' );
     P( vkDestroyPrivateDataSlotEXT                                         , 'vkDestroyPrivateDataSlotEXT' );
     P( vkSetPrivateDataEXT                                                 , 'vkSetPrivateDataEXT' );
     P( vkGetPrivateDataEXT                                                 , 'vkGetPrivateDataEXT' );
     P( vkQueueSetPerfHintQCOM                                              , 'vkQueueSetPerfHintQCOM' );
     P( vkCmdDispatchTileQCOM                                               , 'vkCmdDispatchTileQCOM' );
     P( vkCmdBeginPerTileExecutionQCOM                                      , 'vkCmdBeginPerTileExecutionQCOM' );
     P( vkCmdEndPerTileExecutionQCOM                                        , 'vkCmdEndPerTileExecutionQCOM' );
     P( vkSetLatencySleepModeLegacyNV                                       , 'vkSetLatencySleepModeLegacyNV' );
     P( vkLatencySleepLegacyNV                                              , 'vkLatencySleepLegacyNV' );
     P( vkSetLatencyMarkerLegacyNV                                          , 'vkSetLatencyMarkerLegacyNV' );
     P( vkGetLatencyTimingsLegacyNV                                         , 'vkGetLatencyTimingsLegacyNV' );
     P( vkQueueNotifyOutOfBandLegacyNV                                      , 'vkQueueNotifyOutOfBandLegacyNV' );
     P( vkGetSleepStatusLegacyNV                                            , 'vkGetSleepStatusLegacyNV' );
     P( vkShutdownLatencyDeviceLegacyNV                                     , 'vkShutdownLatencyDeviceLegacyNV' );
     P( vkGetDescriptorSetLayoutSizeEXT                                     , 'vkGetDescriptorSetLayoutSizeEXT' );
     P( vkGetDescriptorSetLayoutBindingOffsetEXT                            , 'vkGetDescriptorSetLayoutBindingOffsetEXT' );
     P( vkGetDescriptorEXT                                                  , 'vkGetDescriptorEXT' );
     P( vkCmdBindDescriptorBuffersEXT                                       , 'vkCmdBindDescriptorBuffersEXT' );
     P( vkCmdSetDescriptorBufferOffsetsEXT                                  , 'vkCmdSetDescriptorBufferOffsetsEXT' );
     P( vkCmdBindDescriptorBufferEmbeddedSamplersEXT                        , 'vkCmdBindDescriptorBufferEmbeddedSamplersEXT' );
     P( vkGetBufferOpaqueCaptureDescriptorDataEXT                           , 'vkGetBufferOpaqueCaptureDescriptorDataEXT' );
     P( vkGetImageOpaqueCaptureDescriptorDataEXT                            , 'vkGetImageOpaqueCaptureDescriptorDataEXT' );
     P( vkGetImageViewOpaqueCaptureDescriptorDataEXT                        , 'vkGetImageViewOpaqueCaptureDescriptorDataEXT' );
     P( vkGetSamplerOpaqueCaptureDescriptorDataEXT                          , 'vkGetSamplerOpaqueCaptureDescriptorDataEXT' );
     P( vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT            , 'vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT' );
     P( vkCmdSetFragmentShadingRateEnumNV                                   , 'vkCmdSetFragmentShadingRateEnumNV' );
     P( vkGetDeviceFaultInfoEXT                                             , 'vkGetDeviceFaultInfoEXT' );
     P( vkCmdSetVertexInputEXT                                              , 'vkCmdSetVertexInputEXT' );
     P( vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI                     , 'vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI' );
     P( vkCmdSubpassShadingHUAWEI                                           , 'vkCmdSubpassShadingHUAWEI' );
     P( vkCmdBindInvocationMaskHUAWEI                                       , 'vkCmdBindInvocationMaskHUAWEI' );
     P( vkGetMemoryRemoteAddressNV                                          , 'vkGetMemoryRemoteAddressNV' );
     P( vkGetPipelinePropertiesEXT                                          , 'vkGetPipelinePropertiesEXT' );
     P( vkCmdSetPatchControlPointsEXT                                       , 'vkCmdSetPatchControlPointsEXT' );
     P( vkCmdSetRasterizerDiscardEnableEXT                                  , 'vkCmdSetRasterizerDiscardEnableEXT' );
     P( vkCmdSetDepthBiasEnableEXT                                          , 'vkCmdSetDepthBiasEnableEXT' );
     P( vkCmdSetLogicOpEXT                                                  , 'vkCmdSetLogicOpEXT' );
     P( vkCmdSetPrimitiveRestartEnableEXT                                   , 'vkCmdSetPrimitiveRestartEnableEXT' );
     P( vkCmdSetColorWriteEnableEXT                                         , 'vkCmdSetColorWriteEnableEXT' );
     P( vkCmdDrawMultiEXT                                                   , 'vkCmdDrawMultiEXT' );
     P( vkCmdDrawMultiIndexedEXT                                            , 'vkCmdDrawMultiIndexedEXT' );
     P( vkCreateMicromapEXT                                                 , 'vkCreateMicromapEXT' );
     P( vkDestroyMicromapEXT                                                , 'vkDestroyMicromapEXT' );
     P( vkCmdBuildMicromapsEXT                                              , 'vkCmdBuildMicromapsEXT' );
     P( vkBuildMicromapsEXT                                                 , 'vkBuildMicromapsEXT' );
     P( vkCopyMicromapEXT                                                   , 'vkCopyMicromapEXT' );
     P( vkCopyMicromapToMemoryEXT                                           , 'vkCopyMicromapToMemoryEXT' );
     P( vkCopyMemoryToMicromapEXT                                           , 'vkCopyMemoryToMicromapEXT' );
     P( vkWriteMicromapsPropertiesEXT                                       , 'vkWriteMicromapsPropertiesEXT' );
     P( vkCmdCopyMicromapEXT                                                , 'vkCmdCopyMicromapEXT' );
     P( vkCmdCopyMicromapToMemoryEXT                                        , 'vkCmdCopyMicromapToMemoryEXT' );
     P( vkCmdCopyMemoryToMicromapEXT                                        , 'vkCmdCopyMemoryToMicromapEXT' );
     P( vkCmdWriteMicromapsPropertiesEXT                                    , 'vkCmdWriteMicromapsPropertiesEXT' );
     P( vkGetDeviceMicromapCompatibilityEXT                                 , 'vkGetDeviceMicromapCompatibilityEXT' );
     P( vkGetMicromapBuildSizesEXT                                          , 'vkGetMicromapBuildSizesEXT' );
     P( vkCmdDrawClusterHUAWEI                                              , 'vkCmdDrawClusterHUAWEI' );
     P( vkCmdDrawClusterIndirectHUAWEI                                      , 'vkCmdDrawClusterIndirectHUAWEI' );
     P( vkSetDeviceMemoryPriorityEXT                                        , 'vkSetDeviceMemoryPriorityEXT' );
     P( vkCmdSetDispatchParametersARM                                       , 'vkCmdSetDispatchParametersARM' );
     P( vkGetDescriptorSetLayoutHostMappingInfoVALVE                        , 'vkGetDescriptorSetLayoutHostMappingInfoVALVE' );
     P( vkGetDescriptorSetHostMappingVALVE                                  , 'vkGetDescriptorSetHostMappingVALVE' );
     P( vkCmdCopyMemoryIndirectNV                                           , 'vkCmdCopyMemoryIndirectNV' );
     P( vkCmdCopyMemoryToImageIndirectNV                                    , 'vkCmdCopyMemoryToImageIndirectNV' );
     P( vkCmdDecompressMemoryNV                                             , 'vkCmdDecompressMemoryNV' );
     P( vkCmdDecompressMemoryIndirectCountNV                                , 'vkCmdDecompressMemoryIndirectCountNV' );
     P( vkGetPipelineIndirectMemoryRequirementsNV                           , 'vkGetPipelineIndirectMemoryRequirementsNV' );
     P( vkCmdUpdatePipelineIndirectBufferNV                                 , 'vkCmdUpdatePipelineIndirectBufferNV' );
     P( vkGetPipelineIndirectDeviceAddressNV                                , 'vkGetPipelineIndirectDeviceAddressNV' );
     P( vkCmdSetDepthClampEnableEXT                                         , 'vkCmdSetDepthClampEnableEXT' );
     P( vkCmdSetPolygonModeEXT                                              , 'vkCmdSetPolygonModeEXT' );
     P( vkCmdSetRasterizationSamplesEXT                                     , 'vkCmdSetRasterizationSamplesEXT' );
     P( vkCmdSetSampleMaskEXT                                               , 'vkCmdSetSampleMaskEXT' );
     P( vkCmdSetAlphaToCoverageEnableEXT                                    , 'vkCmdSetAlphaToCoverageEnableEXT' );
     P( vkCmdSetAlphaToOneEnableEXT                                         , 'vkCmdSetAlphaToOneEnableEXT' );
     P( vkCmdSetLogicOpEnableEXT                                            , 'vkCmdSetLogicOpEnableEXT' );
     P( vkCmdSetColorBlendEnableEXT                                         , 'vkCmdSetColorBlendEnableEXT' );
     P( vkCmdSetColorBlendEquationEXT                                       , 'vkCmdSetColorBlendEquationEXT' );
     P( vkCmdSetColorWriteMaskEXT                                           , 'vkCmdSetColorWriteMaskEXT' );
     P( vkCmdSetTessellationDomainOriginEXT                                 , 'vkCmdSetTessellationDomainOriginEXT' );
     P( vkCmdSetRasterizationStreamEXT                                      , 'vkCmdSetRasterizationStreamEXT' );
     P( vkCmdSetConservativeRasterizationModeEXT                            , 'vkCmdSetConservativeRasterizationModeEXT' );
     P( vkCmdSetExtraPrimitiveOverestimationSizeEXT                         , 'vkCmdSetExtraPrimitiveOverestimationSizeEXT' );
     P( vkCmdSetDepthClipEnableEXT                                          , 'vkCmdSetDepthClipEnableEXT' );
     P( vkCmdSetSampleLocationsEnableEXT                                    , 'vkCmdSetSampleLocationsEnableEXT' );
     P( vkCmdSetColorBlendAdvancedEXT                                       , 'vkCmdSetColorBlendAdvancedEXT' );
     P( vkCmdSetProvokingVertexModeEXT                                      , 'vkCmdSetProvokingVertexModeEXT' );
     P( vkCmdSetLineRasterizationModeEXT                                    , 'vkCmdSetLineRasterizationModeEXT' );
     P( vkCmdSetLineStippleEnableEXT                                        , 'vkCmdSetLineStippleEnableEXT' );
     P( vkCmdSetDepthClipNegativeOneToOneEXT                                , 'vkCmdSetDepthClipNegativeOneToOneEXT' );
     P( vkCmdSetViewportWScalingEnableNV                                    , 'vkCmdSetViewportWScalingEnableNV' );
     P( vkCmdSetViewportSwizzleNV                                           , 'vkCmdSetViewportSwizzleNV' );
     P( vkCmdSetCoverageToColorEnableNV                                     , 'vkCmdSetCoverageToColorEnableNV' );
     P( vkCmdSetCoverageToColorLocationNV                                   , 'vkCmdSetCoverageToColorLocationNV' );
     P( vkCmdSetCoverageModulationModeNV                                    , 'vkCmdSetCoverageModulationModeNV' );
     P( vkCmdSetCoverageModulationTableEnableNV                             , 'vkCmdSetCoverageModulationTableEnableNV' );
     P( vkCmdSetCoverageModulationTableNV                                   , 'vkCmdSetCoverageModulationTableNV' );
     P( vkCmdSetShadingRateImageEnableNV                                    , 'vkCmdSetShadingRateImageEnableNV' );
     P( vkCmdSetRepresentativeFragmentTestEnableNV                          , 'vkCmdSetRepresentativeFragmentTestEnableNV' );
     P( vkCmdSetCoverageReductionModeNV                                     , 'vkCmdSetCoverageReductionModeNV' );
     P( vkCreateTensorARM                                                   , 'vkCreateTensorARM' );
     P( vkDestroyTensorARM                                                  , 'vkDestroyTensorARM' );
     P( vkCreateTensorViewARM                                               , 'vkCreateTensorViewARM' );
     P( vkDestroyTensorViewARM                                              , 'vkDestroyTensorViewARM' );
     P( vkGetTensorMemoryRequirementsARM                                    , 'vkGetTensorMemoryRequirementsARM' );
     P( vkBindTensorMemoryARM                                               , 'vkBindTensorMemoryARM' );
     P( vkGetDeviceTensorMemoryRequirementsARM                              , 'vkGetDeviceTensorMemoryRequirementsARM' );
     P( vkCmdCopyTensorARM                                                  , 'vkCmdCopyTensorARM' );
     P( vkGetPhysicalDeviceExternalTensorPropertiesARM                      , 'vkGetPhysicalDeviceExternalTensorPropertiesARM' );
     P( vkGetTensorOpaqueCaptureDescriptorDataARM                           , 'vkGetTensorOpaqueCaptureDescriptorDataARM' );
     P( vkGetTensorViewOpaqueCaptureDescriptorDataARM                       , 'vkGetTensorViewOpaqueCaptureDescriptorDataARM' );
     P( vkGetShaderModuleIdentifierEXT                                      , 'vkGetShaderModuleIdentifierEXT' );
     P( vkGetShaderModuleCreateInfoIdentifierEXT                            , 'vkGetShaderModuleCreateInfoIdentifierEXT' );
     P( vkGetPhysicalDeviceOpticalFlowImageFormatsNV                        , 'vkGetPhysicalDeviceOpticalFlowImageFormatsNV' );
     P( vkCreateOpticalFlowSessionNV                                        , 'vkCreateOpticalFlowSessionNV' );
     P( vkDestroyOpticalFlowSessionNV                                       , 'vkDestroyOpticalFlowSessionNV' );
     P( vkBindOpticalFlowSessionImageNV                                     , 'vkBindOpticalFlowSessionImageNV' );
     P( vkCmdOpticalFlowExecuteNV                                           , 'vkCmdOpticalFlowExecuteNV' );
     P( vkAntiLagUpdateAMD                                                  , 'vkAntiLagUpdateAMD' );
     P( vkCreateShadersEXT                                                  , 'vkCreateShadersEXT' );
     P( vkDestroyShaderEXT                                                  , 'vkDestroyShaderEXT' );
     P( vkGetShaderBinaryDataEXT                                            , 'vkGetShaderBinaryDataEXT' );
     P( vkCmdBindShadersEXT                                                 , 'vkCmdBindShadersEXT' );
     P( vkCmdSetDepthClampRangeEXT                                          , 'vkCmdSetDepthClampRangeEXT' );
     P( vkGetFramebufferTilePropertiesQCOM                                  , 'vkGetFramebufferTilePropertiesQCOM' );
     P( vkGetDynamicRenderingTilePropertiesQCOM                             , 'vkGetDynamicRenderingTilePropertiesQCOM' );
     P( vkGetPhysicalDeviceCooperativeVectorPropertiesNV                    , 'vkGetPhysicalDeviceCooperativeVectorPropertiesNV' );
     P( vkConvertCooperativeVectorMatrixNV                                  , 'vkConvertCooperativeVectorMatrixNV' );
     P( vkCmdConvertCooperativeVectorMatrixNV                               , 'vkCmdConvertCooperativeVectorMatrixNV' );
     P( vkSetLatencySleepModeNV                                             , 'vkSetLatencySleepModeNV' );
     P( vkLatencySleepNV                                                    , 'vkLatencySleepNV' );
     P( vkSetLatencyMarkerNV                                                , 'vkSetLatencyMarkerNV' );
     P( vkGetLatencyTimingsNV                                               , 'vkGetLatencyTimingsNV' );
     P( vkQueueNotifyOutOfBandNV                                            , 'vkQueueNotifyOutOfBandNV' );
     P( vkCreateDataGraphPipelinesARM                                       , 'vkCreateDataGraphPipelinesARM' );
     P( vkCreateDataGraphPipelineSessionARM                                 , 'vkCreateDataGraphPipelineSessionARM' );
     P( vkGetDataGraphPipelineSessionBindPointRequirementsARM               , 'vkGetDataGraphPipelineSessionBindPointRequirementsARM' );
     P( vkGetDataGraphPipelineSessionMemoryRequirementsARM                  , 'vkGetDataGraphPipelineSessionMemoryRequirementsARM' );
     P( vkBindDataGraphPipelineSessionMemoryARM                             , 'vkBindDataGraphPipelineSessionMemoryARM' );
     P( vkDestroyDataGraphPipelineSessionARM                                , 'vkDestroyDataGraphPipelineSessionARM' );
     P( vkCmdDispatchDataGraphARM                                           , 'vkCmdDispatchDataGraphARM' );
     P( vkGetDataGraphPipelineAvailablePropertiesARM                        , 'vkGetDataGraphPipelineAvailablePropertiesARM' );
     P( vkGetDataGraphPipelinePropertiesARM                                 , 'vkGetDataGraphPipelinePropertiesARM' );
     P( vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM                , 'vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM' );
     P( vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM, 'vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM' );
     P( vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM , 'vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM' );
     P( vkCmdSetAttachmentFeedbackLoopEnableEXT                             , 'vkCmdSetAttachmentFeedbackLoopEnableEXT' );
     P( vkCmdBindTileMemoryQCOM                                             , 'vkCmdBindTileMemoryQCOM' );
     P( vkCmdDecompressMemoryEXT                                            , 'vkCmdDecompressMemoryEXT' );
     P( vkCmdDecompressMemoryIndirectCountEXT                               , 'vkCmdDecompressMemoryIndirectCountEXT' );
     P( vkCreateExternalComputeQueueNV                                      , 'vkCreateExternalComputeQueueNV' );
     P( vkDestroyExternalComputeQueueNV                                     , 'vkDestroyExternalComputeQueueNV' );
     P( vkGetClusterAccelerationStructureBuildSizesNV                       , 'vkGetClusterAccelerationStructureBuildSizesNV' );
     P( vkCmdBuildClusterAccelerationStructureIndirectNV                    , 'vkCmdBuildClusterAccelerationStructureIndirectNV' );
     P( vkGetPartitionedAccelerationStructuresBuildSizesNV                  , 'vkGetPartitionedAccelerationStructuresBuildSizesNV' );
     P( vkCmdBuildPartitionedAccelerationStructuresNV                       , 'vkCmdBuildPartitionedAccelerationStructuresNV' );
     P( vkGetGeneratedCommandsMemoryRequirementsEXT                         , 'vkGetGeneratedCommandsMemoryRequirementsEXT' );
     P( vkCmdPreprocessGeneratedCommandsEXT                                 , 'vkCmdPreprocessGeneratedCommandsEXT' );
     P( vkCmdExecuteGeneratedCommandsEXT                                    , 'vkCmdExecuteGeneratedCommandsEXT' );
     P( vkCreateIndirectCommandsLayoutEXT                                   , 'vkCreateIndirectCommandsLayoutEXT' );
     P( vkDestroyIndirectCommandsLayoutEXT                                  , 'vkDestroyIndirectCommandsLayoutEXT' );
     P( vkCreateIndirectExecutionSetEXT                                     , 'vkCreateIndirectExecutionSetEXT' );
     P( vkDestroyIndirectExecutionSetEXT                                    , 'vkDestroyIndirectExecutionSetEXT' );
     P( vkUpdateIndirectExecutionSetPipelineEXT                             , 'vkUpdateIndirectExecutionSetPipelineEXT' );
     P( vkUpdateIndirectExecutionSetShaderEXT                               , 'vkUpdateIndirectExecutionSetShaderEXT' );
     P( vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV  , 'vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV' );
     P( vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM  , 'vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM' );
     P( vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM            , 'vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM' );
     P( vkCreateShaderInstrumentationARM                                    , 'vkCreateShaderInstrumentationARM' );
     P( vkDestroyShaderInstrumentationARM                                   , 'vkDestroyShaderInstrumentationARM' );
     P( vkCmdBeginShaderInstrumentationARM                                  , 'vkCmdBeginShaderInstrumentationARM' );
     P( vkCmdEndShaderInstrumentationARM                                    , 'vkCmdEndShaderInstrumentationARM' );
     P( vkGetShaderInstrumentationValuesARM                                 , 'vkGetShaderInstrumentationValuesARM' );
     P( vkClearShaderInstrumentationMetricsARM                              , 'vkClearShaderInstrumentationMetricsARM' );
     P( vkCmdEndRendering2EXT                                               , 'vkCmdEndRendering2EXT' );
     P( vkCmdBeginCustomResolveEXT                                          , 'vkCmdBeginCustomResolveEXT' );
     P( vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM   , 'vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM' );
     P( vkCmdSetComputeOccupancyPriorityNV                                  , 'vkCmdSetComputeOccupancyPriorityNV' );
     P( vkCmdSetPrimitiveRestartIndexEXT                                    , 'vkCmdSetPrimitiveRestartIndexEXT' );
     P( vkCreateAccelerationStructureKHR                                    , 'vkCreateAccelerationStructureKHR' );
     P( vkDestroyAccelerationStructureKHR                                   , 'vkDestroyAccelerationStructureKHR' );
     P( vkCmdBuildAccelerationStructuresKHR                                 , 'vkCmdBuildAccelerationStructuresKHR' );
     P( vkCmdBuildAccelerationStructuresIndirectKHR                         , 'vkCmdBuildAccelerationStructuresIndirectKHR' );
     P( vkBuildAccelerationStructuresKHR                                    , 'vkBuildAccelerationStructuresKHR' );
     P( vkCopyAccelerationStructureKHR                                      , 'vkCopyAccelerationStructureKHR' );
     P( vkCopyAccelerationStructureToMemoryKHR                              , 'vkCopyAccelerationStructureToMemoryKHR' );
     P( vkCopyMemoryToAccelerationStructureKHR                              , 'vkCopyMemoryToAccelerationStructureKHR' );
     P( vkWriteAccelerationStructuresPropertiesKHR                          , 'vkWriteAccelerationStructuresPropertiesKHR' );
     P( vkCmdCopyAccelerationStructureKHR                                   , 'vkCmdCopyAccelerationStructureKHR' );
     P( vkCmdCopyAccelerationStructureToMemoryKHR                           , 'vkCmdCopyAccelerationStructureToMemoryKHR' );
     P( vkCmdCopyMemoryToAccelerationStructureKHR                           , 'vkCmdCopyMemoryToAccelerationStructureKHR' );
     P( vkGetAccelerationStructureDeviceAddressKHR                          , 'vkGetAccelerationStructureDeviceAddressKHR' );
     P( vkCmdWriteAccelerationStructuresPropertiesKHR                       , 'vkCmdWriteAccelerationStructuresPropertiesKHR' );
     P( vkGetDeviceAccelerationStructureCompatibilityKHR                    , 'vkGetDeviceAccelerationStructureCompatibilityKHR' );
     P( vkGetAccelerationStructureBuildSizesKHR                             , 'vkGetAccelerationStructureBuildSizesKHR' );
     P( vkCmdTraceRaysKHR                                                   , 'vkCmdTraceRaysKHR' );
     P( vkCreateRayTracingPipelinesKHR                                      , 'vkCreateRayTracingPipelinesKHR' );
     P( vkGetRayTracingCaptureReplayShaderGroupHandlesKHR                   , 'vkGetRayTracingCaptureReplayShaderGroupHandlesKHR' );
     P( vkCmdTraceRaysIndirectKHR                                           , 'vkCmdTraceRaysIndirectKHR' );
     P( vkGetRayTracingShaderGroupStackSizeKHR                              , 'vkGetRayTracingShaderGroupStackSizeKHR' );
     P( vkCmdSetRayTracingPipelineStackSizeKHR                              , 'vkCmdSetRayTracingPipelineStackSizeKHR' );
     P( vkCmdDrawMeshTasksEXT                                               , 'vkCmdDrawMeshTasksEXT' );
     P( vkCmdDrawMeshTasksIndirectEXT                                       , 'vkCmdDrawMeshTasksIndirectEXT' );
     P( vkCmdDrawMeshTasksIndirectCountEXT                                  , 'vkCmdDrawMeshTasksIndirectCountEXT' );

     {$IFDEF MSWINDOWS}
     P( vkCreateWin32SurfaceKHR                                             , 'vkCreateWin32SurfaceKHR' );
     P( vkGetPhysicalDeviceWin32PresentationSupportKHR                      , 'vkGetPhysicalDeviceWin32PresentationSupportKHR' );
     P( vkGetMemoryWin32HandleKHR                                           , 'vkGetMemoryWin32HandleKHR' );
     P( vkGetMemoryWin32HandlePropertiesKHR                                 , 'vkGetMemoryWin32HandlePropertiesKHR' );
     P( vkImportSemaphoreWin32HandleKHR                                     , 'vkImportSemaphoreWin32HandleKHR' );
     P( vkGetSemaphoreWin32HandleKHR                                        , 'vkGetSemaphoreWin32HandleKHR' );
     P( vkImportFenceWin32HandleKHR                                         , 'vkImportFenceWin32HandleKHR' );
     P( vkGetFenceWin32HandleKHR                                            , 'vkGetFenceWin32HandleKHR' );
     P( vkGetMemoryWin32HandleNV                                            , 'vkGetMemoryWin32HandleNV' );
     P( vkGetPhysicalDeviceSurfacePresentModes2EXT                          , 'vkGetPhysicalDeviceSurfacePresentModes2EXT' );
     P( vkAcquireFullScreenExclusiveModeEXT                                 , 'vkAcquireFullScreenExclusiveModeEXT' );
     P( vkReleaseFullScreenExclusiveModeEXT                                 , 'vkReleaseFullScreenExclusiveModeEXT' );
     P( vkGetDeviceGroupSurfacePresentModes2EXT                             , 'vkGetDeviceGroupSurfacePresentModes2EXT' );
     P( vkAcquireWinrtDisplayNV                                             , 'vkAcquireWinrtDisplayNV' );
     P( vkGetWinrtDisplayNV                                                 , 'vkGetWinrtDisplayNV' );
     {$ENDIF}
end;

procedure LoadDeviceFunctions( const device_:T_VkDevice );

     procedure P( var Proc_; const Name_:P_char );
     var
        A :Pointer;
     begin
          A := _GetDeviceProc( device_, Name_ );
          if Assigned( A ) then Pointer( Proc_ ) := A;
     end;

begin
     if not Assigned( _GetDeviceProc ) then Exit;

     P( vkGetDeviceProcAddr                                                 , 'vkGetDeviceProcAddr' );
     P( vkDestroyDevice                                                     , 'vkDestroyDevice' );
     P( vkGetDeviceQueue                                                    , 'vkGetDeviceQueue' );
     P( vkQueueSubmit                                                       , 'vkQueueSubmit' );
     P( vkQueueWaitIdle                                                     , 'vkQueueWaitIdle' );
     P( vkDeviceWaitIdle                                                    , 'vkDeviceWaitIdle' );
     P( vkAllocateMemory                                                    , 'vkAllocateMemory' );
     P( vkFreeMemory                                                        , 'vkFreeMemory' );
     P( vkMapMemory                                                         , 'vkMapMemory' );
     P( vkUnmapMemory                                                       , 'vkUnmapMemory' );
     P( vkFlushMappedMemoryRanges                                           , 'vkFlushMappedMemoryRanges' );
     P( vkInvalidateMappedMemoryRanges                                      , 'vkInvalidateMappedMemoryRanges' );
     P( vkGetDeviceMemoryCommitment                                         , 'vkGetDeviceMemoryCommitment' );
     P( vkBindBufferMemory                                                  , 'vkBindBufferMemory' );
     P( vkBindImageMemory                                                   , 'vkBindImageMemory' );
     P( vkGetBufferMemoryRequirements                                       , 'vkGetBufferMemoryRequirements' );
     P( vkGetImageMemoryRequirements                                        , 'vkGetImageMemoryRequirements' );
     P( vkGetImageSparseMemoryRequirements                                  , 'vkGetImageSparseMemoryRequirements' );
     P( vkQueueBindSparse                                                   , 'vkQueueBindSparse' );
     P( vkCreateFence                                                       , 'vkCreateFence' );
     P( vkDestroyFence                                                      , 'vkDestroyFence' );
     P( vkResetFences                                                       , 'vkResetFences' );
     P( vkGetFenceStatus                                                    , 'vkGetFenceStatus' );
     P( vkWaitForFences                                                     , 'vkWaitForFences' );
     P( vkCreateSemaphore                                                   , 'vkCreateSemaphore' );
     P( vkDestroySemaphore                                                  , 'vkDestroySemaphore' );
     P( vkCreateQueryPool                                                   , 'vkCreateQueryPool' );
     P( vkDestroyQueryPool                                                  , 'vkDestroyQueryPool' );
     P( vkGetQueryPoolResults                                               , 'vkGetQueryPoolResults' );
     P( vkCreateBuffer                                                      , 'vkCreateBuffer' );
     P( vkDestroyBuffer                                                     , 'vkDestroyBuffer' );
     P( vkCreateImage                                                       , 'vkCreateImage' );
     P( vkDestroyImage                                                      , 'vkDestroyImage' );
     P( vkGetImageSubresourceLayout                                         , 'vkGetImageSubresourceLayout' );
     P( vkCreateImageView                                                   , 'vkCreateImageView' );
     P( vkDestroyImageView                                                  , 'vkDestroyImageView' );
     P( vkCreateCommandPool                                                 , 'vkCreateCommandPool' );
     P( vkDestroyCommandPool                                                , 'vkDestroyCommandPool' );
     P( vkResetCommandPool                                                  , 'vkResetCommandPool' );
     P( vkAllocateCommandBuffers                                            , 'vkAllocateCommandBuffers' );
     P( vkFreeCommandBuffers                                                , 'vkFreeCommandBuffers' );
     P( vkBeginCommandBuffer                                                , 'vkBeginCommandBuffer' );
     P( vkEndCommandBuffer                                                  , 'vkEndCommandBuffer' );
     P( vkResetCommandBuffer                                                , 'vkResetCommandBuffer' );
     P( vkCmdCopyBuffer                                                     , 'vkCmdCopyBuffer' );
     P( vkCmdCopyImage                                                      , 'vkCmdCopyImage' );
     P( vkCmdCopyBufferToImage                                              , 'vkCmdCopyBufferToImage' );
     P( vkCmdCopyImageToBuffer                                              , 'vkCmdCopyImageToBuffer' );
     P( vkCmdUpdateBuffer                                                   , 'vkCmdUpdateBuffer' );
     P( vkCmdFillBuffer                                                     , 'vkCmdFillBuffer' );
     P( vkCmdPipelineBarrier                                                , 'vkCmdPipelineBarrier' );
     P( vkCmdBeginQuery                                                     , 'vkCmdBeginQuery' );
     P( vkCmdEndQuery                                                       , 'vkCmdEndQuery' );
     P( vkCmdResetQueryPool                                                 , 'vkCmdResetQueryPool' );
     P( vkCmdWriteTimestamp                                                 , 'vkCmdWriteTimestamp' );
     P( vkCmdCopyQueryPoolResults                                           , 'vkCmdCopyQueryPoolResults' );
     P( vkCmdExecuteCommands                                                , 'vkCmdExecuteCommands' );
     P( vkCreateEvent                                                       , 'vkCreateEvent' );
     P( vkDestroyEvent                                                      , 'vkDestroyEvent' );
     P( vkGetEventStatus                                                    , 'vkGetEventStatus' );
     P( vkSetEvent                                                          , 'vkSetEvent' );
     P( vkResetEvent                                                        , 'vkResetEvent' );
     P( vkCreateBufferView                                                  , 'vkCreateBufferView' );
     P( vkDestroyBufferView                                                 , 'vkDestroyBufferView' );
     P( vkCreateShaderModule                                                , 'vkCreateShaderModule' );
     P( vkDestroyShaderModule                                               , 'vkDestroyShaderModule' );
     P( vkCreatePipelineCache                                               , 'vkCreatePipelineCache' );
     P( vkDestroyPipelineCache                                              , 'vkDestroyPipelineCache' );
     P( vkGetPipelineCacheData                                              , 'vkGetPipelineCacheData' );
     P( vkMergePipelineCaches                                               , 'vkMergePipelineCaches' );
     P( vkCreateComputePipelines                                            , 'vkCreateComputePipelines' );
     P( vkDestroyPipeline                                                   , 'vkDestroyPipeline' );
     P( vkCreatePipelineLayout                                              , 'vkCreatePipelineLayout' );
     P( vkDestroyPipelineLayout                                             , 'vkDestroyPipelineLayout' );
     P( vkCreateSampler                                                     , 'vkCreateSampler' );
     P( vkDestroySampler                                                    , 'vkDestroySampler' );
     P( vkCreateDescriptorSetLayout                                         , 'vkCreateDescriptorSetLayout' );
     P( vkDestroyDescriptorSetLayout                                        , 'vkDestroyDescriptorSetLayout' );
     P( vkCreateDescriptorPool                                              , 'vkCreateDescriptorPool' );
     P( vkDestroyDescriptorPool                                             , 'vkDestroyDescriptorPool' );
     P( vkResetDescriptorPool                                               , 'vkResetDescriptorPool' );
     P( vkAllocateDescriptorSets                                            , 'vkAllocateDescriptorSets' );
     P( vkFreeDescriptorSets                                                , 'vkFreeDescriptorSets' );
     P( vkUpdateDescriptorSets                                              , 'vkUpdateDescriptorSets' );
     P( vkCmdBindPipeline                                                   , 'vkCmdBindPipeline' );
     P( vkCmdBindDescriptorSets                                             , 'vkCmdBindDescriptorSets' );
     P( vkCmdClearColorImage                                                , 'vkCmdClearColorImage' );
     P( vkCmdDispatch                                                       , 'vkCmdDispatch' );
     P( vkCmdDispatchIndirect                                               , 'vkCmdDispatchIndirect' );
     P( vkCmdSetEvent                                                       , 'vkCmdSetEvent' );
     P( vkCmdResetEvent                                                     , 'vkCmdResetEvent' );
     P( vkCmdWaitEvents                                                     , 'vkCmdWaitEvents' );
     P( vkCmdPushConstants                                                  , 'vkCmdPushConstants' );
     P( vkCreateGraphicsPipelines                                           , 'vkCreateGraphicsPipelines' );
     P( vkCreateFramebuffer                                                 , 'vkCreateFramebuffer' );
     P( vkDestroyFramebuffer                                                , 'vkDestroyFramebuffer' );
     P( vkCreateRenderPass                                                  , 'vkCreateRenderPass' );
     P( vkDestroyRenderPass                                                 , 'vkDestroyRenderPass' );
     P( vkGetRenderAreaGranularity                                          , 'vkGetRenderAreaGranularity' );
     P( vkCmdSetViewport                                                    , 'vkCmdSetViewport' );
     P( vkCmdSetScissor                                                     , 'vkCmdSetScissor' );
     P( vkCmdSetLineWidth                                                   , 'vkCmdSetLineWidth' );
     P( vkCmdSetDepthBias                                                   , 'vkCmdSetDepthBias' );
     P( vkCmdSetBlendConstants                                              , 'vkCmdSetBlendConstants' );
     P( vkCmdSetDepthBounds                                                 , 'vkCmdSetDepthBounds' );
     P( vkCmdSetStencilCompareMask                                          , 'vkCmdSetStencilCompareMask' );
     P( vkCmdSetStencilWriteMask                                            , 'vkCmdSetStencilWriteMask' );
     P( vkCmdSetStencilReference                                            , 'vkCmdSetStencilReference' );
     P( vkCmdBindIndexBuffer                                                , 'vkCmdBindIndexBuffer' );
     P( vkCmdBindVertexBuffers                                              , 'vkCmdBindVertexBuffers' );
     P( vkCmdDraw                                                           , 'vkCmdDraw' );
     P( vkCmdDrawIndexed                                                    , 'vkCmdDrawIndexed' );
     P( vkCmdDrawIndirect                                                   , 'vkCmdDrawIndirect' );
     P( vkCmdDrawIndexedIndirect                                            , 'vkCmdDrawIndexedIndirect' );
     P( vkCmdBlitImage                                                      , 'vkCmdBlitImage' );
     P( vkCmdClearDepthStencilImage                                         , 'vkCmdClearDepthStencilImage' );
     P( vkCmdClearAttachments                                               , 'vkCmdClearAttachments' );
     P( vkCmdResolveImage                                                   , 'vkCmdResolveImage' );
     P( vkCmdBeginRenderPass                                                , 'vkCmdBeginRenderPass' );
     P( vkCmdNextSubpass                                                    , 'vkCmdNextSubpass' );
     P( vkCmdEndRenderPass                                                  , 'vkCmdEndRenderPass' );
     P( vkBindBufferMemory2                                                 , 'vkBindBufferMemory2' );
     P( vkBindImageMemory2                                                  , 'vkBindImageMemory2' );
     P( vkGetDeviceGroupPeerMemoryFeatures                                  , 'vkGetDeviceGroupPeerMemoryFeatures' );
     P( vkCmdSetDeviceMask                                                  , 'vkCmdSetDeviceMask' );
     P( vkGetImageMemoryRequirements2                                       , 'vkGetImageMemoryRequirements2' );
     P( vkGetBufferMemoryRequirements2                                      , 'vkGetBufferMemoryRequirements2' );
     P( vkGetImageSparseMemoryRequirements2                                 , 'vkGetImageSparseMemoryRequirements2' );
     P( vkTrimCommandPool                                                   , 'vkTrimCommandPool' );
     P( vkGetDeviceQueue2                                                   , 'vkGetDeviceQueue2' );
     P( vkCmdDispatchBase                                                   , 'vkCmdDispatchBase' );
     P( vkCreateDescriptorUpdateTemplate                                    , 'vkCreateDescriptorUpdateTemplate' );
     P( vkDestroyDescriptorUpdateTemplate                                   , 'vkDestroyDescriptorUpdateTemplate' );
     P( vkUpdateDescriptorSetWithTemplate                                   , 'vkUpdateDescriptorSetWithTemplate' );
     P( vkGetDescriptorSetLayoutSupport                                     , 'vkGetDescriptorSetLayoutSupport' );
     P( vkCreateSamplerYcbcrConversion                                      , 'vkCreateSamplerYcbcrConversion' );
     P( vkDestroySamplerYcbcrConversion                                     , 'vkDestroySamplerYcbcrConversion' );
     P( vkResetQueryPool                                                    , 'vkResetQueryPool' );
     P( vkGetSemaphoreCounterValue                                          , 'vkGetSemaphoreCounterValue' );
     P( vkWaitSemaphores                                                    , 'vkWaitSemaphores' );
     P( vkSignalSemaphore                                                   , 'vkSignalSemaphore' );
     P( vkGetBufferDeviceAddress                                            , 'vkGetBufferDeviceAddress' );
     P( vkGetBufferOpaqueCaptureAddress                                     , 'vkGetBufferOpaqueCaptureAddress' );
     P( vkGetDeviceMemoryOpaqueCaptureAddress                               , 'vkGetDeviceMemoryOpaqueCaptureAddress' );
     P( vkCmdDrawIndirectCount                                              , 'vkCmdDrawIndirectCount' );
     P( vkCmdDrawIndexedIndirectCount                                       , 'vkCmdDrawIndexedIndirectCount' );
     P( vkCreateRenderPass2                                                 , 'vkCreateRenderPass2' );
     P( vkCmdBeginRenderPass2                                               , 'vkCmdBeginRenderPass2' );
     P( vkCmdNextSubpass2                                                   , 'vkCmdNextSubpass2' );
     P( vkCmdEndRenderPass2                                                 , 'vkCmdEndRenderPass2' );
     P( vkCreatePrivateDataSlot                                             , 'vkCreatePrivateDataSlot' );
     P( vkDestroyPrivateDataSlot                                            , 'vkDestroyPrivateDataSlot' );
     P( vkSetPrivateData                                                    , 'vkSetPrivateData' );
     P( vkGetPrivateData                                                    , 'vkGetPrivateData' );
     P( vkCmdPipelineBarrier2                                               , 'vkCmdPipelineBarrier2' );
     P( vkCmdWriteTimestamp2                                                , 'vkCmdWriteTimestamp2' );
     P( vkQueueSubmit2                                                      , 'vkQueueSubmit2' );
     P( vkCmdCopyBuffer2                                                    , 'vkCmdCopyBuffer2' );
     P( vkCmdCopyImage2                                                     , 'vkCmdCopyImage2' );
     P( vkCmdCopyBufferToImage2                                             , 'vkCmdCopyBufferToImage2' );
     P( vkCmdCopyImageToBuffer2                                             , 'vkCmdCopyImageToBuffer2' );
     P( vkGetDeviceBufferMemoryRequirements                                 , 'vkGetDeviceBufferMemoryRequirements' );
     P( vkGetDeviceImageMemoryRequirements                                  , 'vkGetDeviceImageMemoryRequirements' );
     P( vkGetDeviceImageSparseMemoryRequirements                            , 'vkGetDeviceImageSparseMemoryRequirements' );
     P( vkCmdSetEvent2                                                      , 'vkCmdSetEvent2' );
     P( vkCmdResetEvent2                                                    , 'vkCmdResetEvent2' );
     P( vkCmdWaitEvents2                                                    , 'vkCmdWaitEvents2' );
     P( vkCmdBlitImage2                                                     , 'vkCmdBlitImage2' );
     P( vkCmdResolveImage2                                                  , 'vkCmdResolveImage2' );
     P( vkCmdBeginRendering                                                 , 'vkCmdBeginRendering' );
     P( vkCmdEndRendering                                                   , 'vkCmdEndRendering' );
     P( vkCmdSetCullMode                                                    , 'vkCmdSetCullMode' );
     P( vkCmdSetFrontFace                                                   , 'vkCmdSetFrontFace' );
     P( vkCmdSetPrimitiveTopology                                           , 'vkCmdSetPrimitiveTopology' );
     P( vkCmdSetViewportWithCount                                           , 'vkCmdSetViewportWithCount' );
     P( vkCmdSetScissorWithCount                                            , 'vkCmdSetScissorWithCount' );
     P( vkCmdBindVertexBuffers2                                             , 'vkCmdBindVertexBuffers2' );
     P( vkCmdSetDepthTestEnable                                             , 'vkCmdSetDepthTestEnable' );
     P( vkCmdSetDepthWriteEnable                                            , 'vkCmdSetDepthWriteEnable' );
     P( vkCmdSetDepthCompareOp                                              , 'vkCmdSetDepthCompareOp' );
     P( vkCmdSetDepthBoundsTestEnable                                       , 'vkCmdSetDepthBoundsTestEnable' );
     P( vkCmdSetStencilTestEnable                                           , 'vkCmdSetStencilTestEnable' );
     P( vkCmdSetStencilOp                                                   , 'vkCmdSetStencilOp' );
     P( vkCmdSetRasterizerDiscardEnable                                     , 'vkCmdSetRasterizerDiscardEnable' );
     P( vkCmdSetDepthBiasEnable                                             , 'vkCmdSetDepthBiasEnable' );
     P( vkCmdSetPrimitiveRestartEnable                                      , 'vkCmdSetPrimitiveRestartEnable' );
     P( vkMapMemory2                                                        , 'vkMapMemory2' );
     P( vkUnmapMemory2                                                      , 'vkUnmapMemory2' );
     P( vkGetDeviceImageSubresourceLayout                                   , 'vkGetDeviceImageSubresourceLayout' );
     P( vkGetImageSubresourceLayout2                                        , 'vkGetImageSubresourceLayout2' );
     P( vkCopyMemoryToImage                                                 , 'vkCopyMemoryToImage' );
     P( vkCopyImageToMemory                                                 , 'vkCopyImageToMemory' );
     P( vkCopyImageToImage                                                  , 'vkCopyImageToImage' );
     P( vkTransitionImageLayout                                             , 'vkTransitionImageLayout' );
     P( vkCmdPushDescriptorSet                                              , 'vkCmdPushDescriptorSet' );
     P( vkCmdPushDescriptorSetWithTemplate                                  , 'vkCmdPushDescriptorSetWithTemplate' );
     P( vkCmdBindDescriptorSets2                                            , 'vkCmdBindDescriptorSets2' );
     P( vkCmdPushConstants2                                                 , 'vkCmdPushConstants2' );
     P( vkCmdPushDescriptorSet2                                             , 'vkCmdPushDescriptorSet2' );
     P( vkCmdPushDescriptorSetWithTemplate2                                 , 'vkCmdPushDescriptorSetWithTemplate2' );
     P( vkCmdSetLineStipple                                                 , 'vkCmdSetLineStipple' );
     P( vkCmdBindIndexBuffer2                                               , 'vkCmdBindIndexBuffer2' );
     P( vkGetRenderingAreaGranularity                                       , 'vkGetRenderingAreaGranularity' );
     P( vkCmdSetRenderingAttachmentLocations                                , 'vkCmdSetRenderingAttachmentLocations' );
     P( vkCmdSetRenderingInputAttachmentIndices                             , 'vkCmdSetRenderingInputAttachmentIndices' );
     P( vkCreateSwapchainKHR                                                , 'vkCreateSwapchainKHR' );
     P( vkDestroySwapchainKHR                                               , 'vkDestroySwapchainKHR' );
     P( vkGetSwapchainImagesKHR                                             , 'vkGetSwapchainImagesKHR' );
     P( vkAcquireNextImageKHR                                               , 'vkAcquireNextImageKHR' );
     P( vkQueuePresentKHR                                                   , 'vkQueuePresentKHR' );
     P( vkGetDeviceGroupPresentCapabilitiesKHR                              , 'vkGetDeviceGroupPresentCapabilitiesKHR' );
     P( vkGetDeviceGroupSurfacePresentModesKHR                              , 'vkGetDeviceGroupSurfacePresentModesKHR' );
     P( vkAcquireNextImage2KHR                                              , 'vkAcquireNextImage2KHR' );
     P( vkCreateSharedSwapchainsKHR                                         , 'vkCreateSharedSwapchainsKHR' );
     P( vkCreateVideoSessionKHR                                             , 'vkCreateVideoSessionKHR' );
     P( vkDestroyVideoSessionKHR                                            , 'vkDestroyVideoSessionKHR' );
     P( vkGetVideoSessionMemoryRequirementsKHR                              , 'vkGetVideoSessionMemoryRequirementsKHR' );
     P( vkBindVideoSessionMemoryKHR                                         , 'vkBindVideoSessionMemoryKHR' );
     P( vkCreateVideoSessionParametersKHR                                   , 'vkCreateVideoSessionParametersKHR' );
     P( vkUpdateVideoSessionParametersKHR                                   , 'vkUpdateVideoSessionParametersKHR' );
     P( vkDestroyVideoSessionParametersKHR                                  , 'vkDestroyVideoSessionParametersKHR' );
     P( vkCmdBeginVideoCodingKHR                                            , 'vkCmdBeginVideoCodingKHR' );
     P( vkCmdEndVideoCodingKHR                                              , 'vkCmdEndVideoCodingKHR' );
     P( vkCmdControlVideoCodingKHR                                          , 'vkCmdControlVideoCodingKHR' );
     P( vkCmdDecodeVideoKHR                                                 , 'vkCmdDecodeVideoKHR' );
     P( vkCmdBeginRenderingKHR                                              , 'vkCmdBeginRenderingKHR' );
     P( vkCmdEndRenderingKHR                                                , 'vkCmdEndRenderingKHR' );
     P( vkGetDeviceGroupPeerMemoryFeaturesKHR                               , 'vkGetDeviceGroupPeerMemoryFeaturesKHR' );
     P( vkCmdSetDeviceMaskKHR                                               , 'vkCmdSetDeviceMaskKHR' );
     P( vkCmdDispatchBaseKHR                                                , 'vkCmdDispatchBaseKHR' );
     P( vkTrimCommandPoolKHR                                                , 'vkTrimCommandPoolKHR' );
     P( vkGetMemoryFdKHR                                                    , 'vkGetMemoryFdKHR' );
     P( vkGetMemoryFdPropertiesKHR                                          , 'vkGetMemoryFdPropertiesKHR' );
     P( vkImportSemaphoreFdKHR                                              , 'vkImportSemaphoreFdKHR' );
     P( vkGetSemaphoreFdKHR                                                 , 'vkGetSemaphoreFdKHR' );
     P( vkCmdPushDescriptorSetKHR                                           , 'vkCmdPushDescriptorSetKHR' );
     P( vkCmdPushDescriptorSetWithTemplateKHR                               , 'vkCmdPushDescriptorSetWithTemplateKHR' );
     P( vkCreateDescriptorUpdateTemplateKHR                                 , 'vkCreateDescriptorUpdateTemplateKHR' );
     P( vkDestroyDescriptorUpdateTemplateKHR                                , 'vkDestroyDescriptorUpdateTemplateKHR' );
     P( vkUpdateDescriptorSetWithTemplateKHR                                , 'vkUpdateDescriptorSetWithTemplateKHR' );
     P( vkCreateRenderPass2KHR                                              , 'vkCreateRenderPass2KHR' );
     P( vkCmdBeginRenderPass2KHR                                            , 'vkCmdBeginRenderPass2KHR' );
     P( vkCmdNextSubpass2KHR                                                , 'vkCmdNextSubpass2KHR' );
     P( vkCmdEndRenderPass2KHR                                              , 'vkCmdEndRenderPass2KHR' );
     P( vkGetSwapchainStatusKHR                                             , 'vkGetSwapchainStatusKHR' );
     P( vkImportFenceFdKHR                                                  , 'vkImportFenceFdKHR' );
     P( vkGetFenceFdKHR                                                     , 'vkGetFenceFdKHR' );
     P( vkAcquireProfilingLockKHR                                           , 'vkAcquireProfilingLockKHR' );
     P( vkReleaseProfilingLockKHR                                           , 'vkReleaseProfilingLockKHR' );
     P( vkGetImageMemoryRequirements2KHR                                    , 'vkGetImageMemoryRequirements2KHR' );
     P( vkGetBufferMemoryRequirements2KHR                                   , 'vkGetBufferMemoryRequirements2KHR' );
     P( vkGetImageSparseMemoryRequirements2KHR                              , 'vkGetImageSparseMemoryRequirements2KHR' );
     P( vkCreateSamplerYcbcrConversionKHR                                   , 'vkCreateSamplerYcbcrConversionKHR' );
     P( vkDestroySamplerYcbcrConversionKHR                                  , 'vkDestroySamplerYcbcrConversionKHR' );
     P( vkBindBufferMemory2KHR                                              , 'vkBindBufferMemory2KHR' );
     P( vkBindImageMemory2KHR                                               , 'vkBindImageMemory2KHR' );
     P( vkGetDescriptorSetLayoutSupportKHR                                  , 'vkGetDescriptorSetLayoutSupportKHR' );
     P( vkCmdDrawIndirectCountKHR                                           , 'vkCmdDrawIndirectCountKHR' );
     P( vkCmdDrawIndexedIndirectCountKHR                                    , 'vkCmdDrawIndexedIndirectCountKHR' );
     P( vkGetSemaphoreCounterValueKHR                                       , 'vkGetSemaphoreCounterValueKHR' );
     P( vkWaitSemaphoresKHR                                                 , 'vkWaitSemaphoresKHR' );
     P( vkSignalSemaphoreKHR                                                , 'vkSignalSemaphoreKHR' );
     P( vkCmdSetFragmentShadingRateKHR                                      , 'vkCmdSetFragmentShadingRateKHR' );
     P( vkCmdSetRenderingAttachmentLocationsKHR                             , 'vkCmdSetRenderingAttachmentLocationsKHR' );
     P( vkCmdSetRenderingInputAttachmentIndicesKHR                          , 'vkCmdSetRenderingInputAttachmentIndicesKHR' );
     P( vkWaitForPresentKHR                                                 , 'vkWaitForPresentKHR' );
     P( vkGetBufferDeviceAddressKHR                                         , 'vkGetBufferDeviceAddressKHR' );
     P( vkGetBufferOpaqueCaptureAddressKHR                                  , 'vkGetBufferOpaqueCaptureAddressKHR' );
     P( vkGetDeviceMemoryOpaqueCaptureAddressKHR                            , 'vkGetDeviceMemoryOpaqueCaptureAddressKHR' );
     P( vkCreateDeferredOperationKHR                                        , 'vkCreateDeferredOperationKHR' );
     P( vkDestroyDeferredOperationKHR                                       , 'vkDestroyDeferredOperationKHR' );
     P( vkGetDeferredOperationMaxConcurrencyKHR                             , 'vkGetDeferredOperationMaxConcurrencyKHR' );
     P( vkGetDeferredOperationResultKHR                                     , 'vkGetDeferredOperationResultKHR' );
     P( vkDeferredOperationJoinKHR                                          , 'vkDeferredOperationJoinKHR' );
     P( vkGetPipelineExecutablePropertiesKHR                                , 'vkGetPipelineExecutablePropertiesKHR' );
     P( vkGetPipelineExecutableStatisticsKHR                                , 'vkGetPipelineExecutableStatisticsKHR' );
     P( vkGetPipelineExecutableInternalRepresentationsKHR                   , 'vkGetPipelineExecutableInternalRepresentationsKHR' );
     P( vkMapMemory2KHR                                                     , 'vkMapMemory2KHR' );
     P( vkUnmapMemory2KHR                                                   , 'vkUnmapMemory2KHR' );
     P( vkGetEncodedVideoSessionParametersKHR                               , 'vkGetEncodedVideoSessionParametersKHR' );
     P( vkCmdEncodeVideoKHR                                                 , 'vkCmdEncodeVideoKHR' );
     P( vkCmdSetEvent2KHR                                                   , 'vkCmdSetEvent2KHR' );
     P( vkCmdResetEvent2KHR                                                 , 'vkCmdResetEvent2KHR' );
     P( vkCmdWaitEvents2KHR                                                 , 'vkCmdWaitEvents2KHR' );
     P( vkCmdPipelineBarrier2KHR                                            , 'vkCmdPipelineBarrier2KHR' );
     P( vkCmdWriteTimestamp2KHR                                             , 'vkCmdWriteTimestamp2KHR' );
     P( vkQueueSubmit2KHR                                                   , 'vkQueueSubmit2KHR' );
     P( vkCmdBindIndexBuffer3KHR                                            , 'vkCmdBindIndexBuffer3KHR' );
     P( vkCmdBindVertexBuffers3KHR                                          , 'vkCmdBindVertexBuffers3KHR' );
     P( vkCmdDrawIndirect2KHR                                               , 'vkCmdDrawIndirect2KHR' );
     P( vkCmdDrawIndexedIndirect2KHR                                        , 'vkCmdDrawIndexedIndirect2KHR' );
     P( vkCmdDispatchIndirect2KHR                                           , 'vkCmdDispatchIndirect2KHR' );
     P( vkCmdCopyMemoryKHR                                                  , 'vkCmdCopyMemoryKHR' );
     P( vkCmdCopyMemoryToImageKHR                                           , 'vkCmdCopyMemoryToImageKHR' );
     P( vkCmdCopyImageToMemoryKHR                                           , 'vkCmdCopyImageToMemoryKHR' );
     P( vkCmdUpdateMemoryKHR                                                , 'vkCmdUpdateMemoryKHR' );
     P( vkCmdFillMemoryKHR                                                  , 'vkCmdFillMemoryKHR' );
     P( vkCmdCopyQueryPoolResultsToMemoryKHR                                , 'vkCmdCopyQueryPoolResultsToMemoryKHR' );
     P( vkCmdDrawIndirectCount2KHR                                          , 'vkCmdDrawIndirectCount2KHR' );
     P( vkCmdDrawIndexedIndirectCount2KHR                                   , 'vkCmdDrawIndexedIndirectCount2KHR' );
     P( vkCmdBeginConditionalRendering2EXT                                  , 'vkCmdBeginConditionalRendering2EXT' );
     P( vkCmdBindTransformFeedbackBuffers2EXT                               , 'vkCmdBindTransformFeedbackBuffers2EXT' );
     P( vkCmdBeginTransformFeedback2EXT                                     , 'vkCmdBeginTransformFeedback2EXT' );
     P( vkCmdEndTransformFeedback2EXT                                       , 'vkCmdEndTransformFeedback2EXT' );
     P( vkCmdDrawIndirectByteCount2EXT                                      , 'vkCmdDrawIndirectByteCount2EXT' );
     P( vkCmdDrawMeshTasksIndirect2EXT                                      , 'vkCmdDrawMeshTasksIndirect2EXT' );
     P( vkCmdDrawMeshTasksIndirectCount2EXT                                 , 'vkCmdDrawMeshTasksIndirectCount2EXT' );
     P( vkCmdWriteMarkerToMemoryAMD                                         , 'vkCmdWriteMarkerToMemoryAMD' );
     P( vkCreateAccelerationStructure2KHR                                   , 'vkCreateAccelerationStructure2KHR' );
     P( vkCmdCopyBuffer2KHR                                                 , 'vkCmdCopyBuffer2KHR' );
     P( vkCmdCopyImage2KHR                                                  , 'vkCmdCopyImage2KHR' );
     P( vkCmdCopyBufferToImage2KHR                                          , 'vkCmdCopyBufferToImage2KHR' );
     P( vkCmdCopyImageToBuffer2KHR                                          , 'vkCmdCopyImageToBuffer2KHR' );
     P( vkCmdBlitImage2KHR                                                  , 'vkCmdBlitImage2KHR' );
     P( vkCmdResolveImage2KHR                                               , 'vkCmdResolveImage2KHR' );
     P( vkCmdTraceRaysIndirect2KHR                                          , 'vkCmdTraceRaysIndirect2KHR' );
     P( vkGetDeviceBufferMemoryRequirementsKHR                              , 'vkGetDeviceBufferMemoryRequirementsKHR' );
     P( vkGetDeviceImageMemoryRequirementsKHR                               , 'vkGetDeviceImageMemoryRequirementsKHR' );
     P( vkGetDeviceImageSparseMemoryRequirementsKHR                         , 'vkGetDeviceImageSparseMemoryRequirementsKHR' );
     P( vkCmdBindIndexBuffer2KHR                                            , 'vkCmdBindIndexBuffer2KHR' );
     P( vkGetRenderingAreaGranularityKHR                                    , 'vkGetRenderingAreaGranularityKHR' );
     P( vkGetDeviceImageSubresourceLayoutKHR                                , 'vkGetDeviceImageSubresourceLayoutKHR' );
     P( vkGetImageSubresourceLayout2KHR                                     , 'vkGetImageSubresourceLayout2KHR' );
     P( vkWaitForPresent2KHR                                                , 'vkWaitForPresent2KHR' );
     P( vkCreatePipelineBinariesKHR                                         , 'vkCreatePipelineBinariesKHR' );
     P( vkDestroyPipelineBinaryKHR                                          , 'vkDestroyPipelineBinaryKHR' );
     P( vkGetPipelineKeyKHR                                                 , 'vkGetPipelineKeyKHR' );
     P( vkGetPipelineBinaryDataKHR                                          , 'vkGetPipelineBinaryDataKHR' );
     P( vkReleaseCapturedPipelineDataKHR                                    , 'vkReleaseCapturedPipelineDataKHR' );
     P( vkReleaseSwapchainImagesKHR                                         , 'vkReleaseSwapchainImagesKHR' );
     P( vkCmdSetLineStippleKHR                                              , 'vkCmdSetLineStippleKHR' );
     P( vkGetCalibratedTimestampsKHR                                        , 'vkGetCalibratedTimestampsKHR' );
     P( vkCmdBindDescriptorSets2KHR                                         , 'vkCmdBindDescriptorSets2KHR' );
     P( vkCmdPushConstants2KHR                                              , 'vkCmdPushConstants2KHR' );
     P( vkCmdPushDescriptorSet2KHR                                          , 'vkCmdPushDescriptorSet2KHR' );
     P( vkCmdPushDescriptorSetWithTemplate2KHR                              , 'vkCmdPushDescriptorSetWithTemplate2KHR' );
     P( vkCmdSetDescriptorBufferOffsets2EXT                                 , 'vkCmdSetDescriptorBufferOffsets2EXT' );
     P( vkCmdBindDescriptorBufferEmbeddedSamplers2EXT                       , 'vkCmdBindDescriptorBufferEmbeddedSamplers2EXT' );
     P( vkCmdCopyMemoryIndirectKHR                                          , 'vkCmdCopyMemoryIndirectKHR' );
     P( vkCmdCopyMemoryToImageIndirectKHR                                   , 'vkCmdCopyMemoryToImageIndirectKHR' );
     P( vkGetDeviceFaultReportsKHR                                          , 'vkGetDeviceFaultReportsKHR' );
     P( vkGetDeviceFaultDebugInfoKHR                                        , 'vkGetDeviceFaultDebugInfoKHR' );
     P( vkCmdEndRendering2KHR                                               , 'vkCmdEndRendering2KHR' );
     P( vkDebugMarkerSetObjectTagEXT                                        , 'vkDebugMarkerSetObjectTagEXT' );
     P( vkDebugMarkerSetObjectNameEXT                                       , 'vkDebugMarkerSetObjectNameEXT' );
     P( vkCmdDebugMarkerBeginEXT                                            , 'vkCmdDebugMarkerBeginEXT' );
     P( vkCmdDebugMarkerEndEXT                                              , 'vkCmdDebugMarkerEndEXT' );
     P( vkCmdDebugMarkerInsertEXT                                           , 'vkCmdDebugMarkerInsertEXT' );
     P( vkCmdBindTransformFeedbackBuffersEXT                                , 'vkCmdBindTransformFeedbackBuffersEXT' );
     P( vkCmdBeginTransformFeedbackEXT                                      , 'vkCmdBeginTransformFeedbackEXT' );
     P( vkCmdEndTransformFeedbackEXT                                        , 'vkCmdEndTransformFeedbackEXT' );
     P( vkCmdBeginQueryIndexedEXT                                           , 'vkCmdBeginQueryIndexedEXT' );
     P( vkCmdEndQueryIndexedEXT                                             , 'vkCmdEndQueryIndexedEXT' );
     P( vkCmdDrawIndirectByteCountEXT                                       , 'vkCmdDrawIndirectByteCountEXT' );
     P( vkCreateCuModuleNVX                                                 , 'vkCreateCuModuleNVX' );
     P( vkCreateCuFunctionNVX                                               , 'vkCreateCuFunctionNVX' );
     P( vkDestroyCuModuleNVX                                                , 'vkDestroyCuModuleNVX' );
     P( vkDestroyCuFunctionNVX                                              , 'vkDestroyCuFunctionNVX' );
     P( vkCmdCuLaunchKernelNVX                                              , 'vkCmdCuLaunchKernelNVX' );
     P( vkGetImageViewHandleNVX                                             , 'vkGetImageViewHandleNVX' );
     P( vkGetImageViewHandle64NVX                                           , 'vkGetImageViewHandle64NVX' );
     P( vkGetImageViewAddressNVX                                            , 'vkGetImageViewAddressNVX' );
     P( vkGetDeviceCombinedImageSamplerIndexNVX                             , 'vkGetDeviceCombinedImageSamplerIndexNVX' );
     P( vkCmdDrawIndirectCountAMD                                           , 'vkCmdDrawIndirectCountAMD' );
     P( vkCmdDrawIndexedIndirectCountAMD                                    , 'vkCmdDrawIndexedIndirectCountAMD' );
     P( vkGetShaderInfoAMD                                                  , 'vkGetShaderInfoAMD' );
     P( vkCmdBeginConditionalRenderingEXT                                   , 'vkCmdBeginConditionalRenderingEXT' );
     P( vkCmdEndConditionalRenderingEXT                                     , 'vkCmdEndConditionalRenderingEXT' );
     P( vkCmdSetViewportWScalingNV                                          , 'vkCmdSetViewportWScalingNV' );
     P( vkDisplayPowerControlEXT                                            , 'vkDisplayPowerControlEXT' );
     P( vkRegisterDeviceEventEXT                                            , 'vkRegisterDeviceEventEXT' );
     P( vkRegisterDisplayEventEXT                                           , 'vkRegisterDisplayEventEXT' );
     P( vkGetSwapchainCounterEXT                                            , 'vkGetSwapchainCounterEXT' );
     P( vkGetRefreshCycleDurationGOOGLE                                     , 'vkGetRefreshCycleDurationGOOGLE' );
     P( vkGetPastPresentationTimingGOOGLE                                   , 'vkGetPastPresentationTimingGOOGLE' );
     P( vkCmdSetDiscardRectangleEXT                                         , 'vkCmdSetDiscardRectangleEXT' );
     P( vkCmdSetDiscardRectangleEnableEXT                                   , 'vkCmdSetDiscardRectangleEnableEXT' );
     P( vkCmdSetDiscardRectangleModeEXT                                     , 'vkCmdSetDiscardRectangleModeEXT' );
     P( vkSetHdrMetadataEXT                                                 , 'vkSetHdrMetadataEXT' );
     P( vkSetDebugUtilsObjectNameEXT                                        , 'vkSetDebugUtilsObjectNameEXT' );
     P( vkSetDebugUtilsObjectTagEXT                                         , 'vkSetDebugUtilsObjectTagEXT' );
     P( vkQueueBeginDebugUtilsLabelEXT                                      , 'vkQueueBeginDebugUtilsLabelEXT' );
     P( vkQueueEndDebugUtilsLabelEXT                                        , 'vkQueueEndDebugUtilsLabelEXT' );
     P( vkQueueInsertDebugUtilsLabelEXT                                     , 'vkQueueInsertDebugUtilsLabelEXT' );
     P( vkCmdBeginDebugUtilsLabelEXT                                        , 'vkCmdBeginDebugUtilsLabelEXT' );
     P( vkCmdEndDebugUtilsLabelEXT                                          , 'vkCmdEndDebugUtilsLabelEXT' );
     P( vkCmdInsertDebugUtilsLabelEXT                                       , 'vkCmdInsertDebugUtilsLabelEXT' );
     P( vkCreateGpaSessionAMD                                               , 'vkCreateGpaSessionAMD' );
     P( vkDestroyGpaSessionAMD                                              , 'vkDestroyGpaSessionAMD' );
     P( vkSetGpaDeviceClockModeAMD                                          , 'vkSetGpaDeviceClockModeAMD' );
     P( vkGetGpaDeviceClockInfoAMD                                          , 'vkGetGpaDeviceClockInfoAMD' );
     P( vkCmdBeginGpaSessionAMD                                             , 'vkCmdBeginGpaSessionAMD' );
     P( vkCmdEndGpaSessionAMD                                               , 'vkCmdEndGpaSessionAMD' );
     P( vkCmdBeginGpaSampleAMD                                              , 'vkCmdBeginGpaSampleAMD' );
     P( vkCmdEndGpaSampleAMD                                                , 'vkCmdEndGpaSampleAMD' );
     P( vkGetGpaSessionStatusAMD                                            , 'vkGetGpaSessionStatusAMD' );
     P( vkGetGpaSessionResultsAMD                                           , 'vkGetGpaSessionResultsAMD' );
     P( vkResetGpaSessionAMD                                                , 'vkResetGpaSessionAMD' );
     P( vkCmdCopyGpaSessionResultsAMD                                       , 'vkCmdCopyGpaSessionResultsAMD' );
     P( vkWriteSamplerDescriptorsEXT                                        , 'vkWriteSamplerDescriptorsEXT' );
     P( vkWriteResourceDescriptorsEXT                                       , 'vkWriteResourceDescriptorsEXT' );
     P( vkCmdBindSamplerHeapEXT                                             , 'vkCmdBindSamplerHeapEXT' );
     P( vkCmdBindResourceHeapEXT                                            , 'vkCmdBindResourceHeapEXT' );
     P( vkCmdPushDataEXT                                                    , 'vkCmdPushDataEXT' );
     P( vkGetImageOpaqueCaptureDataEXT                                      , 'vkGetImageOpaqueCaptureDataEXT' );
     P( vkRegisterCustomBorderColorEXT                                      , 'vkRegisterCustomBorderColorEXT' );
     P( vkUnregisterCustomBorderColorEXT                                    , 'vkUnregisterCustomBorderColorEXT' );
     P( vkGetTensorOpaqueCaptureDataARM                                     , 'vkGetTensorOpaqueCaptureDataARM' );
     P( vkCmdSetSampleLocationsEXT                                          , 'vkCmdSetSampleLocationsEXT' );
     P( vkGetImageDrmFormatModifierPropertiesEXT                            , 'vkGetImageDrmFormatModifierPropertiesEXT' );
     P( vkCreateValidationCacheEXT                                          , 'vkCreateValidationCacheEXT' );
     P( vkDestroyValidationCacheEXT                                         , 'vkDestroyValidationCacheEXT' );
     P( vkMergeValidationCachesEXT                                          , 'vkMergeValidationCachesEXT' );
     P( vkGetValidationCacheDataEXT                                         , 'vkGetValidationCacheDataEXT' );
     P( vkCmdBindShadingRateImageNV                                         , 'vkCmdBindShadingRateImageNV' );
     P( vkCmdSetViewportShadingRatePaletteNV                                , 'vkCmdSetViewportShadingRatePaletteNV' );
     P( vkCmdSetCoarseSampleOrderNV                                         , 'vkCmdSetCoarseSampleOrderNV' );
     P( vkCreateAccelerationStructureNV                                     , 'vkCreateAccelerationStructureNV' );
     P( vkDestroyAccelerationStructureNV                                    , 'vkDestroyAccelerationStructureNV' );
     P( vkGetAccelerationStructureMemoryRequirementsNV                      , 'vkGetAccelerationStructureMemoryRequirementsNV' );
     P( vkBindAccelerationStructureMemoryNV                                 , 'vkBindAccelerationStructureMemoryNV' );
     P( vkCmdBuildAccelerationStructureNV                                   , 'vkCmdBuildAccelerationStructureNV' );
     P( vkCmdCopyAccelerationStructureNV                                    , 'vkCmdCopyAccelerationStructureNV' );
     P( vkCmdTraceRaysNV                                                    , 'vkCmdTraceRaysNV' );
     P( vkCreateRayTracingPipelinesNV                                       , 'vkCreateRayTracingPipelinesNV' );
     P( vkGetRayTracingShaderGroupHandlesKHR                                , 'vkGetRayTracingShaderGroupHandlesKHR' );
     P( vkGetRayTracingShaderGroupHandlesNV                                 , 'vkGetRayTracingShaderGroupHandlesNV' );
     P( vkGetAccelerationStructureHandleNV                                  , 'vkGetAccelerationStructureHandleNV' );
     P( vkCmdWriteAccelerationStructuresPropertiesNV                        , 'vkCmdWriteAccelerationStructuresPropertiesNV' );
     P( vkCompileDeferredNV                                                 , 'vkCompileDeferredNV' );
     P( vkGetMemoryHostPointerPropertiesEXT                                 , 'vkGetMemoryHostPointerPropertiesEXT' );
     P( vkCmdWriteBufferMarkerAMD                                           , 'vkCmdWriteBufferMarkerAMD' );
     P( vkCmdWriteBufferMarker2AMD                                          , 'vkCmdWriteBufferMarker2AMD' );
     P( vkGetCalibratedTimestampsEXT                                        , 'vkGetCalibratedTimestampsEXT' );
     P( vkCmdDrawMeshTasksNV                                                , 'vkCmdDrawMeshTasksNV' );
     P( vkCmdDrawMeshTasksIndirectNV                                        , 'vkCmdDrawMeshTasksIndirectNV' );
     P( vkCmdDrawMeshTasksIndirectCountNV                                   , 'vkCmdDrawMeshTasksIndirectCountNV' );
     P( vkCmdSetExclusiveScissorEnableNV                                    , 'vkCmdSetExclusiveScissorEnableNV' );
     P( vkCmdSetExclusiveScissorNV                                          , 'vkCmdSetExclusiveScissorNV' );
     P( vkCmdSetCheckpointNV                                                , 'vkCmdSetCheckpointNV' );
     P( vkGetQueueCheckpointDataNV                                          , 'vkGetQueueCheckpointDataNV' );
     P( vkGetQueueCheckpointData2NV                                         , 'vkGetQueueCheckpointData2NV' );
     P( vkSetSwapchainPresentTimingQueueSizeEXT                             , 'vkSetSwapchainPresentTimingQueueSizeEXT' );
     P( vkGetSwapchainTimingPropertiesEXT                                   , 'vkGetSwapchainTimingPropertiesEXT' );
     P( vkGetSwapchainTimeDomainPropertiesEXT                               , 'vkGetSwapchainTimeDomainPropertiesEXT' );
     P( vkGetPastPresentationTimingEXT                                      , 'vkGetPastPresentationTimingEXT' );
     P( vkInitializePerformanceApiINTEL                                     , 'vkInitializePerformanceApiINTEL' );
     P( vkUninitializePerformanceApiINTEL                                   , 'vkUninitializePerformanceApiINTEL' );
     P( vkCmdSetPerformanceMarkerINTEL                                      , 'vkCmdSetPerformanceMarkerINTEL' );
     P( vkCmdSetPerformanceStreamMarkerINTEL                                , 'vkCmdSetPerformanceStreamMarkerINTEL' );
     P( vkCmdSetPerformanceOverrideINTEL                                    , 'vkCmdSetPerformanceOverrideINTEL' );
     P( vkAcquirePerformanceConfigurationINTEL                              , 'vkAcquirePerformanceConfigurationINTEL' );
     P( vkReleasePerformanceConfigurationINTEL                              , 'vkReleasePerformanceConfigurationINTEL' );
     P( vkQueueSetPerformanceConfigurationINTEL                             , 'vkQueueSetPerformanceConfigurationINTEL' );
     P( vkGetPerformanceParameterINTEL                                      , 'vkGetPerformanceParameterINTEL' );
     P( vkSetLocalDimmingAMD                                                , 'vkSetLocalDimmingAMD' );
     P( vkGetBufferDeviceAddressEXT                                         , 'vkGetBufferDeviceAddressEXT' );
     P( vkCmdSetLineStippleEXT                                              , 'vkCmdSetLineStippleEXT' );
     P( vkResetQueryPoolEXT                                                 , 'vkResetQueryPoolEXT' );
     P( vkCmdSetCullModeEXT                                                 , 'vkCmdSetCullModeEXT' );
     P( vkCmdSetFrontFaceEXT                                                , 'vkCmdSetFrontFaceEXT' );
     P( vkCmdSetPrimitiveTopologyEXT                                        , 'vkCmdSetPrimitiveTopologyEXT' );
     P( vkCmdSetViewportWithCountEXT                                        , 'vkCmdSetViewportWithCountEXT' );
     P( vkCmdSetScissorWithCountEXT                                         , 'vkCmdSetScissorWithCountEXT' );
     P( vkCmdBindVertexBuffers2EXT                                          , 'vkCmdBindVertexBuffers2EXT' );
     P( vkCmdSetDepthTestEnableEXT                                          , 'vkCmdSetDepthTestEnableEXT' );
     P( vkCmdSetDepthWriteEnableEXT                                         , 'vkCmdSetDepthWriteEnableEXT' );
     P( vkCmdSetDepthCompareOpEXT                                           , 'vkCmdSetDepthCompareOpEXT' );
     P( vkCmdSetDepthBoundsTestEnableEXT                                    , 'vkCmdSetDepthBoundsTestEnableEXT' );
     P( vkCmdSetStencilTestEnableEXT                                        , 'vkCmdSetStencilTestEnableEXT' );
     P( vkCmdSetStencilOpEXT                                                , 'vkCmdSetStencilOpEXT' );
     P( vkCopyMemoryToImageEXT                                              , 'vkCopyMemoryToImageEXT' );
     P( vkCopyImageToMemoryEXT                                              , 'vkCopyImageToMemoryEXT' );
     P( vkCopyImageToImageEXT                                               , 'vkCopyImageToImageEXT' );
     P( vkTransitionImageLayoutEXT                                          , 'vkTransitionImageLayoutEXT' );
     P( vkGetImageSubresourceLayout2EXT                                     , 'vkGetImageSubresourceLayout2EXT' );
     P( vkReleaseSwapchainImagesEXT                                         , 'vkReleaseSwapchainImagesEXT' );
     P( vkGetGeneratedCommandsMemoryRequirementsNV                          , 'vkGetGeneratedCommandsMemoryRequirementsNV' );
     P( vkCmdPreprocessGeneratedCommandsNV                                  , 'vkCmdPreprocessGeneratedCommandsNV' );
     P( vkCmdExecuteGeneratedCommandsNV                                     , 'vkCmdExecuteGeneratedCommandsNV' );
     P( vkCmdBindPipelineShaderGroupNV                                      , 'vkCmdBindPipelineShaderGroupNV' );
     P( vkCreateIndirectCommandsLayoutNV                                    , 'vkCreateIndirectCommandsLayoutNV' );
     P( vkDestroyIndirectCommandsLayoutNV                                   , 'vkDestroyIndirectCommandsLayoutNV' );
     P( vkCmdSetDepthBias2EXT                                               , 'vkCmdSetDepthBias2EXT' );
     P( vkCreatePrivateDataSlotEXT                                          , 'vkCreatePrivateDataSlotEXT' );
     P( vkDestroyPrivateDataSlotEXT                                         , 'vkDestroyPrivateDataSlotEXT' );
     P( vkSetPrivateDataEXT                                                 , 'vkSetPrivateDataEXT' );
     P( vkGetPrivateDataEXT                                                 , 'vkGetPrivateDataEXT' );
     P( vkQueueSetPerfHintQCOM                                              , 'vkQueueSetPerfHintQCOM' );
     P( vkCmdDispatchTileQCOM                                               , 'vkCmdDispatchTileQCOM' );
     P( vkCmdBeginPerTileExecutionQCOM                                      , 'vkCmdBeginPerTileExecutionQCOM' );
     P( vkCmdEndPerTileExecutionQCOM                                        , 'vkCmdEndPerTileExecutionQCOM' );
     P( vkSetLatencySleepModeLegacyNV                                       , 'vkSetLatencySleepModeLegacyNV' );
     P( vkLatencySleepLegacyNV                                              , 'vkLatencySleepLegacyNV' );
     P( vkSetLatencyMarkerLegacyNV                                          , 'vkSetLatencyMarkerLegacyNV' );
     P( vkGetLatencyTimingsLegacyNV                                         , 'vkGetLatencyTimingsLegacyNV' );
     P( vkQueueNotifyOutOfBandLegacyNV                                      , 'vkQueueNotifyOutOfBandLegacyNV' );
     P( vkGetSleepStatusLegacyNV                                            , 'vkGetSleepStatusLegacyNV' );
     P( vkShutdownLatencyDeviceLegacyNV                                     , 'vkShutdownLatencyDeviceLegacyNV' );
     P( vkGetDescriptorSetLayoutSizeEXT                                     , 'vkGetDescriptorSetLayoutSizeEXT' );
     P( vkGetDescriptorSetLayoutBindingOffsetEXT                            , 'vkGetDescriptorSetLayoutBindingOffsetEXT' );
     P( vkGetDescriptorEXT                                                  , 'vkGetDescriptorEXT' );
     P( vkCmdBindDescriptorBuffersEXT                                       , 'vkCmdBindDescriptorBuffersEXT' );
     P( vkCmdSetDescriptorBufferOffsetsEXT                                  , 'vkCmdSetDescriptorBufferOffsetsEXT' );
     P( vkCmdBindDescriptorBufferEmbeddedSamplersEXT                        , 'vkCmdBindDescriptorBufferEmbeddedSamplersEXT' );
     P( vkGetBufferOpaqueCaptureDescriptorDataEXT                           , 'vkGetBufferOpaqueCaptureDescriptorDataEXT' );
     P( vkGetImageOpaqueCaptureDescriptorDataEXT                            , 'vkGetImageOpaqueCaptureDescriptorDataEXT' );
     P( vkGetImageViewOpaqueCaptureDescriptorDataEXT                        , 'vkGetImageViewOpaqueCaptureDescriptorDataEXT' );
     P( vkGetSamplerOpaqueCaptureDescriptorDataEXT                          , 'vkGetSamplerOpaqueCaptureDescriptorDataEXT' );
     P( vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT            , 'vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT' );
     P( vkCmdSetFragmentShadingRateEnumNV                                   , 'vkCmdSetFragmentShadingRateEnumNV' );
     P( vkGetDeviceFaultInfoEXT                                             , 'vkGetDeviceFaultInfoEXT' );
     P( vkCmdSetVertexInputEXT                                              , 'vkCmdSetVertexInputEXT' );
     P( vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI                     , 'vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI' );
     P( vkCmdSubpassShadingHUAWEI                                           , 'vkCmdSubpassShadingHUAWEI' );
     P( vkCmdBindInvocationMaskHUAWEI                                       , 'vkCmdBindInvocationMaskHUAWEI' );
     P( vkGetMemoryRemoteAddressNV                                          , 'vkGetMemoryRemoteAddressNV' );
     P( vkGetPipelinePropertiesEXT                                          , 'vkGetPipelinePropertiesEXT' );
     P( vkCmdSetPatchControlPointsEXT                                       , 'vkCmdSetPatchControlPointsEXT' );
     P( vkCmdSetRasterizerDiscardEnableEXT                                  , 'vkCmdSetRasterizerDiscardEnableEXT' );
     P( vkCmdSetDepthBiasEnableEXT                                          , 'vkCmdSetDepthBiasEnableEXT' );
     P( vkCmdSetLogicOpEXT                                                  , 'vkCmdSetLogicOpEXT' );
     P( vkCmdSetPrimitiveRestartEnableEXT                                   , 'vkCmdSetPrimitiveRestartEnableEXT' );
     P( vkCmdSetColorWriteEnableEXT                                         , 'vkCmdSetColorWriteEnableEXT' );
     P( vkCmdDrawMultiEXT                                                   , 'vkCmdDrawMultiEXT' );
     P( vkCmdDrawMultiIndexedEXT                                            , 'vkCmdDrawMultiIndexedEXT' );
     P( vkCreateMicromapEXT                                                 , 'vkCreateMicromapEXT' );
     P( vkDestroyMicromapEXT                                                , 'vkDestroyMicromapEXT' );
     P( vkCmdBuildMicromapsEXT                                              , 'vkCmdBuildMicromapsEXT' );
     P( vkBuildMicromapsEXT                                                 , 'vkBuildMicromapsEXT' );
     P( vkCopyMicromapEXT                                                   , 'vkCopyMicromapEXT' );
     P( vkCopyMicromapToMemoryEXT                                           , 'vkCopyMicromapToMemoryEXT' );
     P( vkCopyMemoryToMicromapEXT                                           , 'vkCopyMemoryToMicromapEXT' );
     P( vkWriteMicromapsPropertiesEXT                                       , 'vkWriteMicromapsPropertiesEXT' );
     P( vkCmdCopyMicromapEXT                                                , 'vkCmdCopyMicromapEXT' );
     P( vkCmdCopyMicromapToMemoryEXT                                        , 'vkCmdCopyMicromapToMemoryEXT' );
     P( vkCmdCopyMemoryToMicromapEXT                                        , 'vkCmdCopyMemoryToMicromapEXT' );
     P( vkCmdWriteMicromapsPropertiesEXT                                    , 'vkCmdWriteMicromapsPropertiesEXT' );
     P( vkGetDeviceMicromapCompatibilityEXT                                 , 'vkGetDeviceMicromapCompatibilityEXT' );
     P( vkGetMicromapBuildSizesEXT                                          , 'vkGetMicromapBuildSizesEXT' );
     P( vkCmdDrawClusterHUAWEI                                              , 'vkCmdDrawClusterHUAWEI' );
     P( vkCmdDrawClusterIndirectHUAWEI                                      , 'vkCmdDrawClusterIndirectHUAWEI' );
     P( vkSetDeviceMemoryPriorityEXT                                        , 'vkSetDeviceMemoryPriorityEXT' );
     P( vkCmdSetDispatchParametersARM                                       , 'vkCmdSetDispatchParametersARM' );
     P( vkGetDescriptorSetLayoutHostMappingInfoVALVE                        , 'vkGetDescriptorSetLayoutHostMappingInfoVALVE' );
     P( vkGetDescriptorSetHostMappingVALVE                                  , 'vkGetDescriptorSetHostMappingVALVE' );
     P( vkCmdCopyMemoryIndirectNV                                           , 'vkCmdCopyMemoryIndirectNV' );
     P( vkCmdCopyMemoryToImageIndirectNV                                    , 'vkCmdCopyMemoryToImageIndirectNV' );
     P( vkCmdDecompressMemoryNV                                             , 'vkCmdDecompressMemoryNV' );
     P( vkCmdDecompressMemoryIndirectCountNV                                , 'vkCmdDecompressMemoryIndirectCountNV' );
     P( vkGetPipelineIndirectMemoryRequirementsNV                           , 'vkGetPipelineIndirectMemoryRequirementsNV' );
     P( vkCmdUpdatePipelineIndirectBufferNV                                 , 'vkCmdUpdatePipelineIndirectBufferNV' );
     P( vkGetPipelineIndirectDeviceAddressNV                                , 'vkGetPipelineIndirectDeviceAddressNV' );
     P( vkCmdSetDepthClampEnableEXT                                         , 'vkCmdSetDepthClampEnableEXT' );
     P( vkCmdSetPolygonModeEXT                                              , 'vkCmdSetPolygonModeEXT' );
     P( vkCmdSetRasterizationSamplesEXT                                     , 'vkCmdSetRasterizationSamplesEXT' );
     P( vkCmdSetSampleMaskEXT                                               , 'vkCmdSetSampleMaskEXT' );
     P( vkCmdSetAlphaToCoverageEnableEXT                                    , 'vkCmdSetAlphaToCoverageEnableEXT' );
     P( vkCmdSetAlphaToOneEnableEXT                                         , 'vkCmdSetAlphaToOneEnableEXT' );
     P( vkCmdSetLogicOpEnableEXT                                            , 'vkCmdSetLogicOpEnableEXT' );
     P( vkCmdSetColorBlendEnableEXT                                         , 'vkCmdSetColorBlendEnableEXT' );
     P( vkCmdSetColorBlendEquationEXT                                       , 'vkCmdSetColorBlendEquationEXT' );
     P( vkCmdSetColorWriteMaskEXT                                           , 'vkCmdSetColorWriteMaskEXT' );
     P( vkCmdSetTessellationDomainOriginEXT                                 , 'vkCmdSetTessellationDomainOriginEXT' );
     P( vkCmdSetRasterizationStreamEXT                                      , 'vkCmdSetRasterizationStreamEXT' );
     P( vkCmdSetConservativeRasterizationModeEXT                            , 'vkCmdSetConservativeRasterizationModeEXT' );
     P( vkCmdSetExtraPrimitiveOverestimationSizeEXT                         , 'vkCmdSetExtraPrimitiveOverestimationSizeEXT' );
     P( vkCmdSetDepthClipEnableEXT                                          , 'vkCmdSetDepthClipEnableEXT' );
     P( vkCmdSetSampleLocationsEnableEXT                                    , 'vkCmdSetSampleLocationsEnableEXT' );
     P( vkCmdSetColorBlendAdvancedEXT                                       , 'vkCmdSetColorBlendAdvancedEXT' );
     P( vkCmdSetProvokingVertexModeEXT                                      , 'vkCmdSetProvokingVertexModeEXT' );
     P( vkCmdSetLineRasterizationModeEXT                                    , 'vkCmdSetLineRasterizationModeEXT' );
     P( vkCmdSetLineStippleEnableEXT                                        , 'vkCmdSetLineStippleEnableEXT' );
     P( vkCmdSetDepthClipNegativeOneToOneEXT                                , 'vkCmdSetDepthClipNegativeOneToOneEXT' );
     P( vkCmdSetViewportWScalingEnableNV                                    , 'vkCmdSetViewportWScalingEnableNV' );
     P( vkCmdSetViewportSwizzleNV                                           , 'vkCmdSetViewportSwizzleNV' );
     P( vkCmdSetCoverageToColorEnableNV                                     , 'vkCmdSetCoverageToColorEnableNV' );
     P( vkCmdSetCoverageToColorLocationNV                                   , 'vkCmdSetCoverageToColorLocationNV' );
     P( vkCmdSetCoverageModulationModeNV                                    , 'vkCmdSetCoverageModulationModeNV' );
     P( vkCmdSetCoverageModulationTableEnableNV                             , 'vkCmdSetCoverageModulationTableEnableNV' );
     P( vkCmdSetCoverageModulationTableNV                                   , 'vkCmdSetCoverageModulationTableNV' );
     P( vkCmdSetShadingRateImageEnableNV                                    , 'vkCmdSetShadingRateImageEnableNV' );
     P( vkCmdSetRepresentativeFragmentTestEnableNV                          , 'vkCmdSetRepresentativeFragmentTestEnableNV' );
     P( vkCmdSetCoverageReductionModeNV                                     , 'vkCmdSetCoverageReductionModeNV' );
     P( vkCreateTensorARM                                                   , 'vkCreateTensorARM' );
     P( vkDestroyTensorARM                                                  , 'vkDestroyTensorARM' );
     P( vkCreateTensorViewARM                                               , 'vkCreateTensorViewARM' );
     P( vkDestroyTensorViewARM                                              , 'vkDestroyTensorViewARM' );
     P( vkGetTensorMemoryRequirementsARM                                    , 'vkGetTensorMemoryRequirementsARM' );
     P( vkBindTensorMemoryARM                                               , 'vkBindTensorMemoryARM' );
     P( vkGetDeviceTensorMemoryRequirementsARM                              , 'vkGetDeviceTensorMemoryRequirementsARM' );
     P( vkCmdCopyTensorARM                                                  , 'vkCmdCopyTensorARM' );
     P( vkGetTensorOpaqueCaptureDescriptorDataARM                           , 'vkGetTensorOpaqueCaptureDescriptorDataARM' );
     P( vkGetTensorViewOpaqueCaptureDescriptorDataARM                       , 'vkGetTensorViewOpaqueCaptureDescriptorDataARM' );
     P( vkGetShaderModuleIdentifierEXT                                      , 'vkGetShaderModuleIdentifierEXT' );
     P( vkGetShaderModuleCreateInfoIdentifierEXT                            , 'vkGetShaderModuleCreateInfoIdentifierEXT' );
     P( vkCreateOpticalFlowSessionNV                                        , 'vkCreateOpticalFlowSessionNV' );
     P( vkDestroyOpticalFlowSessionNV                                       , 'vkDestroyOpticalFlowSessionNV' );
     P( vkBindOpticalFlowSessionImageNV                                     , 'vkBindOpticalFlowSessionImageNV' );
     P( vkCmdOpticalFlowExecuteNV                                           , 'vkCmdOpticalFlowExecuteNV' );
     P( vkAntiLagUpdateAMD                                                  , 'vkAntiLagUpdateAMD' );
     P( vkCreateShadersEXT                                                  , 'vkCreateShadersEXT' );
     P( vkDestroyShaderEXT                                                  , 'vkDestroyShaderEXT' );
     P( vkGetShaderBinaryDataEXT                                            , 'vkGetShaderBinaryDataEXT' );
     P( vkCmdBindShadersEXT                                                 , 'vkCmdBindShadersEXT' );
     P( vkCmdSetDepthClampRangeEXT                                          , 'vkCmdSetDepthClampRangeEXT' );
     P( vkGetFramebufferTilePropertiesQCOM                                  , 'vkGetFramebufferTilePropertiesQCOM' );
     P( vkGetDynamicRenderingTilePropertiesQCOM                             , 'vkGetDynamicRenderingTilePropertiesQCOM' );
     P( vkConvertCooperativeVectorMatrixNV                                  , 'vkConvertCooperativeVectorMatrixNV' );
     P( vkCmdConvertCooperativeVectorMatrixNV                               , 'vkCmdConvertCooperativeVectorMatrixNV' );
     P( vkSetLatencySleepModeNV                                             , 'vkSetLatencySleepModeNV' );
     P( vkLatencySleepNV                                                    , 'vkLatencySleepNV' );
     P( vkSetLatencyMarkerNV                                                , 'vkSetLatencyMarkerNV' );
     P( vkGetLatencyTimingsNV                                               , 'vkGetLatencyTimingsNV' );
     P( vkQueueNotifyOutOfBandNV                                            , 'vkQueueNotifyOutOfBandNV' );
     P( vkCreateDataGraphPipelinesARM                                       , 'vkCreateDataGraphPipelinesARM' );
     P( vkCreateDataGraphPipelineSessionARM                                 , 'vkCreateDataGraphPipelineSessionARM' );
     P( vkGetDataGraphPipelineSessionBindPointRequirementsARM               , 'vkGetDataGraphPipelineSessionBindPointRequirementsARM' );
     P( vkGetDataGraphPipelineSessionMemoryRequirementsARM                  , 'vkGetDataGraphPipelineSessionMemoryRequirementsARM' );
     P( vkBindDataGraphPipelineSessionMemoryARM                             , 'vkBindDataGraphPipelineSessionMemoryARM' );
     P( vkDestroyDataGraphPipelineSessionARM                                , 'vkDestroyDataGraphPipelineSessionARM' );
     P( vkCmdDispatchDataGraphARM                                           , 'vkCmdDispatchDataGraphARM' );
     P( vkGetDataGraphPipelineAvailablePropertiesARM                        , 'vkGetDataGraphPipelineAvailablePropertiesARM' );
     P( vkGetDataGraphPipelinePropertiesARM                                 , 'vkGetDataGraphPipelinePropertiesARM' );
     P( vkCmdSetAttachmentFeedbackLoopEnableEXT                             , 'vkCmdSetAttachmentFeedbackLoopEnableEXT' );
     P( vkCmdBindTileMemoryQCOM                                             , 'vkCmdBindTileMemoryQCOM' );
     P( vkCmdDecompressMemoryEXT                                            , 'vkCmdDecompressMemoryEXT' );
     P( vkCmdDecompressMemoryIndirectCountEXT                               , 'vkCmdDecompressMemoryIndirectCountEXT' );
     P( vkCreateExternalComputeQueueNV                                      , 'vkCreateExternalComputeQueueNV' );
     P( vkDestroyExternalComputeQueueNV                                     , 'vkDestroyExternalComputeQueueNV' );
     P( vkGetClusterAccelerationStructureBuildSizesNV                       , 'vkGetClusterAccelerationStructureBuildSizesNV' );
     P( vkCmdBuildClusterAccelerationStructureIndirectNV                    , 'vkCmdBuildClusterAccelerationStructureIndirectNV' );
     P( vkGetPartitionedAccelerationStructuresBuildSizesNV                  , 'vkGetPartitionedAccelerationStructuresBuildSizesNV' );
     P( vkCmdBuildPartitionedAccelerationStructuresNV                       , 'vkCmdBuildPartitionedAccelerationStructuresNV' );
     P( vkGetGeneratedCommandsMemoryRequirementsEXT                         , 'vkGetGeneratedCommandsMemoryRequirementsEXT' );
     P( vkCmdPreprocessGeneratedCommandsEXT                                 , 'vkCmdPreprocessGeneratedCommandsEXT' );
     P( vkCmdExecuteGeneratedCommandsEXT                                    , 'vkCmdExecuteGeneratedCommandsEXT' );
     P( vkCreateIndirectCommandsLayoutEXT                                   , 'vkCreateIndirectCommandsLayoutEXT' );
     P( vkDestroyIndirectCommandsLayoutEXT                                  , 'vkDestroyIndirectCommandsLayoutEXT' );
     P( vkCreateIndirectExecutionSetEXT                                     , 'vkCreateIndirectExecutionSetEXT' );
     P( vkDestroyIndirectExecutionSetEXT                                    , 'vkDestroyIndirectExecutionSetEXT' );
     P( vkUpdateIndirectExecutionSetPipelineEXT                             , 'vkUpdateIndirectExecutionSetPipelineEXT' );
     P( vkUpdateIndirectExecutionSetShaderEXT                               , 'vkUpdateIndirectExecutionSetShaderEXT' );
     P( vkCreateShaderInstrumentationARM                                    , 'vkCreateShaderInstrumentationARM' );
     P( vkDestroyShaderInstrumentationARM                                   , 'vkDestroyShaderInstrumentationARM' );
     P( vkCmdBeginShaderInstrumentationARM                                  , 'vkCmdBeginShaderInstrumentationARM' );
     P( vkCmdEndShaderInstrumentationARM                                    , 'vkCmdEndShaderInstrumentationARM' );
     P( vkGetShaderInstrumentationValuesARM                                 , 'vkGetShaderInstrumentationValuesARM' );
     P( vkClearShaderInstrumentationMetricsARM                              , 'vkClearShaderInstrumentationMetricsARM' );
     P( vkCmdEndRendering2EXT                                               , 'vkCmdEndRendering2EXT' );
     P( vkCmdBeginCustomResolveEXT                                          , 'vkCmdBeginCustomResolveEXT' );
     P( vkCmdSetComputeOccupancyPriorityNV                                  , 'vkCmdSetComputeOccupancyPriorityNV' );
     P( vkCmdSetPrimitiveRestartIndexEXT                                    , 'vkCmdSetPrimitiveRestartIndexEXT' );
     P( vkCreateAccelerationStructureKHR                                    , 'vkCreateAccelerationStructureKHR' );
     P( vkDestroyAccelerationStructureKHR                                   , 'vkDestroyAccelerationStructureKHR' );
     P( vkCmdBuildAccelerationStructuresKHR                                 , 'vkCmdBuildAccelerationStructuresKHR' );
     P( vkCmdBuildAccelerationStructuresIndirectKHR                         , 'vkCmdBuildAccelerationStructuresIndirectKHR' );
     P( vkBuildAccelerationStructuresKHR                                    , 'vkBuildAccelerationStructuresKHR' );
     P( vkCopyAccelerationStructureKHR                                      , 'vkCopyAccelerationStructureKHR' );
     P( vkCopyAccelerationStructureToMemoryKHR                              , 'vkCopyAccelerationStructureToMemoryKHR' );
     P( vkCopyMemoryToAccelerationStructureKHR                              , 'vkCopyMemoryToAccelerationStructureKHR' );
     P( vkWriteAccelerationStructuresPropertiesKHR                          , 'vkWriteAccelerationStructuresPropertiesKHR' );
     P( vkCmdCopyAccelerationStructureKHR                                   , 'vkCmdCopyAccelerationStructureKHR' );
     P( vkCmdCopyAccelerationStructureToMemoryKHR                           , 'vkCmdCopyAccelerationStructureToMemoryKHR' );
     P( vkCmdCopyMemoryToAccelerationStructureKHR                           , 'vkCmdCopyMemoryToAccelerationStructureKHR' );
     P( vkGetAccelerationStructureDeviceAddressKHR                          , 'vkGetAccelerationStructureDeviceAddressKHR' );
     P( vkCmdWriteAccelerationStructuresPropertiesKHR                       , 'vkCmdWriteAccelerationStructuresPropertiesKHR' );
     P( vkGetDeviceAccelerationStructureCompatibilityKHR                    , 'vkGetDeviceAccelerationStructureCompatibilityKHR' );
     P( vkGetAccelerationStructureBuildSizesKHR                             , 'vkGetAccelerationStructureBuildSizesKHR' );
     P( vkCmdTraceRaysKHR                                                   , 'vkCmdTraceRaysKHR' );
     P( vkCreateRayTracingPipelinesKHR                                      , 'vkCreateRayTracingPipelinesKHR' );
     P( vkGetRayTracingCaptureReplayShaderGroupHandlesKHR                   , 'vkGetRayTracingCaptureReplayShaderGroupHandlesKHR' );
     P( vkCmdTraceRaysIndirectKHR                                           , 'vkCmdTraceRaysIndirectKHR' );
     P( vkGetRayTracingShaderGroupStackSizeKHR                              , 'vkGetRayTracingShaderGroupStackSizeKHR' );
     P( vkCmdSetRayTracingPipelineStackSizeKHR                              , 'vkCmdSetRayTracingPipelineStackSizeKHR' );
     P( vkCmdDrawMeshTasksEXT                                               , 'vkCmdDrawMeshTasksEXT' );
     P( vkCmdDrawMeshTasksIndirectEXT                                       , 'vkCmdDrawMeshTasksIndirectEXT' );
     P( vkCmdDrawMeshTasksIndirectCountEXT                                  , 'vkCmdDrawMeshTasksIndirectCountEXT' );

     {$IFDEF MSWINDOWS}
     P( vkGetMemoryWin32HandleKHR                                           , 'vkGetMemoryWin32HandleKHR' );
     P( vkGetMemoryWin32HandlePropertiesKHR                                 , 'vkGetMemoryWin32HandlePropertiesKHR' );
     P( vkImportSemaphoreWin32HandleKHR                                     , 'vkImportSemaphoreWin32HandleKHR' );
     P( vkGetSemaphoreWin32HandleKHR                                        , 'vkGetSemaphoreWin32HandleKHR' );
     P( vkImportFenceWin32HandleKHR                                         , 'vkImportFenceWin32HandleKHR' );
     P( vkGetFenceWin32HandleKHR                                            , 'vkGetFenceWin32HandleKHR' );
     P( vkGetMemoryWin32HandleNV                                            , 'vkGetMemoryWin32HandleNV' );
     P( vkAcquireFullScreenExclusiveModeEXT                                 , 'vkAcquireFullScreenExclusiveModeEXT' );
     P( vkReleaseFullScreenExclusiveModeEXT                                 , 'vkReleaseFullScreenExclusiveModeEXT' );
     P( vkGetDeviceGroupSurfacePresentModes2EXT                             , 'vkGetDeviceGroupSurfacePresentModes2EXT' );
     {$ENDIF}
end;

end. //######################################################################### ■
