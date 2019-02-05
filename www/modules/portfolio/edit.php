<?php
    if(!isAdmin()) { 
        header('Location: ' . HOST);
        die();
    }

    $title = 'Портфолио - редактировать работу';
    $work = R::load('portfolio', $_GET['id']);


    if(!empty($_POST)) {
        if(isset($_POST['deleteImgWork'])) {
            if($work['imagework'] != '') { 
                $workImgDel = $work['imagework'];
            }

            $workImgLocation = ROOT . 'usercontent/portfolio/';

            if($workImgDel != '') {
                $picturdeleurl = $workImgLocation . $workImgDel;
                if(file_exists($picturdeleurl)) {unlink($picturdeleurl);}

                $picturdeleurl360 = $workImgLocation . '360-' . $workImgDel;
                if(file_exists($picturdeleurl360)) {unlink($picturdeleurl360);}
            }

            $work->imagework = NULL;
            $work->imagework_small = NULL;
            $work->date_edit = R::isoDateTime();
            R::store($work);
            header('Location: ' . HOST . 'portfolio');
            exit();
        }
    }


    if(!empty($_POST)) {
        if(isset($_POST['editwork'])) {
            if(trim($_POST['title']) == '') {
                $errors[] = ['title' => 'Введите название работы'];
            }

            if(trim($_POST['description']) == '') {
                $errors[] = ['title' => 'Напишите краткое содержание о проекте'];
            }

            if(trim($_POST['result']) == '') {
                $errors[] = ['title' => 'Напишите кратко о достигнутом результате'];
            }

            if(trim($_POST['technologes']) == '') {
                $errors[] = ['title' => 'Укажите технологии, которые использовались в проекте'];
            }

            if(empty($errors)) {
                $work->author_id = $_SESSION['logged_user']['id'];
                $work->title = htmlentities($_POST['title']);
                $work->description = $_POST['description'];
                $work->result = $_POST['result'];
                $work->technologes = $_POST['technologes'];
                $work->linkproject = htmlentities($_POST['linkproject']);
                $work->github = htmlentities($_POST['github']);
                $work->date_edit = R::isoDateTime();

                //Загрузка изображений
                if(isset($_FILES['imagework']['name']) && $_FILES['imagework']['tmp_name'] != '') {
                    $fileName = $_FILES['imagework']['name'];
                    $fileTmpLoc = $_FILES['imagework']['tmp_name'];
                    $fileType = $_FILES['imagework']['type'];
                    $fileSize = $_FILES['imagework']['size'];
                    $fileErrorMsg = $_FILES['imagework']['error'];
                    $kaboom = explode('.', $fileName);
                    $fileExt = end($kaboom);

                    list($width, $height) = getimagesize($fileTmpLoc);

                    if($width < 10 || $height < 10) {
                        $errors[] = ['title' => 'Изображение не имеет размеров.', 'description' => '<p>Загрузите изображение с большим разрешением.</p>'];
                    } else if($fileSize > 10485760) {
                        $errors[] = ['title' => 'Размер файла с изображением не должен превышать 10Mb.'];
                    }
                    if(!preg_match('/\.(gif|png|jpg|jpeg)$/i', $fileName)) {
                        $errors[] = ['title' => 'Неверный формат файла.', 'description' => '<p>Файл изображения должен быть в формате jpg, png или gif.</p>'];
                    }

                    if($fileErrorMsg == 1) {
                        $errors[] = ['title' => 'При загрузке изображения произошла ошибка.'];
                    }


                    if(empty($errors)) { 
                        $workImg = $work['imagework'];
                        $workImgFolderLocation = ROOT . 'usercontent/portfolio/';

                        if($workImg != '') {
                            $pictureurl = $workImgFolderLocation . $workImg;
                            if(file_exists($pictureurl)) {unlink($pictureurl);}

                            $pictureurl360 = $workImgFolderLocation . '360-' . $workImg;
                            if(file_exists($pictureurl360)) {unlink($pictureurl360);}
                        }

                        //Перемещаем загруженный фал в нужную директорию
                        $db_file_name = rand(1000000000, 9999999999) . '.' . $fileExt;
                        $workImgFolterLocation = ROOT . 'usercontent/portfolio/';
                        $uploadFile = $workImgFolterLocation . $db_file_name;
                        $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);

                        if($moveResult != true) {
                            $errors[] = ['title' => 'Ошибка сохранения файла.'];
                        }

                        include_once(ROOT . 'libs/image_resize_imagick.php');

                        //Устаналиваем размеры для большой картинки блога
                        $target_file = $workImgFolterLocation . $db_file_name;
                        $wmax = 920;
                        $hmax = 530;
                        $img = createThumbnailBig($target_file, $wmax, $hmax);
                        $img->writeImage($target_file);
                        $work->imagework = $db_file_name;

                        //Устаналиваем размеры для малой картинки, которая будет отображаться в карточке
                        $target_file = $workImgFolterLocation . $db_file_name;
                        $resized_file = $workImgFolterLocation . '360-' . $db_file_name;
                        $wmax = 360;
                        $hmax = 190;
                        $img = createThumbnailCrop($target_file, $wmax, $hmax);
                        $img->writeImage($resized_file);
                        $work->imagework_small = '360-' . $db_file_name;
                    }
                }

                if(empty($errors)) { 
                    R::store($work);
                    header('Location: ' . HOST . 'portfolio-single-work?result=workUpdated&id=' . $work['id']);
                    exit();
                }
            }
        }
    }

    //Подготаливаем контент для центарльной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/portfolio/edit.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot-edit.tpl');
?>