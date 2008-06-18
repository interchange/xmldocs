__NAME__ purpose
pagination for Interchange lists
__END__

__NAME__ synopsis
<row>

	<entry>
	more_routine
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
	custom routine for &tag-more-list;
	</entry>

</row> 
__END__

__NAME__ description
&tag-more-list; can be used in lists produced by the &tag-query;, 
&tag-search-region; ... tags.
</para>
<refsect2>
<title>Template for More Lists</title>
<para>
The default template for more lists looks like that:
<programlisting>
{FIRST_LINK?}{FIRST_LINK} {/FIRST_LINK?}
{PREV_LINK?}{PREV_LINK} {/PREV_LINK?}
{DECADE_PREV?}{DECADE_PREV} {/DECADE_PREV?}
     {MORE_LIST}
{DECADE_NEXT?} {DECADE_NEXT}{/DECADE_NEXT?}
{NEXT_LINK?} {NEXT_LINK}{/NEXT_LINK?}
{LAST_LINK?} {LAST_LINK}{/LAST_LINK?}
</programlisting>
The following values will be recognized in the template:
<informaltable>
<tgroup cols="2">
<thead>
<row>
<entry>Value</entry>
<entry>Description</entry>
</row>
</thead>
<tbody>
<row>
<entry><literal>MATCH_COUNT</literal></entry>
<entry>Same as [match-count], number of matches</entry>
</row>
<row>
<entry><literal>MATCHES</literal></entry>
<entry>Same as [matches]</entry>
</row>
<row>
<entry><literal>LAST_PAGE</literal></entry>
<entry>Last page number</entry>
</row>
<row>
<entry><literal>CURRENT_PAGE</literal></entry>
<entry>Current page number</entry>
</row>
<row>
<entry><literal>DECADE_FIRST</literal></entry>
<entry>First page of decade</entry>
</row>
<row>
<entry><literal>DECADE_LAST</literal></entry>
<entry>Last page of decade</entry>
</row>
<row>
<entry><literal>FIRST_MATCH</literal></entry>
<entry>First match displayed on this page</entry>
</row>
<row>
<entry><literal>LAST_MATCH</literal></entry>
<entry>Last match displayed on this page</entry>
</row>
<row>
<entry><literal>FIRST_LINK</literal></entry>
<entry>Link to first page</entry>
</row>
<row>
<entry><literal>PREV_LINK</literal></entry>
<entry>Link to previous page</entry>
</row>
<row>
<entry><literal>DECADE_PREV</literal></entry>
<entry>Link to previous decade</entry>
</row>
<row>
<entry><literal>MORE_LIST</literal></entry>
<entry>The page list</entry>
</row>
<row>
<entry><literal>DECADE_NEXT</literal></entry>
<entry>Link to next decade</entry>
</row>
<row>
<entry><literal>NEXT_LINK</literal></entry>
<entry>Link to next page</entry>
</row>
<row>
<entry><literal>LAST_LINK</literal></entry>
<entry>Link to last page</entry>
</row>
</tbody>
</tgroup>
</informaltable>
</para>
</refsect2>
<para>
__END__

