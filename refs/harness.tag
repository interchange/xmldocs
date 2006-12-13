__NAME__ synopsis 
<row>

	<entry>
	expected
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
	name
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



H2: harness

Test harness block. Similar to try/catch. Interprets the body text and checks the return value against expected and explicitly bad cases.

Returns DIED, OK, or NOT OK message along with your result if not the expected value.

H3: Summary

!block example;
    [B<harness> I<other_named_attributes>]
!endblock

!block table; colvaligns="TTT"; format="262"
Parameters|Description|Default
{{CMD[jump="#harness_expected"]expected}}|<<
Tagname for delimiting your expected return value (default "OK")
>>|DEFAULT_VALUE
{{CMD[jump="#harness_name"]name}}|<<
This will appear in your output message (useful for distinguishing harness tags from one another) (default "testI<nnn>")
>>|DEFAULT_VALUE
!endblock

!block table; colvaligns="TT"
Attributes|Default
{{CMD[jump="#attr_interpolate"]interpolate}}|I<No>
{{CMD[jump="#attr_reparse"]reparse}}|I<Yes>
!endblock

!block table; headings=1; colvaligns="TT"
A|B
Other_Characteristics|
Invalidates cache|I<no>
Container tag|I<Yes>
Has Subtags|I<No>
Nests|I<No>
!endblock


B<Tag expansion example:>

!block example
    [harness]
---
    TODO: (tag result)
!endblock


B<ASP-like Perl call:>

!block example; lang="Perl"
   $Tag->harness(  { 
}, $body  );
!endblock

or similarly with positional parameters,

!block example; lang="Perl"
    $Tag->harness(, $attribute_hash_reference, $body);
!endblock

H3: Description


Test harness block. Similar to try/catch. Interprets the body text and checks the return value against expected and explicitly bad cases.

Returns DIED, OK, or NOT OK message along with the harness name and your result if not the expected value.



# BEGIN ############ harness Subsections ##############
H4: {{CMD[id="harness_expected"]expected}}

Tagname for delimiting your expected return value (default "OK")


H4: {{CMD[id="harness_name"]name}}

This will appear in your output message (useful for distinguishing harness tags from one another) (default "testI<nnn>")

