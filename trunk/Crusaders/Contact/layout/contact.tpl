<div id="content">
	<table id="kontakt" border="0">
		<tr>
			<td><b>Vorstand</b><br><br></td>
		</tr>

		<tr>
			<td class="amt">Pr&auml;sident</td>
			<td class="name">Andres Hartmann</td>
			<td class="telnummer">044 482 61 88</td>
			<td class="email">andres.h@bluemail.ch</td>
		</tr>
		<tr>
			<td class="amt">Co-Pr&auml;sident</td>
			<td class="name">Andi Por</td>
			<td class="telnummer">076 330 39 92</td>
			<td class="email">por@gmx.ch</td>
		</tr>
		<tr>
			<td class="amt">Sportchef</td>
			<td class="name">Jonduri Hohl</td>
			<td class="telnummer">079 617 68 64</td>
			<td class="email">grizzly@crusaders.ch</td>
		</tr>
		<tr>
			<td class="amt">Kassier</td>
			<td class="name">Serge Pfeifer</td>
			<td class="telnummer">079 209 71 58</td>
			<td class="email">serge.pfeifer@gmail.com</td>
		</tr>
		<tr>
			<td class="amt">Beisitzer</td>
			<td class="name">Tom Hartmann</td>
			<td class="telnummer">?</td>
			<td class="email">horsthommel@bluemail.ch</td>
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
					<td class="name"><?php echo $coach['vorname'] ?><?php echo $coach['nachname'] ?></td>
					<td class="telnummer"><?php echo $coach['phone'] ?></td>
					<td class="email"><?php echo $coach['email'] ?></td>
				</tr>
		<?php
			endforeach;
		?>
	</table>
</div>