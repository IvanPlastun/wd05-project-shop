<?php

//Загружаем пользователя, на случай, если придется обновить корзину на сервере
$currentUser = $_SESSION['logged_user'];
$user = R::load('users', $currentUser->id);

//Опеределяем корзину в БД
$cartServer = json_decode($user->cart, true);

//Определяем локальную корзину
if(isset($_COOKIE['cart'])) {
    $cartLocal = json_decode($_COOKIE['cart'], true);
} else {
    $cartLocal = array();
}

if(count($cartServer) > 0 && count($cartLocal) > 0) {
    //Совмещаем обе корзины и сохраняем в БД и в Cookies
    function uniteCarts($cartServer, $cartLocal) {
        $cartNew = array();

        //Создаем и обновляем корзину на основе корзины с Сервера
        foreach($cartServer as $key => $value) {
            if(array_key_exists($key, $cartLocal)) {
                if($cartServer[$key] < $cartLocal[$key]) {
                    $cartNew[$key] = $cartLocal[$key];
                } else {
                    $cartNew[$key] = $cartServer[$key];
                }
            } else {
                $cartNew[$key] = $cartServer[$key];
            }
        }

        //Дополняем корзину отсутствующими товарами из локальной корзины
        foreach($cartLocal as $key => $value) {
            if(!array_key_exists($key, $cartNew)) {
                $cartNew[$key] = $cartLocal[$key];
            }
        }

        //Сортируем товары в корзине по ID
        ksort($cartNew);

        //Преобразуем новую корхину в JSON
        $cartNew = json_encode($cartNew);

        return $cartNew;
    }

    $cartNew = uniteCarts($cartServer, $cartLocal);

    $user->cart = $cartNew;
    R::store($user);
    setcookie('cart', $cartNew);
} elseif(count($cartServer) == 0 && count($cartLocal) > 0) {
    //Берем корзину из Cookies и сохраняем её в БД
    $user->cart = json_encode($cartLocal);
    R::store($user);
} elseif(count($cartServer) > 0 && count($cartLocal) == 0) {
    setcookie('cart', json_encode($cartServer));
}

?>