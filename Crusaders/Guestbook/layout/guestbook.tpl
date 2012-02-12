<div id="guestbook">
	<div class="bookcontent">
		<?php foreach($this->entries as $entry): ?>
		<table border="0" width="100%">
			<tr>
				<td><b><?php echo $entry['vorname'] ?>&nbsp;<?php echo $entry['nachname'] ?></b>&nbsp;schrieb am&nbsp;<?php echo $entry['timestamp'] ?></td>
			</tr>
			<tr>
				<td><?php echo $entry['text'] ?></td>
			</tr>
			<hr noshade="noshade" width="100%"/>
		</table>
	<?php endforeach; ?>
	<hr noshade="noshade" width="100%"/>
	</div>
	
	<div class="bookwrite">
		<?php require_once('Layout/errors.tpl'); ?>
		<form action="index.php?go=guestbook&action=save" method="POST">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
						Vorname:
					</td>
				<tr>
					<td>
						<input type="text" name="vorname" value="<?php echo $this->vorname ?>" style="width: 100px"/>
					</td>
				</tr>
					<td style="padding-top: 10px">
						Nachname:
					</td>
				<tr>
					<td>
						<input type="text" name="nachname" value="<?php echo $this->nachname ?>" style="width: 100px"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="padding-top: 10px">	
						Kommentar:
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="text" rows="2" style="width: 100%"><?php echo $this->text ?></textarea>
					</td>
				</tr>
				<tr>
					<td style="padding-top: 10px">
						<img src="captcha/captcha.php" border="0" title="Sicherheitscode">
						<input type="text" name="sicherheitscode" size="5" maxlength="5"><br>
						<input type="submit" value="Erfassen" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>