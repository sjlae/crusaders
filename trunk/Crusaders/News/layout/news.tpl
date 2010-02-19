<div id="content">
<?php require_once('Layout/infos.tpl'); ?>
<?php require_once('Layout/errors.tpl'); ?>
<form action="index.php?go=news&action=save" method="POST">
<table width="100%" heigth="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			Titel:
		</td>
		<td>
			<input type="text" name="titel" value="<?php echo $this->titel; ?>" style="width: 400px"/>
		</td>
	</tr>
	<tr>
		<td valign="top">	
			Text:
		</td>
		<td>
			<textarea name="text" rows="5" style="width: 400px;"><?php echo $this->text ?></textarea>
		</td>
	</tr>
	<tr>
		<td valign="top">	
			&nbsp;
		</td>
		<td style="padding-top: 10px">
			<input type="submit" value="Erfassen" />
		</td
	</tr>
</table>
</form>
</div>