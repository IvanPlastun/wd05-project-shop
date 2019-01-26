<?php

    $title = 'Категории - редактировать категорию.';

    $category = R::load('categories', $_GET['id']);

    if(!empty($_POST)) {
        if(isset($_POST['cat-edit'])) {
            if(trim($_POST['categoryName']) == '') {
                $errors[] = ['title' => 'Введите название категории.'];
            }

            if(R::count('categories', 'category_name=?', array($_POST['categoryName']))) {
                $errors[] = ['title' => 'Данная категория уже существует и не доступна для редактирования.', 'description' => 'Измените название категории, чтобы выполнить редактирование.'];
            }

            if(empty($errors)) {
                $category->category_name = htmlentities($_POST['categoryName']);
                R::store($category);
                header('Location: ' . HOST . 'blog/categories?result=catUpdated');
                exit();
            }
        }
    }

    //Подготавливаем конетнт для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/categories/edit.tpl');
    $content = ob_get_contents();
    ob_end_clean();


    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>