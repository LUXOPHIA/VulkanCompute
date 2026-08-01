unit vulkan_video_codec_av1std;

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

//#ifndef VULKAN_VIDEO_CODEC_AV1STD_H_
const VULKAN_VIDEO_CODEC_AV1STD_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_av1std is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_av1std 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codecs_common.h"
const STD_VIDEO_AV1_NUM_REF_FRAMES              = 8;
const STD_VIDEO_AV1_REFS_PER_FRAME              = 7;
const STD_VIDEO_AV1_TOTAL_REFS_PER_FRAME        = 8;
const STD_VIDEO_AV1_MAX_TILE_COLS               = 64;
const STD_VIDEO_AV1_MAX_TILE_ROWS               = 64;
const STD_VIDEO_AV1_MAX_SEGMENTS                = 8;
const STD_VIDEO_AV1_SEG_LVL_MAX                 = 8;
const STD_VIDEO_AV1_PRIMARY_REF_NONE            = 7;
const STD_VIDEO_AV1_SELECT_INTEGER_MV           = 2;
const STD_VIDEO_AV1_SELECT_SCREEN_CONTENT_TOOLS = 2;
const STD_VIDEO_AV1_SKIP_MODE_FRAMES            = 2;
const STD_VIDEO_AV1_MAX_LOOP_FILTER_STRENGTHS   = 4;
const STD_VIDEO_AV1_LOOP_FILTER_ADJUSTMENTS     = 2;
const STD_VIDEO_AV1_MAX_CDEF_FILTER_STRENGTHS   = 8;
const STD_VIDEO_AV1_MAX_NUM_PLANES              = 3;
const STD_VIDEO_AV1_GLOBAL_MOTION_PARAMS        = 6;
const STD_VIDEO_AV1_MAX_NUM_Y_POINTS            = 14;
const STD_VIDEO_AV1_MAX_NUM_CB_POINTS           = 10;
const STD_VIDEO_AV1_MAX_NUM_CR_POINTS           = 10;
const STD_VIDEO_AV1_MAX_NUM_POS_LUMA            = 24;
const STD_VIDEO_AV1_MAX_NUM_POS_CHROMA          = 25;

//typedef enum StdVideoAV1Profile {
type T_StdVideoAV1Profile = T_int32_t;  P_StdVideoAV1Profile = ^T_StdVideoAV1Profile;
const STD_VIDEO_AV1_PROFILE_MAIN         = 0;
const STD_VIDEO_AV1_PROFILE_HIGH         = 1;
const STD_VIDEO_AV1_PROFILE_PROFESSIONAL = 2;
const STD_VIDEO_AV1_PROFILE_INVALID      = $7FFFFFFF;
const STD_VIDEO_AV1_PROFILE_MAX_ENUM     = $7FFFFFFF;
//} StdVideoAV1Profile;

//typedef enum StdVideoAV1Level {
type T_StdVideoAV1Level = T_int32_t;  P_StdVideoAV1Level = ^T_StdVideoAV1Level;
const STD_VIDEO_AV1_LEVEL_2_0      = 0;
const STD_VIDEO_AV1_LEVEL_2_1      = 1;
const STD_VIDEO_AV1_LEVEL_2_2      = 2;
const STD_VIDEO_AV1_LEVEL_2_3      = 3;
const STD_VIDEO_AV1_LEVEL_3_0      = 4;
const STD_VIDEO_AV1_LEVEL_3_1      = 5;
const STD_VIDEO_AV1_LEVEL_3_2      = 6;
const STD_VIDEO_AV1_LEVEL_3_3      = 7;
const STD_VIDEO_AV1_LEVEL_4_0      = 8;
const STD_VIDEO_AV1_LEVEL_4_1      = 9;
const STD_VIDEO_AV1_LEVEL_4_2      = 10;
const STD_VIDEO_AV1_LEVEL_4_3      = 11;
const STD_VIDEO_AV1_LEVEL_5_0      = 12;
const STD_VIDEO_AV1_LEVEL_5_1      = 13;
const STD_VIDEO_AV1_LEVEL_5_2      = 14;
const STD_VIDEO_AV1_LEVEL_5_3      = 15;
const STD_VIDEO_AV1_LEVEL_6_0      = 16;
const STD_VIDEO_AV1_LEVEL_6_1      = 17;
const STD_VIDEO_AV1_LEVEL_6_2      = 18;
const STD_VIDEO_AV1_LEVEL_6_3      = 19;
const STD_VIDEO_AV1_LEVEL_7_0      = 20;
const STD_VIDEO_AV1_LEVEL_7_1      = 21;
const STD_VIDEO_AV1_LEVEL_7_2      = 22;
const STD_VIDEO_AV1_LEVEL_7_3      = 23;
const STD_VIDEO_AV1_LEVEL_INVALID  = $7FFFFFFF;
const STD_VIDEO_AV1_LEVEL_MAX_ENUM = $7FFFFFFF;
//} StdVideoAV1Level;

//typedef enum StdVideoAV1FrameType {
type T_StdVideoAV1FrameType = T_int32_t;  P_StdVideoAV1FrameType = ^T_StdVideoAV1FrameType;
const STD_VIDEO_AV1_FRAME_TYPE_KEY        = 0;
const STD_VIDEO_AV1_FRAME_TYPE_INTER      = 1;
const STD_VIDEO_AV1_FRAME_TYPE_INTRA_ONLY = 2;
const STD_VIDEO_AV1_FRAME_TYPE_SWITCH     = 3;
const STD_VIDEO_AV1_FRAME_TYPE_INVALID    = $7FFFFFFF;
const STD_VIDEO_AV1_FRAME_TYPE_MAX_ENUM   = $7FFFFFFF;
//} StdVideoAV1FrameType;

//typedef enum StdVideoAV1ReferenceName {
type T_StdVideoAV1ReferenceName = T_int32_t;  P_StdVideoAV1ReferenceName = ^T_StdVideoAV1ReferenceName;
const STD_VIDEO_AV1_REFERENCE_NAME_INTRA_FRAME   = 0;
const STD_VIDEO_AV1_REFERENCE_NAME_LAST_FRAME    = 1;
const STD_VIDEO_AV1_REFERENCE_NAME_LAST2_FRAME   = 2;
const STD_VIDEO_AV1_REFERENCE_NAME_LAST3_FRAME   = 3;
const STD_VIDEO_AV1_REFERENCE_NAME_GOLDEN_FRAME  = 4;
const STD_VIDEO_AV1_REFERENCE_NAME_BWDREF_FRAME  = 5;
const STD_VIDEO_AV1_REFERENCE_NAME_ALTREF2_FRAME = 6;
const STD_VIDEO_AV1_REFERENCE_NAME_ALTREF_FRAME  = 7;
const STD_VIDEO_AV1_REFERENCE_NAME_INVALID       = $7FFFFFFF;
const STD_VIDEO_AV1_REFERENCE_NAME_MAX_ENUM      = $7FFFFFFF;
//} StdVideoAV1ReferenceName;

//typedef enum StdVideoAV1InterpolationFilter {
type T_StdVideoAV1InterpolationFilter = T_int32_t;  P_StdVideoAV1InterpolationFilter = ^T_StdVideoAV1InterpolationFilter;
const STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP        = 0;
const STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH = 1;
const STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP  = 2;
const STD_VIDEO_AV1_INTERPOLATION_FILTER_BILINEAR        = 3;
const STD_VIDEO_AV1_INTERPOLATION_FILTER_SWITCHABLE      = 4;
const STD_VIDEO_AV1_INTERPOLATION_FILTER_INVALID         = $7FFFFFFF;
const STD_VIDEO_AV1_INTERPOLATION_FILTER_MAX_ENUM        = $7FFFFFFF;
//} StdVideoAV1InterpolationFilter;

//typedef enum StdVideoAV1TxMode {
type T_StdVideoAV1TxMode = T_int32_t;  P_StdVideoAV1TxMode = ^T_StdVideoAV1TxMode;
const STD_VIDEO_AV1_TX_MODE_ONLY_4X4 = 0;
const STD_VIDEO_AV1_TX_MODE_LARGEST  = 1;
const STD_VIDEO_AV1_TX_MODE_SELECT   = 2;
const STD_VIDEO_AV1_TX_MODE_INVALID  = $7FFFFFFF;
const STD_VIDEO_AV1_TX_MODE_MAX_ENUM = $7FFFFFFF;
//} StdVideoAV1TxMode;

//typedef enum StdVideoAV1FrameRestorationType {
type T_StdVideoAV1FrameRestorationType = T_int32_t;  P_StdVideoAV1FrameRestorationType = ^T_StdVideoAV1FrameRestorationType;
const STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_NONE       = 0;
const STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_WIENER     = 1;
const STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_SGRPROJ    = 2;
const STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_SWITCHABLE = 3;
const STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_INVALID    = $7FFFFFFF;
const STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_MAX_ENUM   = $7FFFFFFF;
//} StdVideoAV1FrameRestorationType;

//typedef enum StdVideoAV1ColorPrimaries {
type T_StdVideoAV1ColorPrimaries = T_int32_t;  P_StdVideoAV1ColorPrimaries = ^T_StdVideoAV1ColorPrimaries;
const STD_VIDEO_AV1_COLOR_PRIMARIES_BT_709       = 1;
const STD_VIDEO_AV1_COLOR_PRIMARIES_UNSPECIFIED  = 2;
const STD_VIDEO_AV1_COLOR_PRIMARIES_BT_470_M     = 4;
const STD_VIDEO_AV1_COLOR_PRIMARIES_BT_470_B_G   = 5;
const STD_VIDEO_AV1_COLOR_PRIMARIES_BT_601       = 6;
const STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_240    = 7;
const STD_VIDEO_AV1_COLOR_PRIMARIES_GENERIC_FILM = 8;
const STD_VIDEO_AV1_COLOR_PRIMARIES_BT_2020      = 9;
const STD_VIDEO_AV1_COLOR_PRIMARIES_XYZ          = 10;
const STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_431    = 11;
const STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_432    = 12;
const STD_VIDEO_AV1_COLOR_PRIMARIES_EBU_3213     = 22;
const STD_VIDEO_AV1_COLOR_PRIMARIES_INVALID      = $7FFFFFFF;
// STD_VIDEO_AV1_COLOR_PRIMARIES_BT_UNSPECIFIED is a legacy alias
const STD_VIDEO_AV1_COLOR_PRIMARIES_BT_UNSPECIFIED = STD_VIDEO_AV1_COLOR_PRIMARIES_UNSPECIFIED;
const STD_VIDEO_AV1_COLOR_PRIMARIES_MAX_ENUM       = $7FFFFFFF;
//} StdVideoAV1ColorPrimaries;

//typedef enum StdVideoAV1TransferCharacteristics {
type T_StdVideoAV1TransferCharacteristics = T_int32_t;  P_StdVideoAV1TransferCharacteristics = ^T_StdVideoAV1TransferCharacteristics;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_RESERVED_0     = 0;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_709         = 1;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_UNSPECIFIED    = 2;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_RESERVED_3     = 3;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_470_M       = 4;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_470_B_G     = 5;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_601         = 6;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_240      = 7;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LINEAR         = 8;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LOG_100        = 9;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LOG_100_SQRT10 = 10;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_IEC_61966      = 11;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_1361        = 12;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SRGB           = 13;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_2020_10_BIT = 14;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_2020_12_BIT = 15;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_2084     = 16;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_428      = 17;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_HLG            = 18;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_INVALID        = $7FFFFFFF;
const STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_MAX_ENUM       = $7FFFFFFF;
//} StdVideoAV1TransferCharacteristics;

//typedef enum StdVideoAV1MatrixCoefficients {
type T_StdVideoAV1MatrixCoefficients = T_int32_t;  P_StdVideoAV1MatrixCoefficients = ^T_StdVideoAV1MatrixCoefficients;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_IDENTITY    = 0;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_709      = 1;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_UNSPECIFIED = 2;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_RESERVED_3  = 3;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_FCC         = 4;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_470_B_G  = 5;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_601      = 6;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_240   = 7;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_YCGCO = 8;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_2020_NCL = 9;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_2020_CL  = 10;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_2085  = 11;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_CHROMAT_NCL = 12;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_CHROMAT_CL  = 13;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_ICTCP       = 14;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_INVALID     = $7FFFFFFF;
const STD_VIDEO_AV1_MATRIX_COEFFICIENTS_MAX_ENUM    = $7FFFFFFF;
//} StdVideoAV1MatrixCoefficients;

//typedef enum StdVideoAV1ChromaSamplePosition {
type T_StdVideoAV1ChromaSamplePosition = T_int32_t;  P_StdVideoAV1ChromaSamplePosition = ^T_StdVideoAV1ChromaSamplePosition;
const STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_UNKNOWN   = 0;
const STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_VERTICAL  = 1;
const STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_COLOCATED = 2;
const STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_RESERVED  = 3;
const STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_INVALID   = $7FFFFFFF;
const STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_MAX_ENUM  = $7FFFFFFF;
//} StdVideoAV1ChromaSamplePosition;
type T_StdVideoAV1ColorConfigFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property mono_chrome                    :T_uint32_t index $000001 read GetBits write SetBits;
       property color_range                    :T_uint32_t index $000101 read GetBits write SetBits;
       property separate_uv_delta_q            :T_uint32_t index $000201 read GetBits write SetBits;
       property color_description_present_flag :T_uint32_t index $000301 read GetBits write SetBits;
       property reserved                       :T_uint32_t index $00041C read GetBits write SetBits;
     end;
     P_StdVideoAV1ColorConfigFlags = ^T_StdVideoAV1ColorConfigFlags;

type T_StdVideoAV1ColorConfig = record
       flags                    :T_StdVideoAV1ColorConfigFlags;
       BitDepth                 :T_uint8_t;
       subsampling_x            :T_uint8_t;
       subsampling_y            :T_uint8_t;
       reserved1                :T_uint8_t;
       color_primaries          :T_StdVideoAV1ColorPrimaries;
       transfer_characteristics :T_StdVideoAV1TransferCharacteristics;
       matrix_coefficients      :T_StdVideoAV1MatrixCoefficients;
       chroma_sample_position   :T_StdVideoAV1ChromaSamplePosition;
     end;
     P_StdVideoAV1ColorConfig = ^T_StdVideoAV1ColorConfig;

type T_StdVideoAV1TimingInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property equal_picture_interval :T_uint32_t index $000001 read GetBits write SetBits;
       property reserved               :T_uint32_t index $00011F read GetBits write SetBits;
     end;
     P_StdVideoAV1TimingInfoFlags = ^T_StdVideoAV1TimingInfoFlags;

type T_StdVideoAV1TimingInfo = record
       flags                         :T_StdVideoAV1TimingInfoFlags;
       num_units_in_display_tick     :T_uint32_t;
       time_scale                    :T_uint32_t;
       num_ticks_per_picture_minus_1 :T_uint32_t;
     end;
     P_StdVideoAV1TimingInfo = ^T_StdVideoAV1TimingInfo;

type T_StdVideoAV1LoopFilterFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property loop_filter_delta_enabled :T_uint32_t index $000001 read GetBits write SetBits;
       property loop_filter_delta_update  :T_uint32_t index $000101 read GetBits write SetBits;
       property reserved                  :T_uint32_t index $00021E read GetBits write SetBits;
     end;
     P_StdVideoAV1LoopFilterFlags = ^T_StdVideoAV1LoopFilterFlags;

type T_StdVideoAV1LoopFilter = record
       flags                   :T_StdVideoAV1LoopFilterFlags;
       loop_filter_level       :array [ 0..STD_VIDEO_AV1_MAX_LOOP_FILTER_STRENGTHS-1 ] of T_uint8_t;
       loop_filter_sharpness   :T_uint8_t;
       update_ref_delta        :T_uint8_t;
       loop_filter_ref_deltas  :array [ 0..STD_VIDEO_AV1_TOTAL_REFS_PER_FRAME-1 ] of T_int8_t;
       update_mode_delta       :T_uint8_t;
       loop_filter_mode_deltas :array [ 0..STD_VIDEO_AV1_LOOP_FILTER_ADJUSTMENTS-1 ] of T_int8_t;
     end;
     P_StdVideoAV1LoopFilter = ^T_StdVideoAV1LoopFilter;

type T_StdVideoAV1QuantizationFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property using_qmatrix :T_uint32_t index $000001 read GetBits write SetBits;
       property diff_uv_delta :T_uint32_t index $000101 read GetBits write SetBits;
       property reserved      :T_uint32_t index $00021E read GetBits write SetBits;
     end;
     P_StdVideoAV1QuantizationFlags = ^T_StdVideoAV1QuantizationFlags;

type T_StdVideoAV1Quantization = record
       flags      :T_StdVideoAV1QuantizationFlags;
       base_q_idx :T_uint8_t;
       DeltaQYDc  :T_int8_t;
       DeltaQUDc  :T_int8_t;
       DeltaQUAc  :T_int8_t;
       DeltaQVDc  :T_int8_t;
       DeltaQVAc  :T_int8_t;
       qm_y       :T_uint8_t;
       qm_u       :T_uint8_t;
       qm_v       :T_uint8_t;
     end;
     P_StdVideoAV1Quantization = ^T_StdVideoAV1Quantization;

type T_StdVideoAV1Segmentation = record
       FeatureEnabled :array [ 0..STD_VIDEO_AV1_MAX_SEGMENTS-1 ] of T_uint8_t;
       FeatureData    :array [ 0..STD_VIDEO_AV1_MAX_SEGMENTS-1 ] of array [ 0..STD_VIDEO_AV1_SEG_LVL_MAX-1 ] of T_int16_t;
     end;
     P_StdVideoAV1Segmentation = ^T_StdVideoAV1Segmentation;

type T_StdVideoAV1TileInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property uniform_tile_spacing_flag :T_uint32_t index $000001 read GetBits write SetBits;
       property reserved                  :T_uint32_t index $00011F read GetBits write SetBits;
     end;
     P_StdVideoAV1TileInfoFlags = ^T_StdVideoAV1TileInfoFlags;

type T_StdVideoAV1TileInfo = record
       flags                   :T_StdVideoAV1TileInfoFlags;
       TileCols                :T_uint8_t;
       TileRows                :T_uint8_t;
       context_update_tile_id  :T_uint16_t;
       tile_size_bytes_minus_1 :T_uint8_t;
       reserved1               :array [ 0..6 ] of T_uint8_t;
       pMiColStarts            :P_uint16_t;
       pMiRowStarts            :P_uint16_t;
       pWidthInSbsMinus1       :P_uint16_t;
       pHeightInSbsMinus1      :P_uint16_t;
     end;
     P_StdVideoAV1TileInfo = ^T_StdVideoAV1TileInfo;

type T_StdVideoAV1CDEF = record
       cdef_damping_minus_3 :T_uint8_t;
       cdef_bits            :T_uint8_t;
       cdef_y_pri_strength  :array [ 0..STD_VIDEO_AV1_MAX_CDEF_FILTER_STRENGTHS-1 ] of T_uint8_t;
       cdef_y_sec_strength  :array [ 0..STD_VIDEO_AV1_MAX_CDEF_FILTER_STRENGTHS-1 ] of T_uint8_t;
       cdef_uv_pri_strength :array [ 0..STD_VIDEO_AV1_MAX_CDEF_FILTER_STRENGTHS-1 ] of T_uint8_t;
       cdef_uv_sec_strength :array [ 0..STD_VIDEO_AV1_MAX_CDEF_FILTER_STRENGTHS-1 ] of T_uint8_t;
     end;
     P_StdVideoAV1CDEF = ^T_StdVideoAV1CDEF;

type T_StdVideoAV1LoopRestoration = record
       FrameRestorationType :array [ 0..STD_VIDEO_AV1_MAX_NUM_PLANES-1 ] of T_StdVideoAV1FrameRestorationType;
       LoopRestorationSize  :array [ 0..STD_VIDEO_AV1_MAX_NUM_PLANES-1 ] of T_uint16_t;
     end;
     P_StdVideoAV1LoopRestoration = ^T_StdVideoAV1LoopRestoration;

type T_StdVideoAV1GlobalMotion = record
       GmType    :array [ 0..STD_VIDEO_AV1_NUM_REF_FRAMES-1 ] of T_uint8_t;
       gm_params :array [ 0..STD_VIDEO_AV1_NUM_REF_FRAMES-1 ] of array [ 0..STD_VIDEO_AV1_GLOBAL_MOTION_PARAMS-1 ] of T_int32_t;
     end;
     P_StdVideoAV1GlobalMotion = ^T_StdVideoAV1GlobalMotion;

type T_StdVideoAV1FilmGrainFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property chroma_scaling_from_luma :T_uint32_t index $000001 read GetBits write SetBits;
       property overlap_flag             :T_uint32_t index $000101 read GetBits write SetBits;
       property clip_to_restricted_range :T_uint32_t index $000201 read GetBits write SetBits;
       property update_grain             :T_uint32_t index $000301 read GetBits write SetBits;
       property reserved                 :T_uint32_t index $00041C read GetBits write SetBits;
     end;
     P_StdVideoAV1FilmGrainFlags = ^T_StdVideoAV1FilmGrainFlags;

type T_StdVideoAV1FilmGrain = record
       flags                     :T_StdVideoAV1FilmGrainFlags;
       grain_scaling_minus_8     :T_uint8_t;
       ar_coeff_lag              :T_uint8_t;
       ar_coeff_shift_minus_6    :T_uint8_t;
       grain_scale_shift         :T_uint8_t;
       grain_seed                :T_uint16_t;
       film_grain_params_ref_idx :T_uint8_t;
       num_y_points              :T_uint8_t;
       point_y_value             :array [ 0..STD_VIDEO_AV1_MAX_NUM_Y_POINTS-1 ] of T_uint8_t;
       point_y_scaling           :array [ 0..STD_VIDEO_AV1_MAX_NUM_Y_POINTS-1 ] of T_uint8_t;
       num_cb_points             :T_uint8_t;
       point_cb_value            :array [ 0..STD_VIDEO_AV1_MAX_NUM_CB_POINTS-1 ] of T_uint8_t;
       point_cb_scaling          :array [ 0..STD_VIDEO_AV1_MAX_NUM_CB_POINTS-1 ] of T_uint8_t;
       num_cr_points             :T_uint8_t;
       point_cr_value            :array [ 0..STD_VIDEO_AV1_MAX_NUM_CR_POINTS-1 ] of T_uint8_t;
       point_cr_scaling          :array [ 0..STD_VIDEO_AV1_MAX_NUM_CR_POINTS-1 ] of T_uint8_t;
       ar_coeffs_y_plus_128      :array [ 0..STD_VIDEO_AV1_MAX_NUM_POS_LUMA-1 ] of T_int8_t;
       ar_coeffs_cb_plus_128     :array [ 0..STD_VIDEO_AV1_MAX_NUM_POS_CHROMA-1 ] of T_int8_t;
       ar_coeffs_cr_plus_128     :array [ 0..STD_VIDEO_AV1_MAX_NUM_POS_CHROMA-1 ] of T_int8_t;
       cb_mult                   :T_uint8_t;
       cb_luma_mult              :T_uint8_t;
       cb_offset                 :T_uint16_t;
       cr_mult                   :T_uint8_t;
       cr_luma_mult              :T_uint8_t;
       cr_offset                 :T_uint16_t;
     end;
     P_StdVideoAV1FilmGrain = ^T_StdVideoAV1FilmGrain;

type T_StdVideoAV1SequenceHeaderFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property still_picture                      :T_uint32_t index $000001 read GetBits write SetBits;
       property reduced_still_picture_header       :T_uint32_t index $000101 read GetBits write SetBits;
       property use_128x128_superblock             :T_uint32_t index $000201 read GetBits write SetBits;
       property enable_filter_intra                :T_uint32_t index $000301 read GetBits write SetBits;
       property enable_intra_edge_filter           :T_uint32_t index $000401 read GetBits write SetBits;
       property enable_interintra_compound         :T_uint32_t index $000501 read GetBits write SetBits;
       property enable_masked_compound             :T_uint32_t index $000601 read GetBits write SetBits;
       property enable_warped_motion               :T_uint32_t index $000701 read GetBits write SetBits;
       property enable_dual_filter                 :T_uint32_t index $000801 read GetBits write SetBits;
       property enable_order_hint                  :T_uint32_t index $000901 read GetBits write SetBits;
       property enable_jnt_comp                    :T_uint32_t index $000A01 read GetBits write SetBits;
       property enable_ref_frame_mvs               :T_uint32_t index $000B01 read GetBits write SetBits;
       property frame_id_numbers_present_flag      :T_uint32_t index $000C01 read GetBits write SetBits;
       property enable_superres                    :T_uint32_t index $000D01 read GetBits write SetBits;
       property enable_cdef                        :T_uint32_t index $000E01 read GetBits write SetBits;
       property enable_restoration                 :T_uint32_t index $000F01 read GetBits write SetBits;
       property film_grain_params_present          :T_uint32_t index $001001 read GetBits write SetBits;
       property timing_info_present_flag           :T_uint32_t index $001101 read GetBits write SetBits;
       property initial_display_delay_present_flag :T_uint32_t index $001201 read GetBits write SetBits;
       property reserved                           :T_uint32_t index $00130D read GetBits write SetBits;
     end;
     P_StdVideoAV1SequenceHeaderFlags = ^T_StdVideoAV1SequenceHeaderFlags;

type T_StdVideoAV1SequenceHeader = record
       flags                              :T_StdVideoAV1SequenceHeaderFlags;
       seq_profile                        :T_StdVideoAV1Profile;
       frame_width_bits_minus_1           :T_uint8_t;
       frame_height_bits_minus_1          :T_uint8_t;
       max_frame_width_minus_1            :T_uint16_t;
       max_frame_height_minus_1           :T_uint16_t;
       delta_frame_id_length_minus_2      :T_uint8_t;
       additional_frame_id_length_minus_1 :T_uint8_t;
       order_hint_bits_minus_1            :T_uint8_t;
       seq_force_integer_mv               :T_uint8_t;
       seq_force_screen_content_tools     :T_uint8_t;
       reserved1                          :array [ 0..4 ] of T_uint8_t;
       pColorConfig                       :P_StdVideoAV1ColorConfig;
       pTimingInfo                        :P_StdVideoAV1TimingInfo;
     end;
     P_StdVideoAV1SequenceHeader = ^T_StdVideoAV1SequenceHeader;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoAV1ColorConfigFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoAV1ColorConfigFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoAV1TimingInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoAV1TimingInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoAV1LoopFilterFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoAV1LoopFilterFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoAV1QuantizationFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoAV1QuantizationFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoAV1TileInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoAV1TileInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoAV1FilmGrainFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoAV1FilmGrainFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoAV1SequenceHeaderFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoAV1SequenceHeaderFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
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
