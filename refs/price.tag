__NAME__ purpose
calculate product price
__END__

__NAME__ see also
PriceField,description
__END__


__NAME__ synopsis
<row>
	<entry>
	code
	</entry>
	<entry>Yes</entry>
	<entry>Yes</entry>
	<entry></entry>
	<entry>product &glos-SKU;.</entry>
</row>
<row>
	<entry>
	quantity
	</entry>
	<entry></entry>
	<entry></entry>
	<entry>1</entry>
	<entry>quantity</entry>
</row>
<row>
	<entry>discount</entry>
	<entry></entry>
	<entry></entry>
	<entry>No</entry>
	<entry>Apply &glos-discount;.</entry>
</row>
&ROW_CURRENCYCONVERT;
&ROW_CURRENCYNOFORMAT;
&ROW_CURRENCYDISPLAY;
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag calculates the &glos-price; for a specified product and returns
it formatted.
</para><para>
The price tag will not apply discounts unless you supply the 
<literal>discount=1</literal> parameter.
__END__


__NAME__ example: Displaying price for item 1299, with quantity 1 resp. 10
<programlisting>
[price 1299]
[price code=1299 quantity=10]
</programlisting>
__END__

