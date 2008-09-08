__NAME__ purpose
replaces placeholders in curly braces with provided values
__END__

__NAME__ synopsis 
<row>

	<entry>
	hash
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
&TAG_CONTAINER;
__END__

__NAME__ description
<tag>attr-list</tag> replaces placeholders in curly braces with
provided values. These values can be passed as parameters or as
Perl hash reference in the <literal>hash</literal> parameter.

<informaltable>
<tgroup cols="2">
<thead>
<row>
<entry>Placeholder</entry>
<entry>Replacement</entry>
</row>
</thead>
<tbody>
<row>
<entry>{NAME}</entry>
<entry>value of NAME</entry>
</row>
<row>
<entry>{NAME?}...{/NAME?}</entry>
<entry>placeholder contents if NAME is true</entry>
</row>
<row>
<entry>{NAME?}...{/NAME?}</entry>
<entry>placeholder contents if NAME is false</entry>
</row>
</tbody>
</tgroup>
</informaltable>
&TAG_CONTAINER;
__END__

