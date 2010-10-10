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
require_once('Teaminfo/Teaminfo.php');
require_once('ClubResults/ClubResults.php');
require_once('Contact/Contact.php');
require_once('Stats/Stats.php');
require_once('Blog/Blog.php');
require_once('BlogEntry/BlogEntry.php');
require_once('Guestbook/Guestbook.php');
require_once('Vorstandsinfos/Vorstandsinfos.php');
require_once('TeamNews/TeamNews.php');
require_once('TeamNewsEntry/TeamNewsEntry.php');
require_once('Members/Members.php');
require_once('Skorer/Skorer.php');

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
	case 'blog':
		$blog = new Blog();
		$blog->getView();
		break;
	case 'stats':
		$stats = new Stats();
		$stats->getView();
		break;
	case 'guestbook':
		$guestbook = new Guestbook();
		$guestbook->getView();
		break;
	case 'contact':
		$contact = new Contact();
		$contact->getView();
		break;
	case 'clubResults':
		$clubResults = new ClubResults();
		$clubResults->getView();
		break;
	case 'teamnews':
		$teamNews = new TeamNews();
		$teamNews->getView();
		break;
	case 'news':
		$news = new News();
		if(LoggedIn::isAdmin() || LoggedIn::isCoach()){
			$news->getView();
			break;
		}
		else{
			$home = new Home();
			$home->getView();
			break;
		}
	case 'skorer':
		$skorer = new Skorer();
		if(LoggedIn::isAdmin() || LoggedIn::isCoach()){
			$skorer->getView();
			break;
		}
		else{
			$home = new Home();
			$home->getView();
			break;
		}
	case 'members':
		$members = new Members();
		if(LoggedIn::isAdmin() || LoggedIn::isCoach()){
			$members->getView();
			break;
		}
		else{
			$home = new Home();
			$home->getView();
			break;
		}	
	case 'teamnewsentry':
		$teamnewsentry = new TeamNewsEntry();
		if(LoggedIn::isAdmin() || LoggedIn::isCoach()){
			$teamnewsentry->getView();
			break;
		}
		else{
			$home = new Home();
			$home->getView();
			break;
		}
	case 'blogEntry':
		$blogEntry = new BlogEntry();
		if(LoggedIn::isAdmin() || LoggedIn::isBlogger()){
			$blogEntry->getView();
			break;
		}
		else{
			$home = new Home();
			$home->getView();
			break;
		}
	case 'vorstandsinfos':
		$vorstandsinfos = new Vorstandsinfos();
		if(LoggedIn::isAdmin()){
			$vorstandsinfos->getView();
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
	case 'teaminfo':
		$teaminfo = new Teaminfo();
		if(LoggedIn::isAdmin() || LoggedIn::isCoach()){
			$teaminfo->getView();
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
	case 'session':
		$home = new Home();
		$home->getView();
		break;
	default:
		$_SESSION['actualPage'] = 0;
		$_SESSION['actualPage_Blog'] = 0;
		$_SESSION['actualPage_Team'] = 0;
		$home = new Home();
		$home->getView();
}

?>