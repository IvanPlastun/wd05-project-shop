<?php 
    //Админ на сайте
    if(!empty($_SESSION)) {
        if(isset($_SESSION['logged_user']) && $_SESSION['login'] == 1 && $_SESSION['role'] == 'admin') {
            include(ROOT . 'templates/_parts/_admin-panel.tpl');
        }
    }
    
?>
<header class="header">
    <div class="row header__wrapper header__wrapper--user">
        <?php include(ROOT . 'templates/_parts/_header-logo.tpl');?>
        <?php
            if(isset($_SESSION['logged_user']) && $_SESSION['login'] == 1) {
                //Пользователь на сайте
                if($_SESSION['role'] != 'admin') {
                    include(ROOT . 'templates/_parts/_header-user-profile.tpl');
                }
            } else {
                //Нет пользователя
                include(ROOT . 'templates/_parts/_header-user-login-links.tpl');
            }
        
        ?>
    </div>
    <div class="row">
        <?php include(ROOT . 'templates/_parts/_header-nav.tpl');?>
    </div>
</header>