<div id="content">
			<table width="650" cellpadding="0" cellspacing="0" border="0">
				<?php
					foreach($this->news as $news): 
				?>	
					<tr>
						<td colspan="2">
							<i><?php echo $news['timestamp']?>&nbsp;(<?php echo $news['vorname']?>&nbsp;<?php echo $news['nachname']?>)</i>&nbsp;-&nbsp;<b><?php echo $news['titel'] ?></b>
							<br><br>
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
							<a href="index.php?type=1&go=comments&id=<?php echo $news['newsid']; ?>">[<?php echo $news['comments'] ?>]&nbsp;Kommentar(e)</a>
						</td>
					</tr>		
					<tr><td colspan="2"><hr/></td></tr>		
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
		<table id="resultate">
			<object width="320" height="265"><param name="movie" value="http://www.youtube.com/v/kdjKHBbD7ys&hl=de_DE&fs=1&"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/kdjKHBbD7ys&hl=de_DE&fs=1&" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="320" height="265"></embed></object>
		</table>
	</div>	