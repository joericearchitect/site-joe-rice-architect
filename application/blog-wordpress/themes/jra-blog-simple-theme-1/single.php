<?php get_header(); ?>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<?php
				if (have_posts ()) :
					while ( have_posts () ) :
						the_post ();
						
						get_template_part ( 'content-post', get_post_format () );

						if ( comments_open() || get_comments_number() ) :
						comments_template();
						endif;
					
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