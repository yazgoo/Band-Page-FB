<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" 
doctype-public="-//W3C//DTD HTML 4.01//EN"
doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes"/>
	<xsl:template match="lang"/>
	<xsl:template match="/page/top">
		<xsl:apply-templates select="banneer"/>
		<xsl:apply-templates select="email"/>
		<xsl:apply-templates select="menu"/>
	</xsl:template>
	<xsl:template match="banneer">
		<div class="banneer"></div>
	</xsl:template>
	<xsl:template match="email">
		<div class="email">
		<!-- <xsl:value-of select="@path"/> -->
		</div>
	</xsl:template>
	<xsl:template match="menu">
		<div class="menu">
			<xsl:apply-templates select="item"/>
		</div>
	</xsl:template>
	<xsl:template match="item">
		<a class="item">
			<xsl:attribute name="href">
			?id=<xsl:value-of select="@id"/>
			</xsl:attribute>
			<xsl:value-of select="."/>
		</a>
	</xsl:template>
</xsl:stylesheet>
