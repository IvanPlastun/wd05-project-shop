<?php
    if(!isAdmin()) { 
        header('Location: ' . HOST);
        die();
    }

    $messages = R::find('messages', 'ORDER BY id DESC');
    $title = 'Сообщения';

    if(isset($_GET['id']))
        $messageForDelete = R::load('messages', $_GET['id']);

    if(!empty($_GET)) {
        if(isset($_GET['id']) && isset($_GET['messagedelete']) && $_GET['id'] == $messageForDelete['id']) {
            $file = $messageForDelete['message_file'];
            $uploadFileLocation = ROOT . 'usercontent/upload_files/';

            if($file != '') {
                $fileImgurl = $uploadFileLocation . $file;
                if(file_exists($fileImgurl)) {unlink($fileImgurl);}
            }
            R::trash($messageForDelete);
            $messages = R::find('messages', 'ORDER BY id DESC');
        }
    }

    //Подготавливаем контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/contacts/message.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>