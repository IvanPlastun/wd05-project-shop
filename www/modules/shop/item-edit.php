<?php
    if(!isAdmin()) {
        header('Location: ' . HOST);
        die();
    }

    $title = 'Магазин - Редактировать товар';

    $item = R::load('goods', $_GET['id']);


    if(!empty($_POST)) {
        if(isset($_POST['deleteItemImg'])) {
            $itemImgDel = $item['img'];
            $itemImgLocation = ROOT . 'usercontent/shop/';

            if($itemImgDel != '') {
                $picturdeleurl = $itemImgLocation . $itemImgDel;
                if(file_exists($picturdeleurl)) {unlink($picturdeleurl);}

                $picturdeleurl320 = $itemImgLocation . '320-' . $itemImgDel;
                if(file_exists($picturdeleurl320)) {unlink($picturdeleurl320);}
            }

            $item->img = NULL;
            $item->img_small = NULL;
            R::store($item);
            header('Location: ' . HOST . 'shop/item-edit?id=' . $item['id']);
            exit();
        }
    }


    if(!empty($_POST)) {
        if(isset($_POST['itemUpdate'])) {
            if(trim($_POST['itemTitle']) == '') {
                $errors[] = ['title' => 'Введите название товара'];
            }
            
            if(trim($_POST['price']) == '') {
                $errors[] = ['title' => 'Введите стоимость товара'];
            }

            if(empty($errors)) {
                $item->title = htmlentities($_POST['itemTitle']);
                $item->price = htmlentities($_POST['price']);
                $item->price_old = htmlentities($_POST['priceOld']);
                $item->description = $_POST['itemDesc'];

                if(isset($_FILES['itemImg']['name']) && $_FILES['itemImg']['tmp_name'] != '') {
                    $fileName = $_FILES['itemImg']['name'];
                    $fileTmpLoc = $_FILES['itemImg']['tmp_name'];
                    $fileType = $_FILES['itemImg']['type'];
                    $fileSize = $_FILES['itemImg']['size'];
                    $fileErrorMsg = $_FILES['itemImg']['error'];
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

                    $itemImg = $item['img'];
                    $itemImgFolderLocation = ROOT . 'usercontent/shop/';

                    if($itemImg != '') {
                        $pictureurl = $itemImgFolderLocation . $itemImg;
                        if(file_exists($pictureurl)) {unlink($pictureurl);}

                        $pictureurl320 = $itemImgFolderLocation . '320-' . $itemImg;
                        if(file_exists($pictureurl320)) {unlink($pictureurl320);}
                    }

                    //Перемещаем загруженный файл в нужную директорию
                    $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
                    $uploadFile = $itemImgFolderLocation . $db_file_name;
                    $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);

                    if($moveResult != true) {
                        $errors[] = ['title' => 'Ошибка сохранения файла'];
                    }

                    include_once(ROOT . 'libs/image_resize_imagick.php');

                    $target_file = $itemImgFolderLocation . $db_file_name;
                    $wmax = 920;
                    $hmax = 620;
                    $img = createThumbnailCropNew($target_file, $wmax, $hmax);
                    $img->writeImage($target_file);
                    $item->img = $db_file_name;

                    $target_file = $itemImgFolderLocation . $db_file_name;
                    $resized_file = $itemImgFolderLocation . '320-' . $db_file_name;
                    $wmax = 320;
                    $hmax = 140;
                    $img = createThumbnailCropNew($target_file, $wmax, $hmax);
                    $img->writeImage($resized_file);
                    $item->img_small = '320-' . $db_file_name;
                }

                if(empty($errors)) {
                    R::store($item);
                    header('Location: ' . HOST . 'shop?result=itemUpdated');
                    exit();
                }
            }
        }
    }

    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/shop/item-edit.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot-edit.tpl');

?>