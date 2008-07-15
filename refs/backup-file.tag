__NAME__ purpose
backup Interchange file
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
	Yes
	</entry>
	<entry>
	</entry>
	<entry>
	File to back-up
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag allows backing up of Interchange files.
Files are simply copied
to the <filename class='directory'>backup/</filename> subdirectory of
the catalog root directory (&glos-CATROOT;).
</para><para>
File paths are preserved during copy; a target catalog file of say,
<filename>pages/index.html</filename> would be saved to 
<filename>backup/pages/index.html</filename>.
</para><para>
You can copy filenames specified with absolute paths, and in fact, you
can backup any file that the &IC; process can read.
__END__


__NAME__ notes
The backup directory and the full pathname are automatically created
if they don't already exist.
__END__

__NAME__ example: Backing-up catalog index page
<programlisting>
[either]
  [tmp name=backup set="[backup-file pages/index.html]" hide=1]
[or]
  [scratch ui_error]
[/either]
</programlisting>
__END__

__NAME__ example: Backing-up system password file
<programlisting>
[either]
  [tmp name=backup set="[backup-file /etc/passwd]" hide=1]
[or]
  [scratch ui_error]
[/either]
</programlisting>
__END__

