<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1"  indent="yes"/>
	<xsl:template match="/page/facebook_box">
        <iframe class="facebook_box"> 
			<xsl:attribute name="allowTransparency">true</xsl:attribute>
			<xsl:attribute name="frameborder">0</xsl:attribute>
			<xsl:attribute name="scrolling">no</xsl:attribute>
			<xsl:attribute name="src">
                http://www.facebook.com/plugins/likebox.php?id=<xsl:value-of select="@pageId"/>&amp;width=292&amp;connections=10&amp;stream=false&amp;header=false&amp;
			</xsl:attribute>
        </iframe>
          
    </xsl:template>
</xsl:stylesheet>
