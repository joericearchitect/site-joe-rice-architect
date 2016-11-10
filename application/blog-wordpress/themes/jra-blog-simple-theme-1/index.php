<?php get_header(); ?>

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<?php
				if (have_posts ()) :
					while ( have_posts () ) :
						the_post ();
						
						get_template_part ( 'content', get_post_format () );
				?>
					<hr class="hr-post-divider">
				
				<?php 
					endwhile;
				 endif;
				?>

				<!-- Pager -->
				<ul class="pager">
					<li class="previous"><a href="#">&larr; Older</a></li>
					<li class="next"><a href="#">Newer &rarr;</a></li>
				</ul>

			</div>
			
			<?php get_sidebar(); ?>
			
		</div>
		<!-- /.row -->
<?php get_footer(); ?>