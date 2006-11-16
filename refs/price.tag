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
	<entry></entry>
	<entry>quantity</entry>
</row>
&ROW_CURRENCYNOFORMAT;
&ROW_CURRENCYDISPLAY;
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ description
The tag calculates the &glos-price; for a specified product and returns
it formatted.
__END__


__NAME__ example: Displaying price for item 1299, with quantity 1 resp. 10
<programlisting>
[price 1299]
[price code=1299 quantity=10]
</programlisting>
__END__

