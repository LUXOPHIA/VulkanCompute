unit vulkan_video_codec_vp9std;

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

//#ifndef VULKAN_VIDEO_CODEC_VP9STD_H_
const VULKAN_VIDEO_CODEC_VP9STD_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_vp9std is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_vp9std 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codecs_common.h"
const STD_VIDEO_VP9_NUM_REF_FRAMES              = 8;
const STD_VIDEO_VP9_REFS_PER_FRAME              = 3;
const STD_VIDEO_VP9_MAX_REF_FRAMES              = 4;
const STD_VIDEO_VP9_LOOP_FILTER_ADJUSTMENTS     = 2;
const STD_VIDEO_VP9_MAX_SEGMENTS                = 8;
const STD_VIDEO_VP9_SEG_LVL_MAX                 = 4;
const STD_VIDEO_VP9_MAX_SEGMENTATION_TREE_PROBS = 7;
const STD_VIDEO_VP9_MAX_SEGMENTATION_PRED_PROB  = 3;

//typedef enum StdVideoVP9Profile {
type T_StdVideoVP9Profile = T_int32_t;  P_StdVideoVP9Profile = ^T_StdVideoVP9Profile;
const STD_VIDEO_VP9_PROFILE_0        = 0;
const STD_VIDEO_VP9_PROFILE_1        = 1;
const STD_VIDEO_VP9_PROFILE_2        = 2;
const STD_VIDEO_VP9_PROFILE_3        = 3;
const STD_VIDEO_VP9_PROFILE_INVALID  = $7FFFFFFF;
const STD_VIDEO_VP9_PROFILE_MAX_ENUM = $7FFFFFFF;
//} StdVideoVP9Profile;

//typedef enum StdVideoVP9Level {
type T_StdVideoVP9Level = T_int32_t;  P_StdVideoVP9Level = ^T_StdVideoVP9Level;
const STD_VIDEO_VP9_LEVEL_1_0      = 0;
const STD_VIDEO_VP9_LEVEL_1_1      = 1;
const STD_VIDEO_VP9_LEVEL_2_0      = 2;
const STD_VIDEO_VP9_LEVEL_2_1      = 3;
const STD_VIDEO_VP9_LEVEL_3_0      = 4;
const STD_VIDEO_VP9_LEVEL_3_1      = 5;
const STD_VIDEO_VP9_LEVEL_4_0      = 6;
const STD_VIDEO_VP9_LEVEL_4_1      = 7;
const STD_VIDEO_VP9_LEVEL_5_0      = 8;
const STD_VIDEO_VP9_LEVEL_5_1      = 9;
const STD_VIDEO_VP9_LEVEL_5_2      = 10;
const STD_VIDEO_VP9_LEVEL_6_0      = 11;
const STD_VIDEO_VP9_LEVEL_6_1      = 12;
const STD_VIDEO_VP9_LEVEL_6_2      = 13;
const STD_VIDEO_VP9_LEVEL_INVALID  = $7FFFFFFF;
const STD_VIDEO_VP9_LEVEL_MAX_ENUM = $7FFFFFFF;
//} StdVideoVP9Level;

//typedef enum StdVideoVP9FrameType {
type T_StdVideoVP9FrameType = T_int32_t;  P_StdVideoVP9FrameType = ^T_StdVideoVP9FrameType;
const STD_VIDEO_VP9_FRAME_TYPE_KEY      = 0;
const STD_VIDEO_VP9_FRAME_TYPE_NON_KEY  = 1;
const STD_VIDEO_VP9_FRAME_TYPE_INVALID  = $7FFFFFFF;
const STD_VIDEO_VP9_FRAME_TYPE_MAX_ENUM = $7FFFFFFF;
//} StdVideoVP9FrameType;

//typedef enum StdVideoVP9ReferenceName {
type T_StdVideoVP9ReferenceName = T_int32_t;  P_StdVideoVP9ReferenceName = ^T_StdVideoVP9ReferenceName;
const STD_VIDEO_VP9_REFERENCE_NAME_INTRA_FRAME  = 0;
const STD_VIDEO_VP9_REFERENCE_NAME_LAST_FRAME   = 1;
const STD_VIDEO_VP9_REFERENCE_NAME_GOLDEN_FRAME = 2;
const STD_VIDEO_VP9_REFERENCE_NAME_ALTREF_FRAME = 3;
const STD_VIDEO_VP9_REFERENCE_NAME_INVALID      = $7FFFFFFF;
const STD_VIDEO_VP9_REFERENCE_NAME_MAX_ENUM     = $7FFFFFFF;
//} StdVideoVP9ReferenceName;

//typedef enum StdVideoVP9InterpolationFilter {
type T_StdVideoVP9InterpolationFilter = T_int32_t;  P_StdVideoVP9InterpolationFilter = ^T_StdVideoVP9InterpolationFilter;
const STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP        = 0;
const STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH = 1;
const STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP_SHARP  = 2;
const STD_VIDEO_VP9_INTERPOLATION_FILTER_BILINEAR        = 3;
const STD_VIDEO_VP9_INTERPOLATION_FILTER_SWITCHABLE      = 4;
const STD_VIDEO_VP9_INTERPOLATION_FILTER_INVALID         = $7FFFFFFF;
const STD_VIDEO_VP9_INTERPOLATION_FILTER_MAX_ENUM        = $7FFFFFFF;
//} StdVideoVP9InterpolationFilter;

//typedef enum StdVideoVP9ColorSpace {
type T_StdVideoVP9ColorSpace = T_int32_t;  P_StdVideoVP9ColorSpace = ^T_StdVideoVP9ColorSpace;
const STD_VIDEO_VP9_COLOR_SPACE_UNKNOWN   = 0;
const STD_VIDEO_VP9_COLOR_SPACE_BT_601    = 1;
const STD_VIDEO_VP9_COLOR_SPACE_BT_709    = 2;
const STD_VIDEO_VP9_COLOR_SPACE_SMPTE_170 = 3;
const STD_VIDEO_VP9_COLOR_SPACE_SMPTE_240 = 4;
const STD_VIDEO_VP9_COLOR_SPACE_BT_2020   = 5;
const STD_VIDEO_VP9_COLOR_SPACE_RESERVED  = 6;
const STD_VIDEO_VP9_COLOR_SPACE_RGB       = 7;
const STD_VIDEO_VP9_COLOR_SPACE_INVALID   = $7FFFFFFF;
const STD_VIDEO_VP9_COLOR_SPACE_MAX_ENUM  = $7FFFFFFF;
//} StdVideoVP9ColorSpace;
type T_StdVideoVP9ColorConfigFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property color_range :T_uint32_t index $000001 read GetBits write SetBits;
       property reserved    :T_uint32_t index $00011F read GetBits write SetBits;
     end;
     P_StdVideoVP9ColorConfigFlags = ^T_StdVideoVP9ColorConfigFlags;

type T_StdVideoVP9ColorConfig = record
       flags         :T_StdVideoVP9ColorConfigFlags;
       BitDepth      :T_uint8_t;
       subsampling_x :T_uint8_t;
       subsampling_y :T_uint8_t;
       reserved1     :T_uint8_t;
       color_space   :T_StdVideoVP9ColorSpace;
     end;
     P_StdVideoVP9ColorConfig = ^T_StdVideoVP9ColorConfig;

type T_StdVideoVP9LoopFilterFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property loop_filter_delta_enabled :T_uint32_t index $000001 read GetBits write SetBits;
       property loop_filter_delta_update  :T_uint32_t index $000101 read GetBits write SetBits;
       property reserved                  :T_uint32_t index $00021E read GetBits write SetBits;
     end;
     P_StdVideoVP9LoopFilterFlags = ^T_StdVideoVP9LoopFilterFlags;

type T_StdVideoVP9LoopFilter = record
       flags                   :T_StdVideoVP9LoopFilterFlags;
       loop_filter_level       :T_uint8_t;
       loop_filter_sharpness   :T_uint8_t;
       update_ref_delta        :T_uint8_t;
       loop_filter_ref_deltas  :array [ 0..STD_VIDEO_VP9_MAX_REF_FRAMES-1 ] of T_int8_t;
       update_mode_delta       :T_uint8_t;
       loop_filter_mode_deltas :array [ 0..STD_VIDEO_VP9_LOOP_FILTER_ADJUSTMENTS-1 ] of T_int8_t;
     end;
     P_StdVideoVP9LoopFilter = ^T_StdVideoVP9LoopFilter;

type T_StdVideoVP9SegmentationFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property segmentation_update_map          :T_uint32_t index $000001 read GetBits write SetBits;
       property segmentation_temporal_update     :T_uint32_t index $000101 read GetBits write SetBits;
       property segmentation_update_data         :T_uint32_t index $000201 read GetBits write SetBits;
       property segmentation_abs_or_delta_update :T_uint32_t index $000301 read GetBits write SetBits;
       property reserved                         :T_uint32_t index $00041C read GetBits write SetBits;
     end;
     P_StdVideoVP9SegmentationFlags = ^T_StdVideoVP9SegmentationFlags;

type T_StdVideoVP9Segmentation = record
       flags                   :T_StdVideoVP9SegmentationFlags;
       segmentation_tree_probs :array [ 0..STD_VIDEO_VP9_MAX_SEGMENTATION_TREE_PROBS-1 ] of T_uint8_t;
       segmentation_pred_prob  :array [ 0..STD_VIDEO_VP9_MAX_SEGMENTATION_PRED_PROB-1 ] of T_uint8_t;
       FeatureEnabled          :array [ 0..STD_VIDEO_VP9_MAX_SEGMENTS-1 ] of T_uint8_t;
       FeatureData             :array [ 0..STD_VIDEO_VP9_MAX_SEGMENTS-1 ] of array [ 0..STD_VIDEO_VP9_SEG_LVL_MAX-1 ] of T_int16_t;
     end;
     P_StdVideoVP9Segmentation = ^T_StdVideoVP9Segmentation;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoVP9ColorConfigFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoVP9ColorConfigFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoVP9LoopFilterFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoVP9LoopFilterFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoVP9SegmentationFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoVP9SegmentationFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
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
