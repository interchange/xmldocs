__NAME__ purpose
display current date and time according to POSIX strftime format specifier
__END__

__NAME__ synopsis 
<row>

	<entry>
	locale
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
	Format date and time according to the named &glos-locale;
	(assuming that the locale is available on your system).
	</entry>

</row> 
<row>

	<entry>
	tz
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
	Specify the timezone.
	Note that the first alphabetical string is the zone name to be used 
	when not under daylight-savings time. The following digit is the number
	of hours displacement from GMT, and the second alphabetical string is
	the zone name when in daylight savings time. (This may not work on all
	operating systems.)
	</entry>

</row> 
<row>

	<entry>
	time
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
	Specify the date/time manually, instead of letting &IC; call
	Perl <function>time()</function> function.
	</entry>

</row> 
<row>

	<entry>
	sortable
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	Display date in "sortable" format? Sortable format is predefined
	<literal>format=</literal> string that displays the date in 
	"<literal>
	<replaceable>YYYY</replaceable>/
	<replaceable>MM</replaceable>/
	<replaceable>DD</replaceable>
	</literal>
	</entry>" style.
</row> 
<row>

	<entry>
	adjust
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	</entry>
	<entry>
	For the display purpose, adjust the time for the specified
	value.
	In most cases, the value will represent hours. If the
	value ends in <literal>0</literal> and contains three or 
	more digits, then it is assumed to be in timezone format.
	The offset can also be specified using &glos-interval; format.
	See <xref linkend="time_examples"/> for clarification.
	</entry>

</row> 
<row>

	<entry>
	hours
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	Force the <literal>adjust=</literal> argument to always 
	represent hours.
	</entry>

</row> 
<row>

	<entry>
	<group choice='opt'>
	<arg choice='plain'>format</arg><arg choice='plain'>fmt</arg>
	</group>
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
	POSIX strftime format specifier, see &glos-time; glosssary entry.
	</entry>

</row> 
<row>

	<entry>
	gmt
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	Display GMT (UTC) time?
	</entry>

</row> 
<row>

	<entry>
	zerofix
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	Strip leading zeros from numbers?
	</entry>

</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ description
The tag displays the current date and time, in a format specified using
POSIX strftime notation.
__END__


__NAME__ notes
In all <literal>adjust=</literal> manipulations, the offset will just be 
applied at the end (the timezone will not be changed for the invocation
of time function). This means you shouldn't use any format that uses
timezone information. For the timezone to enter calculations, either use 
<literal>tz=</literal>, or manage the system yourself.
</para><para>
The timezone can be set globally for the &IC; installation by defining
the <envar>TZ</envar> environment variable and restarting Interchange.
__END__


__NAME__ example: Basic example
<programlisting>
[time]%am %B %d, %Y[/time]
</programlisting>
This tag would return a date such as
<literal>Sunday, September 4, 2005</literal>.
__END__


__NAME__ example: Specifying adjust= attribute in number of hours
<programlisting>
[time adjust="-3"]%c[/time]
</programlisting>
With a base date of <literal>Mon 01 Jan 2001 11:29:03 AM EST</literal>,
this tag would display <literal>Mon 01 Jan 2001 08:29:03 AM EST</literal>.
__END__


__NAME__ example: Specifying adjust= attribute in timezone format
<programlisting><![CDATA[
[time]%c[/time]
[time adjust="-330"]%c[/time]
[time adjust="-300"]%c[/time]
]]></programlisting>
With a base date of <literal>Mon 01 Jan 2001 11:29:03 AM EST</literal>,
this tag would display second date offset by 3 hours and 30 minutes,
and the third date offset by 3 hours.
<screen>
Mon 01 Jan 2001 11:29:03 AM EST
Mon 01 Jan 2001 07:59:03 AM EST
Mon 01 Jan 2001 08:29:03 AM EST
</screen>
__END__

__NAME__ example: Specifying adjust= attribute in interval format
<programlisting><![CDATA[
[time adjust="2 days"]%c[/time]
]]></programlisting>
__END__

__NAME__ example: Displaying locale-specific date
<programlisting><![CDATA[
[time locale=en_US]%B %d, %Y[/time]
[time locale=fr_FR]%B %d, %Y[/time]
]]></programlisting>
would result in 
<screen>
January 01, 2001
janvier 01, 2001
</screen>
__END__



__NAME__ example: Specifying tz= attribute
<programlisting><![CDATA[
[time tz=GMT0]
[time tz=CST6CDT]
[time tz=PST8PDT]
]]></programlisting>
would result in 
<screen>
Mon 01 Jan 2001 04:43:02 PM GMT
Mon 01 Jan 2001 10:43:02 AM CST
Mon 01 Jan 2001 08:43:02 AM PST
</screen>
__END__



