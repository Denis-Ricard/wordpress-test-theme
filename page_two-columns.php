<?php /* Template Name: Two columns */ ?>

<?php get_header(); ?>

  <div class="row">

    <div class="col-sm-8">
        <?php 
            if ( have_posts() ) { 
            while ( have_posts() ) : the_post();
        ?>
            <h3 class="pb-4 mb-4 font-italic border-bottom"><?php the_title(); ?></h3>
            <?php the_content(); ?>
        <?php
            endwhile;
            } 
        ?>
    </div>

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
