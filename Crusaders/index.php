<?php
session_start();

require_once('Home/Home.php');
require_once('Login/Login.php');
require_once('News/News.php');
require_once('User/User.php');

$go = isset($_GET['go']) ? $_GET['go'] : '';

switch($go) {
	case 'login':
		$login = new Login();
		$login->getView();
		break;
	case 'news':
		$news = new News();
		$news->getView();
		break;
	case 'user':
		$user = new User();
		$user->getView();
		break;
	case 'logout':
		unset($_SESSION['eingeloggt']);
		unset($_SESSION['userid']);
		unset($_SESSION['admin']);
		unset($_SESSION['coach']);
		unset($_SESSION['blogger']);
		$_SESSION['infos'][] = "Du hast erfolgreich ausgeloggt";
		$login = new Login();
		$login->getView();
		break;
	default:
		$home = new Home();
		$home->getView();
}

?>