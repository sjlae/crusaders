<?php if(is_array($_SESSION['infos'])): ?>
	<div style="background-color: #7F99FF; padding-top: 5px; padding-bottom: 5px" id="infos">
		<p><b>Information/en:</b></p>
		<ul>	
			<?php foreach($_SESSION['infos'] as $info):?>
				<li><?php echo $info; ?></li>
			<?php endforeach ?>
			<?php unset($_SESSION['infos']); ?>
		</ul>
	</div>
	<br/>
<?php endif?>
