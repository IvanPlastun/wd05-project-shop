<h1 class="autorization-content__title mb-30">Забыл пароль</h1>
<?php require ROOT . "templates/_parts/_errors.tpl"?>
<?php require ROOT . "templates/_parts/_success.tpl"?>
<form class="autorization-content-form" method="POST" action="<?=HOST?>lost-password">
    <input class="input mb-10" name="email" id="lost-email" type="email" placeholder="E-mail"/>
    <div class="autorization-content-form-help mb-30 text-center">
        <a class="link" href="<?=HOST?>login">Перейти на страницу входа</a>
    </div>
    <div class="autorization-content-form-button">
        <input class="button button-enter" type="submit" name="restore-password" value="Восстановить"/>
    </div>
</form>