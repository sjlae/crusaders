<div id="content">
<form enctype="multipart/form-data" method="post" action="index.php?go=picture&action=save">
	<input type="file" id="picture" name="picture" />
	<br>
	<?php
		$teamArray = Constants::getTeams();
		for($i = 0; $i < $teamArray[size]; $i++) {
			if($i == 0)
			{
	?>
				<input type="radio" name="team" value="<?php echo $teamArray[$i][0] ?>" checked="checked"><?php echo $teamArray[$i][0] ?><br>
	<?php 
			}
			else{ 
	?>
				<input type="radio" name="team" value="<?php echo $teamArray[$i][0] ?>"><?php echo $teamArray[$i][0] ?><br>
	<?php
			}
		}
	?>	
	<br>
	<input type="submit" value="Bild speichern" />
</form>
</div>
