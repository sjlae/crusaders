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
					<div id="<?php echo $news['newsid']; ?>" class="none" onmouseover="pointerMouseOver(<?php if($news['userid'] == $_SESSION['userid']){echo 'true';}else{echo 'false';} ?>, $(this))" onmouseout="pointerMouseOut(<?php if($news['userid'] == $_SESSION['userid']){echo 'true';}else{echo 'false';} ?>, $(this))"><?php echo $news['text']; ?></div>
					<?php
						if((LoggedIn::isAdmin() || LoggedIn::isCoach())
							&& $news['userid'] == $_SESSION['userid']){
					?>
						<div id="<?php echo $news['newsid']; ?>_edit" style="display: none;">
							<textarea cols="70" rows="2" id="<?php echo $news['newsid']; ?>_value"></textarea>
							<img src="images/save.png" alt="Speichern" width="15px" class="<?php echo $news['newsid']; ?>" style="cursor: pointer;"/>
							<img src="images/cancel.png" alt="Abbrechen" width="15px" class="<?php echo $news['newsid']; ?>" style="cursor: pointer;"/> 
						</div>
					<?php } ?>
				</td>
			</tr>
			<tr>
				<td>
					<?php
						if($news['more']){
					?>
							<a href="index.php?go=singleMessage&teamid=<?php echo $this->teamid ?>&action=news&id=<?php echo $news['newsid']; ?>&teamnews=1">Mehr...</a>
					<?php		
						}
					?>
				</td>
				<td align="right">
					<a href="index.php?type=3&teamid=<?php echo $this->teamid ?>&go=comments&id=<?php echo $news['newsid']; ?>"><?php echo $news['comments'] ?>&nbsp;Kommentar(e)</a>
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
				if($_SESSION['hasNext_Team'] || $_SESSION['hasPrevious_Team']){
			?>
					<tr>
						<td>
							<?php
								if($_SESSION['hasPrevious_Team']){
							?>
									<a href="index.php?go=teamnews&clickedPrevious=true&teamid=<?php echo $this->teamid ?>">
										Neuere 4 News
									</a>
							<?php
								}
							?>
						</td>
						<td align="right">
							<?php
								if($_SESSION['hasNext_Team']){
							?>
									<a href="index.php?go=teamnews&clickedNext=true&teamid=<?php echo $this->teamid ?>">
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

<div id="stats" title="Resultate und Spielplan">
	<a href="index.php?go=stats&teamid=<?php echo $this->teamid ?>"><img src="images/zahlen.gif" border="0"></a>
</div>

<div id="teamshit" title="Team News">
	<a href="index.php?go=teamnews&teamid=<?php echo $this->teamid ?>&del=1"><img src="images/team.gif" border="0"></a>
</div>

<div id="spiegel">
	<?php 
		if(file_exists('Skorerlists/'.$this->teamid.'.htm')){
			include('Skorerlists/'.$this->teamid.'.htm'); 
		}
	?>
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
				  data: {newsid : id, action : 'teamNews'}
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
				  data: {newsid : id, action : 'teamNews', value: $('#' + id + '_value').val()}
				});
				
				request.done(function(data) {
					$('div[id$='+ id +']').html(data);
				    $('#' + id + '_edit').hide();
		            $('div[id$='+ id +']').show();
				});
		    }
		</script>
<?php } ?>