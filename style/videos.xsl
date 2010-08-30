<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" 
doctype-public="-//W3C//DTD HTML 4.01//EN"
doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes"/>
	<xsl:template match="/videos">
		<xsl:apply-templates select="video"/>
	</xsl:template>
	<xsl:template match="video">
		<div class="video">
			<!--
			<video controls="controls">
			<xsl:attribute name="src">
				<xsl:value-of select="@url"/>
			</xsl:attribute>
			-->
			<object width="320" height="240">
				<param name="allowfullscreen" value="true"/>
				<param name="allowscriptaccess" value="always"/>
				<param name="movie">
					<xsl:attribute name="value">
						<xsl:value-of select="@url"/>
					</xsl:attribute>
				</param>
				<embed allowscriptaccess="always"
				allowfullscreen="true" width="320" height="240">
					<xsl:attribute name="src">
						<xsl:value-of select="@url"/>
					</xsl:attribute>
				</embed>
			</object>
			<!--
			</video>
			-->
			<a class="videoName">
				<xsl:value-of select="@name"/>
			</a>
			<a class="event">
				<xsl:value-of select="@event"/>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
