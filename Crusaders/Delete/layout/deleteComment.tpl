<div id="content">
<form action="index.php?go=delete&action=deleteComment&delete=true" method="POST">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td></td>
			<td style="padding-left: 5px"><b>Vorname</b></td>
			<td style="padding-left: 5px"><b>Nachname</b></td>
			<td style="padding-left: 5px"><b>Zeit</b></td>
			<td style="padding-left: 5px"><b>Text</b></td>
		</tr>
		<?php if($this->comment != ''){ ?>
			<?php $i=0; ?>
			<?php foreach($this->comment as $comment): ?>
				<tr>
					<td><input type="checkbox" name="comment_del[]" value="<?php echo $comment['id']; ?>" /></td>
					<td style="padding-left: 5px"><?php echo $comment['vorname']; ?></td>
					<td style="padding-left: 5px"><?php echo $comment['nachname']; ?></td>
					<td style="padding-left: 5px"><?php echo $comment['timestamp']; ?></td>
					<td style="padding-left: 5px"><?php echo $comment['text']; ?></td>
				</tr>
				<?php $i++; ?>
			<?php endforeach; ?>
		<?php } ?>
	</table>
	<input type="submit" value="L&ouml;schen" />
</form>
</div>