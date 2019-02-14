<?php
    if(!isAdmin()) {
        header('Location: ' . HOST);
        die();
    }

    $title = 'Магазин - Удаление товара';

    $item = R::load('goods', $_GET['id']);

    if(!empty($_POST)) {
        if(isset($_POST['itemDelete'])) {

            $imgFolderLocation = ROOT . 'usercontent/shop/';
            $itemImg = $item['img'];

            if($itemImg != '') {
                $picurl = $imgFolderLocation . $itemImg;
                if(file_exists($picurl)) {unlink($picurl);}

                $picurl320 = $imgFolderLocation . '320-' . $itemImg;
                if(file_exists($picurl320)) {unlink($picurl320);}
            }

            R::trash($item);
            header('Location: ' . HOST . 'shop?result=itemDeleted');
            exit();
        }
    }

    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/shop/item-delete.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>