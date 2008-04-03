__NAME__ purpose
iterate through a list
__END__

__NAME__ description
<tag>loop</tag> belongs to the so-called looping tags, see
<olink targetdoc="glossary" targetptr="LoopingTags">glossary</olink>
for a complete discussion of this class of tags.
__END__

__NAME__ synopsis 
<row>

	<entry>
	list
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	list of items to iterate through
	</entry>

</row> 
<row>

	<entry>
	prefix
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>item</literal>
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	list_prefix
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>list</literal>
	</entry>
	<entry>
	changes subtag for list
	</entry>

</row> 
<row>

	<entry>
	label
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
	object
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
&TAG_LIST_CONTAINER;
<row>

	<entry>
	mv_first_match
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
	search
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	lr
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
	quoted
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
	extended
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
	table
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
	extended_only
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
	fn
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
	mv_field_names
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
	delimiter
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
	record_delim
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
	acclist
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
	ranges
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
	list consists of ranges like 1..4
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	head_skip
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





   [loop list=|
            k1    A1    A2    A3
            k2    B1    B2    B3
    |]
        [loop-increment][loop-code]
    [/loop]


H2: loop

Loop lists can be used to construct arbitrary lists based on the contents of a database field, a search or other value (like a fixed list). Loop accepts a C<search> parameter that will do one-click searches on a database table (or file).

To iterate over all keys in a table, use the idiom (C<[loop search="ra=yes/ml=9999"] [/loop]>. C<ra=yes> sets C<mv_return_all>, which means "match everything". C<ml=9999> limits matches to that many records. If the text file for searching an Interchange DBM database is not used, set C<st=db> (mv_searchtype).

When using C<st=db>, returned keys may be affected by C<TableRestrict>. Both can be sorted with C<[sort table:field:mod -start +number]> modifiers. See {{C[jump="icdatabase.html#Sorting"]sorting}}.

The Interchange Tags Reference has more information on the
E<lbracket>{{C[jump="ictags.html#loop"]loop}}] tag.

LI1: E<lbracket>{{C[jump="ictags.html#loop"]loop}}C< item item item]> LIST C<[/loop]>

.named attributes: C<[loop prefix=label* list="item item item"* search="se=whatever"*]>

.Returns a string consisting of the LIST, repeated for every item in a comma-separated or space-separated list. This tag works the same way as the C<[item-list]> tag, except for order-item-specific values. It is intended to pull multiple attributes from an item modifier, but can be useful for other things, like building a pre-ordained product list on a page.

.Loop lists can be nested by using different prefixes:

!block example; listitem=2
    [loop prefix=size list="Small Medium Large"]
        [loop prefix=color list="Red White Blue"]
            [color-code]-[size-code]<BR>
        [/loop]
        <P>
    [/loop]
!endblock

.This will output:

!block example; listitem=2
    Red-Small
    White-Small
    Blue-Small

    Red-Medium
    White-Medium
    Blue-Medium

    Red-Large
    White-Large
    Blue-Large
!endblock

.The search="args" parameter will return an arbitrary search, just as in a one-click search:

!block example; listitem=2
    [loop search="se=Americana/sf=category"]
        [loop-code] [loop-field title]
    [/loop]
!endblock

.The above will show all items with a category containing the whole world "Americana."
