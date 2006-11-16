__NAME__ purpose
format number (usually a price) according to currency settings
__END__


__NAME__ see also
price,Locale,PriceCommas,PriceDivide
__END__


__NAME__ synopsis
<row>
	<entry>
	convert
	</entry>
	<entry>Yes</entry>
	<entry></entry>
	<entry>0</entry>
	<entry>Convert the value according to the &conf-PriceDivide; value
	for the current locale?</entry>
</row>
<row>
	<entry>
	noformat
	</entry>
	<entry>Yes</entry>
	<entry></entry>
	<entry>0</entry>
	<entry>Do not format the price?</entry>
</row>
&ROW_CURRENCYDISPLAY;
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__

__NAME__ description
The tag returns the price for a specified product.
</para>
<para>
The currency tag is automatically invoked by the following tags:
&tag-price;, &tag-subtotal;, &tag-salestax;, &tag-total-cost;.
__END__


__NAME__ online: Basic example
<programlisting>
[currency]4[/currency]
</programlisting>
__END__

__NAME__ online: Displaying currency according to PriceDivide
Provided that the &conf-PriceDivide; configuration directive is set
to <literal>0.167</literal>, the following example would display 
<literal>8.982,04</literal>:
<programlisting>
[currency convert=1] [calc] 500.00 + 1000.00 [/calc] [/currency]
</programlisting>
__END__

__NAME__ see also
price, subtotal, salestax, total-cost
__END__
