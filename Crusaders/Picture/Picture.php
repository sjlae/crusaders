<?php
require_once('Page.php');

class Picture extends HTMLPage implements Page{
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action != ''){
			$this->saveImage();
		}
	}
	
	public function saveImage(){
		move_uploaded_file($_FILES['picture']['tmp_name'], 'images/'.str_replace(' ', '_', $_POST['team']).'.jpg');
	}
	
	public function getHTML() {
		include('layout/picture.tpl');
	}
}

?>