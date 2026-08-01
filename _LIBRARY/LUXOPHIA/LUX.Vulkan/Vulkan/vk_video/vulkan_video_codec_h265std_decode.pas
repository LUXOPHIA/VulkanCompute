unit vulkan_video_codec_h265std_decode;

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

//#ifndef VULKAN_VIDEO_CODEC_H265STD_DECODE_H_
const VULKAN_VIDEO_CODEC_H265STD_DECODE_H_ = 1;




//#ifdef __cplusplus
//#endif



// vulkan_video_codec_h265std_decode is a preprocessor guard. Do not pass it to API calls.
//#define vulkan_video_codec_h265std_decode 1   ← ユニット名と同名のため定数にはできない
//#include "vulkan_video_codec_h265std.h"

const VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_API_VERSION_1_0_0 = ( 1 shl 22 ) or ( 0 shl 12 ) or 0;

const VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_SPEC_VERSION   = VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_API_VERSION_1_0_0;
const VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_EXTENSION_NAME = 'VK_STD_vulkan_video_codec_h265_decode';
const STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE          = 8;
type T_StdVideoDecodeH265PictureInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property IrapPicFlag                     :T_uint32_t index $000001 read GetBits write SetBits;
       property IdrPicFlag                      :T_uint32_t index $000101 read GetBits write SetBits;
       property IsReference                     :T_uint32_t index $000201 read GetBits write SetBits;
       property short_term_ref_pic_set_sps_flag :T_uint32_t index $000301 read GetBits write SetBits;
     end;
     P_StdVideoDecodeH265PictureInfoFlags = ^T_StdVideoDecodeH265PictureInfoFlags;

type T_StdVideoDecodeH265PictureInfo = record
       flags                        :T_StdVideoDecodeH265PictureInfoFlags;
       sps_video_parameter_set_id   :T_uint8_t;
       pps_seq_parameter_set_id     :T_uint8_t;
       pps_pic_parameter_set_id     :T_uint8_t;
       NumDeltaPocsOfRefRpsIdx      :T_uint8_t;
       PicOrderCntVal               :T_int32_t;
       NumBitsForSTRefPicSetInSlice :T_uint16_t;
       reserved                     :T_uint16_t;
       RefPicSetStCurrBefore        :array [ 0..STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE-1 ] of T_uint8_t;
       RefPicSetStCurrAfter         :array [ 0..STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE-1 ] of T_uint8_t;
       RefPicSetLtCurr              :array [ 0..STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE-1 ] of T_uint8_t;
     end;
     P_StdVideoDecodeH265PictureInfo = ^T_StdVideoDecodeH265PictureInfo;

type T_StdVideoDecodeH265ReferenceInfoFlags = record
       _bits0 :T_uint32_t;
     private
       function  GetBits( const I_:Integer ) :T_uint32_t; inline;
       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;
     public
       property used_for_long_term_reference :T_uint32_t index $000001 read GetBits write SetBits;
       property unused_for_reference         :T_uint32_t index $000101 read GetBits write SetBits;
     end;
     P_StdVideoDecodeH265ReferenceInfoFlags = ^T_StdVideoDecodeH265ReferenceInfoFlags;

type T_StdVideoDecodeH265ReferenceInfo = record
       flags          :T_StdVideoDecodeH265ReferenceInfoFlags;
       PicOrderCntVal :T_int32_t;
     end;
     P_StdVideoDecodeH265ReferenceInfo = ^T_StdVideoDecodeH265ReferenceInfo;


//#ifdef __cplusplus
//#endif

//#endif

implementation //############################################################### ■

function T_StdVideoDecodeH265PictureInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoDecodeH265PictureInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;

function T_StdVideoDecodeH265ReferenceInfoFlags.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_StdVideoDecodeH265ReferenceInfoFlags.SetBits( const I_:Integer; const V_:T_uint32_t );
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
