<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1"  indent="yes"/>
	<xsl:template match="lang"/>
	<xsl:include href="members.xsl"/>
	<xsl:template match="/page/acceuil">
			<xsl:apply-templates select="lang"/>
		<div class="summup">
			<xsl:value-of select="summup"/>
		</div>
		<div class="status">
			<xsl:value-of select="status"/>
		</div>
		<div class="dates">
			<xsl:apply-templates select="dates"/>
		</div>
		<div class="membres">
			<xsl:apply-templates select="membres/membre"/>
		</div>
		<div class="repertoire">
			<a class="repertoireTitle"><xsl:value-of select="/page/lang/songs_played"/></a><br/>
			<xsl:apply-templates select="repertoire/line"/>
		</div>
		<div class="presentation">
			<xsl:apply-templates select="presentation/line"/>
		</div>
	</xsl:template>
	<xsl:template match="dates">
			<div class="datesTitle">
				<xsl:value-of select="title"/>
			</div>
			<xsl:apply-templates select="date"/>
	</xsl:template>
	<xsl:template match="date">
		<xsl:value-of select="."/><br/>
	</xsl:template>
	<xsl:template match="line">
		<xsl:if test="name != ''"><b><xsl:value-of select="name"/></b>:</xsl:if>
		<xsl:if test="content != ''"><xsl:value-of select="content"/></xsl:if>
		<xsl:if test="not(content)"><xsl:value-of select="."/></xsl:if>
		<br/>
	</xsl:template>
</xsl:stylesheet>
