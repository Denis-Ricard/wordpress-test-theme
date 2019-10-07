<?php /* Template Name: Three columns */ ?>

<?php get_header(); ?>

  <div class="row">
      
    <div class="col-sm-3">
      <h4 class="font-italic">Navigation</h4>
      <?php wp_nav_menu (
            array(
            'container' => false,
            'theme_location' => 'side-menu',
            )
        ); ?>
    </div>

    <div class="col-sm-6">
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

    <aside class="col-sm-3">
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