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
	Yes
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
<row>

	<entry>
	show_message
	</entry>
	<entry>
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	whether to return message (success or error)
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__

__NAME__ description
<tag>userdb</tag> provides access to &glos-UserDB; functions.
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

__NAME__ see also
UserDB
__END__
