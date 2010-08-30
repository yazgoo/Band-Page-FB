<?
function text2image($height, $text)
{
header("Content-type: image/png");
$width = $height * strlen($text)/ 5 * 2;
$font = "/usr/share/fonts/truetype/ttf-dejavu/DejaVuSans.ttf";
$image = imageCreate($width, $height);
$backgroundColor = imageColorAllocate($image, 255, 255, 255);
$textColor = imageColorAllocate($image, 0, 0, 0);
imagefttext($image, $height/2, 0, 0, $height/10*9, $textColor, $font, $text); 
imageInterlace($image, 1);
imageColorTransparent($image, $backgroundColor);
imagePNG($image);
}
?>
