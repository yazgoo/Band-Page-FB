<?
include_once "ini.php";
class Conf extends Ini
{
	var $root = "etc/";
	var $suffix = ".conf";
	static $instances = array();
	static function getInstance($name)
	{
		if(Conf::$instances[$name] == null) 
			Conf::$instances[$name] = new Conf($name);
		return Conf::$instances[$name];
	}
}
?>
