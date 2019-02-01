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

    $sqlComments = "SELECT 
        comments.user_id, comments.text, comments.date_time,
        users.name, users.lastname, users.avatar_small
        FROM `comments`
        INNER JOIN users ON users.id = comments.user_id
        WHERE comments.post_id =" . $_GET['id'];

    $comments = R::getAll($sqlComments);

    if(!empty($_POST)) {
        if(isset($_POST['add-comment'])) {
            if(trim($_POST['comment-user']) == '') {
                $errors[] = ['title' => 'Введите текст комментария.'];
            }

            if(empty($errors)) {
                $comment = R::dispense('comments');
                $comment->postId = htmlentities($_GET['id']);
                $comment->userId = htmlentities($_SESSION['logged_user']['id']);
                $comment->text = htmlentities($_POST['comment-user']);
                $comment->dateTime = R::isoDateTime();
                R::store($comment);
                header('Location: ' . HOST . 'blog/post?id=' . $_GET['id']);
                exit();
            }
        }
    }


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