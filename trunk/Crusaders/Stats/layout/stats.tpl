<div id="content">
	<table cellpadding="1" cellspacing="0" border="0" style="font-size: 11px; width:80%;">
			<tr>
				<td style="font-size: 13px; font-weight: bold;" colspan="6">Resultate - <?php echo $this->name ?></td>	
			</tr>
			<tr>
				<td style="font-size: 6px;" colspan="5">&nbsp;</td>	
			</tr>
		<?php
			foreach($this->results as $games): 
				if($games->LeagueCode != 1011)
				{		
		?>
					<tr>	
						<td style="width:15%;"><?php echo $games->Date; ?></td>	
						<td style="width:25%;"><?php echo $games->HomeTeam; ?></td>	
						<td style="width:5%;">-</td>
						<td style="width:25%;"><?php echo $games->AwayTeam; ?></td>
						<td style="width:10%; text-align: center;"><?php echo $games->GoalsHomeTeam; ?>&nbsp; : &nbsp;<?php echo $games->GoalsAwayTeam; ?></td>	
					</tr>
		<?php
				}
			endforeach;
		?>
	</table>
	<table cellpadding="1" cellspacing="0" border="0" style="font-size: 11px; width:100%;">
		<tr>
			<td style="font-size: 6px;" colspan="7">&nbsp;</td>	
		</tr>
		<tr>
			<td style="font-size: 13px; font-weight: bold;" colspan="7">Kommende Spiele - <?php echo $this->name ?></td>	
		</tr>
		<tr>
			<td style="font-size: 6px;" colspan="7">&nbsp;</td>	
		</tr>
		
		<?php
			foreach($this->future as $games): 
		?>
				<tr>
					<td><?php echo $games->Date; ?></td> 
					<td><?php echo $games->Time; ?></td> 
					<td><?php echo $games->HomeTeam; ?></td>
					<td>-</td>	
					<td><?php echo $games->AwayTeam; ?></td>
					<td><?php echo $games->Place; ?></td>
					<td><?php echo $games->GymName; ?></td>	
				</tr>
		<?php
			endforeach;
		?>
	</table>
</div>

<div id="stats" title="Resultate und Spielplan">
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/zahlen.gif" border="0"></a>
</div>

<div id="teamshit" title="Team News">
	<a href="index.php?go=teamnews&teamid=<?php echo $this->teamid ?>&del=1"><img src="images/shit.gif" border="0"></a>
</div>
<!--
<div id="gallery" title="Gallerie">
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/gallery.gif" border="0"></a>
</div>
-->
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