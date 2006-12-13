__NAME__ purpose
output HTML table
__END__

__NAME__ synopsis 
<row>

	<entry>
	columns
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
	Names for the columns, separated by whitespace (<literal>\s+</literal>).
	If the <option>th</option> attribute is used, this one is ignored, so the
	column names must be passed as the first row of table input data.
	</entry>

</row> 
<row>

	<entry>
	delimiter
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>\t</literal>
	</entry>
	<entry>
	Field delimiter to use if the data is provided in-place (in the tag
	body) instead of as an &glos-array; reference.
	</entry>

</row> 
<row>

	<entry>
	record_delim
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>\n</literal>
	</entry>
	<entry>
	Record delimiter to use if the data is provided in-place (in the tag
	body) instead of as an &glos-array; reference.
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
	Extra arguments for each table row. Any arguments you place
	here will render as &lt;tr <replaceable>ARGUMENTS</replaceable>&gt;.
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
	Extra arguments for each table cell. Any arguments you place
	here will render as &lt;td <replaceable>ARGUMENTS</replaceable>&gt;.
	</entry>
</row> 
<row>
	<entry>
	th
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
	Extra arguments for table header. Any arguments you place
	here will render as &lt;th <replaceable>ARGUMENTS</replaceable>&gt;.
	When this attribute is used, <option>columns</option> is ignored.
	</entry>
</row> 
<row>
	<entry>
	fc
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
	Extra arguments for the first table column. Any arguments you place
	here will render as &lt;td <replaceable>ARGUMENTS</replaceable>&gt;.
	</entry>
</row> 
<row>
	<entry>
	fr
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
	Extra arguments for the first table row. Any arguments you place
	here will render as &lt;tr <replaceable>ARGUMENTS</replaceable>&gt;.
	</entry>
</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__



__NAME__ description
This tag creates an &glos-HTML; table by auto-inserting the appropriate
HTML markup. Table data can either be provided in-place (within the
tag body), or passed as a &glos-array; reference.
</para><para>
The enclosing &lt;table&gt; &glos-HTML; tag is not included, you have
to include it yourself.
__END__



__NAME__ notes
Since the tag body responds to TABs (<literal>\t</literal>)  and
newlines (<literal>\n</literal>) by default, make sure that the table
input data is not indented.
</para><para>
Separate fields using exactly one field delimiter (one TAB, for example);
multiple delimiters in a row will imply empty cells.
__END__


__NAME__ online: Creating an HTML table using in-place data
<programlisting><![CDATA[
<table width="90%" border="1">

[html-table fc="bgcolor='red'" fr="bgcolor='blue'" th="bgcolor='yellow'"]
title1  title2  title3
r1c1    r1c2    r1c3
r2c1    r2c2    r2c3
r3c1    r3c2    r3c3
[/html-table]

</table>
]]></programlisting>
__END__

__NAME__ online: Creating an HTML table using an array reference
<programlisting><![CDATA[

[calc]
  $Scratch->{table} = (
    [qw/title1 title2 title3/],
    ['r1c1', 'r1c2', 'r1c3'],
    [qw/r2c1 r2c2 r2c3/],
    [qw/r3c1 r3c2 r3c3/],
  );
[/calc]

<table width="90%" border="1">
[html-table body=`$Scratch->{table}` /]
</table>

]]></programlisting>
__END__


__NAME__ missing
The arry-passing example is not working
__END__
