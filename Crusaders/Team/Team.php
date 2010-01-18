<?php
require_once('Page.php');
require_once('Constants.php');

class Team extends HTMLPage implements Page{

	private $results 	= array();
	private $games 		= array();
	private $ranking	= array();
	
	private $name = '';
	private $ligaCode = '';
	private $gruppe = '';
	private $verein = '';
	
	public function __construct() {
		$this->setValues();
	}
	
	private function setValues(){
		$number	= isset($_GET['number']) ? $_GET['number'] : '';
		
		if($number != ''){ 
			$team = Constants::getTeams(); 
			
			$this->name 	= $team[$number][0];
			$this->ligaCode = $team[$number][1];
			$this->gruppe 	= $team[$number][2];
			$this->verein 	= $team[$number][3];
			
			if($this->name != ''){
				$this->getTeamResults();
				$this->getTeamGames();
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
	
	private function getTeamResults(){
		$client = new
		SoapClient("http://www.swissunihockey.ch/weblounge/webservices/league?wsdl");

		if($this->gruppe != ""){
			$aResult = array('DevId'           => 1398,
							 'DevCode'         => 'NXzGSazaqsyT6ofpXpOmBwfRdlk=',
					 		 'Language'        => 1,
					 		 'Season'          => 0,
					 		 'Club'            => $this->verein,
					 		 'LeagueCode' 	   => $this->ligaCode,
					  		 'Group' 	       => $this->gruppe,
					 		 'Rounds'      	   => 1);
					
			// SOAP call ausf�hren 
			$this->results = $client->__call("resultsTeamGroup", $aResult)->Results;
		}
	}
	
	private function getTeamGames(){
		$client = new
		SoapClient("http://www.swissunihockey.ch/weblounge/webservices/league?wsdl");
		
		if($this->gruppe != ""){
			$aResult = array('DevId'           => 1398,
							 'DevCode'         => 'NXzGSazaqsyT6ofpXpOmBwfRdlk=',
					 		 'Language'        => 1,
					 		 'Season'          => 0,
					 		 'Club'            => $this->verein,
					 		 'LeagueCode' 	   => $this->ligaCode,
					  		 'Group' 	       => $this->gruppe,
					 		 'Rounds'      	   => 1);
					
			// SOAP call ausf�hren 
			$this->games = $client->__call("gamesTeamGroup", $aResult)->Games;
		}
	}
	
	private function getTeamRanking(){
		$client = new
		SoapClient("http://www.swissunihockey.ch/weblounge/webservices/league?wsdl");
		
		if($this->gruppe != ""){
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
		include('layout/team.tpl');
	}
}

?>