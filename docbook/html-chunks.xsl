<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:import
		href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/chunk.xsl"/>

	<xsl:include href="common.xsl"/>
	<xsl:include href="html-common.xsl"/>

	<xsl:param name="use.id.as.filename"/>
	<xsl:param name="root.filename">index</xsl:param>
	<xsl:param name="base.dir">iccattut/</xsl:param>
	<xsl:param name="chunk.fast">1</xsl:param>
	<xsl:param name="chunk.section.depth">1</xsl:param>
	<xsl:param name="chunker.output.encoding">ISO8859-1</xsl:param>
	<xsl:param name="chunker.output.indent">yes</xsl:param>

</xsl:stylesheet>

