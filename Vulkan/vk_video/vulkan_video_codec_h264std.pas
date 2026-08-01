unit vulkan_video_codec_h264std;

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
     vulkan_video_codecs_common;

//#ifndef VULKAN_VIDEO_CODEC_H264STD_H_
const VULKAN_VIDEO_CODEC_H264STD_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_h264std is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_h264std 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codecs_common.h"
const STD_VIDEO_H264_CPB_CNT_LIST_SIZE             = 32;
const STD_VIDEO_H264_SCALING_LIST_4X4_NUM_LISTS    = 6;
const STD_VIDEO_H264_SCALING_LIST_4X4_NUM_ELEMENTS = 16;
const STD_VIDEO_H264_SCALING_LIST_8X8_NUM_LISTS    = 6;
const STD_VIDEO_H264_SCALING_LIST_8X8_NUM_ELEMENTS = 64;
const STD_VIDEO_H264_MAX_NUM_LIST_REF              = 32;
const STD_VIDEO_H264_MAX_CHROMA_PLANES             = 2;
const STD_VIDEO_H264_NO_REFERENCE_PICTURE          = $FF;

//typedef enum StdVideoH264ChromaFormatIdc {
type T_StdVideoH264ChromaFormatIdc = T_int32_t;  P_StdVideoH264ChromaFormatIdc = ^T_StdVideoH264ChromaFormatIdc;
const STD_VIDEO_H264_CHROMA_FORMAT_IDC_MONOCHROME = 0;
const STD_VIDEO_H264_CHROMA_FORMAT_IDC_420        = 1;
const STD_VIDEO_H264_CHROMA_FORMAT_IDC_422        = 2;
const STD_VIDEO_H264_CHROMA_FORMAT_IDC_444        = 3;
const STD_VIDEO_H264_CHROMA_FORMAT_IDC_INVALID    = $7FFFFFFF;
const STD_VIDEO_H264_CHROMA_FORMAT_IDC_MAX_ENUM   = $7FFFFFFF;
//} StdVideoH264ChromaFormatIdc;

//typedef enum StdVideoH264ProfileIdc {
type T_StdVideoH264ProfileIdc = T_int32_t;  P_StdVideoH264ProfileIdc = ^T_StdVideoH264ProfileIdc;
const STD_VIDEO_H264_PROFILE_IDC_BASELINE            = 66;
const STD_VIDEO_H264_PROFILE_IDC_MAIN                = 77;
const STD_VIDEO_H264_PROFILE_IDC_HIGH                = 100;
const STD_VIDEO_H264_PROFILE_IDC_HIGH_10             = 110;
const STD_VIDEO_H264_PROFILE_IDC_HIGH_422            = 122;
const STD_VIDEO_H264_PROFILE_IDC_HIGH_444_PREDICTIVE = 244;
const STD_VIDEO_H264_PROFILE_IDC_INVALID             = $7FFFFFFF;
const STD_VIDEO_H264_PROFILE_IDC_MAX_ENUM            = $7FFFFFFF;
//} StdVideoH264ProfileIdc;

//typedef enum StdVideoH264LevelIdc {
type T_StdVideoH264LevelIdc = T_int32_t;  P_StdVideoH264LevelIdc = ^T_StdVideoH264LevelIdc;
const STD_VIDEO_H264_LEVEL_IDC_1_0      = 0;
const STD_VIDEO_H264_LEVEL_IDC_1_1      = 1;
const STD_VIDEO_H264_LEVEL_IDC_1_2      = 2;
const STD_VIDEO_H264_LEVEL_IDC_1_3      = 3;
const STD_VIDEO_H264_LEVEL_IDC_2_0      = 4;
const STD_VIDEO_H264_LEVEL_IDC_2_1      = 5;
const STD_VIDEO_H264_LEVEL_IDC_2_2      = 6;
const STD_VIDEO_H264_LEVEL_IDC_3_0      = 7;
const STD_VIDEO_H264_LEVEL_IDC_3_1      = 8;
const STD_VIDEO_H264_LEVEL_IDC_3_2      = 9;
const STD_VIDEO_H264_LEVEL_IDC_4_0      = 10;
const STD_VIDEO_H264_LEVEL_IDC_4_1      = 11;
const STD_VIDEO_H264_LEVEL_IDC_4_2      = 12;
const STD_VIDEO_H264_LEVEL_IDC_5_0      = 13;
const STD_VIDEO_H264_LEVEL_IDC_5_1      = 14;
const STD_VIDEO_H264_LEVEL_IDC_5_2      = 15;
const STD_VIDEO_H264_LEVEL_IDC_6_0      = 16;
const STD_VIDEO_H264_LEVEL_IDC_6_1      = 17;
const STD_VIDEO_H264_LEVEL_IDC_6_2      = 18;
const STD_VIDEO_H264_LEVEL_IDC_INVALID  = $7FFFFFFF;
const STD_VIDEO_H264_LEVEL_IDC_MAX_ENUM = $7FFFFFFF;
//} StdVideoH264LevelIdc;

//typedef enum StdVideoH264PocType {
type T_StdVideoH264PocType = T_int32_t;  P_StdVideoH264PocType = ^T_StdVideoH264PocType;
const STD_VIDEO_H264_POC_TYPE_0        = 0;
const STD_VIDEO_H264_POC_TYPE_1        = 1;
const STD_VIDEO_H264_POC_TYPE_2        = 2;
const STD_VIDEO_H264_POC_TYPE_INVALID  = $7FFFFFFF;
const STD_VIDEO_H264_POC_TYPE_MAX_ENUM = $7FFFFFFF;
//} StdVideoH264PocType;

//typedef enum StdVideoH264AspectRatioIdc {
type T_StdVideoH264AspectRatioIdc = T_int32_t;  P_StdVideoH264AspectRatioIdc = ^T_StdVideoH264AspectRatioIdc;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_UNSPECIFIED  = 0;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_SQUARE       = 1;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_12_11        = 2;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_10_11        = 3;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_16_11        = 4;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_40_33        = 5;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_24_11        = 6;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_20_11        = 7;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_32_11        = 8;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_80_33        = 9;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_18_11        = 10;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_15_11        = 11;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_64_33        = 12;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_160_99       = 13;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_4_3          = 14;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_3_2          = 15;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_2_1          = 16;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_EXTENDED_SAR = 255;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_INVALID      = $7FFFFFFF;
const STD_VIDEO_H264_ASPECT_RATIO_IDC_MAX_ENUM     = $7FFFFFFF;
//} StdVideoH264AspectRatioIdc;

//typedef enum StdVideoH264WeightedBipredIdc {
type T_StdVideoH264WeightedBipredIdc = T_int32_t;  P_StdVideoH264WeightedBipredIdc = ^T_StdVideoH264WeightedBipredIdc;
const STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_DEFAULT  = 0;
const STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_EXPLICIT = 1;
const STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_IMPLICIT = 2;
const STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_INVALID  = $7FFFFFFF;
const STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_MAX_ENUM = $7FFFFFFF;
//} StdVideoH264WeightedBipredIdc;

//typedef enum StdVideoH264ModificationOfPicNumsIdc {
type T_StdVideoH264ModificationOfPicNumsIdc = T_int32_t;  P_StdVideoH264ModificationOfPicNumsIdc = ^T_StdVideoH264ModificationOfPicNumsIdc;
const STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_SHORT_TERM_SUBTRACT = 0;
const STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_SHORT_TERM_ADD      = 1;
const STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_LONG_TERM           = 2;
const STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_END                 = 3;
const STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_INVALID             = $7FFFFFFF;
const STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_MAX_ENUM            = $7FFFFFFF;
//} StdVideoH264ModificationOfPicNumsIdc;

//typedef enum StdVideoH264MemMgmtControlOp {
type T_StdVideoH264MemMgmtControlOp = T_int32_t;  P_StdVideoH264MemMgmtControlOp = ^T_StdVideoH264MemMgmtControlOp;
const STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_END                       = 0;
const STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_SHORT_TERM         = 1;
const STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_LONG_TERM          = 2;
const STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MARK_LONG_TERM            = 3;
const STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_SET_MAX_LONG_TERM_INDEX   = 4;
const STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_ALL                = 5;
const STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MARK_CURRENT_AS_LONG_TERM = 6;
const STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_INVALID                   = $7FFFFFFF;
const STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MAX_ENUM                  = $7FFFFFFF;
//} StdVideoH264MemMgmtControlOp;

//typedef enum StdVideoH264CabacInitIdc {
type T_StdVideoH264CabacInitIdc = T_int32_t;  P_StdVideoH264CabacInitIdc = ^T_StdVideoH264CabacInitIdc;
const STD_VIDEO_H264_CABAC_INIT_IDC_0        = 0;
const STD_VIDEO_H264_CABAC_INIT_IDC_1        = 1;
const STD_VIDEO_H264_CABAC_INIT_IDC_2        = 2;
const STD_VIDEO_H264_CABAC_INIT_IDC_INVALID  = $7FFFFFFF;
const STD_VIDEO_H264_CABAC_INIT_IDC_MAX_ENUM = $7FFFFFFF;
//} StdVideoH264CabacInitIdc;

//typedef enum StdVideoH264DisableDeblockingFilterIdc {
type T_StdVideoH264DisableDeblockingFilterIdc = T_int32_t;  P_StdVideoH264DisableDeblockingFilterIdc = ^T_StdVideoH264DisableDeblockingFilterIdc;
const STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_DISABLED = 0;
const STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_ENABLED  = 1;
const STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_PARTIAL  = 2;
const STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_INVALID  = $7FFFFFFF;
const STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_MAX_ENUM = $7FFFFFFF;
//} StdVideoH264DisableDeblockingFilterIdc;

//typedef enum StdVideoH264SliceType {
type T_StdVideoH264SliceType = T_int32_t;  P_StdVideoH264SliceType = ^T_StdVideoH264SliceType;
const STD_VIDEO_H264_SLICE_TYPE_P        = 0;
const STD_VIDEO_H264_SLICE_TYPE_B        = 1;
const STD_VIDEO_H264_SLICE_TYPE_I        = 2;
const STD_VIDEO_H264_SLICE_TYPE_INVALID  = $7FFFFFFF;
const STD_VIDEO_H264_SLICE_TYPE_MAX_ENUM = $7FFFFFFF;
//} StdVideoH264SliceType;

//typedef enum StdVideoH264PictureType {
type T_StdVideoH264PictureType = T_int32_t;  P_StdVideoH264PictureType = ^T_StdVideoH264PictureType;
const STD_VIDEO_H264_PICTURE_TYPE_P        = 0;
const STD_VIDEO_H264_PICTURE_TYPE_B        = 1;
const STD_VIDEO_H264_PICTURE_TYPE_I        = 2;
const STD_VIDEO_H264_PICTURE_TYPE_IDR      = 5;
const STD_VIDEO_H264_PICTURE_TYPE_INVALID  = $7FFFFFFF;
const STD_VIDEO_H264_PICTURE_TYPE_MAX_ENUM = $7FFFFFFF;
//} StdVideoH264PictureType;

//typedef enum StdVideoH264NonVclNaluType {
type T_StdVideoH264NonVclNaluType = T_int32_t;  P_StdVideoH264NonVclNaluType = ^T_StdVideoH264NonVclNaluType;
const STD_VIDEO_H264_NON_VCL_NALU_TYPE_SPS             = 0;
const STD_VIDEO_H264_NON_VCL_NALU_TYPE_PPS             = 1;
const STD_VIDEO_H264_NON_VCL_NALU_TYPE_AUD             = 2;
const STD_VIDEO_H264_NON_VCL_NALU_TYPE_PREFIX          = 3;
const STD_VIDEO_H264_NON_VCL_NALU_TYPE_END_OF_SEQUENCE = 4;
const STD_VIDEO_H264_NON_VCL_NALU_TYPE_END_OF_STREAM   = 5;
const STD_VIDEO_H264_NON_VCL_NALU_TYPE_PRECODED        = 6;
const STD_VIDEO_H264_NON_VCL_NALU_TYPE_INVALID         = $7FFFFFFF;
const STD_VIDEO_H264_NON_VCL_NALU_TYPE_MAX_ENUM        = $7FFFFFFF;
//} StdVideoH264NonVclNaluType;
type T_StdVideoH264SpsVuiFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property aspect_ratio_info_present_flag  :T_uint32_t index $000001 read GetBits write SetBits;
       property overscan_info_present_flag      :T_uint32_t index $000101 read GetBits write SetBits;
       property overscan_appropriate_flag       :T_uint32_t index $000201 read GetBits write SetBits;
       property video_signal_type_present_flag  :T_uint32_t index $000301 read GetBits write SetBits;
       property video_full_range_flag           :T_uint32_t index $000401 read GetBits write SetBits;
       property color_description_present_flag  :T_uint32_t index $000501 read GetBits write SetBits;
       property chroma_loc_info_present_flag    :T_uint32_t index $000601 read GetBits write SetBits;
       property timing_info_present_flag        :T_uint32_t index $000701 read GetBits write SetBits;
       property fixed_frame_rate_flag           :T_uint32_t index $000801 read GetBits write SetBits;
       property bitstream_restriction_flag      :T_uint32_t index $000901 read GetBits write SetBits;
       property nal_hrd_parameters_present_flag :T_uint32_t index $000A01 read GetBits write SetBits;
       property vcl_hrd_parameters_present_flag :T_uint32_t index $000B01 read GetBits write SetBits;
     end;
     P_StdVideoH264SpsVuiFlags = ^T_StdVideoH264SpsVuiFlags;

type T_StdVideoH264HrdParameters = record
       cpb_cnt_minus1                          :T_uint8_t;
       bit_rate_scale                          :T_uint8_t;
       cpb_size_scale                          :T_uint8_t;
       reserved1                               :T_uint8_t;
       bit_rate_value_minus1                   :array [ 0..STD_VIDEO_H264_CPB_CNT_LIST_SIZE-1 ] of T_uint32_t;
       cpb_size_value_minus1                   :array [ 0..STD_VIDEO_H264_CPB_CNT_LIST_SIZE-1 ] of T_uint32_t;
       cbr_flag                                :array [ 0..STD_VIDEO_H264_CPB_CNT_LIST_SIZE-1 ] of T_uint8_t;
       initial_cpb_removal_delay_length_minus1 :T_uint32_t;
       cpb_removal_delay_length_minus1         :T_uint32_t;
       dpb_output_delay_length_minus1          :T_uint32_t;
       time_offset_length                      :T_uint32_t;
     end;
     P_StdVideoH264HrdParameters = ^T_StdVideoH264HrdParameters;

type T_StdVideoH264SequenceParameterSetVui = record
       flags                               :T_StdVideoH264SpsVuiFlags;
       aspect_ratio_idc                    :T_StdVideoH264AspectRatioIdc;
       sar_width                           :T_uint16_t;
       sar_height                          :T_uint16_t;
       video_format                        :T_uint8_t;
       colour_primaries                    :T_uint8_t;
       transfer_characteristics            :T_uint8_t;
       matrix_coefficients                 :T_uint8_t;
       num_units_in_tick                   :T_uint32_t;
       time_scale                          :T_uint32_t;
       max_num_reorder_frames              :T_uint8_t;
       max_dec_frame_buffering             :T_uint8_t;
       chroma_sample_loc_type_top_field    :T_uint8_t;
       chroma_sample_loc_type_bottom_field :T_uint8_t;
       reserved1                           :T_uint32_t;
       pHrdParameters                      :P_StdVideoH264HrdParameters;
     end;
     P_StdVideoH264SequenceParameterSetVui = ^T_StdVideoH264SequenceParameterSetVui;

type T_StdVideoH264SpsFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property constraint_set0_flag                 :T_uint32_t index $000001 read GetBits write SetBits;
       property constraint_set1_flag                 :T_uint32_t index $000101 read GetBits write SetBits;
       property constraint_set2_flag                 :T_uint32_t index $000201 read GetBits write SetBits;
       property constraint_set3_flag                 :T_uint32_t index $000301 read GetBits write SetBits;
       property constraint_set4_flag                 :T_uint32_t index $000401 read GetBits write SetBits;
       property constraint_set5_flag                 :T_uint32_t index $000501 read GetBits write SetBits;
       property direct_8x8_inference_flag            :T_uint32_t index $000601 read GetBits write SetBits;
       property mb_adaptive_frame_field_flag         :T_uint32_t index $000701 read GetBits write SetBits;
       property frame_mbs_only_flag                  :T_uint32_t index $000801 read GetBits write SetBits;
       property delta_pic_order_always_zero_flag     :T_uint32_t index $000901 read GetBits write SetBits;
       property separate_colour_plane_flag           :T_uint32_t index $000A01 read GetBits write SetBits;
       property gaps_in_frame_num_value_allowed_flag :T_uint32_t index $000B01 read GetBits write SetBits;
       property qpprime_y_zero_transform_bypass_flag :T_uint32_t index $000C01 read GetBits write SetBits;
       property frame_cropping_flag                  :T_uint32_t index $000D01 read GetBits write SetBits;
       property seq_scaling_matrix_present_flag      :T_uint32_t index $000E01 read GetBits write SetBits;
       property vui_parameters_present_flag          :T_uint32_t index $000F01 read GetBits write SetBits;
     end;
     P_StdVideoH264SpsFlags = ^T_StdVideoH264SpsFlags;

type T_StdVideoH264ScalingLists = record
       scaling_list_present_mask       :T_uint16_t;
       use_default_scaling_matrix_mask :T_uint16_t;
       ScalingList4x4                  :array [ 0..STD_VIDEO_H264_SCALING_LIST_4X4_NUM_LISTS-1 ] of array [ 0..STD_VIDEO_H264_SCALING_LIST_4X4_NUM_ELEMENTS-1 ] of T_uint8_t;
       ScalingList8x8                  :array [ 0..STD_VIDEO_H264_SCALING_LIST_8X8_NUM_LISTS-1 ] of array [ 0..STD_VIDEO_H264_SCALING_LIST_8X8_NUM_ELEMENTS-1 ] of T_uint8_t;
     end;
     P_StdVideoH264ScalingLists = ^T_StdVideoH264ScalingLists;

type T_StdVideoH264SequenceParameterSet = record
       flags                                 :T_StdVideoH264SpsFlags;
       profile_idc                           :T_StdVideoH264ProfileIdc;
       level_idc                             :T_StdVideoH264LevelIdc;
       chroma_format_idc                     :T_StdVideoH264ChromaFormatIdc;
       seq_parameter_set_id                  :T_uint8_t;
       bit_depth_luma_minus8                 :T_uint8_t;
       bit_depth_chroma_minus8               :T_uint8_t;
       log2_max_frame_num_minus4             :T_uint8_t;
       pic_order_cnt_type                    :T_StdVideoH264PocType;
       offset_for_non_ref_pic                :T_int32_t;
       offset_for_top_to_bottom_field        :T_int32_t;
       log2_max_pic_order_cnt_lsb_minus4     :T_uint8_t;
       num_ref_frames_in_pic_order_cnt_cycle :T_uint8_t;
       max_num_ref_frames                    :T_uint8_t;
       reserved1                             :T_uint8_t;
       pic_width_in_mbs_minus1               :T_uint32_t;
       pic_height_in_map_units_minus1        :T_uint32_t;
       frame_crop_left_offset                :T_uint32_t;
       frame_crop_right_offset               :T_uint32_t;
       frame_crop_top_offset                 :T_uint32_t;
       frame_crop_bottom_offset              :T_uint32_t;
       reserved2                             :T_uint32_t;
       pOffsetForRefFrame                    :P_int32_t;
       pScalingLists                         :P_StdVideoH264ScalingLists;
       pSequenceParameterSetVui              :P_StdVideoH264SequenceParameterSetVui;
     end;
     P_StdVideoH264SequenceParameterSet = ^T_StdVideoH264SequenceParameterSet;

type T_StdVideoH264PpsFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property transform_8x8_mode_flag                      :T_uint32_t index $000001 read GetBits write SetBits;
       property redundant_pic_cnt_present_flag               :T_uint32_t index $000101 read GetBits write SetBits;
       property constrained_intra_pred_flag                  :T_uint32_t index $000201 read GetBits write SetBits;
       property deblocking_filter_control_present_flag       :T_uint32_t index $000301 read GetBits write SetBits;
       property weighted_pred_flag                           :T_uint32_t index $000401 read GetBits write SetBits;
       property bottom_field_pic_order_in_frame_present_flag :T_uint32_t index $000501 read GetBits write SetBits;
       property entropy_coding_mode_flag                     :T_uint32_t index $000601 read GetBits write SetBits;
       property pic_scaling_matrix_present_flag              :T_uint32_t index $000701 read GetBits write SetBits;
     end;
     P_StdVideoH264PpsFlags = ^T_StdVideoH264PpsFlags;

type T_StdVideoH264PictureParameterSet = record
       flags                                :T_StdVideoH264PpsFlags;
       seq_parameter_set_id                 :T_uint8_t;
       pic_parameter_set_id                 :T_uint8_t;
       num_ref_idx_l0_default_active_minus1 :T_uint8_t;
       num_ref_idx_l1_default_active_minus1 :T_uint8_t;
       weighted_bipred_idc                  :T_StdVideoH264WeightedBipredIdc;
       pic_init_qp_minus26                  :T_int8_t;
       pic_init_qs_minus26                  :T_int8_t;
       chroma_qp_index_offset               :T_int8_t;
       second_chroma_qp_index_offset        :T_int8_t;
       pScalingLists                        :P_StdVideoH264ScalingLists;
     end;
     P_StdVideoH264PictureParameterSet = ^T_StdVideoH264PictureParameterSet;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoH264SpsVuiFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoH264SpsVuiFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoH264SpsFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoH264SpsFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoH264PpsFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoH264PpsFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
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
