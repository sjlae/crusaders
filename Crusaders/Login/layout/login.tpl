<div id="content">
<?php require_once('Layout/infos.tpl'); ?>
<?php require_once('Layout/errors.tpl'); ?>
<h2>Login</h2>
<form action="index.php?go=login&action=login" method="POST">
<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			E-Mail:
		</td>
		<td>
			<input type="text" name="email" value="<?php echo $this->email; ?>" style="width: 150px"/>
		</td>
	</tr>
	<tr>
		<td style="padding-top: 5px">	
			Passwort:
		</td>
		<td>
			<input type="password" name="passwort" style="width: 150px"/>
		</td>
	</tr>
	<tr>
		<td style="padding-top: 10px">
			<input type="submit" value="Log in" />
		</td>
	</tr>
</table>
</form>
</div>