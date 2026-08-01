#!/usr/bin/perl
# ---------------------------------------------------------------------------
#  vkfuncs.pl : vulkan_core.h / vulkan_win32.h から vulkan_functions.pas を生成する
# ---------------------------------------------------------------------------
use strict;
use warnings;

my ( $CORE, $WIN32, $OUT ) = @ARGV;
die "usage: vkfuncs.pl <vulkan_core.h> <vulkan_win32.h> <out.pas>\n" unless $OUT;

# 第 1 引数の型からディスパッチ階層を決める
my %DEVLVL  = map { $_ => 1 } qw( VkDevice VkQueue VkCommandBuffer );
my %INSTLVL = map { $_ => 1 } qw( VkInstance VkPhysicalDevice );

sub scan {
    my ($file) = @_;
    open my $h, '<:raw', $file or die "$file: $!";
    my @l = <$h>;
    close $h;
    chomp @l;
    s/\r$// for @l;

    my ( %first, @cmds, $blk );
    my $txt = join( "\n", @l );

    # PFN の第 1 引数の型を拾う
    while ( $txt =~ /typedef\s+.*?\(\s*VKAPI_PTR\s*\*\s*(PFN_vk\w+)\s*\)\s*\(([^;]*?)\)\s*;/gs ) {
        my ( $n, $args ) = ( $1, $2 );
        $args =~ s/\s+/ /g;
        my ($f) = split /\s*,\s*/, $args;
        $f = '' unless defined $f;
        $f =~ s/\bconst\b//g;
        my ($t) = ( $f =~ /([A-Za-z_]\w*)/ );
        $first{$n} = defined $t ? $t : '';
        $first{$n} = 'ptr' if $f =~ /\*/;
    }

    # 実体のあるコマンド（プロトタイプ宣言されているもの）をブロック順に拾う
    for my $i ( 0 .. $#l ) {
        $blk = $1 if $l[$i] =~ /^#define\s+(VK_[A-Za-z0-9_]+)\s+1\s*$/;
        next unless $l[$i] =~ /^VKAPI_ATTR\s+.*\bVKAPI_CALL\s+(vk\w+)\s*\(/;
        push @cmds, [ $1, $blk, $first{"PFN_$1"} // '' ];
    }
    return @cmds;
}

my @core  = scan($CORE);
my @win32 = scan($WIN32);

sub level {
    my ($t) = @_;
    return 'D' if $DEVLVL{$t};
    return 'I' if $INSTLVL{$t};
    return 'G';
}

# ---------------------------------------------------------------------------
my @O;
sub o { push @O, @_ }

my $w = 0;
for ( @core, @win32 ) { $w = length( $_->[0] ) if length( $_->[0] ) > $w }
my $tw = $w + 8;    # T_PFN_ + name

o('unit vulkan_functions;');
o('');
o('interface //#################################################################### ■');
o('');
o('uses LUX.Code.C,');
     o('     vk_platform,');
o('     vulkan_core');
o('     {$IFDEF MSWINDOWS}, vulkan_win32 {$ENDIF};');
o('');
o('const');
o("     {\$IF Defined(MSWINDOWS)} DLLNAME = 'vulkan-1.dll';");
o("     {\$ELSEIF Defined(MACOS)} DLLNAME = 'libvulkan.1.dylib';");
o("     {\$ELSEIF Defined(ANDROID)} DLLNAME = 'libvulkan.so';");
o("     {\$ELSE} DLLNAME = 'libvulkan.so.1';");
o('     {$ENDIF}');
o('');

my $blk = '';
for my $c (@core) {
    if ( ( $c->[1] // '' ) ne $blk ) { $blk = $c->[1] // ''; o(''); o("// $blk") }
    o( sprintf( 'var %-*s :%-*s;', $w, $c->[0], $tw, 'T_PFN_' . $c->[0] ) );
}
o('');
o('{$IFDEF MSWINDOWS}');
$blk = '';
for my $c (@win32) {
    if ( ( $c->[1] // '' ) ne $blk ) { $blk = $c->[1] // ''; o(''); o("// $blk") }
    o( sprintf( 'var %-*s :%-*s;', $w, $c->[0], $tw, 'T_PFN_' . $c->[0] ) );
}
o('');
o('{$ENDIF}');
o('');
o('// vulkan-1.dll が公開している入口（コア＋一部の WSI）を取得する。');
o('function LoadFunctions( const LibName_:String = DLLNAME ) :Boolean;');
o('');
o('// vkGetInstanceProcAddr 経由で、インスタンス以下の全入口を取得する。');
o('// 拡張の関数は DLL から公開されていないので、拡張を使うにはこちらが必須。');
o('procedure LoadInstanceFunctions( const instance_:T_VkInstance );');
o('');
o('// vkGetDeviceProcAddr 経由で、デバイス階層の入口を取得し直す。');
o('// ローダのトランポリンを介さなくなるので、呼び出しが速くなる。');
o('procedure LoadDeviceFunctions( const device_:T_VkDevice );');
o('');
o('implementation //############################################################### ■');
o('');
o('uses {$IFDEF MSWINDOWS} Winapi.Windows, {$ENDIF} System.SysUtils;');
o('');
o('type');
o('     T_GetInstanceProc = function( instance_:T_VkInstance; const pName_:P_char ) :Pointer;');
o('                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}');
o('     T_GetDeviceProc   = function( device_:T_VkDevice; const pName_:P_char ) :Pointer;');
o('                         {$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}');
o('');
o('var');
o('   _VulkanLib       :HMODULE = 0;');
o('   _GetInstanceProc :T_GetInstanceProc = nil;');
o('   _GetDeviceProc   :T_GetDeviceProc   = nil;');
o('');

# --- LoadFunctions ---------------------------------------------------------
o('function LoadFunctions( const LibName_:String ) :Boolean;');
o('begin');
o('     if _VulkanLib <> 0 then Exit( True );');
o('');
o('     _VulkanLib := SafeLoadLibrary( LibName_ );');
o('');
o('     Result := _VulkanLib <> 0;');
o('');
o('     if not Result then Exit;');
o('');
for my $c (@core) {
    o( sprintf( "     %-*s := GetProcAddress( _VulkanLib, '%s' );", $w, $c->[0], $c->[0] ) );
}
o('');
o('     {$IFDEF MSWINDOWS}');
for my $c (@win32) {
    o( sprintf( "     %-*s := GetProcAddress( _VulkanLib, '%s' );", $w, $c->[0], $c->[0] ) );
}
o('     {$ENDIF}');
o('');
o('     _GetInstanceProc := GetProcAddress( _VulkanLib, \'vkGetInstanceProcAddr\' );');
o('     _GetDeviceProc   := GetProcAddress( _VulkanLib, \'vkGetDeviceProcAddr\'   );');
o('end;');
o('');

# --- LoadInstanceFunctions -------------------------------------------------
o('procedure LoadInstanceFunctions( const instance_:T_VkInstance );');
o('');
o('     procedure P( var Proc_; const Name_:P_char );');
o('     begin');
o('          Pointer( Proc_ ) := _GetInstanceProc( instance_, Name_ );');
o('     end;');
o('');
o('begin');
o('     if not Assigned( _GetInstanceProc ) then Exit;');
o('');
for my $c ( @core ) {
    next if level( $c->[2] ) eq 'G';
    o( sprintf( "     P( %-*s, '%s' );", $w, $c->[0], $c->[0] ) );
}
o('');
o('     {$IFDEF MSWINDOWS}');
for my $c (@win32) {
    next if level( $c->[2] ) eq 'G';
    o( sprintf( "     P( %-*s, '%s' );", $w, $c->[0], $c->[0] ) );
}
o('     {$ENDIF}');
o('end;');
o('');

# --- LoadDeviceFunctions ---------------------------------------------------
o('procedure LoadDeviceFunctions( const device_:T_VkDevice );');
o('');
o('     procedure P( var Proc_; const Name_:P_char );');
o('     var');
o('        A :Pointer;');
o('     begin');
o('          A := _GetDeviceProc( device_, Name_ );');
o('          if Assigned( A ) then Pointer( Proc_ ) := A;');
o('     end;');
o('');
o('begin');
o('     if not Assigned( _GetDeviceProc ) then Exit;');
o('');
for my $c (@core) {
    next unless level( $c->[2] ) eq 'D';
    o( sprintf( "     P( %-*s, '%s' );", $w, $c->[0], $c->[0] ) );
}
o('');
o('     {$IFDEF MSWINDOWS}');
for my $c (@win32) {
    next unless level( $c->[2] ) eq 'D';
    o( sprintf( "     P( %-*s, '%s' );", $w, $c->[0], $c->[0] ) );
}
o('     {$ENDIF}');
o('end;');
o('');
o('end. //######################################################################### ■');

open my $F, '>:raw', $OUT or die "$OUT: $!";
print $F "\x{EF}\x{BB}\x{BF}";
print $F join( "\r\n", @O ), "\r\n";
close $F;

my ( $g, $ii, $d ) = ( 0, 0, 0 );
for ( @core, @win32 ) {
    my $x = level( $_->[2] );
    $g++ if $x eq 'G';
    $ii++ if $x eq 'I';
    $d++ if $x eq 'D';
}
printf STDERR "%s: コマンド %d（global %d / instance %d / device %d）\n",
  $OUT, scalar(@core) + scalar(@win32), $g, $ii, $d;
