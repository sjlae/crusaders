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
		<?php require_once('Layout/infos.tpl'); ?>
		<?php require_once('Layout/errors.tpl'); ?>
		<?php $teamArray = Teams::getTeamsMember(); ?>
		<h3>Filteroptionen</h3>
		<form action="index.php?go=members" method="POST">
			<input type="hidden" name="action" value="search" id="action"/>
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
								for($i = 0; $i < count($teamArray); $i++) {
							?>
									<option value="<?php echo $teamArray[$i]['teamname'] ?>" <?php if($this->filter_lizenz_kategorie == $teamArray[$i]['teamname']){ echo selected; } ?>><?php echo $teamArray[$i]['teamname'] ?></option>
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
								for($i = 0; $i < count($teamArray); $i++) {
							?>
									<option value="<?php echo $teamArray[$i]['teamname'] ?>" <?php if($this->filter_teameinteilung == $teamArray[$i]['teamname']){ echo selected; } ?>><?php echo $teamArray[$i]['teamname'] ?></option>
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
								<option value="Leer" <?php if($this->filter_ablauf_ateil == Leer){ echo selected; } ?>>Leer</option>
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
						<select name="filter_funktionen[]" size="6" multiple>
					    	<option value="Vorstand" <?php if(in_array('Vorstand', $this->filter_funktionen) != false){ echo selected; } ?>>Vorstand</option>
					    	<option value="Trainer" <?php if(in_array('Trainer', $this->filter_funktionen) != false){ echo selected; } ?>>Trainer</option>
					    	<option value="Runden-OK" <?php if(in_array('Runden-OK', $this->filter_funktionen) != false){ echo selected; } ?>>Runden-OK</option>
					    	<option value="Schiedsrichter" <?php if(in_array('Schiedsrichter', $this->filter_funktionen) != false){ echo selected; } ?>>Schiedsrichter</option>
					    	<option value="Spieler" <?php if(in_array('Spieler', $this->filter_funktionen) != false){ echo selected; } ?>>Spieler</option>
					    	<option value="Goalie" <?php if(in_array('Goalie', $this->filter_funktionen) != false){ echo selected; } ?>>Goalie</option>
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
					      	<option value="Herren" <?php if($this->filter_tenue_kategorie == 'Herren'){ echo selected; } ?>>Herren</option>
					      	<option value="Junioren GF" <?php if($this->filter_tenue_kategorie == 'Junioren GF'){ echo selected; } ?>>Junioren GF</option>
					      	<option value="Junioren KF" <?php if($this->filter_tenue_kategorie == 'Junioren KF'){ echo selected; } ?>>Junioren KF</option>
					      	<option value="Damen" <?php if($this->filter_tenue_kategorie == 'Damen'){ echo selected; } ?>>Damen</option>
					      	<option value="Juniorinnen KF" <?php if($this->filter_tenue_kategorie == 'Juniorinnen KF'){ echo selected; } ?>>Juniorinnen KF</option>
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
					      	<option value="Leer" <?php if($this->filter_bezahlt_vor2 == Leer){ echo selected; } ?>>Leer</option>
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
					      	<option value="Leer" <?php if($this->filter_bezahlt_vor1 == Leer){ echo selected; } ?>>Leer</option>
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
					      	<option value="Leer" <?php if($this->filter_bezahlt_jetzt == Leer){ echo selected; } ?>>Leer</option>
					    </select>
					</td>
					
					<td style="padding-left: 15px" valign="top">
						Nachname:
					</td>
					
					<td style="padding-left: 5px">
						<input type="text" name="filter_nachname" value="<?php echo $this->filter_nachname ?>" size="15"/>
					</td>
					
					<td align="right" colspan="2">
						<input type="submit" value="Suchen" onclick="document.getElementById('action').value='search';"/>						
						&nbsp;&nbsp;
						<input type="submit" value="Filter L&ouml;schen" onclick="document.getElementById('action').value='reset';"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="10">
						<hr/>
					</td>
				</tr>
			</table>
			<?php if($this->action == 'search' || $this->action == 'save' || $this->action == 'season'){ ?>
			<h3><?php echo count($this->result_array) ?>&nbsp;Suchresultat(e)</h3>
			<table cellpadding="0" cellspacing="0" border="0">
				<?php if(count($this->result_array) != 0){ ?>
					<tr>
						<td>
							<b>Status</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Name *</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Vorname *</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Adresse *</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>PLZ *</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Ort *</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Geburtsdatum *</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Telefon</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Mobile</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Mobile 2</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>E-Mail</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>E-Mail 2</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Beitrittsdatum *</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Lizenz-Kat.</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Lizenz-Nr.</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Lizenz-Status</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Lizenz bei</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Stammverein</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Teameinteilung</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Ablauf A-Teil</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Helfereinsatz</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Funktion 1 *</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Funktion 2</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Funktion 3</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>In Ausbildung</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Geschwister</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Tenue Kat.</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Tenue Nr.</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Bez. vor 2</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Bez. vor 1</b>
						</td>
						<td style="padding-left: 5px; white-space: nowrap;">
							<b>Bez. aktuell</b>
						</td>
					</tr>
					
					<?php
						$counter = 0;
						foreach($this->result_array as $result): 
					?>
						<input type="hidden" name="id[<?php echo $counter ?>]" value="<?php echo $result['id'] ?>" />
					<tr>
						<td>
							<select name="status<?php echo $counter ?>">
								<option value="Aktiv" <?php if($result['status'] == Aktiv){ echo selected; } ?>>Aktiv</option>
						      	<option value="Deaktiviert" <?php if($result['status'] == Deaktiviert){ echo selected; } ?>>Deaktiviert</option>
						    </select>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="name<?php echo $counter ?>" value="<?php echo $result['name'] ?>" size="10"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="vorname<?php echo $counter ?>" value="<?php echo $result['vorname'] ?>" size="10"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="adresse<?php echo $counter ?>" value="<?php echo $result['adresse'] ?>" size="20"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="plz<?php echo $counter ?>" value="<?php echo $result['plz'] ?>" size="5"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="ort<?php echo $counter ?>" value="<?php echo $result['ort'] ?>" size="10"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="geburtsdatum<?php echo $counter ?>" value="<?php echo $result['geburtsdatum'] ?>" size="10"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="telefon<?php echo $counter ?>" value="<?php echo $result['telefon'] ?>" size="12"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="mobile<?php echo $counter ?>" value="<?php echo $result['mobile'] ?>" size="12"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="mobile2_<?php echo $counter ?>" value="<?php echo $result['mobile2'] ?>" size="12"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="email<?php echo $counter ?>" value="<?php echo $result['email'] ?>" size="20"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="email2_<?php echo $counter ?>" value="<?php echo $result['email2'] ?>" size="20"/>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="beitrittsdatum<?php echo $counter ?>" value="<?php echo $result['beitrittsdatum'] ?>" size="10"/>
						</td>
						<td style="padding-left: 5px">
							<select name="lizenz_kategorie<?php echo $counter ?>">
						      		<option value=""></option>
						      	<?php
									for($i = 0; $i < count($teamArray); $i++) {
								?>
										<option value="<?php echo $teamArray[$i]['teamname'] ?>" <?php if($result['lizenz_kategorie'] == $teamArray[$i]['teamname']){ echo selected; } ?>><?php echo $teamArray[$i]['teamname'] ?></option>
								<?php
									} 
								?>
						    </select>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="lizenz_nummer<?php echo $counter ?>" value="<?php echo $result['lizenz_nummer'] ?>" size="10"/>
						</td>
						<td style="padding-left: 5px">
							<select name="lizenz_status<?php echo $counter ?>">
						      	<option value="Ok" <?php if($result['lizenz_status'] == Ok){ echo selected; } ?>>Ok</option>
						      	<option value="Pendent" <?php if($result['lizenz_status'] == Pendent){ echo selected; } ?>>Pendent</option>
						      	<option value="Deaktiviert" <?php if($result['lizenz_status'] == Deaktiviert){ echo selected; } ?>>Deaktiviert</option>
						      	<option value="Keine" <?php if($result['lizenz_status'] == Keine){ echo selected; } ?>>Keine</option>
						    </select>
						</td>
						<td style="padding-left: 5px">
							<select name="lizenz_verein<?php echo $counter ?>">
								<option value=""></option>
						      	<option value="Crusaders" <?php if($result['lizenz_verein'] == Crusaders){ echo selected; } ?>>Crusaders</option>
						      	<option value="Adliswil" <?php if($result['lizenz_verein'] == Adliswil){ echo selected; } ?>>Adliswil</option>
						    </select>
						</td>
						<td style="padding-left: 5px">
							<select name="stammverein<?php echo $counter ?>">
								<option value=""></option>
						      	<option value="Crusaders" <?php if($result['stammverein'] == Crusaders){ echo selected; } ?>>Crusaders</option>
						      	<option value="Adliswil" <?php if($result['stammverein'] == Adliswil){ echo selected; } ?>>Adliswil</option>
						    </select>
						</td>
						<td style="padding-left: 5px">
							<select name="teameinteilung<?php echo $counter ?>">
						      	<option value=""></option>
						      	<?php
									for($i = 0; $i < count($teamArray); $i++) {
								?>
										<option value="<?php echo $teamArray[$i]['teamname'] ?>" <?php if($result['teameinteilung'] == $teamArray[$i]['teamname']){ echo selected; } ?>><?php echo $teamArray[$i]['teamname'] ?></option>
								<?php
									} 
								?>
						    </select>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="ablauf_ateil<?php echo $counter ?>" value="<?php echo $result['ablauf_ateil'] ?>" size="10"/>
						</td>
						<td style="padding-left: 5px">
							<select name="helfereinsatz<?php echo $counter ?>">
						      	<option value="Ja" <?php if($result['helfereinsatz'] == Ja){ echo selected; } ?>>Ja</option>
						      	<option value="Nein" <?php if($result['helfereinsatz'] == Nein){ echo selected; } ?>>Nein</option>
						    </select>
						</td>
						<td style="padding-left: 5px">
							<select name="funktion1<?php echo $counter ?>">
						    	<option value=""></option>
						    	<option value="Vorstand" <?php if($result['funktion1'] == 'Vorstand'){ echo selected; } ?>>Vorstand</option>
						    	<option value="Trainer" <?php if($result['funktion1'] == 'Trainer'){ echo selected; } ?>>Trainer</option>
						    	<option value="Runden-OK" <?php if($result['funktion1'] == 'Runden-OK'){ echo selected; } ?>>Runden-OK</option>
						    	<option value="Schiedsrichter" <?php if($result['funktion1'] == 'Schiedsrichter'){ echo selected; } ?>>Schiedsrichter</option>
						    	<option value="Spieler" <?php if($result['funktion1'] == 'Spieler'){ echo selected; } ?>>Spieler</option>
						    	<option value="Goalie" <?php if($result['funktion1'] == 'Goalie'){ echo selected; } ?>>Goalie</option>
						    </select>
						</td>
						<td style="padding-left: 5px">
							<select name="funktion2<?php echo $counter ?>">
						    	<option value=""></option>
						    	<option value="Vorstand" <?php if($result['funktion2'] == 'Vorstand'){ echo selected; } ?>>Vorstand</option>
						    	<option value="Trainer" <?php if($result['funktion2'] == 'Trainer'){ echo selected; } ?>>Trainer</option>
						    	<option value="Runden-OK" <?php if($result['funktion2'] == 'Runden-OK'){ echo selected; } ?>>Runden-OK</option>
						    	<option value="Schiedsrichter" <?php if($result['funktion2'] == 'Schiedsrichter'){ echo selected; } ?>>Schiedsrichter</option>
						    	<option value="Spieler" <?php if($result['funktion2'] == 'Spieler'){ echo selected; } ?>>Spieler</option>
						    	<option value="Goalie" <?php if($result['funktion2'] == 'Goalie'){ echo selected; } ?>>Goalie</option>
						    </select>
						</td>
						<td style="padding-left: 5px">
							<select name="funktion3<?php echo $counter ?>">
						    	<option value=""></option>
						    	<option value="Vorstand" <?php if($result['funktion3'] == 'Vorstand'){ echo selected; } ?>>Vorstand</option>
						    	<option value="Trainer" <?php if($result['funktion3'] == 'Trainer'){ echo selected; } ?>>Trainer</option>
						    	<option value="Runden-OK" <?php if($result['funktion3'] == 'Runden-OK'){ echo selected; } ?>>Runden-OK</option>
						    	<option value="Schiedsrichter" <?php if($result['funktion3'] == 'Schiedsrichter'){ echo selected; } ?>>Schiedsrichter</option>
						    	<option value="Spieler" <?php if($result['funktion3'] == 'Spieler'){ echo selected; } ?>>Spieler</option>
						    	<option value="Goalie" <?php if($result['funktion3'] == 'Goalie'){ echo selected; } ?>>Goalie</option>
						    </select>
						</td>
						<td style="padding-left: 5px">
							<select name="ausbildung<?php echo $counter ?>">
						      	<option value=""></option>
						      	<option value="Ja" <?php if($result['ausbildung'] == Ja){ echo selected; } ?>>Ja</option>
						      	<option value="Nein" <?php if($result['ausbildung'] == Nein){ echo selected; } ?>>Nein</option>
						    </select>
						</td>
						<td style="padding-left: 5px">
							<select name="geschwister<?php echo $counter ?>">
						      	<option value=""></option>
						      	<option value="Ja" <?php if($result['geschwister'] == Ja){ echo selected; } ?>>Ja</option>
						      	<option value="Nein" <?php if($result['geschwister'] == Nein){ echo selected; } ?>>Nein</option>
						    </select>
						</td>
						<td style="padding-left: 5px" valign="top">
							<select name="tenue_kategorie<?php echo $counter ?>">
						    	<option value=""></option>
						      	<option value="Herren" <?php if($result['tenue_kategorie'] == 'Herren'){ echo selected; } ?>>Herren</option>
						      	<option value="Junioren GF" <?php if($result['tenue_kategorie'] == 'Junioren GF'){ echo selected; } ?>>Junioren GF</option>
						      	<option value="Junioren KF" <?php if($result['tenue_kategorie'] == 'Junioren KF'){ echo selected; } ?>>Junioren KF</option>
						      	<option value="Damen" <?php if($result['tenue_kategorie'] == 'Damen'){ echo selected; } ?>>Damen</option>
						      	<option value="Juniorinnen KF" <?php if($result['tenue_kategorie'] == 'Juniorinnen KF'){ echo selected; } ?>>Juniorinnen KF</option>
						    </select>
						</td>
						<td style="padding-left: 5px;">
							<input type="text" name="tenue_nummer<?php echo $counter ?>" value="<?php echo $result['tenue_nummer'] ?>" size="3"/>
						</td>
						<td style="padding-left: 5px">
							<select name="bezahlt_vor2<?php echo $counter ?>">
						      	<option value=""></option>
						      	<option value="Ja" <?php if($result['bezahlt_vor2'] == Ja){ echo selected; } ?>>Ja</option>
						      	<option value="Nein" <?php if($result['bezahlt_vor2'] == Nein){ echo selected; } ?>>Nein</option>
						    </select>
						</td>
						<td style="padding-left: 5px">
							<select name="bezahlt_vor1<?php echo $counter ?>">
						      	<option value=""></option>
						      	<option value="Ja" <?php if($result['bezahlt_vor1'] == Ja){ echo selected; } ?>>Ja</option>
						      	<option value="Nein" <?php if($result['bezahlt_vor1'] == Nein){ echo selected; } ?>>Nein</option>
						    </select>
						</td>
						<td style="padding-left: 5px">
							<select name="bezahlt_jetzt<?php echo $counter ?>">
						      	<option value=""></option>
						      	<option value="Ja" <?php if($result['bezahlt_jetzt'] == Ja){ echo selected; } ?>>Ja</option>
						      	<option value="Nein" <?php if($result['bezahlt_jetzt'] == Nein){ echo selected; } ?>>Nein</option>
						    </select>
						</td>
					</tr>
					<?php 
						$counter++;	
						endforeach; 
					?>
			
					<tr>
						<td colspan="31">
							&nbsp;
						</td>
					</tr>
					
					<tr>
						<td colspan="31">
							<input type="submit" value="&Auml;nderungen speichern" onclick="document.getElementById('action').value='save';"/>
							&nbsp;&nbsp;
							<input type="submit" value="Excel&nbsp;Export" onclick="document.getElementById('action').value='excel';"/>
						</td>
					</tr>
				<?php } ?> 	
				
				<tr>
					<td colspan="31">
						<hr/>
					</td>
				</tr>
			</table>
		<?php } ?>
		<h3>Neuer Datensatz erfassen</h3>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
						<b>Name *</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Vorname *</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Adresse *</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>PLZ *</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Ort *</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Geburtsdatum *</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Telefon</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Mobile</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Mobile 2</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>E-Mail</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>E-Mail 2</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Beitrittsdatum *</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Stammverein</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Teameinteilung</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Funktion 1 *</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Funktion 2</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Funktion 3</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>In Ausbildung</b>
					</td>
					<td style="padding-left: 5px; white-space: nowrap;">
						<b>Geschwister</b>
					</td>
				</tr>
				
				<tr>
					<td>
						<input type="text" name="neu_name" value="<?php echo $this->neu_name ?>" size="10"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_vorname" value="<?php echo $this->neu_vorname ?>" size="10"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_adresse" value="<?php echo $this->neu_adresse ?>" size="20"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_plz" value="<?php echo $this->neu_plz ?>" size="5"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_ort" value="<?php echo $this->neu_ort ?>" size="10"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_geburtsdatum" value="<?php echo $this->neu_geburtsdatum ?>" size="10"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_telefon" value="<?php echo $this->neu_telefon ?>" size="12"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_mobile" value="<?php echo $this->neu_mobile ?>" size="12"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_mobile2" value="<?php echo $this->neu_mobile2 ?>" size="12"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_email" value="<?php echo $this->neu_email ?>" size="20"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_email2" value="<?php echo $this->neu_email2 ?>" size="20"/>
					</td>
					<td style="padding-left: 5px;">
						<input type="text" name="neu_beitrittsdatum" value="<?php echo $this->neu_beitrittsdatum ?>" size="10"/>
					</td>
					<td style="padding-left: 5px">
						<select name="neu_stammverein">
					      	<option value="Crusaders" <?php if($this->neu_stammverein == Crusaders){ echo selected; } ?>>Crusaders</option>
					      	<option value="Adliswil" <?php if($this->neu_stammverein == Adliswil){ echo selected; } ?>>Adliswil</option>
					    </select>
					</td>
					<td style="padding-left: 5px">
						<select name="neu_teameinteilung">
					      	<?php
								for($i = 0; $i < count($teamArray); $i++) {
							?>
									<option value="<?php echo $teamArray[$i]['teamname'] ?>" <?php if($this->neu_teameinteilung == $teamArray[$i]['teamname']){ echo selected; } ?>><?php echo $teamArray[$i]['teamname'] ?></option>
							<?php
								} 
							?>
					    </select>
					</td>
					<td style="padding-left: 5px">
						<select name="neu_funktion1">
					    	<option value=""></option>
					    	<option value="Vorstand" <?php if($this->neu_funktion1 == 'Vorstand'){ echo selected; } ?>>Vorstand</option>
					    	<option value="Trainer" <?php if($this->neu_funktion1 == 'Trainer'){ echo selected; } ?>>Trainer</option>
					    	<option value="Runden-OK" <?php if($this->neu_funktion1 == 'Runden-OK'){ echo selected; } ?>>Runden-OK</option>
					    	<option value="Schiedsrichter" <?php if($this->neu_funktion1 == 'Schiedsrichter'){ echo selected; } ?>>Schiedsrichter</option>
					    	<option value="Spieler" <?php if($this->neu_funktion1 == 'Spieler'){ echo selected; } ?>>Spieler</option>
					    	<option value="Goalie" <?php if($this->neu_funktion1 == 'Goalie'){ echo selected; } ?>>Goalie</option>
					    </select>
					</td>
					<td style="padding-left: 5px">
						<select name="neu_funktion2">
					    	<option value=""></option>
					    	<option value="Vorstand" <?php if($this->neu_funktion2 == 'Vorstand'){ echo selected; } ?>>Vorstand</option>
					    	<option value="Trainer" <?php if($this->neu_funktion2 == 'Trainer'){ echo selected; } ?>>Trainer</option>
					    	<option value="Runden-OK" <?php if($this->neu_funktion2 == 'Runden-OK'){ echo selected; } ?>>Runden-OK</option>
					    	<option value="Schiedsrichter" <?php if($this->neu_funktion2 == 'Schiedsrichter'){ echo selected; } ?>>Schiedsrichter</option>
					    	<option value="Spieler" <?php if($this->neu_funktion2 == 'Spieler'){ echo selected; } ?>>Spieler</option>
					    	<option value="Goalie" <?php if($this->neu_funktion2 == 'Goalie'){ echo selected; } ?>>Goalie</option>
					    </select>
					</td>
					<td style="padding-left: 5px">
						<select name="neu_funktion3">
					    	<option value=""></option>
					    	<option value="Vorstand" <?php if($this->neu_funktion3 == 'Vorstand'){ echo selected; } ?>>Vorstand</option>
					    	<option value="Trainer" <?php if($this->neu_funktion3 == 'Trainer'){ echo selected; } ?>>Trainer</option>
					    	<option value="Runden-OK" <?php if($this->neu_funktion3 == 'Runden-OK'){ echo selected; } ?>>Runden-OK</option>
					    	<option value="Schiedsrichter" <?php if($this->neu_funktion3 == 'Schiedsrichter'){ echo selected; } ?>>Schiedsrichter</option>
					    	<option value="Spieler" <?php if($this->neu_funktion3 == 'Spieler'){ echo selected; } ?>>Spieler</option>
					    	<option value="Goalie" <?php if($this->neu_funktion3 == 'Goalie'){ echo selected; } ?>>Goalie</option>
					    </select>
					</td>
					<td style="padding-left: 5px">
						<select name="neu_ausbildung">
					      	<option value="Ja" <?php if($this->neu_ausbildung == Ja){ echo selected; } ?>>Ja</option>
					      	<option value="Nein" <?php if($this->neu_ausbildung == Nein){ echo selected; } ?>>Nein</option>
					    </select>
					</td>
					<td style="padding-left: 5px">
						<select name="neu_geschwister">
					      	<option value="Ja" <?php if($this->neu_geschwister == Ja){ echo selected; } ?>>Ja</option>
					      	<option value="Nein" <?php if($this->neu_geschwister == Nein){ echo selected; } ?>>Nein</option>
					    </select>
					</td>
				</tr>
				
				<tr>
					<td colspan="5">&nbsp;</td>
					<td style="padding-left: 5px;">
						<i>25.05.1985</i>
					</td>
					<td style="padding-left: 5px;">
						<i>044 481 01 02</i>
					</td>
					<td style="padding-left: 5px;">
						<i>079 111 22 33</i>
					</td>
					<td style="padding-left: 5px;">
						<i>079 333 22 11</i>
					</td>
					<td colspan="2">&nbsp;</td>
					<td style="padding-left: 5px;">
						<i>01.08.2010</i>
					</td>
				</tr>
				
				<tr>
					<td colspan="19">
						<input type="submit" value="Datensatz erfassen" onclick="document.getElementById('action').value='new';"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="19">
						<hr/>
					</td>
				</tr>
			</table>
			<h3>Neue Abrechnungsperiode erfassen</h3>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
						Sobald auf den untenstehenden Button geklickt wird, werden in der Datenbank die Werte 'Bezahlt vor 2 Jahren',
						'Bezahlt vor 1 Jahr' und 'Bezahlt aktuelles Jahr' bei ALLEN Datens&auml;tzen ver&auml;ndert!<br><br>
						Es werden die aktuellen Werte von 'Bezahlt vor 1 Jahr' in das Feld 'Bezahlt vor 2 Jahren' kopiert und das gleiche
						passiert mit dem Feld 'Bezahlt aktuelles Jahr', welches ins Feld 'Bezahlt vor 1 Jahr' <br>kopiert wird. Im Feld
						'Bezahlt akutelles Jahr' wird bei ALLEN Datens&auml;tzen der Wert 'Nein' abgef&uuml;llt!
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="Neue Abrechnungsperiode erfassen" onclick="document.getElementById('action').value='season';"/>
					</td>
				</tr>
				<tr>
					<td>
						<hr/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>