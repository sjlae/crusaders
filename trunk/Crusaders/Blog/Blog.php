<?php
require_once('Page.php');
require_once('Home/Home.php');
require_once('Datenbank/db.php');

class Blog extends HTMLPage implements Page{
 
	private $link = '';
	
	private $blog = array();
	
	public function __construct() {
		$this->link = Db::getConnection();
		$del = isset($_GET['del']) ? $_GET['del'] : '';
		if($del == 1){
			$_SESSION['actualPage_Blog'] = 0;
		}
		$this->getBlog();
	}
	
	private function getBlog(){
		if(isset($_GET['clickedNext'])){
			$_SESSION['actualPage_Blog'] = $_SESSION['actualPage_Blog'] + 1;
		}
		else if(isset($_GET['clickedPrevious'])){
			$_SESSION['actualPage_Blog'] = $_SESSION['actualPage_Blog'] - 1;
		}
		
		$this->pagingValues();
		
		$this->next = isset($_SESSION['actualPage_Blog']) ? $_SESSION['actualPage_Blog'] : 0;
		
		$abfrage = "Select * from blog order by timestamp DESC LIMIT $this->next, 1";
		
		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		
		if($ergebnis != null){
			while($row = mysql_fetch_assoc($ergebnis))
			{
				$userId = $row['userfsid'];
				
				$userQuery = "Select vorname, nachname from user where userid=$userId";
				$userData = mysql_query($userQuery);
				$row_user = mysql_fetch_assoc($userData);
				
				$blogid = $row['blogid'];
				$count = "SELECT COUNT(*) FROM comments where newsfsid=$blogid and type=2";
				$countComments = mysql_query($count);
							
				$this->blog[$counter]['vorname'] = $row_user['vorname'];
				$this->blog[$counter]['nachname'] = $row_user['nachname'];
				$this->blog[$counter]['blogid'] = $blogid;
				$this->blog[$counter]['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
				$this->blog[$counter]['titel'] = $row['titel'];
				$this->blog[$counter]['text'] = $row['text'];
				$this->blog[$counter]['comments'] = mysql_result($countComments,0);
				
				echo $this->blog['titel'];
				$counter++;
			}
		}
	}
	
	private function pagingValues(){
		$count = "SELECT COUNT(*) FROM blog";
		$countBlogs = mysql_query($count);
		$numberOfBlogs = mysql_result($countBlogs,0);
		
		if($numberOfBlogs - $_SESSION['actualPage_Blog'] <= 1){
			$_SESSION['hasNext_Blog'] = false;
		}
		else{
			$_SESSION['hasNext_Blog'] = true;
		}
		
		if(isset($_SESSION['actualPage_Blog']) && $_SESSION['actualPage_Blog'] <= 0){
			$_SESSION['hasPrevious_Blog'] = false;
		}
		else{
			$_SESSION['hasPrevious_Blog'] = true;
		}
	}
	
	public function getHTML() {
		include('layout/blog.tpl');
	}
}

?>