__NAME__ purpose
displays HTML menu
__END__

__NAME__ synopsis
<row>
<entry>
<arg choice='plain'>name</arg>
</entry>
<entry>Yes</entry>
<entry></entry>
<entry></entry>
<entry>name of menu file</entry>
</row>
<row>
<entry>
<arg choice='plain'>joiner</arg>
</entry>
<entry></entry>
<entry></entry>
<entry></entry>
<entry>HTML code appearing between menu entries</entry>
</row>
<row>
<entry>
<arg choice='plain'>localize</arg>
</entry>
<entry></entry>
<entry></entry>
<entry></entry>
<entry>list of fields to localize</entry>
</row>
<row>
<entry>
<arg choice='plain'>logged_in</arg>
</entry>
<entry></entry>
<entry></entry>
<entry></entry>
<entry>selection field for authorized users</entry>
</row>
<row>
<entry>menu_type</entry>
<entry></entry>
<entry></entry>
<entry><literal>simple</literal></entry>
<entry>menu type (<literal>simple</literal>, <literal>tree</literal>, <literal>flyout</literal>)</entry>
</row>
&TAG_CONTAINER;
__END__

__NAME__ description
This tag reads a tab-separated menu file and display its contents according
to the parameters. The template for each menu entry can be passed in the tag
body.

Selection fields determine which menu entries are displayed.

The following columns are recognized in the menu file:

__END__

__NAME__ example: Simple Menubar
<programlisting><![CDATA[
<table><tr>
[menu name=Menubar localize=name joiner='<td><img src="menu_separator.png"></td>']
<td class="menubar" valign="center" align="center">
<a href="{HREF}" class="menubar">{NAME}</a>
</td>
[/menu]
</tr></table>
]]></programlisting>
__END__

__NAME__ example: Simple Menubar with Different Links
<programlisting><![CDATA[
[menu name="links"]
<span class="links">
{HREF?}<a href="{HREF}" class="links">{NAME}</a>{/HREF?}
{URL?}<a href="{URL}" class="links">{NAME}</a>{/URL?}
</span>
[/menu]
]]></programlisting>
<para>
This menu contains links to external sites (<literal>href</literal>) and 
internal pages (<literal>url</literal>).
</para>
__END__

__NAME__ example: Flyout Menu
<programlisting><![CDATA[
[menu
	name="Products"
	link-class="barlink"
	flyout-class="flyout_class"
	flyout-style="flyout_style"
	menu-type=flyout
][/menu]
]]></programlisting>
__END__

__NAME__ see also
MV_MENU_DIRECTORY, tree
__END__
