__NAME__ purpose
comment (disable) parts of Interchange or HTML code
__END__

__NAME__ see also
debug
__END__

__NAME__ synopsis
__END__

__NAME__ description
The tag comments parts of &glos-ITL; or &glos-HTML; code.
Content enclosed in the &tag-comment; block will not be processed
in any way, and will be stripped out of the final data sent to 
the clients.
</para><para>
You can use comment sections to provide code commentary, or
effectively disable parts of code.
</para><para>
Interchange's &tag-comment; tag is often preferred over &glos-HTML;
comments (<code>&lt;!--<replaceable>...</replaceable>--&gt;</code> blocks),
because unlike &tag-comment; blocks, HTML comments do get
passed through to the clients.
__END__


__NAME__ notes
&tag-comment; blocks can be nested.
__END__

__NAME__ example: Using comment
<programlisting>
[comment]
  Have no fear, for this is just one comment area!
[/comment]
</programlisting>
__END__

__NAME__ example: Disabling ITL code
This &tag-nitems; tag below will never execute:
<programlisting>
[comment]
  You have [nitems] items in your cart.
[/comment]
</programlisting>
__END__

