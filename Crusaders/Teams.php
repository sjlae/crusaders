<?php
require_once('Datenbank/db.php');
class Teams{
	
	public static function getTeams(){
		$teamArray = array();
		$link = Db::getConnection();
		
		$abfrage = "Select * from teams where teamcode != 0 order by sortid ASC";

		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$teamArray[$counter]['teamid'] = $row['teamid'];
			$teamArray[$counter]['teamname'] = $row['teamname'];
			$teamArray[$counter]['teamcode'] = $row['teamcode'];
			$teamArray[$counter]['teamgroup'] = $row['teamgroup'];
			$teamArray[$counter]['club'] = $row['club'];
			
			$counter++;
		}
		
		return $teamArray;
	}
	
	public static function getTeamsMember(){
		$teamArray = array();
		$link = Db::getConnection();
		
		$abfrage = "Select * from teams order by sortid ASC";

		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$teamArray[$counter]['teamname'] = $row['teamname'];
			
			$counter++;
		}
		
		return $teamArray;
	}
	
	public static function getTeam($teamid){
		$teamArray = array();
		$link = Db::getConnection();
		
		$abfrage = "Select * from teams where teamid=$teamid";

		$ergebnis = mysql_query($abfrage);
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$teamArray['teamid'] = $row['teamid'];
			$teamArray['restteamid'] = $row['restteamid'];
			$teamArray['teamname'] = $row['teamname'];
			$teamArray['teamcode'] = $row['teamcode'];
			$teamArray['teamgroup'] = $row['teamgroup'];
			$teamArray['club'] = $row['club'];
		}
		
		return $teamArray;
	}
}

?>