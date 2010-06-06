<div id="content">
	<?php require_once('Layout/errors.tpl'); ?>
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
			<td width="60%" valign="top">
				<div style="width: 100%; height: 350px; margin: 0; overflow:auto;">
					<table cellpadding="0" cellspacing="0" border="0">
						<?php
							if($this->comments != ''){
								foreach($this->comments as $comment): 
						?>	
								<tr>
									<td>
										<i><?php echo $comment['timestamp']?>&nbsp;(<?php echo $comment['vorname']?>&nbsp;<?php echo $comment['nachname']?>)</i>
										<br><br>
									</td>
								</tr>
								<tr>
									<td width="40%">
										<?php echo $comment['text']; ?>	
										&nbsp;
									</td>
								</tr>
								<tr><td colspan="2"><hr/></td></tr>		
						<?php
								endforeach;
							}
						?>
					</table>
				</div>
			</td>
			<td width="40%" valign="top" style="padding-left: 20px">
				<form action="index.php?type=3&go=comments&action=save&teamid=<?php echo $this->teamid ?>" method="POST">
				<input type="hidden" name="id" value="<?php echo $this->id ?>" />
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
								Vorname:
							</td>
						<tr>
							<td>
								<input type="text" name="vorname" value="<?php echo $this->vorname ?>" style="width: 100px"/>
							</td>
						</tr>
							<td style="padding-top: 10px">
								Nachname:
							</td>
						<tr>
							<td>
								<input type="text" name="nachname" value="<?php echo $this->nachname ?>" style="width: 100px"/>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="padding-top: 10px">	
								Kommentar:
							</td>
						</tr>
						<tr>
							<td>
								<textarea name="text" rows="2" style="width: 100%"><?php echo $this->text ?></textarea>
							</td>
						</tr>
						<tr>
							<td style="padding-top: 10px">
								<input type="submit" value="Erfassen" />
							</td
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
	</br><br>
	<?php if($this->fromSingleMessage != ''){ ?>
		<a href="index.php?go=singleMessage&teamid=<?php echo $this->teamid ?>&action=news&id=<?php echo $this->id; ?>&teamnews=1">zur&uuml;ck</a>
	<?php }else{ ?>
		<a href="index.php?go=teamnews&teamid=<?php echo $this->teamid ?>">zur&uuml;ck</a>
	<?php } ?>
</div>

<div id="stats" title="Resultate und Spielplan">
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/zahlen.gif" border="0"></a>
</div>

<div id="teamshit" title="Team News">
	<a href="index.php?go=teamnews&teamid=<?php echo $this->teamid ?>&del=1"><img src="images/shit.gif" border="0"></a>
</div>

<!--
<div id="gallery" title="Gallerie">
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/gallery.gif" border="0"></a>
</div>
--!>
