<?
require 'facebook/facebook.php';
require_once 'library/conf.php';
$conf = Conf::getInstance("main");
Query::$facebook = new Facebook(array(
			'appId'  => $conf->get("facebook", "appId"),
			'secret' => $conf->get("facebook", "secret"),
			'cookie' => true, // enable optional cookie support
			));
Query::$pageId = $conf->get("facebook", "pageId");
class Query
{
static $facebook;
static $pageId;
static function getObject($address="", $base=null)
{
	$page = Query::$pageId;
	if($base == null) $base = "$page/";
	$uri = "/$base$address";
	return Query::$facebook->api($uri);
}
static function getEventsIds()
{
	$feedItems = Query::getObject("feed");
	$result = array();
	foreach($feedItems["data"] as $item)
	{
		$pattern = "event.php?eid=";
		$link = $item["link"];
		$pos = strpos($link, $pattern);
		if($pos)
		{
			$array = (explode($pattern, $link));
			array_push($result, $array[1]);
		}
	}
	return $result;
}
static function getMusic()
{
	$feedItems = Query::getObject("feed");
	$result = array();
	foreach($feedItems["data"] as $item)
	{
		if($item["type"] == "music")
			array_push($result, $item);
	}
	return $result;
}
static function getEvents()
{
	$result = array();
	setlocale(LC_ALL, 'fr_FR.UTF8');
	foreach(Query::getEventsIds() as $id)
	{
		$event = Query::getObject("", $id);
		$time = strtotime($event["start_time"]);
		// TODO internationalize
		$months = array("Janvier", "Fevrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre");
		$i = 0+strftime("%m", $time)-1;
		$month = $months[$i];
		array_push($result, 
				strftime("%e $month %G %HH%M", $time)." ".$event["location"]);
	}
	return $result;
}
static function getVideosIds()
{
	$feedItems = Query::getObject("feed");
	$result = array();
	foreach($feedItems["data"] as $item)
	{
		if($item["type"] == "video")
		{
			$array = (explode("v=", $item["link"]));
			array_push($result, $array[1]);
		}
	}
	return $result;
}
static function getVideos()
{
	$result = array();
	foreach(Query::getVideosIds() as $id)
	{
		$item = Query::getObject("", $id);
		$n = explode("(", $item["name"]);
		if(count($n) > 1)
		{
			$name = $n[0];
			$a = explode(")", $n[1]);
			$event = $a[0];
		}
		else $name = $item["name"];
		array_push($result, array("name" => $name,
				"event" => $event,
				"picture" => $item["picture"],
				"url" =>
				"http://www.facebook.com/v/" . $item["id"]));
	}
	return $result;
}
static function getAlbumIdByName($name)
{
	$albums = Query::getObject("albums");
	foreach($albums["data"] as $item)
		if($item["name"] == $name) return $item["id"];
	die("no $name album found");
}
static function getMembres()
{
	$membres = Query::getObject("photos", 
			Query::getAlbumIdByName("membres") . "/");
	$result = array();
	foreach($membres["data"] as $membre)
	{
		array_push($result, array($membre["tags"]["data"]["0"]["name"],
			$membre["source"]));
	}
	return $result;
}
static function getAlbumsList()
{
	$array = Query::getObject("albums");
	return $array["data"];
}
static function getAlbumTumbnails($album)
{
	$result = array();
	$array = Query::getObject("photos", $album["id"]);
	return $result;
}
static function getAlbums()
{
	$result = array();
	foreach(Query::getAlbumsList() as $album)
	{
		if($album["id"] != Query::$pageId and $album["name"] != "membres")
		{
			$subResult = array();
			$subResult["name"] = $album["name"];
			$subResult["photos"] = array();
			$array = Query::getObject("photos", $album["id"]."/");
			foreach($array["data"] as $photo)
			{
				$ophoto = array();
				$ophoto["thumbnail"] = $photo["picture"];
				$ophoto["name"] = $photo["source"];
				$ophoto["description"] = $photo["name"];
				array_push($subResult["photos"], $ophoto);
			}
			array_push($result, $subResult);
		}
	}
	return $result;
}
static function getImage($imageId)
{
}
static function getSounds()
{
}
static function getReferences()
{
}
static function getStatus()
{
}
static function getInfluences()
{
	$array = Query::getObject();
	return $array["influences"];
}
static function getBiography()
{
	$array = Query::getObject();
	return $array["bio"];
}
static function getInterests()
{
	$array = Query::getObject();
	return $array["band_interests"];
}
static function getPressContact()
{
	$array = Query::getObject();
	return $array["press_contact"];
}
static function getCurrentLocation()
{
	$array = Query::getObject();
	return $array["current_location"];
}
static function getName()
{
	$array = Query::getObject();
	return $array["name"];
}
static function getGenre()
{
	$array = Query::getObject();
	return $array["genre"];
}
}
?>
