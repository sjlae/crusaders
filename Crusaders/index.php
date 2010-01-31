<?php
session_start();

require_once('Home/Home.php');
require_once('Login/Login.php');
require_once('Login/LoggedIn.php');
require_once('News/News.php');
require_once('User/User.php');
require_once('SingleMessage/SingleMessage.php');
require_once('Delete/Delete.php');
require_once('Comments/Comments.php');
require_once('Team/Team.php');
require_once('Picture/Picture.php');
require_once('Video/Video.php');

$go = isset($_GET['go']) ? $_GET['go'] : '';

switch($go) {
	case 'login':
		$login = new Login();
		$login->getView();
		break;
	case 'team':
		$team = new Team();
		$team->getView();
		break;
	case 'news':
		$news = new News();
		if(LoggedIn::isAdmin() || LoggedIn::isCoach() || LoggedIn::isBlogger()){
			$news->getView();
			break;
		}
		else{
			$home = new Home();
			$home->getView();
			break;
		}
	case 'user':
		$user = new User();
		if(LoggedIn::isAdmin()){
			$user->getView();
			break;
		}
		else{
			$home = new Home();
			$home->getView();
			break;
		}
	case 'picture':
		$picture = new Picture();
		if(LoggedIn::isAdmin() || LoggedIn::isCoach()){
			$picture->getView();
			break;
		}
		else{
			$home = new Home();
			$home->getView();
			break;
		}
	case 'video':
		$video = new Video();
		if(LoggedIn::isAdmin() || LoggedIn::isCoach()){
			$video->getView();
			break;
		}
		else{
			$home = new Home();
			$home->getView();
			break;
		}
	case 'singleMessage':
		$singleMessage = new SingleMessage();
		$singleMessage->getView();
		break;
	case 'comments':
		$comments = new Comments();
		$comments->getView();
		break;
	case 'delete':
		$delete = new Delete();
		if(LoggedIn::isAdmin()){
			$delete->getView();
			break;
		}
		else{
			$home = new Home();
			$home->getView();
			break;
		}
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
	case 'home':
		$_SESSION['actualPage'] = 0;
		$home = new Home();
		$home->getView();
		break;
	default:
		$home = new Home();
		$home->getView();
}

?>