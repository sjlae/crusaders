<div id="content">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<?php
					foreach($this->news as $news): 
				?>	
					<tr>
						<td style="font-size: 13px; font-weight: bold;">
							<?php echo $news['titel'] ?>
						</td>
						<td align="right">
							<i><?php echo $news['timestamp']?>&nbsp;(<?php echo $news['vorname']?>&nbsp;<?php echo $news['nachname']?>)</i>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="font-size: 6px;">	
							&nbsp;
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<?php echo $news['text']; ?>	
							&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							<?php
								if($news['more']){
							?>
									<a href="index.php?go=singleMessage&action=news&id=<?php echo $news['newsid']; ?>">Mehr...</a>
							<?php		
								}
							?>
						</td>
						<td align="right">
							<a href="index.php?type=1&go=comments&id=<?php echo $news['newsid']; ?>"><?php echo $news['comments'] ?>&nbsp;Kommentar(e)</a>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="font-size: 12px;">	
							&nbsp;
						</td>
					</tr>		
						
				<?php
					endforeach;
				?>
					<?php
						if($_SESSION['hasNext'] || $_SESSION['hasPrevious']){
					?>
							<tr>
								<td>
									<?php
										if($_SESSION['hasPrevious']){
									?>
											<a href="index.php?clickedPrevious=true">
												Neuere 4 News
											</a>
									<?php
										}
									?>
								</td>
								<td align="right">
									<?php
										if($_SESSION['hasNext']){
									?>
											<a href="index.php?clickedNext=true">
												&Auml;ltere 4 News
											</a>
									<?php
										}
									?>
								</td>
							</tr>
					<?php
						}
					?>
			</table>
	</div>		
	<div id="spiegel">
			<?php echo $this->url ?>
	</div>	