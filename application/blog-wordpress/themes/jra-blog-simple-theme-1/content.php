
				<div class="blog-post-summary">
					<!-- First Blog Post -->
					<h2 class="blog-post-title">
						<a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
					</h2>
					<p class="lead">
						by <a href="index.php"><?php the_author(); ?></a>
					</p>
					<p>
						<span class="glyphicon glyphicon-time"></span> Posted on <?php the_date(); ?>
						<span>&nbsp;&nbsp;
							<a href="<?php comments_link(); ?>">
								<?php
								printf( _nx( 'One Comment', '%1$s Comments', get_comments_number(), 'comments title', 'textdomain' ), number_format_i18n( 						get_comments_number() ) ); ?>
							</a>
						</span>
					</p>
					
					<hr>
					<p><?php the_excerpt(); ?></p>
				</div>
