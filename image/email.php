<?
chdir("..");
require_once 'library/conf.php';
require_once 'library/text2image.php';
$conf = Conf::getInstance("private");
text2image(16, $conf->get("contact", "email"));
?>
