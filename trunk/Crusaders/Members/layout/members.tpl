<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
	<head>
		<title>Mitglieder-Datenbank</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="content-language" content="de" />
		<meta name="language" content="de" />
		
		<script type="text/javascript" src="script/js_functions.js"></script>
	</head>
	<body id="body">
		<h3>Filteroptionen</h3>
		<form action="index.php?go=members" method="POST">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
						Status:
					</td>
					<td style="padding-left: 5px">
						<select name="filter_status">
							<option value=""></option>
					      	<option value="Aktiv" <?php if($this->filter_status == Aktiv){ echo selected; } ?>>Aktiv</option>
					      	<option value="Deaktiviert" <?php if($this->filter_status == Deaktiviert){ echo selected; } ?>>Deaktiviert</option>
					    </select>
					</td>
					
					<td style="padding-left: 15px">
						Geburtsjahr:
					</td>
					
					<?php 
						$actualYear = date(Y); 
					?> 
					
					<td style="padding-left: 5px">
						<select name="filter_geburtsjahr">
					      		<option value=""></option>
					      <?php
					      	for($i = 0; $i < 100; $i++){ 
					      ?>
					      		<option value="<?php echo $actualYear - $i ?>" <?php if($this->filter_geburtsjahr == $actualYear - $i){ echo selected; } ?>><?php echo $actualYear - $i ?></option>
					      <?php
					      	}
					      ?>
					    </select>
					</td>
					
					<td style="padding-left: 15px">
						Beitrittsjahr:
					</td>
					
					<td style="padding-left: 5px">
						<select name="filter_beitrittsjahr">
					      		<option value=""></option>
					      <?php
					      	for($i = $actualYear; $i >= 1995; $i--){ 
					      ?>
					      		<option value="<?php echo $i ?>" <?php if($this->filter_beitrittsjahr == $i){ echo selected; } ?>><?php echo $i ?></option>
					      <?php
					      	}
					      ?>
					    </select>
					</td>
					
					<td style="padding-left: 15px">
						Lizenz-Kategorie:
					</td>
					
					<td style="padding-left: 5px">
						<select name="filter_lizenz_kategorie">
					      		<option value=""></option>
					      	<?php
								$teamArray = Teams::getTeams();
								for($i = 0; $i < count($teamArray); $i++) {
							?>
									<option value="<?php echo $teamArray[$i]['teamid'] ?>" <?php if($this->filter_lizenz_kategorie == $teamArray[$i]['teamid']){ echo selected; } ?>><?php echo $teamArray[$i]['teamname'] ?></option>
							<?php
								} 
							?>
					    </select>
					</td>
					
					<td style="padding-left: 15px">
						Lizenz-Status:
					</td>
					
					<td style="padding-left: 5px">
						<select name="filter_lizenz_status">
					      	<option value=""></option>
					      	<option value="Ok" <?php if($this->filter_lizenz_status == Ok){ echo selected; } ?>>Ok</option>
					      	<option value="Pendent" <?php if($this->filter_lizenz_status == Pendent){ echo selected; } ?>>Pendent</option>
					      	<option value="Deaktiviert" <?php if($this->filter_lizenz_status == Deaktiviert){ echo selected; } ?>>Deaktiviert</option>
					      	<option value="Keine" <?php if($this->filter_lizenz_status == Keine){ echo selected; } ?>>Keine</option>
					    </select>
					</td>
				</tr>
				
				<tr>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td>
						Lizenz bei:
					</td>
					<td style="padding-left: 5px">
						<select name="filter_lizenz_verein">
							<option value=""></option>
					      	<option value="Crusaders" <?php if($this->filter_lizenz_verein == Crusaders){ echo selected; } ?>>Crusaders</option>
					      	<option value="Adliswil" <?php if($this->filter_lizenz_verein == Adliswil){ echo selected; } ?>>Adliswil</option>
					    </select>
					</td>
					
					<td style="padding-left: 15px">
						Stammverein:
					</td>
					
					<td style="padding-left: 5px">
						<select name="filter_stammverein">
					    	<option value=""></option>
					      	<option value="Crusaders" <?php if($this->filter_stammverein == Crusaders){ echo selected; } ?>>Crusaders</option>
					      	<option value="Adliswil" <?php if($this->filter_stammverein == Adliswil){ echo selected; } ?>>Adliswil</option>
					    </select>
					</td>
					
					<td style="padding-left: 15px">
						Teameinteilung:
					</td>
					
					<td style="padding-left: 5px">
						<select name="filter_teameinteilung">
					      		<option value=""></option>
					      <?php
								$teamArray = Teams::getTeams();
								for($i = 0; $i < count($teamArray); $i++) {
							?>
									<option value="<?php echo $teamArray[$i]['teamid'] ?>" <?php if($this->filter_teameinteilung == $teamArray[$i]['teamid']){ echo selected; } ?>><?php echo $teamArray[$i]['teamname'] ?></option>
							<?php
								} 
							?>
					    </select>
					</td>
					
					<td style="padding-left: 15px">
						Ablauf A-Teil:
					</td>
					
					<td style="padding-left: 5px">
						<select name="filter_ablauf_ateil">
					      		<option value=""></option>
					      	<?php
								for($i = $actualYear; $i <= $actualYear + 6; $i++) {
							?>
									<option value="<?php echo $i ?>" <?php if($this->filter_ablauf_ateil == $i){ echo selected; } ?>><?php echo $i ?></option>
							<?php
								} 
							?>
					    </select>
					</td>
					
					<td style="padding-left: 15px">
						Helfer-Einsatz:
					</td>
					
					<td style="padding-left: 5px">
						<select name="filter_helfereinsatz">
					      	<option value=""></option>
					      	<option value="Ja" <?php if($this->filter_helfereinsatz == Ja){ echo selected; } ?>>Ja</option>
					      	<option value="Nein" <?php if($this->filter_helfereinsatz == Nein){ echo selected; } ?>>Nein</option>
					    </select>
					</td>
				</tr>
				
				<tr>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td valign="top">
						Funktion(en):
					</td>
					<td style="padding-left: 5px">
						<select name="filter_funktionen[]" size="5" multiple>
					    	<option value="Vorstand" <?php if(in_array('Vorstand', $this->filter_funktionen) != false){ echo selected; } ?>>Vorstand</option>
					    	<option value="Trainer" <?php if(in_array('Trainer', $this->filter_funktionen) != false){ echo selected; } ?>>Trainer</option>
					    	<option value="Runden-OK" <?php if(in_array('Runden-OK', $this->filter_funktionen) != false){ echo selected; } ?>>Runden-OK</option>
					    	<option value="Schiedsrichter" <?php if(in_array('Schiedsrichter', $this->filter_funktionen) != false){ echo selected; } ?>>Schiedsrichter</option>
					    	<option value="Spieler" <?php if(in_array('Spieler', $this->filter_funktionen) != false){ echo selected; } ?>>Spieler</option>
					    </select>
	
					</td>
					
					<td style="padding-left: 15px" valign="top">
						In Ausbildung:
					</td>
					
					<td style="padding-left: 5px" valign="top">
						<select name="filter_ausbildung">
					    	<option value=""></option>
					      	<option value="Ja" <?php if($this->filter_ausbildung == Ja){ echo selected; } ?>>Ja</option>
					      	<option value="Nein" <?php if($this->filter_ausbildung == Nein){ echo selected; } ?>>Nein</option>
					    </select>
					</td>
					
					<td style="padding-left: 15px" valign="top">
						Geschwister im Club:
					</td>
					
					<td style="padding-left: 5px" valign="top">
						<select name="filter_geschwister">
					    	<option value=""></option>
					      	<option value="Ja" <?php if($this->filter_geschwister == Ja){ echo selected; } ?>>Ja</option>
					      	<option value="Nein" <?php if($this->filter_geschwister == Nein){ echo selected; } ?>>Nein</option>
					    </select>
					</td>
					
					<td style="padding-left: 15px" valign="top">
						Tenue-Kategorie:
					</td>
					
					<td style="padding-left: 5px" valign="top">
						<select name="filter_tenue_kategorie">
					    	<option value=""></option>
					      	<option value="Herren" <?php if($this->filter_tenue_kategorie == Herren){ echo selected; } ?>>Herren</option>
					      	<option value="Damen" <?php if($this->filter_tenue_kategorie == Damen){ echo selected; } ?>>Damen</option>
					      	<option value="Junioren" <?php if($this->filter_tenue_kategorie == Junioren){ echo selected; } ?>>Junioren</option>
					    </select>
					</td>
				</tr>
				
				<tr>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td>
						Bezahlt vor 2 Jahren:
					</td>
					
					<td style="padding-left: 5px">
						<select name="filter_bezahlt_vor2">
					      	<option value=""></option>
					      	<option value="Ja" <?php if($this->filter_bezahlt_vor2 == Ja){ echo selected; } ?>>Ja</option>
					      	<option value="Nein" <?php if($this->filter_bezahlt_vor2 == Nein){ echo selected; } ?>>Nein</option>
					    </select>
					</td>
					
					<td style="padding-left: 15px" valign="top">
						Bezahlt vor 1 Jahr:
					</td>
					
					<td style="padding-left: 5px">
						<select name="filter_bezahlt_vor1">
					      	<option value=""></option>
					      	<option value="Ja" <?php if($this->filter_bezahlt_vor1 == Ja){ echo selected; } ?>>Ja</option>
					      	<option value="Nein" <?php if($this->filter_bezahlt_vor1 == Nein){ echo selected; } ?>>Nein</option>
					    </select>
					</td>
					
					<td style="padding-left: 15px" valign="top">
						Bezahlt aktuelles Jahr:
					</td>
					
					<td style="padding-left: 5px">
						<select name="filter_bezahlt_jetzt">
					      	<option value=""></option>
					      	<option value="Ja" <?php if($this->filter_bezahlt_jetzt == Ja){ echo selected; } ?>>Ja</option>
					      	<option value="Nein" <?php if($this->filter_bezahlt_jetzt == Nein){ echo selected; } ?>>Nein</option>
					    </select>
					</td>
					
					<td colspan="3">&nbsp;</td>
					
					<td align="right">
						<input type="button" value="Filter L&ouml;schen" onclick="document.forms[1].submit()"/>
						&nbsp;&nbsp;
						<input type="submit" value="Suchen""/>
					</td>
				</tr>
				
				<tr>
					<td colspan="10">
						<hr/>
					</td>
				</tr>
			</table>
		</form>
		<form action="index.php?go=members" method="POST" id="reset" name="reset"/>
	</body>
</html>