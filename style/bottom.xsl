<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" 
doctype-public="-//W3C//DTD HTML 4.01//EN"
doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes"/>
	<xsl:template match="lang"/>
	<xsl:template match="/page/bottom">
		<div class="bottom">
			<xsl:value-of select="band"/><xsl:text> </xsl:text>-
			<xsl:apply-templates select="address"/>
			<br/>
			<xsl:value-of select="url"/>
		</div>
	</xsl:template>
	<xsl:template match="address">
			<xsl:value-of select="who"/><xsl:text> </xsl:text>
			 <xsl:value-of select="number"/><xsl:text> </xsl:text>
			, <xsl:value-of select="street"/><xsl:text> </xsl:text>
			 <xsl:value-of select="zip_code"/><xsl:text> </xsl:text>
			 <xsl:value-of select="city"/><xsl:text> </xsl:text>
			 <br/>
			 <xsl:value-of select="/page/lang/telephone_abreviation"/>: <xsl:text> </xsl:text>
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="phone_number"/>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="/page/lang/telephone_alt"/>
				</xsl:attribute>
			</img>
			<xsl:value-of select="/page/lang/fax_abreviation"/>: <xsl:text> </xsl:text>

			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="fax"/>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="/page/lang/fax_alt"/>
				</xsl:attribute>
			</img>
			 <xsl:value-of select="/page/lang/email_abreviation"/>:
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="email"/>
				</xsl:attribute>
				<xsl:attribute name="alt">
			 		<xsl:value-of select="/page/lang/email_alt"/>
				</xsl:attribute>
			</img>
	</xsl:template>
</xsl:stylesheet>
