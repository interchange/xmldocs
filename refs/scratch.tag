__NAME__ purpose
return content of the named scratch variable
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
	Filter to apply to the value.
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
	Keep variable value in memory intact, and only apply filter for display?
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag returns value of the named &glos-scratch; variable.
__END__

__NAME__ notes
Scratch variables cannot be set using the &tag-scratch; tag; see 
&glos-scratch; glossary entry for a complete discussion.
__END__

__NAME__ see also
scratch,scratchd,set,seti,tmp,tmpn,value
__END__

