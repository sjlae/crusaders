<div id="content">
<form action="index.php?go=delete&action=deleteUser&delete=true" method="POST">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td></td>
			<td style="padding-left: 5px"><b>Vorname</b></td>
			<td style="padding-left: 5px"><b>Nachname</b></td>
			<td style="padding-left: 5px"><b>Email</b></td>
			<td style="padding-left: 5px"><b>Admin</b></td>
			<td style="padding-left: 5px"><b>Coach</b></td>
			<td style="padding-left: 5px"><b>Blogger</b></td>
		</tr>
		<?php $i=0; ?>
		<?php foreach($this->user as $user): ?>
			<tr>
				<td><input type="checkbox" name="user_del[]" value="<?php echo $user['userid']; ?>" /></td>
				<td style="padding-left: 5px"><?php echo $user['vorname']; ?></td>
				<td style="padding-left: 5px"><?php echo $user['nachname']; ?></td>
				<td style="padding-left: 5px"><?php echo $user['email']; ?></td>
				<td style="padding-left: 5px"><?php echo $user['admin']; ?></td>
				<td style="padding-left: 5px"><?php echo $user['coach']; ?></td>
				<td style="padding-left: 5px"><?php echo $user['blogger']; ?></td>
			</tr>
			<?php $i++; ?>
		<?php endforeach; ?>
	</table>
	<input type="submit" value="L&ouml;schen" />
</form>
</div>