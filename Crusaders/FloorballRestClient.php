<?php

class FloorballRestClient {
	private static $WS_URL = 'http://api.swissunihockey.ch/rest/v1.0';
	
	private static $WS_TEAM_GAMES_PATH = '/teams/<id>/games';
	private static $WS_TEAM_TABLE_PATH = '/teams/<id>/table';
	private static $WS_LEAGUE_GAMES_PATH = '/leagues/<league>/groups/<group>/games';
	private static $WS_LEAGUE_TABLE_PATH = '/leagues/<league>/groups/<group>/table';
	
	// Some globals
	private $apikey; // Not yet in Use
	private $season;
	
	/**
	 * Initialisiert die Klasse
	 * @param $apikey         Optional - API Schlüssel von swiss unihockey
	 * @param $default_season Optional - Standardsaison für alle Request
	 */
	public function FloorballRestClient($apikey = '', $default_season = -1) {
		if ($season < 0) {
			$season = date('Y');
			// Wenn Monat noch bis Juli, dann noch alte Saison verwenden
			if (date('n') <= 7) {
				$season--;
			}
		}
		$this->apikey = $apikey;
		$this->season = $default_season;
	}
	
	/**
	 * Gibt alle Spiele für eine Mannschaft zurück
	 * @param  $teamid Team ID
	 * @param  $season Optional - Saison
	 * @return Array mit Spielen
	 */
	public function getTeamGames($teamid, $season = -1) {
		
		$path = str_replace('<id>', $teamid, self::$WS_TEAM_GAMES_PATH);
		$xml = $this->doRequest($path, $season);
		
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
	 * @param  $season Optional - Saison
	 * @return Array mit Tabelleneinträgen
	 */
	public function getTeamTable($teamid, $season = -1) {
		
		$path = str_replace('<id>', $teamid, self::$WS_TEAM_TABLE_PATH);
		$xml = $this->doRequest($path, $season);
		
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
	 * Gibt alle Spiele für eine Liga/Gruppe
	 * @param  $league Liga-Code
	 * @param  $group  Gruppe
	 * @param  $season Optional - Saison
	 * @return Array mit Spielen
	 */
	public function getLeagueGames($league, $group, $season = -1) {
		
		$path = str_replace(array('<league>', '<group>'), array($league, $group), 
			self::$WS_LEAGUE_GAMES_PATH);
		$xml = $this->doRequest($path, $season);
		
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
	 * @param  $league Liga-Code
	 * @param  $group  Gruppe
	 * @param  $season Optional - Saison
	 * @return Array mit Tabelleneinträgen
	 */
	public function getLeagueTable($league, $group, $season = -1) {
		
		$path = str_replace(array('<league>', '<group>'), array($league, $group), 
			self::$WS_LEAGUE_TABLE_PATH);
		$xml = $this->doRequest($path, $season);
		
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
	private function doRequest($path, $season) {
		$url = self::$WS_URL.$path;
		if ($season > -1) 
			$url .= '?season='.$season;
		elseif ($this->season > -1)
			$url .= '?season='.$this->season;
		
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
	
	function __construct($xml_node) {
		parent::__construct($xml_node);
		if ($goalshome > -1) {
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
