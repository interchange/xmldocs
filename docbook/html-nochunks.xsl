<?xml version='1.0'?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xi="http://www.w3.org/2003/XInclude"
	version="1.0">

	<xsl:import
		href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/docbook.xsl"/>
	
	<xsl:include href="common.xsl"/>
	<xsl:include href="html-common.xsl"/>
	
	<xsl:param name="html.stylesheet">xmldocs.css</xsl:param>

	<!-- till we use catalog for this -->
  <xsl:template name="user.footer.content" >
  <p class='w3c'>
    <a href="http://jigsaw.w3.org/css-validator/">
      <img
        src="images/colophon_css.png"
        alt="Valid CSS!"
        class='w3cimg'/>
    </a>
    <a href="http://validator.w3.org/check?uri=referer">
      <img
        src="images/colophon_xhtml.png"
        alt="Valid XHTML 1.0!"
        class='w3cimg'/>
    </a>
  </p>
  </xsl:template>

</xsl:stylesheet>

