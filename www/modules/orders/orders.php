<?php

    $title = 'Заказы в системе - Магазин';

    if(isAdmin()) {
        $orders = R::findAll('orders');
    } else {
        header('Location: ' . HOST . 'login');
        exit();
    }

    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/orders/orders.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>