<?php

    //ID товара, который удаляем из корзины
    $currentItemId = intval($_POST['itemId']);

    //Определяем локальную корзину
    if(isset($_COOKIE['cart'])) {
        $cartLocal = json_decode($_COOKIE['cart'], true);
    } else {
        $cartLocal = array();
    }

    if(isset($cartLocal[$currentItemId])) {
        if($cartLocal[$currentItemId] > 1) { 
            $items = $cartLocal[$currentItemId];
            $items--;
            $cartLocal[$currentItemId] = $items;
        } else {
            unset($cartLocal[$currentItemId]);
        }
    }

    //Сохраняем Cookies
    setcookie('cart', json_encode($cartLocal));

    //Если пользователь залогинен, то сохраним в БД
    if(isLoggedIn()) {
        $currentUser = $_SESSION['logged_user'];
        $user = R::load('users', $currentUser['id']);
        $user->cart = json_encode($cartLocal);
        R::store($user);
    }

    //Возвращаем обратно на страницу с товаром
    header('Location: ' . HOST . 'cart');
    exit();
?>