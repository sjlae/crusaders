<div id="content">

<?php
		if($this->news != null){
			?>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="font-size: 13px; font-weight: bold;">
							<?php echo $this->news['titel'] ?>
					</td>
					<td align="right">
							<i><?php echo $this->news['timestamp']?>&nbsp;(<?php echo $this->news['vorname']?>&nbsp;<?php echo $this->news['nachname']?>)</i>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: 6px;">	
							&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
								<?php echo $this->news['text']; ?>
						
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<a href="index.php?type=<?php echo $this->teamnews ? 3 : 1 ?>&teamid=<?php echo $this->teamid ?>&go=comments&fromSingleMessage=true&id=<?php echo $this->news['newsid']; ?>"><?php echo $this->news['comments'] ?>&nbsp;Kommentar(e)</a>
					</td>
				</tr>
			</table>
			<?php
							}
						?>

</br><br><a href="index.php?go=<?php echo $this->teamnews ? teamnews : session ?>&teamid=<?php echo $this->teamid ?>">zur&uuml;ck</a>

</div>

<?php if($this->teamnews){ ?>

<div id="stats" title="Resultate und Spielplan">
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/zahlen.gif" border="0"></a>
</div>

<div id="teamshit" title="Team News">
	<a href="index.php?go=teamnews&teamid=<?php echo $this->teamid ?>&del=1"><img src="images/shit.gif" border="0"></a>
</div>

<!--
<div id="gallery" title="Gallerie">
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/gallery.gif" border="0"></a>
</div>
--!>

<?php } ?>