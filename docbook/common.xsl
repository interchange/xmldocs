<?xml version='1.0'?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xi="http://www.w3.org/2003/XInclude"
	version="1.0">

	<xsl:param name="section.autolabel">0</xsl:param>

	<xsl:param name="admon.graphics">1</xsl:param>
	<xsl:param name="admon.graphics.path">./images/</xsl:param>

	<xsl:param name="navig.graphics">1</xsl:param>
	<xsl:param name="navig.graphics.path">./images/</xsl:param>
	<xsl:param name="navig.showtitles">1</xsl:param>

	<xsl:param name="callout.graphics">1</xsl:param>
	<xsl:param name="callout.graphics.path">./images/</xsl:param>

	<xsl:param name="use.extensions">1</xsl:param>
	<xsl:param name="textinsert.extension">1</xsl:param>

	<xsl:template match="tag">[<xsl:call-template name="inline.monoseq"/>]</xsl:template>
	<xsl:template match="pragma"><xsl:call-template name="inline.monoseq"/></xsl:template>

  <xsl:param name="local.l10n.xml" select="document('')"/>
  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l:l10n language="en">
      <l:context name="title">
        <l:template name="example" text="%t"/>
      </l:context>
    </l:l10n>
  </l:i18n>

</xsl:stylesheet>

