<?php

class LoggedIn{
	public static function isAdmin() {
		$registered = $_SESSION['eingeloggt'];
		if($registered){
			if($_SESSION['admin']) {
				return true;
			}
			else{
				return false;
			}
		}
		return false;
	}
	public static function isCoach() {
		$registered = $_SESSION['eingeloggt'];
		if($registered){
			if($_SESSION['coach']) {
				return true;
			}
			else{
				return false;
			}
		}
		return false;
	}
	public static function isBlogger() {
		$registered = $_SESSION['eingeloggt'];
		if($registered){
			if($_SESSION['blogger']) {
				return true;
			}
			else{
				return false;
			}
		}
		return false;
	}
}
?>