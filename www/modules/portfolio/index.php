<?php
    $pagination = pagination(9, 'portfolio');
    $title = 'Портфолио';
    $works = R::find('portfolio', 'ORDER BY id DESC ' . $pagination['sql_pages_limit']);

    //Подготаливаем конетнт для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/portfolio/portfolio.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>