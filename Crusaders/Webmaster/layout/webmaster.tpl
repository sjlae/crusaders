<div id="content">
	<form action="index.php?go=webmaster&action=save" method="POST">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>
					<b>SortID</b>
				</td>
				<td style="padding-left: 10px;">
					<b>RestTeamId</b>
				</td>
				<td style="padding-left: 10px;">
					<b>TeamName</b>
				</td>
				<td style="padding-left: 10px;">
					<b>TeamCode</b>
				</td>
				<td style="padding-left: 10px;">
					<b>TeamGroup</b>
				</td>
				<td style="padding-left: 10px;">
					<b>Club</b>
				</td>
				<td style="padding-left: 10px;">
					<b>Spielgemeinschaft</b>
				</td>
			</tr>
			<?php
				foreach($this->infos as $info): 
			?>
					<input type="hidden" name="teamid[]" value="<?php echo $info['teamid'] ?>" />
					<tr>
						<td style="padding-top: 5px;">
							<input type="text" name="sortid_<?php echo $info['teamid'] ?>" style="width: 30px" value="<?php echo $info['sortid'] ?>"/>
						</td>
						<td style="padding-left: 10px;padding-top: 5px;">
							<input type="text" name="restteamid_<?php echo $info['teamid'] ?>" style="width: 50px" value="<?php echo $info['restteamid'] ?>"/>
						</td>
						<td style="padding-left: 10px;padding-top: 5px;">
							<input type="text" name="teamname_<?php echo $info['teamid'] ?>" style="width: 150px" value="<?php echo $info['teamname'] ?>"/>
						</td>
						<td style="padding-left: 10px;padding-top: 5px;">
							<input type="text" name="teamcode_<?php echo $info['teamid'] ?>" style="width: 40px" value="<?php echo $info['teamcode'] ?>"/>
						</td>
						<td style="padding-left: 10px;padding-top: 5px;">
							<input type="text" name="teamgroup_<?php echo $info['teamid'] ?>" style="width: 40px" value="<?php echo $info['teamgroup'] ?>"/>
						</td>
						<td style="padding-left: 10px;padding-top: 5px;">
							<input type="text" name="club_<?php echo $info['teamid'] ?>" style="width: 100px" value="<?php echo $info['club'] ?>"/>
						</td>
						<td style="padding-left: 10px;padding-top: 5px;">
							<input type="text" name="spielgemeinschaft_<?php echo $info['teamid'] ?>" style="width: 40px" value="<?php echo $info['spielgemeinschaft'] ?>"/>
						</td>
					</tr>
			<?php
				endforeach;
			?>
			<tr>
				<td style="padding-top: 5px;" colspan="6" align="right">
					<input type="submit" value="Speichern" />
				</td>
			</tr>
		</table>
	</form>
	<br/>
	<form action="index.php?go=webmaster&action=new" method="POST">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td style="padding-top: 5px;">
					<input type="text" name="sortid" style="width: 30px"/>
				</td>
				<td style="padding-left: 10px;padding-top: 5px;">
					<input type="text" name="restteamid" style="width: 50px"/>
				</td>
				<td style="padding-left: 10px;padding-top: 5px;">
					<input type="text" name="teamname" style="width: 150px"/>
				</td>
				<td style="padding-left: 10px;padding-top: 5px;">
					<input type="text" name="teamcode" style="width: 40px"/>
				</td>
				<td style="padding-left: 10px;padding-top: 5px;">
					<input type="text" name="teamgroup" style="width: 40px"/>
				</td>
				<td style="padding-left: 10px;padding-top: 5px;">
					<input type="text" name="club" style="width: 100px"/>
				</td>
				<td style="padding-left: 10px;padding-top: 5px;">
					<input type="text" name="spielgemeinschaft" style="width: 40px"/>
				</td>
			</tr>
			<tr>
				<td style="padding-top: 5px;" colspan="6" align="right">
					<input type="submit" value="Erfassen" />
				</td>
			</tr>
		</table>
	</form>
</div>