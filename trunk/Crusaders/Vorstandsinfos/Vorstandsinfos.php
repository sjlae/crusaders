<?php
require_once('Page.php');
require_once('Datenbank/db.php');
class Vorstandsinfos extends HTMLPage implements Page{
	
	private $link = '';
	private $infos = array();
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action != ''){
			$this->link = Db::getConnection();
			$this->saveInfos();
		}
	}
	
	public function getInfos(){
		$abfrage = "Select * from vorstand";
		
		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		
		if($ergebnis != null){
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$this->infos[$counter]['id'] = $row['id'];
				$this->infos[$counter]['funktion'] = $row['funktion'];
				$this->infos[$counter]['vorname'] = $row['vorname'];
				$this->infos[$counter]['nachname'] = $row['nachname'];
				$this->infos[$counter]['email'] = $row['email'];
				$this->infos[$counter]['phone'] = $row['phone'];
				
				$counter++;
			}
		}
	}
	
	public function saveInfos(){
		foreach($_POST['id'] as $id){
			$abfrage = "Update vorstand set funktion='".$_POST['funktion_'.$id.'']."',
			vorname='".$_POST['vorname_'.$id.'']."',
			nachname='".$_POST['nachname_'.$id.'']."',
			phone='".$_POST['phone_'.$id.'']."',
			email='".$_POST['email_'.$id.'']."'
		 	where id=$id";

			mysql_query($abfrage);
		}
	}
	
	public function getHTML() {
		$this->getInfos();
		include('layout/vorstandsinfos.tpl');
	}
}

?>