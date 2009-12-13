<?php
/*
class Db {
	static function getConnection() {
		$link = @mysql_connect("localhost:8888", "web483", "198981") OR die(mysql_error());
		mysql_select_db("usr_web483_7") OR die(mysql_error());
		
		return $link;
	}
}
*/

class Db {
	static function getConnection() {
		$link = @mysql_connect("localhost", "root", "") OR die(mysql_error());
		mysql_select_db("crusaders") OR die(mysql_error());
		
		return $link;
	}
}

?>