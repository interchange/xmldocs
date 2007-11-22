<?xml version='1.0'?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	xmlns:xi="http://www.w3.org/2003/XInclude"
	version="1.0">

	<xsl:import
		href="/usr/share/xml/docbook/stylesheet/nwalsh/manpages/docbook.xsl"/>

	<xsl:param name="man.output.quietly">1</xsl:param>
	<xsl:param name="man.charmap.enabled">0</xsl:param>

<!--
	<xsl:template match="sbr">
		<xsl:element name="br"/>
	</xsl:template>
-->

	<xsl:template match="tag">
		<code class='tag'>[<xsl:value-of select="."/>]</code>
	</xsl:template>
	<xsl:template match="option">
		<code class='option'><xsl:value-of select="."/></code>
	</xsl:template>
	<xsl:template match="varname">
		<code class='varname'><xsl:value-of select="."/></code>
	</xsl:template>
	<xsl:template match="check">
		<code class='check'><xsl:value-of select="."/></code>
	</xsl:template>
	<xsl:template match="widget">
		<code class='widget'><xsl:value-of select="."/></code>
	</xsl:template>
	<xsl:template match="pragma">
		<code class='pragma'><xsl:value-of select="."/></code>
	</xsl:template>
	<xsl:template match="filter">
		<code class='filter'><xsl:value-of select="."/></code>
	</xsl:template>

	<xsl:include href="common.xsl"/>
	
</xsl:stylesheet>

