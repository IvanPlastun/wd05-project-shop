<?php

    if(!isAdmin()) { 
        header('Location: ' . HOST);
        die();
    }

    $title = 'Категории - удалить категорию';
    $category = R::load('categories', $_GET['id']);


    //Код удаляет id-категории из таблицы posts
    $posts = R::find('posts');

    if(!empty($_POST)) {
        if(isset($_POST['cat-delete'])) {
            R::trash($category);
            foreach($posts as $post) {
                $postEditCategory = R::load('posts', $post['id']);
                if($postEditCategory->category == $_GET['id']) {
                    $postEditCategory->category = NULL;
                    R::store($postEditCategory);
                }
            }
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