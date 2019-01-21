<?php
    $title = 'Установка нового пароля';
    $recoveryCode = false;
    $newPasswordReady = false;
    if(!empty($_GET['email'])) {
        //Выбор из БД пользователя с указанным email
        $user = R::findOne('users', 'email=?', array($_GET['email']));

        if($user) {
            $user->recovery_code_times--;
            R::store($user);

            //Проверяем количество оставшихся попыток перехода по ссылке для восстановления пароля
            if($user->recovery_code_times < 1) {
                echo "The number of recovery attempts is limited";
                echo "<br></br>";
                echo "<a href='" . HOST . "'>Вернуться на главную</a>";
                die;
            }

            //Проверка правильности кода
            if($user->recovery_code == $_GET['code'])
                $recoveryCode = true;
            else 
                $recoveryCode = false;
        } else {
            echo "Пользователь с таким email не найден";
            die;
        }
    } else if(isset($_POST['set-new-password'])) {
        $user = R::findOne('users', 'email=?', array($_POST['resetemail']));
        $user->recovery_code_times--;
        R::store($user);

        if($user) {
            if($user->recovery_code_times < 1)
                die;

            if($user->recovery_code == $_POST['onetimecode']) {
                //Если все верно - устанавливаем новый пароль и убиваем код
                if(trim($_POST['password']) == '') {
                    $errors[] = ['title' => 'Введите пароль'];
                } else {
                    if(trim($_POST['password-confirm']) == '') { 
                        $errors[] = ['title' => 'Подтвердите пароль'];
                    } else {
                        if(trim($_POST['password']) == trim($_POST['password-confirm'])) {
                            $user->password = password_hash($_POST['password'], PASSWORD_DEFAULT);
                            //Убиваем код
                            $user->recovery_code_times = 0;
                            R::store($user);
                            $success[] = ['title' => 'Пароль успешно изменен!'];
                            $newPasswordReady = true;
                        } else {
                            $errors[] = ['title' => 'Пароли не совпадают'];
                        }
                    }
                }
            }
        }
    } else {
        header('Location: ' . HOST . 'lost-password');
        die;
    }

    //Готовим контент для центральной части
    ob_start();
    include(ROOT . 'templates/login/form-set-new-password.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/login/login-page.tpl');
?>