unit vulkan_video_codec_h265std_encode;

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
     vulkan_video_codec_h265std;

//#ifndef VULKAN_VIDEO_CODEC_H265STD_ENCODE_H_
const VULKAN_VIDEO_CODEC_H265STD_ENCODE_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_h265std_encode is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_h265std_encode 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codec_h265std.h"

const VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_API_VERSION_1_0_0 = ( 1 shl 22 ) or ( 0 shl 12 ) or 0;

const VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_SPEC_VERSION   = VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_API_VERSION_1_0_0;
const VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_h265_encode';
type T_StdVideoEncodeH265WeightTableFlags = record
       luma_weight_l0_flag   :T_uint16_t;
       chroma_weight_l0_flag :T_uint16_t;
       luma_weight_l1_flag   :T_uint16_t;
       chroma_weight_l1_flag :T_uint16_t;
     end;
     P_StdVideoEncodeH265WeightTableFlags = ^T_StdVideoEncodeH265WeightTableFlags;

type T_StdVideoEncodeH265WeightTable = record
       flags                          :T_StdVideoEncodeH265WeightTableFlags;
       luma_log2_weight_denom         :T_uint8_t;
       delta_chroma_log2_weight_denom :T_int8_t;
       delta_luma_weight_l0           :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of T_int8_t;
       luma_offset_l0                 :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of T_int8_t;
       delta_chroma_weight_l0         :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of array [ 0..STD_VIDEO_H265_MAX_CHROMA_PLANES-1 ] of T_int8_t;
       delta_chroma_offset_l0         :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of array [ 0..STD_VIDEO_H265_MAX_CHROMA_PLANES-1 ] of T_int8_t;
       delta_luma_weight_l1           :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of T_int8_t;
       luma_offset_l1                 :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of T_int8_t;
       delta_chroma_weight_l1         :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of array [ 0..STD_VIDEO_H265_MAX_CHROMA_PLANES-1 ] of T_int8_t;
       delta_chroma_offset_l1         :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of array [ 0..STD_VIDEO_H265_MAX_CHROMA_PLANES-1 ] of T_int8_t;
     end;
     P_StdVideoEncodeH265WeightTable = ^T_StdVideoEncodeH265WeightTable;

type T_StdVideoEncodeH265SliceSegmentHeaderFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property first_slice_segment_in_pic_flag              :T_uint32_t index $000001 read GetBits write SetBits;
       property dependent_slice_segment_flag                 :T_uint32_t index $000101 read GetBits write SetBits;
       property slice_sao_luma_flag                          :T_uint32_t index $000201 read GetBits write SetBits;
       property slice_sao_chroma_flag                        :T_uint32_t index $000301 read GetBits write SetBits;
       property num_ref_idx_active_override_flag             :T_uint32_t index $000401 read GetBits write SetBits;
       property mvd_l1_zero_flag                             :T_uint32_t index $000501 read GetBits write SetBits;
       property cabac_init_flag                              :T_uint32_t index $000601 read GetBits write SetBits;
       property cu_chroma_qp_offset_enabled_flag             :T_uint32_t index $000701 read GetBits write SetBits;
       property deblocking_filter_override_flag              :T_uint32_t index $000801 read GetBits write SetBits;
       property slice_deblocking_filter_disabled_flag        :T_uint32_t index $000901 read GetBits write SetBits;
       property collocated_from_l0_flag                      :T_uint32_t index $000A01 read GetBits write SetBits;
       property slice_loop_filter_across_slices_enabled_flag :T_uint32_t index $000B01 read GetBits write SetBits;
       property reserved                                     :T_uint32_t index $000C14 read GetBits write SetBits;
     end;
     P_StdVideoEncodeH265SliceSegmentHeaderFlags = ^T_StdVideoEncodeH265SliceSegmentHeaderFlags;

type T_StdVideoEncodeH265SliceSegmentHeader = record
       flags                  :T_StdVideoEncodeH265SliceSegmentHeaderFlags;
       slice_type             :T_StdVideoH265SliceType;
       slice_segment_address  :T_uint32_t;
       collocated_ref_idx     :T_uint8_t;
       MaxNumMergeCand        :T_uint8_t;
       slice_cb_qp_offset     :T_int8_t;
       slice_cr_qp_offset     :T_int8_t;
       slice_beta_offset_div2 :T_int8_t;
       slice_tc_offset_div2   :T_int8_t;
       slice_act_y_qp_offset  :T_int8_t;
       slice_act_cb_qp_offset :T_int8_t;
       slice_act_cr_qp_offset :T_int8_t;
       slice_qp_delta         :T_int8_t;
       reserved1              :T_uint16_t;
       pWeightTable           :P_StdVideoEncodeH265WeightTable;
     end;
     P_StdVideoEncodeH265SliceSegmentHeader = ^T_StdVideoEncodeH265SliceSegmentHeader;

type T_StdVideoEncodeH265ReferenceListsInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property ref_pic_list_modification_flag_l0 :T_uint32_t index $000001 read GetBits write SetBits;
       property ref_pic_list_modification_flag_l1 :T_uint32_t index $000101 read GetBits write SetBits;
       property reserved                          :T_uint32_t index $00021E read GetBits write SetBits;
     end;
     P_StdVideoEncodeH265ReferenceListsInfoFlags = ^T_StdVideoEncodeH265ReferenceListsInfoFlags;

type T_StdVideoEncodeH265ReferenceListsInfo = record
       flags                        :T_StdVideoEncodeH265ReferenceListsInfoFlags;
       num_ref_idx_l0_active_minus1 :T_uint8_t;
       num_ref_idx_l1_active_minus1 :T_uint8_t;
       RefPicList0                  :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of T_uint8_t;
       RefPicList1                  :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of T_uint8_t;
       list_entry_l0                :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of T_uint8_t;
       list_entry_l1                :array [ 0..STD_VIDEO_H265_MAX_NUM_LIST_REF-1 ] of T_uint8_t;
     end;
     P_StdVideoEncodeH265ReferenceListsInfo = ^T_StdVideoEncodeH265ReferenceListsInfo;

type T_StdVideoEncodeH265PictureInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property is_reference                    :T_uint32_t index $000001 read GetBits write SetBits;
       property IrapPicFlag                     :T_uint32_t index $000101 read GetBits write SetBits;
       property used_for_long_term_reference    :T_uint32_t index $000201 read GetBits write SetBits;
       property discardable_flag                :T_uint32_t index $000301 read GetBits write SetBits;
       property cross_layer_bla_flag            :T_uint32_t index $000401 read GetBits write SetBits;
       property pic_output_flag                 :T_uint32_t index $000501 read GetBits write SetBits;
       property no_output_of_prior_pics_flag    :T_uint32_t index $000601 read GetBits write SetBits;
       property short_term_ref_pic_set_sps_flag :T_uint32_t index $000701 read GetBits write SetBits;
       property slice_temporal_mvp_enabled_flag :T_uint32_t index $000801 read GetBits write SetBits;
       property reserved                        :T_uint32_t index $000917 read GetBits write SetBits;
     end;
     P_StdVideoEncodeH265PictureInfoFlags = ^T_StdVideoEncodeH265PictureInfoFlags;

type T_StdVideoEncodeH265LongTermRefPics = record
       num_long_term_sps          :T_uint8_t;
       num_long_term_pics         :T_uint8_t;
       lt_idx_sps                 :array [ 0..STD_VIDEO_H265_MAX_LONG_TERM_REF_PICS_SPS-1 ] of T_uint8_t;
       poc_lsb_lt                 :array [ 0..STD_VIDEO_H265_MAX_LONG_TERM_PICS-1 ] of T_uint8_t;
       used_by_curr_pic_lt_flag   :T_uint16_t;
       delta_poc_msb_present_flag :array [ 0..STD_VIDEO_H265_MAX_DELTA_POC-1 ] of T_uint8_t;
       delta_poc_msb_cycle_lt     :array [ 0..STD_VIDEO_H265_MAX_DELTA_POC-1 ] of T_uint8_t;
     end;
     P_StdVideoEncodeH265LongTermRefPics = ^T_StdVideoEncodeH265LongTermRefPics;

type T_StdVideoEncodeH265PictureInfo = record
       flags                      :T_StdVideoEncodeH265PictureInfoFlags;
       pic_type                   :T_StdVideoH265PictureType;
       sps_video_parameter_set_id :T_uint8_t;
       pps_seq_parameter_set_id   :T_uint8_t;
       pps_pic_parameter_set_id   :T_uint8_t;
       short_term_ref_pic_set_idx :T_uint8_t;
       PicOrderCntVal             :T_int32_t;
       TemporalId                 :T_uint8_t;
       reserved1                  :array [ 0..6 ] of T_uint8_t;
       pRefLists                  :P_StdVideoEncodeH265ReferenceListsInfo;
       pShortTermRefPicSet        :P_StdVideoH265ShortTermRefPicSet;
       pLongTermRefPics           :P_StdVideoEncodeH265LongTermRefPics;
     end;
     P_StdVideoEncodeH265PictureInfo = ^T_StdVideoEncodeH265PictureInfo;

type T_StdVideoEncodeH265ReferenceInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property used_for_long_term_reference :T_uint32_t index $000001 read GetBits write SetBits;
       property unused_for_reference         :T_uint32_t index $000101 read GetBits write SetBits;
       property reserved                     :T_uint32_t index $00021E read GetBits write SetBits;
     end;
     P_StdVideoEncodeH265ReferenceInfoFlags = ^T_StdVideoEncodeH265ReferenceInfoFlags;

type T_StdVideoEncodeH265ReferenceInfo = record
       flags          :T_StdVideoEncodeH265ReferenceInfoFlags;
       pic_type       :T_StdVideoH265PictureType;
       PicOrderCntVal :T_int32_t;
       TemporalId     :T_uint8_t;
     end;
     P_StdVideoEncodeH265ReferenceInfo = ^T_StdVideoEncodeH265ReferenceInfo;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoEncodeH265SliceSegmentHeaderFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeH265SliceSegmentHeaderFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoEncodeH265ReferenceListsInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeH265ReferenceListsInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoEncodeH265PictureInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeH265PictureInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoEncodeH265ReferenceInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeH265ReferenceInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
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
