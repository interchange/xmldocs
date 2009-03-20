__NAME__ purpose
assign overrides for salestax, shipping, handling and subtotal
__END__

__NAME__ synopsis 
<row>
	<entry>
	salestax
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	None
	</entry>
	<entry>
	Override for &tag-salestax;.
	</entry>
</row> 
<row>
	<entry>
	shipping
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	None
	</entry>
	<entry>
	Override for &tag-shipping;. Applies to <tag>total-cost</tag>
	only if <mv>mv_shipmode</mv> is set.
	</entry>
</row> 
<row>
	<entry>
	handling
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	None
	</entry>
	<entry>
	Override for &tag-handling;. Applies to <tag>total-cost</tag> only if
	<mv>mv_handling</mv> is set.
	</entry>
</row> 
<row>
	<entry>
	subtotal
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	None
	</entry>
	<entry>
	Override for &tag-subtotal;.
	</entry>
</row> 
<row>
	<entry>
	credit
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	None
	</entry>
	<entry>
	Credit assignment.
	</entry>
</row> 
<row>
	<entry>
	clear
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	No
	</entry>
	<entry>
	Clear all assignments?
	</entry>
</row> 
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The &tag-__FILENAME__; tag allows you to set direct, fixed values for
some of the parts of the &glos-checkout; process, instead of deriving the
values by performing calculations, as it would happen in the normal course
of action.
</para><para>
The value assignment is persistent for the duration of the user &glos-session;,
unless you clear it explicitly.
</para><para>
The <option>clear</option> option will cancel <emphasis>all</emphasis>
active assignments. To clear an individual assignment, set its value
<emphasis>to an empty string</emphasis>.
(Beware, a specification such as <literal>handling=0</literal> actually sets
handling costs to zero, it does not clear the assignment. To clear the
assignment, you must use <literal>handling=""</literal>).
</para>
<refsect2>
<title>Rounding</title>
<para>
Overrides for &tag-shipping; and &tag-handling; are rounded to &glos-locale;-specific
number of fractional digits. Overrides for &tag-subtotal; and &tag-salestax; are 
used verbatim.
</para>
</refsect2>
<para>
__END__


__NAME__ notes
Assignments affect only the values returned by the corresponding tags.
Other behavior (such as currency formatting) is, of course, not affected.
</para><para>
Assigning any value other than a number (or an empty string, when clearing
assignments), will result in an error being reported and the 
assignment for the "subsystem" in question cleared.
</para><para>
<emphasis role='bold'>An assignment is allowed to be a
negative number</emphasis>.
</para><para>
You cannot directly assign a "total cost" amount &mdash; it will 
always be the sum of all assignment keys.
__END__


__NAME__ example: Setting shipping costs to 4.99
[assign shipping=4.99]
__END__


__NAME__ example: Setting handling costs to 0
[assign handling=0]
__END__


__NAME__ example: Clearing the assignment for salestax
[assign salestax=""]
__END__

__NAME__ example: Clearing all assignments
[assign clear=1]
__END__


__NAME__ missing
Verify special values of tags etc. in the code. (I dont see in code that mv_shipmode must be 'shipping' etc..)
__END__
