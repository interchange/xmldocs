__NAME__ purpose
set content of the named scratch variable, interpolating it before assignment
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
&ROW_INTERPOLATE_1;
&ROW_REPARSE_1;
__END__


__NAME__ description
The tag sets value of the named &glos-scratch; variable.
</para><para>
By default, the provided value is &glos-interpolate;d before
assignment. To not interpolate contents, use &tag-set; or provide
<literal>interpolate=0</literal> attribute to this tag.
__END__

__NAME__ notes
See &glos-scratch; glossary entry for a complete discussion.
__END__


