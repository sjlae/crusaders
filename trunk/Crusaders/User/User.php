<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class User extends HTMLPage implements Page{

	private $link = '';
	private $titel = '';
	private $text = '';
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action != ''){
			$this->link = Db::getConnection();
			$this->createUser();
		}
	}
	
	private function createUser(){
		$vorname = htmlentities(trim($_POST['vorname']), ENT_QUOTES, 'UTF-8');
		$nachname = htmlentities(trim($_POST['nachname']), ENT_QUOTES, 'UTF-8');
		$email = htmlentities(trim($_POST['email']), ENT_QUOTES, 'UTF-8');
		$passwort = htmlentities(trim($_POST['passwort']), ENT_QUOTES, 'UTF-8');
		$profil = htmlentities(trim($_POST['profil']), ENT_QUOTES, 'UTF-8');
		
		$adminflag = $profil == 'admin' ? 1 : 0;
		$coachflag = $profil == 'coach' ? 1 : 0;
		$bloggerflag = $profil == 'blogger' ? 1 : 0;
		
		$query = "Insert into user(vorname, nachname, email, passwort, adminflag, coachflag, bloggerflag) values('".$vorname."', '".$nachname."', '".$email."', '".$passwort."', '".$adminflag."', '".$coachflag."', '".$bloggerflag."')";
				
		mysql_query($query,$this->link);
		
		$_SESSION['infos'][] = "Der neue User wurde erfolgreich erfasst";
	}
	
	public function getHTML() {
		include('layout/user.tpl');
	}
}

?>