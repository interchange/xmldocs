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
	Display a specific subset of the &glos-session;.
	</entry>

</row> 
<row>
	<entry>no_env</entry>
	<entry></entry>
	<entry></entry>
	<entry>0</entry>
	<entry>Exclude HTTP &glos-environment; variables.</entry>
</row> 
<row>
	<entry>no_cgi</entry>
	<entry></entry>
	<entry></entry>
	<entry>0</entry>
	<entry>Exclude &glos-CGI; variables.</entry>
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
This tag dumps the complete &glos-session; or parts of it, and HTTP environment
variables in a human readable format, which is useful for debugging.
</para>
<para>
The most important of the possible subsets are:
<informaltable>
<tgroup cols="2">
<thead>
<row><entry>Subset</entry><entry>Contents</entry></row>
</thead>
<tbody>
<row><entry>&glos-cart;s</entry><entry>Cart contents.</entry></row>
<row><entry>&glos-scratch;</entry><entry>Scratchpad variables.</entry></row>
<row><entry>&glos-value;s</entry><entry>Value variables.</entry></row>
</tbody>
</tgroup>
</informaltable>
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

