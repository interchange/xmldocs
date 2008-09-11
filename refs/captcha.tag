__NAME__ purpose
handle captcha images used for authentication
__END__

__NAME__ synopsis
<row>

	<entry>
	length
	</entry>
	<entry>
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	4
	</entry>
	<entry>
	length of the captcha code
	</entry>

</row> 
&TAG_NON_CONTAINER;
__END__

__NAME__ description
This tag generates and/or checks "captcha" images to authenticate user input.
If called for the first time in a page, it generates a code/image pair and
sets the code in the &glos-session; (at $Vend::Session->{captcha}).
</para>
<para>
The captcha tag provides the following functions:
</para>
<refsect2>
<title>check</title>
<para>
Checks the captcha source code (presumably from the previous page) against
the guess. If it matches, returns 1. If not, returns 0 and puts error
in $Tag->error.
</para>
</refsect2>
<refsect2>
<title>code</title>
Returns the generated code. Generates one if not done previously in session.
</refsect2>
<para>
The image, relative_image and image_tag functions are undocumented.
__END__
