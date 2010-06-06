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
		$size = getimagesize($_FILES['picture']['tmp_name']);
		if($size[0] / 4 * 3 != $size[1]){
			$_SESSION['errors'][] = "Es k&ouml;nnen nur Bilder mit einem Verh&auml;ltnis (L&auml;nge/Breite) von 4:3 raufgeladen werden.";
			return;
		} 
		
		if($_FILES['picture']['size'] > 300000){
			$_SESSION['errors'][] = "Es k&ouml;nnen nur Bilder mit einer maximal Gr&ouml;sse von 300 KB raufgeladen werden.";
			return;
		}
		
		move_uploaded_file($_FILES['picture']['tmp_name'], 'images/'.str_replace(' ', '_', $_POST['team']).'.jpg');
		$_SESSION['infos'][] = "Dein Bildupload hat funktioniert.";
		return;
	}
	
	public function getHTML() {
		include('layout/picture.tpl');
	}
}

?>