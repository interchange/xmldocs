
__NAME__ synopsis
<row>
	<entry>
		<arg choice='plain'>category</arg>
	</entry>
	<entry>Yes</entry><entry></entry>
	<entry><literal>default</literal></entry>
	<entry>
	For a &glos-weighted; banner display, this field specifies
	category name; only database entries where the
	<database class='field'>category</database>
	field matches this value are taken as possible candidates for display.
	In an unweighted display, this field specifies
	banner code; of course, only one database entry with the matching value in
	the <database class='field'>code</database> field should exist.
	</entry>
</row>
<row>
	<entry>
		<arg choice='plain'>once</arg>
	</entry>
	<entry></entry><entry></entry>
	<entry>0</entry>
	<entry>
	Don't rebuild the banners until the appropriate
	<filename>tmp/Banners/*/total_weight</filename> files are manually removed?
	This is only used with weighted ads.
	</entry>
</row>
&TAG_NON_CONTAINER;
__END__

