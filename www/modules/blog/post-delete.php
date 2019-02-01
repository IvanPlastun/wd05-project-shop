<?php

    if(!isAdmin()) { 
        header('Location: ' . HOST);
        die();
    }
    
    $title = 'Блог - удалить пост';

    $post = R::load('posts', $_GET['id']);

    if(!empty($_POST)) {
        if(isset($_POST['post-delete'])) {

            $postImage = $post['post_img'];
            $postImageLocation = ROOT . 'usercontent/blog/';

            if($postImage != '') {
                $pictureImgurl = $postImageLocation . $postImage;
                if(file_exists($pictureImgurl)) {unlink($pictureImgurl);}

                $pictureImgurl320 = $postImageLocation . '320-' . $postImage;
                if(file_exists($pictureImgurl320)) {unlink($pictureImgurl320);}
            }

            R::trash($post);
            header('Location: ' . HOST . 'blog?result=postDeleted');
            exit();
        }
    }


    //Подготавливаем конетнт для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/blog/post-delete.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>