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
<refsect2>
<title>Logout function</title>
<para>
<literal>[userdb logout]</literal> performs log out operation on the current
user account:
<programlisting>
[userdb logout]
</programlisting>  
Usually, data stored in the session should be removed at the same time:
<programlisting>
[userdb function=logout clear=1]
[userdb function=logout clear_session=1]
[userdb function=logout clear_cookie="MV_PASSWORD"]
</programlisting>
</para><para>
<literal>clear=1</literal> resets all &glos-value; and &glos-scratch;
variables initialized by the &glos-UserDB;.
</para><para>
<literal>clear_session=1</literal> forces the creation of an entirely new
session for the user.
</para><para>
<literal>clear_cookie="<replaceable>NAME</replaceable>"</literal> expires
the &glos-cookie; <replaceable>NAME</replaceable>.
</para>
</refsect2>
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
