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
	<xsl:param name="chunker.output.encoding" select="'ISO-8859-1'" />
	<xsl:param name="chunker.output.indent">no</xsl:param>

  <xsl:template name="user.footer.content" >
  <p class='w3c'>
    <a href="http://www.docbook.org/">
      <img
        src="../images/docbook.png"
        alt="DocBook!"
        class='w3cimg'/>
    </a>
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


	<!-- Make links to glossary properly prefixed with ../ for chunked
	     docs -->
<xsl:template match="olink" name="olink">

	<xsl:call-template name="anchor"/>

	<xsl:variable name="localinfo" select="@localinfo"/>

	<xsl:variable name="targetdoc.att" select="@targetdoc"/>
	<xsl:variable name="targetptr.att" select="@targetptr"/>

	<xsl:variable name="olink.lang">
		<xsl:call-template name="l10n.language">
			<xsl:with-param name="xref-context" select="true()"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="target.database.filename">
		<xsl:call-template name="select.target.database">
			<xsl:with-param name="targetdoc.att" select="$targetdoc.att"/>
			<xsl:with-param name="targetptr.att" select="$targetptr.att"/>
			<xsl:with-param name="olink.lang" select="$olink.lang"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="target.database" select="document($target.database.filename,/)"/>

	<xsl:if test="$olink.debug != 0">
		<xsl:message>
			<xsl:text>Olink debug: root element of target.database '</xsl:text>
			<xsl:value-of select="$target.database.filename"/>
			<xsl:text>' is '</xsl:text>
			<xsl:value-of select="local-name($target.database/*[1])"/>
			<xsl:text>'.</xsl:text>
		</xsl:message>
	</xsl:if>

	<xsl:variable name="olink.key">
		<xsl:call-template name="select.olink.key">
			<xsl:with-param name="targetdoc.att" select="$targetdoc.att"/>
			<xsl:with-param name="targetptr.att" select="$targetptr.att"/>
			<xsl:with-param name="olink.lang" select="$olink.lang"/>
			<xsl:with-param name="target.database" select="$target.database"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:if test="string-length($olink.key) = 0">
		<xsl:message>
			<xsl:text>Error: unresolved olink: </xsl:text>
			<xsl:text>targetdoc/targetptr = '</xsl:text>
			<xsl:value-of select="$targetdoc.att"/>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="$targetptr.att"/>
			<xsl:text>'.</xsl:text>
		</xsl:message>
	</xsl:if>

	<xsl:variable name="href">
		<xsl:if test="starts-with(@targetdoc, 'glossary')">../</xsl:if>
		<xsl:call-template name="make.olink.href">
			<xsl:with-param name="olink.key" select="$olink.key"/>
			<xsl:with-param name="target.database" select="$target.database"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="hottext">
		<xsl:call-template name="olink.hottext">
			<xsl:with-param name="target.database" select="$target.database"/>
			<xsl:with-param name="olink.key" select="$olink.key"/>
			<xsl:with-param name="olink.lang" select="$olink.lang"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="olink.docname.citation">
		<xsl:call-template name="olink.document.citation">
			<xsl:with-param name="olink.key" select="$olink.key"/>
			<xsl:with-param name="target.database" select="$target.database"/>
			<xsl:with-param name="olink.lang" select="$olink.lang"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="olink.page.citation">
		<xsl:call-template name="olink.page.citation">
			<xsl:with-param name="olink.key" select="$olink.key"/>
			<xsl:with-param name="target.database" select="$target.database"/>
			<xsl:with-param name="olink.lang" select="$olink.lang"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:choose>
		<xsl:when test="$href != ''">
			<a href="{$href}" class="olink">
			<xsl:copy-of select="$hottext"/>
			</a>
			<xsl:copy-of select="$olink.page.citation"/>
			<xsl:copy-of select="$olink.docname.citation"/>
		</xsl:when>
		<xsl:otherwise>
			<span class="olink"><xsl:copy-of select="$hottext"/></span>
			<xsl:copy-of select="$olink.page.citation"/>
			<xsl:copy-of select="$olink.docname.citation"/>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


	
	<!-- This chunk inserts <meta name="area" content="REFENTRY_GROUP" />,
	     to help Swish index documentation properly. Thanks Scott Hudson. -->
	<xsl:template match="refclass[1]">
		<xsl:variable name="area">
		<xsl:value-of select="." />
		</xsl:variable>

		<xsl:text disable-output-escaping="yes">&lt;meta name="area" content="</xsl:text>
		<xsl:value-of select="$area" />
		<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
	</xsl:template>



	<!-- This chunk inserts <meta name="purpose" content="PURPOSE_LINE" />,
	     to help Swish index documentation properly. -->
	<xsl:template match="refpurpose[1]">
		<xsl:text> </xsl:text>
		<xsl:call-template name="dingbat">
			<xsl:with-param name="dingbat">em-dash</xsl:with-param>
		</xsl:call-template> 
		<xsl:text> </xsl:text>
		<xsl:apply-templates/>

		<xsl:variable name="purpose">
		<xsl:value-of select="." />
		</xsl:variable>

		<xsl:text disable-output-escaping="yes">&lt;meta name="purpose" content="</xsl:text>
		<xsl:value-of select="$purpose" />
		<xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>
	</xsl:template>

	<xsl:include href="common.xsl"/>
	<xsl:include href="html-common.xsl"/>

</xsl:stylesheet>

