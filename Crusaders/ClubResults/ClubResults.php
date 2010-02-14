<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class ClubResults extends HTMLPage implements Page{
 
	private $link = '';
	private $results = array();
	
	public function __construct() {
		$this->link = Db::getConnection();
		$this->getResults();
	}
	
	public function getHTML() {
		include('layout/clubResults.tpl');
	}
	
	private function getResults(){
		$abfrage = "Select * from teams";
		
		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		
		if($ergebnis != null){
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$club = $row['club'];
				$leagueCode = $row['teamcode'];
				$group = $row['teamgroup'];
				
				$client = new
				SoapClient("http://www.swissunihockey.ch/weblounge/webservices/league?wsdl");
						
				$aResult = array('DevId'           => 1398,
								 'DevCode'         => 'NXzGSazaqsyT6ofpXpOmBwfRdlk=',
						 		 'Language'        => 1,
						 		 'Season'          => 0,
						 		 'Club'            => $club,
								 'LeagueCode'      => $leagueCode,
						 		 'Group'      	   => $group,
								 'Rounds'      	   => 1);
						
				// SOAP call ausf�hren 
				$this->results[$counter] = $client->__call("resultsTeamGroup", $aResult)->Results;
				
				$counter++;
			}
		}
		
		
	}
}

?>