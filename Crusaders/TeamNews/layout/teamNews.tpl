<div id="content">
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<?php
			foreach($this->news as $news): 
		?>	
			<tr>
				<td style="font-size: 13px; font-weight: bold;">
					<?php echo $news['titel'] ?>
				</td>
				<td align="right">
					<i><?php echo $news['timestamp']?>&nbsp;(<?php echo $news['vorname']?>&nbsp;<?php echo $news['nachname']?>)</i>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="font-size: 6px;">	
					&nbsp;
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
							<a href="index.php?go=singleMessage&teamid=<?php echo $this->teamid ?>&action=news&id=<?php echo $news['newsid']; ?>&teamnews=1">Mehr...</a>
					<?php		
						}
					?>
				</td>
				<td align="right">
					<a href="index.php?type=3&teamid=<?php echo $this->teamid ?>&go=comments&id=<?php echo $news['newsid']; ?>"><?php echo $news['comments'] ?>&nbsp;Kommentar(e)</a>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="font-size: 12px;">	
					&nbsp;
				</td>
			</tr>		
				
		<?php
			endforeach;
		?>
			<?php
				if($_SESSION['hasNext_Team'] || $_SESSION['hasPrevious_Team']){
			?>
					<tr>
						<td>
							<?php
								if($_SESSION['hasPrevious_Team']){
							?>
									<a href="index.php?go=teamnews&clickedPrevious=true&teamid=<?php echo $this->teamid ?>">
										Neuere 4 News
									</a>
							<?php
								}
							?>
						</td>
						<td align="right">
							<?php
								if($_SESSION['hasNext_Team']){
							?>
									<a href="index.php?go=teamnews&clickedNext=true&teamid=<?php echo $this->teamid ?>">
										&Auml;ltere 4 News
									</a>
							<?php
								}
							?>
						</td>
					</tr>
			<?php
				}
			?>
	</table>
</div>

<div id="stats" title="Resultate und Spielplan">
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/zahlen.gif" border="0"></a>
</div>

<div id="teamshit" title="Team News">
	<a href="index.php?go=teamnews&teamid=<?php echo $this->teamid ?>&del=1"><img src="images/team.gif" border="0"></a>
</div>

<!--
<div id="gallery" title="Gallerie">
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/gallery.gif" border="0"></a>
</div>
--!>