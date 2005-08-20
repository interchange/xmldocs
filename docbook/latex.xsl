<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

	<xsl:import href="http://db2latex.sourceforge.net/xsl/docbook.xsl" />

	<!-- <xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/chunk.xsl"/> -->
	
	<!-- This section here till I find out how to pick this
	information from a catalog -->

	<xsl:param name="html.stylesheet">../xmldocs.css</xsl:param>

	<xsl:param name="ulink.show">0</xsl:param>
	<xsl:param name="ulink.footnotes">0</xsl:param>

	<!-- are those used with fo ? -->
	<xsl:param name="admon.graphics.path">../images/</xsl:param>
	<xsl:param name="navig.graphics.path">../images/</xsl:param>
	<xsl:param name="callout.graphics.path">../images/</xsl:param>

	<xsl:param name="use.id.as.filename"/>
	<xsl:param name="root.filename">index</xsl:param>

	<xsl:include href="common.xsl"/>

	<!--
	<xsl:attribute-set name="monospace.properties">
	  <xsl:attribute name="font-stretch">semi-condensed</xsl:attribute>
		</xsl:attribute-set>
		-->

</xsl:stylesheet>

