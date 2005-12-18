__NAME__ purpose
export a database to a text file
__END__

__NAME__ synopsis 
<row>

	<entry>
	<group choice='opt'>
	<arg choice='plain'>table</arg>
	<arg choice='plain'>database</arg>
	<arg choice='plain'>base</arg>
	</group>
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
	Table name to export
	</entry>

</row> 
<row>

	<entry>
	field
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
	The column to add or delete
	</entry>

</row> 
<row>

	<entry>
	file
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
	Filename to export to. Note that &conf-NoAbsolute; directive and other
	conditions may affect the range of possible locations
	</entry>

</row> 
<row>

	<entry>
	sort
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
	Sorting option in format of
	<literal><replaceable>sort_field</replaceable>:<replaceable>sort_option</replaceable></literal>.
	</entry>

</row> 
<row>

	<entry>
	type
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
	Output format
	</entry>

</row> 
<row>

	<entry>
	delete
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
	Instead of adding, delete column specified by the
	<literal>field</literal> attribute?
	(In effect only if <literal>verify</literal> attribute is enabled)
	</entry>

</row> 
<row>

	<entry>
	verify
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
&ROW_HIDE_0;
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ see also
import, mv_sort_option
__END__


__NAME__ description
The tag exports named &glos-database; to a text file.
__END__
