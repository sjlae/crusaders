<?php if($this->gruppe != ''){ ?>
	<h3><?php echo $this->name?>&nbsp;-&nbsp;Gruppe&nbsp;<?php echo $this->gruppe ?></h3>
	<table cellpadding="0" cellspacing="0" border="0">
		<?php
			foreach($this->results as $result): 
		?>
				<tr>
					<td><?php echo $result->Date; ?></td> 
					<td><?php echo $result->HomeTeam; ?></td>	
					<td><?php echo $result->AwayTeam; ?></td>
					<td><?php echo $result->GoalsHomeTeam; ?></td>
					<td><?php echo $result->GoalsAwayTeam; ?></td>	
				</tr>
		<?php
			endforeach;
		?>
	</table>
	<br><br>
	<table cellpadding="0" cellspacing="0" border="0">
		<?php
			foreach($this->games as $games): 
		?>
				<tr>
					<td><?php echo $games->Date; ?></td> 
					<td><?php echo $games->Time; ?></td> 
					<td><?php echo $games->HomeTeam; ?></td>	
					<td><?php echo $games->AwayTeam; ?></td>
					<td><?php echo $games->Place; ?></td>
					<td><?php echo $games->GymName; ?></td>	
				</tr>
		<?php
			endforeach;
		?>
	</table>
	<br><br>
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
	<h3><?php echo $this->name?></h3>		
<?php } ?>


	