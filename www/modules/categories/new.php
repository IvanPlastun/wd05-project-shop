<?php
    $title = 'Категории - добавить категорию';

    if(!empty($_POST)) {
        if(isset($_POST['cat-new'])) {

            if(trim($_POST['categoryName']) == '') {
                $errors[] = ['title' => 'Введите название категории.'];
            }

            if(R::count('categories', 'category_name=?', array($_POST['categoryName'])) > 0) {
                $errors[] = ['title' => 'Такая категория уже существует.'];
            }

            if(empty($errors)) {
                $category = R::dispense('categories');
                $category->categoryName = htmlentities($_POST['categoryName']);
                R::store($category);
                header('Location: ' . HOST . 'blog/categories?result=catCreated');
                exit();
            }
        }
    }

    //Подготавливаем контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/categories/new.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>