<div id="blog">
	<div class="blogcontent">
		<?php require_once('Layout/errors.tpl'); ?>

					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<?php
							if($this->comments != ''){
								foreach($this->comments as $comment): 
						?>	
								<tr>
									<td>
										<i><?php echo $comment['timestamp']?>&nbsp;(<?php echo $comment['vorname']?>&nbsp;<?php echo $comment['nachname']?>)</i>
									</td>
								</tr>
								<tr>
									<td style="font-size: 6px;">&nbsp;</td>	
								</tr>
								<tr>
									<td>
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
			<form action="index.php?type=2&go=comments&action=save" method="POST">
			<input type="hidden" name="id" value="<?php echo $this->id ?>" />
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr style="padding-top: 10px">
					<td>
						Vorname:
					</td>
					<td>
						<input type="text" name="vorname" value="<?php echo $this->vorname ?>" style="width: 100px"/>
					</td>
					<td style="padding-right: 20px; padding-left: 20px">
						Nachname:
					</td>
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
					<td colspan="4">
						<textarea name="text" rows="2" style="width: 97%"><?php echo $this->text ?></textarea>
					</td>
				</tr>
				<tr>
					<td style="padding-top: 10px" colspan="4">
						<img src="captcha/captcha.php" border="0" title="Sicherheitscode">
						<input type="text" name="sicherheitscode" size="5" maxlength="5">
						<input type="submit" value="Erfassen" />
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<hr/>
					</td>
				</tr>
			</table>
		</form>

		<a href="index.php?go=blog" style="color:#fff;">zur&uuml;ck</a>

	</div>
</div>
