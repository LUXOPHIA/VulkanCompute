unit vulkan_video_codec_av1std_encode;

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

//#ifndef VULKAN_VIDEO_CODEC_AV1STD_ENCODE_H_
const VULKAN_VIDEO_CODEC_AV1STD_ENCODE_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_av1std_encode is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_av1std_encode 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codec_av1std.h"

const VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_API_VERSION_1_0_0 = ( 1 shl 22 ) or ( 0 shl 12 ) or 0;

const VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_SPEC_VERSION   = VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_API_VERSION_1_0_0;
const VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_av1_encode';
type T_StdVideoEncodeAV1DecoderModelInfo = record
       buffer_delay_length_minus_1            :T_uint8_t;
       buffer_removal_time_length_minus_1     :T_uint8_t;
       frame_presentation_time_length_minus_1 :T_uint8_t;
       reserved1                              :T_uint8_t;
       num_units_in_decoding_tick             :T_uint32_t;
     end;
     P_StdVideoEncodeAV1DecoderModelInfo = ^T_StdVideoEncodeAV1DecoderModelInfo;

type T_StdVideoEncodeAV1ExtensionHeader = record
       temporal_id :T_uint8_t;
       spatial_id  :T_uint8_t;
     end;
     P_StdVideoEncodeAV1ExtensionHeader = ^T_StdVideoEncodeAV1ExtensionHeader;

type T_StdVideoEncodeAV1OperatingPointInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property decoder_model_present_for_this_op         :T_uint32_t index $000001 read GetBits write SetBits;
       property low_delay_mode_flag                       :T_uint32_t index $000101 read GetBits write SetBits;
       property initial_display_delay_present_for_this_op :T_uint32_t index $000201 read GetBits write SetBits;
       property reserved                                  :T_uint32_t index $00031D read GetBits write SetBits;
     end;
     P_StdVideoEncodeAV1OperatingPointInfoFlags = ^T_StdVideoEncodeAV1OperatingPointInfoFlags;

type T_StdVideoEncodeAV1OperatingPointInfo = record
       flags                         :T_StdVideoEncodeAV1OperatingPointInfoFlags;
       operating_point_idc           :T_uint16_t;
       seq_level_idx                 :T_uint8_t;
       seq_tier                      :T_uint8_t;
       decoder_buffer_delay          :T_uint32_t;
       encoder_buffer_delay          :T_uint32_t;
       initial_display_delay_minus_1 :T_uint8_t;
     end;
     P_StdVideoEncodeAV1OperatingPointInfo = ^T_StdVideoEncodeAV1OperatingPointInfo;

type T_StdVideoEncodeAV1PictureInfoFlags = record
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
       property skip_mode_present                :T_uint32_t index $001101 read GetBits write SetBits;
       property delta_q_present                  :T_uint32_t index $001201 read GetBits write SetBits;
       property delta_lf_present                 :T_uint32_t index $001301 read GetBits write SetBits;
       property delta_lf_multi                   :T_uint32_t index $001401 read GetBits write SetBits;
       property segmentation_enabled             :T_uint32_t index $001501 read GetBits write SetBits;
       property segmentation_update_map          :T_uint32_t index $001601 read GetBits write SetBits;
       property segmentation_temporal_update     :T_uint32_t index $001701 read GetBits write SetBits;
       property segmentation_update_data         :T_uint32_t index $001801 read GetBits write SetBits;
       property UsesLr                           :T_uint32_t index $001901 read GetBits write SetBits;
       property usesChromaLr                     :T_uint32_t index $001A01 read GetBits write SetBits;
       property show_frame                       :T_uint32_t index $001B01 read GetBits write SetBits;
       property showable_frame                   :T_uint32_t index $001C01 read GetBits write SetBits;
       property reserved                         :T_uint32_t index $001D03 read GetBits write SetBits;
     end;
     P_StdVideoEncodeAV1PictureInfoFlags = ^T_StdVideoEncodeAV1PictureInfoFlags;

type T_StdVideoEncodeAV1PictureInfo = record
       flags                   :T_StdVideoEncodeAV1PictureInfoFlags;
       frame_type              :T_StdVideoAV1FrameType;
       frame_presentation_time :T_uint32_t;
       current_frame_id        :T_uint32_t;
       order_hint              :T_uint8_t;
       primary_ref_frame       :T_uint8_t;
       refresh_frame_flags     :T_uint8_t;
       coded_denom             :T_uint8_t;
       render_width_minus_1    :T_uint16_t;
       render_height_minus_1   :T_uint16_t;
       interpolation_filter    :T_StdVideoAV1InterpolationFilter;
       TxMode                  :T_StdVideoAV1TxMode;
       delta_q_res             :T_uint8_t;
       delta_lf_res            :T_uint8_t;
       ref_order_hint          :array [ 0..STD_VIDEO_AV1_NUM_REF_FRAMES-1 ] of T_uint8_t;
       ref_frame_idx           :array [ 0..STD_VIDEO_AV1_REFS_PER_FRAME-1 ] of T_int8_t;
       reserved1               :array [ 0..2 ] of T_uint8_t;
       delta_frame_id_minus_1  :array [ 0..STD_VIDEO_AV1_REFS_PER_FRAME-1 ] of T_uint32_t;
       pTileInfo               :P_StdVideoAV1TileInfo;
       pQuantization           :P_StdVideoAV1Quantization;
       pSegmentation           :P_StdVideoAV1Segmentation;
       pLoopFilter             :P_StdVideoAV1LoopFilter;
       pCDEF                   :P_StdVideoAV1CDEF;
       pLoopRestoration        :P_StdVideoAV1LoopRestoration;
       pGlobalMotion           :P_StdVideoAV1GlobalMotion;
       pExtensionHeader        :P_StdVideoEncodeAV1ExtensionHeader;
       pBufferRemovalTimes     :P_uint32_t;
     end;
     P_StdVideoEncodeAV1PictureInfo = ^T_StdVideoEncodeAV1PictureInfo;

type T_StdVideoEncodeAV1ReferenceInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property disable_frame_end_update_cdf :T_uint32_t index $000001 read GetBits write SetBits;
       property segmentation_enabled         :T_uint32_t index $000101 read GetBits write SetBits;
       property reserved                     :T_uint32_t index $00021E read GetBits write SetBits;
     end;
     P_StdVideoEncodeAV1ReferenceInfoFlags = ^T_StdVideoEncodeAV1ReferenceInfoFlags;

type T_StdVideoEncodeAV1ReferenceInfo = record
       flags            :T_StdVideoEncodeAV1ReferenceInfoFlags;
       RefFrameId       :T_uint32_t;
       frame_type       :T_StdVideoAV1FrameType;
       OrderHint        :T_uint8_t;
       reserved1        :array [ 0..2 ] of T_uint8_t;
       pExtensionHeader :P_StdVideoEncodeAV1ExtensionHeader;
     end;
     P_StdVideoEncodeAV1ReferenceInfo = ^T_StdVideoEncodeAV1ReferenceInfo;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoEncodeAV1OperatingPointInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeAV1OperatingPointInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoEncodeAV1PictureInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeAV1PictureInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoEncodeAV1ReferenceInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeAV1ReferenceInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
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
