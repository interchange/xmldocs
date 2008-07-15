__NAME__ purpose
access user database functions
__END__


__NAME__ synopsis
<row>

	<entry>
	function
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
	<group choice='plain'>
	<arg choice='plain'>db</arg>
	<arg choice='plain'>table</arg>
	</group>
	</entry>
	<entry>
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
	<group choice='plain'>
	<arg choice='plain'>nickname</arg>
	<arg choice='plain'>nick</arg>
	</group>
	</entry>
	<entry>
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

__NAME__ example: Save cart
<programlisting>
[userdb function=set_cart nickname=basket]
</programlisting>
__END__

__NAME__ example: Restore cart
<programlisting>
[userdb function=get_cart nickname=basket]
</programlisting>
__END__

