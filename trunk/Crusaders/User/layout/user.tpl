<div id="content">
<?php require_once('Layout/infos.tpl'); ?>
User erfassen
<form action="index.php?go=user&action=save" method="POST">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td style="padding-top: 5px">	
				Vorname:
			</td>
			<td>
				<input type="text" name="vorname" style="width: 150px" />
			</td>
		</tr>
		<tr>
			<td>
				Nachname:
			</td>
			<td>
				<input type="text" name="nachname" style="width: 150px" />
			</td>
		</tr>
		<tr>
			<td style="padding-top: 5px">	
				Email:
			</td>
			<td>
				<input type="text" name="email" style="width: 150px" />
			</td>
		</tr>
		<tr>
			<td style="padding-top: 5px">	
				Passwort:
			</td>
			<td>
				<input type="text" name="passwort" style="width: 150px"/>
			</td>
		</tr>
		<tr>
			<td style="padding-top: 5px">	
				User Profil:
			</td>
			<td>
				<select name="profil" style="width: 150px">
			      <option value="admin">Admin</option>
			      <option value="coach">Coach</option>
			      <option value="blogger">Blogger</option>
			    </select>
			</td>
		</tr>
		<tr>
			<td style="padding-top: 10px">
				<input type="submit" value="Erfassen" />
			</td
		</tr>
	</table>
</form>
</div>
