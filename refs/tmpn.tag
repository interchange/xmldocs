__NAME__ purpose
temporarily set value of scratch variable, without interpolation
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
&TAG_CONTAINER;
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
By default, the provided value is not &glos-interpolate;d before
assignment. To interpolate contents, use &tag-tmp; or 
<literal>interpolate=1</literal> attribute to this tag.
__END__

__NAME__ notes
See &glos-scratch; glossary entry for a complete discussion.
__END__


