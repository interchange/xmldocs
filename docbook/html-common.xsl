<?xml version='1.0'?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">

	<xsl:param name="para.propagates.style">1</xsl:param>

	<!-- <xsl:param name="glossary.auto.link">1</xsl:param> -->

	<xsl:param name="local.l10n.xml" select="document('')"/> 
	<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"> 
		<l:l10n language="en"> 
			<l:context name="title"> 
				<l:template name="example" text="%t"/> 
			</l:context>    
		</l:l10n>
	</l:i18n>

</xsl:stylesheet>

