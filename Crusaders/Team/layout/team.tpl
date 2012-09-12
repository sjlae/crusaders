<div id="content">
<h1 id="team_name"><?php echo $this->name?>
	<?php
		if($this->spielgemeinschaft == 1){
			echo ' - Spielgemeinschaft mit THS Adliswil';
		}
		$filename = 'spielerlistenfiles/'.$this->teamid.'.pdf';
		if((LoggedIn::isAdmin() || LoggedIn::isCoach()) && file_exists($filename)){
	?>
			<a href="spielerlistenfiles/<?php echo $this->teamid ?>.pdf" target="_blank">Teamblatt &ouml;ffnen</a>
	<?php	
		}
	?>
</h1>
<table cellpadding="5px" cellspacing="0" border="0">
	<tr>
		<td valign="top">
			<div style="width: 400px; height: 300px;">
				<a href="images/<?php echo $this->teamid ?>.jpg" target="_blank"><img border="0" src="images/<?php echo $this->teamid ?>.jpg" width="400" height="300"></a>
				&nbsp;
			</div>
		</td>
		<?php if($this->trainingDay1_tag != ''){ ?>
			<td valign="top" style="padding-left: 10px">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td>
							<b>Trainings</b>
						</td>
					</tr>
					<tr>
						<td style="padding-top: 20px">
							<?php echo $this->trainingDay1_tag ?>:
						</td>
					</tr>
					<tr>
						<td>
							<?php echo $this->trainingDay1_halle ?>
							von
							<?php echo $this->trainingDay1_fromHour ?>:<?php echo $this->trainingDay1_fromMinutes ?>
							bis
							<?php echo $this->trainingDay1_toHour ?>:<?php echo $this->trainingDay1_toMinutes ?>
						</td>
					</tr>
					<?php if($this->trainingDay2_tag != ''){ ?>
						<tr>
							<td style="padding-top: 20px">
								<?php echo $this->trainingDay2_tag ?>:
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $this->trainingDay2_halle ?>
								von
								<?php echo $this->trainingDay2_fromHour ?>:<?php echo $this->trainingDay2_fromMinutes ?>
								bis
								<?php echo $this->trainingDay2_toHour ?>:<?php echo $this->trainingDay2_toMinutes ?>
							</td>
						</tr>
					<?php } ?>
					<tr>
						<td style="padding-top: 20px">
							<b>Coach</b>
						</td>
					</tr>
					<tr>
						<td style="padding-top: 20px">
							<?php echo $this->coach1_vorname ?>
							<?php echo $this->coach1_nachname ?>
							<br>
							<?php if($this->coach1_vorname != '' && $this->coach1_email != ''){ ?>
								<script language=javascript>
									hideEmailAddress('<?php echo $this->coach1_email ?>', 'Mail an <?php echo $this->coach1_vorname ?>');
								</script>
							<?php } ?>
							<br>
							<?php echo $this->coach1_phone ?>
						</td>
					</tr>
					<tr>
						<td style="padding-top: 20px">
							<?php echo $this->coach2_vorname ?>
							<?php echo $this->coach2_nachname ?>
							<br>
							<?php if($this->coach2_vorname != '' && $this->coach2_email != ''){ ?>
								<script language=javascript>
									hideEmailAddress('<?php echo $this->coach2_email ?>', 'Mail an <?php echo $this->coach2_vorname ?>');
								</script>
							<?php } ?>
							<br>
							<?php echo $this->coach2_phone ?>
						</td>
					</tr>
				</table>
			</td>
		<?php } ?>
	</tr>	
</table>
</div>

<div id="stats" title="Resultate und Spielplan">
	<?php
		if($this->restteamid != 0){
	?>	
			<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/zahlen.gif" border="0"></a>
	<?php
		}
	?>
</div>

<div id="teamshit" title="Team News">
	<a href="index.php?go=teamnews&teamid=<?php echo $this->teamid ?>&del=1"><img src="images/team.gif" border="0"></a>
</div>

<div id="spiegel">
	<?php
		if($this->name != 'E-Junioren' && $this->name != 'E-Junioren 2' && $this->restteamid != 0){
	?>
			<h2 id="team_name"><?php echo $this->name?></h2>
			<table cellpadding="0" cellspacing="0" border="0" style="font-size: 9px;">
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td style="text-align: right; padding-left: 10px;"><b>Sp</b></td>
					<td style="text-align: right; padding-left: 10px;"><b>S</b></td>
					<td style="text-align: right; padding-left: 10px;"><b>SnV</b></td>
					<td style="text-align: right; padding-left: 10px;"><b>U</b></td>
					<td style="text-align: right; padding-left: 10px;"><b>N</b></td>
					<td style="text-align: right; padding-left: 10px;"><b>NnV</b></td>
					<td style="text-align: center; padding-left: 10px;"><b>Tore</b></td>
					<td style="text-align: right; padding-left: 10px;"><b>P</b></td>
				</tr>
				<?php
					if(count($this->ranking) != 1){
						foreach($this->ranking as $ranking): 
				?>
							<tr>
								<td><?php echo $ranking->place; ?>.&nbsp;</td> 
								<td><?php echo htmlentities($ranking->teamname); ?></td> 
								<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->games; ?></td>	
								<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->wins; ?></td>
								<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->wins_overtime; ?></td>
								<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->ties; ?></td>	
								<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->defeats; ?></td>
								<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->defeats_overtime; ?></td>
								<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->goals_scored; ?> : <?php echo $ranking->goals_received; ?></td>		
								<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->points; ?></td>	
							</tr>
				<?php
						endforeach;
					}
				?>
			</table>
	<?php
		}
		else if($this->name == 'D-Junioren' ){
	?>
			Spielplan: &nbsp;<a href="http://extern.juniorenliga.ch/spielbetrieb/saison-201213.html?action=games&teamid=234" target="_blank">hier klicken</a><br>
			Resultate: <a href="http://extern.juniorenliga.ch/spielbetrieb/saison-201213.html?action=results&teamid=234" target="_blank">hier klicken</a><br>
			Tabelle: &nbsp;&nbsp;&nbsp;<a href="http://extern.juniorenliga.ch/spielbetrieb/saison-201213.html?action=table&teamid=234" target="_blank">hier klicken</a>
	<?php
		}
	?>
</div>