<div id="content">
<form action="index.php?go=delete&action=deleteGuestbook&delete=true" method="POST">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td></td>
			<td style="padding-left: 5px"><b>Zeit</b></td>
			<td style="padding-left: 5px"><b>Vorname</b></td>
			<td style="padding-left: 5px"><b>Nachname</b></td>
			<td style="padding-left: 5px"><b>Text</b></td>
		</tr>
		<?php if($this->guestbook != ''){ ?>	
			<?php $i=0; ?>
			<?php foreach($this->guestbook as $guestbook): ?>
				<tr>
					<td><input type="checkbox" name="guestbook_del[]" value="<?php echo $guestbook['id']; ?>" /></td>
					<td style="padding-left: 5px; white-space: nowrap"><?php echo $guestbook['timestamp']; ?></td>
					<td style="padding-left: 5px"><?php echo $guestbook['vorname']; ?></td>
					<td style="padding-left: 5px"><?php echo $guestbook['nachname']; ?></td>
					<td style="padding-left: 5px"><?php echo $guestbook['text']; ?></td>
				</tr>
			<?php $i++; ?>
			<?php endforeach; ?>
		<?php } ?>
	</table>
	<input type="submit" value="L&ouml;schen" />
</form>
</div>