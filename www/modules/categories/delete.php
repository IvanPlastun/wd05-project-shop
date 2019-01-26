<?php

    if(!isAdmin()) { 
        header('Location: ' . HOST);
        die();
    }

    $title = 'Категории - удалить категорию';
    $category = R::load('categories', $_GET['id']);

    if(!empty($_POST)) {
        if(isset($_POST['cat-delete'])) {
            R::trash($category);
            header('Location: ' . HOST . 'blog/categories?result=catDeleted');
            exit();
        }
    }

    //Подготавливаем контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/categories/delete.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подлюкчаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>