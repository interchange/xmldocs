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
	line-feed character (<literal>\n</literal>). Use "<literal>nostrip</literal>"
	to prevent stripping.
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
	<!-- DFL -->
	</entry>
	<entry>
	Log type to produce. Possible options are <literal>text</literal>
	(the usual), <literal>quot</literal> (quotes each field, where fields
	are separated by <option>record_delim</option>), <literal>error</literal>
	(formats and logs message like standard Interchange error message) and
	<literal>debug</literal> (formats and logs message like standard
	Interchange debug message). Options <literal>error</literal> and
	<literal>debug</literal> actually invoke &IC;'s 
	<function>logError</function> or <function>logDebug</function> functions
	in addition to writing to the specified log file.
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
	Record delimiter.
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
	Line delimiter.
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
The &tag-__FILENAME__; tag is used to write custom, possibly multiline,
log messages to arbitrary log files.
__END__


__NAME__ missing
in sub log (Interpolate), qw/delim record_delim/ should be qw/delimiter record_delim/, right ?
__END__
