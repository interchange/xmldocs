__NAME__ purpose
include an external file into the current page verbatim
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
	Filename to include. Can't be arbitrary file
	if &conf-NoAbsolute; is set.
	</entry>
</row> 
<row>
	<entry>
	type
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	File type: 
	<literal>unix</literal>,
	<literal>mac</literal> or
	<literal>[dos|windows]</literal>.
	</entry>
</row> 
&ROW_INTERPOLATE_0;
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
File contents are inserted verbatim and <emphasis role='bold'>not</emphasis>
reparsed for tags.
__END__


__NAME__ notes
To reparse file contents upon inclusion, use &tag-include; or
<code>[file name=<replaceable>NAME</replaceable> interpolate=1]</code>.
__END__

__NAME__ example: Simple file include 
<programlisting>
[file /tmp/test]
&lt;hr&gt;
[file name=/tmp/test interpolate=1]
</programlisting>
Our <filename>/tmp/test</filename> file could look like this:
<programlisting>
Time is [time].
</programlisting>
In the first line of the example, <code>[time]</code> will not be
expanded to the actual time. In the third line it will, thanks to
<literal>interpolate=1</literal>.
__END__

__NAME__ see also
include
__END__
