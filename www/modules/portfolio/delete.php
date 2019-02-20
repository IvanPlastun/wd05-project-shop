<?php
    $title = "Портфолио - удалить работу";

    if(!isAdmin()) { 
        header('Location: ' . HOST);
        die();
    }

    if(isset($_GET['id']))
        $work = R::load('portfolio', $_GET['id']);

    if(!empty($_POST)) {
        if(isset($_POST['work-delete'])) {
            $workImage = $work['imagework'];
            $workImageLocation = ROOT . 'usercontent/portfolio/';

            if($workImage != '') {
                $pictureImgurl = $workImageLocation . $workImage;
                if(file_exists($pictureImgurl)) {unlink($pictureImgurl);}

                $pictureImgurl360 = $workImageLocation . '360-' . $workImage;
                if(file_exists($pictureImgurl360)) {unlink($pictureImgurl360);}
            }

            R::trash($work);
            header('Location: ' . HOST . 'portfolio?result=workDeleted');
            exit();
        }
    }

    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/portfolio/delete.tpl');
    $content = ob_get_contents();
    ob_end_clean();

    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>