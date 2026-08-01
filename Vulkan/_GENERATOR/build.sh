#!/bin/sh
# ---------------------------------------------------------------------------
#  Vulkan-Headers の C ヘッダ一式を Object Pascal へ翻訳し、検証する。
#
#    実行場所 : このフォルダ（Vulkan/_GENERATOR/）
#    入力     : ../../：KhronosGroup/Vulkan-Headers/include/
#    出力     : ../（vulkan_core.pas ほか）と ../vk_video/
#
#  ヘッダを subtree pull で更新したら、これを流し直すだけでよい。
# ---------------------------------------------------------------------------
set -e
INC="../../：KhronosGroup/Vulkan-Headers/include"
OUT=".."
mkdir -p "$OUT/vk_video"

gen() { perl vk2pas.pl "$@"; }

# --- vk_video（vulkan_core.h が #include する依存ヘッダ）--------------------
gen --in="$INC/vk_video/vulkan_video_codecs_common.h"  --out="$OUT/vk_video/vulkan_video_codecs_common.pas"  --unit=vulkan_video_codecs_common  --uses="LUX.Code.C" --videomacros
for c in av1std h264std h265std vp9std; do
  gen --in="$INC/vk_video/vulkan_video_codec_$c.h"     --out="$OUT/vk_video/vulkan_video_codec_$c.pas"       --unit="vulkan_video_codec_$c"     --uses="LUX.Code.C,vulkan_video_codecs_common"
done
for c in av1std_decode av1std_encode h264std_decode h264std_encode h265std_decode h265std_encode vp9std_decode; do
  base=`echo "$c" | sed 's/_.*//'`
  gen --in="$INC/vk_video/vulkan_video_codec_$c.h"     --out="$OUT/vk_video/vulkan_video_codec_$c.pas"       --unit="vulkan_video_codec_$c"     --uses="LUX.Code.C,vulkan_video_codec_$base"
done

# --- vulkan_core / vulkan_win32 --------------------------------------------
VIDEO="vulkan_video_codecs_common,vulkan_video_codec_av1std,vulkan_video_codec_av1std_decode,vulkan_video_codec_av1std_encode,vulkan_video_codec_h264std,vulkan_video_codec_h264std_decode,vulkan_video_codec_h264std_encode,vulkan_video_codec_h265std,vulkan_video_codec_h265std_decode,vulkan_video_codec_h265std_encode,vulkan_video_codec_vp9std,vulkan_video_codec_vp9std_decode"

gen --in="$INC/vulkan/vulkan_core.h"  --out="$OUT/vulkan_core.pas"  --unit=vulkan_core  --uses="LUX.Code.C,vk_platform,$VIDEO" --macros
gen --in="$INC/vulkan/vulkan_win32.h" --out="$OUT/vulkan_win32.pas" --unit=vulkan_win32 --uses="LUX.Code.C,vk_platform,vulkan_core"

# --- vulkan_functions ------------------------------------------------------
perl vkfuncs.pl "$INC/vulkan/vulkan_core.h" "$INC/vulkan/vulkan_win32.h" "$OUT/vulkan_functions.pas"

# --- 検証（ヘッダと .pas を意味単位で突き合わせる）--------------------------
echo
echo "=== verify ==="
perl verify.pl "$INC/vulkan/vulkan_core.h"  "$OUT/vulkan_core.pas"
perl verify.pl "$INC/vulkan/vulkan_win32.h" "$OUT/vulkan_win32.pas"
for h in "$INC/vk_video"/*.h; do
  b=`basename "$h" .h`
  perl verify.pl "$h" "$OUT/vk_video/$b.pas"
done
perl vfuncs.pl "$INC/vulkan/vulkan_core.h" "$INC/vulkan/vulkan_win32.h" "$OUT/vulkan_functions.pas"
