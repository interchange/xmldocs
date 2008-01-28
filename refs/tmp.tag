__NAME__ purpose
temporarily set value of scratch variable, with interpolation
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
	<!-- DFL -->
	</entry>
	<entry>
	Name of the temporary &glos-scratch; variable.
	</entry>

</row> 
&ROW_INTERPOLATE_1;
&ROW_REPARSE_1;
__END__


__NAME__ description
The tag sets value of the named temporary &glos-scratch; variable.
</para><para>
The variable is temporary in a way that &IC; adds its name to the list of
variables to delete directly after the 
current page is processed and served.
Except for being part of good design, temporary variables also speed up
&glos-session; write time in many cases.
</para><para>
By default, the provided value is &glos-interpolate;d before
assignment. To not interpolate contents, use &tag-tmpn; or provide
<literal>interpolate=0</literal> attribute to this tag.
__END__

__NAME__ notes
See &glos-scratch; glossary entry for a complete discussion.
__END__


