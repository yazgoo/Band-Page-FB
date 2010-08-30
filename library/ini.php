<?
class Ini
{
	function load($name)
	{
		$f = fopen($this->root . $name . $this->suffix, "r");
		$contents = array();
		$comments = array();
		$sectionName = "default";
		$contents[$sectionName] = array();
		$l = -1;
		while (!feof($f))
		{
			$l++;
			$line = fgets($f);
			if(strlen($line) <= 0) continue;
			$line = ltrim($line);
			$line = substr($line, 0, strpos($line, "\n"));
			if($line[0] == '[') 
			{
				$sectionName = substr($line, 1, strpos($line, ']') - 1);
				$contents[$sectionName] = array();
			}
			else if($line[0] == '#') $comments[$l] = $line;
			else
			{
				$equal = strpos($line, "=");
				$contents[$sectionName][substr($line, 0, $equal)] = substr($line, $equal+1);
			}
		}
		fclose($f);
		return array($contents, $comments);
	}
	protected function Ini($name)
	{
		$this->fileName = $name;
		$result = $this->load($name);
		$this->contents = $result[0];
		$this->comments = $result[1];
	}
	function get($section, $variable=null)
	{
		if($variable != null)
			return $this->contents[$section][$variable];
		else return $this->contents[$section];
	}
	function set($section, $variable, $value)
	{
		$this->contents[$section][$variable] = $value;
	}
	function save()
	{
		$f = fopen($this->root . $this->fileName . $this->suffix, "w");
		$l = 0;
		foreach($this->contents as $sectionName=>$section)
		{
			if($this->comments[$l] != null) 
				fwrite($f, $comments[$l++]."\n");
			fwrite($f, "[". $sectionName ."]"."\n");
			$l++;
			foreach($section as $name=>$value)
			{
				if($this->comments[$l] != null) 
					fwrite($f, $comments[$l++]."\n");
				fwrite($f, $name . "=" . $value ."\n");
				$l++;
			}
		}
		fclose($f);
	}
	function getHtmlForm()
	{
	}
	static function htmlFormIsSent()
	{
	}
	static function saveHtmlResults()
	{
	}

}
?>
