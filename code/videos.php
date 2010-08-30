
<?
require_once 'library/query/query.php';
$vids = Query::getVideos();
$videos = "";
foreach($vids as $vid)
	$videos .= "<video event=\"{$vid["event"]}\" name=\"{$vid["name"]}\" url=\"{$vid["url"]}\" picture=\"{$vid["picture"]}\"/>"
?>
