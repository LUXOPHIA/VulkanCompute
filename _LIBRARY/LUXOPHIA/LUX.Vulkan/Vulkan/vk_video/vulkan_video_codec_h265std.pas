unit vulkan_video_codec_h265std;

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

//#ifndef VULKAN_VIDEO_CODEC_H265STD_H_
const VULKAN_VIDEO_CODEC_H265STD_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_h265std is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_h265std 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codecs_common.h"
const STD_VIDEO_H265_CPB_CNT_LIST_SIZE                        = 32;
const STD_VIDEO_H265_SUBLAYERS_LIST_SIZE                      = 7;
const STD_VIDEO_H265_SCALING_LIST_4X4_NUM_LISTS               = 6;
const STD_VIDEO_H265_SCALING_LIST_4X4_NUM_ELEMENTS            = 16;
const STD_VIDEO_H265_SCALING_LIST_8X8_NUM_LISTS               = 6;
const STD_VIDEO_H265_SCALING_LIST_8X8_NUM_ELEMENTS            = 64;
const STD_VIDEO_H265_SCALING_LIST_16X16_NUM_LISTS             = 6;
const STD_VIDEO_H265_SCALING_LIST_16X16_NUM_ELEMENTS          = 64;
const STD_VIDEO_H265_SCALING_LIST_32X32_NUM_LISTS             = 2;
const STD_VIDEO_H265_SCALING_LIST_32X32_NUM_ELEMENTS          = 64;
const STD_VIDEO_H265_CHROMA_QP_OFFSET_LIST_SIZE               = 6;
const STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_COLS_LIST_SIZE     = 19;
const STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_ROWS_LIST_SIZE     = 21;
const STD_VIDEO_H265_PREDICTOR_PALETTE_COMPONENTS_LIST_SIZE   = 3;
const STD_VIDEO_H265_PREDICTOR_PALETTE_COMP_ENTRIES_LIST_SIZE = 128;
const STD_VIDEO_H265_MAX_NUM_LIST_REF                         = 15;
const STD_VIDEO_H265_MAX_CHROMA_PLANES                        = 2;
const STD_VIDEO_H265_MAX_SHORT_TERM_REF_PIC_SETS              = 64;
const STD_VIDEO_H265_MAX_DPB_SIZE                             = 16;
const STD_VIDEO_H265_MAX_LONG_TERM_REF_PICS_SPS               = 32;
const STD_VIDEO_H265_MAX_LONG_TERM_PICS                       = 16;
const STD_VIDEO_H265_MAX_DELTA_POC                            = 48;
const STD_VIDEO_H265_NO_REFERENCE_PICTURE                     = $FF;

//typedef enum StdVideoH265ChromaFormatIdc {
type T_StdVideoH265ChromaFormatIdc = T_int32_t;  P_StdVideoH265ChromaFormatIdc = ^T_StdVideoH265ChromaFormatIdc;
const STD_VIDEO_H265_CHROMA_FORMAT_IDC_MONOCHROME = 0;
const STD_VIDEO_H265_CHROMA_FORMAT_IDC_420        = 1;
const STD_VIDEO_H265_CHROMA_FORMAT_IDC_422        = 2;
const STD_VIDEO_H265_CHROMA_FORMAT_IDC_444        = 3;
const STD_VIDEO_H265_CHROMA_FORMAT_IDC_INVALID    = $7FFFFFFF;
const STD_VIDEO_H265_CHROMA_FORMAT_IDC_MAX_ENUM   = $7FFFFFFF;
//} StdVideoH265ChromaFormatIdc;

//typedef enum StdVideoH265ProfileIdc {
type T_StdVideoH265ProfileIdc = T_int32_t;  P_StdVideoH265ProfileIdc = ^T_StdVideoH265ProfileIdc;
const STD_VIDEO_H265_PROFILE_IDC_MAIN                    = 1;
const STD_VIDEO_H265_PROFILE_IDC_MAIN_10                 = 2;
const STD_VIDEO_H265_PROFILE_IDC_MAIN_STILL_PICTURE      = 3;
const STD_VIDEO_H265_PROFILE_IDC_FORMAT_RANGE_EXTENSIONS = 4;
const STD_VIDEO_H265_PROFILE_IDC_SCC_EXTENSIONS          = 9;
const STD_VIDEO_H265_PROFILE_IDC_INVALID                 = $7FFFFFFF;
const STD_VIDEO_H265_PROFILE_IDC_MAX_ENUM                = $7FFFFFFF;
//} StdVideoH265ProfileIdc;

//typedef enum StdVideoH265LevelIdc {
type T_StdVideoH265LevelIdc = T_int32_t;  P_StdVideoH265LevelIdc = ^T_StdVideoH265LevelIdc;
const STD_VIDEO_H265_LEVEL_IDC_1_0      = 0;
const STD_VIDEO_H265_LEVEL_IDC_2_0      = 1;
const STD_VIDEO_H265_LEVEL_IDC_2_1      = 2;
const STD_VIDEO_H265_LEVEL_IDC_3_0      = 3;
const STD_VIDEO_H265_LEVEL_IDC_3_1      = 4;
const STD_VIDEO_H265_LEVEL_IDC_4_0      = 5;
const STD_VIDEO_H265_LEVEL_IDC_4_1      = 6;
const STD_VIDEO_H265_LEVEL_IDC_5_0      = 7;
const STD_VIDEO_H265_LEVEL_IDC_5_1      = 8;
const STD_VIDEO_H265_LEVEL_IDC_5_2      = 9;
const STD_VIDEO_H265_LEVEL_IDC_6_0      = 10;
const STD_VIDEO_H265_LEVEL_IDC_6_1      = 11;
const STD_VIDEO_H265_LEVEL_IDC_6_2      = 12;
const STD_VIDEO_H265_LEVEL_IDC_INVALID  = $7FFFFFFF;
const STD_VIDEO_H265_LEVEL_IDC_MAX_ENUM = $7FFFFFFF;
//} StdVideoH265LevelIdc;

//typedef enum StdVideoH265SliceType {
type T_StdVideoH265SliceType = T_int32_t;  P_StdVideoH265SliceType = ^T_StdVideoH265SliceType;
const STD_VIDEO_H265_SLICE_TYPE_B        = 0;
const STD_VIDEO_H265_SLICE_TYPE_P        = 1;
const STD_VIDEO_H265_SLICE_TYPE_I        = 2;
const STD_VIDEO_H265_SLICE_TYPE_INVALID  = $7FFFFFFF;
const STD_VIDEO_H265_SLICE_TYPE_MAX_ENUM = $7FFFFFFF;
//} StdVideoH265SliceType;

//typedef enum StdVideoH265PictureType {
type T_StdVideoH265PictureType = T_int32_t;  P_StdVideoH265PictureType = ^T_StdVideoH265PictureType;
const STD_VIDEO_H265_PICTURE_TYPE_P        = 0;
const STD_VIDEO_H265_PICTURE_TYPE_B        = 1;
const STD_VIDEO_H265_PICTURE_TYPE_I        = 2;
const STD_VIDEO_H265_PICTURE_TYPE_IDR      = 3;
const STD_VIDEO_H265_PICTURE_TYPE_INVALID  = $7FFFFFFF;
const STD_VIDEO_H265_PICTURE_TYPE_MAX_ENUM = $7FFFFFFF;
//} StdVideoH265PictureType;

//typedef enum StdVideoH265AspectRatioIdc {
type T_StdVideoH265AspectRatioIdc = T_int32_t;  P_StdVideoH265AspectRatioIdc = ^T_StdVideoH265AspectRatioIdc;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_UNSPECIFIED  = 0;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_SQUARE       = 1;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_12_11        = 2;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_10_11        = 3;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_16_11        = 4;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_40_33        = 5;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_24_11        = 6;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_20_11        = 7;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_32_11        = 8;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_80_33        = 9;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_18_11        = 10;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_15_11        = 11;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_64_33        = 12;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_160_99       = 13;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_4_3          = 14;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_3_2          = 15;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_2_1          = 16;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_EXTENDED_SAR = 255;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_INVALID      = $7FFFFFFF;
const STD_VIDEO_H265_ASPECT_RATIO_IDC_MAX_ENUM     = $7FFFFFFF;
//} StdVideoH265AspectRatioIdc;
type T_StdVideoH265DecPicBufMgr = record
       max_latency_increase_plus1   :array [ 0..STD_VIDEO_H265_SUBLAYERS_LIST_SIZE-1 ] of T_uint32_t;
       max_dec_pic_buffering_minus1 :array [ 0..STD_VIDEO_H265_SUBLAYERS_LIST_SIZE-1 ] of T_uint8_t;
       max_num_reorder_pics         :array [ 0..STD_VIDEO_H265_SUBLAYERS_LIST_SIZE-1 ] of T_uint8_t;
     end;
     P_StdVideoH265DecPicBufMgr = ^T_StdVideoH265DecPicBufMgr;

type T_StdVideoH265SubLayerHrdParameters = record
       bit_rate_value_minus1    :array [ 0..STD_VIDEO_H265_CPB_CNT_LIST_SIZE-1 ] of T_uint32_t;
       cpb_size_value_minus1    :array [ 0..STD_VIDEO_H265_CPB_CNT_LIST_SIZE-1 ] of T_uint32_t;
       cpb_size_du_value_minus1 :array [ 0..STD_VIDEO_H265_CPB_CNT_LIST_SIZE-1 ] of T_uint32_t;
       bit_rate_du_value_minus1 :array [ 0..STD_VIDEO_H265_CPB_CNT_LIST_SIZE-1 ] of T_uint32_t;
       cbr_flag                 :T_uint32_t;
     end;
     P_StdVideoH265SubLayerHrdParameters = ^T_StdVideoH265SubLayerHrdParameters;

type T_StdVideoH265HrdFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property nal_hrd_parameters_present_flag           :T_uint32_t index $000001 read GetBits write SetBits;
       property vcl_hrd_parameters_present_flag           :T_uint32_t index $000101 read GetBits write SetBits;
       property sub_pic_hrd_params_present_flag           :T_uint32_t index $000201 read GetBits write SetBits;
       property sub_pic_cpb_params_in_pic_timing_sei_flag :T_uint32_t index $000301 read GetBits write SetBits;
       property fixed_pic_rate_general_flag               :T_uint32_t index $000408 read GetBits write SetBits;
       property fixed_pic_rate_within_cvs_flag            :T_uint32_t index $000C08 read GetBits write SetBits;
       property low_delay_hrd_flag                        :T_uint32_t index $001408 read GetBits write SetBits;
     end;
     P_StdVideoH265HrdFlags = ^T_StdVideoH265HrdFlags;

type T_StdVideoH265HrdParameters = record
       flags                                        :T_StdVideoH265HrdFlags;
       tick_divisor_minus2                          :T_uint8_t;
       du_cpb_removal_delay_increment_length_minus1 :T_uint8_t;
       dpb_output_delay_du_length_minus1            :T_uint8_t;
       bit_rate_scale                               :T_uint8_t;
       cpb_size_scale                               :T_uint8_t;
       cpb_size_du_scale                            :T_uint8_t;
       initial_cpb_removal_delay_length_minus1      :T_uint8_t;
       au_cpb_removal_delay_length_minus1           :T_uint8_t;
       dpb_output_delay_length_minus1               :T_uint8_t;
       cpb_cnt_minus1                               :array [ 0..STD_VIDEO_H265_SUBLAYERS_LIST_SIZE-1 ] of T_uint8_t;
       elemental_duration_in_tc_minus1              :array [ 0..STD_VIDEO_H265_SUBLAYERS_LIST_SIZE-1 ] of T_uint16_t;
       reserved                                     :array [ 0..2 ] of T_uint16_t;
       pSubLayerHrdParametersNal                    :P_StdVideoH265SubLayerHrdParameters;
       pSubLayerHrdParametersVcl                    :P_StdVideoH265SubLayerHrdParameters;
     end;
     P_StdVideoH265HrdParameters = ^T_StdVideoH265HrdParameters;

type T_StdVideoH265VpsFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property vps_temporal_id_nesting_flag             :T_uint32_t index $000001 read GetBits write SetBits;
       property vps_sub_layer_ordering_info_present_flag :T_uint32_t index $000101 read GetBits write SetBits;
       property vps_timing_info_present_flag             :T_uint32_t index $000201 read GetBits write SetBits;
       property vps_poc_proportional_to_timing_flag      :T_uint32_t index $000301 read GetBits write SetBits;
     end;
     P_StdVideoH265VpsFlags = ^T_StdVideoH265VpsFlags;

type T_StdVideoH265ProfileTierLevelFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property general_tier_flag                  :T_uint32_t index $000001 read GetBits write SetBits;
       property general_progressive_source_flag    :T_uint32_t index $000101 read GetBits write SetBits;
       property general_interlaced_source_flag     :T_uint32_t index $000201 read GetBits write SetBits;
       property general_non_packed_constraint_flag :T_uint32_t index $000301 read GetBits write SetBits;
       property general_frame_only_constraint_flag :T_uint32_t index $000401 read GetBits write SetBits;
     end;
     P_StdVideoH265ProfileTierLevelFlags = ^T_StdVideoH265ProfileTierLevelFlags;

type T_StdVideoH265ProfileTierLevel = record
       flags               :T_StdVideoH265ProfileTierLevelFlags;
       general_profile_idc :T_StdVideoH265ProfileIdc;
       general_level_idc   :T_StdVideoH265LevelIdc;
     end;
     P_StdVideoH265ProfileTierLevel = ^T_StdVideoH265ProfileTierLevel;

type T_StdVideoH265VideoParameterSet = record
       flags                             :T_StdVideoH265VpsFlags;
       vps_video_parameter_set_id        :T_uint8_t;
       vps_max_sub_layers_minus1         :T_uint8_t;
       reserved1                         :T_uint8_t;
       reserved2                         :T_uint8_t;
       vps_num_units_in_tick             :T_uint32_t;
       vps_time_scale                    :T_uint32_t;
       vps_num_ticks_poc_diff_one_minus1 :T_uint32_t;
       reserved3                         :T_uint32_t;
       pDecPicBufMgr                     :P_StdVideoH265DecPicBufMgr;
       pHrdParameters                    :P_StdVideoH265HrdParameters;
       pProfileTierLevel                 :P_StdVideoH265ProfileTierLevel;
     end;
     P_StdVideoH265VideoParameterSet = ^T_StdVideoH265VideoParameterSet;

type T_StdVideoH265ScalingLists = record
       ScalingList4x4         :array [ 0..STD_VIDEO_H265_SCALING_LIST_4X4_NUM_LISTS-1 ] of array [ 0..STD_VIDEO_H265_SCALING_LIST_4X4_NUM_ELEMENTS-1 ] of T_uint8_t;
       ScalingList8x8         :array [ 0..STD_VIDEO_H265_SCALING_LIST_8X8_NUM_LISTS-1 ] of array [ 0..STD_VIDEO_H265_SCALING_LIST_8X8_NUM_ELEMENTS-1 ] of T_uint8_t;
       ScalingList16x16       :array [ 0..STD_VIDEO_H265_SCALING_LIST_16X16_NUM_LISTS-1 ] of array [ 0..STD_VIDEO_H265_SCALING_LIST_16X16_NUM_ELEMENTS-1 ] of T_uint8_t;
       ScalingList32x32       :array [ 0..STD_VIDEO_H265_SCALING_LIST_32X32_NUM_LISTS-1 ] of array [ 0..STD_VIDEO_H265_SCALING_LIST_32X32_NUM_ELEMENTS-1 ] of T_uint8_t;
       ScalingListDCCoef16x16 :array [ 0..STD_VIDEO_H265_SCALING_LIST_16X16_NUM_LISTS-1 ] of T_uint8_t;
       ScalingListDCCoef32x32 :array [ 0..STD_VIDEO_H265_SCALING_LIST_32X32_NUM_LISTS-1 ] of T_uint8_t;
     end;
     P_StdVideoH265ScalingLists = ^T_StdVideoH265ScalingLists;

type T_StdVideoH265SpsVuiFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property aspect_ratio_info_present_flag          :T_uint32_t index $000001 read GetBits write SetBits;
       property overscan_info_present_flag              :T_uint32_t index $000101 read GetBits write SetBits;
       property overscan_appropriate_flag               :T_uint32_t index $000201 read GetBits write SetBits;
       property video_signal_type_present_flag          :T_uint32_t index $000301 read GetBits write SetBits;
       property video_full_range_flag                   :T_uint32_t index $000401 read GetBits write SetBits;
       property colour_description_present_flag         :T_uint32_t index $000501 read GetBits write SetBits;
       property chroma_loc_info_present_flag            :T_uint32_t index $000601 read GetBits write SetBits;
       property neutral_chroma_indication_flag          :T_uint32_t index $000701 read GetBits write SetBits;
       property field_seq_flag                          :T_uint32_t index $000801 read GetBits write SetBits;
       property frame_field_info_present_flag           :T_uint32_t index $000901 read GetBits write SetBits;
       property default_display_window_flag             :T_uint32_t index $000A01 read GetBits write SetBits;
       property vui_timing_info_present_flag            :T_uint32_t index $000B01 read GetBits write SetBits;
       property vui_poc_proportional_to_timing_flag     :T_uint32_t index $000C01 read GetBits write SetBits;
       property vui_hrd_parameters_present_flag         :T_uint32_t index $000D01 read GetBits write SetBits;
       property bitstream_restriction_flag              :T_uint32_t index $000E01 read GetBits write SetBits;
       property tiles_fixed_structure_flag              :T_uint32_t index $000F01 read GetBits write SetBits;
       property motion_vectors_over_pic_boundaries_flag :T_uint32_t index $001001 read GetBits write SetBits;
       property restricted_ref_pic_lists_flag           :T_uint32_t index $001101 read GetBits write SetBits;
     end;
     P_StdVideoH265SpsVuiFlags = ^T_StdVideoH265SpsVuiFlags;

type T_StdVideoH265SequenceParameterSetVui = record
       flags                               :T_StdVideoH265SpsVuiFlags;
       aspect_ratio_idc                    :T_StdVideoH265AspectRatioIdc;
       sar_width                           :T_uint16_t;
       sar_height                          :T_uint16_t;
       video_format                        :T_uint8_t;
       colour_primaries                    :T_uint8_t;
       transfer_characteristics            :T_uint8_t;
       matrix_coeffs                       :T_uint8_t;
       chroma_sample_loc_type_top_field    :T_uint8_t;
       chroma_sample_loc_type_bottom_field :T_uint8_t;
       reserved1                           :T_uint8_t;
       reserved2                           :T_uint8_t;
       def_disp_win_left_offset            :T_uint16_t;
       def_disp_win_right_offset           :T_uint16_t;
       def_disp_win_top_offset             :T_uint16_t;
       def_disp_win_bottom_offset          :T_uint16_t;
       vui_num_units_in_tick               :T_uint32_t;
       vui_time_scale                      :T_uint32_t;
       vui_num_ticks_poc_diff_one_minus1   :T_uint32_t;
       min_spatial_segmentation_idc        :T_uint16_t;
       reserved3                           :T_uint16_t;
       max_bytes_per_pic_denom             :T_uint8_t;
       max_bits_per_min_cu_denom           :T_uint8_t;
       log2_max_mv_length_horizontal       :T_uint8_t;
       log2_max_mv_length_vertical         :T_uint8_t;
       pHrdParameters                      :P_StdVideoH265HrdParameters;
     end;
     P_StdVideoH265SequenceParameterSetVui = ^T_StdVideoH265SequenceParameterSetVui;

type T_StdVideoH265PredictorPaletteEntries = record
       PredictorPaletteEntries :array [ 0..STD_VIDEO_H265_PREDICTOR_PALETTE_COMPONENTS_LIST_SIZE-1 ] of array [ 0..STD_VIDEO_H265_PREDICTOR_PALETTE_COMP_ENTRIES_LIST_SIZE-1 ] of T_uint16_t;
     end;
     P_StdVideoH265PredictorPaletteEntries = ^T_StdVideoH265PredictorPaletteEntries;

type T_StdVideoH265SpsFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property sps_temporal_id_nesting_flag                    :T_uint32_t index $000001 read GetBits write SetBits;
       property separate_colour_plane_flag                      :T_uint32_t index $000101 read GetBits write SetBits;
       property conformance_window_flag                         :T_uint32_t index $000201 read GetBits write SetBits;
       property sps_sub_layer_ordering_info_present_flag        :T_uint32_t index $000301 read GetBits write SetBits;
       property scaling_list_enabled_flag                       :T_uint32_t index $000401 read GetBits write SetBits;
       property sps_scaling_list_data_present_flag              :T_uint32_t index $000501 read GetBits write SetBits;
       property amp_enabled_flag                                :T_uint32_t index $000601 read GetBits write SetBits;
       property sample_adaptive_offset_enabled_flag             :T_uint32_t index $000701 read GetBits write SetBits;
       property pcm_enabled_flag                                :T_uint32_t index $000801 read GetBits write SetBits;
       property pcm_loop_filter_disabled_flag                   :T_uint32_t index $000901 read GetBits write SetBits;
       property long_term_ref_pics_present_flag                 :T_uint32_t index $000A01 read GetBits write SetBits;
       property sps_temporal_mvp_enabled_flag                   :T_uint32_t index $000B01 read GetBits write SetBits;
       property strong_intra_smoothing_enabled_flag             :T_uint32_t index $000C01 read GetBits write SetBits;
       property vui_parameters_present_flag                     :T_uint32_t index $000D01 read GetBits write SetBits;
       property sps_extension_present_flag                      :T_uint32_t index $000E01 read GetBits write SetBits;
       property sps_range_extension_flag                        :T_uint32_t index $000F01 read GetBits write SetBits;
       property transform_skip_rotation_enabled_flag            :T_uint32_t index $001001 read GetBits write SetBits;
       property transform_skip_context_enabled_flag             :T_uint32_t index $001101 read GetBits write SetBits;
       property implicit_rdpcm_enabled_flag                     :T_uint32_t index $001201 read GetBits write SetBits;
       property explicit_rdpcm_enabled_flag                     :T_uint32_t index $001301 read GetBits write SetBits;
       property extended_precision_processing_flag              :T_uint32_t index $001401 read GetBits write SetBits;
       property intra_smoothing_disabled_flag                   :T_uint32_t index $001501 read GetBits write SetBits;
       property high_precision_offsets_enabled_flag             :T_uint32_t index $001601 read GetBits write SetBits;
       property persistent_rice_adaptation_enabled_flag         :T_uint32_t index $001701 read GetBits write SetBits;
       property cabac_bypass_alignment_enabled_flag             :T_uint32_t index $001801 read GetBits write SetBits;
       property sps_scc_extension_flag                          :T_uint32_t index $001901 read GetBits write SetBits;
       property sps_curr_pic_ref_enabled_flag                   :T_uint32_t index $001A01 read GetBits write SetBits;
       property palette_mode_enabled_flag                       :T_uint32_t index $001B01 read GetBits write SetBits;
       property sps_palette_predictor_initializers_present_flag :T_uint32_t index $001C01 read GetBits write SetBits;
       property intra_boundary_filtering_disabled_flag          :T_uint32_t index $001D01 read GetBits write SetBits;
     end;
     P_StdVideoH265SpsFlags = ^T_StdVideoH265SpsFlags;

type T_StdVideoH265ShortTermRefPicSetFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property inter_ref_pic_set_prediction_flag :T_uint32_t index $000001 read GetBits write SetBits;
       property delta_rps_sign                    :T_uint32_t index $000101 read GetBits write SetBits;
     end;
     P_StdVideoH265ShortTermRefPicSetFlags = ^T_StdVideoH265ShortTermRefPicSetFlags;

type T_StdVideoH265ShortTermRefPicSet = record
       flags                    :T_StdVideoH265ShortTermRefPicSetFlags;
       delta_idx_minus1         :T_uint32_t;
       use_delta_flag           :T_uint16_t;
       abs_delta_rps_minus1     :T_uint16_t;
       used_by_curr_pic_flag    :T_uint16_t;
       used_by_curr_pic_s0_flag :T_uint16_t;
       used_by_curr_pic_s1_flag :T_uint16_t;
       reserved1                :T_uint16_t;
       reserved2                :T_uint8_t;
       reserved3                :T_uint8_t;
       num_negative_pics        :T_uint8_t;
       num_positive_pics        :T_uint8_t;
       delta_poc_s0_minus1      :array [ 0..STD_VIDEO_H265_MAX_DPB_SIZE-1 ] of T_uint16_t;
       delta_poc_s1_minus1      :array [ 0..STD_VIDEO_H265_MAX_DPB_SIZE-1 ] of T_uint16_t;
     end;
     P_StdVideoH265ShortTermRefPicSet = ^T_StdVideoH265ShortTermRefPicSet;

type T_StdVideoH265LongTermRefPicsSps = record
       used_by_curr_pic_lt_sps_flag :T_uint32_t;
       lt_ref_pic_poc_lsb_sps       :array [ 0..STD_VIDEO_H265_MAX_LONG_TERM_REF_PICS_SPS-1 ] of T_uint32_t;
     end;
     P_StdVideoH265LongTermRefPicsSps = ^T_StdVideoH265LongTermRefPicsSps;

type T_StdVideoH265SequenceParameterSet = record
       flags                                         :T_StdVideoH265SpsFlags;
       chroma_format_idc                             :T_StdVideoH265ChromaFormatIdc;
       pic_width_in_luma_samples                     :T_uint32_t;
       pic_height_in_luma_samples                    :T_uint32_t;
       sps_video_parameter_set_id                    :T_uint8_t;
       sps_max_sub_layers_minus1                     :T_uint8_t;
       sps_seq_parameter_set_id                      :T_uint8_t;
       bit_depth_luma_minus8                         :T_uint8_t;
       bit_depth_chroma_minus8                       :T_uint8_t;
       log2_max_pic_order_cnt_lsb_minus4             :T_uint8_t;
       log2_min_luma_coding_block_size_minus3        :T_uint8_t;
       log2_diff_max_min_luma_coding_block_size      :T_uint8_t;
       log2_min_luma_transform_block_size_minus2     :T_uint8_t;
       log2_diff_max_min_luma_transform_block_size   :T_uint8_t;
       max_transform_hierarchy_depth_inter           :T_uint8_t;
       max_transform_hierarchy_depth_intra           :T_uint8_t;
       num_short_term_ref_pic_sets                   :T_uint8_t;
       num_long_term_ref_pics_sps                    :T_uint8_t;
       pcm_sample_bit_depth_luma_minus1              :T_uint8_t;
       pcm_sample_bit_depth_chroma_minus1            :T_uint8_t;
       log2_min_pcm_luma_coding_block_size_minus3    :T_uint8_t;
       log2_diff_max_min_pcm_luma_coding_block_size  :T_uint8_t;
       reserved1                                     :T_uint8_t;
       reserved2                                     :T_uint8_t;
       palette_max_size                              :T_uint8_t;
       delta_palette_max_predictor_size              :T_uint8_t;
       motion_vector_resolution_control_idc          :T_uint8_t;
       sps_num_palette_predictor_initializers_minus1 :T_uint8_t;
       conf_win_left_offset                          :T_uint32_t;
       conf_win_right_offset                         :T_uint32_t;
       conf_win_top_offset                           :T_uint32_t;
       conf_win_bottom_offset                        :T_uint32_t;
       pProfileTierLevel                             :P_StdVideoH265ProfileTierLevel;
       pDecPicBufMgr                                 :P_StdVideoH265DecPicBufMgr;
       pScalingLists                                 :P_StdVideoH265ScalingLists;
       pShortTermRefPicSet                           :P_StdVideoH265ShortTermRefPicSet;
       pLongTermRefPicsSps                           :P_StdVideoH265LongTermRefPicsSps;
       pSequenceParameterSetVui                      :P_StdVideoH265SequenceParameterSetVui;
       pPredictorPaletteEntries                      :P_StdVideoH265PredictorPaletteEntries;
     end;
     P_StdVideoH265SequenceParameterSet = ^T_StdVideoH265SequenceParameterSet;

type T_StdVideoH265PpsFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property dependent_slice_segments_enabled_flag           :T_uint32_t index $000001 read GetBits write SetBits;
       property output_flag_present_flag                        :T_uint32_t index $000101 read GetBits write SetBits;
       property sign_data_hiding_enabled_flag                   :T_uint32_t index $000201 read GetBits write SetBits;
       property cabac_init_present_flag                         :T_uint32_t index $000301 read GetBits write SetBits;
       property constrained_intra_pred_flag                     :T_uint32_t index $000401 read GetBits write SetBits;
       property transform_skip_enabled_flag                     :T_uint32_t index $000501 read GetBits write SetBits;
       property cu_qp_delta_enabled_flag                        :T_uint32_t index $000601 read GetBits write SetBits;
       property pps_slice_chroma_qp_offsets_present_flag        :T_uint32_t index $000701 read GetBits write SetBits;
       property weighted_pred_flag                              :T_uint32_t index $000801 read GetBits write SetBits;
       property weighted_bipred_flag                            :T_uint32_t index $000901 read GetBits write SetBits;
       property transquant_bypass_enabled_flag                  :T_uint32_t index $000A01 read GetBits write SetBits;
       property tiles_enabled_flag                              :T_uint32_t index $000B01 read GetBits write SetBits;
       property entropy_coding_sync_enabled_flag                :T_uint32_t index $000C01 read GetBits write SetBits;
       property uniform_spacing_flag                            :T_uint32_t index $000D01 read GetBits write SetBits;
       property loop_filter_across_tiles_enabled_flag           :T_uint32_t index $000E01 read GetBits write SetBits;
       property pps_loop_filter_across_slices_enabled_flag      :T_uint32_t index $000F01 read GetBits write SetBits;
       property deblocking_filter_control_present_flag          :T_uint32_t index $001001 read GetBits write SetBits;
       property deblocking_filter_override_enabled_flag         :T_uint32_t index $001101 read GetBits write SetBits;
       property pps_deblocking_filter_disabled_flag             :T_uint32_t index $001201 read GetBits write SetBits;
       property pps_scaling_list_data_present_flag              :T_uint32_t index $001301 read GetBits write SetBits;
       property lists_modification_present_flag                 :T_uint32_t index $001401 read GetBits write SetBits;
       property slice_segment_header_extension_present_flag     :T_uint32_t index $001501 read GetBits write SetBits;
       property pps_extension_present_flag                      :T_uint32_t index $001601 read GetBits write SetBits;
       property cross_component_prediction_enabled_flag         :T_uint32_t index $001701 read GetBits write SetBits;
       property chroma_qp_offset_list_enabled_flag              :T_uint32_t index $001801 read GetBits write SetBits;
       property pps_curr_pic_ref_enabled_flag                   :T_uint32_t index $001901 read GetBits write SetBits;
       property residual_adaptive_colour_transform_enabled_flag :T_uint32_t index $001A01 read GetBits write SetBits;
       property pps_slice_act_qp_offsets_present_flag           :T_uint32_t index $001B01 read GetBits write SetBits;
       property pps_palette_predictor_initializers_present_flag :T_uint32_t index $001C01 read GetBits write SetBits;
       property monochrome_palette_flag                         :T_uint32_t index $001D01 read GetBits write SetBits;
       property pps_range_extension_flag                        :T_uint32_t index $001E01 read GetBits write SetBits;
     end;
     P_StdVideoH265PpsFlags = ^T_StdVideoH265PpsFlags;

type T_StdVideoH265PictureParameterSet = record
       flags                                     :T_StdVideoH265PpsFlags;
       pps_pic_parameter_set_id                  :T_uint8_t;
       pps_seq_parameter_set_id                  :T_uint8_t;
       sps_video_parameter_set_id                :T_uint8_t;
       num_extra_slice_header_bits               :T_uint8_t;
       num_ref_idx_l0_default_active_minus1      :T_uint8_t;
       num_ref_idx_l1_default_active_minus1      :T_uint8_t;
       init_qp_minus26                           :T_int8_t;
       diff_cu_qp_delta_depth                    :T_uint8_t;
       pps_cb_qp_offset                          :T_int8_t;
       pps_cr_qp_offset                          :T_int8_t;
       pps_beta_offset_div2                      :T_int8_t;
       pps_tc_offset_div2                        :T_int8_t;
       log2_parallel_merge_level_minus2          :T_uint8_t;
       log2_max_transform_skip_block_size_minus2 :T_uint8_t;
       diff_cu_chroma_qp_offset_depth            :T_uint8_t;
       chroma_qp_offset_list_len_minus1          :T_uint8_t;
       cb_qp_offset_list                         :array [ 0..STD_VIDEO_H265_CHROMA_QP_OFFSET_LIST_SIZE-1 ] of T_int8_t;
       cr_qp_offset_list                         :array [ 0..STD_VIDEO_H265_CHROMA_QP_OFFSET_LIST_SIZE-1 ] of T_int8_t;
       log2_sao_offset_scale_luma                :T_uint8_t;
       log2_sao_offset_scale_chroma              :T_uint8_t;
       pps_act_y_qp_offset_plus5                 :T_int8_t;
       pps_act_cb_qp_offset_plus5                :T_int8_t;
       pps_act_cr_qp_offset_plus3                :T_int8_t;
       pps_num_palette_predictor_initializers    :T_uint8_t;
       luma_bit_depth_entry_minus8               :T_uint8_t;
       chroma_bit_depth_entry_minus8             :T_uint8_t;
       num_tile_columns_minus1                   :T_uint8_t;
       num_tile_rows_minus1                      :T_uint8_t;
       reserved1                                 :T_uint8_t;
       reserved2                                 :T_uint8_t;
       column_width_minus1                       :array [ 0..STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_COLS_LIST_SIZE-1 ] of T_uint16_t;
       row_height_minus1                         :array [ 0..STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_ROWS_LIST_SIZE-1 ] of T_uint16_t;
       reserved3                                 :T_uint32_t;
       pScalingLists                             :P_StdVideoH265ScalingLists;
       pPredictorPaletteEntries                  :P_StdVideoH265PredictorPaletteEntries;
     end;
     P_StdVideoH265PictureParameterSet = ^T_StdVideoH265PictureParameterSet;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoH265HrdFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoH265HrdFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoH265VpsFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoH265VpsFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoH265ProfileTierLevelFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoH265ProfileTierLevelFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoH265SpsVuiFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoH265SpsVuiFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoH265SpsFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoH265SpsFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoH265ShortTermRefPicSetFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoH265ShortTermRefPicSetFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoH265PpsFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoH265PpsFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
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
