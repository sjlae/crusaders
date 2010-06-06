<?php
require_once('Page.php');
require_once('Home/Home.php');
require_once('Datenbank/db.php');

class TeamNews extends HTMLPage implements Page{
 
	private $link = '';
	private $news = array();
	private $teamid = '';
	
	public function __construct() {
		$this->link = Db::getConnection();
		$del = isset($_GET['del']) ? $_GET['del'] : '';
		if($del == 1){
			$_SESSION['actualPage_Team'] = 0;
		}
		$this->getNews();
	}
	
	public function getHTML() {
		include('layout/teamNews.tpl');
	}
	
	private function pagingValues(){
		$this->teamid = isset($_GET['teamid']) ? $_GET['teamid'] : '';
		$count = "SELECT COUNT(*) FROM teamnews where teamfsid=$this->teamid";
		$countComments = mysql_query($count);
		$numberOfNews = mysql_result($countComments,0);

		if($numberOfNews - $_SESSION['actualPage_Team'] <= 4){
			$_SESSION['hasNext_Team'] = false;
		}
		else{
			$_SESSION['hasNext_Team'] = true;
		}
		
		if(isset($_SESSION['actualPage_Team']) && $_SESSION['actualPage_Team'] <= 0){
			$_SESSION['hasPrevious_Team'] = false;
		}
		else{
			$_SESSION['hasPrevious_Team'] = true;
		}
	}
	
	private function getNews(){
		if(isset($_GET['clickedNext'])){
			$_SESSION['actualPage_Team'] = $_SESSION['actualPage_Team'] + 4;
		}
		else if(isset($_GET['clickedPrevious'])){
			$_SESSION['actualPage_Team'] = $_SESSION['actualPage_Team'] - 4;
		}
		$this->pagingValues();
		
		$this->next = isset($_SESSION['actualPage_Team']) ? $_SESSION['actualPage_Team'] : 0;
		
		$abfrage = "Select * from teamnews where teamfsid = $this->teamid order by timestamp DESC LIMIT $this->next, 4";
		
		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		
		if($ergebnis != null){
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$userId = $row['userfsid'];
				
				$userQuery = "Select vorname, nachname from user where userid=$userId";
				$userData = mysql_query($userQuery);
				$row_user = mysql_fetch_assoc($userData);
				
				$newsid = $row['newsid'];
				$count = "SELECT COUNT(*) FROM comments where newsfsid=$newsid and type=3";
				$countComments = mysql_query($count);
							
				$this->news[$counter]['vorname'] = $row_user['vorname'];
				$this->news[$counter]['nachname'] = $row_user['nachname'];
				$this->news[$counter]['newsid'] = $newsid;
				$this->news[$counter]['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
				$this->news[$counter]['titel'] = $row['titel'];
				$this->news[$counter]['text'] = substr($row['text'], 0, 220);
				$this->news[$counter]['more'] = true;
				$this->news[$counter]['comments'] = mysql_result($countComments,0);
				if(strlen($row['text']) <= 220){
					$this->news[$counter]['more'] = false;
				}
				$counter++;
			}
		}
	}
}

?>