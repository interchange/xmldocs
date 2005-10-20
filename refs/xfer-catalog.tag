__NAME__ purpose
conveniently package the catalog for backup or transfer purposes
__END__

__NAME__ synopsis 
<row>

	<entry>
	file
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- TODO is it required? -->
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	backup_old
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
	Save existing, old backup by renaming it to
	<literal>xfer.backup.<replaceable>DATE</replaceable></literal>?
	</entry>

</row> 
<row>

	<entry>
	show_error
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
	Return eventual error to the catalog page?
	</entry>

</row> 
<row>

	<entry>
	keep_together
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	variables
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	restore_command
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	create_db
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	create_command
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
	<!-- DSC -->
	</entry>

</row> 
<row>

	<entry>
	addcatline
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
	<!-- DSC -->
	</entry>

</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ description
The tag implements a more or less complete "catalog transfer" facility.
It can come handy to backup the catalog or prepare it for deployment at
another place.
</para><para>
The steps include:
<itemizedlist>
	<listitem><para>
		Exporting non-&MYSQL; and non-&PGSQL; databases to text files
	</para></listitem>
	<listitem><para>
		Dumping MySQL and PostgreSQL &glos-database;s with their native tools
		(usually <command>mysqldump</command> and <command>pg_dump</command>
	</para></listitem>
	<listitem><para>
		Building &glos-tarball; image, optionally saving temporary files
		and user sessions.
	</para></listitem>
	<listitem><para>
		Creating a restore script
	</para></listitem>
</itemizedlist>
</para><para>
The restore script activities include:
<itemizedlist>
	<listitem><para>
		Creating <filename>site.txt</filename> variable database containing the new
		settings for <varname>SERVER_NAME</varname>, <varname>CGI_URL</varname>,
		<varname>DOCROOT</varname>, etc.
	</para></listitem>
	<listitem><para>
		Restoring &glos-SQL; dump files, optionally creating the databases
	</para></listitem>
	<listitem><para>
		Copying over exported text databases
	</para></listitem>
	<listitem><para>
		Creating the image directory and copying images to it, and symlinking
		the target directory to the catalog directory
	</para></listitem>
	<listitem><para>
		Optionally compiling and copying a &glos-link-program;.
	</para></listitem>
	<listitem><para>
		Optionally adding the <literal>Catalog</literal> line to &gcf;.
	</para></listitem>
</itemizedlist>
__END__



__NAME__ example: Triggering catalog backup, or transfer
<programlisting><![CDATA[
[calc]

  my $old = $Scratch->{xfer_catname} = $Config->{CatalogName};
  return if $CGI->{do_xfer};
  my $new = $CGI->{rename};
  return unless $old and $new;

  $new =~ s/[^-\w]+//g;

  for(qw/
    SERVER_NAME
    SECURE_SERVER
    CGI_URL
    IMAGE_DIR
    SQLDSN
    SQLUSER
    SQLPASS
    DOCROOT
    ORDERS_TO
    SAMPLEHTML
    SAMPLEURL
    IC_DIR
    CGI_DIR
    CGIWRAP
    LINKMODE
    LINKHOST
    LINKPORT
    /)
  {
    my $val = $Variable->{$_};
    $val =~ s/$old\b/$new/g;
    $CGI->{$_} = $val;
  }
  return;
[/calc]

[if cgi do_xfer] [tmp xfer_success][xfer-catalog][/tmp] [/if]
]]></programlisting>
__END__

__NAME__ example: Offering the created tarball for download
<programlisting><![CDATA[
[if scratch xfer_success]
  Catalog output successfully.
[/if]

[if type=file term="[scratch xfer_catname].tar.gz"]

  <p>
  [calc]
    $Scratch->{mv_deliver} .= " $Scratch->{xfer_catname}.tar.gz" ; return;
  [/calc]

  [page add_dot_html=0 href="ui/[scratch xfer_catname].tar.gz"
    form="
    mv_data_file=[scratch xfer_catname].tar.gz
    mv_content_type=application/x-gzip
    mv_todo=deliver
  "]
  [L]Download transfer file[/L]
  ([file-info name="[scratch xfer_catname].tar.gz"])</a>
  </p>

[/if]
]]></programlisting>
__END__

