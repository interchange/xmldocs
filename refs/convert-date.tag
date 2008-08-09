__NAME__ purpose
convert date to a specified format
__END__

__NAME__ synopsis 
<row>

	<entry>
	<group choice='plain'>
	<arg choice='plain'>adjust</arg>
	<arg choice='plain'>days</arg>
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
	raw
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
	<group>
	<arg choice='plain'>format</arg>
	<arg choice='plain'>fmt</arg>
	</group>
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>%d-%b-%Y</literal>
	</entry>
	<entry>
  POSIX strftime format specifier; see &glos-time; glossary entry.
	</entry>

</row> 
<row>

	<entry>
	locale
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
	zerofix
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
&TAG_CONTAINER;
__END__


__NAME__ missing
option descriptions
__END__

__NAME__ description
The format string is documented in &glos-time;.
__END__

__NAME__ example
<programlisting><![CDATA[
[convert-date format="%B %e, %Y"]20080701[/convert-date]
]]></programlisting>
yields <literal>July 1, 2008</literal>.
__END__
