__NAME__ purpose
display total cost of electronic cart, including all adjustments
__END__


__NAME__ see also
subtotal
__END__


__NAME__ synopsis
<row>
	<entry>
		<group choice='plain'>
			<arg choice='plain'>name</arg>
			<arg choice='plain'>cart</arg>
		</group>
	</entry>
	<entry>Yes</entry>
	<entry>Yes</entry>
	<entry><literal>main</literal></entry>
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
		<group choice='plain'>
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
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag displays the total monetary value of the user's electronic
&glos-cart;, including all &glos-price; adjustments such as quantity
pricing, &glos-discount;s, handling, &glos-shipping; and &glos-tax;ing.
__END__

__NAME__ notes
Handling and shipping costs are not applied to the total cost 
if the corresponding values (<mv>mv_shipmode</mv> resp. <mv>mv_handling</mv>) 
are empty. This can happen if you use <tag>assign</tag> to set the
costs and there are no defaults for the values.
__END__

__NAME__ example: Basic example
<programlisting>
[total-cost]
</programlisting>
__END__

