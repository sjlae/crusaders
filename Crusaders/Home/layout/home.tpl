<table border="0" width="100%">
	<tr>
		<td width="50%" valign="top">
			<table>
				<?php
					foreach($this->news as $news): 
				?>	
					<tr>
						<td colspan="2">
							<i><?php echo $news['timestamp']?>&nbsp;(<?php echo $news['vorname']?>&nbsp;<?php echo $news['nachname']?>)</i>&nbsp;-&nbsp;<b><?php echo $news['titel'] ?></b>
							<br><br>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<?php echo $news['text']; ?>	
							&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							<?php
								if($news['more']){
							?>
									<a href="index.php?go=singleMessage&action=news&id=<?php echo $news['newsid']; ?>">Mehr...</a>
							<?php		
								}
							?>
						</td>
						<td align="right">
							<a href="index.php?type=1&go=comments&id=<?php echo $news['newsid']; ?>">[<?php echo $news['comments'] ?>]&nbsp;Kommentar(e)</a>
						</td>
					</tr>		
					<tr><td colspan="2"><hr/></td></tr>		
				<?php
					endforeach;
				?>
			</table>
		</td>
		<td width="50%" align="right" valign="top">
			<table>
				<?php
					foreach($this->results as $games): 
						
						if(($games->LeagueCode != 1011))
						{		
				?>
							<tr>
								<!-- <td><?php echo $games->League; ?></td> -->	
								<td><?php echo $games->Date; ?></td> 
								<td><?php echo $games->HomeTeam; ?></td>	
								<td><?php echo $games->AwayTeam; ?></td>
								<td><?php echo $games->GoalsHomeTeam; ?></td>
								<td><?php echo $games->GoalsAwayTeam; ?></td>	
							</tr>
				<?php
						}
					endforeach;
				?>
			</table>	
		</td>
	</tr>
</table>
