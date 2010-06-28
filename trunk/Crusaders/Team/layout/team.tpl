<div id="content">
<h1 id="team_name"><?php echo $this->name?></h1>
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
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/zahlen.gif" border="0"></a>
</div>

<div id="teamshit" title="Team News">
	<a href="index.php?go=teamnews&teamid=<?php echo $this->teamid ?>&del=1"><img src="images/team.gif" border="0"></a>
</div>

<!--
<div id="gallery" title="Gallerie">
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/gallery.gif" border="0"></a>
</div>
--!>

<div id="spiegel">
	<?php if($this->gruppe != 0){ ?>
		<h2 id="team_name"><?php echo $this->name?></h2>
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td style="text-align: right; padding-left: 10px;"><b>Sp</b></td>
				<td style="text-align: right; padding-left: 10px;"><b>S</b></td>
				<td style="text-align: right; padding-left: 10px;"><b>U</b></td>
				<td style="text-align: right; padding-left: 10px;"><b>N</b></td>
				<td style="text-align: center; padding-left: 10px;"><b>Tore</b></td>
				<td style="text-align: right; padding-left: 10px;"><b>P</b></td>
			</tr>
			<?php
				foreach($this->ranking as $ranking): 
			?>
					<tr>
						<td><?php echo $ranking->Rank; ?>.&nbsp;</td> 
						<td><?php echo $ranking->Team; ?></td> 
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->GamesPlayed; ?></td>	
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->Wins; ?></td>
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->Draws; ?></td>
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->Defeats; ?></td>	
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->GoalsScored; ?> : <?php echo $ranking->GoalsReceived; ?></td>		
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->Points; ?></td>	
					</tr>
			<?php
				endforeach;
			?>
		</table>
	<?php } else{ ?>
		<h3 id="team_name"><?php echo $this->name?></h3>		
	<?php } ?>
</div>