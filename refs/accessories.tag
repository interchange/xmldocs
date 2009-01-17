__NAME__ purpose
access to product options attributes
__END__

__NAME__ synopsis 
<row>

	<entry>
		<group choice='plain'>
			<arg choice='plain'>code</arg>
			<arg choice='plain'>row</arg>
			<arg choice='plain'>key</arg>
		</group>
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	arg
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
	Comma-separated list of values to use in setting
	<literal>attribute</literal>,
	<literal>type</literal>,
	<literal>column</literal>,
	<literal>table</literal>,
	<literal>name</literal>,
	<literal>outboard</literal> and
	<literal>passed</literal> arguments.
	</entry>

</row> 
<row>

	<entry>
		<group choice='plain'>
			<arg choice='plain'>column</arg>
			<arg choice='plain'>col</arg>
			<arg choice='plain'>field</arg>
		</group>
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	Value of <literal>attribute=</literal>
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	attribute
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	Value of <literal>name=</literal>
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	outboard
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	Value of <literal>code=</literal>
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
		<group choice='plain'>
			<arg choice='plain'>table</arg>
			<arg choice='plain'>db</arg>
			<arg choice='plain'>base</arg>
			<arg choice='plain'>database</arg>
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
	passed
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	If <literal>table=</literal> specified, then 
	<code>[data <replaceable>table column code</replaceable>]</code>,
	else <code>[data products <replaceable>column code</replaceable>]</code>
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	type
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>select</literal>
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
&TAG_SUB_DISPLAY;
&TAG_NON_CONTAINER;
__END__

__NAME__ description
The &tag-__FILENAME__; tag is the "swiss army-knife" tool for choosing or
displaying &IC;'s product <emphasis>options</emphasis> (also called
&glos-attribute;s, of which typical examples are size or color).
</para><para>
__END__

__NAME__ notes
The default item options can be set via &conf-UseModifier;.
</para><para>
See the &glos-attribute; glossary entry for a complete introduction to item
options.
__END__


