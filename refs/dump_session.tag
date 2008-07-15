__NAME__ purpose
dump named user session partially or in whole
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
	</entry>
	<entry>
	User &glos-session; ID.
	</entry>

</row> 
<row>
	<entry>
	joiner
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	A space
	</entry>
	<entry>
	</entry>

</row> 
<row>

	<entry>
	find
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	key
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	Hash key to use as top-level value in session dump,
	instead of the complete session.
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag dumps content of a named &glos-session;.
</para><para>
If the <literal>key=</literal> argument is specified, 
that will become the top-level element for display.
__END__


__NAME__ see also
dump
__END__

__NAME__ example: Displaying current user's session dump
<programlisting><![CDATA[
<pre> [dump-session name="[data session id]"] </pre>
]]></programlisting>
__END__

__NAME__ example: Displaying a specific part of current user's session
<programlisting><![CDATA[
<pre> [dump-session name="[data session id]" key=browser] </pre>
]]></programlisting>
__END__


TODO: clarify find=1, joiner=, and add appropriate examples
