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
						<a href="index.php?type=1&go=comments&fromSingleMessage=true&id=<?php echo $this->news['newsid']; ?>"><?php echo $this->news['comments'] ?>&nbsp;Kommentar(e)</a>
					</td>
				</tr>
			</table>
			<?php
							}
						?>

</br><br><a href="index.php?go=session">zur&uuml;ck</a>

</div>