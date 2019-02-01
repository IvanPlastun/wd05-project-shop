<?php
    if(!isAdmin()) { 
        header('Location: ' . HOST);
        die();
    }
    
    $title = 'Контакты - редактировать';
    $pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z{2,4}\.])?[a-z]{2,4}$/i';

    $contacts = R::load('contacts', 1);

    if(!empty($_POST)) {
        if(isset($_POST['saveContactsData'])) {
            if(trim($_POST['firstname']) == '') {
                $errors[] = ['title' => 'Введите имя'];
            }

            if(trim($_POST['lastname']) == '') {
                $errors[] = ['title' => 'Введите фамилию'];
            }

            if(trim($_POST['email']) == '') {
                $errors[] = ['title' => 'Введите email'];
            } else {
                if(!preg_match($pattern, $_POST['email'])) {
                    $errors[] = ['title' => 'Неверный формат email'];
                }
            }

            if(trim($_POST['phone']) == '') {
                $errors[] = ['title' => 'Введите телефон'];
            }

            if(trim($_POST['address']) == '') {
                $errors[] = ['title' => 'Введите адрес'];
            }

            if(empty($errors)) {
                $contacts->firstname = htmlentities($_POST['firstname']);
                $contacts->lastname = htmlentities($_POST['lastname']);
                $contacts->email = htmlentities($_POST['email']);
                $contacts->phone = htmlentities($_POST['phone']);
                $contacts->address = htmlentities($_POST['address']);

                $contacts->skype = htmlentities($_POST['skype']);
                $contacts->vkontakte = htmlentities($_POST['vkontakte']); 
                $contacts->facebook = htmlentities($_POST['facebook']); 
                $contacts->github = htmlentities($_POST['github']); 
                $contacts->twitter =  htmlentities($_POST['twitter']);

                R::store($contacts);
                header('Location: ' . HOST . 'contacts');
                exit();
            }
        }
    }

    //Подготаливаем контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/contacts/edit.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>