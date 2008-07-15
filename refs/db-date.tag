__NAME__ purpose
report last-modified time of the named database source file
__END__


__NAME__ see also
__END__

__NAME__ synopsis
<row>
	<entry>
	table
	</entry>
	<entry>Yes</entry>
	<entry>Yes</entry>
	<entry><literal>products</literal></entry>
	<entry>Interchange &glos-database; name.</entry>
</row>
<row>
	<entry>
	format
	</entry>
	<entry>Yes</entry>
	<entry>Yes</entry>
	<entry><literal>%A %d %b %Y</literal></entry>
	<entry>POSIX strftime format specifier.</entry>
</row>
&TAG_NON_CONTAINER;
__END__

__NAME__ description
The tag displays the last-modified time of the &glos-database; source
text file. Output format can be specified using <literal>format=</literal>.
__END__


__NAME__ notes
This tag will be of use for you only if you use source file based
&glos-database;s.
If you use &glos-SQL; databases, the logical connection with text source
files will probably not be maintained so the output of this tag will be
worthless.
__END__


__NAME__ example: Displaying products database last-modified time
Provided that you use file-based databases in your catalog (*DB* variants), 
you can run this example:
<programlisting>
[db-date]
</programlisting>
__END__

