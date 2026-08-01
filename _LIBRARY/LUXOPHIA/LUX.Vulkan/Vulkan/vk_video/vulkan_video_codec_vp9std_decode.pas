unit vulkan_video_codec_vp9std_decode;

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
     vulkan_video_codec_vp9std;

//#ifndef VULKAN_VIDEO_CODEC_VP9STD_DECODE_H_
const VULKAN_VIDEO_CODEC_VP9STD_DECODE_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_vp9std_decode is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_vp9std_decode 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codec_vp9std.h"

const VK_STD_VULKAN_VIDEO_CODEC_VP9_DECODE_API_VERSION_1_0_0 = ( 1 shl 22 ) or ( 0 shl 12 ) or 0;

const VK_STD_VULKAN_VIDEO_CODEC_VP9_DECODE_SPEC_VERSION   = VK_STD_VULKAN_VIDEO_CODEC_VP9_DECODE_API_VERSION_1_0_0;
const VK_STD_VULKAN_VIDEO_CODEC_VP9_DECODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_vp9_decode';
type T_StdVideoDecodeVP9PictureInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property error_resilient_mode         :T_uint32_t index $000001 read GetBits write SetBits;
       property intra_only                   :T_uint32_t index $000101 read GetBits write SetBits;
       property allow_high_precision_mv      :T_uint32_t index $000201 read GetBits write SetBits;
       property refresh_frame_context        :T_uint32_t index $000301 read GetBits write SetBits;
       property frame_parallel_decoding_mode :T_uint32_t index $000401 read GetBits write SetBits;
       property segmentation_enabled         :T_uint32_t index $000501 read GetBits write SetBits;
       property show_frame                   :T_uint32_t index $000601 read GetBits write SetBits;
       property UsePrevFrameMvs              :T_uint32_t index $000701 read GetBits write SetBits;
       property reserved                     :T_uint32_t index $000818 read GetBits write SetBits;
     end;
     P_StdVideoDecodeVP9PictureInfoFlags = ^T_StdVideoDecodeVP9PictureInfoFlags;

type T_StdVideoDecodeVP9PictureInfo = record
       flags                    :T_StdVideoDecodeVP9PictureInfoFlags;
       profile                  :T_StdVideoVP9Profile;
       frame_type               :T_StdVideoVP9FrameType;
       frame_context_idx        :T_uint8_t;
       reset_frame_context      :T_uint8_t;
       refresh_frame_flags      :T_uint8_t;
       ref_frame_sign_bias_mask :T_uint8_t;
       interpolation_filter     :T_StdVideoVP9InterpolationFilter;
       base_q_idx               :T_uint8_t;
       delta_q_y_dc             :T_int8_t;
       delta_q_uv_dc            :T_int8_t;
       delta_q_uv_ac            :T_int8_t;
       tile_cols_log2           :T_uint8_t;
       tile_rows_log2           :T_uint8_t;
       reserved1                :array [ 0..2 ] of T_uint16_t;
       pColorConfig             :P_StdVideoVP9ColorConfig;
       pLoopFilter              :P_StdVideoVP9LoopFilter;
       pSegmentation            :P_StdVideoVP9Segmentation;
     end;
     P_StdVideoDecodeVP9PictureInfo = ^T_StdVideoDecodeVP9PictureInfo;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoDecodeVP9PictureInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoDecodeVP9PictureInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

end. //######################################################################### ■
