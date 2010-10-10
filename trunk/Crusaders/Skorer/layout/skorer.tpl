<div id="content">
<?php require_once('Layout/infos.tpl'); ?>
<h4 style="color:red">
1. Das File muss aus dem Excel als Webseite gespeichert werden.<br>
2. Beim Speichern kann gew&auml;hlt werden, ob die ganze Arbeitsmappe oder nur die
Tabelle gespeichert wird. Hier MUSS Tabelle gew&auml;hlt werden.<br>
3. Damit kein horizontaler Scrollbanken entsteht, bitte das File schmal in der 
Breite halten (wenn m&ouml;glich nur 4 Spalten mit Vornamen, Tore, Assists und Total).<br>	
</h4>
<form enctype="multipart/form-data" method="post" action="index.php?go=skorer&action=save">
	<input type="file" id="skorerlist" name="skorerlist" />
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
	<input type="submit" value="Skorerliste speichern" />
</form>
</div>
