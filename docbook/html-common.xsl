<?xml version='1.0'?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">

	<xsl:param name="para.propagates.style">1</xsl:param>

	<xsl:template match="searchbox">
		<xsl:element name="form">
		<xsl:attribute name="action">
			<xsl:value-of select="'http://www.icdevgroup.org/i/dev/Swish'"/>
		</xsl:attribute>
		<xsl:attribute name="method">
			<xsl:value-of select="'get'"/>
		</xsl:attribute>

		Search documentation:

			<xsl:element name="input">
				<xsl:attribute name="type">
					<xsl:value-of select="'text'"/>
				</xsl:attribute>
				<xsl:attribute name="size">
					<xsl:value-of select="'30'"/>
				</xsl:attribute>
				<xsl:attribute name="name">
					<xsl:value-of select="'mv_searchspec'"/>
				</xsl:attribute>
			</xsl:element>

			<xsl:element name="input">
				<xsl:attribute name="type">
					<xsl:value-of select="'submit'"/>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="'Go'"/>
				</xsl:attribute>
			</xsl:element>

		(<xsl:element name="input">
				<xsl:attribute name="type">
					<xsl:value-of select="'checkbox'"/>
				</xsl:attribute>
				<xsl:attribute name="name">
					<xsl:value-of select="'search_mailinglists'"/>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="'[either][value search_mailinglists][or]1[/either]'"/>
				</xsl:attribute>
			</xsl:element>
			Include mailing lists)
		<xsl:text disable-output-escaping="yes">
			&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;
		</xsl:text>
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="'http://www.icdevgroup.org/'"/>
				</xsl:attribute>
				Back to ICDEVGROUP Website
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template match="linkftr">
			Quick Links: 
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="'http://d.icdevgroup.org/'"/>
				</xsl:attribute>
				Interchange documentation
			</xsl:element> |
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="'http://www.icdevgroup.org/'"/>
				</xsl:attribute>
				ICDEVGROUP website
			</xsl:element> |
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="'http://git.icdevgroup.org/?p=interchange.git;a=summary'"/>
				</xsl:attribute>
				Interchange Git
			</xsl:element>
			(<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="'http://www.icdevgroup.org/pipermail/interchange-cvs/'"/>
				</xsl:attribute>Commits</xsl:element>) |
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="'http://git.icdevgroup.org/?p=xmldocs.git;a=summary'"/>
				</xsl:attribute>
				Documentation Git
			</xsl:element>
			(<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="'http://www.icdevgroup.org/pipermail/docs/'"/>
				</xsl:attribute>Commits</xsl:element>)
	</xsl:template>

</xsl:stylesheet>
