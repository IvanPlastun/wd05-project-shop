<?php
    $sqlPost = "SELECT 
        posts.id, posts.title, posts.text, posts.category, posts.data_time, posts.update_time, posts.post_img, posts.post_img_small,
        users.name, users.lastname,
        categories.category_name
        FROM `posts`
        INNER JOIN users ON users.id = posts.author_id
        LEFT JOIN categories ON categories.id = posts.category
        WHERE posts.id =" . $_GET['id'] . " LIMIT 1";

    //$posts = R::find('posts');

    $post = R::getAll($sqlPost);
    $post = $post[0];

    $title = $post['title'];
    
    //Подготавливаем контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/blog/post.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>