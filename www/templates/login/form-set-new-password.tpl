<?php if($newPasswordReady == false): ?>
    <h1 class="autorization-content__title mb-30">Восстановление пароля</h1>
<?php endif ?>
<?php require ROOT . "templates/_parts/_errors.tpl"?>
<?php require ROOT . "templates/_parts/_success.tpl"?>
<form class="autorization-content-form" method="POST" action="<?=HOST?>set-new-password">
    <?php if($newPasswordReady == false): ?>
        <input class="input mb-10" name="password" id="new-password" type="password" placeholder="Новый пароль"/>
        <input class="input mb-10" name="password-confirm" id="conf-password" type="password" placeholder="Подтвердите пароль"/>
    <?php endif ?>
    <div class="autorization-content-form-help mb-30 text-center">
        <a class="link" href="<?=HOST?>login">Перейти на страницу входа</a>
    </div>
    <?php if($newPasswordReady == false): ?>
        <div class="autorization-content-form-button">
            <input type="hidden" name="resetemail" value="<?=$_GET['email']?>">
            <input type="hidden" name="onetimecode" value="<?=$_GET['code']?>">
            <input class="button button-enter" type="submit" name="set-new-password" value="Изменить пароль"/>
        </div>
    <?php endif ?>
</form>