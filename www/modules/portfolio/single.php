<?php
    $title = 'Портфолио - отдельная работа';

    $sqlWorks = "SELECT portfolio.id, portfolio.title, portfolio.description, portfolio.result, portfolio.technologes, portfolio.linkproject, 
            portfolio.github, portfolio.date, portfolio.date_edit, portfolio.imagework, portfolio.imagework_small, 
            users.name, users.lastname FROM `portfolio` 
            RIGHT JOIN users ON users.id = portfolio.author_id 
            WHERE portfolio.id =" . $_GET['id'] . " LIMIT 1";

    $work = R::getAll($sqlWorks);
    $work = $work[0];

    ob_start();
    include(ROOT . 'templates/_parts/_header-admin.tpl');
    include(ROOT . 'templates/portfolio/single.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/single-work-template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot-edit.tpl');
?>