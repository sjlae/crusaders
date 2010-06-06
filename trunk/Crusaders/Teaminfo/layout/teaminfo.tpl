<div id="content">
	<form action="index.php?go=teaminfo&action=save" method="POST">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td valign="top" style="padding-left: 20px">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td colspan="3">
								<b>1. Training</b>
							</td>
						</tr>
						<tr>
							<td>
								Trainingstag:
							</td>
							<td>
								<input type="text" name="trainingDay1_tag" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. Mittwoch]
							</td>
						</tr>
						<tr>
							<td>
								Trainingshalle:
							</td>
							<td>
								<input type="text" name="trainingDay1_halle" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. Falletsche]
							</td>
						</tr>
						<tr>
							<td>
								Trainingsstart/ende:
							</td>
							<td>
								<input type="text" name="trainingDay1_fromHour" style="width: 20px" maxlength="2"/>:<input type="text" name="trainingDay1_fromMinutes" style="width: 20px" maxlength="2"/>
								bis
								<input type="text" name="trainingDay1_toHour" style="width: 20px" maxlength="2"/>:<input type="text" name="trainingDay1_toMinutes" style="width: 20px" maxlength="2"/>
							</td>
							<td>
								&nbsp;[bspw. 20:30]
							</td>
						</tr>
						<tr>
							<td style="padding-top: 5px" colspan="3">
								<b>2. Training (falls vorhanden)</b>
							</td>
						</tr>
						<tr>
							<td>
								Trainingstag:
							</td>
							<td>
								<input type="text" name="trainingDay2_tag" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. Mittwoch]
							</td>
						</tr>
						<tr>
							<td>
								Trainingshalle:
							</td>
							<td>
								<input type="text" name="trainingDay2_halle" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. Falletsche]
							</td>
						</tr>
						<tr>
							<td>
								Trainingsstart:
							</td>
							<td>
								<input type="text" name="trainingDay2_fromHour" style="width: 20px" maxlength="2"/>:<input type="text" name="trainingDay2_fromMinutes" style="width: 20px" maxlength="2"/>
								bis
								<input type="text" name="trainingDay2_toHour" style="width: 20px" maxlength="2"/>:<input type="text" name="trainingDay2_toMinutes" style="width: 20px" maxlength="2"/>
							</td>
							<td>
								&nbsp;[bspw. 20:30]
							</td>
						</tr>
						<tr>
							<td style="padding-top: 5px" colspan="3">
								<b>1. Trainer</b>
							</td>
						</tr>
						<tr>
							<td>
								Vorname:
							</td>
							<td>
								<input type="text" name="coach1_vorname" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. Kurt]
							</td>
						</tr>
						<tr>
							<td>
								Nachname:
							</td>
							<td>
								<input type="text" name="coach1_nachname" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. Meier]
							</td>
						</tr>
						<tr>
							<td>
								E-Mail:
							</td>
							<td>
								<input type="text" name="coach1_email" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. kurt.meier[at]gmail.com]
							</td>
						</tr>
						<tr>
							<td>
								Telefon:
							</td>
							<td>
								<input type="text" name="coach1_phone" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. 079 111 22 33]
							</td>
						</tr>
						<tr>
							<td style="padding-top: 5px" colspan="3">
								<b>2. Trainer (falls vorhanden)</b>
							</td>
						</tr>
						<tr>
							<td>
								Vorname:
							</td>
							<td>
								<input type="text" name="coach2_vorname" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. Kurt]
							</td>
						</tr>
						<tr>
							<td>
								Nachname:
							</td>
							<td>
								<input type="text" name="coach2_nachname" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. Meier]
							</td>
						</tr>
						<tr>
							<td>
								E-Mail:
							</td>
							<td>
								<input type="text" name="coach2_email" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. kurt.meier[at]gmail.com]
							</td>
						</tr>
						<tr>
							<td>
								Telefon:
							</td>
							<td>
								<input type="text" name="coach2_phone" style="width: 150px"/>
							</td>
							<td>
								&nbsp;[bspw. 079 111 22 33]
							</td>
						</tr>
					</table>
				</td>
				<td valign="top">
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
				</td>
			</tr>
			<tr align="right">
				<td colspan="2">
					<input type="submit" value="Speichern" />
				</td>
			</tr>
		</table>
	</form>
</div>