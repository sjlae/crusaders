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
		$this->titel = htmlentities(trim($_POST['titel']), ENT_QUOTES, 'UTF-8');
		$this->text = nl2br(htmlentities(trim($_POST['text']), ENT_QUOTES, 'UTF-8'));
		
		if($this->titel == '' || $this->text == ''){
			$_SESSION['errors'][] = "Bitte alle Felder (Titel und Text) ausf&uuml;llen!";
			return;
		}
		
		$query = "Insert into news(userfsid, titel, text) values('".$userid."', '".$this->titel."', '".$this->text."')";
				
		mysql_query($query,$this->link);
		
		$this->titel = '';
		$this->text = '';
		$_SESSION['infos'][] = "Die Nachricht wurde erfolgreich erfasst";
	}
	
	public function getHTML() {
		include('layout/news.tpl');
	}
}

?>