__NAME__ purpose
safely execute a code block and test for errors
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
	status
	</entry>
	<entry>
	0
	</entry>
	<entry>
	0
	</entry>
	<entry>
	0
	</entry>
	<entry>
	Suppresses normal &tag-try; block output and only return 1 for no error,
	or 0 when the error happens.
	The corresponding &tag-catch; block is executed if there's an error.
	</entry>
</row> 
<row>

	<entry>
	hide
	</entry>
	<entry>
0
	</entry>
	<entry>
0
	</entry>
	<entry>
0
	</entry>
	<entry>
	Suppresses normal &tag-try; block output, regardless of its evaluation
	success or failure.
	The corresponding &tag-catch; block is executed if there's an error.
	</entry>

</row> 
<row>
	<entry>
	clean
	</entry>
	<entry>
0
	</entry>
	<entry>
0
	</entry>
	<entry>
0
	</entry>
	<entry>
	Cause the &tag-try; block to suppress its output only if it has an error.
	Otherwise the block will return whatever partial output it has completed
	before the error.
	The corresponding &tag-catch; block is executed if there's an error.
	</entry>

</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__

__NAME__ see also
catch
__END__

__NAME__ description
The &tag-try; block allows you to trap execution errors. &IC; processes the
body of the tag and normally parses and evaluates the block. If no errors are
raised during execution of the block, the parsing procedure continues as if
&tag-try; wasn't there. If the error does get generated, however, &IC; will
execute the correspondingly named &tag-catch; block. "Corresponding names" are
determined by using <emphasis>labels</emphasis> &mdash; arbitrary strings that
must match at both sides.
</para><para>
The &tag-try; tag will place execution result in the
<literal>$Session</literal> object. See <xref linkend='try_examples'/> for
clarification.
__END__


__NAME__ notes
See &tag-catch; for more examples and further discussion.
</para><para>
__END__

__NAME__ example: Simple 'try' block in action
<programlisting>
[set divisor]0[/set]

[try label=div]
  [calc] 1 / [scratch divisor] [/calc]
[/try]

[catch div]Division error[/catch]
</programlisting>
__END__


__NAME__ example: Triggering an illegal division by zero and watching the error message
As we've mentioned above, a &tag-try; block labeled <literal>divide</literal>
creates the <literal>$Session->{try}{divide}</literal> entry in &PERL;
data structures:

<programlisting>
[try label=divide][calc] 1 / [scratch divisor] [/calc][/try]

[catch divide]
  Verbatim error message is: [calc]$Session->{try}{divide}[/calc]
[/catch]
</programlisting>
__END__


