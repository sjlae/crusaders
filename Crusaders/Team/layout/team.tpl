<div id="content">
<h1 id="team_name"><?php echo $this->name?>&nbsp;-&nbsp;Gruppe&nbsp;<?php echo $this->gruppe ?></h1>
<table cellpadding="5px" cellspacing="0" border="0">
	<tr>
		<td valign="top">
			<div style="width: 400px; height: 300px;">
				<img src="images/<?php echo $this->teamid ?>.jpg" width="400" height="300">
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
							<?php echo $this->coach1_email ?>
							<br>
							<?php echo $this->coach1_phone ?>
						</td>
					</tr>
					<tr>
						<td style="padding-top: 20px">
							<?php echo $this->coach2_vorname ?>
							<?php echo $this->coach2_nachname ?>
							<br>
							<?php echo $this->coach2_email ?>
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

<div id="stats" class="stats" title="Resultate und Spielplan">
	<a href="" title="Zahlen" class="stats">&nbsp;</a>
</div>

<div id="spiegel">
	<?php if($this->gruppe != 0){ ?>
		<h2 id="team_name"><?php echo $this->name?>&nbsp;-&nbsp;Gruppe&nbsp;<?php echo $this->gruppe ?></h2>	
		</br><br>
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td><b>#</b></td>
				<td><b>Team</b></td>
				<td style="text-align: right; padding-left: 10px;"><b>Sp</b></td>
				<td style="text-align: right; padding-left: 10px;"><b>S</b></td>
				<td style="text-align: right; padding-left: 10px;"><b>U</b></td>
				<td style="text-align: right; padding-left: 10px;"><b>N</b></td>
				<td style="text-align: center; padding-left: 10px;" colspan="2"><b>Tore</b></td>
				<td style="text-align: right; padding-left: 10px;"><b>P</b></td>
			</tr>
			<?php
				foreach($this->ranking as $ranking): 
			?>
					<tr>
						<td><?php echo $ranking->Rank; ?>.</td> 
						<td><?php echo $ranking->Team; ?></td> 
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->GamesPlayed; ?></td>	
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->Wins; ?></td>
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->Draws; ?></td>
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->Defeats; ?></td>	
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->GoalsScored; ?></td>	
						<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->GoalsReceived; ?></td>	
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