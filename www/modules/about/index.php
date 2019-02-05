<?php

    $title = 'Обо мне';
    $about = R::load('about', 1);
    $jobs = R::find('jobs', 'ORDER BY id DESC');

    $skills = R::load('skills', 1);

    //Подготавливаем контент для центарльной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/about/about.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>