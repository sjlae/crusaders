<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class Comments extends HTMLPage implements Page{

	private $comments = '';
	private $link = '';
	
	public function __construct() {
		$this->action = isset($_GET['action']) ? $_GET['action'] : '';
		$this->link = Db::getConnection();
		if($this->action == 'save'){
			$this->saveComment();
		}
	}
	
	private function saveComment(){
		
	}
	
	private function getComments(){
		$id = isset($_GET['id']) ? $_GET['id'] : '';
		$type = isset($_GET['type']) ? $_GET['type'] : '';
		
		$abfrage = "Select * from comments where newsfsid=$id and type=$type order by timestamp DESC";

		$ergebnis = mysql_query($abfrage);
		
		if($ergebnis != ''){
			$counter = 0;
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$this->comments[$counter]['vorname'] = $row['vorname'];
				$this->comments[$counter]['nachname'] = $row['nachname'];
				$this->comments[$counter]['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
				$this->comments[$counter]['text'] = substr($row['text'], 0, 50);
				
				$counter++;
			}
		}
	}
	
	public function getHTML() {
		$this->getComments();
		include('layout/comments.tpl');
	}
}

?>