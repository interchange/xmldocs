__NAME__ purpose
deliver arbritary content verbatim, without Interchange processing
__END__

__NAME__ synopsis 
<row>
	<entry>
	type
	</entry>
	<entry>
	yes
	</entry>
	<entry>
	no
	</entry>
	<entry>
	<literal>application/octet-stream</literal>
	</entry>
	<entry>
	Content &glos-MIME; type
	</entry>

</row> 
<row>

	<entry>
	file
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
	File to be delivered
	</entry>

</row> 
<row>

	<entry>
	location
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
	URL for redirection
	</entry>

</row> 
<row>

	<entry>
	status
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
	HTTP status code and message
	</entry>

</row> 
<row>

	<entry>
	get_encrypted
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
	extra_headers
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
	Any additional HTTP headers
	</entry>

</row> 
&TAG_CONTAINER;
__END__

__NAME__ description
The &tag-deliver; tag delivers possibly binary content to the user 
or redirects the user to another URL.
</para>
<para>
The content is read from a file specified by the <literal>file</literal>
parameter or passed in the tag body.
</para>
<para>
Alternatively, you may use the tag to redirect the user to any URL passed
in the <literal>location</literal> parameter. 
__END__

__NAME__ Example
<programlisting>
[deliver type="application/csv" file="tmp/stats.csv"]
</programlisting>
__END__

__NAME__ see also
download
__END__

