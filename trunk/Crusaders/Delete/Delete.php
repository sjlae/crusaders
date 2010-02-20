<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class Delete extends HTMLPage implements Page{

	private $action = '';
	private $delete = '';
	private $link = '';
	private $news = '';
	private $user = '';
	private $comment = '';
	private $blog = '';
	
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
			    case 'deleteComment':
			        $this->deleteComment();
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
		$abfrage = "Select * from blog order by timestamp DESC";

		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$userId = $row['userfsid'];
			
			$userQuery = "Select vorname, nachname from user where userid=$userId";
			$userData = mysql_query($userQuery);
			$row_user = mysql_fetch_assoc($userData);
						
			$this->blog[$counter]['vorname'] = $row_user['vorname'];
			$this->blog[$counter]['nachname'] = $row_user['nachname'];
			$this->blog[$counter]['blogid'] = $row['blogid'];
			$this->blog[$counter]['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
			$this->blog[$counter]['titel'] = substr($row['titel'], 0, 50);
			$this->blog[$counter]['text'] = substr($row['text'], 0, 50);
			
			$counter++;
		}
	}
	
	private function deleteBlog(){
		if($this->action == 'deleteBlog'){
			if(isset($_POST['blog_del'])){
				foreach($_POST['blog_del'] as $blog_id){
					mysql_query("Delete from blog where blogid = $blog_id");
				}
			}
		}
	}
	
	
	private function getComment(){
		$abfrage = "Select * from comments order by timestamp DESC";

		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$this->comment[$counter]['id'] = $row['commentsid'];
			$this->comment[$counter]['vorname'] = $row['vorname'];
			$this->comment[$counter]['nachname'] = $row['nachname'];
			$this->comment[$counter]['timestamp'] = date('d.m.Y H:i', strtotime($row['timestamp']));
			$this->comment[$counter]['text'] = substr($row['text'], 0, 50);
			$this->comment[$counter]['type'] = $row['type'];
			
			$counter++;
		}
	}
	
	private function deleteComment(){
		if($this->action == 'deleteComment'){
			if(isset($_POST['comment_del'])){
				foreach($_POST['comment_del'] as $comment_id){
					mysql_query("Delete from comments where commentsid = $comment_id");
				}
			}
		}
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
		    case 'deleteComment':
		        $this->getComment();
				include('layout/deleteComment.tpl');
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