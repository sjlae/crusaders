<?php
require_once('Page.php');
require_once('Teams.php');
class Stats extends HTMLPage implements Page{

	private $teamid = '';
	private $name = '';
	private $ligaCode = '';
	private $gruppe = '';
	private $verein = '';
	
	private $ranking = array();
	private $results = array();
	private $future = array();
	
	public function __construct() {
		$this->getGames();
	}
	
	private function getGames(){
		$teamid	= isset($_GET['teamid']) ? $_GET['teamid'] : '';
		
		if($teamid != ''){ 
			$team = Teams::getTeam($teamid); 
			
			$this->teamid 	= $team['teamid'];
			$this->name 	= $team['teamname'];
			$this->ligaCode = $team['teamcode'];
			$this->gruppe 	= $team['teamgroup'];
			$this->verein 	= $team['club'];
			
			if($this->name != ''){
				$this->getTeamResults();
				$this->getFutureGames();
				$this->getTeamRanking();
			}
			else{
				header('location:index.php');
				return false;
			}
		}
		else{
			header('location:index.php');
			return false;
		}
	}
	
	private function getFutureGames(){
		$client = new
		SoapClient("http://www.swissunihockey.ch/weblounge/webservices/league?wsdl");

		if($this->gruppe != 0){
			$aResult = array('DevId'           => 1398,
							 'DevCode'         => 'NXzGSazaqsyT6ofpXpOmBwfRdlk=',
					 		 'Language'        => 1,
					 		 'Season'          => 0,
					 		 'Club'            => $this->verein,
					 		 'LeagueCode' 	   => $this->ligaCode,
					  		 'Group' 	       => $this->gruppe,
					 		 'Rounds'      	   => 20);
					
			// SOAP call ausf�hren 
			$this->future = $client->__call("gamesTeamGroup", $aResult)->Games;
		}
	}
	
	private function getTeamResults(){
		$client = new
		SoapClient("http://www.swissunihockey.ch/weblounge/webservices/league?wsdl");

		if($this->gruppe != 0){
			$aResult = array('DevId'           => 1398,
							 'DevCode'         => 'NXzGSazaqsyT6ofpXpOmBwfRdlk=',
					 		 'Language'        => 1,
					 		 'Season'          => 0,
					 		 'Club'            => $this->verein,
					 		 'LeagueCode' 	   => $this->ligaCode,
					  		 'Group' 	       => $this->gruppe,
					 		 'Rounds'      	   => 0);
					
			// SOAP call ausf�hren 
			$this->results = $client->__call("resultsTeamGroup", $aResult)->Results;
		}
	}
	
	private function getTeamRanking(){
		$client = new
		SoapClient("http://www.swissunihockey.ch/weblounge/webservices/league?wsdl");
		
		if($this->gruppe != 0){
			$aResult = array('DevId'           => 1398,
							 'DevCode'         => 'NXzGSazaqsyT6ofpXpOmBwfRdlk=',
					 		 'Language'        => 1,
					 		 'Season'          => 0,
					 		 'LeagueCode' 	   => $this->ligaCode,
					  		 'Group' 	       => $this->gruppe);
					
			// SOAP call ausf�hren 
			$this->ranking = $client->__call("tableLeague", $aResult)->Table;
		}
	}
	
	public function getHTML() {
		include('layout/stats.tpl');
	}
}

?>