<table border="0" width="100%">
	<tr>
		<td>
			<table>
				<tr>
					<td>
						<?php
							if($this->news != null){
						?>
								<i><?php echo $this->news['timestamp']?>&nbsp;(<?php echo $this->news['vorname']?>&nbsp;<?php echo $this->news['nachname']?>)</i>&nbsp;-&nbsp;<b><?php echo $this->news['titel'] ?></b>
								<br><br>
								<?php echo $this->news['text']; ?>
						<?php
							}
						?>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<a href="index.php">zur&uuml;ck</a>
		</td>
	</tr>
</table>