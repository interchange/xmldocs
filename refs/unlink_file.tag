__NAME__ purpose
safely delete a file within catalog root directory
__END__


__NAME__ see also
write-relative-file
__END__


__NAME__ synopsis
<row>
	<entry>
	name
	</entry>
	<entry>Yes</entry>
	<entry>Yes</entry>
	<entry></entry>
	<entry>File name to delete</entry>
</row>
<row>
	<entry>
	prefix
	</entry>
	<entry>Yes</entry>
	<entry></entry>
	<entry><literal>tmp/</literal></entry>
	<entry>Prefix that the filename must match (a safety measure)</entry>
</row>
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag safely deletes a file from the catalog root directory (&glos-CATROOT;).
</para><para>
The beginning of the filename must match the <literal>prefix=</literal> option
for the deletion to succeed.
</para><para>
The filename can not start with a <literal>/</literal> nor <literal>../</literal>.
__END__


__NAME__ example: create and delete file "tmp/testfile"
<programlisting>
[tmp]

[write-relative-file tmp/testfile]
  Hello, World!
[/write-relative-file]

[unlink-file tmp/testfile]

[/tmp]
</programlisting>
The &tag-tmp; tag is only used to hide output values from the two contained tags.
__END__


__NAME__ example: delete file "logs/tmplog"
[tmp] [unlink-file name="logs/tmplog" prefix="logs/"] [/tmp]
__END__


