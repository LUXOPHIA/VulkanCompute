unit vulkan_video_codec_h264std_decode;

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

//#ifndef VULKAN_VIDEO_CODEC_H264STD_DECODE_H_
const VULKAN_VIDEO_CODEC_H264STD_DECODE_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_h264std_decode is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_h264std_decode 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codec_h264std.h"

const VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_API_VERSION_1_0_0 = ( 1 shl 22 ) or ( 0 shl 12 ) or 0;

const VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_SPEC_VERSION   = VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_API_VERSION_1_0_0;
const VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_h264_decode';
const STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_LIST_SIZE    = 2;

//typedef enum StdVideoDecodeH264FieldOrderCount {
type T_StdVideoDecodeH264FieldOrderCount = T_int32_t;  P_StdVideoDecodeH264FieldOrderCount = ^T_StdVideoDecodeH264FieldOrderCount;
const STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_TOP      = 0;
const STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_BOTTOM   = 1;
const STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_INVALID  = $7FFFFFFF;
const STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_MAX_ENUM = $7FFFFFFF;
//} StdVideoDecodeH264FieldOrderCount;
type T_StdVideoDecodeH264PictureInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property field_pic_flag           :T_uint32_t index $000001 read GetBits write SetBits;
       property is_intra                 :T_uint32_t index $000101 read GetBits write SetBits;
       property IdrPicFlag               :T_uint32_t index $000201 read GetBits write SetBits;
       property bottom_field_flag        :T_uint32_t index $000301 read GetBits write SetBits;
       property is_reference             :T_uint32_t index $000401 read GetBits write SetBits;
       property complementary_field_pair :T_uint32_t index $000501 read GetBits write SetBits;
     end;
     P_StdVideoDecodeH264PictureInfoFlags = ^T_StdVideoDecodeH264PictureInfoFlags;

type T_StdVideoDecodeH264PictureInfo = record
       flags                :T_StdVideoDecodeH264PictureInfoFlags;
       seq_parameter_set_id :T_uint8_t;
       pic_parameter_set_id :T_uint8_t;
       reserved1            :T_uint8_t;
       reserved2            :T_uint8_t;
       frame_num            :T_uint16_t;
       idr_pic_id           :T_uint16_t;
       PicOrderCnt          :array [ 0..STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_LIST_SIZE-1 ] of T_int32_t;
     end;
     P_StdVideoDecodeH264PictureInfo = ^T_StdVideoDecodeH264PictureInfo;

type T_StdVideoDecodeH264ReferenceInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property top_field_flag               :T_uint32_t index $000001 read GetBits write SetBits;
       property bottom_field_flag            :T_uint32_t index $000101 read GetBits write SetBits;
       property used_for_long_term_reference :T_uint32_t index $000201 read GetBits write SetBits;
       property is_non_existing              :T_uint32_t index $000301 read GetBits write SetBits;
     end;
     P_StdVideoDecodeH264ReferenceInfoFlags = ^T_StdVideoDecodeH264ReferenceInfoFlags;

type T_StdVideoDecodeH264ReferenceInfo = record
       flags       :T_StdVideoDecodeH264ReferenceInfoFlags;
       FrameNum    :T_uint16_t;
       reserved    :T_uint16_t;
       PicOrderCnt :array [ 0..STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_LIST_SIZE-1 ] of T_int32_t;
     end;
     P_StdVideoDecodeH264ReferenceInfo = ^T_StdVideoDecodeH264ReferenceInfo;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoDecodeH264PictureInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoDecodeH264PictureInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoDecodeH264ReferenceInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoDecodeH264ReferenceInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
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
