<?
class Cache 
{
	static $root = "cache/";
	static $index = "cache/index";
	static function getModificationTime($id)
	{
		$id .= "\n";
		if(!file_exists(Cache::$index)) touch(Cache::$index);
		$file_array = file(Cache::$index);
		foreach($file_array as $line_number=>$line)
			if($line == $id)
				return(filemtime(Cache::$root . $line_number));
		return 0;
	}
	static function get($id)
	{
		$id .= "\n";
		if(!file_exists(Cache::$index)) touch(Cache::$index);
		$file_array = file(Cache::$index);
		foreach($file_array as $line_number=>$line)
			if($line == $id)
				return file_get_contents(Cache::$root . $line_number);
		return null;
	}
	static function set($id, $content)
	{
		$id .= "\n";
		if(!file_exists(Cache::$index)) touch(Cache::$index);
		$file_array = file(Cache::$index);
		$line_number = -1;
		foreach($file_array as $line_number=>$line)
			if($line == $id)
				return file_put_contents(Cache::$root . $line_number, $content);
		$f = fopen(Cache::$index, 'a');
		fwrite($f, $id);
		fclose($f);
		return file_put_contents(Cache::$root . ++$line_number, $content);
	}
	static function clear()
	{
		$dir = opendir(Cache::$root);
		while (false !== ($file = readdir($dir)))
			if($file != "." and $file != "..")
			        unlink(Cache::$root . $file);
	}
}
?>
