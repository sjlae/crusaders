<div id="content">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td><b>Vorstand</b></td>
		</tr>
		<tr>
			<td><b>Amt</b></td>
			<td><b>Name</b></td>
			<td><b>Telefon</b></td>
			<td><b>E-Mail</b></td>
		</tr>
		<tr>
			<td>Pr&auml;sident</td>
			<td>Andres Hartmann</td>
			<td>044 482 61 88</td>
			<td>andres.h@bluemail.ch</td>
		</tr>
		<tr>
			<td>Co-Pr&auml;sident</td>
			<td>Andi Por</td>
			<td>076 330 39 92</td>
			<td>por@gmx.ch</td>
		</tr>
		<tr>
			<td>Sportchef</td>
			<td>Jonduri Hohl</td>
			<td>079 617 68 64</td>
			<td>grizzly@crusaders.ch</td>
		</tr>
		<tr>
			<td>Kassier</td>
			<td>Serge Pfeifer</td>
			<td>079 209 71 58</td>
			<td>serge.pfeifer@gmail.com</td>
		</tr>
		<tr>
			<td>Beisitzer</td>
			<td>Tom Hartmann</td>
			<td>?</td>
			<td>horsthommel@bluemail.ch</td>
		</tr>
	</table>
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td><b>Coaches</b></td>
		</tr>
		<tr>
			<td><b>Mannschaft</b></td>
			<td><b>Name</b></td>
			<td><b>Telefon</b></td>
			<td><b>E-Mail</b></td>
		</tr>
		<?php
			foreach($this->coaches as $coach): 
		?>
				<tr>
					<td><?php echo $coach['teamname'] ?></td>
					<td><?php echo $coach['vorname'] ?> <?php echo $coach['nachname'] ?></td>
					<td><?php echo $coach['phone'] ?></td>
					<td><?php echo $coach['email'] ?></td>
				</tr>
		<?php
			endforeach;
		?>
	</table>
</div>