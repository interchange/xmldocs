__NAME__ purpose
save content to a filename inside the catalog directory
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
	Pathname to write to, relative to &glos-CATROOT;.
	</entry>
</row> 
&ROW_AUTOCREATEDIR;
&ROW_UMASK_none;
&TAG_CONTAINER;
__END__

__NAME__ description
The tag writes a file in the catalog directory. File name is subject to
file control (e.g. it must be relative), it will return undef if
the check isn't passed.
</para><para>
If the file exists, it is truncated (file contents get overwritten, not
appended).
__END__

__NAME__ example: Simple file write
[write-relative-file logs/test]Sample content[/write-relative-file]
__END__
