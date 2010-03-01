<div id="content">
	<table id="kontakt" border="0">
		<tr>
			<td><b>Vorstand</b><br><br></td>
		</tr>

		<?php
			foreach($this->vorstand as $vorstand): 
		?>
				<tr>
					<td class="amt"><?php echo $vorstand['funktion'] ?></td>
					<td class="name" style="white-space: nowrap;"><?php echo $vorstand['vorname'] ?>&nbsp;<?php echo $vorstand['nachname'] ?></td>
					<td class="telnummer"><?php echo $vorstand['phone'] ?></td>
					<td class="email">
						<?php if($vorstand['email'] != '' && $vorstand['vorname'] != ''){ ?>
							<script language=javascript>
								hideEmailAddress('<?php echo $vorstand['email'] ?>', 'Mail an <?php echo $vorstand['vorname'] ?>');
							</script>
						<?php } ?>
					</td>
				</tr>
		<?php
			endforeach;
		?>
	
		<tr>
			<td><b>Coaches</b><br><br></td>
		</tr>

		<?php
			foreach($this->coaches as $coach): 
		?>
				<tr>
					<td class="amt"><?php echo $coach['teamname'] ?></td>
					<td class="name" style="white-space: nowrap;"><?php echo $coach['vorname'] ?>&nbsp;<?php echo $coach['nachname'] ?></td>
					<td class="telnummer"><?php echo $coach['phone'] ?></td>
					<td class="email">
						<?php if($coach['email'] != '' && $coach['vorname'] != ''){ ?>
							<script language=javascript>
								hideEmailAddress('<?php echo $coach['email'] ?>', 'Mail an <?php echo $coach['vorname'] ?>');
							</script>
						<?php } ?>
					</td>
				</tr>
		<?php
			endforeach;
		?>
	</table>
</div>