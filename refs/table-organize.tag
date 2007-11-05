__NAME__ purpose
automatically organize table cells into rows or columns
__END__

__NAME__ synopsis 
<row>

	<entry>
	cols | columns
	</entry>
	<entry>
	yes
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	2
	</entry>
	<entry>
	Number of columns.
	</entry>

</row> 

<row>

	<entry>
	rows
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
	Optional number of rows. Implies "table" parameter.
	</entry>

</row> 

<row>

	<entry>
	columnize
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
	Display cells in "newspaper" column order. (Rotate the table &mdash;
	instead of filling rows, fill columns).
	</entry>

</row> 

<row>

	<entry>
	min_rows
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	</entry>
	<entry>
On small result sets, it can be ugly to build more than the necessary number
of columns.
This option will guarantee a minimum number of rows &mdash; columns will change
as numbers change. Formula: <literal>$num_cells % $opt->{min_rows}</literal>.
	</entry>

</row> 
<row>

	<entry>
	cells
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
	embed
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
	Allows embedding other table elements within tables you want to 
	organize. See more in <xref linkend="table-organize_description"/>
	and examples.
	</entry>

</row> 
<row>

	<entry>
	limit
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
	Maximum number of cells to use. Truncates extra cells silently.
	</entry>

</row> 
<row>

	<entry>
	table
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	</entry>
	<entry>
	If specified, causes a surrounding HTML <literal>&lt;table&gt;
&lt;/table&gt;</literal> to be generated with the specified attributes.
	</entry>

</row> 
<row>

	<entry>
	caption
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	</entry>
	<entry>
	Table <literal>&lt;caption&gt;</literal> container text, if any.
	(Can be an array).
	</entry>

</row> 
<row>

	<entry>
	tr
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
	Attributes for table rows. (Can be an array).
	</entry>

</row> 
<row>

	<entry>
	td
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
	Attributes for table cells. (Can be an array).
	</entry>

</row> 
<row>

	<entry>
	pretty
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
	Adds newline and TAB characters to provide some reasonable indenting
	in the &glos-HTML; source.
	</entry>

</row> 
<row>

	<entry>
	filler
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>&amp;nbsp;</literal> (non-breaking space)
	</entry>
	<entry>
	Content to automatically place in empty, "filler" cells. It could be
	important to provide at least minimal content in there since some
	browsers do not display empty cells.
	</entry>

</row> 
<row>

	<entry>
	font
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
	Attributes for HTML <literal>&lt;font></literal> inside table cells, if any.
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
	<literal>\n\t\t</literal> if <literal>pretty</literal> is
	specified, none otherwise.
	</entry>
	<entry>
	Element to use in joining cells. This is mostly used for visual
	layout in &glos-HTML; source.
	</entry>

</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ description
__FILENAME__ takes an bunch of table cells and organizes them into
rows based on the specified number of columns.
</para><para>
If the number of cells is not on an even modulus of the number of columns,
then "filler" cells will be included to keep table structure correct.
</para><para>
Attributes <literal>tr</literal>, <literal>td</literal> and
<literal>caption</literal> can be specified as an array
(with indexes); if they are, they will alternate according to the modulus.
The <literal>td</literal> array size should always equal the
number of columns; if it is bigger, then trailing elements are ignored. If
it is smaller, the attribute is ignored altogether.
</para><para>
If you will want to embed other tables inside the table you want to
organize, you'll run into an interesting problem; &tag-table-organize;
won't know whether &lt;td&gt;s belong to the table you want to 
arrange or to the "subtable" that should be left intact. To solve
this problem, we resort to differentiating them by lowercase
&lt;td&gt; and uppercase &lt;TD&gt;. See more in
<xref linkend='table-organize_examples'/>.
__END__

__NAME__ missing
What does this mean: it will also break them into separate tables.
Docs for cells= argument
__END__

__NAME__ example: Advanced table-organize example
To produce a table that alternates between two row background colors
and specifies custom alignment for the three columns, use:

<programlisting><![CDATA[
<table>
  [table-organize
    cols=3
    pretty=1
    tr.0='bgcolor="#EEEEEE"'
    tr.1='bgcolor="#FFFFFF"'
    td.0='align=right'
    td.1='align=center'
    td.2='align=left'
  ]
  [loop list="1 2 3 1a 2a 3a 1b"] <td> [loop-code] </td> [/loop]
  [/table-organize]
</table>
]]></programlisting>

(In the above example, &tag-loop; tag is used to produce example
data for the table cells.) The final result produced will 
look like this:

<programlisting><![CDATA[
<table>
  <tr bgcolor="#EEEEEE">
    <td align=right>1</td>
    <td align=center>2</td>
    <td align=left>3</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align=right>1a</td>
    <td align=center>2a</td>
    <td align=left>3a</td>
  </tr>
  <tr bgcolor="#EEEEEE">
    <td align=right>1b</td>
    <td align=center>&nbsp;</td>
    <td align=left>&nbsp;</td>
  </tr>
<table>
]]></programlisting>

If you also provide the <literal>columnize=1</literal> attribute, the result
will be a "rotated" table:

<programlisting><![CDATA[
<table>
  <tr bgcolor="#EEEEEE">
    <td align=right>1</td>
    <td align=center>1a</td>
    <td align=left>1b</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align=right>2</td>
    <td align=center>2a</td>
    <td align=left>&nbsp;</td>
  </tr>
  <tr bgcolor="#EEEEEE">
    <td align=right>3</td>
    <td align=center>3a</td>
    <td align=left>&nbsp;</td>
  </tr>
</table>
]]></programlisting>
__END__


__NAME__ example: Embedding tables
To embed tables, make sure the table you want to organize uses
lowercase &lt;td&gt; and set attribute <literal>embed=lc</literal>.
To invert the meaning and make uppercase &lt;TD&gt;s arranged
(ignoring lower- or mixed-case cells), set the 
<literal>embed</literal> attribute to any other &glos-true; value
except <literal>lc</literal> (<literal>embed=uc</literal> will work well).

<programlisting><![CDATA[
<table>
  [table-organize embed=lc]
  <td>
    <TABLE>
    <TR>
    <TD>something embedded</TD>
    </TR>
    </TABLE>
  </td>
  [/table-organize]
</table>
]]></programlisting>

or

<programlisting><![CDATA[
<table>
  [table-organize embed=uc]
  <TD>
    <table>
    <tr>
    <td>something</td>
    </tr>
    </table>
  </TD>
  [/table-organize]
</table>
]]></programlisting>
__END__

