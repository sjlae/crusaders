<?php
	if(count($this->games) != 1 && count($this->ranking) != 1){
?>
		<div id="content">
			<table cellpadding="1" cellspacing="0" border="0" style="font-size: 11px; width:80%;">
					<tr>
						<td style="font-size: 13px; font-weight: bold;" colspan="6">Resultate - <?php echo $this->name ?></td>	
					</tr>
					<tr>
						<td style="font-size: 6px;" colspan="5">&nbsp;</td>	
					</tr>
				<?php
					foreach($this->games as $games): 
						if($games->cup != true && $games->goalshome != '-1')
						{		
				?>
							<tr style="white-space: nowrap;">	
								<td style="width:15%;"><?php echo $games->date; ?></td>	
								<td style="width:25%;"><?php echo htmlentities($games->hometeamname); ?></td>	
								<td style="width:5%;">-</td>
								<td style="width:25%;"><?php echo htmlentities($games->awayteamname); ?></td>
								<td style="width:10%; text-align: center;"><?php echo $games->goalshome; ?>&nbsp; : &nbsp;<?php echo $games->goalsaway; ?></td>	
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
					$now = mktime();
					
					foreach($this->games as $games): 
						if($now < strtotime($games->date))
						{
				?>
							<tr style="white-space: nowrap;">
								<td><?php echo $games->date; ?></td> 
								<td><?php echo $games->time; ?></td> 
								<td><?php echo htmlentities($games->hometeamname); ?></td>
								<td>-</td>	
								<td><?php echo htmlentities($games->awayteamname); ?></td>
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
				<table cellpadding="0" cellspacing="0" border="0">
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
									<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->wins-overtime; ?></td>
									<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->ties; ?></td>	
									<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->defeats; ?></td>
									<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->defeats-overtime; ?></td>
									<td style="text-align: right; padding-left: 10px;"><?php echo $ranking->goals-scored; ?> : <?php echo $ranking->goals-received; ?></td>		
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