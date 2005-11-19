__NAME__ purpose
evaluate the enclosed arithmetic expression or Perl block
__END__

__NAME__ synopsis
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__

__NAME__ see also
calc, mvasp, perl
__END__

__NAME__ description
The tag evaluates the enclosed arithmetic expression or a Perl block.
The last expression evaluated (return value) is returned back to the client
page.
</para><para>
The tag is only a convenience and otherwise identical to &tag-calc;,
except that it does not interpolate tag body by default.
__END__


__NAME__ notes
See &tag-calc; for the complete documentation.
__END__

__NAME__ example: Simple non-interpolating block
The example will, since &tag-calcn; is used, directly return the quoted 
content unmodified, instead of evaluating to "TEST":
<programlisting>
[cgi name=test set=TEST hide=1]

[calcn reparse=0] "[cgi test]" [/calcn]
</programlisting>
__END__

