#!/usr/bin/perl

# Custom script to use chained with icsdf2xml. It takes mostly processed
# input, and splits it to separate files, using a template and file names
# from headers in input

# Usage:
# perl ../../bin/icsdf2xml.pl INPUT_FILE | perl ../../bin/splitfile.pl > /tmp/item_list

use warnings;
use strict;

my @buff;
my $tmpl = join '', <DATA>;

while ($_ = <>) {
	
	if ( /^LI1:\s*([\w_]+?)\s*$/ ) {
		flus();
		@buff=();
		open OUT, "> $1" or die "Can't open $1 ($!)\n";
		print $1, ' ';
		next;
	}

	s/^\s+//;
	push @buff, $_;
	
}

sub flus {
		local $" = "";
		my $c = eval $tmpl;
		print OUT $c;
}

flus();
exit 0;



__DATA__

"
__NAME__ purpose
__END__


__NAME__ synopsis
<group choice='req'>
	<arg choice='plain'><replaceable></replaceable></arg>
</group>
__END__


__NAME__ default
<literal></literal>
__END__


__NAME__ description
@buff
__END__


__NAME__ notes
__END__


__NAME__ see also
__END__


__NAME__ missing
More complete information
__END__


__NAME__ example: 
__END__
"

