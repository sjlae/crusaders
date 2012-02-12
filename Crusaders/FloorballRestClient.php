<?php

class FloorballRestClient {
	private static $WS_URL = 'http://api.swissunihockey.ch/rest/v1.0';
	
	private static $WS_TEAM_GAMES_PATH = '/teams/<id>/games';
	private static $WS_TEAM_TABLE_PATH = '/teams/<id>/table';
	
	// Some globals
	private $apikey; // Not yet in Use
	
	/**
	 * Initialisiert die Klasse
	 * @param $apikey         Optional - API Schlüssel von swiss unihockey
	 */
	public function FloorballRestClient($apikey = '') {
		$this->apikey = $apikey;
	}
	
	/**
	 * Gibt alle Spiele für eine Mannschaft zurück
	 * @param  $teamid Team ID
	 * @return Array mit Spielen
	 */
	public function getTeamGames($teamid) {
		
		$path = str_replace('<id>', $teamid, self::$WS_TEAM_GAMES_PATH);
		$path .= '?limit=-1';
		$xml = $this->doRequest($path);
		
		if ($xml === false) {
			return false;
		}
		
		$games = array();

		foreach($xml->children() as $game) {
			$games[] = new Game($game);
		}

		return $games;
	}
	
	public function getLastTeamGames($teamid) {
		
		$path = str_replace('<id>', $teamid, self::$WS_TEAM_GAMES_PATH);
		$path .= '?status=played&limit=2&order=DESC';
		$xml = $this->doRequest($path);
		
		if ($xml === false) {
			return false;
		}
		
		$games = array();

		foreach($xml->children() as $game) {
			$games[] = new Game($game);
		}

		return $games;
	}

	/**
	 * Gibt die Tabelle für ein Team zurück
	 * @param  $teamid Team ID
	 * @return Array mit Tabelleneinträgen
	 */
	public function getTeamTable($teamid) {
		
		$path = str_replace('<id>', $teamid, self::$WS_TEAM_TABLE_PATH);
		$xml = $this->doRequest($path);
		
		if ($xml === false) {
			return false;
		}
		
		$table = array();
		
		foreach($xml->children() as $game) {
			$table[] = new Table($game);
		}
		
		return $table;
	}
	
	/**
	 * Führt die eigentliche Anfrage durch
	 */
	private function doRequest($path) {
		$url = self::$WS_URL.$path;

		// Curl initialisieren
		if (($curl = curl_init($url)) === false) {
			return false;
		}
		
		// Resultat zurückholen
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
		
		// Request ausführen
		if (($data = curl_exec($curl)) === false) {
			return false;
		}
		
		// Status OK?
		if (intval(curl_getinfo($curl, CURLINFO_HTTP_CODE)) != 200) {
			return false;
		}
		
		libxml_use_internal_errors(true);
		try {
			$xml = new SimpleXMLElement($data);
		} catch (Exception $e) {
			return false;
		}
		
		return $xml;
	}
}

class Data {
	function __construct($xml_node) {
		foreach($xml_node->attributes() as $k => $v) {
			$key = str_replace('-', '_', (string)$k);
			$val = (string)$v;

			if ($val == 'false')
				$val = false;
			elseif ($val == 'true')
				$val = true;
			else
				$val = utf8_decode($val);
			$this->{$key} = $val;
			foreach($xml_node->children() as $gym) {
				$this->gym = utf8_decode($gym);
			}
		}
	}
}

class Game extends Data {
	public $id;
	public $cup;
	public $round;
	public $date;
	public $time;
	public $hometeamid;
	public $awayteamid;
	public $hometeamname;
	public $awayteamname;
	public $goalshome = -1;
	public $goalsaway = -1;
	public $played = false;
	public $gym;
	
	function __construct($xml_node) {
		parent::__construct($xml_node);
		if ($this->goalshome > -1) {
			$played = true;
		}
	}
}

class Table extends Data {
	public $place;
	public $clubid;
	public $teamid;
	public $teamname;
	public $games;
	public $wins;
	public $wins_overtime;
	public $ties;
	public $defeats;
	public $defeats_overtime;
	public $goals_scored;
	public $goals_received;
	public $points;
	
	function __construct($xml_node) {
		parent::__construct($xml_node);
	}
}
