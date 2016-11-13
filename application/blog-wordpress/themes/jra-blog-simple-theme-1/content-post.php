
                <!-- Blog Post -->

                <!-- Title -->
                <h1><?php the_title(); ?></h1>

                <!-- Author -->
                <p class="lead">
                    by <a href="index.php"><?php the_author(); ?></a>
                </p>

                <hr>

                <!-- Date/Time -->
                <p><span class="glyphicon glyphicon-time"></span> Posted on <?php the_date(); ?></p>

                <hr>

                <!-- Post Content -->
                <?php the_content(); ?>
                
                <hr>
