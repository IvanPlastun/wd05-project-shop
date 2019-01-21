<?php
    $title = 'Вход на сайт';
    if(!empty($_POST)) {
        if(isset($_POST['login'])) {
            $pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z{2,4}\.])?[a-z]{2,4}$/i';
            if(trim($_POST['email']) == '') {
                $errors[] = ['title' => 'Введите email'];
            } else {
                if(!preg_match($pattern, $_POST['email'])) {
                    $errors[] = ['title' => 'Неверный формат email'];
                }
            }

            if(trim($_POST['password']) == '') {
                $errors[] = ['title' => 'Введите пароль'];
            }


            if(empty($errors)) {
                //Получаем пользователя из БД для проверки
                $user = R::findOne('users', 'email=?', array($_POST['email']));
                if($user) {
                    if(password_verify($_POST['password'], $user->password)) {
                        $_SESSION['logged-user'] = $user;
                        $_SESSION['login'] = 1;
                        $_SESSION['role'] = $user->role;
                        header('Location: ' . HOST);
                        exit();
                    } else {
                        $errors[] = ['title' => 'Пароль введен не верно'];
                    }
                } else {
                    $errors[] = ['title' => 'Пользователь с таким email не зарегистрирован'];
                }
            }
        }
    }

    //Подготовка центральной части
    ob_start();
    include(ROOT . 'templates/login/login-form.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключение основных шаблонов
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/login/login-page.tpl');
?>