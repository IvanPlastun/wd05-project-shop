<?php
    require('config.php');
    require('libs/rb-mysql.php');
    require('libs/functions.php');
    require('db.php');
    $errors = array();
    $success = array();
    session_start();

    ///Проверяем токен для запомнить меня
    if(isset($_COOKIE['password_cookie_token']) && !empty($_COOKIE['password_cookie_token'])) {
        $user = R::findOne('users', 'password_cookie_token=?', array($_COOKIE['password_cookie_token']));
        if($user) {
            $_SESSION['logged_user'] = $user;
            $_SESSION['login'] = 1;
            $_SESSION['role'] = $user->role;
        }
    }


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
        case 'registration':
            include(ROOT . 'modules/login/registration.php');
        break;
        case 'login':
            include(ROOT . 'modules/login/login.php');
        break;
        case 'logout':
            include(ROOT . 'modules/login/logout.php');
        break;
        case 'lost-password':
            include(ROOT . 'modules/login/lost-password.php');
        break;
        case 'set-new-password':
            include(ROOT . 'modules/login/set-new-password.php');
        break;
        case 'profile':
            include(ROOT . 'modules/profile/index.php');
        break;
        case 'profile-edit':
            include(ROOT . 'modules/profile/edit.php');
        break;
        // :::::::::::::::::::: BLOG ::::::::::::::::::::::::::
        case 'blog':
            include(ROOT . 'modules/blog/index.php');
        break;
        case 'blog/post-new':
            include(ROOT . 'modules/blog/post-new.php');
        break;
        case 'blog/post-edit':
            include(ROOT . 'modules/blog/post-edit.php');
        break;
        case 'blog/post-delete':
            include(ROOT . 'modules/blog/post-delete.php');
        break;
        case 'blog/post':
            include(ROOT . 'modules/blog/post.php');
        break;
        // :::::::::::::::::::: CATEGOEIRS ::::::::::::::::::::::
        case 'blog/categories':
            include(ROOT . 'modules/categories/all.php');
        break;
        case 'blog/category-new':
            include(ROOT . 'modules/categories/new.php');
        break;
        case 'blog/category-edit':
            include(ROOT . 'modules/categories/edit.php');
        break;
        case 'blog/category-delete':
            include(ROOT . 'modules/categories/delete.php');
        break;
        // :::::::::::::::::::: CONTACTS ::::::::::::::::::::::
        case 'contacts':
            include(ROOT . 'modules/contacts/index.php');
        break;
        case 'contacts-edit':
            include(ROOT . 'modules/contacts/edit.php');
        break;
        case 'contacts-messages':
            include(ROOT . 'modules/contacts/messages.php');
        break;
        // :::::::::::::::::::: ABOUT ::::::::::::::::::::::
        case 'about':
            include(ROOT . 'modules/about/index.php');
        break;
        case 'about-edit':
            include(ROOT . 'modules/about/edit.php');
        break;
        case 'about-edit-skills':
            include(ROOT . 'modules/about/edit-skills.php');
        break;
        case 'about-edit-jobs':
            include(ROOT . 'modules/about/edit-jobs.php');
        break;
        // :::::::::::::::::::: PORTFOLIO ::::::::::::::::::::::
        case 'portfolio':
            include(ROOT . 'modules/portfolio/index.php');
        break;
        case 'portfolio-new': 
            include(ROOT . 'modules/portfolio/new.php');
        break;
        case 'portfolio-edit': 
            include(ROOT . 'modules/portfolio/edit.php');
        break;
        case 'portfolio-delete': 
            include(ROOT . 'modules/portfolio/delete.php');
        break;
        case 'portfolio-single-work': 
            include(ROOT . 'modules/portfolio/single.php');
        break;
        // :::::::::::::::::::: SHOP ::::::::::::::::::::::
        case 'shop':
            include(ROOT . 'modules/shop/index.php');
        break;
        case 'shop/new':
            include(ROOT . 'modules/shop/item-new.php');
        break;
        case 'shop/item':
            include(ROOT . 'modules/shop/item.php');
        break;
        case 'shop/item-edit':
            include(ROOT . 'modules/shop/item-edit.php');
        break;
        case 'shop/item-delete':
            include(ROOT . 'modules/shop/item-delete.php');
        break;
        // :::::::::::::::::::: CART ::::::::::::::::::::::
        case 'addToCart':
            include(ROOT . 'modules/cart/addtocart.php');
        break;
        case 'cart':
            include(ROOT . 'modules/shop/cart.php');
        break;
        case 'removefromcart':
            include(ROOT . 'modules/shop/removefromcart.php');
        break;
        // :::::::::::::::::::: ORDERS ::::::::::::::::::::::
        case 'order-create':
            include(ROOT . 'modules/orders/order-create.php');
        break;
        case 'order-created-success':
            include(ROOT . 'modules/orders/order-created-success.php');
        break;
        case 'orders':
            include(ROOT . 'modules/orders/orders.php');
        break;
        case 'order':
            include(ROOT . 'modules/orders/order.php');
        break;
        case 'myorders':
            include(ROOT . 'modules/orders/myorders.php');
        break;
        case 'myorder':
            include(ROOT . 'modules/orders/myorder.php');
        break;
        // :::::::::::::::::::: PAYMENT SYSTEMS ::::::::::::::::::::::
        case 'payment-choice';
            include(ROOT . 'modules/payments/payment-choice.php');
        break;
        case 'payment-yandex';
            include(ROOT . 'modules/payments/payment-yandex.php');
        break;
        case 'after-payment':
            include(ROOT . 'modules/payments/after-payment.php');
        break;
        case 'payment-yandex-notify':
            include(ROOT . 'modules/payments/payment-yandex-nofiy.php');
        break;

        default:
            include(ROOT . 'modules/main/index.php');
        break;
    }
?>