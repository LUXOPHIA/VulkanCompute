unit vk_platform;

(*
** Copyright 2014-2024 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*)

(*
***************************************************************************************************
*   Platform-specific directives and type declarations
***************************************************************************************************
*)

interface //#################################################################### ■

uses LUX.Code.C;

(* Platform-specific calling convention macros.
 *
 * Platforms should define these so that Vulkan clients call Vulkan commands
 * with the same calling conventions that the Vulkan implementation expects.
 *
 * VKAPI_ATTR - Placed before the return type in function declarations.
 *              Useful for C++11 and GCC/Clang-style function attribute syntax.
 * VKAPI_CALL - Placed after the return type in function declarations.
 *              Useful for MSVC-style calling convention syntax.
 * VKAPI_PTR  - Placed between the '(' and '*' in function pointer types.
 *
 * Function declaration:  VKAPI_ATTR void VKAPI_CALL vkCommand(void);
 * Function pointer type: typedef void (VKAPI_PTR *PFN_vkCommand)(void);
 *)

//#if defined(_WIN32)
//    // On Windows, Vulkan commands use the stdcall convention
//    #define VKAPI_ATTR
//    #define VKAPI_CALL __stdcall
//    #define VKAPI_PTR  VKAPI_CALL
//#else
//    // On other platforms, use the default calling convention
//    #define VKAPI_ATTR
//    #define VKAPI_CALL
//    #define VKAPI_PTR
//#endif

// Object Pascal では、各関数ポインタ型の宣言に呼び出し規約を直接指定する。
// {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}

// C の基本型（uint32_t / uint64_t / size_t / char / float ...）は
// LUX.Code.C ユニットの T_uint32_t / T_uint64_t / T_size_t / T_char / T_float 等を使用する。

implementation //############################################################### ■

end. //######################################################################### ■
