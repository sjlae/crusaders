<div id="content">
	<table cellpadding="1" cellspacing="0" border="0"style="font-size: 11px; width:100%;">
			<tr>
				<td style="font-size: 13px; font-weight: bold;">Letzte Resultate</td>	
			</tr>
			<tr>
				<td style="font-size: 6px;">&nbsp;</td>	
			</tr>
		<?php
			for($i = 0; $i < count($this->results); $i++){ 
				foreach($this->results[$i] as $games): 
					if($games->LeagueCode != 1011)
					{		
		?>
						<tr>
							<td style="width:25%;"><?php echo $games->League; ?></td>	
							<td style="width:13%;"><?php echo $games->Date; ?></td>	
							<td style="width:25%;"><?php echo $games->HomeTeam; ?></td>	
							<td style="width:2%;">-</td>
							<td style="width:25%;"><?php echo $games->AwayTeam; ?></td>
							<td style="width:10%; text-align: center;"><?php echo $games->GoalsHomeTeam; ?>&nbsp; : &nbsp;<?php echo $games->GoalsAwayTeam; ?></td>	
						</tr>
		<?php
					}
				endforeach;
			}
		?>
	</table>
</div>