__NAME__ purpose
indicate checked status of checkboxes
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
	<!-- REQ -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	variable name
	</entry>

</row> 
<row>

	<entry>
	value
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
	cgi
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
	Whether to use CGI namespace instead of Value namespace.
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
	<literal>on</literal>
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	case
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	No
	</entry>
	<entry>
	Preserve case for field names and values?
	</entry>

</row> 
<row>

	<entry>
	multiple
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
	delimiter
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>\0</literal>
	</entry>
	<entry>
	This option implies <literal>multiple=1</literal>.
	</entry>

</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ see also
selected
__END__

__NAME__ description
The tag provides "memory" for &glos-HTML; checkboxes and radio buttons.
__END__




You can provide a "memory" for drop-down menus, radio buttons, and
checkboxes with the [checked] and [selected] tags.

>    <INPUT TYPE=radio NAME=foo
>            VALUE=on [checked name=foo value=on default=1]>
>    <INPUT TYPE=radio NAME=foo
>            VALUE=off [checked name=foo value=off]>

This will output CHECKED if the variable C<var_name> is equal to
C<value>. Not case sensitive unless the optional C<case=1> parameter is used.

The C<default> parameter, if true (non-zero and non-blank), will cause
the box to be checked if the variable has never been defined.

Note that CHECKBOX items will never submit their value if not checked,
so the box will not be reset. You must do something like:

>    <INPUT TYPE=checkbox NAME=foo
>            VALUE=1 [checked name=foo value=1 default=1]>
>    [value name=foo set=""]

By default, the Values space (i.e. [value foo]) is checkedE<nbspace>E<emdash> if you
want to use the volatile CGI space (i.e. [cgi foo]) use the option
C<cgi=1>.

Use the parameter C<default=1> to specify that this checkbox should be
marked CHECKED if the value/CGI variable has never been set.

If the parameter C<multiple=1> is set, the C<value> parameter can
contain multiple (stacked) values that should be checked, separated
by ASCII null characters ("\0" in Perl).

