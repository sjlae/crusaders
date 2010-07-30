<?php
require_once('Page.php');
require_once('Datenbank/db.php');

class Members extends HTMLPage implements Page{

	private $link = '';
	
	// Filteroptionen
	private $filter_status = '';
	private $filter_geburtsjahr = '';
	private $filter_beitrittsjahr = '';
	private $filter_lizenz_kategorie = '';
	private $filter_lizenz_status = '';
	private $filter_lizenz_verein = '';
	private $filter_stammverein = '';
	private $filter_teameinteilung = '';
	private $filter_ablauf_ateil = '';
	private $filter_helfereinsatz = '';
	private $filter_funktionen = array();
	private $filter_ausbildung = '';
	private $filter_geschwister = '';
	private $filter_tenue_kategorie = '';
	private $filter_bezahlt_vor2 = '';
	private $filter_bezahlt_vor1 = '';
	private $filter_bezahlt_jetzt = '';
	
	
	public function getView() {
		$this->getHTML();
	}
	
	public function __construct() {
		$this->filter_status = $_POST['filter_status'];
		$this->filter_geburtsjahr = $_POST['filter_geburtsjahr'];
		$this->filter_beitrittsjahr = $_POST['filter_beitrittsjahr'];
		$this->filter_lizenz_kategorie = $_POST['filter_lizenz_kategorie'];
		$this->filter_lizenz_status = $_POST['filter_lizenz_status'];
		$this->filter_lizenz_verein = $_POST['filter_lizenz_verein'];
		$this->filter_stammverein = $_POST['filter_stammverein'];
		$this->filter_teameinteilung = $_POST['filter_teameinteilung'];
		$this->filter_ablauf_ateil= $_POST['filter_ablauf_ateil'];
		$this->filter_helfereinsatz = $_POST['filter_helfereinsatz'];
		$this->filter_funktionen = isset($_POST['filter_funktionen']) ? $_POST['filter_funktionen'] : $this->filter_funktionen;
		$this->filter_ausbildung = $_POST['filter_ausbildung'];
		$this->filter_geschwister = $_POST['filter_geschwister'];
		$this->filter_tenue_kategorie = $_POST['filter_tenue_kategorie'];
		$this->filter_bezahlt_vor2 = $_POST['filter_bezahlt_vor2'];
		$this->filter_bezahlt_vor1 = $_POST['filter_bezahlt_vor1'];
		$this->filter_bezahlt_jetzt = $_POST['filter_bezahlt_jetzt'];
		
		$this->link = Db::getConnection();
	}
	
	public function getHTML() {
		include('layout/members.tpl');
	}
}

?>