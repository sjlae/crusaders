<div id="content">
	<form action="index.php?go=vorstandsinfos&action=save" method="POST">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>
					<b>Funktion</b>
				</td>
				<td style="padding-left: 10px;">
					<b>Vorname</b>
				</td>
				<td style="padding-left: 10px;">
					<b>Nachname</b>
				</td>
				<td style="padding-left: 10px;">
					<b>Telefon</b>
				</td>
				<td style="padding-left: 10px;">
					<b>E-Mail</b>
				</td>
			</tr>
			<?php
				foreach($this->infos as $info): 
			?>
					<input type="hidden" name="id[]" value="<?php echo $info['id'] ?>" />
					<tr>
						<td style="padding-top: 5px;">
							<input type="text" name="funktion_<?php echo $info['id'] ?>" style="width: 90px" value="<?php echo $info['funktion'] ?>"/>
						</td>
						<td style="padding-left: 10px;padding-top: 5px;">
							<input type="text" name="vorname_<?php echo $info['id'] ?>" style="width: 70px" value="<?php echo $info['vorname'] ?>"/>
						</td>
						<td style="padding-left: 10px;padding-top: 5px;">
							<input type="text" name="nachname_<?php echo $info['id'] ?>" style="width: 90px" value="<?php echo $info['nachname'] ?>"/>
						</td>
						<td style="padding-left: 10px;padding-top: 5px;">
							<input type="text" name="phone_<?php echo $info['id'] ?>" style="width: 100px" value="<?php echo $info['phone'] ?>"/>
						</td>
						<td style="padding-left: 10px;padding-top: 5px;">
							<input type="text" name="email_<?php echo $info['id'] ?>" style="width: 180px" value="<?php echo $info['email'] ?>"/>
						</td>
					</tr>
			<?php
				endforeach;
			?>
			<tr>
				<td style="padding-top: 5px;" colspan="5" align="right">
					<input type="submit" value="Speichern" />
				</td>
			</tr>
		</table>
	</form>
</div>