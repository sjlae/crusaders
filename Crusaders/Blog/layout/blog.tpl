<div id="blog">
	<div class="blogcontent">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<?php
				foreach($this->blog as $blog): 
			?>	
				<tr>
					<td style="font-size: 13px; font-weight: bold;white-space: nowrap;" valign="top">
						<?php echo $blog['titel'] ?>
					</td>
					<td align="right" style="white-space: nowrap;" valign="top">
						<i><?php echo $blog['timestamp']?>&nbsp;(<?php echo $blog['vorname']?>&nbsp;<?php echo $blog['nachname']?>)</i>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: 6px;">	
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<?php echo $blog['text']; ?>	
						&nbsp;
					</td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<a href="index.php?type=2&go=comments&id=<?php echo $blog['blogid']; ?>"><?php echo $blog['comments'] ?>&nbsp;Kommentar(e)</a>
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
					if($_SESSION['hasNext_Blog'] || $_SESSION['hasPrevious_Blog']){
				?>
						<tr>
							<td>
								<?php
									if($_SESSION['hasPrevious_Blog']){
								?>
										<a href="index.php?go=blog&clickedPrevious=true">
											Neuerer
										</a>
								<?php
									}
								?>
							</td>
							<td align="right">
								<?php
									if($_SESSION['hasNext_Blog']){
								?>
										<a href="index.php?go=blog&clickedNext=true">
											&Auml;lterer
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
</div>		
<div id="spiegel">

</div>