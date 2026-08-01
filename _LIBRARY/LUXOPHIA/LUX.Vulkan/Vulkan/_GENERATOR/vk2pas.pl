#!/usr/bin/perl
# ---------------------------------------------------------------------------
#  vk2pas.pl : Vulkan-Headers の C ヘッダを Object Pascal へ機械翻訳する
#
#  usage: perl vk2pas.pl --in=<x.h> --out=<x.pas> --unit=<name>
#                        [--uses=A,B,...] [--only=BLOCK,BLOCK] [--macros]
# ---------------------------------------------------------------------------
use strict;
use warnings;

my %opt = ( uses => '', only => '', macros => 0 );
for (@ARGV) {
    if (/^--(\w+)=(.*)$/) { $opt{$1} = $2 }
    elsif (/^--(\w+)$/)   { $opt{$1} = 1  }
}
die "need --in --out --unit\n" unless $opt{in} && $opt{out} && $opt{unit};

my %ONLY;                                   # 翻訳対象ブロックの限定（検証用）
if ( $opt{only} ne '' ) { $ONLY{$_} = 1 for split /,/, $opt{only} }
my $LIMIT = %ONLY ? 1 : 0;

open my $IN, '<:raw', $opt{in} or die "$opt{in}: $!";
my @L = <$IN>;
close $IN;
chomp @L;
s/\r$// for @L;

# ---------------------------------------------------------------------------
#  事前走査：二重ポインタが要る型／自己参照構造体を拾う
# ---------------------------------------------------------------------------
my %NEED_PP;
for (@L) {
    $NEED_PP{$1} = 1 while /([A-Za-z_]\w*)\s*\*\s*(?:const\s*)?\*/g;
}

# ---------------------------------------------------------------------------
#  型名の対応
# ---------------------------------------------------------------------------
my %CBASE = map { $_ => 1 } qw(
    void char float double int size_t
    int8_t uint8_t int16_t uint16_t int32_t uint32_t int64_t uint64_t
    HANDLE DWORD LPCWSTR HINSTANCE HWND SECURITY_ATTRIBUTES HMONITOR
    intptr_t uintptr_t wchar_t
);

# Object Pascal の予約語（フィールド名の衝突は & で回避する）
my %RESERVED = map { $_ => 1 } qw(
    and array as asm begin case class const constructor destructor dispinterface
    div do downto else end except exports file finalization finally for function
    goto if implementation in inherited initialization inline interface is label
    library mod nil not object of or out packed procedure program property raise
    record repeat resourcestring set shl shr string then threadvar to try type
    unit until uses var while with xor
);

sub pas_ident {
    my ($n) = @_;
    return $RESERVED{ lc $n } ? "&$n" : $n;
}

# 配列の要素数：整数リテラルならその場で評価する
sub pas_bound {
    my ($d) = @_;
    return ( $d - 1 ) if $d =~ /^\d+$/;
    return "$d-1";
}

sub pas_type {
    my ( $base, $depth ) = @_;
    my $p = $depth == 0 ? 'T_' : $depth == 1 ? 'P_' : 'PP_';
    return $p . $base;
}

# C の型指定子（"const VkFoo *" 等）を [基底名, ポインタ段数] に分解する
sub split_type {
    my ($s) = @_;
    $s =~ s/\bconst\b//g;
    $s =~ s/\bstruct\b//g;
    my $depth = ( $s =~ tr/*// );
    $s =~ s/[*\s]//g;
    return ( $s, $depth );
}

# ---------------------------------------------------------------------------
#  出力バッファと定数の桁揃え
# ---------------------------------------------------------------------------
my @OUT;                                    # 出力行
my @CBUF;                                   # 定数の一時バッファ [名前, 値, 註釈]

sub flush_consts {
    return unless @CBUF;
    my $w = 0;
    for (@CBUF) { $w = length( $_->[0] ) if length( $_->[0] ) > $w }
    for (@CBUF) {
        my $t = sprintf( 'const %-*s = %s;', $w, $_->[0], $_->[1] );
        $t .= $_->[2] if defined $_->[2] && $_->[2] ne '';
        push @OUT, $t;
    }
    @CBUF = ();
}

sub emit  { flush_consts(); push @OUT, @_ }
sub konst { push @CBUF, [ $_[0], $_[1], $_[2] ] }

# ---------------------------------------------------------------------------
#  C の定数式を Pascal へ
# ---------------------------------------------------------------------------
sub cvalue {
    my ($v) = @_;
    $v =~ s/^\s+|\s+$//g;
    $v =~ s/\s*$//;
    return 'T_uint32_t( $FFFFFFFF )'          if $v eq '(~0U)'  || $v eq '(~0u)';
    return 'T_uint32_t( $FFFFFFFE )'          if $v eq '(~1U)';
    return 'T_uint32_t( $FFFFFFFD )'          if $v eq '(~2U)';
    return 'T_uint64_t( $FFFFFFFFFFFFFFFF )'  if $v =~ /^\(~0ULL\)$/;
    $v =~ s/^\((.*)\)$/$1/ if $v =~ /^\([^()]*\)$/;
    $v =~ s/(\d*\.\d+|\d+\.\d*)[fF]\b/$1/g;                    # 浮動小数の f 接尾辞（16進より先に）
    $v =~ s/\b0[xX]([0-9A-Fa-f]+)(?:[uUlL]+)?\b/'$'.uc($1)/ge;
    $v =~ s/(\d)[uU][lL]*\b/$1/g;
    $v =~ s/\bVK_MAKE_API_VERSION\(\s*(\S+?)\s*,\s*(\S+?)\s*,\s*(\S+?)\s*,\s*(\S+?)\s*\)/( $1 shl 29 ) or ( $2 shl 22 ) or ( $3 shl 12 ) or $4/g;
    $v =~ s/\bVK_MAKE_VIDEO_STD_VERSION\(\s*(\S+?)\s*,\s*(\S+?)\s*,\s*(\S+?)\s*\)/( $1 shl 22 ) or ( $2 shl 12 ) or $3/g;
    return $v;
}

# ---------------------------------------------------------------------------
#  ブロック（フィーチャー）の取捨
# ---------------------------------------------------------------------------
my $CURBLK = '';
my $SKIP   = 0;
sub active { return !$LIMIT || !$SKIP }

# ---------------------------------------------------------------------------
#  本体の走査
# ---------------------------------------------------------------------------
my $i        = 0;
my $started  = 0;                            # 先頭の著作権コメントを食べたか
my @HEADCMT;
my @UNHANDLED;
my @BITREC;                                  # ビットフィールドを持つ record 名

while ( $i < @L ) {
    my $l = $L[$i];

    # --- 先頭の /* */ コメント群は unit ヘッダへ ---------------------------
    if ( !$started && $l =~ m{^/\*} ) {
        my @c;
        while ( $i < @L ) { push @c, $L[$i]; last if $L[ $i++ ] =~ m{\*/} }
        push @HEADCMT, map { my $t = $_; $t =~ s{^/\*}{(*}; $t =~ s{\*/$}{*)}; $t } @c;
        push @HEADCMT, '';
        next;
    }

    # --- 空行 -------------------------------------------------------------
    if ( $l =~ /^\s*$/ ) { emit('') if active(); $i++; next }

    # --- 行コメント -------------------------------------------------------
    if ( $l =~ m{^\s*//} ) { my $t = $l; $t =~ s/^\s+//; emit($t) if active(); $i++; next }

    # --- ブロックコメント -------------------------------------------------
    if ( $l =~ m{^\s*/\*} ) {
        my @c;
        while ( $i < @L ) { push @c, $L[$i]; last if $L[ $i++ ] =~ m{\*/} }
        if ( active() ) {
            emit( map { my $t = $_; $t =~ s{/\*}{(*}; $t =~ s{\*/}{*)}; $t } @c );
        }
        next;
    }

    # --- プリプロセッサ ---------------------------------------------------
    if ( $l =~ /^\s*#/ ) { handle_define(); next }

    # --- 型定義 -----------------------------------------------------------
    if ( $l =~ /^\s*typedef\b/ ) { handle_typedef(); next }

    # --- 64bit フラグビット定数 -------------------------------------------
    if ( $l =~ /^\s*static\s+const\s+(\w+)\s+(\w+)\s*=\s*(.+?);\s*$/ ) {
        konst( $2, "T_$1( " . cvalue($3) . ' )' ) if active();
        $i++;
        next;
    }

    # --- ハンドル宣言マクロ -----------------------------------------------
    if ( $l =~ /^\s*VK_DEFINE_(NON_DISPATCHABLE_)?HANDLE\(\s*(\w+)\s*\)\s*$/ ) {
        emit_handle( $2, $1 ? 1 : 0 ) if active();
        $i++;
        next;
    }

    # --- 関数プロトタイプ（VK_NO_PROTOTYPES 側）は落とす ------------------
    if ( $l =~ /^\s*VKAPI_ATTR\b/ ) {
        while ( $i < @L && $L[ $i++ ] !~ /;\s*$/ ) { }
        next;
    }

    # --- extern "C" 等 ----------------------------------------------------
    if ( $l =~ /^\s*(extern\s+"C"|\}|\{)/ ) { $i++; next }

    push @UNHANDLED, sprintf( '%5d: %s', $i + 1, $l );
    $i++;
}

# ---------------------------------------------------------------------------
sub handle_define {
    my $l = $L[$i];

    # 継続行つきマクロ（VK_MAKE_API_VERSION 等）はコメントとして写す
    if ( $l =~ /\\\s*$/ ) {
        while ( $i < @L ) {
            emit( '//' . $L[$i] ) if active();
            last unless $L[ $i++ ] =~ /\\\s*$/;
        }
        return;
    }

    $i++;

    # フィーチャーブロックの開始
    if ( $l =~ /^#define\s+(VK_[A-Za-z0-9_]+)\s+1\s*$/ && $1 !~ /^VK_[A-Z0-9_]+$/ ) {
        $CURBLK = $1;
        $SKIP   = $LIMIT && !$ONLY{$CURBLK};
        return if $SKIP;
        konst( $CURBLK, 1 );
        return;
    }
    if ( $l =~ /^#define\s+(VK_VERSION_1_\d)\s+1\s*$/ ) {
        $CURBLK = $1;
        $SKIP   = $LIMIT && !$ONLY{$CURBLK};
        return if $SKIP;
        konst( $CURBLK, 1 );
        return;
    }
    return unless active();

    # ヘッダガード
    if ( $l =~ /^#define\s+(\w+_H_)\s+1\s*$/ ) { konst( $1, 1 ); return }

    # ユニット名と同名のフィーチャーガード（vk_video 系）は宣言できないので註釈にする
    if ( $l =~ /^#define\s+(\w+)\s+1\s*$/ && $1 eq $opt{unit} ) {
        emit( '//' . $l . '   ← ユニット名と同名のため定数にはできない' );
        return;
    }

    # 関数形式マクロ／ハンドル定義マクロはコメント
    if ( $l =~ /^#define\s+\w+\(/ ) { emit( '//' . $l ); return }

    # 値つき define
    if ( $l =~ m{^#define\s+(\w+)\s+(.+?)\s*(//.*)?$} ) {
        my ( $n, $v, $c ) = ( $1, $2, $3 );
        if ( $n eq 'VK_NULL_HANDLE' ) {
            emit('{$IF Defined( CPU64BITS ) }');
            emit('const VK_NULL_HANDLE :Pointer = nil;');
            emit('{$ELSE}');
            emit('const VK_NULL_HANDLE = 0;');
            emit('{$ENDIF}');
            return;
        }
        $v =~ s{\s*//.*$}{};
        if ( $v =~ /^"(.*)"$/ ) { konst( $n, "'$1'", $c ); return }
        konst( $n, cvalue($v), $c );
        return;
    }

    # #ifdef / #endif / #include などはコメントとして残す
    emit( '//' . $l );
}

# ---------------------------------------------------------------------------
sub emit_handle {
    my ( $n, $nondisp ) = @_;
    my $pp = $NEED_PP{$n} ? "  PP_$n = ^P_$n;" : '';
    emit( ( $nondisp ? '//VK_DEFINE_NON_DISPATCHABLE_HANDLE' : '//VK_DEFINE_HANDLE' ) . "($n)" );
    if ($nondisp) {
        emit('{$IF Defined( CPU64BITS ) }');
        emit("type T_$n = ^T__$n;  T__$n = record end;  P_$n = ^T_$n;$pp");
        emit('{$ELSE}');
        emit("type T_$n = T_uint64_t;  P_$n = ^T_$n;$pp");
        emit('{$ENDIF}');
    }
    else {
        emit("type T_$n = ^T__$n;  T__$n = record end;  P_$n = ^T_$n;$pp");
    }
}

# ---------------------------------------------------------------------------
sub handle_typedef {
    my $l = $L[$i];

    # --- enum ------------------------------------------------------------
    if ( $l =~ /^\s*typedef\s+enum\s+(\w+)\s*\{/ ) { return emit_enum($1) }

    # --- struct / union --------------------------------------------------
    if ( $l =~ /^\s*typedef\s+(struct|union)\s+(\w+)\s*\{/ ) { return emit_record( $2, $1 ) }

    # --- 前方宣言 typedef struct X X; -------------------------------------
    if ( $l =~ /^\s*typedef\s+struct\s+(\w+)\s+\1\s*;/ ) { $i++; return }

    # --- 関数ポインタ ------------------------------------------------------
    if ( $l =~ /\(\s*VKAPI_PTR\s*\*\s*(PFN_\w+)\s*\)/ ) { return emit_pfn() }
    if ( $l =~ /\(\s*\*\s*(PFN_\w+)\s*\)/ )             { return emit_pfn() }

    # --- 単純 typedef ------------------------------------------------------
    if ( $l =~ /^\s*typedef\s+(.+?)\s*(\w+)\s*;\s*(.*)$/ ) {
        my ( $ts, $n, $c ) = ( $1, $2, $3 );
        $i++;
        return unless active();
        my ( $b, $d ) = split_type($ts);
        my $src = $CBASE{$b} ? pas_type( $b, $d ) : pas_type( $b, $d );
        my $pp = $NEED_PP{$n} ? "  PP_$n = ^P_$n;" : '';
        emit( "type T_$n = $src;  P_$n = ^T_$n;$pp" . ( $c ? " $c" : '' ) );
        return;
    }

    push @UNHANDLED, sprintf( '%5d: %s', $i + 1, $l );
    $i++;
}

# ---------------------------------------------------------------------------
sub emit_enum {
    my ($n) = @_;
    my @body;
    $i++;
    while ( $i < @L ) {
        last if $L[$i] =~ /^\s*\}\s*\Q$n\E\s*;/;
        push @body, $L[$i];
        $i++;
    }
    $i++;
    return unless active();

    emit("//typedef enum $n {");
    emit("type T_$n = T_int32_t;  P_$n = ^T_$n;");
    for my $b (@body) {
        if ( $b =~ m{^\s*//} )   { emit( trim($b) ); next }
        if ( $b =~ /^\s*#/ )     { emit( '//' . trim($b) ); next }
        if ( $b =~ /^\s*$/ )     { emit(''); next }
        if ( $b =~ m{^\s*(\w+)\s*=\s*(.+?),?\s*(//.*)?$} ) {
            my ( $nm, $v, $c ) = ( $1, $2, $3 );
            $v =~ s/,\s*$//;
            konst( $nm, cvalue($v), $c ? " $c" : '' );
            next;
        }
        push @UNHANDLED, "enum $n: $b";
    }
    emit("//} $n;");
}

sub trim { my $t = shift; $t =~ s/^\s+|\s+$//g; return $t }

# ---------------------------------------------------------------------------
sub emit_record {
    my ( $n, $kind ) = @_;
    my @body;
    $i++;
    while ( $i < @L ) {
        last if $L[$i] =~ /^\s*\}\s*\Q$n\E\s*;/;
        push @body, $L[$i];
        $i++;
    }
    $i++;
    return unless active();

    # フィールドを解析
    my @f;                                   # [名前, 型, 註釈, ビット幅]
    my $selfref = 0;
    for my $b (@body) {
        next if $b =~ /^\s*$/;
        if ( $b =~ m{^\s*//} || $b =~ /^\s*#/ ) { push @f, [ undef, trim($b) ]; next }
        if ( $b =~ /^\s*(.+?)\s*\b(\w+)\s*((?:\[[^\]]*\])*)\s*(?::\s*(\d+))?\s*;\s*(.*)$/ ) {
            my ( $ts, $nm, $ar, $bits, $c ) = ( $1, $2, $3, $4, $5 );
            my ( $bt, $dp ) = split_type($ts);
            $selfref = 1 if $bt eq $n;
            my $ty = pas_type( $bt, $dp );
            if ( $ar ne '' ) {
                my @dims = ( $ar =~ /\[([^\]]*)\]/g );
                for my $d ( reverse @dims ) { $ty = 'array [ 0..' . pas_bound($d) . " ] of $ty" }
            }
            push @f, [ pas_ident($nm), $ty, $c, $bits ];
            next;
        }
        push @UNHANDLED, "record $n: $b";
    }

    my $has_bits = grep { defined $_->[0] && defined $_->[3] } @f;
    push @BITREC, $n if $has_bits;

    my $pp = $NEED_PP{$n} ? "\n     PP_$n = ^P_$n;" : '';

    if ( $kind eq 'union' ) {
        my $w = 0;
        for (@f) { next unless defined $_->[0]; $w = length( $_->[0] ) if length( $_->[0] ) > $w }
        my $tw = 0;
        for (@f) { next unless defined $_->[0]; $tw = length( $_->[1] ) if length( $_->[1] ) > $tw }
        emit("type T_$n = record");
        emit('       case Byte of');
        my $k = 0;
        for my $x (@f) {
            unless ( defined $x->[0] ) { emit( '         ' . $x->[1] ); next }
            emit( sprintf( '         %d: ( %-*s :%-*s );', $k++, $w, $x->[0], $tw + 1, $x->[1] . ';' ) );
        }
        emit('     end;');
        emit("     P_$n = ^T_$n;$pp");
        return;
    }

    # ビットフィールドを 32bit の格納語へ畳む
    # （vk_video のビットフィールド構造体は全フィールドがビットフィールドなので
    #   格納語は先頭から 4 バイト刻みに並ぶ）
    my @out;                                 # 通常フィールド
    my @props;                               # [名前, バイト位置, シフト, 幅]
    my $words  = 0;                          # 生成した格納語の数
    my $bitpos = 32;                         # 現在の格納語の使用済みビット数
    for my $x (@f) {
        unless ( defined $x->[0] ) { push @out, [ undef, $x->[1] ]; next }
        if ( defined $x->[3] ) {
            my $w = $x->[3];
            if ( $bitpos + $w > 32 ) {
                push @out, [ sprintf( '_bits%d', $words ), 'T_uint32_t', '' ];
                $words++;
                $bitpos = 0;
            }
            push @props, [ $x->[0], ( $words - 1 ) * 4, $bitpos, $w ];
            $bitpos += $w;
            next;
        }
        $bitpos = 32;
        push @out, $x;
    }

    my $w = 0;
    for (@out) { next unless defined $_->[0]; $w = length( $_->[0] ) if length( $_->[0] ) > $w }

    my @lines;
    push @lines, "type T_$n = record";
    for my $x (@out) {
        unless ( defined $x->[0] ) { push @lines, '       ' . $x->[1]; next }
        my $t = sprintf( '       %-*s :%s;', $w, $x->[0], $x->[1] );
        $t .= ' ' . $x->[2] if defined $x->[2] && $x->[2] ne '';
        push @lines, $t;
    }
    if (@props) {
        my $pw = 0;
        for (@props) { $pw = length( $_->[0] ) if length( $_->[0] ) > $pw }
        push @lines, '     private';
        push @lines, '       function  GetBits( const I_:Integer ) :T_uint32_t; inline;';
        push @lines, '       procedure SetBits( const I_:Integer; const V_:T_uint32_t ); inline;';
        push @lines, '     public';
        for my $p (@props) {
            push @lines,
              sprintf(
                '       property %-*s :T_uint32_t index $%06X read GetBits write SetBits;',
                $pw, $p->[0], ( $p->[1] << 16 ) | ( $p->[2] << 8 ) | $p->[3]
              );
        }
    }
    push @lines, '     end;';
    push @lines, "     P_$n = ^T_$n;$pp";

    if ($selfref) {
        emit("type P_$n = ^T_$n;");
        shift @lines;
        emit("     T_$n = record");
        pop @lines for ( 1 .. 1 );
        emit(@lines);
    }
    else {
        emit(@lines);
    }
}

# ---------------------------------------------------------------------------
sub emit_pfn {
    my $txt = '';
    while ( $i < @L ) {
        $txt .= ' ' . $L[$i];
        last if $L[ $i++ ] =~ /;\s*$/;
    }
    return unless active();

    $txt =~ s/\s+/ /g;
    unless ( $txt =~ /^\s*typedef\s+(.+?)\s*\(\s*VKAPI_PTR\s*\*\s*(PFN_\w+)\s*\)\s*\((.*)\)\s*;\s*$/ ) {
        push @UNHANDLED, "pfn: $txt";
        return;
    }
    my ( $ret, $name, $args ) = ( $1, $2, $3 );

    my ( $rb, $rd ) = split_type($ret);
    my $isproc = ( $rb eq 'void' && $rd == 0 );
    my $rtype = $isproc ? '' : pas_type( $rb, $rd );

    my @p;
    if ( $args !~ /^\s*(void)?\s*$/ ) {
        for my $a ( split /\s*,\s*/, $args ) {
            next if $a =~ /^\s*$/;
            unless ( $a =~ /^\s*(.+?)\s*\b(\w+)\s*((?:\[[^\]]*\])*)\s*$/ ) {
                push @UNHANDLED, "pfn arg: $a"; next;
            }
            my ( $ts, $nm, $ar ) = ( $1, $2, $3 );
            my $isconst = ( $ts =~ /^\s*const\b/ ) ? 1 : 0;
            my ( $b, $d ) = split_type($ts);
            $d += ( $ar =~ tr/[// );        # C の配列引数はポインタへ縮退する
            push @p, [ $isconst, $nm . '_', pas_type( $b, $d ) ];
        }
    }

    my $head = "T_$name = " . ( $isproc ? 'procedure' : 'function' );
    my $base = length("T_$name = ");
    my $conv = ( ' ' x $base ) . '{$IFDEF MSWINDOWS} stdcall; {$ELSE} cdecl; {$ENDIF}';

    emit('type');
    unless (@p) {
        emit( $head . ( $isproc ? ';' : " :$rtype;" ) );
        emit($conv);
        return;
    }

    my $anyconst = grep { $_->[0] } @p;
    my $nw = 0;
    for (@p) { $nw = length( $_->[1] ) if length( $_->[1] ) > $nw }
    my $ind = ' ' x ( $base + length( $isproc ? 'procedure(' : 'function(' ) + 1 );

    my @lines;
    for my $k ( 0 .. $#p ) {
        my $pre = $anyconst ? ( $p[$k][0] ? 'const ' : ' ' x 6 ) : '';
        my $t = sprintf( '%s%-*s :%s', $pre, $nw, $p[$k][1], $p[$k][2] );
        $t .= $k == $#p ? ( ' )' . ( $isproc ? ';' : " :$rtype;" ) ) : ';';
        push @lines, ( $k == 0 ? $head . '(' . ' ' : $ind ) . $t;
    }
    emit(@lines);
    emit($conv);
}

# ---------------------------------------------------------------------------
#  出力
# ---------------------------------------------------------------------------
flush_consts();

my @U = ( split /,/, $opt{uses} );
my $uses = '';
if (@U) {
    $uses = "uses " . $U[0];
    for my $k ( 1 .. $#U ) { $uses .= ",\n     " . $U[$k] }
    $uses .= ";";
}

# 末尾の空行を整理
pop @OUT while @OUT && $OUT[-1] =~ /^\s*$/;

my @HDR;
push @HDR, "unit $opt{unit};";
push @HDR, '';
push @HDR, @HEADCMT;
push @HDR, 'interface //#################################################################### ■';
push @HDR, '';
push @HDR, $uses if $uses ne '';
push @HDR, '' if $uses ne '';

my @IMPL;
push @IMPL, '';
push @IMPL, 'implementation //############################################################### ■';
push @IMPL, '';

if ( $opt{videomacros} ) {
    push @HDR, 'function VK_MAKE_VIDEO_STD_VERSION( const major_,minor_,patch_:T_uint32_t ) :T_uint32_t; inline;';
    push @HDR, '';
    push @IMPL, <<'EOT';
function VK_MAKE_VIDEO_STD_VERSION( const major_,minor_,patch_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( major_ shl 22 ) or ( minor_ shl 12 ) or patch_;
end;
EOT
}

if ( $opt{macros} ) {
    push @HDR, 'function VK_MAKE_API_VERSION( const variant_,major_,minor_,patch_:T_uint32_t ) :T_uint32_t; inline;';
    push @HDR, 'function VK_MAKE_VERSION( const major_,minor_,patch_:T_uint32_t ) :T_uint32_t; inline;';
    push @HDR, 'function VK_VERSION_MAJOR( const version_:T_uint32_t ) :T_uint32_t; inline;';
    push @HDR, 'function VK_VERSION_MINOR( const version_:T_uint32_t ) :T_uint32_t; inline;';
    push @HDR, 'function VK_VERSION_PATCH( const version_:T_uint32_t ) :T_uint32_t; inline;';
    push @HDR, 'function VK_API_VERSION_VARIANT( const version_:T_uint32_t ) :T_uint32_t; inline;';
    push @HDR, 'function VK_API_VERSION_MAJOR( const version_:T_uint32_t ) :T_uint32_t; inline;';
    push @HDR, 'function VK_API_VERSION_MINOR( const version_:T_uint32_t ) :T_uint32_t; inline;';
    push @HDR, 'function VK_API_VERSION_PATCH( const version_:T_uint32_t ) :T_uint32_t; inline;';
    push @HDR, '';
    push @IMPL, <<'EOT';
function VK_MAKE_API_VERSION( const variant_,major_,minor_,patch_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( variant_ shl 29 ) or ( major_ shl 22 ) or ( minor_ shl 12 ) or patch_;
end;

function VK_MAKE_VERSION( const major_,minor_,patch_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( major_ shl 22 ) or ( minor_ shl 12 ) or patch_;
end;

function VK_VERSION_MAJOR( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := version_ shr 22;
end;

function VK_VERSION_MINOR( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( version_ shr 12 ) and $3FF;
end;

function VK_VERSION_PATCH( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := version_ and $FFF;
end;

function VK_API_VERSION_VARIANT( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := version_ shr 29;
end;

function VK_API_VERSION_MAJOR( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( version_ shr 22 ) and $7F;
end;

function VK_API_VERSION_MINOR( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := ( version_ shr 12 ) and $3FF;
end;

function VK_API_VERSION_PATCH( const version_:T_uint32_t ) :T_uint32_t;
begin
     Result := version_ and $FFF;
end;
EOT
}

# ビットフィールド用アクセサ
my $BITTMPL = <<'EOT';
function T_%R%.GetBits( const I_:Integer ) :T_uint32_t;
begin
     Result := ( P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) )^ shr ( ( I_ shr 8 ) and $FF ) )
               and ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) );
end;

procedure T_%R%.SetBits( const I_:Integer; const V_:T_uint32_t );
var
   P :P_uint32_t;
   S, M :T_uint32_t;
begin
     P := P_uint32_t( NativeUInt( @Self ) + NativeUInt( I_ shr 16 ) );
     S := ( I_ shr 8 ) and $FF;
     M := ( T_uint32_t( $FFFFFFFF ) shr ( 32 - ( I_ and $FF ) ) ) shl S;
     P^ := ( P^ and not M ) or ( ( V_ shl S ) and M );
end;
EOT

for my $r (@BITREC) {
    my $t = $BITTMPL;
    $t =~ s/%R%/$r/g;
    push @IMPL, $t;
}

push @IMPL, 'end. //######################################################################### ■';

my $TXT = join( "\n", @HDR, @OUT, @IMPL ) . "\n";
$TXT =~ s/\r?\n/\r\n/g;    # 改行を CRLF へ統一（複数行テンプレート内の LF も含めて）
open my $O, '>:raw', $opt{out} or die "$opt{out}: $!";
print $O "\x{EF}\x{BB}\x{BF}", $TXT;
close $O;

if (@UNHANDLED) {
    warn "*** UNHANDLED " . scalar(@UNHANDLED) . " lines ***\n";
    warn "$_\n" for @UNHANDLED[ 0 .. ( @UNHANDLED > 40 ? 39 : $#UNHANDLED ) ];
}
printf STDERR "%s: %d lines, %d unhandled\n", $opt{out}, scalar(@OUT), scalar(@UNHANDLED);
