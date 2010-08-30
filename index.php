<html>
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">
<title>band</title>
</head>
<link rel=\"icon\" type=\"image/png\" 
		href=\"image/favicon.png\" /> 
<body>
<?
require_once 'library/conf.php';
$mainConf=Conf::getInstance("main");
if($mainConf->get("additonal_modules", "facebook_box") == "yes")
	echo '<iframe src="http://www.facebook.com/plugins/likebox.php?id='.$mainConf->get("facebook", "pageId").'&amp;width=292&amp;connections=10&amp;stream=false&amp;header=false&amp;" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px;position: fixed;right : 0; bottom: 10px" allowTransparency="true"></iframe>';
?>
<div style='margin:0 auto;width: 850px;'>
<?
require 'library/page.php';
include_once "library/cache.php";
if(isset($_GET["clear_cache"])) Cache::clear();
printPart("top");
$pages = $mainConf->get("menu");//array("acceuil", "trio", "album", "audio", "videos", "devis");
if(!isset($_GET["id"]) or $_GET["id"] < 0 or $_GET["id"] >= sizeof($pages))
$id = 0;
else $id = $_GET["id"];
printPart($pages[$id]);
printPart("bottom");
?>
</div>
</body>
</html>
