
__NAME__ purpose
produce a hypertext link
__END__ 


__NAME__ synopsis
<row>
<entry>Standard options</entry>
<entry></entry><entry></entry>
<entry></entry>
<entry>
See options for tag &tag-area;.
</entry>
</row>
<row>
<entry><arg choice='plain'>extra</arg></entry>
<entry></entry><entry></entry>
<entry>None.</entry>
<entry>
Name of a &glos-CSS; class to insert as <literal>class=<replaceable>...</replaceable></literal>.
</entry>
</row>
&TAG_NON_CONTAINER;
__END__

__NAME__ see also
area
__END__

__NAME__ description
The &tag-page; tag expands to a proper hypertext URL &glos-link; which
preserves Interchange &glos-session; information and arguments passed onto
the targeted page or &glos-form-action;. The target page argument you
supply is treated relatively
to the <filename class='directory'>pages/</filename> directory inside your
catalog root directory (&glos-CATROOT;).
</para><para>
The enclosing &lt;a href=""&gt;&lt;/a&gt; HTML tag is included. Where 
this is unwanted, use &tag-area;.
</para><para>
Besides just producing hypertext links to specific pages, you can also
"embed" complete &glos-HTML; forms in the target link (for say, one-click
ordering or searches); see <xref linkend="page_examples"/>.
__END__


__NAME__ notes
The &tag-__FILENAME__; tag examples use some advanced argument-quoting concepts.
To minimize confusion, please see the proper and complete quoting explanation
in the &glos-ITL; glossary entry.
</para><para>
Since the &tag-page; already includes an opening &glos-HTML; link
(the "<replaceable>&lt;a href=<replaceable>...</replaceable>&gt;</replaceable>"
part), the only thing left is to close it using "<literal>&lt;/a&gt;</literal>"
after typing in the link text. There is a <code>[/page]</code> macro 
in existence, but it translates directly to <literal>&lt;/a&gt;</literal>
&mdash; which means typing <literal>&lt;/a&gt;</literal> directly
saves parser a little work. The use of this macro is discouraged
and you should always insert "<literal>&lt;/a&gt;</literal>" directly.
__END__


__NAME__ example: Produce the basic hypertext link
Add the following to an Interchange page:
<programlisting><![CDATA[
Please visit our [page index]Welcome</a> page.
]]></programlisting>
__END__


__NAME__ example: Pass arguments onto the target page
Add the following link to an Interchange page:

<programlisting><![CDATA[
Visit the [page href='test' arg='arg1=value1/arg2=value2']test</a> page.
]]></programlisting>
The relevant part of your <filename>test.html</filename> page could then
look like this:
<programlisting>
<xi:include parse='text' href='../files/area/test.html'/>
</programlisting>
__END__


__NAME__ example: Simple item ordering using the page tag

<programlisting><![CDATA[
Order a [page order TK112]Toaster</a> today.
]]></programlisting>
__END__


__NAME__ example: Embedding HTML forms in the page tag
<programlisting><![CDATA[
[page form="
  mv_order_item=99-102
  mv_order_size=L
  mv_order_quantity=1
  mv_separate_items=1
  mv_todo=refresh"
]Order T-shirt in Large size</a>
]]></programlisting>

Or another example:

<programlisting><![CDATA[
[page form="
  mv_todo=refresh
  mv_order_item=000101
  mv_order_fly=description=An on-the-fly item|price=100.01
"]Order item 000101</a>
]]></programlisting>

Which is equivalent to the usual HTML form:

<programlisting><![CDATA[
<form action="[area process]" method="post">
  <input type='hidden' name='mv_todo' value="refresh">
  <input type='hidden' name='mv_order_item' value="000101">
  Qty: <input size='2' name='mv_order_quantity' value="1">
  <input type='hidden' name='mv_order_fly' value="description=An on-the-fly item|price=100.00">
  <input type='submit' value="Order button">
</form>
]]></programlisting>
__END__


__NAME__ example: Implementing searches using href=/arg= options

<programlisting><![CDATA[
[page scan
    se=Impressionists
    sf=category]
Search for Impressionist Paintings</a>
]]></programlisting>

Or the equivalent, using named parameters and more understandable quoting:

<programlisting><![CDATA[
[page href=scan
    arg="se=Impressionists
         sf=category"]
Search for Impressionist Paintings</a>
]]></programlisting>

If the <option>arg</option> parameter is set, it will be available
within the search display page as <code>[value mv_arg]</code>.
__END__


__NAME__ example: Implementing searches using search= option
The <arg choice='plain'>search</arg> attribute is a shorthand for the 
<arg choice='plain'>href</arg>/<arg choice='plain'>arg</arg> scheme. 
When <arg choice='plain'>search</arg> is used, 
<arg choice='plain'>href</arg> will be set to <literal>scan</literal> and
<arg choice='plain'>arg</arg> to the value of 
<arg choice='plain'>search</arg>.

<programlisting><![CDATA[
[page search="
    se=Impressionists
    sf=category"]
Search for Impressionist Paintings</a>
]]></programlisting>
__END__

