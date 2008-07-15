__NAME__ purpose
(deprecated) return content of the named form input field, defaulting to value 'default'
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
	</entry>
	<entry>
	Name of the form variable.
	</entry>

</row> 
<row>

	<entry>
	default
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
	Default value to return if the specified variable is <emphasis>missing or
	evaluates to a false value</emphasis>.
	</entry>

</row> 
<row>

	<entry>
	values_space
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
	Specify "&glos-value;s space" in which to perform the operation.
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
	Set form field variable &glos-value; to the specified content.
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
	Apply specified &glos-filter; to the variable content. The application of
	a filter actually modifies the variable value in-place (in addition to,
	of course, displaying the filtered content).
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
	0
	</entry>
	<entry>
	Only apply filter for display, and do not modify actual variable value?
	</entry>

</row> 
<row>

	<entry>
	scratch
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
	Along with setting a form field value, also create the variable/content
	pair in the &glos-scratch; space?
	</entry>

</row> 
<row>

	<entry>
	enable_itl
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
	Allow &glos-ITL; tags to appear in the output? By default, all
	"<literal>&#91;</literal>" characters are encoded as
	"<literal>&amp;#91;</literal>".
	</entry>

</row> 
<row>

	<entry>
	enable_html
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
	Allow &glos-HTML; tags to appear in the output? By default, all
	"<literal>&lt;</literal>" characters are encoded as
	"<literal>&amp;lt;</literal>".
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag returns the named form input field &glos-value;.
Any &IC; tags in the output are &glos-HTML;- and &glos-ITL;-escaped by default
for security reasons.
</para><para>
This tag is very similar to &tag-value;, except that it provides the
default value for the <literal>default=</literal> parameter.

__END__

__NAME__ example: displaying user's first name
<programlisting>
Hello, [default fname Anonymous]!
</programlisting>
__END__

__NAME__ example: displaying user's first name in a modifiable field
<programlisting><![CDATA[
<form action="[process]">
  Hello, <input type="text" name="fname" value="[default fname Anonymous]" />!
</form>
]]></programlisting>
TODO: Add a submit button
__END__

__NAME__ example: displaying user's first name, or falling back to the default
<programlisting><![CDATA[
Hello, [default fname Anonymous]!
]]></programlisting>
__END__

