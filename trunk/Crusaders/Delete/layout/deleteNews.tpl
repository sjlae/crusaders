<form action="index.php?go=delete&action=deleteNews&delete=true" method="POST">
	<table>
		<tr>
			<td></td>
			<td style="padding-left: 5px"><b>Zeit</b></td>
			<td style="padding-left: 5px"><b>Vorname</b></td>
			<td style="padding-left: 5px"><b>Nachname</b></td>
			<td style="padding-left: 5px"><b>Titel</b></td>
			<td style="padding-left: 5px"><b>Text</b></td>
		</tr>
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
	</table>
	<input type="submit" value="Erfassen" />
</form>