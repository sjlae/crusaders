<div id="content">
<?php require_once('Layout/infos.tpl'); ?>
<?php require_once('Layout/errors.tpl'); ?>
<h4 style="color:red">Das Bild muss in einem 4:3 (L&auml;nge/Breite) Verh&auml;ltnis sein und darf nicht gr&ouml;sser als 300 KB sein!</h4>
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
