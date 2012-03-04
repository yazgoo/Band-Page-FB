<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" 
doctype-public="-//W3C//DTD HTML 4.01//EN"
doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes"/>
	<xsl:template match="lang"/>
	<xsl:template match="/page/musicPlayer">
        <script type="text/javascript" src="js/musicPlayer.js"/>
        <script type="text/javascript">setUpMusicPlayerParameters();</script>
        <div id="musicPlayer">
		<object type="application/x-shockwave-flash"
            data="http://flash-mp3-player.net/medias/player_mp3_multi.swf"
            id="musicPlayerObject">
			<xsl:attribute name="width">
				<xsl:value-of select="config/parameter[@name='width']/@value"/>
			</xsl:attribute>
			<xsl:attribute name="height">
				<xsl:value-of select="config/parameter[@name='height']/@value"/>
			</xsl:attribute>
			<param name="movie" value="http://flash-mp3-player.net/medias/player_mp3_multi.swf" />
				    <param name="FlashVars" id="flashVars">
					    <xsl:attribute name="value">mp3=<xsl:apply-templates select="songs/song" mode="url"/>&amp;title=<xsl:apply-templates select="songs/song" mode="name"/>&amp;<xsl:apply-templates select="config/parameter"/></xsl:attribute>
				</param>
                <script type="text/javascript">
                    setUpMusicPlayer();
                </script>
			</object>
		</div>
	</xsl:template>
	<xsl:template match="song" mode="url"><xsl:value-of select="@url"/>|</xsl:template>
	<xsl:template match="song" mode="name"><xsl:value-of select="@name"/>|</xsl:template>
	<xsl:template match="parameter"><xsl:value-of select="@name"/>=<xsl:value-of select="@value"/>&amp;</xsl:template>
</xsl:stylesheet>
