__NAME__ purpose
display and manipulate errors stored in session
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
	<literal>default</literal>
	</entry>
	<entry>
	Name of the error, usually corresponds to the name of a &glos-form; input
	field in which the error ocurred.
	</entry>

</row> 
<row>

	<entry>
	overwrite
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
	Overwrite existing error messages for the specified 
	<literal>name</literal>? If this option is unset, the new error text
	will be appended with the word "<literal> AND </literal>".
	</entry>

</row> 
<row>

	<entry>
	set
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
	Error text to set.
	</entry>

</row> 
<row>

	<entry>
	keep
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	Preserve the error after display? (The error is otherwise automatically
	deleted as soon as you retrieve its value.)
	</entry>

</row> 
<row>

	<entry>
	auto
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
	all
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	Yes if <literal>auto</literal> is enabled
	</entry>
	<entry>
	Display all error messages instead of just one pointed to by
	<literal>name</literal>?
	</entry>

</row> 
<row>

	<entry>
	show_error
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	Yes if <literal>auto</literal> is enabled
	</entry>
	<entry>
	Show actual error messages instead of just reporting their count?
	</entry>

</row> 
<row>

	<entry>
	std_label
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
	<!--

	H4: {{CMD[id="error_std_label"]std_label}}

	std_label=<label string for error message>

	used with 'required' to display a standardized
	error format. The HTML formatting can be set
	via the global variable MV_ERROR_STD_LABEL with
	the default being:

	>        <FONT COLOR=RED>{LABEL}<SMALL><I>(%s)</I></SMALL></FONT>

	where {LABEL} is what you set std_label to and %s
	is substituted with the error message. This option
	can not be used with the text= option.

	-->
	</entry>

</row> 
<row>

	<entry>
	show_var
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	Yes if <literal>auto</literal> is enabled
	</entry>
	<entry>
	Include error name in the display?
	</entry>

</row> 
<row>

	<entry>
	joiner
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>&lt;li&gt;</literal> if <literal>auto</literal> is enabled,
	a newline (<literal>\n</literal>) otherwise
	</entry>
	<entry>
	Join element to use if multiple errors are to be displayed at once,
	such as when <literal>all</literal> is enabled.
	</entry>

</row> 
<row>

	<entry>
	text
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
	Optional string in which the actual error message should be embedded.
	If the literal <literal>%s</literal> is present in the string, it will be
	substituted for the message. Otherwise the error text is just appended.
	</entry>

</row> 
<row>

	<entry>
	list_container
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
	header
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
	footer
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
	show_label
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
	<!-- 
	show_label=1 causes the field label set by a previous [error] tag's std_label attribute (see below) to be included as part of the error message, like this:
	E:First Name: blank

	If no std_label was set, the variable name will be used instead. This can also be used in combination with show_var to show both the label and the variable name.

	show_label was added in 4.7.0.

	-->
	</entry>

</row> 
<row>

	<entry>
	filter
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
	required
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
	Used for display purposes, as a hint to <literal>std_label</literal>.
	Enabling this attribute allows the label to be printed differently for
	required form fields. In the default label template, this means 
	<emphasis role='bold'>bold</emphasis> text, but in your custom labels
	the behavior is, of course, arbitrary.
	</entry>

</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ description
The &tag-__FILENAME__; tag was designed to report meaningful error
messages to the users, should an error occur in the &glos-form; processing
action (such as missing or invalid field values entered).
</para><para>
It can work in conjunction with the definitions set in a &glos-profile;,
and can generate error messages in any format you desire.
</para><para>
Error conditions can also be tested with the [if] conditional:
<programlisting>
[if errors fname]
Please enter your first name!
[/if]
</programlisting>
<!--
</para><para>
Generally, if the variable in question passes order profile checking, 
the will
output a label, by default B<bold> text if the item is required,
or normal text if not (controlled by the <require> parameter. If
the variable fails one or more order checks, the error message
will be substituted into a template and the error cleared from
the user's session.

$Vend::Session-gt;{errors};
-->
__END__

__NAME__ example: the most simple error display
The following will simply display all accumulated session errors.
(Note that after display, session errors will be cleared and will
not show up on subsequent page accesses).
<programlisting><![CDATA[
<ul>
[error auto=1]
</ul>
]]></programlisting>
__END__

__NAME__ example 
Trigger an error:
<programlisting>
[error name="email" set="Invalid email address"]
</programlisting>
__END__

__NAME__ example
Show all errors:
<programlisting>
[error all=1 show_error=1]
</programlisting>
__END__
