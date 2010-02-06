<?php
require_once('Page.php');
require_once('Teams.php');
require_once('Datenbank/db.php');
class Teaminfo extends HTMLPage implements Page{
	
	private $link = '';
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action != ''){
			$this->link = Db::getConnection();
			$this->saveTeaminfos();
		}
	}
	
	public function saveTeaminfos(){
		$team = $_POST['team'];
		$trainingDay1_tag = htmlentities(trim($_POST['trainingDay1_tag']), ENT_QUOTES, 'UTF-8');;
		$trainingDay1_halle = htmlentities(trim($_POST['trainingDay1_halle']), ENT_QUOTES, 'UTF-8');;
		$trainingDay1_fromHour = htmlentities(trim($_POST['trainingDay1_fromHour']), ENT_QUOTES, 'UTF-8');;
		$trainingDay1_fromMinutes = htmlentities(trim($_POST['trainingDay1_fromMinutes']), ENT_QUOTES, 'UTF-8');;
		$trainingDay1_toHour = htmlentities(trim($_POST['trainingDay1_toHour']), ENT_QUOTES, 'UTF-8');;
		$trainingDay1_toMinutes = htmlentities(trim($_POST['trainingDay1_toMinutes']), ENT_QUOTES, 'UTF-8');;
		$trainingDay2_tag = htmlentities(trim($_POST['trainingDay2_tag']), ENT_QUOTES, 'UTF-8');;
		$trainingDay2_halle = htmlentities(trim($_POST['trainingDay2_halle']), ENT_QUOTES, 'UTF-8');;
		$trainingDay2_fromHour = htmlentities(trim($_POST['trainingDay2_fromHour']), ENT_QUOTES, 'UTF-8');;
		$trainingDay2_fromMinutes = htmlentities(trim($_POST['trainingDay2_fromMinutes']), ENT_QUOTES, 'UTF-8');;
		$trainingDay2_toHour = htmlentities(trim($_POST['trainingDay2_toHour']), ENT_QUOTES, 'UTF-8');;
		$trainingDay2_toMinutes = htmlentities(trim($_POST['trainingDay2_toMinutes']), ENT_QUOTES, 'UTF-8');;
		$coach1_vorname = htmlentities(trim($_POST['coach1_vorname']), ENT_QUOTES, 'UTF-8');;
		$coach1_nachname = htmlentities(trim($_POST['coach1_nachname']), ENT_QUOTES, 'UTF-8');;
		$coach1_email = htmlentities(trim($_POST['coach1_email']), ENT_QUOTES, 'UTF-8');;
		$coach1_phone = htmlentities(trim($_POST['coach1_phone']), ENT_QUOTES, 'UTF-8');;
		$coach2_vorname = htmlentities(trim($_POST['coach2_vorname']), ENT_QUOTES, 'UTF-8');;
		$coach2_nachname = htmlentities(trim($_POST['coach2_nachname']), ENT_QUOTES, 'UTF-8');;
		$coach2_email = htmlentities(trim($_POST['coach2_email']), ENT_QUOTES, 'UTF-8');;
		$coach2_phone = htmlentities(trim($_POST['coach2_phone']), ENT_QUOTES, 'UTF-8');;
		
		$abfrage = "Update teams set trainingDay1_tag='".$trainingDay1_tag."',
			trainingDay1_halle='".$trainingDay1_halle."',
			trainingDay1_fromHour='".$trainingDay1_fromHour."',
			trainingDay1_fromMinutes='".$trainingDay1_fromMinutes."',
			trainingDay1_toHour='".$trainingDay1_toHour."',
			trainingDay1_toMinutes='".$trainingDay1_toMinutes."',
			trainingDay2_tag='".$trainingDay2_tag."',
			trainingDay2_halle='".$trainingDay2_halle."', 
			trainingDay2_fromHour='".$trainingDay2_fromHour."',
			trainingDay2_fromMinutes='".$trainingDay2_fromMinutes."',
			trainingDay2_toHour='".$trainingDay2_toHour."',
			trainingDay2_toMinutes='".$trainingDay2_toMinutes."',
			coach1_vorname='".$coach1_vorname."',
			coach1_nachname='".$coach1_nachname."',
			coach1_email='".$coach1_email."',
			coach1_phone='".$coach1_phone."',
			coach2_vorname='".$coach2_vorname."',
			coach2_nachname='".$coach2_nachname."',
			coach2_email='".$coach2_email."',
			coach2_phone='".$coach2_phone."'
		 	where teamid=$team";

		mysql_query($abfrage);
	}
	
	public function getHTML() {
		include('layout/teaminfo.tpl');
	}
}

?>