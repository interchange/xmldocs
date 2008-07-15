__NAME__ purpose
print all sorts of Interchange-related system information
__END__

__NAME__ synopsis 
<row>

	<entry>
	extended
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	Print extended version report?
	</entry>

</row> 
<row>

	<entry>
	joiner
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>&lt;br&gt;</literal>
	</entry>
	<entry>
	Record/line separator.
	</entry>

</row> 
<row>

	<entry>
	global_error
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
	Print location of the global (Interchange) error file?
	</entry>

</row> 
<row>

	<entry>
	local_error
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
	Print location of the local (catalog) error file? (The filename is
	provided as a hyperlink).
	</entry>

</row> 
<row>

	<entry>
	env
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
	Print &glos-environment; variable names? (the environment variables specified
	in &conf-Environment;).
	</entry>

</row> 
<row>

	<entry>
	safe
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
	Print &conf-SafeUntrap; value?
	</entry>

</row> 
<row>

	<entry>
	child_pid
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
	Print child process PID?
	</entry>

</row> 
<row>

	<entry>
	<group choice='plain'>
	<arg choice='plain'>modtest</arg>
	<arg choice='plain'>module_test</arg>
	<arg choice='plain'>moduletest</arg>
	<arg choice='plain'>require</arg>
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
	Test for availability of the specified &PERL; module.
	</entry>

</row> 
<row>

	<entry>
	pid
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
	Print parent PID?
	</entry>

</row> 
<row>

	<entry>
	mode
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
	Print Interchange &glos-ic-run-mode;?
	</entry>

</row> 
<row>

	<entry>
	uid
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
	Print &IC; process username and numerical ID?
	</entry>

</row> 
<row>

	<entry>
	global_locale_options
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
	Print &glos-locale; information? (Available locale codes
	and language names)
	</entry>

</row> 
<row>

	<entry>
	perl
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
	Print &PERL; information? (Perl version and the location of the Perl binary)
	</entry>

</row> 
<row>

	<entry>
	perl_config
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
	Print &PERL; config information? (output of the 
	<function>Config::myconfig()</function> function)
	</entry>

</row> 
<row>

	<entry>
	hostname
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
	Print hostname?
	</entry>

</row> 
<row>

	<entry>
	modules
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
	Print modules information? (List of &IC;-related modules found and
	their installed versions. For optional modules, print why one would
	want to have them).
	</entry>

</row> 
<row>

	<entry>
	db
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	1, if none of the above options were set
	</entry>
	<entry>
	Print database information?
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__

__NAME__ description
The tag produces all sorts of system information that is in some relation
to &IC;.
__END__

__NAME__ example: Invoking the tag with the full set of options
<programlisting>
[version
  extended=1
  global_error=1
  local_error=1
  env=1
  safe=1
  pid=1
  child_pid=1
  mode=1
  uid=1
  global_locale_options=1
  perl=1
  perl_config=1
  hostname=1
  db=1
  modules=1
  modtest=DBI
]
</programlisting>
__END__


