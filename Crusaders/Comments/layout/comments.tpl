<div id="content">
	<?php require_once('Layout/errors.tpl'); ?>
	<table cellpadding="0" cellspacing="0" border="0" width="60%">
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
	</table>
	</form>
	</br><br>
	<?php if($this->fromSingleMessage != ''){ ?>
		<a href="index.php?go=singleMessage&action=news&id=<?php echo $this->id; ?>">zur&uuml;ck</a>
	<?php }else{ ?>
		<a href="index.php">zur&uuml;ck</a>
	<?php } ?>
</div>
