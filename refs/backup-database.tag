__NAME__ purpose
backup Interchange databases, even rows selectively
__END__

__NAME__ synopsis 
<row>

	<entry>
	tables
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	</entry>
	<entry>
	Tables to back-up
	</entry>

</row> 
<row>

	<entry>
	force
	</entry>
	<entry>
	</entry>
	<entry>
	</entry>
	<entry>
	&glos-false;
	</entry>
	<entry>
	Force export even if &conf-NoExportExternal; would apply to this table?
	</entry>

</row> 
<row>

	<entry>
	dir
	</entry>
	<entry>
	</entry>
	<entry>
	</entry>
	<entry>
	<varname>BACKUP_DIRECTORY</varname> or 
	<filename class='directory'>&glos-CATROOT;/backup/</filename>
	</entry>
	<entry>
	Backup directory to dump database contents to
	</entry>

</row> 
<row>

	<entry>
	gnumeric
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
	Save all backed databases to a gnumeric file
	<filename>DBDOWNLOAD.all</filename> in the backup directory?
	</entry>

</row> 
<row>

	<entry>
	xls
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
	Save all backed databases to a Microsoft Excel file
	<filename>DBDOWNLOAD.xls</filename> in the backup directory?
	This option requires 
	<classname>Spreadsheet::WriteExcel</classname> &PERL; module.
	</entry>

</row> 
<row>

	<entry>
	max_xls_string
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	255
	</entry>
	<entry>
	Maximum length of a field within the Microsoft Excel .xls format
	</entry>

</row> 
<row>

	<entry>
	where
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
	An additional WHERE= &glos-SQL; clause to selectively back-up only 
	parts of databases
	</entry>

</row> 
<row>

	<entry>
	compress
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
	GZip output backup files? This option requires 
	<classname>Compress:Zlib</classname> &PERL; module.
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag allows database backups. Databases are dumped into the backup directory,
and named after their corresponding source files (taken from &conf-Database; 
definitions).
</para><para>
The tag can also produce dumps in gnumeric or Microsoft Excel formats.
__END__


__NAME__ notes
The backup directory, whichever it is, must exist before 
&tag-backup-database; is called.
__END__

__NAME__ example: Backing-up the products database
For this example to work,
<filename class='directory'>&glos-CATROOT;/backup/</filename> directory must
exist:
<programlisting>
[either]
  [tmp name=backup set="[backup-database tables=products]" hide=1]
[or]
  [scratch ui_error]
[/either]
</programlisting>
__END__

