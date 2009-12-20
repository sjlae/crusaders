<?php
require_once('Page.php');
require_once('Home/Home.php');
require_once('Datenbank/db.php');

class Home extends HTMLPage implements Page{

	private $link = '';
	private $news = array();
	private $results = array();
	
	public function __construct() {
		$this->getNews();
		$this->getResults();
	}
	
	public function getHTML() {
		include('layout/home.tpl');
	}
	
	private function getNews(){
		$this->link = Db::getConnection();
		
		$abfrage = "Select * from news order by timestamp DESC LIMIT 5";

		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$userId = $row['userfsid'];
			
			$userQuery = "Select vorname, nachname from user where userid=$userId";
			$userData = mysql_query($userQuery);
			$row_user = mysql_fetch_assoc($userData);
						
			$this->news[$counter]['vorname'] = $row_user['vorname'];
			$this->news[$counter]['nachname'] = $row_user['nachname'];
			$this->news[$counter]['newsid'] = $row['newsid'];
			$this->news[$counter]['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
			$this->news[$counter]['titel'] = $row['titel'];
			$this->news[$counter]['text'] = substr($row['text'], 0, 250);
			$this->news[$counter]['more'] = true;
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