<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

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
		<li class="top"><a href="index.php?go=home" class="top_link"><span>HOME</span></a></li>
		<li class="top"><a href="#" class="top_link"><span>&Uuml;BER UNS</span></a>
			<ul class="sub">
				<li><a href="#">Vorstand</a></li>			
				<li><a href="#">Trainer</a></li>
	            <li><a href="#">Schiedsrichter</a></li>
	            <li><a href="#">Geschichte</a></li>
			</ul>
		</li>
		<li class="top"><a href="#" class="top_link"><span>TEAMS</span></a>
			<ul class="sub">
				<li><a href="#">Herren GF</a></li>			
	            <li><a href="#">Damen KF</a></li>
	            <li><a href="#">A-Juniorinnen</a></li>
	            <li><a href="#">U18</a></li>
	            <li><a href="#">U16</a></li>
	            <li><a href="#">B-Junioren</a></li>
	            <li><a href="#">D-Junioren I</a></li>
	            <li><a href="#">D-Junioren II</a></li>
	            <li><a href="#">E-Junioren</a></li>
			</ul>
		</li>
		<li class="top"><a href="#" class="top_link"><span>G&Auml;STEBUCH</span></a></li>
		<?php
			if(!$_SESSION['eingeloggt']){
		?>
				<li class="top"><a href="index.php?go=login" class="top_link"><span>log in</span></a></li>
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
