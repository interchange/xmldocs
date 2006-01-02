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
__END__

__NAME__ description
This tag reads a tab-separated menu file and display its contents according
to the parameters. The template for each menu entry can be passed in the tag
body.
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

__NAME__ see also
MV_MENU_DIRECTORY
__END__