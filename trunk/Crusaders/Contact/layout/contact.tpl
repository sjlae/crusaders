<div id="content">
	<table id="kontakt" border="0">
		<tr>
			<td><b>Vorstand</b><br><br></td>
		</tr>

		<tr>
			<td class="amt">Pr&auml;sident</td>
			<td class="name">Andres Hartmann</td>
			<td class="telnummer">044 482 61 88</td>
			<td class="email">
				<script language=javascript>
					hideEmailAddress('andres.h@bluemail.ch', 'Mail an Andres');
				</script>
			</td>
		</tr>
		<tr>
			<td class="amt">Co-Pr&auml;sident</td>
			<td class="name">Andi Por</td>
			<td class="telnummer">076 330 39 92</td>
			<td class="email">
				<script language=javascript>
					hideEmailAddress('por@gmx.ch', 'Mail an Andi');
				</script>
			</td>
		</tr>
		<tr>
			<td class="amt">Sportchef</td>
			<td class="name">Jonduri Hohl</td>
			<td class="telnummer">079 617 68 64</td>
			<td class="email">
				<script language=javascript>
					hideEmailAddress('grizzly@crusaders.ch', 'Mail an Jonduri');
				</script>
			</td>
		</tr>
		<tr>
			<td class="amt">Kassier</td>
			<td class="name">Serge Pfeifer</td>
			<td class="telnummer">079 209 71 58</td>
			<td class="email">
				<script language=javascript>
					hideEmailAddress('serge.pfeifer@gmail.com', 'Mail an Serge');
				</script>
			</td>
		</tr>
		<tr>
			<td class="amt">Beisitzer</td>
			<td class="name">Tom Hartmann</td>
			<td class="telnummer">?</td>
			<td class="email">
				<script language=javascript>
					hideEmailAddress('horsthommel@bluemail.ch', 'Mail an Tom');
				</script>
			</td>
		</tr>
	</table>
	&nbsp;
	<table id="kontakt2" border="0">
		<tr>
			<td><b>Coaches</b><br><br></td>
		</tr>

		<?php
			foreach($this->coaches as $coach): 
		?>
				<tr>
					<td class="amt"><?php echo $coach['teamname'] ?></td>
					<td class="name"><?php echo $coach['vorname'] ?>&nbsp;<?php echo $coach['nachname'] ?></td>
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