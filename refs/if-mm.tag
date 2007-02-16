__NAME__ purpose
check permissions for UI tasks
__END__

__NAME__ synopsis 
<row>

	<entry>
	<group choice='optional'>
		<arg choice='plain'>function</arg>
		<arg choice='plain'>key</arg>
	</group>
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
	function to check permissions for
	</entry>

</row> 

<row>

	<entry>
	name
	</entry>
	<entry>
	yes
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
	table
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
	prefix
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
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__

__NAME__ description
This tag performs various checks on behalf of the UI:
</para><para>
<refsect2>
<title>logged_in</title>
<para>
Checks whether the current user is logged into the UI.
<programlisting>
[if-mm !logged_in]
[set ui_error]Not authorized[/set]
[bounce page="admin/error"]
[/if-mm]
</programlisting>
</para>
</refsect2>
<refsect2>
<title>tables</title>
<para>
Checks for access to database tables.
<programlisting>
[if-mm !tables content]
[set ui_error]Not authorized for content editor.[/set]
[bounce page="admin/error"]
[/if-mm]
</programlisting>
</para>
</refsect2>
__END__