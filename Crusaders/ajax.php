<?php
require_once('Datenbank/db.php');

$link = Db::getConnection();

$action = isset($_POST['action']) ? $_POST['action'] : '';

if($action == 'homeNews'){
	$newsid = isset($_POST['newsid']) ? $_POST['newsid'] : '';
	$value = isset($_POST['value']) ? $_POST['value'] : '';
	if($value != ''){
		$value = nl2br(htmlentities(trim($value), ENT_QUOTES, 'UTF-8'));
		$update = "Update news set text='$value' where newsid=$newsid";
		mysql_query($update);
	}
	$get = "Select text from news where newsid=$newsid";
	$ergebnis = mysql_query($get);
	$text = mysql_fetch_row($ergebnis);
	
	if($value != ''){
		echo html_entity_decode(substr($text[0], 0, 220), ENT_QUOTES, "UTF-8");
	}
	else{
		echo str_replace(array('<br />', '<br>', '<br/>'), '', html_entity_decode($text[0], ENT_QUOTES, "UTF-8"));
	}
}

else if($action == 'teamNews'){
	$newsid = isset($_POST['newsid']) ? $_POST['newsid'] : '';
	$value = isset($_POST['value']) ? $_POST['value'] : '';
	if($value != ''){
		$value = nl2br(htmlentities(trim($value), ENT_QUOTES, 'UTF-8'));
		$update = "Update teamnews set text='$value' where newsid=$newsid";
		mysql_query($update);
	}
	$get = "Select text from teamnews where newsid=$newsid";
	$ergebnis = mysql_query($get);
	$text = mysql_fetch_row($ergebnis);
	
	if($value != ''){
		echo html_entity_decode(substr($text[0], 0, 220), ENT_QUOTES, "UTF-8");
	}
	else{
		echo str_replace(array('<br />', '<br>', '<br/>'), '', html_entity_decode($text[0], ENT_QUOTES, "UTF-8"));
	}
}

else if($action == 'blog'){
	$blogid = isset($_POST['blogid']) ? $_POST['blogid'] : '';
	$value = isset($_POST['value']) ? $_POST['value'] : '';
	if($value != ''){
		$value = nl2br(htmlentities(trim($value), ENT_QUOTES, 'UTF-8'));
		$update = "Update blog set text='$value' where blogid=$blogid";
		mysql_query($update);
	}
	
	$get = "Select text from blog where blogid=$blogid";
	$ergebnis = mysql_query($get);
	$text = mysql_fetch_row($ergebnis);
	
	if($value != ''){
		echo html_entity_decode($text[0], ENT_QUOTES, "UTF-8");
	}
	else{
		echo str_replace(array('<br />', '<br>', '<br/>'), '', html_entity_decode($text[0], ENT_QUOTES, "UTF-8"));
	}
}


?>