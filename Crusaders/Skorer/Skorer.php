<?php
require_once('Page.php');

class Skorer extends HTMLPage implements Page{
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action != ''){
			$this->saveSkorerlist();
		}
	}
	
	public function saveSkorerlist(){
		move_uploaded_file($_FILES['skorerlist']['tmp_name'], 'Skorerlists/'.str_replace(' ', '_', $_POST['team']).'.htm');
		$_SESSION['infos'][] = "Dein Upload hat funktioniert.";
		return;
	}
	
	public function getHTML() {
		include('layout/skorer.tpl');
	}
}

?>