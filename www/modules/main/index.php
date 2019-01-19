<?php
    $user = R::find('about');

    ob_start();
    include(ROOT . 'templates/_parts/_main.tpl');
    $content = ob_get_contents();
    ob_end_clean();


    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
?>