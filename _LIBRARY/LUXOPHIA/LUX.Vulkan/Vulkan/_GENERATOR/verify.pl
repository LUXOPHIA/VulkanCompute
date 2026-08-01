#!/usr/bin/perl
# ---------------------------------------------------------------------------
#  verify.pl : C ヘッダと生成済み .pas を「意味単位」で独立に突き合わせる
#
#    * 構造体・共用体 : フィールドの名前・順序・配列次元・ポインタ段数・ビット幅
#    * 列挙値・定数   : 名前と数値（16進は正規化して比較）
#    * 関数ポインタ型 : 戻り値の有無・引数の名前と型
#
#  ジェネレータとは別実装で解析する（共通バグの見逃しを防ぐ）。
#
#  usage: perl verify.pl <header.h> <unit.pas>
# ---------------------------------------------------------------------------
use strict;
use warnings;

my ( $HF, $PF ) = @ARGV;
die "usage: verify.pl <h> <pas>\n" unless $PF;

my @ERR;
sub err { push @ERR, $_[0] }

# ---------------------------------------------------------------------------
#  共通：型指定子の分解（"const VkFoo* const*" → ( 'VkFoo', 2 )）
# ---------------------------------------------------------------------------
sub ctype {
    my ($s) = @_;
    $s =~ s/\b(const|struct)\b//g;
    my $d = ( $s =~ tr/*// );
    $s =~ s/[*\s]//g;
    return ( $s, $d );
}

sub ptype {    # Pascal 型 → ( 基底, 段数 )  例: PP_char → ( 'char', 2 )
    my ($s) = @_;
    $s =~ s/\s//g;
    return ( $1, 2 ) if $s =~ /^PP_(\w+)$/;
    return ( $1, 1 ) if $s =~ /^P_(\w+)$/;
    return ( $1, 0 ) if $s =~ /^T_(\w+)$/;
    return ( $s, -1 );
}

sub norm_val {    # 数値の正規化（0x1F / $1F / 31 をひとつの表現へ）
    no warnings 'portable';
    my ($v) = @_;
    $v =~ s/^\s+|\s+$//g;
    $v =~ s/[uUlL]+$//   if $v =~ /^-?0[xX]/;                       # 16進の接尾辞（F は桁なので除かない）
    $v =~ s/[uUlLfF]+$// if $v =~ /^-?\d/ && $v !~ /^-?0[xX]/;      # 10進の接尾辞
    return hex($1)      if $v =~ /^0[xX]([0-9A-Fa-f]+)$/;
    return hex($1)      if $v =~ /^\$([0-9A-Fa-f]+)$/;
    return 0 + $v       if $v =~ /^-?\d+$/;
    return "REF:$v";    # 別の識別子への別名
}

# ---------------------------------------------------------------------------
#  Ｃヘッダの解析
# ---------------------------------------------------------------------------
open my $H, '<', $HF or die "$HF: $!";
my @h = <$H>;
close $H;
s/\r?\n$// for @h;

my ( %cstruct, %cunion, %cenum, %cpfn, %chandle, %cdefine );
my $htext = join "\n", @h;

# 構造体・共用体
while ( $htext =~ /typedef\s+(struct|union)\s+(\w+)\s*\{(.*?)\}\s*\2\s*;/gs ) {
    my ( $kind, $name, $body ) = ( $1, $2, $3 );
    my @f;
    for my $l ( split /\n/, $body ) {
        $l =~ s{//.*$}{};
        next unless $l =~ /^\s*(.+?)\s*\b(\w+)\s*((?:\[[^\]]*\])*)\s*(?::\s*(\d+))?\s*;\s*$/;
        my ( $ts, $nm, $ar, $bw ) = ( $1, $2, $3, $4 );
        my ( $b, $d ) = ctype($ts);
        my @dims = ( $ar =~ /\[([^\]]*)\]/g );
        push @f, { n => $nm, b => $b, d => $d, dims => \@dims, bw => $bw };
    }
    if   ( $kind eq 'struct' ) { $cstruct{$name} = \@f }
    else                       { $cunion{$name}  = \@f }
}

# 列挙値（typedef enum の中身）
while ( $htext =~ /typedef\s+enum\s+(\w+)\s*\{(.*?)\}\s*\1\s*;/gs ) {
    my ($body) = ($2);
    for my $l ( split /\n/, $body ) {
        $l =~ s{//.*$}{};
        next unless $l =~ /^\s*(\w+)\s*=\s*([^,]+?)\s*,?\s*$/;
        $cenum{$1} = norm_val($2);
    }
}

# static const（64bit フラグ値）
while ( $htext =~ /^static\s+const\s+\w+\s+(\w+)\s*=\s*(.+?);/gm ) {
    $cenum{$1} = norm_val($2);
}

# 関数ポインタ
while ( $htext =~ /typedef\s+([^\n;()]+?)\s*\(\s*VKAPI_PTR\s*\*\s*(PFN_\w+)\s*\)\s*\((.*?)\)\s*;/gs ) {
    my ( $ret, $name, $args ) = ( $1, $2, $3 );
    $args =~ s/\s+/ /g;
    my ( $rb, $rd ) = ctype($ret);
    my @a;
    unless ( $args =~ /^\s*(void)?\s*$/ ) {
        for my $x ( split /\s*,\s*/, $args ) {
            next unless $x =~ /^\s*(.+?)\s*\b(\w+)\s*((?:\[[^\]]*\])*)\s*$/;
            my ( $ts, $nm, $ar ) = ( $1, $2, $3 );
            my ( $b, $d ) = ctype($ts);
            $d += ( $ar =~ tr/[// );
            push @a, { n => $nm, b => $b, d => $d };
        }
    }
    $cpfn{$name} = { void => ( $rb eq 'void' && $rd == 0 ) ? 1 : 0, ret => "$rb/$rd", args => \@a };
}

# ハンドル
while ( $htext =~ /VK_DEFINE_(?:NON_DISPATCHABLE_)?HANDLE\(\s*(\w+)\s*\)/g ) { $chandle{$1} = 1 unless $1 eq 'object' }

# 値つき #define（文字列と数値）
for my $l (@h) {
    next unless $l =~ m{^#define\s+(VK_\w+)\s+(.+?)\s*(?://.*)?$};
    my ( $n, $v ) = ( $1, $2 );
    next if $v =~ /\\$/ or $n =~ /\(/;
    $cdefine{$n} = $v;
}

# ---------------------------------------------------------------------------
#  Pascal の解析
# ---------------------------------------------------------------------------
open my $P, '<:raw', $PF or die "$PF: $!";
local $/;
my $ptext = <$P>;
close $P;
$ptext =~ s/^\x{EF}\x{BB}\x{BF}//;
$ptext =~ s/\r//g;
my @p = split /\n/, $ptext;

my ( %pstruct, %penum, %ppfn, %phandle, %pbits );

# record（ビットフィールドのプロパティも拾う）
my $i = 0;
while ( $i < @p ) {
    my $l = $p[$i];
    if ( $l =~ /^(?:type\s+|\s+)T_(\w+) = record\s*$/ ) {
        my $name = $1;
        my ( @f, @props );
        $i++;
        my $case = 0;
        while ( $i < @p && $p[$i] !~ /^\s+end;/ ) {
            my $b = $p[$i];
            $i++;
            next if $b =~ m{^\s*//} or $b =~ /^\s*$/ or $b =~ /^\s+(private|public)\s*$/;
            next if $b =~ /GetBits|SetBits/ && $b =~ /function|procedure/;
            if ( $b =~ /^\s+case Byte of/ ) { $case = 1; next }
            if ($case) {
                if ( $b =~ /^\s+\d+:\s*\(\s*(\w+)\s*:\s*(.+?);\s*\);/ ) {
                    my ( $nm, $ty ) = ( $1, $2 );
                    push @f, parse_pfield( $nm, $ty );
                }
                next;
            }
            if ( $b =~ /^\s+property\s+(&?\w+)\s*:T_uint32_t index \$([0-9A-F]+) read GetBits/ ) {
                my ( $nm, $ix ) = ( $1, hex($2) );
                $nm =~ s/^&//;
                push @props, { n => $nm, byte => ( $ix >> 16 ), shift => ( ( $ix >> 8 ) & 0xFF ), w => ( $ix & 0xFF ) };
                next;
            }
            if ( $b =~ /^\s+(&?\w+)\s+:(.+?);/ ) {
                my ( $nm, $ty ) = ( $1, $2 );
                push @f, parse_pfield( $nm, $ty );
                next;
            }
        }
        $i++;
        $pstruct{$name} = { f => \@f, props => \@props };
        next;
    }
    $i++;
}

sub parse_pfield {
    my ( $nm, $ty ) = @_;
    $nm =~ s/^&//;
    my @dims;
    while ( $ty =~ s/^array \[ 0\.\.(.+?) \] of // ) {
        my $d = $1;
        if    ( $d =~ /^(\d+)-1$/ )   { $d = $1 }         # 0..N-1        → N
        elsif ( $d =~ /^(\d+)$/ )     { $d = $1 + 1 }     # 0..N（評価済） → N+1
        elsif ( $d =~ /^(\w+)-1$/ )   { $d = $1 }         # 0..CONST-1    → CONST
        else                          { $d = "($d)+1" }
        push @dims, $d;
    }
    my ( $b, $d ) = ptype($ty);
    return { n => $nm, b => $b, d => $d, dims => \@dims };
}

# 定数
while ( $ptext =~ /^const\s+(\w+)\s*=\s*(.+?);/gm ) {
    my ( $n, $v ) = ( $1, $2 );
    $v =~ s/^T_\w+\(\s*(.+?)\s*\)$/$1/;    # 型キャストを剥がす
    $penum{$n} = norm_val($v);
}

# 関数ポインタ型（複数行を連結して解析）
while ( $ptext =~ /^type\n(T_PFN_\w+ = (?:function|procedure).*?)\{\$IFDEF MSWINDOWS\} stdcall/gms ) {
    my $blk = $1;
    $blk =~ s/\s+/ /g;
    next unless $blk =~ /^(T_PFN_\w+) = (function|procedure)\s*(?:\(\s*(.*?)\s*\))?\s*(?::\s*(\S+?);|;)/;
    my ( $name, $kind, $args, $ret ) = ( $1, $2, $3, $4 );
    $name =~ s/^T_//;
    my @a;
    if ( defined $args && $args ne '' ) {
        for my $x ( split /;/, $args ) {
            next unless $x =~ /(\w+)_\s*:\s*(\S+)\s*$/;
            my ( $nm, $ty ) = ( $1, $2 );
            my ( $b, $d ) = ptype($ty);
            push @a, { n => $nm, b => $b, d => $d };
        }
    }
    my ( $rb, $rd ) = defined $ret ? ptype($ret) : ( 'void', 0 );
    $ppfn{$name} = { void => ( $kind eq 'procedure' ) ? 1 : 0, ret => "$rb/$rd", args => \@a };
}

# ハンドル
while ( $ptext =~ /^type T_(\w+) = \^T__\1;/gm )       { $phandle{$1} = 1 }
while ( $ptext =~ /^type T_(\w+) = T_uint64_t;/gm )     { $phandle{$1} //= 1 }

# ---------------------------------------------------------------------------
#  突き合わせ
# ---------------------------------------------------------------------------

# --- 構造体・共用体 ---------------------------------------------------------
for my $s ( sort keys %cstruct, sort keys %cunion ) {
    my $cf = $cstruct{$s} // $cunion{$s};
    my $ps = $pstruct{$s};
    unless ($ps) { err("struct $s : .pas に存在しない"); next }

    # C のビットフィールドを 32bit 語へ畳んだ「期待レイアウト」を作る
    my ( @exp_plain, @exp_props );
    my ( $word, $pos ) = ( -1, 32 );
    my $wordcnt = 0;
    for my $f (@$cf) {
        if ( defined $f->{bw} ) {
            if ( $pos + $f->{bw} > 32 ) { $wordcnt++; $pos = 0; push @exp_plain, { n => "_bits" . ( $wordcnt - 1 ), b => 'uint32_t', d => 0, dims => [] } }
            push @exp_props, { n => $f->{n}, byte => ( $wordcnt - 1 ) * 4, shift => $pos, w => $f->{bw} };
            $pos += $f->{bw};
            next;
        }
        $pos = 32;
        push @exp_plain, $f;
    }

    # 通常フィールド
    my @pf = @{ $ps->{f} };
    if ( @pf != @exp_plain ) {
        err( "struct $s : フィールド数 " . scalar(@exp_plain) . " に対し .pas は " . scalar(@pf) );
        next;
    }
    for my $k ( 0 .. $#pf ) {
        my ( $c, $q ) = ( $exp_plain[$k], $pf[$k] );
        err("struct $s.$c->{n} : 名前が $q->{n}")          if $c->{n} ne $q->{n};
        if ( !defined $c->{bw} ) {
            err("struct $s.$c->{n} : 型 $c->{b}/$c->{d} に対し $q->{b}/$q->{d}")
              if lc( $c->{b} ) ne lc( $q->{b} ) or $c->{d} != $q->{d};
            my @cd = @{ $c->{dims} // [] };
            my @qd = @{ $q->{dims} // [] };
            err("struct $s.$c->{n} : 配列次元 @cd に対し @qd") if "@cd" ne "@qd";
        }
    }

    # ビットフィールドのプロパティ
    my @pp = @{ $ps->{props} };
    if ( @pp != @exp_props ) {
        err( "struct $s : ビットフィールド " . scalar(@exp_props) . " に対しプロパティ " . scalar(@pp) );
        next;
    }
    for my $k ( 0 .. $#pp ) {
        my ( $c, $q ) = ( $exp_props[$k], $pp[$k] );
        err("bits $s.$c->{n} : 名前が $q->{n}") if $c->{n} ne $q->{n};
        err("bits $s.$c->{n} : 位置 byte$c->{byte}+$c->{shift}:$c->{w} に対し byte$q->{byte}+$q->{shift}:$q->{w}")
          if $c->{byte} != $q->{byte} or $c->{shift} != $q->{shift} or $c->{w} != $q->{w};
    }
}

# --- 列挙値 -----------------------------------------------------------------
my ( $enum_n, $enum_alias ) = ( 0, 0 );
for my $n ( sort keys %cenum ) {
    unless ( exists $penum{$n} ) { err("enum $n : .pas に存在しない"); next }
    my ( $cv, $pv ) = ( $cenum{$n}, $penum{$n} );
    if ( "$cv" =~ /^REF:(.+)$/ ) {    # C 側が別名 → Pascal 側も同じ参照名のはず
        my $r = $1;
        $enum_alias++;
        err("enum $n : 別名 $r に対し $pv") unless "$pv" eq "REF:$r" or ( exists $penum{$r} and "$pv" eq "$penum{$r}" );
        next;
    }
    $enum_n++;
    err("enum $n : 値 $cv に対し $pv") unless "$cv" eq "$pv";
}

# --- 関数ポインタ -----------------------------------------------------------
for my $n ( sort keys %cpfn ) {
    my $c = $cpfn{$n};
    my $q = $ppfn{$n};
    unless ($q) { err("pfn $n : .pas に存在しない"); next }
    err("pfn $n : 戻り値の有無が不一致") if $c->{void} != $q->{void};
    if ( !$c->{void} ) {
        my ( $cb ) = $c->{ret};
        err("pfn $n : 戻り値 $c->{ret} に対し $q->{ret}") if lc( $c->{ret} ) ne lc( $q->{ret} );
    }
    my @ca = @{ $c->{args} };
    my @qa = @{ $q->{args} };
    if ( @ca != @qa ) { err( "pfn $n : 引数 " . scalar(@ca) . " 個に対し " . scalar(@qa) . " 個" ); next }
    for my $k ( 0 .. $#ca ) {
        err("pfn $n 引数$k : $ca[$k]{n} に対し $qa[$k]{n}") if $ca[$k]{n} ne $qa[$k]{n};
        err("pfn $n 引数$k($ca[$k]{n}) : 型 $ca[$k]{b}/$ca[$k]{d} に対し $qa[$k]{b}/$qa[$k]{d}")
          if lc( $ca[$k]{b} ) ne lc( $qa[$k]{b} ) or $ca[$k]{d} != $qa[$k]{d};
    }
}

# --- ハンドル ---------------------------------------------------------------
for my $n ( sort keys %chandle ) {
    err("handle $n : .pas に存在しない") unless $phandle{$n};
}

# --- 文字列 #define（拡張名）------------------------------------------------
my $namecnt = 0;
for my $n ( sort keys %cdefine ) {
    next unless $cdefine{$n} =~ /^"(.*)"$/;
    my $s = $1;
    $namecnt++;
    err("define $n : .pas に存在しない") unless $ptext =~ /^const \Q$n\E\s*= '\Q$s\E';/m;
}

# ---------------------------------------------------------------------------
printf "%-24s 構造体 %4d ／ 列挙値 %5d ＋ 別名 %4d ／ PFN %3d ／ ハンドル %3d ／ 拡張名 %3d\n",
  ( $HF =~ m{([^/\\]+)$} )[0],
  scalar( keys %cstruct ) + scalar( keys %cunion ),
  $enum_n, $enum_alias, scalar( keys %cpfn ), scalar( keys %chandle ), $namecnt;

if (@ERR) {
    print "  *** 不一致 " . scalar(@ERR) . " 件 ***\n";
    print "  $_\n" for @ERR[ 0 .. ( $#ERR > 30 ? 30 : $#ERR ) ];
    exit 1;
}
print "  完全一致\n";
exit 0;
