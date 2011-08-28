<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class ClubResults extends HTMLPage implements Page{
 
	private $link = '';
	private $results = array();
	private $restteamid = '';
	
	public function __construct() {
		$this->link = Db::getConnection();
		$this->getResults();
	}
	
	public function getHTML() {
		include('layout/clubResults.tpl');
	}
	
	private function getResults(){
		$abfrage = "Select * from teams where restteamid != 0 order by sortid ASC";
		
		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		
		if($ergebnis != null){
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$this->restteamid = $row['restteamid'];
				
				$fb = new FloorballRestClient('dummy-api-key');
				$this->results[$counter] = $fb->getLastTeamGames($this->restteamid);
				$counter++;
			}
		}
		
		
	}
}

?>