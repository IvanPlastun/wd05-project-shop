<?php

    //Настройки для базы данных
    define('DB_HOST', 'localhost');
    define('DB_NAME', 'wd05-project-plastun');
    define('DB_USER', 'root');
    define('DB_PASSWORD', '');


    //Устанавливаем путь для хоста по протоколу HTTP
    define("HOST", "http://{$_SERVER['HTTP_HOST']}/");

    //Устанавливаем путь до корневого каталога проекта
    define("ROOT", dirname(__FILE__) . '/');

?>