__NAME__ purpose
send a HTTP Redirect request and follow to the new page
__END__


__NAME__ see also
area, page
__END__


__NAME__ synopsis
<row>
	<entry>
			<arg choice='plain'>href</arg>
	</entry>
	<entry>Yes</entry><entry>Yes</entry>
	<entry></entry>
	<entry>Page to "bounce" to. The URL must be absolute.</entry>
</row>
<row>
	<entry>
			<arg choice='plain'>if</arg>
	</entry>
	<entry>Yes</entry><entry></entry>
	<entry></entry>
	<entry>
	Bounce if the specified condition is met.
	</entry>
</row>
&ROW_INTERPOLATE_0;
__END__


__NAME__ notes
Due to special processing, this tag cannot be used from embedded
&PERL;.
__END__


__NAME__ description
The tag is designed to send an HTTP redirect (status code 302)
to the browser and redirect it to another (possibly &IC;-parsed) page.
</para><para>
When &tag-bounce; is encountered, &IC; will stop ITL code execution;
all tags lexically following &tag-bounce; will not
be run through the parser. Bear in mind that if you are inside a looping
list, that list will run to completion (due to special handling of lists)
and the &tag-bounce; tag will not be seen until the loop is complete.
__END__


__NAME__ example: Simple bounce
<programlisting><![CDATA[
[if !scratch real_user]
  [bounce href="[area violation]"]
[/if]
]]></programlisting>
__END__


__NAME__ example: Bouncing to the Welcome page
<programlisting><![CDATA[
Note that the URL must always be absolute, so you must have the 
<varname>SERVER_NAME</varname> variable defined for this to work:
[if value go_home]
  [bounce href="__SERVER_NAME__/"]
[/if]
]]></programlisting>
__END__


__NAME__ missing
Explanation for if= and example
__END__
