<?php
require_once('Page.php');
require_once('Home/Home.php');
require_once('Datenbank/db.php');

class Home extends HTMLPage implements Page{
 
	private $link = '';
	private $news = array();
	private $url = '';
	
	public function __construct() {
		$this->link = Db::getConnection();
		
		$this->getNews();
		$this->getUrl();
	}
	
	public function getHTML() {
		include('layout/home.tpl');
	}
	
	private function getUrl(){
		$abfrage = "Select * from video";
		$ergebnis = mysql_query($abfrage);
		$this->url = mysql_result($ergebnis,0);
	}
	
	private function pagingValues(){
		$count = "SELECT COUNT(*) FROM news";
		$countComments = mysql_query($count);
		$numberOfNews = mysql_result($countComments,0);
		
		if($numberOfNews - $_SESSION['actualPage'] <= 4){
			$_SESSION['hasNext'] = false;
		}
		else{
			$_SESSION['hasNext'] = true;
		}
		
		if(isset($_SESSION['actualPage']) && $_SESSION['actualPage'] <= 0){
			$_SESSION['hasPrevious'] = false;
		}
		else{
			$_SESSION['hasPrevious'] = true;
		}
	}
	
	private function getNews(){
		if(isset($_GET['clickedNext'])){
			$_SESSION['actualPage'] = $_SESSION['actualPage'] + 4;
		}
		else if(isset($_GET['clickedPrevious'])){
			$_SESSION['actualPage'] = $_SESSION['actualPage'] - 4;
		}
		
		$this->pagingValues();
		
		$this->next = isset($_SESSION['actualPage']) ? $_SESSION['actualPage'] : 0;
		
		$abfrage = "Select * from news order by timestamp DESC LIMIT $this->next, 4";
		
		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		
		if($ergebnis != null){
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$userId = $row['userfsid'];
				
				$userQuery = "Select userid, vorname, nachname from user where userid=$userId";
				$userData = mysql_query($userQuery);
				$row_user = mysql_fetch_assoc($userData);
				
				$newsid = $row['newsid'];
				$count = "SELECT COUNT(*) FROM comments where newsfsid=$newsid and type=1";
				$countComments = mysql_query($count);
							
				$this->news[$counter]['userid'] = $row_user['userid'];
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