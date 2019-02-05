<?php 
    //Админ на сайте
    if(!empty($_SESSION)) {
        if(isAdmin()) {
            include(ROOT . 'templates/_parts/_admin-panel.tpl');
        }
    }
?>