<?php
    //Соединение с базой данных
    R::setup('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASSWORD);
    //R::freeze(TRUE);
?>