<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<?php require_once('Constants.php'); ?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
	<head>
		<title>UHC Crusaders 95 Z&uuml;rich</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="content-language" content="de" />
		<meta name="language" content="de" />
		
		<link rel="stylesheet" href="Layout/style.css" type="text/css"/>
	</head>
<body>

<div id="header">
	<ul class="menu">
		<li class="top"><a href="index.php?go=home" class="top_link_home"><span>HOME</span></a></li>
		<li class="top"><a href="#" class="top_link_ueber_uns"><span>&Uuml;BER UNS</span></a>
			<ul class="sub">
				<li><a href="#">Vorstand</a></li>			
				<li><a href="#">Trainer</a></li>
	            <li><a href="#">Schiedsrichter</a></li>
	            <li><a href="#">Geschichte</a></li>
			</ul>
		</li>
		<li class="top"><a href="#" class="top_link_teams"><span>TEAMS</span></a>
			<ul class="sub">
				<?php
					$teamArray = Constants::getTeams();
					for($i = 0; $i < $teamArray[size]; $i++) {
				?>
						<li><a href="index.php?go=team&number=<?php echo $i ?>"><?php echo $teamArray[$i][0] ?></a></li>
				<?php 
					} 
				?>
			</ul>
		</li>
		<li class="top"><a href="#" class="top_link_gaestebuch"><span>G&Auml;STEBUCH</span></a></li>
		<?php
			if(!$_SESSION['eingeloggt']){
		?>
				<li class="top"><a href="index.php?go=login" class="top_link_login"><span>log in</span></a></li>
		<?php
			}
			else{
				if($_SESSION['admin']){
		?>
					<li class="top"><a href="#" class="top_link"><span>Admin</span></a>
						<ul class="sub">
							<li><a href="index.php?go=news">Newsbeitrag erfassen</a></li>			
				            <li><a href="index.php?go=delete&action=deleteNews">Newsbeitrag l&ouml;schen</a></li>
				            <li><a href="index.php?go=user">User erfassen</a></li>
				            <li><a href="index.php?go=delete&action=deleteUser">User l&ouml;schen</a></li>
				            <li><a href="#">G&auml;stebucheintrag l&ouml;schen</a></li>
				            <li><a href="index.php?go=delete&action=deleteComment">Kommentar l&ouml;schen</a></li>
				            <li><a href="index.php?go=logout">log out</a></li>
						</ul>
					</li>
		<?php
				}
				else if($_SESSION['coach']){
		?>
					<li class="top"><a href="#" class="top_link"><span>Admin</span></a>
						<ul class="sub">
							<li><a href="index.php?go=news">Newsbeitrag erfassen</a></li>			
				            <li><a href="index.php?go=logout">log out</a></li>
						</ul>
					</li>
		<?php
				}
				else if($_SESSION['blogger']){
		?>
					<li class="top"><a href="#" class="top_link"><span>Admin</span></a>
						<ul class="sub">
							<li><a href="index.php?go=news">Blogbeitrag erfassen</a></li>			
				            <li><a href="index.php?go=logout">log out</a></li>
						</ul>
					</li>
		<?php
				}
			}
		?>
	</ul>
