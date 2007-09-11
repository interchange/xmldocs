__NAME__ purpose
organizes table cells into a number of rows
__END__

__NAME__ synopsis 
<row>

	<entry>
	cols
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
	min_rows
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
On small result sets, can be ugly to build more than necessary columns.
This will guarantee a minimum number of rows -- columns will change
as numbers change. Formula: $num_cells % $opt->{min_rows}.
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
	Allow to embed tables with lowercase of uppercase HTML tags.
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
	Attributes for table cells. Can be an array.
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
	Adds newline and tab characters to provide some reasonable indenting.
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
	Attributes for table rows. Can be an array.
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
	<literal>&amp;nbsp;</literal>
	</entry>
	<entry>
	Contents to place in empty cells put on as filler.
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
	<!-- DSC -->
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
	table
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
	If present, will cause a surrounding &lt;table&gt; &lt;/table&gt; pair
    with the attributes specified in this option.
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
	<!-- DFL -->
	</entry>
	<entry>
	<!-- DSC -->
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
Display cells in (newspaper) column order, i.e. rotated.
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
	<!-- DFL -->
	</entry>
	<entry>
	Table &lt;caption&gt; container text, if any. Can be an array.
	</entry>

</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__

__NAME__ description
Takes an unorganized set of table cells and organizes them into
rows based on the number of columns; it will also break them into
separate tables.
</para><para>
If the number of cells are not on an even modulus of the number of columns,
then <literal>filler</literal> cells are pushed on.
</para><para>
The <literal>tr</literal>, <literal>td</literal>, and <literal>caption</literal> attributes can be specified with indexes;
if they are, then they will alternate according to the modulus.
</para><para>
The <literal>td</literal> option array size should probably always equal the
number of columns; if it is bigger, then trailing elements are ignored. If
it is smaller, no attribute is used.
</para><para>
For example, to produce a table that 1) alternates rows with background
colors <literal>#EEEEEE</literal> and <literal>#FFFFFF</literal>, and 2) 
aligns the columns RIGHT CENTER LEFT, do:
<programlisting><![CDATA[
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
]]></programlisting>
which will produce:
<programlisting><![CDATA[
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
]]></programlisting>
If the attribute <literal>columnize</literal> is present, the result will look like:
<programlisting><![CDATA[
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
]]></programlisting>
<refsect2>
<title>Embedding tables</title>
<para>
If you want to embed other tables inside, make sure they are called with
lower case <literal>&lt;td></literal> elements, then set the embed tag and
make the cells you wish to organize be <literal>&lt;TD></literal>
elements. To switch that sense, and make the upper-case 
or mixed case be the ignored cells, set the embed parameter to <literal>lc</literal>.
<programlisting><![CDATA[
    [table-organize embed=lc]
		<td>
			<TABLE>
				<TR>
				<TD> something 
				</TD>
				</TR>
			</table>
		</td>
    [/table-organize]
]]></programlisting>
or
<programlisting><![CDATA[
    [table-organize embed=uc]
		<TD>
			<table>
				<tr>
				<td> something 
				</td>
				</tr>
			</table>
		</TD>
	[/table-organize]
]]></programlisting>
</para>
</refsect2>
__END__