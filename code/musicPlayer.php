<?
require_once 'code/audio.php';
$config= "";
foreach(Conf::getInstance("main")->get("music_player_options") as $name=>$value)
	$config.= "<parameter name=\"$name\" value=\"$value\"/>";
?>

