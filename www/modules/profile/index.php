<?php
    if(!isLoggedIn()) { 
        header('Location: ' . HOST);
        die();
    }

    $title = 'Профиль пользователя';

    $currentUser = $_SESSION['logged_user'];

    $sqlComments = "SELECT comments.date_time, comments.text, posts.id, posts.title
    FROM `comments` INNER JOIN posts ON posts.id = comments.post_id
    WHERE comments.user_id =" . $_SESSION['logged_user']['id'] . " ORDER BY date_time DESC LIMIT 3";

    $comments = R::getAll($sqlComments);
    
    //Подготавливаем контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/profile/profile.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>