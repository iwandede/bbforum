<?php 	defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<!-- POSTS -->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
		<?php if( count($posts) && is_array($posts) ): ?>

			<?php foreach($posts as $post): ?>
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-users"></i> <?php echo $post['title']?> 
					<a href="/view/<?php echo $post['id']; ?>/<?php echo $post['url-title']?>"><i class="fa fa-reply"></a></i>
				</div>
				<div class="panel-body">
					<?php echo $post['description']; ?>
				</div>
			</div>
			<?php endforeach; ?>
		<?php endif;?>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<!-- POSTS -->