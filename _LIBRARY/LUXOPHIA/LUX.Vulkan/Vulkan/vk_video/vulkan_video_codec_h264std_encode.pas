unit vulkan_video_codec_h264std_encode;

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
     vulkan_video_codec_h264std;

//#ifndef VULKAN_VIDEO_CODEC_H264STD_ENCODE_H_
const VULKAN_VIDEO_CODEC_H264STD_ENCODE_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_h264std_encode is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_h264std_encode 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codec_h264std.h"

const VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_API_VERSION_1_0_0 = ( 1 shl 22 ) or ( 0 shl 12 ) or 0;

const VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_SPEC_VERSION   = VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_API_VERSION_1_0_0;
const VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_h264_encode';
type T_StdVideoEncodeH264WeightTableFlags = record
       luma_weight_l0_flag   :T_uint32_t;
       chroma_weight_l0_flag :T_uint32_t;
       luma_weight_l1_flag   :T_uint32_t;
       chroma_weight_l1_flag :T_uint32_t;
     end;
     P_StdVideoEncodeH264WeightTableFlags = ^T_StdVideoEncodeH264WeightTableFlags;

type T_StdVideoEncodeH264WeightTable = record
       flags                    :T_StdVideoEncodeH264WeightTableFlags;
       luma_log2_weight_denom   :T_uint8_t;
       chroma_log2_weight_denom :T_uint8_t;
       luma_weight_l0           :array [ 0..STD_VIDEO_H264_MAX_NUM_LIST_REF-1 ] of T_int8_t;
       luma_offset_l0           :array [ 0..STD_VIDEO_H264_MAX_NUM_LIST_REF-1 ] of T_int8_t;
       chroma_weight_l0         :array [ 0..STD_VIDEO_H264_MAX_NUM_LIST_REF-1 ] of array [ 0..STD_VIDEO_H264_MAX_CHROMA_PLANES-1 ] of T_int8_t;
       chroma_offset_l0         :array [ 0..STD_VIDEO_H264_MAX_NUM_LIST_REF-1 ] of array [ 0..STD_VIDEO_H264_MAX_CHROMA_PLANES-1 ] of T_int8_t;
       luma_weight_l1           :array [ 0..STD_VIDEO_H264_MAX_NUM_LIST_REF-1 ] of T_int8_t;
       luma_offset_l1           :array [ 0..STD_VIDEO_H264_MAX_NUM_LIST_REF-1 ] of T_int8_t;
       chroma_weight_l1         :array [ 0..STD_VIDEO_H264_MAX_NUM_LIST_REF-1 ] of array [ 0..STD_VIDEO_H264_MAX_CHROMA_PLANES-1 ] of T_int8_t;
       chroma_offset_l1         :array [ 0..STD_VIDEO_H264_MAX_NUM_LIST_REF-1 ] of array [ 0..STD_VIDEO_H264_MAX_CHROMA_PLANES-1 ] of T_int8_t;
     end;
     P_StdVideoEncodeH264WeightTable = ^T_StdVideoEncodeH264WeightTable;

type T_StdVideoEncodeH264SliceHeaderFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property direct_spatial_mv_pred_flag      :T_uint32_t index $000001 read GetBits write SetBits;
       property num_ref_idx_active_override_flag :T_uint32_t index $000101 read GetBits write SetBits;
       property reserved                         :T_uint32_t index $00021E read GetBits write SetBits;
     end;
     P_StdVideoEncodeH264SliceHeaderFlags = ^T_StdVideoEncodeH264SliceHeaderFlags;

type T_StdVideoEncodeH264PictureInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property IdrPicFlag                         :T_uint32_t index $000001 read GetBits write SetBits;
       property is_reference                       :T_uint32_t index $000101 read GetBits write SetBits;
       property no_output_of_prior_pics_flag       :T_uint32_t index $000201 read GetBits write SetBits;
       property long_term_reference_flag           :T_uint32_t index $000301 read GetBits write SetBits;
       property adaptive_ref_pic_marking_mode_flag :T_uint32_t index $000401 read GetBits write SetBits;
       property reserved                           :T_uint32_t index $00051B read GetBits write SetBits;
     end;
     P_StdVideoEncodeH264PictureInfoFlags = ^T_StdVideoEncodeH264PictureInfoFlags;

type T_StdVideoEncodeH264ReferenceInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property used_for_long_term_reference :T_uint32_t index $000001 read GetBits write SetBits;
       property reserved                     :T_uint32_t index $00011F read GetBits write SetBits;
     end;
     P_StdVideoEncodeH264ReferenceInfoFlags = ^T_StdVideoEncodeH264ReferenceInfoFlags;

type T_StdVideoEncodeH264ReferenceListsInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property ref_pic_list_modification_flag_l0 :T_uint32_t index $000001 read GetBits write SetBits;
       property ref_pic_list_modification_flag_l1 :T_uint32_t index $000101 read GetBits write SetBits;
       property reserved                          :T_uint32_t index $00021E read GetBits write SetBits;
     end;
     P_StdVideoEncodeH264ReferenceListsInfoFlags = ^T_StdVideoEncodeH264ReferenceListsInfoFlags;

type T_StdVideoEncodeH264RefListModEntry = record
       modification_of_pic_nums_idc :T_StdVideoH264ModificationOfPicNumsIdc;
       abs_diff_pic_num_minus1      :T_uint16_t;
       long_term_pic_num            :T_uint16_t;
     end;
     P_StdVideoEncodeH264RefListModEntry = ^T_StdVideoEncodeH264RefListModEntry;

type T_StdVideoEncodeH264RefPicMarkingEntry = record
       memory_management_control_operation :T_StdVideoH264MemMgmtControlOp;
       difference_of_pic_nums_minus1       :T_uint16_t;
       long_term_pic_num                   :T_uint16_t;
       long_term_frame_idx                 :T_uint16_t;
       max_long_term_frame_idx_plus1       :T_uint16_t;
     end;
     P_StdVideoEncodeH264RefPicMarkingEntry = ^T_StdVideoEncodeH264RefPicMarkingEntry;

type T_StdVideoEncodeH264ReferenceListsInfo = record
       flags                        :T_StdVideoEncodeH264ReferenceListsInfoFlags;
       num_ref_idx_l0_active_minus1 :T_uint8_t;
       num_ref_idx_l1_active_minus1 :T_uint8_t;
       RefPicList0                  :array [ 0..STD_VIDEO_H264_MAX_NUM_LIST_REF-1 ] of T_uint8_t;
       RefPicList1                  :array [ 0..STD_VIDEO_H264_MAX_NUM_LIST_REF-1 ] of T_uint8_t;
       refList0ModOpCount           :T_uint8_t;
       refList1ModOpCount           :T_uint8_t;
       refPicMarkingOpCount         :T_uint8_t;
       reserved1                    :array [ 0..6 ] of T_uint8_t;
       pRefList0ModOperations       :P_StdVideoEncodeH264RefListModEntry;
       pRefList1ModOperations       :P_StdVideoEncodeH264RefListModEntry;
       pRefPicMarkingOperations     :P_StdVideoEncodeH264RefPicMarkingEntry;
     end;
     P_StdVideoEncodeH264ReferenceListsInfo = ^T_StdVideoEncodeH264ReferenceListsInfo;

type T_StdVideoEncodeH264PictureInfo = record
       flags                :T_StdVideoEncodeH264PictureInfoFlags;
       seq_parameter_set_id :T_uint8_t;
       pic_parameter_set_id :T_uint8_t;
       idr_pic_id           :T_uint16_t;
       primary_pic_type     :T_StdVideoH264PictureType;
       frame_num            :T_uint32_t;
       PicOrderCnt          :T_int32_t;
       temporal_id          :T_uint8_t;
       reserved1            :array [ 0..2 ] of T_uint8_t;
       pRefLists            :P_StdVideoEncodeH264ReferenceListsInfo;
     end;
     P_StdVideoEncodeH264PictureInfo = ^T_StdVideoEncodeH264PictureInfo;

type T_StdVideoEncodeH264ReferenceInfo = record
       flags               :T_StdVideoEncodeH264ReferenceInfoFlags;
       primary_pic_type    :T_StdVideoH264PictureType;
       FrameNum            :T_uint32_t;
       PicOrderCnt         :T_int32_t;
       long_term_pic_num   :T_uint16_t;
       long_term_frame_idx :T_uint16_t;
       temporal_id         :T_uint8_t;
     end;
     P_StdVideoEncodeH264ReferenceInfo = ^T_StdVideoEncodeH264ReferenceInfo;

type T_StdVideoEncodeH264SliceHeader = record
       flags                         :T_StdVideoEncodeH264SliceHeaderFlags;
       first_mb_in_slice             :T_uint32_t;
       slice_type                    :T_StdVideoH264SliceType;
       slice_alpha_c0_offset_div2    :T_int8_t;
       slice_beta_offset_div2        :T_int8_t;
       slice_qp_delta                :T_int8_t;
       reserved1                     :T_uint8_t;
       cabac_init_idc                :T_StdVideoH264CabacInitIdc;
       disable_deblocking_filter_idc :T_StdVideoH264DisableDeblockingFilterIdc;
       pWeightTable                  :P_StdVideoEncodeH264WeightTable;
     end;
     P_StdVideoEncodeH264SliceHeader = ^T_StdVideoEncodeH264SliceHeader;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoEncodeH264SliceHeaderFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeH264SliceHeaderFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoEncodeH264PictureInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeH264PictureInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoEncodeH264ReferenceInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeH264ReferenceInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoEncodeH264ReferenceListsInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoEncodeH264ReferenceListsInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
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
