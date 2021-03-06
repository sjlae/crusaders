<?php
require_once('Page.php');
require_once('Teams.php');
require_once('Datenbank/db.php');
require_once('FloorballRestClient.php');
class Team extends HTMLPage implements Page{

	private $link = '';
	
	private $results 	= array();
	private $games 		= array();
	private $ranking	= array();
	
	private $teamid = '';
	private $name = '';
	private $restteamid = '';
	
	private $spielgemeinschaft = '';
	private $trainingDay1_tag = '';
	private $trainingDay1_halle = '';
	private $trainingDay1_fromHour = '';
	private $trainingDay1_fromMinutes = '';
	private $trainingDay1_toHour = '';
	private $trainingDay1_toMinutes = '';
	private $trainingDay2_tag = '';
	private $trainingDay2_halle = '';
	private $trainingDay2_fromHour = '';
	private $trainingDay2_fromMinutes = '';
	private $trainingDay2_toHour = '';
	private $trainingDay2_toMinutes = '';
	private $coach1_vorname = '';
	private $coach1_nachname = '';
	private $coach1_email = '';
	private $coach1_phone = '';
	private $coach2_vorname = '';
	private $coach2_nachname = '';
	private $coach2_email = '';
	private $coach2_phone = '';
	
	public function __construct() {
		$this->setValues();
	}
	
	private function setValues(){
		$number	= isset($_GET['teamid']) ? $_GET['teamid'] : '';
		
		if($number != ''){ 
			$team = Teams::getTeam($number); 
			
			$this->teamid 	= $team['teamid'];
			$this->name 	= $team['teamname'];
			$this->restteamid = $team['restteamid'];
			
			if($this->name != ''){
				$this->link = Db::getConnection();
				$this->getTeamInfos();
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
	
	private function getTeamInfos(){
		$abfrage = "Select * from teams where teamid=$this->teamid";
		
		$ergebnis = mysql_query($abfrage);
		
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$this->spielgemeinschaft = $row['spielgemeinschaft'];
			$this->trainingDay1_tag = $row['trainingDay1_tag'];
			$this->trainingDay1_halle = $row['trainingDay1_halle'];
			$this->trainingDay1_fromHour = $row['trainingDay1_fromHour'];
			$this->trainingDay1_fromMinutes = $row['trainingDay1_fromMinutes'];
			$this->trainingDay1_toHour = $row['trainingDay1_toHour'];
			$this->trainingDay1_toMinutes = $row['trainingDay1_toMinutes'];
			$this->trainingDay2_tag = $row['trainingDay2_tag'];
			$this->trainingDay2_halle = $row['trainingDay2_halle'];
			$this->trainingDay2_fromHour = $row['trainingDay2_fromHour'];
			$this->trainingDay2_fromMinutes = $row['trainingDay2_fromMinutes'];
			$this->trainingDay2_toHour = $row['trainingDay2_toHour'];
			$this->trainingDay2_toMinutes = $row['trainingDay2_toMinutes'];
			$this->coach1_vorname = $row['coach1_vorname'];
			$this->coach1_nachname = $row['coach1_nachname'];
			$this->coach1_email = $row['coach1_email'];
			$this->coach1_phone = $row['coach1_phone'];
			$this->coach2_vorname = $row['coach2_vorname'];
			$this->coach2_nachname = $row['coach2_nachname'];
			$this->coach2_email = $row['coach2_email'];
			$this->coach2_phone = $row['coach2_phone'];
		}
	}
	
	private function getTeamRanking(){
		$fb = new FloorballRestClient('dummy-api-key');
		$this->ranking = $fb->getTeamTable($this->restteamid);
	}
	
	public function getHTML() {
		include('layout/team.tpl');
	}
}

?>