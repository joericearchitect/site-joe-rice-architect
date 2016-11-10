
				<div class="blog-post-summary">
					<!-- First Blog Post -->
					<h2 class="blog-post-title">
						<a href="#"><?php the_title(); ?></a>
					</h2>
					<p class="lead">
						by <a href="index.php"><?php the_author(); ?></a>
					</p>
					<p>
						<span class="glyphicon glyphicon-time"></span> Posted on <?php the_date(); ?>
					</p>
					<hr>
					<img class="img-responsive" src="http://placehold.it/900x300" alt="">
					<hr>
					<p><?php the_content(); ?></p>
					<a class="btn btn-primary" href="#">Read More <span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
