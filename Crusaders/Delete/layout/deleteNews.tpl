<div id="content">
<form action="index.php?go=delete&action=deleteNews&delete=true" method="POST">
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td></td>
			<td style="padding-left: 5px"><b>Zeit</b></td>
			<td style="padding-left: 5px"><b>Vorname</b></td>
			<td style="padding-left: 5px"><b>Nachname</b></td>
			<td style="padding-left: 5px"><b>Titel</b></td>
			<td style="padding-left: 5px"><b>Text</b></td>
		</tr>
		<?php if($this->news != ''){ ?>	
			<?php $i=0; ?>
			<?php foreach($this->news as $news): ?>
				<tr>
					<td><input type="checkbox" name="news_del[]" value="<?php echo $news['newsid']; ?>" /></td>
					<td style="padding-left: 5px"><?php echo $news['timestamp']; ?></td>
					<td style="padding-left: 5px"><?php echo $news['vorname']; ?></td>
					<td style="padding-left: 5px"><?php echo $news['nachname']; ?></td>
					<td style="padding-left: 5px"><?php echo $news['titel']; ?></td>
					<td style="padding-left: 5px"><?php echo $news['text']; ?></td>
				</tr>
			<?php $i++; ?>
			<?php endforeach; ?>
		<?php } ?>
	</table>
	<input type="submit" value="L&ouml;schen" />
</form>
</div>