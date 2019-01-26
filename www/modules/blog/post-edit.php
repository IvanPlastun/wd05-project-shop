<?php
    if(!isAdmin()) { 
        header('Location: ' . HOST);
        die();
    }

    $title = 'Блог - редактировать пост';
    $post = R::load('posts', $_GET['id']);
    $categories = R::find('categories', 'ORDER BY category_name ASC');


    if(!empty($_POST)) {
        if(isset($_POST['delete-postImg'])) {
            
            $postImgDel = $post['post_img'];
            $postImgLocation = ROOT . 'usercontent/blog/';

            if($postImgDel != '') {
                $picturdeleurl = $postImgLocation . $postImgDel;
                if(file_exists($picturdeleurl)) {unlink($picturdeleurl);}

                $picturdeleurl320 = $postImgLocation . '320-' . $postImgDel;
                if(file_exists($picturdeleurl320)) {unlink($picturdeleurl320);}
            }

            $post->post_img = NULL;
            $post->post_img_small = NULL;
            R::store($post);
            header('Location: ' . HOST . 'blog/post-edit?id=' . $post['id']);
            exit();
        }
    }



    if(!empty($_POST)) {
        if(isset($_POST['update-post'])) {
            if(trim($_POST['post-title']) == '') {
                $errors[] = ['title' => 'Введите заголовок поста'];
            }

            if(trim($_POST['post-text']) == '') {
                $errors[] = ['title' => 'Введите содержание поста'];
            }

            if($_POST['post-categories'] == '') {
                $errors[] = ['title' => 'Выберите категорию'];
            }
            
            if(empty($errors)){
                $post->title = htmlentities($_POST['post-title']);
                $post->category = htmlentities($_POST['post-categories']);
                $post->text = $_POST['post-text'];
                $post->updateTime = R::isoDateTime();
                $post->authorId = $_SESSION['logged_user']['id'];

                if(isset($_FILES['post-image']['name']) && $_FILES['post-image']['tmp_name'] != '') {
                    $fileName = $_FILES['post-image']['name'];
                    $fileTmpLoc = $_FILES['post-image']['tmp_name'];
                    $fileType = $_FILES['post-image']['type'];
                    $fileSize = $_FILES['post-image']['size'];
                    $fileErrorMsg = $_FILES['post-image']['error'];
                    $kaboom = explode('.', $fileName);
                    $fileExt = end($kaboom);

                    list($width, $height) = getimagesize($fileTmpLoc);

                    if($width < 10 || $height < 10) {
                        $errors[] = ['title' => 'Изображение не имеет размеров.', 'description' => '<p>Загрузите изображение с большим разрешением.</p>'];
                    }

                    if($fileSize > 10485760) {
                        $errors[] = ['title' => 'Размер изображения не должен превышать 10Mb.'];
                    }

                    if(!preg_match('/\.(gif|jpg|png|jpeg)$/i', $fileName)) {
                        $errors[] = ['title' => 'Неверный формат файла.', 'description' => '<p>Файл изображения должен быть в формате jpg, png, gif.<p>'];
                    }

                    if($fileErrorMsg == 1) {
                        $errors[] = ['title' => 'При загрузке изображения произошла ошибка.'];
                    }

                    $postImg = $post['post_img'];
                    $postImgFolderLocation = ROOT . 'usercontent/blog/';

                    if($postImg != '') {
                        $pictureurl = $postImgFolderLocation . $postImg;
                        if(file_exists($pictureurl)) {unlink($pictureurl);}

                        $pictureurl320 = $postImgFolderLocation . '320-' . $postImg;
                        if(file_exists($pictureurl320)) {unlink($pictureurl320);}
                    }

                    //Перемещаем загруженный файл в нужную директорию
                    $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
                    $uploadFile = $postImgFolderLocation . $db_file_name;
                    $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);

                    if($moveResult != true) {
                        $errors[] = ['title' => 'Ошибка сохранения файла'];
                    }

                    include_once(ROOT . 'libs/image_resize_imagick.php');

                    $target_file = $postImgFolderLocation . $db_file_name;
                    $wmax = 920;
                    $hmax = 620;
                    $img = createThumbnailBig($target_file, $wmax, $hmax);
                    $img->writeImage($target_file);
                    $post->postImg = $db_file_name;

                    $target_file = $postImgFolderLocation . $db_file_name;
                    $resized_file = $postImgFolderLocation . '320-' . $db_file_name;
                    $wmax = 320;
                    $hmax = 140;
                    $img = createThumbnailCrop($target_file, $wmax, $hmax);
                    $img->writeImage($resized_file);
                    $post->postImgSmall = '320-' . $db_file_name;
                }

                R::store($post);
                header('Location: ' . HOST . 'blog/post?result=postUpdated&id=' . $post['id']);
                exit();
            }
        }
    }

    //Подготавливаем конетнт для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/blog/post-edit.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot-edit.tpl');
?>