<?php require_once('Layout/errors.tpl'); ?>
<form action="index.php?type=1&go=comments&action=save" method="POST">
	<input type="hidden" name="id" value="<?php echo $this->id ?>" />
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>
				Vorname:
			</td>
			<td>
				<input type="text" name="vorname" value="<?php echo $this->vorname ?>" style="width: 100px"/>
			</td>
			<td style="padding-right: 20px; padding-left: 20px">
				Nachname:
			</td>
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
			<td colspan="4">
				<textarea name="text" rows="2" style="width: 100%"><?php echo $this->text ?></textarea>
			</td>
		</tr>
		<tr>
			<td style="padding-top: 10px">
				<input type="submit" value="Erfassen" />
			</td
		</tr>
		<tr>
			<td colspan="4">
				<hr/>
			</td>
		</tr>
	</table>
</form>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<?php
					if($this->comments != ''){
						foreach($this->comments as $comment): 
				?>	
						<tr>
							<td>
								<i><?php echo $comment['timestamp']?>&nbsp;(<?php echo $comment['vorname']?>&nbsp;<?php echo $comment['nachname']?>)</i>
								<br><br>
							</td>
						</tr>
						<tr>
							<td>
								<?php echo $comment['text']; ?>	
								&nbsp;
							</td>
						</tr>
						<tr><td colspan="2"><hr/></td></tr>		
				<?php
						endforeach;
					}
				?>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<a href="index.php">zur&uuml;ck</a>
		</td>
	</tr>
</table>
