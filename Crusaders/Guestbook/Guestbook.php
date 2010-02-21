<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class Guestbook extends HTMLPage implements Page{
 
	private $link = '';
	private $entries = array();
	private $vorname = '';
	private $nachname = '';
	private $text = '';
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : $this->action;
		$this->link = Db::getConnection();
		if($action == 'save'){
			$this->saveEntry();
		}
	}
	
	private function saveEntry(){
		$this->vorname = $_POST['vorname'];
		$this->nachname = $_POST['nachname'];
		$this->text = $_POST['text'];
		
		if($this->vorname == '' || $this->nachname == '' || $this->text == ''){
			$_SESSION['errors'][] = "Bitte alle Felder (Vorname, Nachname und Kommentar) ausf&uuml;llen!";
			return;
		}
		
		if($this->text != null){
			$this->text = htmlentities(trim($this->text), ENT_QUOTES, 'UTF-8');
			$abfrage = "Insert into guestbook (vorname, nachname, text) values ('".$this->vorname."', '".$this->nachname."', '".$this->text."')";
			$ergebnis = mysql_query($abfrage);
			
			$this->vorname = '';
			$this->nachname = '';
			$this->text = '';
		}
	}
	
	private function getEntries(){
		$abfrage_guest = "Select * from guestbook order by timestamp DESC LIMIT 20";
		$ergebnis_guest = mysql_query($abfrage_guest);
		
		if(!empty($ergebnis_guest)){
			for($i = 1; $row = mysql_fetch_assoc($ergebnis_guest); $i++)
			{	
				$this->entries[$i]['vorname'] 	= $row['vorname'];
				$this->entries[$i]['nachname'] 	= $row['nachname'];
				$this->entries[$i]['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
				$this->entries[$i]['text'] 		= $row['text'];
			}
		}
	}
	
	public function getHTML() {
		$this->getEntries();
		include('layout/guestbook.tpl');
	}
}

?>