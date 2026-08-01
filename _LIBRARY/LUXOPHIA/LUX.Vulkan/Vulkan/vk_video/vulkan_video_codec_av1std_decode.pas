unit vulkan_video_codec_av1std_decode;

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
     vulkan_video_codec_av1std;

//#ifndef VULKAN_VIDEO_CODEC_AV1STD_DECODE_H_
const VULKAN_VIDEO_CODEC_AV1STD_DECODE_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_av1std_decode is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_av1std_decode 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codec_av1std.h"

const VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_API_VERSION_1_0_0 = ( 1 shl 22 ) or ( 0 shl 12 ) or 0;

const VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_SPEC_VERSION   = VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_API_VERSION_1_0_0;
const VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_av1_decode';
type T_StdVideoDecodeAV1PictureInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property error_resilient_mode             :T_uint32_t index $000001 read GetBits write SetBits;
       property disable_cdf_update               :T_uint32_t index $000101 read GetBits write SetBits;
       property use_superres                     :T_uint32_t index $000201 read GetBits write SetBits;
       property render_and_frame_size_different  :T_uint32_t index $000301 read GetBits write SetBits;
       property allow_screen_content_tools       :T_uint32_t index $000401 read GetBits write SetBits;
       property is_filter_switchable             :T_uint32_t index $000501 read GetBits write SetBits;
       property force_integer_mv                 :T_uint32_t index $000601 read GetBits write SetBits;
       property frame_size_override_flag         :T_uint32_t index $000701 read GetBits write SetBits;
       property buffer_removal_time_present_flag :T_uint32_t index $000801 read GetBits write SetBits;
       property allow_intrabc                    :T_uint32_t index $000901 read GetBits write SetBits;
       property frame_refs_short_signaling       :T_uint32_t index $000A01 read GetBits write SetBits;
       property allow_high_precision_mv          :T_uint32_t index $000B01 read GetBits write SetBits;
       property is_motion_mode_switchable        :T_uint32_t index $000C01 read GetBits write SetBits;
       property use_ref_frame_mvs                :T_uint32_t index $000D01 read GetBits write SetBits;
       property disable_frame_end_update_cdf     :T_uint32_t index $000E01 read GetBits write SetBits;
       property allow_warped_motion              :T_uint32_t index $000F01 read GetBits write SetBits;
       property reduced_tx_set                   :T_uint32_t index $001001 read GetBits write SetBits;
       property reference_select                 :T_uint32_t index $001101 read GetBits write SetBits;
       property skip_mode_present                :T_uint32_t index $001201 read GetBits write SetBits;
       property delta_q_present                  :T_uint32_t index $001301 read GetBits write SetBits;
       property delta_lf_present                 :T_uint32_t index $001401 read GetBits write SetBits;
       property delta_lf_multi                   :T_uint32_t index $001501 read GetBits write SetBits;
       property segmentation_enabled             :T_uint32_t index $001601 read GetBits write SetBits;
       property segmentation_update_map          :T_uint32_t index $001701 read GetBits write SetBits;
       property segmentation_temporal_update     :T_uint32_t index $001801 read GetBits write SetBits;
       property segmentation_update_data         :T_uint32_t index $001901 read GetBits write SetBits;
       property UsesLr                           :T_uint32_t index $001A01 read GetBits write SetBits;
       property usesChromaLr                     :T_uint32_t index $001B01 read GetBits write SetBits;
       property apply_grain                      :T_uint32_t index $001C01 read GetBits write SetBits;
       property reserved                         :T_uint32_t index $001D03 read GetBits write SetBits;
     end;
     P_StdVideoDecodeAV1PictureInfoFlags = ^T_StdVideoDecodeAV1PictureInfoFlags;

type T_StdVideoDecodeAV1PictureInfo = record
       flags                :T_StdVideoDecodeAV1PictureInfoFlags;
       frame_type           :T_StdVideoAV1FrameType;
       current_frame_id     :T_uint32_t;
       OrderHint            :T_uint8_t;
       primary_ref_frame    :T_uint8_t;
       refresh_frame_flags  :T_uint8_t;
       reserved1            :T_uint8_t;
       interpolation_filter :T_StdVideoAV1InterpolationFilter;
       TxMode               :T_StdVideoAV1TxMode;
       delta_q_res          :T_uint8_t;
       delta_lf_res         :T_uint8_t;
       SkipModeFrame        :array [ 0..STD_VIDEO_AV1_SKIP_MODE_FRAMES-1 ] of T_uint8_t;
       coded_denom          :T_uint8_t;
       reserved2            :array [ 0..2 ] of T_uint8_t;
       OrderHints           :array [ 0..STD_VIDEO_AV1_NUM_REF_FRAMES-1 ] of T_uint8_t;
       expectedFrameId      :array [ 0..STD_VIDEO_AV1_NUM_REF_FRAMES-1 ] of T_uint32_t;
       pTileInfo            :P_StdVideoAV1TileInfo;
       pQuantization        :P_StdVideoAV1Quantization;
       pSegmentation        :P_StdVideoAV1Segmentation;
       pLoopFilter          :P_StdVideoAV1LoopFilter;
       pCDEF                :P_StdVideoAV1CDEF;
       pLoopRestoration     :P_StdVideoAV1LoopRestoration;
       pGlobalMotion        :P_StdVideoAV1GlobalMotion;
       pFilmGrain           :P_StdVideoAV1FilmGrain;
     end;
     P_StdVideoDecodeAV1PictureInfo = ^T_StdVideoDecodeAV1PictureInfo;

type T_StdVideoDecodeAV1ReferenceInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property disable_frame_end_update_cdf :T_uint32_t index $000001 read GetBits write SetBits;
       property segmentation_enabled         :T_uint32_t index $000101 read GetBits write SetBits;
       property reserved                     :T_uint32_t index $00021E read GetBits write SetBits;
     end;
     P_StdVideoDecodeAV1ReferenceInfoFlags = ^T_StdVideoDecodeAV1ReferenceInfoFlags;

type T_StdVideoDecodeAV1ReferenceInfo = record
       flags            :T_StdVideoDecodeAV1ReferenceInfoFlags;
       frame_type       :T_uint8_t;
       RefFrameSignBias :T_uint8_t;
       OrderHint        :T_uint8_t;
       SavedOrderHints  :array [ 0..STD_VIDEO_AV1_NUM_REF_FRAMES-1 ] of T_uint8_t;
     end;
     P_StdVideoDecodeAV1ReferenceInfo = ^T_StdVideoDecodeAV1ReferenceInfo;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoDecodeAV1PictureInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoDecodeAV1PictureInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoDecodeAV1ReferenceInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoDecodeAV1ReferenceInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
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
