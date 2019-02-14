<?php

    $title = 'Корзина - Магазин';

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


    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/cart/cart.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>