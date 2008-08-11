__NAME__ purpose
display total cost of products within cart
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
	<entry>No</entry>
	<entry><literal>main</literal></entry>
	<entry>&glos-cart; name</entry>
</row>
&ROW_CURRENCYNOFORMAT;
&ROW_CURRENCYDISPLAY;
&TAG_NON_CONTAINER;
__END__

__NAME__ description
<tag>subtotal</tag> returns the total cost of the products within a cart,
formatted according to the currency settings.
__END__

__NAME__ example: Basic example
<programlisting>
[subtotal]
</programlisting>
__END__

<!--
example: Using [subtotal] programatically
<programlisting><![CDATA[
$subtotal = $Tag->subtotal({noformat => 1});
]]></programlisting>
-->

__NAME__ see also
currency, total-cost
__END__
