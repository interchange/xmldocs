<?xml version='1.0'?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xi="http://www.w3.org/2003/XInclude"
	version="1.0">

	<xsl:output encoding="ISO-8859-1"/>

	<xsl:param name="section.autolabel">0</xsl:param>

	<xsl:param name="admon.graphics">1</xsl:param>
	<xsl:param name="admon.graphics.path">./images/</xsl:param>

	<xsl:param name="navig.graphics">1</xsl:param>
	<xsl:param name="navig.graphics.path">./images/</xsl:param>
	<xsl:param name="navig.showtitles">1</xsl:param>

	<xsl:param name="callout.graphics">1</xsl:param>
	<xsl:param name="callout.graphics.path">./images/</xsl:param>

	<xsl:param name="glossary.auto.link">0</xsl:param>
	<xsl:param name="glossterm.auto.link">0</xsl:param>
	<xsl:param name="glossentry.show.acronym">yes</xsl:param>
	<xsl:param name="glossary.as.blocks">yes</xsl:param>

	<xsl:param name="use.extensions">0</xsl:param>
	<xsl:param name="textinsert.extension">1</xsl:param>

	<!--
		Define which document types get which ToC elements generated.
		We only use article and reference doctypes in xmldocs.
		Book.
	-->
	<xsl:param name="generate.toc">
		article    toc,title,figure,table,example,equation
		reference  toc,title,example
		book       nop
		glossary   toc,title
		qandaset   toc
	</xsl:param>

	  <xsl:template match="mv"><xsl:call-template name="inline.monoseq"/></xsl:template>
		<xsl:template match="am"><xsl:call-template name="inline.monoseq"/></xsl:template>



  <xsl:param name="local.l10n.xml" select="document('')"/>
  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l:l10n language="en">
      <l:context name="title">
        <l:template name="example" text="Example: %t"/>
      </l:context>
      <l:context name="title">
        <l:template name="figure" text="Source: %t"/>
      </l:context>
    </l:l10n>
  </l:i18n>

</xsl:stylesheet>

