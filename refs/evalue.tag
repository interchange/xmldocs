__NAME__ purpose
return encoded content of the named form input field
__END__


__NAME__ description
&tag-__FILENAME__; behaves exactly the same as &tag-value;, except
that it automatically encodes entities found in the value.
</para><para>
For all other information, please see tag &tag-value;.
__END__

__NAME__ see also
value, encode_entities
__END__

__NAME__ example: displaying user's first name
<programlisting>
Hello, [evalue fname]!
</programlisting>
__END__


What does 
UserTag evalue   Alias  value keep=1 filter="encode_entities" name=
mean? That evalue can only be called as [evalue NAME], with no
chance for named parameters or other options?

