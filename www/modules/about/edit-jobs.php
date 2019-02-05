<?php
    if(!isAdmin()) { 
        header('Location: ' . HOST);
        die();
    }
    
    $title = 'Редактировать - опыт работы';
    $jobExp = R::find('jobs', 'ORDER BY id DESC');

    if(isset($_GET['id']))
        $jobDelete = R::load('jobs', $_GET['id']);

    if(!empty($_GET)) {
        if( isset($_GET['id']) && $_GET['id'] == $jobDelete['id'] ) {
            R::trash($jobDelete);
            header('Location: ' . HOST . 'about-edit-jobs?result');
            exit();
        }    
    }

    if(!empty($_POST)) {
        if(isset($_POST['saveJob'])) {
            if(trim($_POST['period']) == '') {
                $errors[] = ['title' => 'Введите период начала и окончания работы'];
            }

            if(trim($_POST['title']) == '') {
                $errors[] = ['title' => 'Введите название должности'];
            }

            if(trim($_POST['description']) == '') {
                $errors[] = ['title' => 'Добавьте краткое описание'];
            }

            if(empty($errors)) {
                $jobs = R::dispense('jobs');
                $jobs->period = htmlentities($_POST['period']);
                $jobs->title = htmlentities($_POST['title']);
                $jobs->description = htmlentities($_POST['description']);

                R::store($jobs);
                $jobExp = R::find('jobs', 'ORDER BY id DESC');
            }
        }
    }
    //Подготавливаем контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/about/edit-jobs.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>