unit vulkan_video_codecs_common;

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

uses LUX.Code.C;

function VK_MAKE_VIDEO_STD_VERSION( const major_,minor_,patch_:T_uint32_t ) :T_uint32_t; inline;

//#ifndef VULKAN_VIDEO_CODECS_COMMON_H_
const VULKAN_VIDEO_CODECS_COMMON_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codecs_common is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codecs_common 1   ← ユニット名と同名のため定数にはできない
//#if !defined(VK_NO_STDINT_H)
//    #include <stdint.h>
//#endif

//#define VK_MAKE_VIDEO_STD_VERSION(major, minor, patch) \
//    ((((uint32_t)(major)) << 22) | (((uint32_t)(minor)) << 12) | ((uint32_t)(patch)))


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function VK_MAKE_VIDEO_STD_VERSION( const major_,minor_,patch_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( major_ shl 22 ) or ( minor_ shl 12 ) or patch_;
end;

end. //######################################################################### ■
