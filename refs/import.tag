__NAME__ purpose
import records into database
__END__


__NAME__ synopsis
<row>
	<entry>
		<group>
			<arg choice='plain'>table</arg>
			<arg choice='plain'>base</arg>
			<arg choice='plain'>database</arg>
		</group>
	</entry>
	<entry>Yes</entry><entry>Yes</entry>
	<entry></entry>
	<entry>.</entry>
</row>
<row>
	<entry><arg choice='plain'>type</arg></entry>
	<entry>Yes</entry><entry></entry>
	<entry></entry>
	<entry>
	</entry>
</row>
<row>
	<entry><arg choice='plain'>continue</arg></entry>
	<entry></entry><entry></entry>
	<entry></entry>
	<entry>
	</entry>
</row>
<row>
	<entry><arg choice='plain'>separator</arg></entry>
	<entry></entry><entry></entry>
	<entry></entry>
	<entry>
	</entry>
</row>
<row>
	<entry><arg choice='plain'>file</arg></entry>
	<entry></entry><entry></entry>
	<entry></entry>
	<entry>.</entry>
</row>
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ see also
export
__END__


__NAME__ notes
__END__


__NAME__ description
The &tag-__FILENAME__; tag is used to import records into a
&glos-database;.
</para><para>
The <option>table</option> (database) must already be registered
with &IC; using the &conf-Database; directive; tables cannot be created
on the fly.
__END__




Named attributes:

>    [import table=table_name
>            type=(TAB|PIPE|CSV|%%|LINE)
>            continue=(NOTES|UNIX|DITTO)
>            separator=c]

Import one or more records into a database. The C<type> is any
of the valid Interchange delimiter types, with the default being defined
by the setting of the database I<DELIMITER>. The table must already be a defined
Interchange database table; it cannot be created on the fly. (If you need
that, it is time to use SQL.)

The C<type> of C<LINE> and C<continue> setting of C<NOTES> is particularly
useful, for it allows you to name your fields and not have to remember
the order in which they appear in the database. The following two imports
are identical in effect:

>    [import table=orders]
>    code: [value mv_order_number]
>    shipping_mode: [shipping-description]
>    status: pending
>    [/import]
>
>    [import table=orders]
>    shipping_mode: [shipping-description]
>    status: pending
>    code: [value mv_order_number]
>    [/import]

The C<code> or key must always be present, and is always named C<code>.

If you do not use C<NOTES> mode, you must import the fields in the
same order as they appear in the ASCII source file.

The C<[import ....] TEXT [/import]> region may contain multiple records.
If using C<NOTES> mode, you must use a separator, which by default is
a form-feed character (^L).



