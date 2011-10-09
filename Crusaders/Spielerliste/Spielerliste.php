<?php
require_once('Page.php');

class Spielerliste extends HTMLPage implements Page{
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action != ''){
			$this->saveFile();
		}
	}
	
	public function saveFile(){
		if(stristr($_FILES["file"]["name"], ".pdf") != false){
			move_uploaded_file($_FILES['file']['tmp_name'], 'spielerlistenfiles/'.str_replace(' ', '_', $_POST['team']).'.pdf');
			$_SESSION['infos'][] = "Dein Fileupload hat funktioniert.";
		}
		else{
			$_SESSION['errors'][] = "Es k&ouml;nnen nur PDF Dateien gespeichert werden.";
		}
		return;
	}
	
	public function getHTML() {
		include('layout/spielerliste.tpl');
	}
}

?>