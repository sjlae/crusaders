<table border="0" width="100%">
	<tr>
		<td>
			<table>
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
		</td>
	</tr>
</table>
