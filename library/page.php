<?
require_once 'library/conf.php';
require_once 'library/lang.php';
function getLangXml($partName)
{
	$xml = "<lang>";
	$lang = Lang::getInstance(Conf::getInstance("main")->get("locale", "lang"))
			->get($partName);
	if($lang != null) foreach($lang as $key=>$value) $xml .= "<$key>$value</$key>";
	$xml .= "</lang>";
	return $xml;
}
function printPart($partName)
{
	$styleDecoration = Conf::getInstance("main")->get("style", "decoration");
	include "code/$partName.php";
	print "<link rel=\"stylesheet\" ";
	print "type=\"text/css\" href=\"decoration/$styleDecoration/$partName.css\"/>\n";
	eval('$part="'.(addslashes(file_get_contents("template/$partName.xml"))).'";');
	$part = "<page>".getLangXml($partName)."$part</page>";
	$xsltPath = "style/$partName.xsl";
	if(class_exists('XSLTProcessor'))
	{
		$xslt = new XSLTProcessor();
		$xslt->importStyleSheet(DomDocument::load($xsltPath));
		print $xslt->transformToXML(DomDocument::loadXML($part));
	}
	else if(function_exists('xslt_create'))
	{


		$arguments = array(
				'/_xml' => $part,
				'/_xsl' => file_get_contents($xsltPath));
		$x = xslt_create();
		print xslt_process($x,  'arg:/_xml', 'arg:/_xsl', NULL, $arguments);
		xslt_free($x);
	}
	else
	{
		// overkill unsafe 
		system("xsltproc $xsltPath - 2>&1 <<END
$part
END");
	}
}
?>
