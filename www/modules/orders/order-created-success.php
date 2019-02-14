<?php

    $title = 'Заказ создан успешно - Магазин';

    if(!isset($_SESSION['current_order'])) {
        header('Location: ' . HOST . 'shop');
        exit();
    }

    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/orders/order-created-success.tpl');
    $content = ob_get_contents();
    ob_end_clean();
    

    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');

?>