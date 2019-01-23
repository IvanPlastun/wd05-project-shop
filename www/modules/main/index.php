<?php
    //Готовим контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    //include(ROOT . 'templates/main/main.tpl');
    $content = ob_get_contents();
    ob_end_clean();
    

    //Выводим шаблоны
    include(ROOT . "templates/_parts/_head.tpl");
    include(ROOT . "templates/template.tpl");
    include(ROOT . "templates/_parts/_footer.tpl");
    include(ROOT . "templates/_parts/_foot.tpl");
?>