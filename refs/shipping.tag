__NAME__ purpose
display shipping cost for items in electronic cart
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
	possible
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
	list available shipping modes
	</entry>

</row> 
<row>

	<entry>
	resolve
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
	resolve shipping mode
	</entry>

</row> 
<row>

	<entry>
	check_validity
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	whether to check shipping mode is valid or not
	</entry>

</row> 
<row>

	<entry>
	widget
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
	label
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
	handling
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
	free
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
	text for free shipping
	</entry>
</row>
<row>

	<entry>
	reset_modes
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
	add
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
	file
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
	default
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
	output_options
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
	country_var
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>country</literal>
	</entry>
	<entry>
	name of country variable in &glos-value; namespace
	</entry>

</row> 
<row>

	<entry>
	state_var
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>state</literal>
	</entry>
	<entry>
	name of state variable in &glos-value; namespace
	</entry>

</row> 

<row>

	<entry>
	noformat
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
&ROW_CURRENCYDISPLAY;
&TAG_NON_CONTAINER;
__END__

__NAME__ description
Without any parameters, <tag>shipping</tag> displays the &glos-shipping;
cost for the items in the cart.
</para>
<refsect2>
<title>List currently available shipping modes and shipping parameters</title>
<para>
<programlisting><![CDATA[
[shipping possible=1]
]]></programlisting>
</para>
<para>
This can be used to display custom parameters for the currently available
shipping modes with the <tag>shipping-desc</tag> tag:
<programlisting><![CDATA[
[loop list="[shipping possible=1]"]
Shipping Mode:   [shipping-desc mode="[loop-code]"]
Processing time: [shipping-desc mode="[loop-code]" key=p_time]
Shipping time:   [shipping-desc mode="[loop-code]" key=s_time]
Cost:            [shipping mode="[loop-code]"]
[/loop]
]]></programlisting>
</para>
</refsect2>
<refsect2>
<title>Check and resolve shipping modes</title>
<para>
The availability of shipping modes depends on shipping parameters, usually
the shipping country. <code>[shipping check_validity=1]</code> checks
whether the shipping mode in the <literal>mv_shipmode</literal> variable is
still valid. <code>[shipping resolve=1]</code> updates this variable if necesssary.
</para>
</refsect2>
<para>
__END__

__NAME__ example: 
<programlisting><![CDATA[
<select name="mv_shipmode">
[shipping free="Free!" label=1 
    format=|<option value="%M"%S>%D</option>| 
    mode=|[shipping possible=1]|
]
</select>
]]></programlisting>
__END__

__NAME__ see also
SpecialSub, assign
__END__
