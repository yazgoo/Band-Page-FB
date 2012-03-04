<?
require_once 'library/query/query.php';
function line($lineFeededString)
{
	$el = "</line>"; $sl = "<line>";
	return $sl.implode("$el$sl", explode("\n", $lineFeededString)).$el;
}
function b($lineFeededString)
{
	$result = array();
	foreach(explode("\n", $lineFeededString) as $line)
	{
		$line = explode(":", $line);
		array_push($result, "<name>".$line[0]."</name><content>".$line[1]."</content>");
	}
	return implode("\n", $result);
}
$dates = "<title>Tour Trio Blues Rock SEVENTIES</title>";
$i = 0;
foreach(Query::getEvents() as $date)
{
	$dates .= "<date>$date</date>";
    $i++;
    if($i > 0) break;
}
$status = Query::getCurrentLocation();
$summup = Query::getPressContact();
$repertoire = line(b(Query::getInfluences()));
$presentation = line(Query::getBiography());
$membres = "";
$array = array_reverse(Query::getMembres());
foreach($array as $membre)
	$membres .= "<membre name=\"{$membre[0]}\" image=\"{$membre[1]}\"/>";
?>
