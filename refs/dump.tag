__NAME__ purpose
display dump of current session
__END__


__NAME__ synopsis 
<row>
	<entry>
	key
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	</entry>
	<entry>
	None (all keys)
	</entry>
	<entry>
	Dump just one named variable from the user &glos-session;.
	</entry>

</row> 
<row>
	<entry>no_env</entry>
	<entry></entry>
	<entry></entry>
	<entry>0</entry>
	<entry>Do not output &glos-environment; structure?</entry>
</row> 
<row>
	<entry>no_cgi</entry>
	<entry></entry>
	<entry></entry>
	<entry>0</entry>
	<entry>Do not output &glos-CGI; structure?</entry>
</row> 
<row>
	<entry>show_all</entry>
	<entry></entry>
	<entry></entry>
	<entry>0</entry>
	<entry>Show all &glos-CGI; variables, including the "hidden"
	ones defined in <varname>@Global::HideCGI</varname>?</entry>
</row> 
<row>
	<entry>no_session</entry>
	<entry></entry>
	<entry></entry>
	<entry>0</entry>
	<entry>Do not output &glos-session; structure?</entry>
</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ description
The tag dumps client connection information, &glos-cart; contents, query value,
&glos-environment; contents, &glos-session; contents, and &glos-CGI; contents
to the page. This is useful for &glos-debug;ging.
__END__


__NAME__ see also
dump_session
__END__

__NAME__ example: Displaying current user's full session dump
<programlisting><![CDATA[
<pre>[dump]</pre>
]]></programlisting>
__END__

__NAME__ example: Displaying current user's cart structure
<programlisting><![CDATA[
<pre>[dump key=carts]</pre>
]]></programlisting>
__END__

