__NAME__ purpose
conditional parsing
__END__

__NAME__ synopsis
<row>
	<entry>
	type
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
	term
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
	op
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
	compare
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
&TAG_CONTAINER;
__END__

__NAME__ description
Allows conditional parsing based upon the setting of various Interchange session and database values: 
</para><para>
<refsect2>
<title>config</title>
<para>
The Interchange configuration variables.  These are set by the directives in your Interchange configuration file (or the defaults).
</para>
</refsect2>
<refsect2>
<title>cgi</title>
<para>
Test CGI variable, posted into the page with a HTML form, or via a URI argument. 
</para>
</refsect2>
<refsect2>
<title>data</title>
<para>
The Interchange database tables.  Retrieves a column in the named table and returns true or false, based upon the value. 
</para>
</refsect2>
<refsect2>
<title>discount</title>
<para>
Checks to see if a discount is present for an item. 
</para>
</refsect2>
<refsect2>
<title>errors</title>
<para>
Check to see whether there are any error/information messages associated with a named form value. 
<programlisting>
[if errors fname]
	Please enter your first name.
[/if]
</programlisting>
</para>
</refsect2>
<refsect2>
<title>explicit</title>
<para>
A test for an explicit value.  If Perl code is placed in a [condition] container then the supplied code will be used to make the comparison.
</para>
</refsect2>
<refsect2>
<title>field</title>
<para>
This is much like the <literal>data</literal> test type, listed above, except that it works on the the table(s) listed in the <option>DefaultTables</option> local configuration directive. 
</para>
</refsect2>
<refsect2>
<title>file</title>
<para>
Tests for the existence of a file.  Useful for placing image tags only if the image is present. 
</para>
</refsect2>
<refsect2>
<title>file-A</title>
<para>
Compares against a file's access time (in days). 
</para>
</refsect2>
<refsect2>
<title>file-B</title>
<para>
Compares against a file's binary status
</para>
</refsect2>
<refsect2>
<title>file-d</title>
<para>
Tests whether a file is a directory. 
</para>
</refsect2>
<refsect2>
<title>file-e</title>
<para>
Tests whether the file (or directory) exists at all. 
</para>
</refsect2>
<refsect2>
<title>file-f</title>
<para>
Tests whether a file is a plain file (follows symbolic links).
</para>
</refsect2>
<refsect2>
<title>file-l</title>
<para>
Tests whether a file is a symbolic link.
</para>
</refsect2>
<refsect2>
<title>file-M</title>
<para>
Tests against the number of days since the file was modified. 
</para>
</refsect2>
<refsect2>
<title>file-r</title>
<para>
Tests whether file is readable by the Interchange user. 
</para>
</refsect2>
<refsect2>
<title>file-s</title>
<para>
Allows tests against the size of a file. 
</para>
</refsect2>
<refsect2>
<title>file-T</title>
<para>
Tests whether a file is a plain text file. 
</para>
</refsect2>
<refsect2>
<title>file-w</title>
<para>
Tests whether the file can be written to by the Interchange user.
</para>
</refsect2>
<refsect2>
<title>file-x</title>
<para>
Tests whether the file is executable by the Interchange user. 
</para>
</refsect2>
<refsect2>
<title>global</title>
<para>
Configuration variables set using a global <option>Variable</option> directive.
</para>
</refsect2>
<refsect2>
<title>items</title>
<para>
Usually used as a litmus test to see if anything is in the cart, for example:  If no cart name is specified then "main" will be used. 
</para>
</refsect2>
<refsect2>
<title>ordered</title>
<para>
Order status of individual items in the Interchange shopping carts.  If no cart name is specified then "main" will be used.
</para>
</refsect2>
<refsect2>
<title>pragma</title>
<para>
Test a page <option>Pragma</option> value, set with the the <option>Pragma</option> directive in the &ccf; file, or with the &tag-pragma; tag. 
</para>
</refsect2>
<refsect2>
<title>scratch</title>
<para>
Test a scratchpad variables, previously set with &tag-set;, &tag-seti;, &tag-tmp; and &tag-tmpn; (or not set, as the case may be). 
</para>
</refsect2>
<refsect2>
<title>scratchd</title>
<para>
This is the same as the "<literal>scratch</literal>" test type, except that the variable is deleted from the scratchpad after testing.
</para>
<note><para>
Introduced in version 5.5.1.
</para></note>
</refsect2>
<refsect2>
<title>session</title>
<para>
Test an Interchange session variable.
</para>
</refsect2>
<refsect2>
<title>tmp</title>
<para>
Test for existence of non-session temporary value, set with either the &tag-ts; or &tag-tn; tags, or via <literal>$Tmp</literal> in Perl.
</para>
<note><para>
Introduced in version 5.8.2.
</para></note>
</refsect2>
<refsect2>
<title>validcc</title>
<para>
A special case which takes the form <literal>[if validcc no type exp_date]</literal>. Evaluates to true if the supplied credit card number, type of card and expiration date pass a validity test. Does a LUHN-10 calculation to weed out typos or phony card numbers.  Uses the standard <option>CreditCardAuto</option> values for targets if nothing else is specified. 
</para>
</refsect2>
<refsect2>
<title>value</title>
<para>
Test a form value, previously set with &tag-value; or via a previous HTML form post.
</para>
</refsect2>
<refsect2>
<title>variable</title>
<para>
Configuration variables set using a local <option>Variable</option> or <option>VariableDatabase</option> directive.
</para>
</refsect2>
__END__

__NAME__ example: 
