<?xml version='1.0'?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">

	<xsl:param name="html.stylesheet">xmldocs.css</xsl:param>
	<xsl:param name="para.propagates.style">1</xsl:param>

	<!-- <xsl:param name="glossary.auto.link">1</xsl:param> -->

	<xsl:template name="user.footer.content" >
	<p class='w3c'>
		<a href="http://jigsaw.w3.org/css-validator/">
			<img
				src="images/valid-css.png"
				alt="Valid CSS!"
				class='w3cimg'/>
		</a>
		<a href="http://validator.w3.org/check?uri=referer">
			<img
				src="images/valid-xhtml10.png"
				alt="Valid XHTML 1.0!" height="31" width="88"
				class='w3cimg'/>
		</a>
	</p>
	</xsl:template>

</xsl:stylesheet>

