<form action="index.php?go=news&action=save" method="POST">
<table>
	<tr>
		<td>
			Titel:
		</td>
		<td>
			<input type="text" name="titel" value="<?php echo $this->titel; ?>" style="width: 150px"/>
		</td>
	</tr>
	<tr>
		<td style="padding-top: 5px">	
			Text:
		</td>
		<td>
			<textarea name="text" rows="5" style="width: 100%;"><?php echo $this->text ?></textarea>
		</td>
	</tr>
	<tr>
		<td style="padding-top: 10px">
			<input type="submit" value="Speichern" />
		</td
	</tr>
</table>
</form>