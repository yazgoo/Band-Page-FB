<?
require_once 'library/query/query.php';
$albums = "";
foreach(Query::getAlbums() as $album)
{
    if($album["name"] == "Profile Pictures") continue;
	$albums .= "<album name=\"{$album["name"]}\">";
	foreach($album["photos"] as $photo)
	{
		$rand = rand(-10,10);
		$albums .= "<photo thumbnail=\"{$photo["thumbnail"]}\" 
		name=\"{$photo["name"]}\" description=\"{$photo["description"]}\" rand=\"{$rand}\"/>";
	}
	$albums .= "</album>";
}
?>
