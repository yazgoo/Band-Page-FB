<?
require_once 'library/conf.php';
$menuItems="";
foreach(Conf::getInstance("main")->get("menu_names") as $id=>$name)
	$menuItems .= "<item id=\"$id\">$name</item>";
?>
