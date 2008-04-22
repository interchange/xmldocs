__NAME__ purpose
refresh specific set of internal data
__END__

__NAME__ synopsis 
<row>

	<entry>
	function
	</entry>
	<entry>
	yes
	</entry>
	<entry>
	yes
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	name of function (see below)
	</entry>

</row> 
<row>

	<entry>
	name
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
	&glos-cart; name (<literal>cart</literal> function only)
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__

__NAME__ description
<literal>[update cart]</literal> updates the &glos-cart;. If the user has
put in <literal>0</literal> for any quantity, delete that item from the
cart. Also adjust the cart to take minimum and maximum order quantities
as specified by the &conf-MinQuantityField; and &conf-MaxQuantityField; 
directives into account.
</para>
<para>
<literal>[update values]</literal> updates the &glos-value; namespace from the volatile
&glos-CGI; namespace.
__END__