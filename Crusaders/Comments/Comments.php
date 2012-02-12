<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class Comments extends HTMLPage implements Page{

	private $comments = '';
	private $link = '';
	private $id = '';
	private $type = '';
	private $vorname = '';
	private $nachname = '';
	private $text = '';
	private $fromSingleMessage = '';
	private $teamid= '';
	
	public function __construct() {
		$this->action = isset($_GET['action']);
		$this->link = Db::getConnection();
		if($this->action == 'save'){
			$this->saveComment();
		}
	}
	
	private function saveComment(){
		$id = htmlentities(trim($_POST['id']), ENT_QUOTES, 'UTF-8');
		$this->vorname = htmlentities(trim($_POST['vorname']), ENT_QUOTES, 'UTF-8');
		$this->nachname = htmlentities(trim($_POST['nachname']), ENT_QUOTES, 'UTF-8');
		$type = htmlentities(trim($_GET['type']), ENT_QUOTES, 'UTF-8');
		$this->text = htmlentities(trim($_POST['text']), ENT_QUOTES, 'UTF-8');
		
		if(isset($_SESSION['captcha_spam']) && $_POST["sicherheitscode"] == $_SESSION['captcha_spam']){
			unset($_SESSION['captcha_spam']);
		}
		else{
			$_SESSION['errors'][] = "Der eingegebene Code ist falsch!";
			return;
		}
		
		if($this->vorname == '' || $this->nachname == '' || $this->text == ''){
			$_SESSION['errors'][] = "Bitte alle Felder (Vorname, Nachname und Kommentar) ausf&uuml;llen!";
			return;
		}
		
		$query = "Insert into comments(newsfsid, vorname, nachname, type, text) values('".$id."', '".$this->vorname."', '".$this->nachname."', '".$type."', '".$this->text."')";
		mysql_query($query,$this->link);
		
		$this->vorname = '';
		$this->nachname = '';
		$this->text = '';
	}
	
	private function getComments(){
		$this->id = isset($_GET['id']) ? $_GET['id'] : $_POST['id'];
		$this->type = isset($_GET['type']) ? $_GET['type'] : '';
		$this->fromSingleMessage = isset($_GET['fromSingleMessage']) ? $_GET['fromSingleMessage'] : '';
		
		$abfrage = "Select * from comments where newsfsid=$this->id and type=$this->type order by timestamp DESC";

		$ergebnis = mysql_query($abfrage);
		
		if($ergebnis != ''){
			$counter = 0;
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$this->comments[$counter]['vorname'] = $row['vorname'];
				$this->comments[$counter]['nachname'] = $row['nachname'];
				$this->comments[$counter]['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
				$this->comments[$counter]['text'] = $row['text'];
				
				$counter++;
			}
		}
	}
	
	public function getHTML() {
		$this->getComments();
		if($this->type == 2){
			include('layout/blogComments.tpl');
		}
		else if($this->type == 3){
			$this->teamid = $_GET['teamid']; 
			include('layout/teamComments.tpl');
		}
		else{
			include('layout/comments.tpl');
		}
	}
}

?>