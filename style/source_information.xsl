<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1"  indent="yes"/>
	<xsl:template match="/page/source_information">
        <div class="source_information"> 
            <a class="source_information"
                 href="{@webpage}"><xsl:value-of select="@name"/></a>
            <xsl:text> </xsl:text>
            is developed by
            <a class="source_information"
                href="{@author_webpage}"><xsl:value-of select="@author"/></a>
            under
            <a class="source_information"
                href="{@license_url}"><xsl:value-of select="@license_name"/></a>
            license
        </div> 
    </xsl:template>
</xsl:stylesheet>
