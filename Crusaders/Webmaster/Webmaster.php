<?php
require_once('Page.php');
require_once('Datenbank/db.php');
class Webmaster extends HTMLPage implements Page{
	
	private $link = '';
	private $infos = array();
		
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action == 'save'){
			$this->link = Db::getConnection();
			$this->saveInfos();
		}
		else if($action == 'new'){
			$this->link = Db::getConnection();
			$this->newEntry();
		}
	}
	
	public function getInfos(){
		$abfrage = "Select * from teams";
		
		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		
		if($ergebnis != null){
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$this->infos[$counter]['teamid'] = $row['teamid'];
				$this->infos[$counter]['sortid'] = $row['sortid'];
				$this->infos[$counter]['restteamid'] = $row['restteamid'];
				$this->infos[$counter]['teamname'] = $row['teamname'];
				$this->infos[$counter]['teamcode'] = $row['teamcode'];
				$this->infos[$counter]['teamgroup'] = $row['teamgroup'];
				$this->infos[$counter]['club'] = $row['club'];
				$this->infos[$counter]['spielgemeinschaft'] = $row['spielgemeinschaft'];
				
				$counter++;
			}
		}
	}	
	
	private function saveInfos(){
		foreach($_POST['teamid'] as $id){
			$abfrage = "Update teams set sortid='".$_POST['sortid_'.$id.'']."',
			restteamid='".$_POST['restteamid_'.$id.'']."',
			teamname='".$_POST['teamname_'.$id.'']."',
			teamcode='".$_POST['teamcode_'.$id.'']."',
			teamgroup='".$_POST['teamgroup_'.$id.'']."',
			club='".$_POST['club_'.$id.'']."',
			spielgemeinschaft='".$_POST['spielgemeinschaft_'.$id.'']."'
		 	where teamid=$id";

			mysql_query($abfrage);
		}
	}
	
	private function newEntry(){
		$sortid = $_POST['sortid'];
		$restteamid = $_POST['restteamid'];
		$teamname = $_POST['teamname'];
		$teamcode = $_POST['teamcode'];
		$teamgroup = $_POST['teamgroup'];
		$club = $_POST['club'];
		$spielgemeinschaft = $_POST['spielgemeinschaft'];
		
		$query = sprintf("Insert into teams(sortid, restteamid, teamname, teamcode, teamgroup, club, spielgemeinschaft) 
									   values('".$sortid."', '".$restteamid."', '".$teamname."', '".$teamcode."', '".$teamgroup."', '".$club."', '".$spielgemeinschaft."')");

		mysql_query($query,$this->link);
	}
	
	public function getHTML() {
		$this->getInfos();
		include('layout/webmaster.tpl');
	}
}

?>