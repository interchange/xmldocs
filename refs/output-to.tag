__NAME__ purpose
map output
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
	No
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	space name
	</entry>

</row> 
&TAG_CONTAINER;
__END__

__NAME__ description
<tag>output-to</tag> allows you to map pieces of a page to different named
spaces and unpack them with the <tag>unpack</tag> tag.
__END__

__NAME__ example: Use space "htmlhead"
<programlisting>
[output-to name="htmlhead"]
</programlisting>
__END__

__NAME__ example: Return to default space
<programlisting>
[output-to name=""]
</programlisting>
__END__
