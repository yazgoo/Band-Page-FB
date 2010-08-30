<?
require_once 'library/query/query.php';
function line($lineFeededString)
{
	$el = "</line>"; $sl = "<line>";
	return $sl.implode("$el$sl", explode("\n", $lineFeededString)).$el;
}
$name = Query::getName();
$headline = Query::getGenre();
$presentation = line(Query::getInterests());
$membres = "";
$array = array_reverse(Query::getMembres());
foreach($array as $membre)
	$membres .= "<membre name=\"{$membre[0]}\" image=\"{$membre[1]}\"/>";
?>
