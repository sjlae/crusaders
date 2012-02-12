<?php if(is_array($_SESSION['errors'])): ?>
	<div style="background-color: #FF0000; padding-top: 5px; padding-bottom: 5px" id="errors">
		<p><b>Fehler:</b></p>
		<ul>	
			<?php foreach($_SESSION['errors'] as $error):?>
				<li><?php echo $error; ?></li>
			<?php endforeach ?>
			<?php unset($_SESSION['errors']); ?>
		</ul>
	</div>
	<br/>
<?php endif?>
