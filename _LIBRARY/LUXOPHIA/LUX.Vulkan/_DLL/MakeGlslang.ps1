# glslang.dll ビルドスクリプト（Win32 / Win64）
#
#   ：KhronosGroup\glslang（SubTree）のソースから glslang.dll をビルドし、
#   _DLL\Win32 / _DLL\Win64 へ配置する。
#
#   ※ ビルド済みの DLL はリポジトリに収録済みのため、通常このスクリプトの実行は不要。
#      glslang の SubTree を更新した場合にのみ実行する。
#
#   ● 必要なもの
#       ・CMake 3.22.1 以降       https://cmake.org/download/
#       ・MSVC（Visual Studio 2019 以降の C++ ビルドツール）
#       ・Vulkan SDK は不要
#
#   ● 使い方
#       .\MakeGlslang.ps1              → Win32 と Win64 の両方をビルド
#       .\MakeGlslang.ps1 -Arch x64    → _DLL\Win64\glslang.dll のみ
#       .\MakeGlslang.ps1 -Arch x86    → _DLL\Win32\glslang.dll のみ
#
#   ● ビルド構成
#       ・BUILD_SHARED_LIBS=ON：共有ライブラリ（DLL）としてビルドする。
#       ・ENABLE_OPT=OFF：SPIRV-Tools（spirv-opt）に依存しない。
#         LUX.Vulkan は変数名（OpName）を保持した SPIR-V を必要とするため最適化は行なわず、
#         これにより外部依存がゼロになる（update_glslang_sources.py の実行も不要）。
#       ・/MT：CRT を静的リンク。VC++ 再頒布可能パッケージが不要になる。
#       ・CMake は非 ASCII のパスを扱えない場合があるため、ソースを ASCII のみの
#         テンポラリフォルダへ複写してからビルドする。

param(
  [ValidateSet( 'x64', 'x86', 'both' )]
  [string]$Arch = 'both'
)

$ErrorActionPreference = 'Stop'

$DllDir  = Split-Path -Parent $MyInvocation.MyCommand.Path   # ...\LUX.Vulkan\_DLL（本スクリプトの位置）
$Root    = Split-Path -Parent $DllDir                        # ...\LUX.Vulkan
$Glslang = Join-Path $Root '：KhronosGroup\glslang'

if (-not (Test-Path $Glslang)) { throw "glslang の SubTree が見つかりません： $Glslang" }

$CMake = Get-Command cmake -ErrorAction SilentlyContinue
if ($null -eq $CMake) {
  $CMake = Get-ChildItem 'C:\Program Files*\CMake\bin\cmake.exe' -ErrorAction SilentlyContinue | Select-Object -First 1
}
if ($null -eq $CMake) { throw 'cmake が見つかりません（ https://cmake.org/download/ ）' }

$CMakeExe = $CMake.Source
if ($null -eq $CMakeExe) { $CMakeExe = $CMake.FullName }

Write-Output ( 'cmake           : {0}' -f ( & $CMakeExe --version | Select-Object -First 1 ) )

########## ASCII パスへソースを複写
#
#   CMake / MSBuild は「» LUXOPHIA\・Vulkan\：KhronosGroup」のような
#   非 ASCII のパスで失敗することがあるため、テンポラリへ複写してからビルドする。

$TmpRoot = Join-Path $env:TEMP 'glslang-build'
$SrcRoot = Join-Path $TmpRoot 'src'

Remove-Item $SrcRoot -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force $SrcRoot | Out-Null

Write-Output 'copying sources ...'

Copy-Item ( Join-Path $Glslang '*' ) $SrcRoot -Recurse -Force -Exclude '.git*'

########## アーキテクチャごとにビルド

$Targets = if ($Arch -eq 'both') { @( 'x64', 'x86' ) } else { @( $Arch ) }

foreach ($a in $Targets) {

  $Platform = if ($a -eq 'x64') { 'x64' } else { 'Win32' }   # -A に渡す CMake のプラットフォーム名
  $OutDir   = Join-Path $DllDir $( if ($a -eq 'x64') { 'Win64' } else { 'Win32' } )
  $BldDir   = Join-Path $TmpRoot ( 'build-' + $a )

  New-Item -ItemType Directory -Force $OutDir | Out-Null

  Remove-Item $BldDir -Recurse -Force -ErrorAction SilentlyContinue

  Write-Output ''
  Write-Output "===== $Platform ====="

  # cmake は警告を stderr へ出す。PowerShell はそれをエラーレコードとして扱うため、
  # この区間だけ ErrorActionPreference を緩め、成否は終了コードで判定する。
  $EAP = $ErrorActionPreference
  $ErrorActionPreference = 'Continue'

  & $CMakeExe -S $SrcRoot -B $BldDir -A $Platform `
              -DCMAKE_BUILD_TYPE=Release `
              -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded `
              -DBUILD_SHARED_LIBS=ON `
              -DENABLE_OPT=OFF `
              -DENABLE_GLSLANG_BINARIES=OFF `
              -DGLSLANG_TESTS=OFF `
              -DGLSLANG_ENABLE_INSTALL=OFF `
              -DCMAKE_POLICY_DEFAULT_CMP0091=NEW `
              2>&1 | Select-Object -Last 6

  $OK = ( $LASTEXITCODE -eq 0 )

  if ($OK) {
    & $CMakeExe --build $BldDir --config Release --parallel 2>&1 | Select-Object -Last 6

    $OK = ( $LASTEXITCODE -eq 0 )
  }

  $ErrorActionPreference = $EAP

  if (-not $OK) { throw "ビルドに失敗しました（ exit $LASTEXITCODE ）" }

  $Dll = Get-ChildItem $BldDir -Recurse -Filter 'glslang.dll' -File |
         Sort-Object Length -Descending | Select-Object -First 1

  if ($null -eq $Dll) { throw 'glslang.dll が生成されませんでした' }

  Copy-Item $Dll.FullName $OutDir -Force

  Write-Output ( 'OUTPUT          : {0}\glslang.dll ( {1:N0} bytes )' -f $OutDir, $Dll.Length )
}
