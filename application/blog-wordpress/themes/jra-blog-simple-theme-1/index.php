<?php get_header(); ?>

	<div class="container">
		<h1 class="page-header">
			<?php echo get_bloginfo( 'name' ); ?> <small><?php echo get_bloginfo( 'description' ); ?></small>
		</h1>
	</div>

	<!-- Page Content -->
	<div class="container">

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
				<nav>
					<ul class="pager">
						<li><?php next_posts_link( 'Previous' ); ?></li>
						<li><?php previous_posts_link( 'Next' ); ?></li>
					</ul>
				</nav>

			</div>
			
			<?php get_sidebar(); ?>
			
		</div>
		<!-- /.row -->
<?php get_footer(); ?>