<div id="content">
<form enctype="multipart/form-data" method="post" action="index.php?go=picture&action=save">
	<input type="file" id="picture" name="picture" />
	<br>
	<?php
		$teamArray = Teams::getTeams();
		for($i = 0; $i < count($teamArray); $i++) {
			if($i == 0)
			{
	?>
				<input type="radio" name="team" value="<?php echo $teamArray[$i]['teamid'] ?>" checked="checked"><?php echo $teamArray[$i]['teamname'] ?><br>
	<?php 
			}
			else{ 
	?>
				<input type="radio" name="team" value="<?php echo $teamArray[$i]['teamid'] ?>"><?php echo $teamArray[$i]['teamname'] ?><br>
	<?php
			}
		}
	?>	
	<br>
	<input type="submit" value="Bild speichern" />
</form>
</div>
