<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1"  indent="yes"/>
	<xsl:include href="members.xsl"/>
	<xsl:template match="lang"/>
	<xsl:template match="/page/albums">
		<img id="image" style="position:absolute;z-index:3;visibility:hidden;" src="" onclick="style.visibility='hidden'" onload="loader.style.visibility='hidden';style.visibility='visible'"/>
		<xsl:apply-templates select="album"/>
	</xsl:template>
	<xsl:template match="album">
		<script language="javascript">
			var loader;
			function showImage(src)
			{
				element = document.getElementById("image");
				element.src = src;
				loader = document.getElementById(src+"-loader");
				loader.style.visibility = "visible";
			}
			var myEvent;
			function scroll()
			{
				e = myEvent;
				element = document.getElementById("<xsl:value-of select="@name"/>");
				if(!e) var e = window.event;
				if (typeof(e.pageX) != "undefined")
				{
					posx = e.pageX;
					posy = e.pageY;
				}
				else if (typeof(e.clientX) != "undefined")
				{
					posx = e.clientX + document.body.scrollLeft
						+ document.documentElement.scrollLeft;
					posy = e.clientY + document.body.scrollTop
						+ document.documentElement.scrollTop;
				}
				var x = posx - element.offsetTop;
				var y = posy - element.offsetWidth;
				var width = element.offsetWidth;
				var height = element.offsetHeight;
				px = (x - width/2) / width;
				element.scrollLeft += px * 50;
			}
			var timeoutId = 0;
			function launchScroll(e)
			{
				stopScroll()
				myEvent = e;
				timeoutId = setInterval("scroll()", 50)
			}
			function stopScroll(e)
			{
				clearInterval(timeoutId)
			}
		</script>
		<a class="albumName"><xsl:value-of select="@name"/></a>
		<div class="album">
			<xsl:attribute name="id">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
			<div class="photos">
				<xsl:apply-templates select="photo"/>
			</div>
		<script language="javascript">
			element = document.getElementById("<xsl:value-of select="@name"/>");
			element.onmouseover = launchScroll;
			if (element.captureEvents) element.captureEvents(Event.MOUSEOVER);
			element.onmouseout = stopScroll;
			if (element.captureEvents) element.captureEvents(Event.MOUSEOUT);
		</script>
		</div>
	</xsl:template>
	<xsl:template match="photo">
		<img class="photo">
			<xsl:attribute name="src">
				<xsl:value-of select="@thumbnail"/>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="@description"/>
			</xsl:attribute>
			<xsl:attribute name="onClick">
				showImage("<xsl:value-of select="@name"/>");
			</xsl:attribute>
			<xsl:attribute name="style">
				 
	-moz-transform:rotate(<xsl:value-of select="@rand"/>deg);
	-webkit-transform:rotate(<xsl:value-of select="@rand"/>deg);
	-o-transform:rotate(<xsl:value-of select="@rand"/>deg);
	-ms-transform:rotate(<xsl:value-of select="@rand"/>deg);
			</xsl:attribute>
		</img>
		<xsl:if test="@description!=''">
		<div class="caption">
		<a class="caption"><xsl:value-of select="@description"/></a>
		</div>
		</xsl:if>
		<img class="loader" src="image/ajax-loader.gif" style="">
			<xsl:attribute name="id">
				<xsl:value-of select="@name"/>-loader</xsl:attribute>
			<xsl:attribute name="style">
				 
	-moz-transform:rotate(<xsl:value-of select="@rand"/>deg);
	-webkit-transform:rotate(<xsl:value-of select="@rand"/>deg);
	-o-transform:rotate(<xsl:value-of select="@rand"/>deg);
	-ms-transform:rotate(<xsl:value-of select="@rand"/>deg);
			</xsl:attribute>
		</img>
	</xsl:template>
</xsl:stylesheet>
