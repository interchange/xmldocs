__NAME__ purpose
handle failed 'try' blocks
__END__

__NAME__ synopsis 
<row>

	<entry>
	label
	</entry>
	<entry>
	1
	</entry>
	<entry>
	1
	</entry>
	<entry>
	<literal>default</literal>
	</entry>
	<entry>
	Name to assign to the &tag-try; block. The name is later used by
	&tag-cache; (or some custom code) to refer to the proper &tag-try;
	block.
	</entry>

</row> 
<row>

	<entry>
	exact
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
	joiner
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
	error_set
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
	error_scratch
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
	hide
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


__NAME__ see also
try
__END__


__NAME__ description
The page content contained within <code>[catch
<replaceable>label_name</replaceable>] ... [/catch]</code> block will
be executed if the correspondingly labelled &tag-try; block fails.
This kind of error handling is common in some general-purpose programming
languages, such as Java,
<ulink url="http://www.hprog.org/fhp/MlLanguage">SML</ulink> or even
&PERL;.
</para><para>
Except providing just a general error handling mechanism, &IC; implementation
can take different code paths, depending on the specific error that occurred.
That is achieved by matching the error message using &glos-regexp;s.
__END__

__NAME__ notes
Note that the &tag-catch; block executes <emphasis role='bold'>at place of
occurence</emphasis> in place the page (if it is triggered), and not in place
of the failed &tag-try; block. This gives great flexiblity but must be 
taken into account.
</para><para>
&tag-catch; block must always <emphasis role='bold'>follow</emphasis>
&tag-try;, that is &mdash; be executed after the
<literal>$Session->{try}{<replaceable>label</replaceable>}</literal>
structure has been initialized.
</para><para>
You might wonder, what will the actual error messages be, and how will 
you know which &glos-regexp;s to use in matching them?
The error messages "raised" will usually be those that are also placed
in the error logs. See <xref linkend="catch_examples"/> for clarification.
__END__


__NAME__ example: Raising and handling "division by zero" Perl error
In &PERL;, division by zero might result with the following error reported
in the error log:
<errortext>
   127.0.0.1 4cU3Pgsh:127.0.0.1 - [24/May/2001:14:45:07 -0400] tag /cgi-bin/tag72/tag Safe: Illegal division by zero at (eval 526) line 2
</errortext>. Or it may be something like <errortext>127.0.0.1 G5vRfC9B:127.0.0.1 - [08/March/2005:18:25:17 +0100] tutorial /cgi-bin/ic/tutorial/catch Safe: 'eval "string"' trapped by operation mask at (tag 'perl') line 2</errortext>.
</para><para>
The proper way to provide error handling is something like this:
<programlisting>
[set divisor]0[/set]

[try label=div]
  [calc] eval(1 / [scratch divisor]) [/calc]
[/try]

[catch div]
  [/Illegal division by zero/]
    0
  [/Illegal division by zero/]
  
  [/trapped by operation mask/]
    Perl Safe error
  [/trapped by operation mask/]
  
  Other division error
[/catch]
</programlisting>
__END__

