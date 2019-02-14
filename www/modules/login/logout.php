<?php
    unset($_SESSION['logged_user']);
    unset($_SESSION['login']);
    unset($_SESSION['role']);
    setcookie('cart', '');
    session_destroy();

    //Уничтожает cookie связанную с сессией, которая хранит в себе session_ID
    setcookie(session_name(), '', time() - 60 * 60 * 24 * 32, '/');
    header('Location: ' . HOST);
?>