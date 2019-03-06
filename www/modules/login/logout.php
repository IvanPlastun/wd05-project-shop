<?php
    unset($_SESSION['logged_user']);
    unset($_SESSION['login']);
    unset($_SESSION['role']);
    setcookie('cart', '');
    session_destroy();

    //Уничтожает cookie связанную с сессией, которая хранит в себе session_ID
    setcookie(session_name(), '', time() - 60 * 60 * 24 * 32, '/');

    if(isset($_COOKIE["password_cookie_token"])){
        $user = R::load('users', $user->id);
        $user->password_cookie_token = NULL;
        R::store($user);
        setcookie('password_cookie_token', $user['password_cookie_token'], time() - 3600);
    }
    header('Location: ' . HOST);
?>