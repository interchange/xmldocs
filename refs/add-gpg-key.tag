__NAME__ purpose
add a GPG/PGP key to keyring
__END__

__NAME__ synopsis 
<row>
	<entry>
	name
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	</entry>
	<entry>
	</entry>
	<entry>
	Name of the &glos-CGI; variable where the key text can be found.
	</entry>
</row> 
<row>

	<entry>
	text
	</entry>
	<entry>
	</entry>
	<entry>
	</entry>
	<entry>
	</entry>
	<entry>
	GPG/PGP key text, specified in-place. If defined, takes precedence over the
	&glos-CGI; variable pointed to by the <literal>name=</literal> attribute.
	</entry>

</row> 
<row>

	<entry>
	return_id
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
	Return key ID upon import?
	</entry>

</row> 
<row>

	<entry>
	success
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>1</literal>
	</entry>
	<entry>
	Value to return if key import action succeeds.
	</entry>

</row> 
<row>

	<entry>
	failure
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	<literal>undef</literal>
	</entry>
	<entry>
	Value to return if key import action fails.
	</entry>

</row> 
&ROW_INTERPOLATE_0;
&ROW_REPARSE_1;
__END__


__NAME__ description
This tag imports a &GPG;/PGP key into the keyring.
</para><para>
Key text can either be specified in-place, or a name of the &glos-CGI; variable
containing the key text can be provided.
__END__

__NAME__ example: Importing a key by specifying CGI variable containing key text
[add-gpg-key name=pgpkeytext return_id=1 failure=FAILED]
__END__

__NAME__ example: Importing a key by specifying key text in-place
[add-gpg-key text="[value pgpkeytext]" return_id=1 failure=FAILED]
__END__

