<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class Video extends HTMLPage implements Page{
	
	private $link = '';
	private $url = '';
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action != ''){
			$this->link = Db::getConnection();
			$this->saveVideo();
		}
	}
	
	public function saveVideo(){
		$this->checkvideo();
		$abfrage = "Update video set url='".htmlspecialchars_decode($this->url, ENT_NOQUOTES)."'";
		mysql_query($abfrage,$this->link);
	}
	
	private function checkvideo()
	{
		$newUrl = htmlspecialchars($_POST["url"], ENT_NOQUOTES);
		
		preg_match('/width=\\\"([0-9]*)/i', $newUrl, $width);
		preg_match('/height=\\\"([0-9]*)/i', $newUrl, $height);
		
	    $newUrl = str_replace($width[1], "345", $newUrl);
	    $newUrl = str_replace($height[1], "275", $newUrl);
	    
	    $this->url = $newUrl;
	}
	
	public function getHTML() {
		include('layout/video.tpl');
	}
}

?>