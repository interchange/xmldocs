<?xml version='1.0'?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xi="http://www.w3.org/2003/XInclude"
	version="1.0">

	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml/docbook.xsl"/>
	<!--<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/docbook.xsl"/>-->

	<!-- till we use catalog for this -->
  <xsl:template name="user.footer.content" >
  <p class='w3c'>
    <a href="http://www.docbook.org/">
      <img
        src="images/docbook.png"
        alt="DocBook!"
        class='w3cimg'/>
    </a>
    <a href="http://www.icdevgroup.org">
      <img
        src="images/bb_interchange.png"
        alt="Interchange!"
        class='w3cimg'/>
    </a>
  </p>
  </xsl:template>
	
	<xsl:param name="html.stylesheet">xmldocs.css</xsl:param>
	<xsl:param name="refclass.suppress">1</xsl:param>
	
	<xsl:include href="common.xsl"/>
	<xsl:include href="html-common.xsl"/>

</xsl:stylesheet>

