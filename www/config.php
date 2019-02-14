<?php

    //Настройки для базы данных
    define('DB_HOST', 'localhost');
    define('DB_NAME', 'wd05-project-plastun');
    define('DB_USER', 'root');
    define('DB_PASSWORD', '');

    //Настройки сайта для email
    define('SITE_NAME', 'Личный сайт - Ивана Пластун');
    define('SITE_EMAIL', 'info@webdev05.com');
    define('ADMIN_EMAIL', 'info@mail.com');
    define('YANDEX_WALLET', '410014587407980');
    define('YANDEX_SECRET', '0nsM3CnDuXE5Ti9DJnNfWXr6');


    //Устанавливаем путь для хоста по протоколу HTTP
    define("HOST", "http://{$_SERVER['HTTP_HOST']}/");

    //Устанавливаем путь до корневого каталога проекта
    define("ROOT", dirname(__FILE__) . '/');

?>