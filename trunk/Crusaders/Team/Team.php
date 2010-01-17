<?php
require_once('Page.php');

class Team extends HTMLPage implements Page{

	private $results = array();
	private $name;
	
	public function __construct() {
		$this->name = isset($_GET['name']) ? $_GET['name'] : '';
		$this->getTeamResults();
	}
	
	private function getTeamResults(){
		$client = new
		SoapClient("http://www.swissunihockey.ch/weblounge/webservices/league?wsdl");

		$ligaCode 	= isset($_GET['ligaCode']) ? $_GET['ligaCode'] : '';
		$gruppe 	= isset($_GET['gruppe']) ? $_GET['gruppe'] : '';
		$verein 	= isset($_GET['verein']) ? $_GET['verein'] : '';
		
		if($gruppe != ""){
			$aResult = array('DevId'           => 1398,
							 'DevCode'         => 'NXzGSazaqsyT6ofpXpOmBwfRdlk=',
					 		 'Language'        => 1,
					 		 'Season'          => 0,
					 		 'Club'            => $verein,
					 		 'LeagueCode' 	   => $ligaCode,
					  		 'Group' 	       => $gruppe,
					 		 'Rounds'      	   => 1);
					
			// SOAP call ausf�hren 
			$this->results = $client->__call("resultsTeamGroup", $aResult)->Results;
		}
	}
	
	public function getHTML() {
		include('layout/team.tpl');
	}
}

?>