<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:import
		href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/chunk.xsl"/>
	
	<!-- This section here till I find out how to pick this
	information from a catalog -->

	<xsl:param name="html.stylesheet">../xmldocs.css</xsl:param>

	<xsl:param name="admon.graphics.path">../images/</xsl:param>
	<xsl:param name="navig.graphics.path">../images/</xsl:param>
	<xsl:param name="callout.graphics.path">../images/</xsl:param>

	<xsl:param name="use.id.as.filename"/>
	<xsl:param name="root.filename">index</xsl:param>
	<xsl:param name="chunk.fast">0</xsl:param>
	<xsl:param name="chunk.section.depth">1</xsl:param>
	<xsl:param name="chunker.output.encoding">ISO8859-1</xsl:param>
	<xsl:param name="chunker.output.indent">no</xsl:param>

  <xsl:template name="user.footer.content" >
  <p class='w3c'>
    <a href="http://jigsaw.w3.org/css-validator/">
      <img
        src="../images/colophon_css.png"
        alt="Valid CSS!"
        class='w3cimg'/>
    </a>
    <a href="http://validator.w3.org/check?uri=referer">
      <img
        src="../images/colophon_xhtml.png"
        alt="Valid XHTML 1.0!"
        class='w3cimg'/>
    </a>
  </p>
  </xsl:template>

	<xsl:include href="common.xsl"/>
	<xsl:include href="html-common.xsl"/>

</xsl:stylesheet>

