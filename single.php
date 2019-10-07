<?php get_header(); ?>

<div class="row">
    <div class="col-sm-8 blog-main">
    
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

    <aside class="col-sm-4">
      <div class="p-4 mb-3 bg-light rounded">
        <?php if ( is_active_sidebar( 'sidebar-1' ) ) { ?>
            <ul id="sidebar">
                <?php dynamic_sidebar('sidebar-1'); ?>
            </ul>
        <?php } ?>
      </div>
    </aside>
</div><!-- /.row -->

<?php get_footer(); ?>