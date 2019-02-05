<?php
    if(!isLoggedIn()) { 
        header('Location: ' . HOST);
        die();
    }

    $title = "Редактировать профиль";
    $pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z{2,4}\.])?[a-z]{2,4}$/i';
    $currentUser = $_SESSION['logged_user'];
    $user = R::load('users', $currentUser->id);


    if(!empty($_POST)){
        if(isset($_POST['save-profile'])) {
            if(trim($_POST['username']) == '') {
                $errors[] = ['title' => 'Введите имя'];
            }

            if(trim($_POST['lastname']) == '') {
                $errors[] = ['title' => 'Введите фамилию'];
            }

            if(trim($_POST['useremail']) == '') {
                $errors[] = ['title' => 'Введите email'];
            } else {
                if(!preg_match($pattern, $_POST['useremail'])) {
                    $errors[] = ['title' => 'Неверный формат email'];
                }
            }

            if(trim($_POST['country']) == '') {
                $errors[] = ['title' => 'Укажите страну'];
            }

            if(trim($_POST['city']) == '') {
                $errors[] = ['title' => 'Укажите город'];
            }

            if(empty($errors)) {
                $user->name = htmlentities($_POST['username']);
                $user->lastname = htmlentities($_POST['lastname']);
                $user->email = htmlentities($_POST['useremail']);
                $user->country = htmlentities($_POST['country']);
                $user->city = htmlentities($_POST['city']);

                if(isset($_FILES['avatar']['name']) && $_FILES['avatar']['tmp_name'] != '') {
                    //write file image params in variables
                    $filename = $_FILES['avatar']['name'];
                    $fileTmpLoc = $_FILES['avatar']['tmp_name'];
                    $fileType = $_FILES['avatar']['type'];
                    $fileSize = $_FILES['avatar']['size'];
                    $fileErrorMsg = $_FILES['avatar']['error'];
                    $kaboom = explode('.', $filename);
                    $fileExt = end($kaboom);

                    //check file properties on different conditions
                    list($width, $height) = getimagesize($fileTmpLoc);
                    if($width < 10 || $height < 10) {
                        $errors[] = ['title' => 'Файл имеет слишком маленький размер', 'description' => '<p>Загрузите изображение с большим разрешенеием</p>'];
                    }

                    //Проверка допустимого размера загружаемого файла
                    if($fileSize > 10485760) {
                        $errors[] = ['title' => 'Размер файла с изображением не должен превышать 10Mb'];
                    }

                    //Проверка формата загружаемого изображения
                    if(!preg_match("/\.(gif|jpg|png|jpeg)$/i", $filename)) {
                        $errors[] = ['title' => 'Неверный формат файла', 'description' => '<p>Файл изображения должен быть в формате jpg, png или gif</p>'];
                    }

                    if($fileErrorMsg == 1) {
                        $errors[] = ['title' => 'При загрузке изображения произошла ошибка.'];
                    }

                    //Проверяем установлен ли аватар у пользователя
                    $avatar = $user['avatar'];
                    $avatarFolterLocation = ROOT . 'usercontent/avatar/';

                    //Если аватар уже установлен, то есть загружен ранее, то удаляем файл аватара
                    if($avatar != '') {
                        $picurl = $avatarFolterLocation . $avatar;
                        //удаляем аватар
                        if(file_exists($picurl)) {unlink($picurl);}

                        $picurl48 = $avatarFolterLocation . '48-' . $avatar;
                        if(file_exists($picurl48)) {unlink($picurl48);}
                    }

                    //Перемещаем загруженный файл в нужную директорию
                    $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
                    $uploadFile = $avatarFolterLocation . $db_file_name;
                    $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);

                    if(!$moveResult) {
                        $errors[] = ['title' => 'Ошибка сохранения файла'];
                    }

                    //Подключение библиотеки image_resize_imagick.php
                    include_once(ROOT . 'libs/image_resize_imagick.php');
                    $target_file = $avatarFolterLocation . $db_file_name;

                    //задаем максимально возможную ширину и высоту аватарки
                    $wmax = 222;
                    $hmax = 222;
                    $img = createThumbnail($target_file, $wmax, $hmax);
                    $img->writeImage($target_file);

                    $user->avatar = $db_file_name;

                    //Сохранение малых аватарок
                    $target_file = $avatarFolterLocation . $db_file_name;

                    $resized_file = $avatarFolterLocation . '48-' . $db_file_name;

                    //Устанавливаем максимальную ширину и высоту для малых аватарок
                    $wmax = 48;
                    $hmax = 48;
                    $img = createThumbnail($target_file, $wmax, $hmax);
                    $img->writeImage($resized_file);
                    $user->avatar_small = '48-' . $db_file_name;
                }

                if(empty($errors)) {
                    R::store($user);
                    //Присваиваем сессии обновленные данные о пользователе
                    $_SESSION['logged_user'] = $user;
                    header('Location: ' . HOST . 'profile');
                    exit();
                }
            }
        }
    }

    //Подготавливаем контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/profile/profile-edit.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot-editProtfile.tpl');
?>