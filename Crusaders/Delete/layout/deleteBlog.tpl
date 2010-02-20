<div id="content">
<form action="index.php?go=delete&action=deleteBlog&delete=true" method="POST">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td></td>
			<td style="padding-left: 5px"><b>Zeit</b></td>
			<td style="padding-left: 5px"><b>Vorname</b></td>
			<td style="padding-left: 5px"><b>Nachname</b></td>
			<td style="padding-left: 5px"><b>Titel</b></td>
			<td style="padding-left: 5px"><b>Text</b></td>
		</tr>
		<?php if($this->blog != ''){ ?>	
			<?php $i=0; ?>
			<?php foreach($this->blog as $blog): ?>
				<tr>
					<td><input type="checkbox" name="blog_del[]" value="<?php echo $blog['blogid']; ?>" /></td>
					<td style="padding-left: 5px; white-space: nowrap"><?php echo $blog['timestamp']; ?></td>
					<td style="padding-left: 5px"><?php echo $blog['vorname']; ?></td>
					<td style="padding-left: 5px"><?php echo $blog['nachname']; ?></td>
					<td style="padding-left: 5px"><?php echo $blog['titel']; ?></td>
					<td style="padding-left: 5px"><?php echo $blog['text']; ?></td>
				</tr>
			<?php $i++; ?>
			<?php endforeach; ?>
		<?php } ?>
	</table>
	<input type="submit" value="L&ouml;schen" />
</form>
</div>