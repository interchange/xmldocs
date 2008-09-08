__NAME__ purpose
produce an order link
__END__

__NAME__ synopsis 
<row>
	<entry>
	<group choice='optional'>
		<arg choice='plain'>code</arg>
		<arg choice='plain'>item</arg>
		<arg choice='plain'>sku</arg>
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
	Item &glos-SKU;
	</entry>

</row> 
<row>
	<entry>
	quantity
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	Quantity to order.
	</entry>

</row> 
<row>

	<entry>
	base
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
	Ordered list of particular product files to search. If unspecified, all
	tables defined as &conf-ProductFiles; will be searched.
	</entry>

</row> 
<row>

	<entry>
	cart
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
	&glos-cart; name
	</entry>

</row> 
<row>

	<entry>	
	<group choice='optional'>
		<arg choice='plain'>mv_sku</arg>
		<arg choice='plain'>variant</arg>
	</group>
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	form
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	page
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	area
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	arg
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
	<!-- DSC -->
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__

__NAME__ description
<tag>order</tag> displays an URL which adds an item to the shopping cart
upon following the link. The next page is determined by <literal>order</literal> &conf-SpecialPage;.
__END__

__NAME__ example
<programlisting><![CDATA[
<a href="[order code="IC2008" quantity=10 area=1]">Buy 10 Interchange T-Shirts</a>
]]></programlisting>
__END__

__NAME__ see also
area,page
__END__

