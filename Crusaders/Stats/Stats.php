<?php
require_once('Page.php');
require_once('Teams.php');
require_once('FloorballRestClient.php');
class Stats extends HTMLPage implements Page{

	private $teamid = '';
	private $name = '';
	private $restteamid = '';
	
	private $ranking = array();
	private $games = array();
	
	public function __construct() {
		$this->getGames();
	}
	
	private function getGames(){
		$teamid	= isset($_GET['teamid']) ? $_GET['teamid'] : '';
		
		if($teamid != ''){ 
			$team = Teams::getTeam($teamid); 
			
			$this->teamid 	= $team['teamid'];
			$this->name 	= $team['teamname'];
			$this->restteamid = $team['restteamid'];
			
			if($this->name != ''){
				$this->getTeamResults();
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
		$fb = new FloorballRestClient('dummy-api-key');
		$this->games = $fb->getTeamGames($this->restteamid);
	}
	
	private function getTeamRanking(){
		$fb = new FloorballRestClient('dummy-api-key');
		$this->ranking = $fb->getTeamTable($this->restteamid);
	}
	
	public function getHTML() {
		include('layout/stats.tpl');
	}
}

?>