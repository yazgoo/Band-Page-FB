<?
require_once 'library/conf.php';
$conf = Conf::getInstance("private");
$text = "Remplissez ce simple formulaire et envoyez le nous par mail, ou si vous preferez, appelez-moi directement. A bientôt en vous remerciant";
$name = $conf->get("contact", "name");
$mobilePhone = "image/mobile_phone.php";
$basicPhone = "image/phone.php";
if(isset($_POST["Etablissement"]))
{
	$to = $conf->get("contact", "email");
	$title="[site web] demande de devis";
	$mailContent = "";
	foreach($_POST as $key=>$value)
		$mailContent .= $key .  ":\n\t" . $value . "\n";
	if(!mail($to, $title, $mailContent))
		$result = "erreur d'envoi.";
	else
		$result = "Courriel envoyè, merci";
}
?>
