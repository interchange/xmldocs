__NAME__ purpose
include an external file into the current page and reparse contents for tags
__END__
__NAME__ synopsis 
<row>
	<entry>
	name
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	Filename to include. Can only be a relative filename
	if &conf-NoAbsolute; is set.
	</entry>
</row> 
&ROW_LOCALE_1;
&ROW_INTERPOLATE_1;
&ROW_REPARSE_1;
__END__

__NAME__ description
The tag inserts the contents of the named file.
</para><para>
The file should normally be relative to the catalog directory.
File names beginning with <literal>/</literal> or <literal>..</literal>
are not allowed if the &IC; server administrator
has enabled &conf-NoAbsolute;.
</para><para>
File contents are inserted and then, by default, reparsed for &glos-ITL;
tags.
</para><para>
The maximum number of circular inclusions is controlled by the 
&conf-Limit; directive, using key <literal>include_depth</literal>.
__END__


__NAME__ notes
To include file without reparsing contents, use &tag-file; or
<code>[include name=<replaceable>NAME</replaceable> interpolate=0]</code>.
__END__

__NAME__ example: Simple file include 
<programlisting>
[include /tmp/test]
</programlisting>
Our <filename>/tmp/test</filename> file could look like this:
<programlisting>
Time is [time].
</programlisting>
__END__

__NAME__ see also
file
__END__
