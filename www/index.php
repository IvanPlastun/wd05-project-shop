<?php
    require('config.php');
    require('libs/rb-mysql.php');
    require('db.php');


    /* ************************************************************

    * РОУТЕР

    ************************************************************* */

    $uri = $_SERVER['REQUEST_URI'];
    $uri = rtrim($uri, '/');
    $uri = filter_var($uri, FILTER_SANITIZE_URL);
    $uri = substr($uri, 1);
    $uri = explode('?', $uri);


    switch($uri[0]) {
        case '':
            include(ROOT . 'modules/main/index.php');
        break;
        case 'about':
            include(ROOT . 'modules/about/index.php');
        break;
        case 'blog':
            include(ROOT . 'modules/blog/index.php');
        break;
        case 'contacts':
            include(ROOT . 'modules/contacts/index.php');
        break;
        default:
            include(ROOT . 'modules/main/index.php');
        break;
    }
?>