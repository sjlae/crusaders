<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class Video extends HTMLPage implements Page{
	
	private $link = '';
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action != ''){
			$this->link = Db::getConnection();
			$this->saveVideo();
		}
	}
	
	public function saveVideo(){
		$url = $_POST['url'];
		$abfrage = "Update video set url='".$url."'";
		mysql_query($abfrage,$this->link);
	}
	
	public function getHTML() {
		include('layout/video.tpl');
	}
}

?>