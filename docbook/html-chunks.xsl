<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml/chunk.xsl"/>
	<!-- <xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/chunk.xsl"/> -->
	
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
    <a href="http://www.icdevgroup.org/">
      <img
        src="../images/bb_interchange.png"
        alt="Interchange!"
        class='w3cimg'/>
    </a>
  </p>
  </xsl:template>

	<xsl:include href="common.xsl"/>
	<xsl:include href="html-common.xsl"/>

	<!-- Norman Walsh gave me a nice idea and code. Since chunked documents
		need ../ prefix in relative links, add it with XSL. And boy, here's 
		the winner! ;-) -->
	<xsl:template match="ulink" name="ulink">
		<xsl:variable name="link">
			<a>
				<xsl:if test="@id">
					<xsl:attribute name="name">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="href">
		<xsl:if test="starts-with(@url, 'files/')">../</xsl:if>
		<xsl:value-of select="@url"/>
				</xsl:attribute>
				<xsl:if test="$ulink.target != ''">
					<xsl:attribute name="target">
						<xsl:value-of select="$ulink.target"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="count(child::node())=0">
						<xsl:value-of select="@url"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</a>
		</xsl:variable>
		<!--
		<xsl:choose>
			<xsl:when test="function-available('suwl:unwrapLinks')">
				<xsl:copy-of select="suwl:unwrapLinks($link)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="$link"/>
			</xsl:otherwise>
		</xsl:choose>
		-->
		<xsl:copy-of select="$link"/>
	</xsl:template>

</xsl:stylesheet>

