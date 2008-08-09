__NAME__ purpose
displays shipping mode description
__END__


__NAME__ synopsis
<row>

	<entry>
	mode
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
	shipping mode
	</entry>

</row> 
<row>

	<entry>
	key
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>description</literal>
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__

__NAME__ see also
shipping
__END__

__NAME__ description
<tag>shipping-desc</tag> allows access to arbitrary keys in the shipping
configuration.
__END__

__NAME__ example: Display shipping modes and corresponding information
<para>
The following snippet out of <filename>shipping.asc</filename> contains 
additional information which can be displayed with <tag>shipping-desc</tag>.
<programlisting>
usps: USPS 1st class
        crit        [onlyitems]
        min         0
        max         0
        cost        e No shipping needed!
        at_least    0
        adder       0
        p_time      1-2 business days
        s_time      3-7 business days

        min         1
        max         6
        cost        4.00

        min         7
        max         12
        cost        7.00
</programlisting>
<para>
<programlisting><![CDATA[
[loop list="[shipping possible=1]"]
Shipping Mode:   [shipping-desc mode="[loop-code]"]
Processing time: [shipping-desc mode="[loop-code]" key=p_time]
Shipping time:   [shipping-desc mode="[loop-code]" key=s_time]
Cost:            [shipping mode="[loop-code]"]
[/loop]
]]></programlisting>
__END__
