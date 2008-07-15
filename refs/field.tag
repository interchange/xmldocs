__NAME__ purpose
quickly retrieve field from Products database
__END__


__NAME__ synopsis 
<row>

	<entry>
	<group choice='plain'>
		<arg choice='plain'>name</arg>
		<arg choice='plain'>column</arg>
		<arg choice='plain'>col</arg>
		<arg choice='plain'>field</arg>
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
	</entry>

</row> 
<row>

	<entry>
	<group choice='plain'>
		<arg choice='plain'>code</arg>
		<arg choice='plain'>row</arg>
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
	</entry>
</row> 
&TAG_NON_CONTAINER;
__END__

__NAME__ see also
data, description, price
__END__

__NAME__ description
The tag conveniently retrieves the field from the &glos-database;s listed 
under &conf-ProductFiles;.
It will return the first entry found in the series of product databases,
so if you are only looking for a specific table, better use the generic
&tag-data; tag.
__END__

__NAME__ notes
If you only have one &conf-ProductFiles; database &mdash; <database>products</database>, then <code>[field <replaceable>column</replaceable> <replaceable>key</replaceable>]</code> is, of course, the same as <code>[data products <replaceable>column</replaceable> <replaceable>key</replaceable>]</code>.
__END__
