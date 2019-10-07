<?php

function wptest_wp_setup() {
    add_theme_support( 'title-tag' );
}
 
add_action( 'after_setup_theme', 'wptest_wp_setup' );

function wptest_enqueue_styles() {
    wp_register_style('bootstrap', get_template_directory_uri() . '/assets/css/bootstrap.min.css' );
    $dependencies = array('bootstrap');
    wp_enqueue_style( 'wptest-style', get_stylesheet_uri(), $dependencies ); 
}

function wptest_enqueue_scripts() {
    $dependencies = array('jquery');
    wp_enqueue_script('bootstrap', get_template_directory_uri().'/assets/js/bootstrap.min.js', $dependencies, '3.3.6', true );
}

add_action( 'wp_enqueue_scripts', 'wptest_enqueue_styles' );
add_action( 'wp_enqueue_scripts', 'wptest_enqueue_scripts' );

add_theme_support('menus');

register_nav_menus(
    array( 
        'main-menu' =>   __('Main Menu', 'wptest'),
        'side-menu' =>   __('Side Menu', 'wptest')
    )
);

add_action( 'widgets_init', 'wptest_widgets_init' );

function wptest_widgets_init() {
    register_sidebar( array(
        'name'          => __( 'Main Sidebar', 'wptest' ),
        'id'            => 'sidebar-1',
        'description'   => __( 'Sidebar widget for 2 or 3 column display.', 'wptest' ),
        'before_widget' => '<li id="%1$s" class="widget %2$s">',
        'after_widget'  => '</li>',
        'before_title'  => '<h4 class="widgettitle">',
        'after_title'   => '</h4>',
    ) );
}