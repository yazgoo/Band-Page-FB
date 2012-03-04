function getStyle(oElm, strCssRule)
{
    var strValue = ""
    if(document.defaultView && document.defaultView.getComputedStyle)
            strValue = document.defaultView.getComputedStyle(oElm, null)
                .getPropertyValue(strCssRule)
    else if(oElm.currentStyle)
    {
        strCssRule = strCssRule.replace(/\-(\w)/g, function (strMatch, p1)
                { return p1.toUpperCase(); })
        strValue = oElm.currentStyle[strCssRule]
    }
    return strValue
}
function colorToHex(color)
{
    if (color.substr(0, 1) === '#') return color
    var digits = /(.*?)rgb\((\d+), (\d+), (\d+)\)/.exec(color)
    var red = parseInt(digits[2])
    var green = parseInt(digits[3])
    var blue = parseInt(digits[4])
    var rgb = blue | (green << 8) | (red << 16)
    result = digits[1] + rgb.toString(16)
    while(result.length < 6) result = "0" + result
    return result
}
function removePx(str) { return str.split("px")[0]; }
function addFlashVar(name, value)
{
    document.getElementById("flashVars").value += name + "=" + value
}
function addFlashVarFromStyle(name, objectId, styleProperty, f)
{
    addFlashVar(name, f(getStyle(document.getElementById("musicPlayer"
                        + objectId), styleProperty)) + "&")
}
function setUpMusicPlayer()
{
    var confs = [
        ["bgcolor", "", "background-color", colorToHex],
        ["textcolor", "", "color", colorToHex],
        ["playlistcolor", "Playlist", "background-color", colorToHex],
        ["currentmp3color", "Playlist", "color", colorToHex],
        ["bgcolor1", "BackgroundGradient", "background-color", colorToHex],
        ["bgcolor2", "BackgroundGradient", "color", colorToHex],
        ["buttoncolor", "Button", "background-color", colorToHex],
        ["buttonovercolor", "Button", "color", colorToHex],
        ["slidercolor1", "Slider", "background-color", colorToHex],
        ["sliderovercolor", "SliderHover", "color", colorToHex],
        ["scrollbarcolor", "ScrollBar", "background-color", colorToHex],
        ["scrollbarovercolor", "ScrollBar", "color", colorToHex],
        ["slidercolor2", "Slider", "color", colorToHex]]
    for(var i in confs)
        addFlashVarFromStyle(confs[i][0], confs[i][1], confs[i][2], confs[i][3])
    var musicPlayer = document.getElementById("musicPlayerDimension")
    addFlashVar("height", musicPlayer.offsetHeight)
    addFlashVar("width", musicPlayer.offsetWidth)
    object = document.getElementById("musicPlayerObject")
    object.width = musicPlayer.offsetWidth
    object.height = musicPlayer.offsetHeight
}
function setUpMusicPlayerParameters()
{
    var str = "<div>"
    names = ["Button", "Dimension", "Slider", "SliderHover",
          "BackgroundGradient", "Playlist", "ScrollBar"]
    for(var i in names)
        str += "<div id=\"musicPlayer" + names[i] + "\"/>"
    str += "</div>"
    document.write(str);
}
