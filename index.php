<?php get_header(); ?>

<div class="row">
    <div class="col blog-main">
    
        <?php 
        if ( have_posts() ) { 
        while ( have_posts() ) : the_post();
        ?>
            <div class="blog-post">
                <h2 class="blog-post-title"><?php the_title(); ?></h2>
                <p class="blog-post-meta"><?php the_date(); ?> by <?php the_author(); ?></p>
                <?php the_content(); ?>
            </div><!-- /.blog-post -->
        <?php
        endwhile;
        } 
        ?>

    </div><!-- /.blog-main -->
</div><!-- /.row -->

<?php get_footer(); ?>