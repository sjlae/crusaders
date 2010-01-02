<?php
require_once('Page.php');
require_once('Home/Home.php');
require_once('Datenbank/db.php');

class Home extends HTMLPage implements Page{

	private $link = '';
	private $news = array();
	private $results = array();
	
	public function __construct() {
		$this->link = Db::getConnection();
		
		$this->getNews();
		$this->getResults();
	}
	
	public function getHTML() {
		include('layout/home.tpl');
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
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$userId = $row['userfsid'];
			
			$userQuery = "Select vorname, nachname from user where userid=$userId";
			$userData = mysql_query($userQuery);
			$row_user = mysql_fetch_assoc($userData);
			
			$newsid = $row['newsid'];
			$count = "SELECT COUNT(*) FROM comments where newsfsid=$newsid";
			$countComments = mysql_query($count);
						
			$this->news[$counter]['vorname'] = $row_user['vorname'];
			$this->news[$counter]['nachname'] = $row_user['nachname'];
			$this->news[$counter]['newsid'] = $newsid;
			$this->news[$counter]['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
			$this->news[$counter]['titel'] = $row['titel'];
			$this->news[$counter]['text'] = substr($row['text'], 0, 250);
			$this->news[$counter]['more'] = true;
			$this->news[$counter]['comments'] = mysql_result($countComments,0);
			if(strlen($row['text']) <= 250){
				$this->news[$counter]['more'] = false;
			}
			$counter++;
		}
	}
	
	private function getResults(){
		$client = new
		SoapClient("http://www.swissunihockey.ch/weblounge/webservices/league?wsdl");
				
		$aResult = array('DevId'           => 1398,
						 'DevCode'         => 'NXzGSazaqsyT6ofpXpOmBwfRdlk=',
				 		 'Language'        => 1,
				 		 'Season'          => 0,
				 		 'Club'            => "Crusaders 95",
				 		 'Rounds'      	   => 1,
						 'LatestGroupOnly' => 0);
				
		// SOAP call ausf�hren 
		$this->results = $client->__call("resultsClub", $aResult)->Results;
	}
}

?>