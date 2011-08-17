<div id="content">
<?php require_once('Layout/infos.tpl'); ?>
<?php require_once('Layout/errors.tpl'); ?>
<form action="index.php?go=teamnewsentry&action=save" method="POST">
<table width="100%" heigth="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td valign="top">
			<?php
				$teamArray = Teams::getTeams();
				for($i = 0; $i < count($teamArray); $i++) {
					if($i == 0)
					{
			?>
						<input type="radio" name="teamid" value="<?php echo $teamArray[$i]['teamid'] ?>" checked="checked"><?php echo $teamArray[$i]['teamname'] ?><br>
			<?php 
					}
					else{ 
			?>
						<input type="radio" name="teamid" value="<?php echo $teamArray[$i]['teamid'] ?>"><?php echo $teamArray[$i]['teamname'] ?><br>
			<?php
					}
				}
			?>	
		</td>
	</tr>
</table>
<br/>
<table width="100%" heigth="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			Titel:
		</td>
		<td>
			<input type="text" name="titel" value="<?php echo $this->titel; ?>" style="width: 600px"/>
		</td>
	</tr>
	<tr>
		<td valign="top">	
			Text:
		</td>
		<td>
			<textarea name="text" rows="5" style="width: 600px;"><?php echo $this->text ?></textarea>
		</td>
	</tr>
	<tr>
		<td valign="top">	
			&nbsp;
		</td>
		<td style="padding-top: 10px">
			<input type="submit" value="Erfassen" />
		</td>
	</tr>
</table>
</form>
</div>