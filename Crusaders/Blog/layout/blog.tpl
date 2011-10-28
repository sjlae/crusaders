<div id="blog">
	<div class="blogcontent">
		<table width="95%" cellpadding="0" cellspacing="0" border="0">
			<?php
				foreach($this->blog as $blog): 
			?>	
				<tr>
					<td style="font-size: 13px; font-weight: bold;white-space: nowrap;" valign="top">
						<?php echo $blog['titel'] ?>
					</td>
					<td align="right" style="white-space: nowrap;" valign="top">
						<i><?php echo $blog['timestamp']?>&nbsp;(<?php echo $blog['vorname']?>)</i>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: 6px;">	
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="<?php echo $blog['blogid']; ?>" class="none" onmouseover="pointerMouseOver(<?php if($blog['userid'] == $_SESSION['userid']){echo 'true';}else{echo 'false';} ?>, $(this))" onmouseout="pointerMouseOut(<?php if($blog['userid'] == $_SESSION['userid']){echo 'true';}else{echo 'false';} ?>, $(this))"><?php echo $blog['text']; ?></div>
						<?php
							if((LoggedIn::isAdmin() || LoggedIn::isCoach())
								&& $blog['userid'] == $_SESSION['userid']){
						?>
							<div id="<?php echo $blog['blogid']; ?>_edit" style="display: none;">
								<textarea cols="50" rows="13" id="<?php echo $blog['blogid']; ?>_value"></textarea>
								<img src="images/save.png" alt="Speichern" width="15px" class="<?php echo $blog['blogid']; ?>" style="cursor: pointer;"/>
								<img src="images/cancel.png" alt="Abbrechen" width="15px" class="<?php echo $blog['blogid']; ?>" style="cursor: pointer;"/> 
							</div>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<a href="index.php?type=2&go=comments&id=<?php echo $blog['blogid']; ?>" style="color:#fff;"><?php echo $blog['comments'] ?>&nbsp;Kommentar(e)</a>
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
										<a href="index.php?go=blog&clickedPrevious=true" style="color:#fff;">
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
										<a href="index.php?go=blog&clickedNext=true" style="color:#fff;">
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
<?php
	if(LoggedIn::isAdmin() || LoggedIn::isCoach()){
?>
		<script type="text/javascript">
			$(document).ready(function() {
				$('div[class="none"]').click(function() {
					  if($(this).hasClass('pointer')){
						  var object = $(this);
						  var id = $(this).attr('id'); 
						  getText(id, $(this));
					  }
				});
				$('img[alt="Abbrechen"]').click(function() {
					  var id = $(this).attr('class'); 
					  $('#' + id + '_edit').hide();
					  $('div[id$='+ id +']').show();
				});
				$('img[alt="Speichern"]').click(function() {
					  var id = $(this).attr('class'); 
					  sendText(id);	
				});
			});
			
			function getText(id, object){
				var request = $.ajax({
				  url: "ajax.php",
				  type: "POST",
                  dataType: "html",
				  data: {blogid : id, action : 'blog'}
				});
				
				request.done(function(data) {
					$('#' + id + '_value').val(data);
					object.hide();
					$('#' + id + '_edit').show();
				});
			}
			
			function pointerMouseOver(isExecuted, object){
				if(isExecuted){
					object.addClass("background");
					object.addClass("pointer");
				}
			}
			
			function pointerMouseOut(isExecuted, object){
				if(isExecuted){
					object.removeClass("background");
					object.removeClass("pointer");
				}
			}
			
			function sendText(id){
		        var request = $.ajax({
				  url: "ajax.php",
				  type: "POST",
                  dataType: "html",
				  data: {blogid : id, action : 'blog', value: $('#' + id + '_value').val()}
				});
				
				request.done(function(data) {
					$('div[id$='+ id +']').html(data);
				    $('#' + id + '_edit').hide();
		            $('div[id$='+ id +']').show();
				});
		    }
		</script>
<?php } ?>