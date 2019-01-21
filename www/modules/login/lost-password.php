<?php
    $title = 'Восстановление пароля';
    if(!empty($_POST)) {
        if(isset($_POST['restore-password'])) {
            if(trim($_POST['email']) == '') {
                $errors[] = ['title' => 'Введите email'];
            } else {
                $pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z{2,4}\.])?[a-z]{2,4}$/i';
                if(!preg_match($pattern, $_POST['email'])) {
                    $errors[] = ['title' => 'Неверный формат email'];
                }
            }

            if(empty($errors)) {
                $user = R::findOne('users', 'email=?', array($_POST['email']));

                if($user) {
                    //генерация кода для восстановления пароля и сохранения кода в БД
                    function random_str($num = 30) {
                        return substr(str_shuffle('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, $num);
                    }
                    $recovery_code = random_str(15);

                    //Запись кода для восстановления пароля в таблицу users
                    $user->recovery_code = $recovery_code;
                    //Запись количества попыток на восстановление пароля
                    $user->recovery_code_times = 3;
                    R::store($user);

                    //Подготовка и отправка пользователю сообщения с инструкциями восстановления пароля
                    $recovery_message = "<p>Код для сброса пароля: <b>$recovery_code</b></p>";
                    $recovery_message .= "<p>Для сброса пароля перейдите по ссылке ниже, и установите новый пароль:</p>";
                    $recovery_message .= '<p><a href="' . HOST;
                    $recovery_message .= "set-new-password?email={$_POST['email']}&code={$recovery_code}";
                    $recovery_message .= '" target="_blank">';
                    $recovery_message .= "Установить новый пароль</a></p>";

                    //Установка заголовков перед отправкой сообщения пользователю
                    $headers = "MIME-Version: 1.0" . PHP_EOL .
                            "Content-Type: text/html; charset=utf-8" . PHP_EOL .
                            "From: " . adopt(SITE_NAME) . "<" . SITE_EMAIL . ">" . PHP_EOL .
                            "Reply-To:" . ADMIN_EMAIL;

                    //Отправляем письмо на почту пользователя с инструкциями по восстановлению пароля
                    mail($_POST['email'], 'Восстановление доступа', $recovery_message, $headers);
                    $success[] = ['title' => 'Инструкции отправлены', 'description' => 'Для восстановление доступа перейдите в свой почтовый ящик'];
                } else {
                    $errors[] = ['title' => 'Пользователь с таким email не зарегистрирован'];
                }
            } 
        }
    }

    //Подготовка центральной части
    ob_start();
    include(ROOT . 'templates/login/form-lost-password.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    //Подключение основных шаблонов
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/login/login-page.tpl');
?>