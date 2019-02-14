<?php
    $text = json_encode($_POST);
    
    $string = $_POST['notification_type'].'&'.$_POST['operation_id'].'&'.$_POST['amount'].'&'.
    $_POST['currency'].'&'.$_POST['datetime'].'&'.$_POST['sender'].'&'.
    $_POST['codepro'].'&'.YANDEX_SECRET.'&'.$_POST['label'];

    $hash =  sha1($string);

    if($hash == $_POST['sha1_hash']) {
        $order = R::load('orders', $_POST['label']);

        if($_POST['codepro'] === 'true') {
            $order->payment = 'codepro';
        }

        if($_POST['unaccepted'] === 'true') {
            $order->payment = 'unaccepted';
        }

        if($_POST['codepro'] !== 'true' && $_POST['unaccepted'] !== 'true') {
            $order->payment = 'payed';
        }

        $order->payment_datetime = $_POST['datetime'];
        $order->payment_amount = $_POST['amount'];
        R::store($order);
        exit();
    } else {
        exit();
    }
?>

