__NAME__ purpose
append usertrack entry with arbitrary key=value pair
__END__


__NAME__ see also
TrackFile
__END__

__NAME__ synopsis
<row>
	<entry>
	tag
	</entry>
	<entry>Yes</entry>
	<entry>Yes</entry>
	<entry></entry>
	<entry>Key name</entry>
</row>
<row>
	<entry>
	value
	</entry>
	<entry>Yes</entry>
	<entry></entry>
	<entry></entry>
	<entry>Key value</entry>
</row>
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ description
The tag is used to append content to the line that will be inserted into 
user &glos-tracking; log.
</para><para>
Key/value pairs are added to the line in "GET"-like style.
See <xref linkend="usertrack_examples"/>.
__END__


__NAME__ notes
User &glos-tracking; must be enabled for this tag to produce any noticeable effect.
</para><para>
&tag-usertrack; does not work on &glos-special; pages.
__END__

__NAME__ example: Basic example
Put each of the two lines anywhere on a page:
<programlisting>
[usertrack HELLO WORLD]

[usertrack tag=test_var value=test_value]
</programlisting>
__END__

__NAME__ example: Recording the number of cart items each time the user visits the index page
Put the following in <filename>index.html</filename>:
<programlisting>
[usertrack tag=nitems value="[nitems]"]
</programlisting>
__END__

