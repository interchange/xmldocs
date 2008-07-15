__NAME__ purpose
return the total number of items in the electronic cart
__END__

__NAME__ synopsis 
<row>

	<entry>
	name
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<literal>main</literal>
	</entry>
	<entry>
	Cart name.
	</entry>

</row> 
<row>

	<entry>
	qualifier
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
	An item attribute that must evaluate to a &glos-true; value,
	in order for the item to be counted.
	</entry>

</row> 
<row>

	<entry>
	compare
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
	Instead of counting items based solely on item attribute
	"&glos-true;ness" (as <literal>qualifier=</literal> does by default),
	perform the specified regular expression pattern matching on the
	<literal>qualifier=</literal> attribute.
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag returns the total number of items in users' electronic cart.
__END__

__NAME__ example: Basic example
<programlisting>
You have [nitems] items in your cart.
</programlisting>
__END__

TODO examples with qualifier and compare
