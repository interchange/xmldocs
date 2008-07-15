__NAME__ purpose
get or set value of CGI input variables
__END__


__NAME__ see also
value
__END__


__NAME__ synopsis
<row>
	<entry>
			<arg choice='plain'>name</arg>
	</entry>
	<entry>Yes</entry><entry>Yes</entry>
	<entry></entry>
	<entry>Name of the CGI input variable.</entry>
</row>
<row>
	<entry>
			<arg choice='plain'>set</arg>
	</entry>
	<entry></entry><entry></entry>
	<entry>None.</entry>
	<entry>New value for a variable to set, instead of retrieving
	the current content.</entry>
</row>
<row>
	<entry>
			<arg choice='plain'>default</arg>
	</entry>
	<entry></entry><entry></entry>
	<entry>None.</entry>
	<entry>
	Text to return if the variable requested is missing or otherwise
	false.
	</entry>
</row>
<row>
	<entry>
			<arg choice='plain'>enable_html</arg>
	</entry>
	<entry></entry><entry></entry>
	<entry>0</entry>
	<entry>Allow HTML tags to appear in the output? By default, 
	All &lt; characters are replaced by &amp;lt;.
	</entry>
</row>
<row>
	<entry>
			<arg choice='plain'>keep</arg>
	</entry>
	<entry></entry><entry></entry>
	<entry>0</entry>
	<entry>
	Do apply filter for display, but do not modify the original
	CGI value itself (from the the <varname>$CGI::values</varname> hash)?
	</entry>
</row>
&ROW_FILTER_none;
&TAG_NON_CONTAINER;
__END__


__NAME__ notes
This is one of often used Interchange tags.
__END__


__NAME__ description
The tag displays the value of a CGI variable submitted to a current page.
This is similar to the <tag>value</tag> tag, except that it displays 
transitory values that have been submitted with the current request.
In other words, the CGI values are reset on each request and you can
only access the values directly submitted to the current page.
</para><para>
For instance, if you invoke the page with &glos-GET;
parameters, such as <literal>pagename?foo=bar</literal>,
then the value of the <literal>foo</literal> CGI variable will be
accessible using <code>[cgi foo]</code> in
&glos-ITL; or <code>$CGI->{foo}</code> in embedded Perl.
__END__

__NAME__ notes
__END__

__NAME__ example: Accessing CGI variables
Save the following content to a test page named say,
<filename>cgitest.html</filename>, then visit 
<literal><![CDATA[cgitest?foo=bar&toad=stool]]></literal> with your browser.
<programlisting>
<![CDATA[
Value of 'foo': [cgi foo]<br/>
Value of 'toad': [cgi name=toad]<br/>
]]>
</programlisting>
__END__

