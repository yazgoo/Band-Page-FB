<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" 
doctype-public="-//W3C//DTD HTML 4.01//EN"
doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes"/>
	<xsl:template match="membre">
		<div class="membre">
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select="@image"/>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
		</img><br/>
		<xsl:value-of select="@name"/>
		</div>
	</xsl:template>
</xsl:stylesheet>
