use strict; use warnings;
# vulkan_functions.pas の網羅性検証：
#  1) ヘッダでプロトタイプ宣言される全コマンドに var と GetProcAddress がある
#  2) 第 1 引数の型に応じて正しいローダ（instance / device）に載っている
my ($core,$win32,$pas) = @ARGV;
my (%proto,%first);
for my $f ($core,$win32) {
    open my $h,'<',$f or die; my @l=<$h>; close $h;
    my $t = join '', @l;
    while ( $t =~ /typedef\s+([^\n;()]+?)\s*\(\s*VKAPI_PTR\s*\*\s*PFN_(vk\w+)\s*\)\s*\((.*?)\)\s*;/gs ) {
        my ($n,$args)=($2,$3); $args =~ s/\s+/ /g;
        my ($a1) = split /,/, $args; $a1//=''; $a1 =~ s/\bconst\b//g;
        my ($ty) = ( $a1 =~ /([A-Za-z_]\w*)/ ); $ty//='';
        $ty = 'ptr' if $a1 =~ /\*/;
        $first{$n} = $ty;
    }
    for my $l (@l) { $proto{$1} = 1 if $l =~ /^VKAPI_ATTR\s+.*\bVKAPI_CALL\s+(vk\w+)\s*\(/ }
}
open my $p,'<:raw',$pas or die; local $/; my $t=<$p>; close $p; $t =~ s/\r//g;
my (%var,%dll,%inst,%dev);
$var{$1}=1  while $t =~ /^var (vk\w+)\s+:/gm;
$dll{$1}=1  while $t =~ /^     (vk\w+)\s+:= GetProcAddress/gm;
my ($ib) = ( $t =~ /_GetInstanceProc \) then Exit;(.*?)^end;/ms );
my ($db) = ( $t =~ /_GetDeviceProc \) then Exit;(.*?)^end;/ms );
die "instance ローダの本体が見つからない" unless defined $ib;
die "device ローダの本体が見つからない"   unless defined $db;
$inst{$1}=1 while $ib =~ /P\( (vk\w+)\s*,/g;
$dev{$1}=1  while $db =~ /P\( (vk\w+)\s*,/g;
my %DEV = map{$_=>1} qw(VkDevice VkQueue VkCommandBuffer);
my %INS = map{$_=>1} qw(VkInstance VkPhysicalDevice);
my @e;
for my $c (sort keys %proto) {
    push @e, "$c : var なし"            unless $var{$c};
    push @e, "$c : GetProcAddress なし" unless $dll{$c};
    my $lv = $DEV{$first{$c}//''} ? 'D' : $INS{$first{$c}//''} ? 'I' : 'G';
    if    ( $lv eq 'D' ) { push @e, "$c : device ローダに無い"   unless $dev{$c};
                           push @e, "$c : instance ローダに無い" unless $inst{$c}; }
    elsif ( $lv eq 'I' ) { push @e, "$c : instance ローダに無い" unless $inst{$c};
                           push @e, "$c : device ローダに載っている（誤り）" if $dev{$c}; }
    else                 { push @e, "$c : global なのに instance/device ローダに載っている" if $inst{$c} || $dev{$c}; }
}
for my $c (sort keys %var)  { push @e, "$c : var はあるがヘッダに無い" unless $proto{$c} }
printf "コマンド %d ／ var %d ／ DLL %d ／ instance %d ／ device %d\n",
    scalar keys %proto, scalar keys %var, scalar keys %dll, scalar keys %inst, scalar keys %dev;
if (@e) { print "  *** ".scalar(@e)." 件 ***\n"; print "  $_\n" for @e[0..($#e>20?20:$#e)]; exit 1 }
print "  完全一致\n";
