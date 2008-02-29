__NAME__ purpose
return description for a specific product from the products database
__END__


__NAME__ see also
DescriptionField,price
__END__


__NAME__ synopsis
<row>
	<entry>
	code
	</entry>
	<entry>Yes</entry>
	<entry>Yes</entry>
	<entry></entry>
	<entry>Product &glos-SKU;.</entry>
</row>
<row>
	<entry>
	base
	</entry>
	<entry>Yes</entry>
	<entry></entry>
	<entry>All &conf-ProductFiles; databases</entry>
	<entry>Database to look up the product in.</entry>
</row>
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag returns the description for a specified product.
If no <literal>base=</literal> is specified, all &conf-ProductFiles;
are searched for the specified &glos-SKU;.
__END__


__NAME__ example: Displaying description for item 1299
<programlisting>
[description 1299]
</programlisting>
__END__

