<?php

class Constants{
	
	public static $teamArray = array();
	
	public static function getTeams(){
		Constants::$teamArray[size] = "9";
		
		// Herren GF 3. Liga
		Constants::$teamArray[0][0]="Herren GF 3. Liga";
		Constants::$teamArray[0][1]="115";
		Constants::$teamArray[0][2]="9";
		Constants::$teamArray[0][3]="Crusaders 95";
		
		// Damen KF 2. Liga
		Constants::$teamArray[1][0]="Damen KF 2. Liga";
		Constants::$teamArray[1][1]="224";
		Constants::$teamArray[1][2]="9";
		Constants::$teamArray[1][3]="Crusaders 95";
		
		// A-Juniorinnen
		Constants::$teamArray[2][0]="A-Juniorinnen";
		Constants::$teamArray[2][1]="414";
		Constants::$teamArray[2][2]="";
		Constants::$teamArray[2][3]="Crusaders 95";
		
		// U18
		Constants::$teamArray[3][0]="U18";
		Constants::$teamArray[3][1]="184";
		Constants::$teamArray[3][2]="3";
		Constants::$teamArray[3][3]="Crusaders 95";
		
		// U16
		Constants::$teamArray[4][0]="U16";
		Constants::$teamArray[4][1]="164";
		Constants::$teamArray[4][2]="4";
		Constants::$teamArray[4][3]="THS Adliswil";
		
		// B-Junioren
		Constants::$teamArray[5][0]="B-Junioren";
		Constants::$teamArray[5][1]="324";
		Constants::$teamArray[5][2]="9";
		Constants::$teamArray[5][3]="THS Adliswil";
		
		// D-Junioren I
		Constants::$teamArray[6][0]="D-Junioren I";
		Constants::$teamArray[6][1]="344";
		Constants::$teamArray[6][2]="14";
		Constants::$teamArray[6][3]="Crusaders 95";
		
		// D-Junioren II
		Constants::$teamArray[7][0]="D-Junioren II";
		Constants::$teamArray[7][1]="344";
		Constants::$teamArray[7][2]="15";
		Constants::$teamArray[7][3]="Crusaders 95";
		
		// E-Junioren
		Constants::$teamArray[8][0]="E-Junioren";
		Constants::$teamArray[8][1]="354";
		Constants::$teamArray[8][2]="7";
		Constants::$teamArray[8][3]="Crusaders 95";
		
		return Constants::$teamArray;
	}
}

?>