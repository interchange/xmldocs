#!/usr/bin/perl

use warnings;
use strict;

#
# Hacked to convert list of mv_ vars and descriptions into files for xmldocs
# This is probably a one-time-use script.
#
# docelic@icdevgroup.org, Dec 2004.
#

my @tmpl = <DATA>;
my %argtype = (
	A => " (All)",
	S => " (Search)",
	O => " (Order)",
	C => "",
	XA => " (Causes execution, All)",
	OS => " (Order, Search)",

);

while (<>) {
	@_ = split /\|/;
	@_ == 4 or die "NOT 4\n";

	$_[4] = lc $_[3];
	$_[5] = $argtype{$_[2]};
	$_[6] = lc $argtype{$_[2]};

	print "IN $_[0]\n";
	( my $txt = join "", @tmpl ) =~ s/(\$_\[\d\])/$1/gee;

	open OUT, "> $_[0].mv" or die "Cant open $_[1] ($!)\n";
	print OUT $txt;
	close OUT;
}


__DATA__

__NAME__ purpose
$_[4]$_[5]
__END__

__NAME__ variable type
$_[6]
__END__

__NAME__ synopsis
<group choice='opt'>
	<arg choice='plain'></arg>
</group>
__END__

__NAME__ description
$_[3]
__END__

