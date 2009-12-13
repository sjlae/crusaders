<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class News extends HTMLPage implements Page{

	private $link = '';
	private $titel = '';
	private $text = '';
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action != ''){
			$this->link = Db::getConnection();
			$this->createNews();
		}
	}
	
	private function createNews(){
		$userid = $_SESSION['userid'];
		$title = htmlentities(trim($_POST['titel']), ENT_QUOTES, 'UTF-8');
		$text = htmlentities(trim($_POST['text']), ENT_QUOTES, 'UTF-8');
		
		$query = "Insert into news(userfsid, titel, text) values('".$userid."', '".$title."', '".$text."')";
				
		mysql_query($query,$this->link);
	}
	
	public function getHTML() {
		include('layout/news.tpl');
	}
}

?>