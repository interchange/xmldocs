__NAME__ purpose
display total cost of electronic cart, including all adjustments
__END__


__NAME__ see also
subtotal
__END__


__NAME__ synopsis
<row>
	<entry>
		<group>
			<arg choice='plain'>name</arg>
			<arg choice='plain'>cart</arg>
		</group>
	</entry>
	<entry>Yes</entry>
	<entry>Yes</entry>
	<entry>Default cart</entry>
	<entry>Electronic &glos-cart; name.</entry>
</row>
<row>
	<entry>
		<arg choice='plain'>noformat</arg>
	</entry>
	<entry>Yes</entry>
	<entry>Yes</entry>
	<entry>0</entry>
	<entry>Do not format the displayed price?</entry>
</row>
<row>
	<entry>
		<group>
			<arg choice='plain'>space</arg>
			<arg choice='plain'>discount_space</arg>
		</group>
	</entry>
	<entry>Yes</entry>
	<entry></entry>
	<entry>Default space</entry>
	<entry>Name of the &glos-discount; "space".</entry>
</row>
<row>
	<entry>
		<arg choice='plain'>locale</arg>
	</entry>
	<entry></entry>
	<entry></entry>
	<entry></entry>
	<entry>Format price according to the specified locale.</entry>
</row>
&ROW_CURRENCYDISPLAY;
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ description
The tag displays the total monetary value of the user's electronic
&glos-cart;, including all &glos-price; adjustments such as quantity
pricing, &glos-discount;s, handling, shipping and &glos-tax;ing.
__END__


__NAME__ example: Basic example
<programlisting>
[total-cost]
</programlisting>
__END__

