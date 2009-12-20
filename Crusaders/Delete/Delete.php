<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class Delete extends HTMLPage implements Page{

	private $action = '';
	private $delete = '';
	private $link = '';
	private $news = '';
	private $user = '';
	
	public function __construct() {
		$this->action = isset($_GET['action']) ? $_GET['action'] : '';
		$this->delete = isset($_GET['delete']) ? $_GET['delete'] : '';
		$this->link = Db::getConnection();
		if($this->delete != null){
			switch ($this->action) {
			    case 'deleteNews':
			        $this->deleteNews();
			        break;
			    case 'deleteUser':
			        $this->deleteUser();
			        break;
			    case 'deleteBlog':
			        $this->deleteBlog();
			        break;
			}
		}
	}
	
	private function getNews(){
		$abfrage = "Select * from news order by timestamp DESC";

		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$userId = $row['userfsid'];
			
			$userQuery = "Select vorname, nachname from user where userid=$userId";
			$userData = mysql_query($userQuery);
			$row_user = mysql_fetch_assoc($userData);
						
			$this->news[$counter]['vorname'] = $row_user['vorname'];
			$this->news[$counter]['nachname'] = $row_user['nachname'];
			$this->news[$counter]['newsid'] = $row['newsid'];
			$this->news[$counter]['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
			$this->news[$counter]['titel'] = substr($row['titel'], 0, 50);
			$this->news[$counter]['text'] = substr($row['text'], 0, 50);
			
			$counter++;
		}
	}
	
	private function deleteNews(){
		if($this->action == 'deleteNews'){
			if(isset($_POST['news_del'])){
				foreach($_POST['news_del'] as $news_id){
					mysql_query("Delete from news where newsid = $news_id");
				}
			}
		}
	}
	
	
	private function getUser(){
		$userQuery = "Select * from user";
		$userData = mysql_query($userQuery);
		
		$counter = 0;
		while($row = mysql_fetch_assoc($userData))
		{
			$this->user[$counter]['userid'] = $row['userid'];
			$this->user[$counter]['vorname'] = $row['vorname'];
			$this->user[$counter]['nachname'] = $row['nachname'];
			$this->user[$counter]['email'] = $row['email'];
			
			$counter++;
		}
	}
	
	private function deleteUser(){
		if($this->action == 'deleteUser'){
			if(isset($_POST['user_del'])){
				foreach($_POST['user_del'] as $user_id){
					mysql_query("Delete from user where userid = $user_id");
				}
			}
		}
	}
	
	
	private function getBlog(){
	}
	
	private function deleteBlog(){
	}
	
	public function getHTML() {
		switch ($this->action) {
		    case 'deleteNews':
		        $this->getNews();
				include('layout/deleteNews.tpl');
		        break;
		    case 'deleteUser':
		        $this->getUser();
				include('layout/deleteUser.tpl');
		        break;
		    case 'deleteBlog':
		        $this->getBlog();
				include('layout/deleteBlog.tpl');
		        break;
		    default:
		    	$this->getNews();
				include('layout/deleteNews.tpl');
		}
	}
}

?>