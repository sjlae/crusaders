<?php
	if(count($this->games) != 1 && count($this->ranking) != 1){
?>
		<div id="content">
			<table cellpadding="1" cellspacing="0" border="0" style="font-size: 11px;">
					<tr>
						<td style="font-size: 13px; font-weight: bold;" colspan="7">Resultate - <?php echo $this->name ?></td>	
					</tr>
					<tr>
						<td style="font-size: 6px;" colspan="7">&nbsp;</td>	
					</tr>
				<?php
					foreach($this->games as $games): 
						if($games->played == true)
						{		
				?>
							<tr style="white-space: nowrap;">	
								<td style="padding-right: 10px;"><?php echo $games->date; ?></td>	
								<td style="padding-right: 10px;"><?php echo $games->leaguetype; ?></td>
								<td style="padding-right: 10px;"><?php echo $games->roundtext; ?></td>
								<td style="padding-right: 10px;"><?php echo htmlentities($games->hometeamname); ?></td>	
								<td style="padding-right: 10px;">-</td>
								<td style="padding-right: 10px;"><?php echo htmlentities($games->awayteamname); ?></td>
								<td><?php echo $games->goalshome; ?>&nbsp; : &nbsp;<?php echo $games->goalsaway; ?></td>	
							</tr>
				<?php
						}
					endforeach;
				?>
			</table>
			<table cellpadding="1" cellspacing="0" border="0" style="font-size: 11px;">
				<tr>
					<td style="font-size: 6px;" colspan="8">&nbsp;</td>	
				</tr>
				<tr>
					<td style="font-size: 13px; font-weight: bold;" colspan="8">Kommende Spiele - <?php echo $this->name ?></td>	
				</tr>
				<tr>
					<td style="font-size: 6px;" colspan="8">&nbsp;</td>	
				</tr>
				
				<?php
					foreach($this->games as $games): 
						if($games->played != true)
						{
				?>
							<tr style="white-space: nowrap;">
								<td style="padding-right: 10px;"><?php echo $games->date; ?></td> 
								<td style="padding-right: 10px;"><?php echo $games->leaguetype; ?></td>
								<td style="padding-right: 10px;"><?php echo $games->roundtext != '-' ? $games->roundtext : ''; ?></td>
								<td style="padding-right: 10px;"><?php echo $games->time; ?></td> 
								<td style="padding-right: 10px;"><?php echo htmlentities($games->hometeamname); ?></td>
								<td style="padding-right: 10px;">-</td>	
								<td style="padding-right: 10px;"><?php echo htmlentities($games->awayteamname); ?></td>
								<td title="<?php echo htmlentities($games->gym); ?>"><img src="images/info.png" border="0" heigth="10" width="10"></td>
							</tr>
				<?php
						}
					endforeach;
				?>
			</table>
		</div>
		
		<div id="stats" title="Resultate und Spielplan">
			<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/zahlen.gif" border="0"></a>
		</div>
		
		<div id="teamshit" title="Team News">
			<a href="index.php?go=teamnews&teamid=<?php echo $this->teamid ?>&del=1"><img src="images/team.gif" border="0"></a>
		</div>
		
		<div id="spiegel">
		<?php
			if($this->name != 'E-Junioren'){
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
		?>
	</div>
<?php
	}
?>