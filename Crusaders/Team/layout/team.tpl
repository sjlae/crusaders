<table>
	<h3><?php echo $this->name ?></h3>
	<?php
		foreach($this->results as $games): 
	?>
			<tr>
				<td><?php echo $games->Date; ?></td> 
				<td><?php echo $games->HomeTeam; ?></td>	
				<td><?php echo $games->AwayTeam; ?></td>
				<td><?php echo $games->GoalsHomeTeam; ?></td>
				<td><?php echo $games->GoalsAwayTeam; ?></td>	
			</tr>
	<?php
		endforeach;
	?>
</table>	