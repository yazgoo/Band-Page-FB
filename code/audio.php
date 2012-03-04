<?
require_once 'library/query/query.php';
$songs = "";
foreach(Query::getMusic() as $item)
	$songs .= "<song name=\"{$item["message"]}\" url=\"{$item["source"]}\"/>";
?>
