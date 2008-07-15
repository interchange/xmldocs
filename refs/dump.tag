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
&TAG_NON_CONTAINER;
__END__


__NAME__ description
This tag dumps the complete &glos-session; or parts of it, and HTTP environment
variables in a human readable format, which is useful for debugging.
</para>
<para>
To display only a subset from the user's &glos-session;, use
parameter <literal>key=</literal>. The key can be any information
from the user's session, but most often you will want to display
<literal>carts</literal>, <literal>scratch</literal> or
<literal>values</literal>. For a list of all possible keys,
smply invoke <code>[dump]</code> and look under
"<literal>SESSION</literal>".
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

__NAME__ example: Session dump focusing on session values, without HTTP environment
<programlisting><![CDATA[
<pre>[dump show_all=1 no_env=1]</pre>
]]></programlisting>
__END__

