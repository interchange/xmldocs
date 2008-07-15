__NAME__ purpose
display a list of levy charges
__END__

__NAME__ synopsis 
<row>

	<entry>
	prefix
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>levy</literal>
	</entry>
	<entry>
	list prefix
	</entry>

</row> 
&TAG_CONTAINER;
__END__

__NAME__ description
You access the levies cart with <literal>[levy-list] LIST [/levy-list]</literal>. The
behavior of the list is exactly the same as with an <literal>[item-list]</literal> for a
shopping cart -- <literal>[levy-param description]</literal> will access the "description"
member of the hash for that levy.
__END__

__NAME__ notes
See &glos-levy; glossary entry for more information.
__END__

__NAME__ example
<programlisting><![CDATA[
[levies recalculate=1 hide=1]
[levy-list]
<tr>
    <td align=left class=contentbar1>[levy-param label]:</TD>
    <td align=right class=contentbar1>[levy-param cost]</TD>
</tr>
[/levy-list]
]]></programlisting>
__END__

__NAME__ see also
levies, Levies, Levy
__END__
