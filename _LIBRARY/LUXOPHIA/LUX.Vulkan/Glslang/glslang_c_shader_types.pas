unit glslang_c_shader_types;

(*
** Copyright (C) 2019 Google, Inc.
**
** SPDX-License-Identifier: BSD-3-Clause
*)

(* This file is generated from glslang/Include/glslang_c_shader_types.h *)

interface //#################################################################### ■

uses LUX.Code.C;

(* EShLanguage counterpart *)
//typedef enum {
type T_glslang_stage_t = T_int32_t;  P_glslang_stage_t = ^T_glslang_stage_t;
const GLSLANG_STAGE_VERTEX          = 0;
const GLSLANG_STAGE_TESSCONTROL     = 1;
const GLSLANG_STAGE_TESSEVALUATION  = 2;
const GLSLANG_STAGE_GEOMETRY        = 3;
const GLSLANG_STAGE_FRAGMENT        = 4;
const GLSLANG_STAGE_COMPUTE         = 5;
const GLSLANG_STAGE_RAYGEN          = 6;
const GLSLANG_STAGE_RAYGEN_NV       = GLSLANG_STAGE_RAYGEN;
const GLSLANG_STAGE_INTERSECT       = 7;
const GLSLANG_STAGE_INTERSECT_NV    = GLSLANG_STAGE_INTERSECT;
const GLSLANG_STAGE_ANYHIT          = 8;
const GLSLANG_STAGE_ANYHIT_NV       = GLSLANG_STAGE_ANYHIT;
const GLSLANG_STAGE_CLOSESTHIT      = 9;
const GLSLANG_STAGE_CLOSESTHIT_NV   = GLSLANG_STAGE_CLOSESTHIT;
const GLSLANG_STAGE_MISS            = 10;
const GLSLANG_STAGE_MISS_NV         = GLSLANG_STAGE_MISS;
const GLSLANG_STAGE_CALLABLE        = 11;
const GLSLANG_STAGE_CALLABLE_NV     = GLSLANG_STAGE_CALLABLE;
const GLSLANG_STAGE_TASK            = 12;
const GLSLANG_STAGE_TASK_NV         = GLSLANG_STAGE_TASK;
const GLSLANG_STAGE_MESH            = 13;
const GLSLANG_STAGE_MESH_NV         = GLSLANG_STAGE_MESH;
const GLSLANG_STAGE_COUNT           = 14;
//} glslang_stage_t;

(* EShSource counterpart *)
//typedef enum {
type T_glslang_source_t = T_int32_t;  P_glslang_source_t = ^T_glslang_source_t;
const GLSLANG_SOURCE_NONE  = 0;
const GLSLANG_SOURCE_GLSL  = 1;
const GLSLANG_SOURCE_HLSL  = 2;
const GLSLANG_SOURCE_COUNT = 3;
//} glslang_source_t;

(* EShClient counterpart *)
//typedef enum {
type T_glslang_client_t = T_int32_t;  P_glslang_client_t = ^T_glslang_client_t;
const GLSLANG_CLIENT_NONE   = 0;
const GLSLANG_CLIENT_VULKAN = 1;
const GLSLANG_CLIENT_OPENGL = 2;
const GLSLANG_CLIENT_COUNT  = 3;
//} glslang_client_t;

(* EShTargetLanguage counterpart *)
//typedef enum {
type T_glslang_target_language_t = T_int32_t;  P_glslang_target_language_t = ^T_glslang_target_language_t;
const GLSLANG_TARGET_NONE  = 0;
const GLSLANG_TARGET_SPV   = 1;
const GLSLANG_TARGET_COUNT = 2;
//} glslang_target_language_t;

(* SH_TARGET_ClientVersion counterpart *)
//typedef enum {
type T_glslang_target_client_version_t = T_int32_t;  P_glslang_target_client_version_t = ^T_glslang_target_client_version_t;
const GLSLANG_TARGET_VULKAN_1_0           = ( 1 shl 22 );
const GLSLANG_TARGET_VULKAN_1_1           = ( 1 shl 22 ) or ( 1 shl 12 );
const GLSLANG_TARGET_VULKAN_1_2           = ( 1 shl 22 ) or ( 2 shl 12 );
const GLSLANG_TARGET_VULKAN_1_3           = ( 1 shl 22 ) or ( 3 shl 12 );
const GLSLANG_TARGET_VULKAN_1_4           = ( 1 shl 22 ) or ( 4 shl 12 );
const GLSLANG_TARGET_OPENGL_450           = 450;
const GLSLANG_TARGET_CLIENT_VERSION_COUNT = 6;
//} glslang_target_client_version_t;

(* SH_TARGET_LanguageVersion counterpart *)
//typedef enum {
type T_glslang_target_language_version_t = T_int32_t;  P_glslang_target_language_version_t = ^T_glslang_target_language_version_t;
const GLSLANG_TARGET_SPV_1_0                = ( 1 shl 16 );
const GLSLANG_TARGET_SPV_1_1                = ( 1 shl 16 ) or ( 1 shl 8 );
const GLSLANG_TARGET_SPV_1_2                = ( 1 shl 16 ) or ( 2 shl 8 );
const GLSLANG_TARGET_SPV_1_3                = ( 1 shl 16 ) or ( 3 shl 8 );
const GLSLANG_TARGET_SPV_1_4                = ( 1 shl 16 ) or ( 4 shl 8 );
const GLSLANG_TARGET_SPV_1_5                = ( 1 shl 16 ) or ( 5 shl 8 );
const GLSLANG_TARGET_SPV_1_6                = ( 1 shl 16 ) or ( 6 shl 8 );
const GLSLANG_TARGET_LANGUAGE_VERSION_COUNT = 7;
//} glslang_target_language_version_t;

(* EProfile counterpart (from Versions.h) *)
//typedef enum {
type T_glslang_profile_t = T_int32_t;  P_glslang_profile_t = ^T_glslang_profile_t;
const GLSLANG_BAD_PROFILE           = 0;
const GLSLANG_NO_PROFILE            = ( 1 shl 0 );
const GLSLANG_CORE_PROFILE          = ( 1 shl 1 );
const GLSLANG_COMPATIBILITY_PROFILE = ( 1 shl 2 );
const GLSLANG_ES_PROFILE            = ( 1 shl 3 );
const GLSLANG_PROFILE_COUNT         = 5;
//} glslang_profile_t;

(* EShMessages counterpart *)
//typedef enum {
type T_glslang_messages_t = T_int32_t;  P_glslang_messages_t = ^T_glslang_messages_t;
const GLSLANG_MSG_DEFAULT_BIT                  = 0;
const GLSLANG_MSG_RELAXED_ERRORS_BIT           = ( 1 shl 0 );
const GLSLANG_MSG_SUPPRESS_WARNINGS_BIT        = ( 1 shl 1 );
const GLSLANG_MSG_AST_BIT                      = ( 1 shl 2 );
const GLSLANG_MSG_SPV_RULES_BIT                = ( 1 shl 3 );
const GLSLANG_MSG_VULKAN_RULES_BIT             = ( 1 shl 4 );
const GLSLANG_MSG_ONLY_PREPROCESSOR_BIT        = ( 1 shl 5 );
const GLSLANG_MSG_READ_HLSL_BIT                = ( 1 shl 6 );
const GLSLANG_MSG_CASCADING_ERRORS_BIT         = ( 1 shl 7 );
const GLSLANG_MSG_KEEP_UNCALLED_BIT            = ( 1 shl 8 );
const GLSLANG_MSG_HLSL_OFFSETS_BIT             = ( 1 shl 9 );
const GLSLANG_MSG_DEBUG_INFO_BIT               = ( 1 shl 10 );
const GLSLANG_MSG_HLSL_ENABLE_16BIT_TYPES_BIT  = ( 1 shl 11 );
const GLSLANG_MSG_HLSL_LEGALIZATION_BIT        = ( 1 shl 12 );
const GLSLANG_MSG_HLSL_DX9_COMPATIBLE_BIT      = ( 1 shl 13 );
const GLSLANG_MSG_BUILTIN_SYMBOL_TABLE_BIT     = ( 1 shl 14 );
const GLSLANG_MSG_ENHANCED                     = ( 1 shl 15 );
const GLSLANG_MSG_ABSOLUTE_PATH                = ( 1 shl 16 );
const GLSLANG_MSG_DISPLAY_ERROR_COLUMN         = ( 1 shl 17 );
const GLSLANG_MSG_LINK_TIME_OPTIMIZATION_BIT   = ( 1 shl 18 );
const GLSLANG_MSG_VALIDATE_CROSS_STAGE_IO_BIT  = ( 1 shl 19 );
const GLSLANG_MSG_RELAX_SET_BINDING_LIMITS_BIT = ( 1 shl 20 );
//} glslang_messages_t;

implementation //############################################################### ■

end. //######################################################################### ■
