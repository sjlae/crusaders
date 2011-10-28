<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<?php require_once('Teams.php'); ?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
	<head>
		<title>UHC Crusaders 95 Z&uuml;rich</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="content-language" content="de" />
		<meta name="language" content="de" />
		
		<link rel="stylesheet" href="Layout/style.css" type="text/css"/>
		<script type="text/javascript" src="script/js_functions.js"></script>
		<script type="text/javascript" src="script/jquery-1.6.3.min.js"></script>
		<style>
		  .pointer { cursor: pointer; }
		  .background { background-color: aqua; }
		</style>
	</head>
<body id="body">
<div id="main">
	<ul class="menu">
		<li class="home"><a href="index.php" title="Home" class="top"></a></li>
		<li class="teams"><a href="#" title="Teams" class="top"></a>
			<ul class="sub">
				<?php
					$teamArray = Teams::getTeams();
					for($i = 0; $i < count($teamArray); $i++) {
				?>
						<li><a href="index.php?go=team&teamid=<?php echo $teamArray[$i]['teamid'] ?>"><?php echo $teamArray[$i]['teamname'] ?></a></li>
				<?php
					} 
				?>
			</ul>
		</li>
		
		<li class="kontakt"><a href="index.php?go=contact" title="Kontakte" class="top"></a></li>
				
		<li class="gaestebuch"><a href="index.php?go=guestbook" title="G&auml;stebuch" class="top"></a></li>
		<?php
			if(!$_SESSION['eingeloggt']){
		?>
				<li class="login"><a href="index.php?go=login" title="Login" class="top"></a></li>
		<?php
			}
			else{
				if($_SESSION['admin']){
		?>
					<li class="login"><a href="#" title="Admin" class="top"></a>
						<ul class="sublogin">
							<li><a href="index.php?go=news">Newsbeitrag erfassen</a></li>			
				            <li><a href="index.php?go=delete&action=deleteNews">Newsbeitrag l&ouml;schen</a></li>
				            <li><a href="index.php?go=blogEntry">Blogbeitrag erfassen</a></li>	
				            <li><a href="index.php?go=delete&action=deleteBlog">Blogbeitrag l&ouml;schen</a></li>	
				            <li><a href="index.php?go=user">User erfassen</a></li>
				            <li><a href="index.php?go=delete&action=deleteUser">User l&ouml;schen</a></li>
				            <li><a href="index.php?go=delete&action=deleteGuestbook">G&auml;stebucheintrag l&ouml;schen</a></li>
				            <li><a href="index.php?go=delete&action=deleteComment">Kommentar l&ouml;schen</a></li>
				            <li><a href="index.php?go=video">Youtube Video Upload</a></li>
				            <li><a href="index.php?go=teaminfo">Teaminfos erfassen</a></li>
				            <li><a href="index.php?go=teamnewsentry">Teamnews Beitrag erfassen</a></li>
				            <li><a href="index.php?go=picture">Teambild Upload</a></li>
				            <li><a href="index.php?go=skorer">Skorerliste Upload</a></li>	
				            <li><a href="index.php?go=vorstandsinfos">Vorstandsinfos erfassen</a></li>
				            <li><a href="index.php?go=spielerliste">Spielerliste Upload</a></li>
				            <li><a href="index.php?go=webmaster">Webmaster Team Infos</a></li>
				            <li><a href="index.php?go=members" target="_blank">Mitglieder-Datenbank</a></li>
				            <li><a href="index.php?go=logout">log out</a></li>
						</ul>
					</li>
		<?php
				}
				else if($_SESSION['coach']){
		?>
					<li class="login"><a href="#" class="top" title="Admin"></a>
						<ul class="sublogin">
							<li><a href="index.php?go=news">Newsbeitrag erfassen</a></li>
							<li><a href="index.php?go=video">Youtube Video Upload</a></li>
							<li><a href="index.php?go=teaminfo">Teaminfos erfassen</a></li>	
							<li><a href="index.php?go=teamnewsentry">Teamnews Beitrag erfassen</a></li>	
							<li><a href="index.php?go=picture">Teambild Upload</a></li>
							<li><a href="index.php?go=skorer">Skorerliste Upload</a></li>		
				            <li><a href="index.php?go=logout">log out</a></li>
						</ul>
					</li>
		<?php
				}
				else if($_SESSION['blogger']){
		?>
					<li class="login"><a href="#" class="top" title="Admin"></a>
						<ul class="sublogin">
							<li><a href="index.php?go=blogEntry">Blogbeitrag erfassen</a></li>			
				            <li><a href="index.php?go=logout">log out</a></li>
						</ul>
					</li>
		<?php
				}
			}
		?>
					<li class="zeitung"><a href="index.php?go=clubResults" title="Letzte Resultate Club" class="zeitung"></a></li> 
					<li class="knaecke"><a href="index.php?go=blog&del=1" title="Kn&auml;ckeblog" class="knaecke"></a></li> 
	</ul>
