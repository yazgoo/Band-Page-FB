<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" 
doctype-public="-//W3C//DTD HTML 4.01//EN"
doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes"/>
	<xsl:include href="members.xsl"/>
	<xsl:template match="/page/trio">
		<a class="name"><xsl:value-of select="name"/></a>
		<a class="headline"><xsl:value-of select="headline"/></a>
		<div class="membres">
			<xsl:apply-templates select="membres/membre"/>
		</div>
		<div class="presentation">
			<xsl:apply-templates select="presentation/line"/>
		</div>
	</xsl:template>
	<xsl:template match="line">
		<xsl:value-of select="."/>
		<br/>
	</xsl:template>
</xsl:stylesheet>
