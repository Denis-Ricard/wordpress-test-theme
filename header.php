<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo( 'charset' ); ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
  <div class="container">
    <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
        <div class="col text-center">
            <a class="blog-header-logo text-dark" href="/">Wordpress Trader Test Theme</a>
        </div>
        </div>
    </header>

    <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-between">
            <?php wp_nav_menu (
                array(
                'container' => false,
                'theme_location' => 'main-menu',
                )
            ); ?>
        </nav>
    </div>
