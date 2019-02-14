<?php
//id товара, который мы добавили в корзину
$currentItemId = intval($_POST['itemId']);

//Определяем локальную корзину
if(isset($_COOKIE['cart'])) {
    //json_decode - функция, которая преобразует JSON формат в объект
    // чтобы получить ассоциативный массив необходимо передать 2 логический параметр true
    $cartLocal = json_decode($_COOKIE['cart'], true);
} else {
    $cartLocal = array();
}

//Если такой товар уже есть в Корзине, тогда увеличиваем его количество на 1, если нет, то записывает его количество равным 1
if(isset($cartLocal[$currentItemId])) {
    $items = $cartLocal[$currentItemId];
    $items++;
    $cartLocal[$currentItemId] = $items;
} else {
    $cartLocal[$currentItemId] = 1;
}

//Сохраняем товар в Cookie
setcookie('cart', json_encode($cartLocal));

//Если пользователь залогинен, то сохраняем товар в БД
if(isLoggedIn()) {
    $currentUser = $_SESSION['logged_user'];
    $user = R::load('users', $currentUser->id);
    $user->cart = json_encode($cartLocal);
    R::store($user);
}

header('Location: ' . HOST . 'shop/item?id=' . $currentItemId);
exit();
?>