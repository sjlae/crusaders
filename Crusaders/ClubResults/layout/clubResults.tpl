<div id="content">
	<table cellpadding="0" cellspacing="0" border="0">
		<?php
			for($i = 0; $i < count($this->results); $i++){ 
				foreach($this->results[$i] as $games): 
					if($games->LeagueCode != 1011)
					{		
		?>
						<tr>
							<td><?php echo $games->League; ?></td>	
							<td><?php echo $games->Date; ?></td>	
							<td><?php echo $games->HomeTeam; ?></td>	
							<td><?php echo $games->AwayTeam; ?></td>
							<td><?php echo $games->GoalsHomeTeam; ?></td>
							<td><?php echo $games->GoalsAwayTeam; ?></td>	
						</tr>
		<?php
					}
				endforeach;
			}
		?>
	</table>
</div>