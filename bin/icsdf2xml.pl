#!/usr/bin/perl

# Custom script to help converting IC .sdf to DocBook XML

use warnings;
use strict;

my @input = <>;
my @output;

# Control flow
my $in_pl; # IN programlisting

for (my $i=0; $i<@input; $i++) {
	$_ = $input[$i];

# Line substitutes first
	s#I\<([^\[].*?)\>#<emphasis>$1</emphasis>#g;
	s#F\<([^\[].*?)\>#<filename>$1</filename>#g;
	s#B\<([^\[].*?)\>#<emphasis role='bold'>$1</emphasis>#g;
	s#C\<([^\[].*?)\>#<literal>$1</literal>#g;
	s#C\<\[([\w_\-]+)\]\>#&tag-$1;#g;
	s#C\<(\[[\w_\-]+ [\w_\-]+\])\>#<code>$1</code>#g;

	s#^=over\s+.*#</para>#;
	s#^=item\s+.*#</para> <para>#;
	s#^=back\s*.*#</para> <para>#;

	!&in_pl and do {
		s/&/&amp;/g;
		s/interchange/&IC;/gi;
	}

	s/(<[\w_-]+)/lc $1/ge and do {
		s/( [A-Z]+=)/lc $1/ge;
		s/( [a-z_-]+?)=([^"'][\w_-]*)/ $1="$2"/g;
	};

######################### SECT1
	/^H1:\s*(.*?)\s*$/ and do {
	my $sec = $1;
	(my $title = lc $1) =~ s/(^|[\s_-"']+)(\w)/uc $2/ge;
	push @output, <<__ENDD__;
</para>
</sect1>


<sect1 id="${\( $title )}">
	<title>${\( ucfirst lc $sec )}</title>

<para>
__ENDD__
	next };
######################### SECT2
	/^H2:\s*(.*?)\s*$/ and do {
	my $sec = $1;
	(my $title = lc $1) =~ s/(^|[\s_-])(\w)/uc $2/ge;
	push @output, <<__ENDD__;
</para>
</sect2>


<sect2 id="${\( $title )}">
	<title>${\( $sec )}</title>

<para>
__ENDD__
	next };
######################### PROGRAMLISTING
	/^>\s*(.*?)\s*$/ and do {
		push @output, "\n<programlisting><![CDATA[\n" unless $in_pl++;
		push @output, $1, "\n";
		next;
	};

	# If we got here, we're in "para"
	push @output, "]]></programlisting>\n\n" if $in_pl; $in_pl=0;

	# Default action!
	push @output, $_;
}


print @output;
