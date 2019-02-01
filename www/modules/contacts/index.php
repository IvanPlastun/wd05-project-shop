<?php

    $title = 'Контакты';
    $contacts = R::load('contacts', 1);

    $pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z{2,4}\.])?[a-z]{2,4}$/i';
    if(!empty($_POST)) {
        if(isset($_POST['sendMessage'])) {
            if(trim($_POST['name']) == '') {
                $errors[] = ['title' => 'Введите имя'];
            }

            if(trim($_POST['email']) == '') {
                $errors[] = ['title' => 'Введите email'];
            } else {
                if(!preg_match($pattern, $_POST['email'])) {
                    $errors[] = ['title' => 'Неверный формат email'];
                }
            }

            if(trim($_POST['message']) == '') {
                $errors[] = ['title' => 'Введите сообщение'];
            }

            if(empty($errors)) {
                $messages = R::dispense('messages');
                $messages->name = htmlentities($_POST['name']);
                $messages->email = htmlentities($_POST['email']);
                $messages->message = htmlentities($_POST['message']);
                $messages->date_time = R::isoDateTime();

                if(isset($_FILES['file']['name']) && $_FILES['file']['tmp_name'] != '') {
                    $fileName = $_FILES['file']['name'];
                    $fileTmpLoc = $_FILES['file']['tmp_name'];
                    $fileType = $_FILES['file']['type'];
                    $fileSize = $_FILES['file']['size'];
                    $fileErrorMsg = $_FILES['file']['error'];
                    $kaboom = explode('.', $fileName);
                    $fileExt = end($kaboom);

                    $db_file_name = rand(100000000000, 999999999999) . '.' . $fileExt;


                    if($fileSize > 10485760) {
                        $errors[] = ['title' => 'Размер файла с изображением не должен превышать 10Mb.'];
                    } else if(!preg_match("/\.(gif|jpg|jpeg|png|pdf|doc)$/i", $fileName)) {
                        $errors[] = ['title' => 'Неверный формат файла.', 'description' => '<p>Файл изображения должен быть в формате gif, jpg, png, pdf и doc.</p>'];
                    } else if($fileErrorMsg == 1) {
                        $errors[] = ['title' => 'При загрузке изображения произошла ошибка.'];
                    }

                    $filesFolderLocation = ROOT . 'usercontent/upload_files/';
                    $uploadfile = $filesFolderLocation . $db_file_name;
                    $moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

                    if($moveResult != true) {
                        $errors[] = ['title' => 'Ошибка сохранения файла.'];
                    }

                    $messages->message_file_name_original = $fileName;
                    $messages->message_file = $db_file_name;
                }

                R::store($messages);
                $success[] = ['title' => 'Сообщение было успешно отправлено!'];
            }
        }
    }

    //Подготавливаем контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/contacts/contacts.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot-contacts.tpl');
?>