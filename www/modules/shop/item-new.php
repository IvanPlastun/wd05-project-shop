<?php
    if(!isAdmin()) {
        header('Location: ' . HOST);
        die();
    }

    $title = 'Магазин - Создать новый товар';

    if(!empty($_POST)) {
        if(isset($_POST['itemNew'])) {
            if(trim($_POST['itemTitle']) == '') {
                $errors[] = ['title' => 'Введите название товара'];
            }

            if(trim($_POST['price']) == '') {
                $errors[] = ['title' => 'Введите стоимость товара'];
            }

            if(empty($errors)) {
                $item = R::dispense('goods');
                $item->title = htmlentities($_POST['itemTitle']);
                $item->price = htmlentities($_POST['price']);
                $item->priceOld = htmlentities($_POST['priceOld']);
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
                        $errors[] = ['title' => 'Размер файла с изображением не должен превышать 10Mb.'];
                    }

                    if(!preg_match('/\.(gif|png|jpg|jpeg)$/i', $fileName)) {
                        $errors[] = ['title' => 'Неверный формат файла.', 'description' => '<p>Файл изображения должен быть в формате jpg, png или gif.</p>'];
                    }

                    if($fileErrorMsg == 1) {
                        $errors[] = ['title' => 'При загрузке изображения произошла ошибка.'];
                    }

                    //Перемещаем загруженный фал в нужную директорию
                    $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
                    $itemImgFolterLocation = ROOT . 'usercontent/shop/';
                    $uploadFile = $itemImgFolterLocation . $db_file_name;
                    $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);

                    if($moveResult != true) {
                        $errors[] = ['title' => 'Ошибка сохранения файла.'];
                    }

                    include_once(ROOT . 'libs/image_resize_imagick.php');

                    //Устаналиваем размеры для большой картинки блога
                    $target_file = $itemImgFolterLocation . $db_file_name;
                    $wmax = 920;
                    $hmax = 620;
                    $img = createThumbnailCropNew($target_file, $wmax, $hmax);
                    $img->writeImage($target_file);
                    $item->img = $db_file_name;

                    $target_file = $itemImgFolterLocation . $db_file_name;
                    $resized_file = $itemImgFolterLocation . '320-' . $db_file_name;
                    $wmax = 320;
                    $hmax = 140;
                    $img = createThumbnailCropNew($target_file, $wmax, $hmax);
                    $img->writeImage($resized_file);
                    $item->imgSmall = '320-' . $db_file_name;
                }

                if(empty($errors)) {
                    R::store($item);
                    header('Location: ' . HOST . 'shop?result=itemCreated');
                    exit();
                }
            }
        }
    }

    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/shop/item-new.tpl');
    $content = ob_get_contents();
    ob_end_clean();


    //Выводим общие шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot-edit.tpl');

?>