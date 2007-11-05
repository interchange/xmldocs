__NAME__ purpose
write custom message to arbitrary log file
__END__

__NAME__ synopsis 
<row>

	<entry>
		<group>
			<arg choice='plain'>file</arg>
			<arg choice='plain'>arg</arg>
		</group>
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
	Name of the log file.
	</entry>

</row> 
<row>

	<entry>
	create
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	No. Yes if <option>file</option> begins with
	"<literal>&gt;</literal>".
	</entry>
	<entry>
	Create the log file if it doesn't exist?
	</entry>

</row> 
<row>

	<entry>
	process
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
		Strip leading and trailing whitespace, "normalize" newlines.
	</entry>
	<entry>
	Special actions to perform on the log message before writing to the
	log file. By default, this includes removing leading and trailing whitespace,
	and forcing every <literal>\r\n</literal> sequence to a single Unix
	line-feed character (<literal>\n</literal>). Use a value of
	"<literal>nostrip</literal>" to prevent default processing.
	</entry>

</row> 
<row>

	<entry>
	type
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>text</literal>
	</entry>
	<entry>
	Log type to produce. Possible options are <literal>text</literal>
	(standard), <literal>quot</literal> (quotes each field, where fields
	are separated by <option>delimiter</option>), <literal>error</literal>
	(formats and logs message like the standard Interchange error message) and
	<literal>debug</literal> (formats and logs message like standard
	Interchange debug message). Options <literal>error</literal> and
	<literal>debug</literal> actually invoke &IC;'s 
	<function>logError</function> or <function>logDebug</function> functions
	in addition to writing to the log file (if any was specified).
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
	&NEWLINE;
	</entry>
	<entry>
	Line delimiter. Allows the tag to identify multiple "records" in input
	submitted at once.
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
	&TAB;
	</entry>
	<entry>
	Field delimiter. Allows the tag to identify fields within the line.
	</entry>

</row> 
&ROW_HIDE_0;
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__

__NAME__ see also
LogFile, DEBUG
__END__

__NAME__ description
The &tag-__FILENAME__; tag can be used to write custom, possibly multiline,
log messages to arbitrary log files.
__END__


__NAME__ missing
in sub log (Interpolate), qw/delim record_delim/ should be qw/delimiter record_delim/, right ?
__END__


__NAME__ example: Log message to catalog's error.log
<programlisting>
[log type=error]
An error occured.
[/log]
</programlisting>

Or the same example that &glos-interpolate;s message text:

<programlisting>
[log type=error interpolate=1]
An error occured, inform [value fname] at [value email].
[/log]
</programlisting>
__END__


__NAME__ example: Log to custom log
<programlisting>
[log file=var/log/custom.log]
Custom log message.
[/log]
</programlisting>
__END__

