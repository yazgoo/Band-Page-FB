<?
require_once 'library/query/query.php';
require_once 'library/conf.php';
$name = Query::getName();
$conf = Conf::getInstance("private");
$userName = $conf->get("contact", "name");
$number = $conf->get("address", "number");
$street = $conf->get("address", "street");
$zip_code = $conf->get("address", "zip_code");
$city = $conf->get("address", "city");
$website = $conf->get("contact", "website");
?>
