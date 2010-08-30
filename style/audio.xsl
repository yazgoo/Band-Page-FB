<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" 
doctype-public="-//W3C//DTD HTML 4.01//EN"
doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes"/>
	<xsl:template match="lang"/>
	<xsl:template match="/page/audio">
		<xsl:apply-templates select="song"/>
	</xsl:template>
	<xsl:template match="song">
		<div class="song">
			<div class="player">
				<object type="application/x-shockwave-flash" data="http://flash-mp3-player.net/medias/player_mp3_maxi.swf" width="200" height="20">

				    <param name="movie" value="http://flash-mp3-player.net/medias/player_mp3_maxi.swf" />

				    <param name="bgcolor" value="#ffffff" />

				    <param name="FlashVars">
				<xsl:attribute name="value">mp3=<xsl:value-of select="@url"/> </xsl:attribute>
				</param>
				</object>
			</div>
			<a class="songName">
				<xsl:value-of select="@name"/>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
