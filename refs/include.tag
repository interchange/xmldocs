__NAME__ purpose
include file into the current page and reparse contents for tags
__END__
__NAME__ synopsis 
<row>
	<entry>
	file
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
&TAG_NON_CONTAINER;
__END__

__NAME__ description
The tag inserts the contents of the named file, which is searched relative to the
catalog root directory or any directories specified by the &conf-TemplateDir;
directive.
</para><para>
The file should normally be relative to the catalog directory.
File names beginning with <literal>/</literal> or <literal>..</literal>
are not allowed if the &IC; server administrator
has enabled &conf-NoAbsolute;.
</para><para>
The maximum number of circular inclusions is controlled by the 
&conf-Limit; directive, using key <literal>include_depth</literal>.
__END__


__NAME__ notes
File contents are always loaded and &glos-interpolate;d before insertion into
the source document.
To include file without reparsing contents, use &tag-file;.
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
