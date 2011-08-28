<div id="content">
	<table cellpadding="1" cellspacing="0" border="0" style="font-size: 11px;">
			<tr>
				<td style="font-size: 13px; font-weight: bold;" colspan="9">Letzte Resultate</td>	
			</tr>
			<tr>
				<td style="font-size: 4px;" colspan="9">&nbsp;</td>	
			</tr>
		<?php
			$tempLeagueText = '';
			for($i = 0; $i < count($this->results); $i++){ 
				if(isset($this->results[$i][0])){
					foreach($this->results[$i] as $games):
						if($tempLeagueText != '' && $tempLeagueText != $games->leaguetext){
		?>
							<tr>
								<td style="font-size: 4px;">&nbsp;</td>
							</tr>
		<?php
						}
						$tempLeagueText = $games->leaguetext;
		?>
						<tr>
							<td style="padding-right: 10px; white-space: nowrap;"><?php echo $games->date; ?></td>	
							<td style="padding-right: 10px; white-space: nowrap;"><?php echo $games->leaguetext; ?></td>	
							<td style="padding-right: 10px; white-space: nowrap;"><?php echo $games->roundtext; ?></td>	
							<td style="padding-right: 10px; white-space: nowrap;"><?php echo htmlentities($games->hometeamname); ?></td>
							<td style="padding-right: 10px; white-space: nowrap;">-</td>
							<td style="padding-right: 10px; white-space: nowrap;"><?php echo htmlentities($games->awayteamname); ?></td>
							<td align="right"><?php echo $games->goalshome; ?>&nbsp;</td>
							<td>:&nbsp;</td>
							<td align="right"><?php echo $games->goalsaway; ?></td>	
						</tr>
		<?php
					endforeach;
				}
			}
		?>
	</table>
</div>