<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1"  indent="yes"/>
	<xsl:template match="/page/lang"/>
	<xsl:template match="/page/devis">
			<xsl:apply-templates select="text"/>
			<xsl:apply-templates select="contact"/>
			<xsl:apply-templates select="result"/>
			<xsl:apply-templates select="email-form"/>
	</xsl:template>
	<xsl:template match="result">
		<xsl:if test=". != ''">
			<div class="result">
				<xsl:value-of select="."/>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="text">
			<div class="text">
				<xsl:value-of select="."/>
			</div>
	</xsl:template>
	<xsl:template match="contact">
			<div class="contact">
				<xsl:value-of select="name"/>
				<xsl:text> </xsl:text>
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="phones/mobile"/>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="/page/lang/mobile_phone_alt"/>
				</xsl:attribute>
			</img>
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="phones/basic"/>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="/page/lang/basic_phone_alt"/>
				</xsl:attribute>
			</img>
			</div>
	</xsl:template>
	<xsl:template match="email-form">
		<div class="form">
			<form method="POST" action="">
			<xsl:apply-templates select="field"/>
			<div class="controls">
			<input type="button" value="Effacer"/>
			<input type="submit" value="Envoyer"/>
			</div>
			</form>
		</div>
	</xsl:template>
	<xsl:template match="field">
		<div class="field">
		<a class="fieldName"><xsl:value-of select="@name"/></a>
	<xsl:if test="not(@type)">
		<input class="fieldText">
			<xsl:attribute name="name">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="@value"/>
			</xsl:attribute>
		</input>
	</xsl:if>
	<xsl:if test="@type = 'multi-line'">
		<textarea class="fieldMultiLine">
		<xsl:value-of select="@value"/>
		</textarea>
	</xsl:if>
		</div>
	</xsl:template>
</xsl:stylesheet>
