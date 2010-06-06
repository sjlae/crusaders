<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class SingleMessage extends HTMLPage implements Page{

	private $link = '';
	private $news = '';
	private $teamnews = false;
	private $teamid = '';
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action == 'news'){
			$this->link = Db::getConnection();
			$this->getNews();
		}
	}
	
	private function getNews(){
		$this->link = Db::getConnection();
		$newsid = $_GET['id'];
		$this->teamnews = isset($_GET['teamnews']) ? true : false;
		
		$abfrage = '';
		if($this->teamnews){
			$this->teamid = $_GET['teamid'];
			$abfrage = "Select * from teamnews where newsid='$newsid'";
		}
		else{
			$abfrage = "Select * from news where newsid='$newsid'";
		}
		
		$ergebnis = mysql_query($abfrage);
		$row = mysql_fetch_assoc($ergebnis);
		
		if($row != null){
			$userId = $row['userfsid'];
	
			$userQuery = "Select vorname, nachname from user where userid='$userId'";
			$userData = mysql_query($userQuery);
			$row_user = mysql_fetch_assoc($userData);
						
			$this->news['vorname'] = $row_user['vorname'];
			$this->news['nachname'] = $row_user['nachname'];
			$this->news['newsid'] = $row['newsid'];
			$this->news['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
			$this->news['titel'] = $row['titel'];
			$this->news['text'] = $row['text'];
			
			if($this->teamnews){
				$count = "SELECT COUNT(*) FROM comments where newsfsid=$newsid and type=3";
			}
			else{
				$count = "SELECT COUNT(*) FROM comments where newsfsid=$newsid and type=1";
			}
			$countComments = mysql_query($count);
			$this->news['comments'] = mysql_result($countComments,0);
		}
	}
	
	public function getHTML() {
		include('layout/singleMessage.tpl');
	}
}

?>