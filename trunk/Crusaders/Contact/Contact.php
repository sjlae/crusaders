<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class Contact extends HTMLPage implements Page{
 
	private $link = '';
	private $vorstand = array();
	private $coaches = array();
	
	public function __construct() {
		$this->link = Db::getConnection();
		$this->getVorstandInfos();
		$this->getCoachInfos();
	}
	
	public function getHTML() {
		include('layout/contact.tpl');
	}
	
	private function getVorstandInfos(){
		$abfrage = "Select * from vorstand";
		
		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		
		if($ergebnis != null){
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$this->vorstand[$counter]['funktion'] = $row['funktion'];
				$this->vorstand[$counter]['vorname'] = $row['vorname'];
				$this->vorstand[$counter]['nachname'] = $row['nachname'];
				$this->vorstand[$counter]['email'] = $row['email'];
				$this->vorstand[$counter]['phone'] = $row['phone'];
				
				$counter++;
			}
		}
	}
	
	private function getCoachInfos(){
		$abfrage = "Select * from teams";
		
		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		
		if($ergebnis != null){
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$this->coaches[$counter]['teamname'] = $row['teamname'];
				$this->coaches[$counter]['vorname'] = $row['coach1_vorname'];
				$this->coaches[$counter]['nachname'] = $row['coach1_nachname'];
				$this->coaches[$counter]['email'] = $row['coach1_email'];
				$this->coaches[$counter]['phone'] = $row['coach1_phone'];
				
				$counter++;
			}
		}
	}
}

?>