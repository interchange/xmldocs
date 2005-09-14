__NAME__ purpose
set content of the named scratch variable
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
	Name of the &glos-scratch; variable.
	</entry>

</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ description
The tag sets value of the named &glos-scratch; variable.
</para><para>
By default, the provided value is not &glos-interpolate;d before
assignment. To interpolate contents, use &tag-seti; or provide
<literal>interpolate=1</literal> attribute to this tag.
__END__

__NAME__ notes
See &glos-scratch; glossary entry for a complete discussion.
__END__


