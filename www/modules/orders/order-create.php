<?php
    $title = 'Создать заказ - магазин';
    $pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z{2,4}\.])?[a-z]{2,4}$/i';

    /* **************************************

        Получаем данные для вывода товаров заказа

    ***************************************** */
    if(isset($_COOKIE['cart'])) {

        $cookieCartArray = json_decode($_COOKIE['cart'], true);
        //Запрашиваем Cookie
        if(count($cookieCartArray > 0)) {
            $cartItems = array();
            foreach($cookieCartArray as $key => $value) {
                $cartItems[] = $key;
            }

            //На основе Cookie отправляем запрос в БД на товары в корзине
            $cartGoods = R::findLike('goods', [
                'id' => $cartItems
            ], 'ORDER BY id ASC');

        } else {
            $cartGoods = array();
        }

        $cartItemsArray = json_decode($_COOKIE['cart'], true);
        $cartGoodsCount = 0;
        $cartGoodsCount = array_sum($cartItemsArray);
        $cartGoodsTotalPrice = 0;

        if(!empty($cartGoods) && !empty($cartItemsArray)) { 
            foreach($cartGoods as $item) {
                $cartGoodsTotalPrice += $cartItemsArray[$item['id']] * $item['price'];
            }
        }
    }

    if($cartGoodsCount <= 0) {
        header('Location: ' . HOST . 'cart');
        exit();
    }

    /* Массив товаров в заказе пользователя */
    $orderedGoodsSummary = array();
    foreach($cartGoods as $item) {
        $newItem = array();
        $newItem['id'] = $item['id'];
        $newItem['title'] = $item['title'];
        $newItem['price'] = $item['price'];
        $newItem['count'] = $cartItemsArray[$item['id']];
        $orderedGoodsSummary[] = $newItem;
    }


    /* *************** *********************** *********
        Обработка POST-запроса, сохранение заказа в БД 
    ****************** *********************** ********* */

    if(!empty($_POST)) {
        if(isset($_POST['createOrder'])) {
            if($cartGoodsCount <= 0) {
                $errors[] = ['title' => 'Заказ не может быть пустым.',
                            'description' => 'Добавьте товары в корзину чтобы сделать заказ.'];
            }

            if(trim($_POST['firstname']) == '') {
                $errors[] = ['title' => 'Введите имя'];
            }

            if(trim($_POST['lastname']) == '') {
                $errors[] = ['title' => 'Введите фамилию'];
            }

            if(trim($_POST['email']) == '') {
                $errors[] = ['title' => 'Введите email'];
            } else {
                if(!preg_match($pattern, $_POST['email']))  
                    $errors[] = ['title' => 'Неверный формат email'];
            }

            if(trim($_POST['phone']) == '') {
                $errors[] = ['title' => 'Введите телефон'];
            }


            if(empty($errors)) {
                $order = R::dispense('orders');
                $order->firstname = htmlentities($_POST['firstname']);
                $order->lastname = htmlentities($_POST['lastname']);
                $order->email = htmlentities($_POST['email']);
                $order->phone = htmlentities($_POST['phone']);
                $order->address = htmlentities($_POST['address']);
                $order->items = json_encode($orderedGoodsSummary);

                if(isLoggedIn()) {
                    $order->userId = $_SESSION['logged_user']['id'];
                }
                
                $order->itemsCount = $cartGoodsCount;
                $order->totalPrice = $cartGoodsTotalPrice;
                $order->status = 'new';
                $order->payment = 'no';
                $order->dateTime = R::isoDateTime();
                R::store($order);

                //Очистить корзину в Cookies
                setcookie('cart', '');

                //Очистить корзину в БД
                if(isLoggedIn()) {
                    $currentUser = $_SESSION['logged_user'];
                    $user = R::load('users', $_SESSION['logged_user']['id']);
                    $user['cart'] = "";
                    R::store($user);
                }

                $_SESSION['current_order'] = $order['id'];

                header('Location: ' . HOST . 'order-created-success');
                exit();
            }
        }
    }


    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/orders/order-create.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');

?>