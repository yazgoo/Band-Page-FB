<?
include_once "ini.php";
class Lang extends Ini
{
	var $root = "lang/";
	var $suffix = ".lang";
	static $instances = array();
	static function getInstance($name)
	{
		if(Lang::$instances[$name] == null) 
			Lang::$instances[$name] = new Lang($name);
		return Lang::$instances[$name];
	}
}
?>

