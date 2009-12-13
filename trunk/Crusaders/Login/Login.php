<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class Login extends HTMLPage implements Page{

	private $email = '';
	private $passwort = '';
	private $link = '';
	
	public function __construct() {
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		if($action != ''){
			$this->link = Db::getConnection();
			$this->checkLogin();
		}
	}
	
	private function checkLogin(){
		$this->email = $_POST['email'];
		$this->passwort = $_POST['passwort'];
		if($this->email == '' || $this->passwort == ''){
			$_SESSION['errors'][] = "Bitte beide ausf&uuml;llen und keine Sonderzeichen verwenden";
			return;
		}
		
		if(count($this->errors) == 0) {

			$abfrage = sprintf("SELECT * FROM user where email='%s' and passwort='%s'",  htmlentities($this->email, ENT_QUOTES, 'UTF-8'), htmlentities($this->passwort, ENT_QUOTES, 'UTF-8'));

			$ergebnis = mysql_query($abfrage, $this->link);
				
			$ok = false;
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$ok = true;
				$_SESSION['eingeloggt'] = true;
				$_SESSION['userid'] = $row['userid'];

				if($row['adminflag'] == '1'){
					$_SESSION['admin'] = true;
					
				}
				else if($row['coachflag'] == '1'){
					$_SESSION['coach'] = true;
				}
				else if($row['bloggerflag'] == '1'){
					$_SESSION['blogger'] = true;
				}
				
				header('location:index.php');
			}
			if($ok == false) {
				$_SESSION['errors'][] = "Email und Passwort stimmen nicht &uuml;berein";
			}
		}
	}
	
	public function getHTML() {
		include('layout/login.tpl');
	}
}

?>