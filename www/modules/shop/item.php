<?php

    if(!isset($_GET['id'])) {
        header('Location: ' . HOST . 'shop');
        exit();
    }

    $item = R::load('goods', $_GET['id']);
    $title = $item['title'];

    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/shop/item.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>