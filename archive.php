<?php get_header(); ?>

<div class="row">

    <div class="col-sm-8">

        <h1>Archives</h1>

        <?php 
            if ( have_posts() ) { 
            while ( have_posts() ) : the_post();
        ?>
        <div class="blog-post">
            <h4><?php the_title(); ?></h4>
            <p><small><?php the_date(); ?> by <?php the_author(); ?></small></p>
            <?php the_excerpt(); ?>
            <a class="btn btn-success" href="<?php the_permalink(); ?>">More details</a>
        </div>
        <?php
            endwhile;
            }    
        ?>

    </div>

    <div class="col-sm-4">
        <?php if ( is_active_sidebar( 'sidebar-1' ) ) { ?>
            <ul id="sidebar">
                <?php dynamic_sidebar('sidebar-1'); ?>
            </ul>
        <?php } ?>
    </div>

</div><!-- /.row -->

<?php get_footer(); ?>