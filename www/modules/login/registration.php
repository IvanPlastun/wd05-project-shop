<?php
    $title = 'Регистрация';
    if(!empty($_POST)) {
        if(isset($_POST['register'])) {
            $pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z{2,4}\.])?[a-z]{2,4}$/i';

            if(trim($_POST['email']) == '') {
                $errors[] = ['title' => 'Введите email'];
            } else {
                if(!preg_match($pattern, trim($_POST['email']))) {
                    $errors[] = ['title' => 'Неверный формат email'];
                }
            }

            if(trim($_POST['password']) == '') {
                $errors[] = ['title' => 'Введите пароль'];
            }

            if(R::count('users', 'email=?', array($_POST['email'])) > 0) {
                $errors[] = [
                        'title' => 'Данный email уже занят',
                        'description' => '<p>Используйте другой email чтобы создать новый аккаунт.</p>'
                ];
            }

            if(empty($errors)) {
                //Если ошибок нет создаем новый Bean
                $user = R::dispense('users');
                //Создаем в таблице users поля email, role, password
                //поле email предварительно обрабатываем для защиты от XSS
                $user->email = htmlentities($_POST['email']);
                //Выполняем хеширование пароля перед сохранением его в БД
                $user->password = password_hash($_POST['password'], PASSWORD_DEFAULT);
                //Устанавливаем роль для пользователя
                $user->role = 'user';
                R::store($user);

                //Записываем данные зарегистрированного пользователя в сессию
                $_SESSION['logged-user'] = $user;
                $_SESSION['login'] = 1;
                $_SESSION['role'] = $user->role;

                header('Location: ' . HOST . 'profile-edit');
                exit();
            }
        }
    }

    //Готовим контент для центральной части
    ob_start();
    include(ROOT . 'templates/login/form-registration.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/login/login-page.tpl');
?>