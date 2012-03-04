<html>
<head>
<?
require_once 'library/conf.php';
$mainConf=Conf::getInstance("main");
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=";
echo $mainConf->get("locale", "encoding")."\">"
?>
<title>band page</title>
</head>
<link rel=\"icon\" type=\"image/png\" 
		href=\"image/favicon.png\" /> 
<body>
<div class="site">
<?
require 'library/page.php';
include_once "library/cache.php";
if(isset($_GET["clear_cache"])) Cache::clear();
$pages = $mainConf->get("menu");
if(!isset($_GET["id"]) or $_GET["id"] < 0 or $_GET["id"] >= sizeof($pages))
	$id = 0;
else $id = $_GET["id"];
printPart("top");
printPart($pages[$id]);
printPart("bottom");
if($mainConf->get("additonal_modules", "music_player") == "yes"
	&& array_key_exists($id, $mainConf->get("music_player_pages")))
    printPart("musicPlayer");
foreach(array("facebook_box", "source_information") as $additionalModule)
    if($mainConf->get("additonal_modules", $additionalModule) == "yes")
        printPart("$additionalModule");
?>
</div>
</body>
</html>
