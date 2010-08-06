<?php
require_once('Page.php');
require_once('Datenbank/db.php');
require_once "Spreadsheet/Excel/Writer.php";

class Members extends HTMLPage implements Page{

	private $link = '';
	
	// Action
	private $action = '';
	
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
	private $filter_nachname = '';
	
	// Neuerfassung
	private $neu_name  = '';
	private $neu_vorname  = '';
	private $neu_adresse  = '';
	private $neu_plz  = '';
	private $neu_ort  = '';
	private $neu_geburtsdatum  = '';
	private $neu_telefon  = '';
	private $neu_mobile  = '';
	private $neu_mobile2  = '';
	private $neu_email  = '';
	private $neu_email2  = '';
	private $neu_beitrittsdatum  = '';
	private $neu_stammverein  = '';
	private $neu_teameinteilung  = '';
	private $neu_funktion1  = '';
	private $neu_funktion2  = '';
	private $neu_funktion3  = '';
	private $neu_ausbildung  = '';
	private $neu_geschwister  = '';
	
	// result
	private $result_array = array();
	
	public function getView() {
		$this->getHTML();
	}
	
	public function __construct() {
		$this->link = Db::getConnection();
		
		$this->action = isset($_POST['action']) ? $_POST['action'] : $this->action;
		
		if($this->action == 'reset'){
			return;
		}
		
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
		$this->filter_nachname = $_POST['filter_nachname'];
		
		if($this->action == 'search' || $this->action == 'excel'){
			$this->search();
		}
		
		else if($this->action == 'new'){
			$this->neu_name = $_POST['neu_name'];
			$this->neu_vorname = $_POST['neu_vorname'];
			$this->neu_adresse = $_POST['neu_adresse'];
			$this->neu_plz = $_POST['neu_plz'];
			$this->neu_ort = $_POST['neu_ort'];
			$this->neu_geburtsdatum = $_POST['neu_geburtsdatum'];
			$this->neu_telefon = $_POST['neu_telefon'];
			$this->neu_mobile = $_POST['neu_mobile'];
			$this->neu_mobile2 = $_POST['neu_mobile2'];
			$this->neu_email = $_POST['neu_email'];
			$this->neu_email2 = $_POST['neu_email2'];
			$this->neu_beitrittsdatum = $_POST['neu_beitrittsdatum'];
			$this->neu_stammverein = $_POST['neu_stammverein'];
			$this->neu_teameinteilung = $_POST['neu_teameinteilung'];
			$this->neu_funktion1 = $_POST['neu_funktion1'];
			$this->neu_funktion2 = $_POST['neu_funktion2'];
			$this->neu_funktion3 = $_POST['neu_funktion3'];
			$this->neu_ausbildung = $_POST['neu_ausbildung'];
			$this->neu_geschwister = $_POST['neu_geschwister'];
			
			$this->newEntry();
		}
		
		else if($this->action == 'save'){
			$this->save();
			$this->search();
		}
		
		else if($this->action == 'season'){
			$this->season();
			$this->search();
		}
	}
	
	private function season(){
		$abfrage = "Select * from members";
		
		$ergebnis = mysql_query($abfrage);
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$abfrage = "Update members set bezahlt_vor2='".$row['bezahlt_vor1']."', bezahlt_vor1='".$row['bezahlt_jetzt']."', bezahlt_jetzt='Nein' where id='".$row['id']."'";
			
			mysql_query($abfrage);
		}
		$_SESSION['infos'][] = "Die Datenbank wurde erfolgreich angepasst.";
	}
	
	private function save(){
		$id_array = $_POST['id'];
		for($i = 0; $i < count($_POST['id']); $i++){
			$id = $id_array[$i];
			
			if($_POST['name'.$i] == '' || $_POST['vorname'.$i] == ''
				|| $_POST['adresse'.$i] == '' || $_POST['plz'.$i] == ''
				|| $_POST['ort'.$i] == '' || $_POST['geburtsdatum'.$i] == ''
				|| $_POST['beitrittsdatum'.$i] == '' || $_POST['funktion1'.$i] == ''){
				$_SESSION['errors'][] = "Der Datensatz von ".$_POST['vorname'.$i]." ".$_POST['name'.$i]." enth&auml;lt noch nicht in allen n&ouml;tigen Felder (mit einem * versehen) einen Wert und wurde nicht gespeichert.";
			}
			
			else{
				$ablauf_ateil = $_POST['ablauf_ateil'.$i] != '' ? date('Y-m-d', strtotime($_POST['ablauf_ateil'.$i])) : ' ';
				$abfrage = "Update members set 	status='".$_POST['status'.$i]."',
											 	name='".$_POST['name'.$i]."',
												vorname='".$_POST['vorname'.$i]."',
												adresse='".$_POST['adresse'.$i]."',
												plz='".$_POST['plz'.$i]."',  
												ort='".$_POST['ort'.$i]."',  
												geburtsdatum='".date('Y-m-d', strtotime($_POST['geburtsdatum'.$i]))."',  
												telefon='".$_POST['telefon'.$i]."',  
												mobile='".$_POST['mobile'.$i]."',  
												mobile2='".$_POST['mobile2'.$i]."',  
												email='".$_POST['email'.$i]."',  
												email2='".$_POST['email2'.$i]."',  
												beitrittsdatum='".date('Y-m-d', strtotime($_POST['beitrittsdatum'.$i]))."',  
												lizenz_kategorie='".$_POST['lizenz_kategorie'.$i]."',  
												lizenz_nummer='".$_POST['lizenz_nummer'.$i]."',  
												lizenz_status='".$_POST['lizenz_status'.$i]."',  
												lizenz_verein='".$_POST['lizenz_verein'.$i]."',  
												stammverein='".$_POST['stammverein'.$i]."',  
												teameinteilung='".$_POST['teameinteilung'.$i]."',  
												ablauf_ateil='".$ablauf_ateil."',  
												helfereinsatz='".$_POST['helfereinsatz'.$i]."',  
												funktion1='".$_POST['funktion1'.$i]."',  
												funktion2='".$_POST['funktion2'.$i]."',  
												funktion3='".$_POST['funktion3'.$i]."',  
												ausbildung='".$_POST['ausbildung'.$i]."',  
												geschwister='".$_POST['geschwister'.$i]."',  
												tenue_kategorie='".$_POST['tenue_kategorie'.$i]."',  
												tenue_nummer='".$_POST['tenue_nummer'.$i]."',  
												bezahlt_vor2='".$_POST['bezahlt_vor2'.$i]."',  
												bezahlt_vor1='".$_POST['bezahlt_vor1'.$i]."',  
												bezahlt_jetzt='".$_POST['bezahlt_jetzt'.$i]."' 
				
												where id=$id";
				mysql_query($abfrage);
				$_SESSION['infos'][] = "Der Datensatz von ".$_POST['vorname'.$i]." ".$_POST['name'.$i]." wurde erfolgreich gespeichert.";
			}
		}
	}
	
	private function newEntry(){
		$insert_geburtsdatum = date('Y-m-d', strtotime($this->neu_geburtsdatum));
		$insert_beitrittsdatum = date('Y-m-d', strtotime($this->neu_beitrittsdatum));

		if($this->neu_name == '' || $this->neu_vorname == ''
			|| $this->neu_adresse == '' || $this->neu_plz == ''
			|| $this->neu_ort == '' || $this->neu_geburtsdatum == ''
			|| $this->neu_beitrittsdatum == '' || $this->neu_funktion1 == ''){
			$_SESSION['errors'][] = "Es enthalten noch nicht alle n&ouml;tigen Felder (mit einem * versehen) einen Wert.";
			return;
		}
		
		$query = sprintf("Insert into members(status, name, vorname, adresse, plz, ort, geburtsdatum, telefon, mobile, mobile2, email, email2,  beitrittsdatum, lizenz_kategorie, lizenz_nummer, lizenz_status, lizenz_verein, stammverein, teameinteilung, ablauf_ateil, helfereinsatz, funktion1, funktion2, funktion3, ausbildung, geschwister, tenue_kategorie, tenue_nummer, bezahlt_vor2, bezahlt_vor1, bezahlt_jetzt) 
									   values('Aktiv', '$this->neu_name', '$this->neu_vorname', '$this->neu_adresse', '$this->neu_plz', '$this->neu_ort', '$insert_geburtsdatum', '$this->neu_telefon', '$this->neu_mobile', '$this->neu_mobile2', '$this->neu_email', '$this->neu_email2', '$insert_beitrittsdatum', '', '', 'Pendent', '', '$this->neu_stammverein', '$this->neu_teameinteilung', '', 'Ja', '$this->neu_funktion1', '$this->neu_funktion2', '$this->neu_funktion3', '$this->neu_ausbildung', '$this->neu_geschwister', '', '', '', '', 'Nein')");

		mysql_query($query,$this->link);
		
		$this->neu_name = '';
		$this->neu_vorname = '';
		$this->neu_adresse = '';
		$this->neu_plz = '';
		$this->neu_ort = '';
		$this->neu_geburtsdatum = '';
		$this->neu_telefon = '';
		$this->neu_mobile = '';
		$this->neu_mobile2 = '';
		$this->neu_email = '';
		$this->neu_email2 = '';
		$this->neu_beitrittsdatum = '';
		$this->neu_stammverein = '';
		$this->neu_teameinteilung = '';
		$this->neu_funktion1 = '';
		$this->neu_funktion2 = '';
		$this->neu_funktion3 = '';
		$this->neu_ausbildung = '';
		$this->neu_geschwister = '';
		$_SESSION['infos'][] = "Der neue Datensatz wurde erfolgreich gespeichert.";
	}
	
	private function search(){
		$sql_status 		= $this->filter_status != '' ? $this->filter_status : '%';
		$sql_geb_jahr 		= $this->filter_geburtsjahr != '' ? $this->filter_geburtsjahr.'%' : '%';
		$sql_beitritts_jahr	= $this->filter_beitrittsjahr != '' ? $this->filter_beitrittsjahr.'%' : '%';
		$sql_lizenz_kat		= $this->filter_lizenz_kategorie != '' ? $this->filter_lizenz_kategorie : '%';
		$sql_lizenz_status	= $this->filter_lizenz_status != '' ? $this->filter_lizenz_status : '%';
		$sql_lizenz_verein	= $this->filter_lizenz_verein != '' ? $this->filter_lizenz_verein : '%';
		$sql_stammverein	= $this->filter_stammverein != '' ? $this->filter_stammverein : '%';
		$sql_teameinteilung	= $this->filter_teameinteilung != '' ? $this->filter_teameinteilung : '%';
		$sql_ablauf_ateil	= $this->filter_ablauf_ateil != '' ? $this->filter_ablauf_ateil.'%' : '%';
		if($this->filter_ablauf_ateil == 'Leer'){
			$sql_ablauf_ateil	= '';
		}
		$sql_helfereinsatz	= $this->filter_helfereinsatz != '' ? $this->filter_helfereinsatz : '%';
		
		$sql_funktion1		= isset($this->filter_funktionen[0]) ? $this->filter_funktionen[0] : '%';
		$sql_funktion2		= isset($this->filter_funktionen[1]) ? $this->filter_funktionen[1] : ' ';
		$sql_funktion3		= isset($this->filter_funktionen[2]) ? $this->filter_funktionen[2] : ' ';
		$sql_funktion4		= isset($this->filter_funktionen[3]) ? $this->filter_funktionen[3] : ' ';
		$sql_funktion5		= isset($this->filter_funktionen[4]) ? $this->filter_funktionen[4] : ' ';
		$sql_funktion6		= isset($this->filter_funktionen[5]) ? $this->filter_funktionen[5] : ' ';
		
		$sql_ausbildung		= $this->filter_ausbildung != '' ? $this->filter_ausbildung : '%';
		$sql_geschwister	= $this->filter_geschwister != '' ? $this->filter_geschwister : '%';
		$sql_tenue_kat		= $this->filter_tenue_kategorie != '' ? $this->filter_tenue_kategorie : '%';
		$sql_bezahlt_2		= $this->filter_bezahlt_vor2 != '' ? $this->filter_bezahlt_vor2 : '%';
		if($this->filter_bezahlt_vor2 == 'Leer'){
			$sql_bezahlt_2	= '';
		}
		$sql_bezahlt_1		= $this->filter_bezahlt_vor1 != '' ? $this->filter_bezahlt_vor1 : '%';
		if($this->filter_bezahlt_vor1 == 'Leer'){
			$sql_bezahlt_1	= '';
		}
		$sql_bezahlt_jetzt	= $this->filter_bezahlt_jetzt != '' ? $this->filter_bezahlt_jetzt : '%';
		if($this->filter_bezahlt_jetzt == 'Leer'){
			$sql_bezahlt_jetzt	= '';
		}
		$sql_nachname		= $this->filter_nachname != '' ? '%'.$this->filter_nachname.'%' : '%';
		
		$abfrage = "Select * from members where status LIKE '$sql_status' AND 
												geburtsdatum LIKE '$sql_geb_jahr' AND
												beitrittsdatum LIKE '$sql_beitritts_jahr' AND
												lizenz_kategorie LIKE '$sql_lizenz_kat' AND 
												lizenz_status LIKE '$sql_lizenz_status' AND 
												lizenz_verein LIKE '$sql_lizenz_verein' AND
												stammverein LIKE '$sql_stammverein' AND
												teameinteilung LIKE '$sql_teameinteilung' AND
												ablauf_ateil LIKE '$sql_ablauf_ateil' AND
												helfereinsatz LIKE '$sql_helfereinsatz' AND
												((funktion1 LIKE '$sql_funktion1' OR funktion2 LIKE '$sql_funktion1' OR funktion3 LIKE '$sql_funktion1') OR
												(funktion1 LIKE '$sql_funktion2' OR funktion2 LIKE '$sql_funktion2' OR funktion3 LIKE '$sql_funktion2') OR
												(funktion1 LIKE '$sql_funktion3' OR funktion2 LIKE '$sql_funktion3' OR funktion3 LIKE '$sql_funktion3') OR
												(funktion1 LIKE '$sql_funktion4' OR funktion2 LIKE '$sql_funktion4' OR funktion3 LIKE '$sql_funktion4') OR
												(funktion1 LIKE '$sql_funktion5' OR funktion2 LIKE '$sql_funktion5' OR funktion3 LIKE '$sql_funktion5') OR
												(funktion1 LIKE '$sql_funktion6' OR funktion2 LIKE '$sql_funktion6' OR funktion3 LIKE '$sql_funktion6')) AND
												ausbildung LIKE '$sql_ausbildung' AND 
												geschwister LIKE '$sql_geschwister' AND
												tenue_kategorie LIKE '$sql_tenue_kat' AND
												bezahlt_vor2 LIKE '$sql_bezahlt_2' AND 
												bezahlt_vor1 LIKE '$sql_bezahlt_1' AND
												bezahlt_jetzt LIKE '$sql_bezahlt_jetzt' AND
												name LIKE '$sql_nachname' order by name";
		$ergebnis = mysql_query($abfrage);
		$counter = 0;
		
		if($this->action == 'excel'){
			$xls =& new Spreadsheet_Excel_Writer();
			$xls->send("Export.xls");
			$sheet =& $xls->addWorksheet('Export');
			
			$format =& $xls->addFormat();
  			$format->setBold();
			
			$sheet->write($counter, 0, 'Status', $format);
			$sheet->write($counter, 1, 'Name', $format);
			$sheet->write($counter, 2, 'Vorname', $format);
			$sheet->write($counter, 3, 'Adresse', $format);
			$sheet->write($counter, 4, 'PLZ', $format);
			$sheet->write($counter, 5, 'Ort', $format);
			$sheet->write($counter, 6, 'Geburtsdatum', $format);
			$sheet->write($counter, 7, 'Telefon', $format);
			$sheet->write($counter, 8, 'Mobile', $format);
			$sheet->write($counter, 9, 'Mobile 2', $format);
			$sheet->write($counter, 10, 'E-Mail', $format);
			$sheet->write($counter, 11, 'E-Mail 2', $format);
			$sheet->write($counter, 12, 'Beitrittsdatum', $format);
			$sheet->write($counter, 13, 'Lizenz-Kat.', $format);
			$sheet->write($counter, 14, 'Lizenz-Nr.', $format);
			$sheet->write($counter, 15, 'Lizenz-Status', $format);
			$sheet->write($counter, 16, 'Lizenz bei', $format);
			$sheet->write($counter, 17, 'Stammverein', $format);
			$sheet->write($counter, 18, 'Teameinteilung', $format);
			$sheet->write($counter, 19, 'Ablauf A-Teil', $format);
			$sheet->write($counter, 20, 'Helfereinsatz', $format);
			$sheet->write($counter, 21, 'Funktion 1', $format);
			$sheet->write($counter, 22, 'Funktion 2', $format);
			$sheet->write($counter, 23, 'Funktion 3', $format);
			$sheet->write($counter, 24, 'In Ausbildung', $format);
			$sheet->write($counter, 25, 'Geschwister', $format);
			$sheet->write($counter, 26, 'Tenue Kat.', $format);
			$sheet->write($counter, 27, 'Tenue Nr.', $format);
			$sheet->write($counter, 28, 'Bez. vor 2', $format);
			$sheet->write($counter, 29, 'Bez. vor 1', $format);
			$sheet->write($counter, 30, 'Bez. aktuell', $format);
		}
		
		while($row = mysql_fetch_assoc($ergebnis))
		{
			$this->result_array[$counter]['id'] = $row['id'];
			$this->result_array[$counter]['status'] = $row['status'];
			$this->result_array[$counter]['name'] = $row['name'];
			$this->result_array[$counter]['vorname'] = $row['vorname'];
			$this->result_array[$counter]['adresse'] = $row['adresse'];
			$this->result_array[$counter]['plz'] = $row['plz'];
			$this->result_array[$counter]['ort'] = $row['ort'];
			$this->result_array[$counter]['geburtsdatum'] = $row['geburtsdatum'] != 0000-00-00 ? date('d.m.Y', strtotime($row['geburtsdatum'])) : '';
			$this->result_array[$counter]['telefon'] = $row['telefon'];
			$this->result_array[$counter]['mobile'] = $row['mobile'];
			$this->result_array[$counter]['mobile2'] = $row['mobile2'];
			$this->result_array[$counter]['email'] = $row['email'];
			$this->result_array[$counter]['email2'] = $row['email2'];
			$this->result_array[$counter]['beitrittsdatum'] = $row['beitrittsdatum'] != 0000-00-00 ? date('d.m.Y', strtotime($row['beitrittsdatum'])) : '';
			$this->result_array[$counter]['lizenz_kategorie'] = $row['lizenz_kategorie'];
			$this->result_array[$counter]['lizenz_nummer'] = $row['lizenz_nummer'];
			$this->result_array[$counter]['lizenz_status'] = $row['lizenz_status'];
			$this->result_array[$counter]['lizenz_verein'] = $row['lizenz_verein'];
			$this->result_array[$counter]['stammverein'] = $row['stammverein'];
			$this->result_array[$counter]['teameinteilung'] = $row['teameinteilung'];
			$this->result_array[$counter]['ablauf_ateil'] = $row['ablauf_ateil'] != 0000-00-00 ? date('d.m.Y', strtotime($row['ablauf_ateil'])) : '';
			$this->result_array[$counter]['helfereinsatz'] = $row['helfereinsatz'];
			$this->result_array[$counter]['funktion1'] = $row['funktion1'];
			$this->result_array[$counter]['funktion2'] = $row['funktion2'];
			$this->result_array[$counter]['funktion3'] = $row['funktion3'];
			$this->result_array[$counter]['ausbildung'] = $row['ausbildung'];
			$this->result_array[$counter]['geschwister'] = $row['geschwister'];
			$this->result_array[$counter]['tenue_kategorie'] = $row['tenue_kategorie'];
			$this->result_array[$counter]['tenue_nummer'] = $row['tenue_nummer'];
			$this->result_array[$counter]['bezahlt_vor2'] = $row['bezahlt_vor2'];
			$this->result_array[$counter]['bezahlt_vor1'] = $row['bezahlt_vor1'];
			$this->result_array[$counter]['bezahlt_jetzt'] = $row['bezahlt_jetzt'];

			if($this->action == 'excel'){
				$sheet->write($counter + 1, 0, utf8_decode($this->result_array[$counter]['status']));
				$sheet->write($counter + 1, 1, utf8_decode($this->result_array[$counter]['name']));
				$sheet->write($counter + 1, 2, utf8_decode($this->result_array[$counter]['vorname']));
				$sheet->write($counter + 1, 3, utf8_decode($this->result_array[$counter]['adresse']));
				$sheet->write($counter + 1, 4, utf8_decode($this->result_array[$counter]['plz']));
				$sheet->write($counter + 1, 5, utf8_decode($this->result_array[$counter]['ort']));
				$sheet->write($counter + 1, 6, utf8_decode($this->result_array[$counter]['geburtsdatum']));
				$sheet->write($counter + 1, 7, utf8_decode($this->result_array[$counter]['telefon']));
				$sheet->write($counter + 1, 8, utf8_decode($this->result_array[$counter]['mobile']));
				$sheet->write($counter + 1, 9, utf8_decode($this->result_array[$counter]['mobile2']));
				$sheet->write($counter + 1, 10, utf8_decode($this->result_array[$counter]['email']));
				$sheet->write($counter + 1, 11, utf8_decode($this->result_array[$counter]['email2']));
				$sheet->write($counter + 1, 12, utf8_decode($this->result_array[$counter]['beitrittsdatum']));
				$sheet->write($counter + 1, 13, utf8_decode($this->result_array[$counter]['lizenz_kategorie']));
				$sheet->write($counter + 1, 14, utf8_decode($this->result_array[$counter]['lizenz_nummer']));
				$sheet->write($counter + 1, 15, utf8_decode($this->result_array[$counter]['lizenz_status']));
				$sheet->write($counter + 1, 16, utf8_decode($this->result_array[$counter]['lizenz_verein']));
				$sheet->write($counter + 1, 17, utf8_decode($this->result_array[$counter]['stammverein']));
				$sheet->write($counter + 1, 18, utf8_decode($this->result_array[$counter]['teameinteilung']));
				$sheet->write($counter + 1, 19, utf8_decode($this->result_array[$counter]['ablauf_ateil']));
				$sheet->write($counter + 1, 20, utf8_decode($this->result_array[$counter]['helfereinsatz']));
				$sheet->write($counter + 1, 21, utf8_decode($this->result_array[$counter]['funktion1']));
				$sheet->write($counter + 1, 22, utf8_decode($this->result_array[$counter]['funktion2']));
				$sheet->write($counter + 1, 23, utf8_decode($this->result_array[$counter]['funktion3']));
				$sheet->write($counter + 1, 24, utf8_decode($this->result_array[$counter]['ausbildung']));
				$sheet->write($counter + 1, 25, utf8_decode($this->result_array[$counter]['geschwister']));
				$sheet->write($counter + 1, 26, utf8_decode($this->result_array[$counter]['tenue_kategorie']));
				$sheet->write($counter + 1, 27, utf8_decode($this->result_array[$counter]['tenue_nummer']));
				$sheet->write($counter + 1, 28, utf8_decode($this->result_array[$counter]['bezahlt_vor2']));
				$sheet->write($counter + 1, 29, utf8_decode($this->result_array[$counter]['bezahlt_vor1']));
				$sheet->write($counter + 1, 30, utf8_decode($this->result_array[$counter]['bezahlt_jetzt']));
			}
			
			$counter++;
		}
		
		if($this->action == 'excel'){
			$xls->close();
		}
	}
	
	public function getHTML() {
		include('layout/members.tpl');
	}
}

?>