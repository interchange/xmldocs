__NAME__ purpose
get or set value of a named field or row from a database table or user session
__END__

__NAME__ synopsis 
<row>

	<entry>
	<group choice='optional'>
		<arg choice='plain'>table</arg>
		<arg choice='plain'>base</arg>
		<arg choice='plain'>database</arg>
	</group>
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	The name of the table to fetch from.
	</entry>

</row> 
<row>

	<entry>
	<group choice='optional'>
		<arg choice='plain'>field</arg>
		<arg choice='plain'>col</arg>
		<arg choice='plain'>column</arg>
		<arg choice='plain'>name</arg>
	</group>
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	The name of the field whose value you want to fetch.
	Required unless returning the entire row in combination with
	the <literal>hash=</literal> option.
	</entry>
</row> 
<row>

	<entry>
	<group choice='optional'>
		<arg choice='plain'>key</arg>
		<arg choice='plain'>code</arg>
		<arg choice='plain'>row</arg>
	</group>
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	The key that identifies the row to fetch.
	</entry>

</row> 
<row>

	<entry>
	safe_data
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	Is data &glos-safe;?
	</entry>

</row> 
<row>

	<entry>
	value
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
	Set field to specified value. If <literal>increment=</literal> is true,
	increment
	the field by the specified value (negative increments can be used for
	decreasing).
	</entry>

</row> 
<row>

	<entry>
	filter
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
	If reading a field, apply specified &glos-filter; to the value before
	displaying. It setting a field, apply specified filter to the value before
	updating the database.
	</entry>

</row> 
<row>

	<entry>
	increment
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	Increment or decrement field content by <literal>value=</literal>?
	Unless <literal>value=</literal> is specified, increment by 
	<literal>1</literal>.
	</entry>

</row> 
<row>

	<entry>
	append
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	Append the field instead of "truncating" before write?
	</entry>

</row> 
<row>

	<entry>
	alter
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
	<literal>change</literal>, <literal>add</literal> or
	<literal>delete</literal>.
	</entry>

</row> 
<row>

	<entry>
	serial
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	</entry>

</row> 
<row>

	<entry>
	foreign
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
	Select data element based on a specified foreign key. This allows selection
	of a field or row based on a column that is not the primary key in the
	&glos-database; table. If the key is unique, first selected is returned.
	Foreign key can also be specified as a hash, see 
	<xref linkend="data_examples"/>.
	</entry>

</row> 
<row>

	<entry>
	hash
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
	Return the result as a reference to a hash? Hash keys will correspond
	to column names.
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag is primarily used for reading fields from database tables or
user's &glos-session; namespace. However, with appropriate options, 
whole rows can be returned, and the fields can be set, incremented,
appended and filtered.
</para><para>
If a database with <literal>WRITE_CONTROL</literal> enabled is to be written
(such as a DBM-based database, which has it by default), it must be flagged
writable on the page wishing to perform the update;
use <code>[tag flag write]<replaceable>DATABASE_NAME</replaceable>[/tag]</code>
to mark a database writable, and do this before any access to that table.
</para><para>
In addition, the &tag-data; tag can access values in users'
&glos-session; namespace, using the special <literal>session</literal> keyword.
Do not call your own database "<literal>session</literal>" because it would
mask accesses to the actual sessions database.
__END__

__NAME__ see also
tag,dump_session
__END__


__NAME__ missing
What do alter and serial do
__END__


__NAME__ example: Basic example
Display price for the item SKU <literal>4595</literal>:
<programlisting>
[data products price 4595]
</programlisting>
__END__

__NAME__ example: Dumping user session
To dump user &glos-session;, see &tag-dump_session;. Once you do it, you can
learn the names of all the session keys you can use in the following example.
__END__

__NAME__ example: Retrieving session values
In this example we produce a simple "report" about the user. We take the
data from the user's session record.
<programlisting><![CDATA[
[if session logged_in]
  User is logged in as [data session username].
[else]
  User is not logged in.
[/else]
[/if]                                              <br />
[data session host] is user's IP.                  <br />
Browser used is [data session browser].            <br />
]]></programlisting>
__END__

__NAME__ example: Retrieving fields from a table using a foreign key
If we wrote <code>[data products price 4595]</code>, we would retrieve
the price of the item &glos-SKU; <literal>4595</literal>. The SKU column
is the <emphasis>primary key</emphasis> in the <database>products</database>
database, and that's why &IC; implicitly searches it for the specified
<literal>key=</literal>.
</para><para>
To retrieve price of an item based on say, it's description field (which
is not a primary key), we need to use the foreign key functionality:
<programlisting>
[data
  table=products
  column=price
  foreign=description
  key="Nice Bio Test"
]
</programlisting>
__END__

__NAME__ example: Retrieving fields from a table using foreign key hash
To retrieve &glos-SKU; of an item based on say, both it's description and
price fields, we need to use the foreign key functionality with the hash
argument:
<programlisting>
[data
  table=products
  column=price
  foreign.description='Nice Bio Test'
  foreign.price=275.45
]
</programlisting>
TODO not working
__END__

__NAME__ example: Retrieving fields from a table using foreign key array
Sometimes you want a query that is optimized in a particular order. To
achieve that, use either your custom code, or an array-type foreign key:
<programlisting>
[data
  table=products
  column=price
  foreign.0="price=275.45"
  foreign.1="description='Nice Bio Test'"
]
</programlisting>
TODO not working
__END__

__NAME__ example: Retrieving rows from a database
Here's a &PERL; example of retrieving complete table rows.
<programlisting>
[perl tables=products]
  my $row_hash = $Tag->data({
    table   => 'products',
    key     => '4595',
    hash    => 1
  });

  my $out = "Item SKU " . $row_hash->{sku} . " has";

  $out .= " price " . $row_hash->{price} . " and" .
          " description " . $row_hash->{description} . ". Cheers!";

  $out
[/perl]
</programlisting>
__END__


