<div id="content">
<h3 id="team_name"><?php echo $this->name?>&nbsp;-&nbsp;Gruppe&nbsp;<?php echo $this->gruppe ?></h3>
<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			<?php $fileName = str_replace(' ', '_', $this->name); ?>
			<img src="images/<?php echo $fileName ?>.jpg" width="400" height="300">
		</td>
		<td>
			&nbsp;
		</td>
	</tr>	
</table>
</div>
<div id="stats" class="stats">
<ul class="menu">
		<li class="stats"><a href="" title="Zahlen" class="stats"></a>
		<ul class="sub">
			<li>Resultate und Spielplan</li>
		</ul></li>
</ul>
</div>
<div id="spiegel">
<?php if($this->gruppe != ''){ ?>
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
