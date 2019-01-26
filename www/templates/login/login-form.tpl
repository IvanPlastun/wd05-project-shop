<h1 class="autorization-content__title mb-30">Вход на сайт</h1>
<?php require ROOT . "templates/_parts/_errors.tpl"?>
<form class="autorization-content-form" method="POST" action="<?=HOST?>login">
    <input class="input mb-10" name="email" id="input-email" type="email" placeholder="E-mail"/>
    <input class="input mb-25" name="password" id="input-password" type="password" placeholder="Пароль"/>
    <div class="autorization-content-form-help mb-30">
        <label class="form__label-checkbox">
            <input class="form__input-checkbox" type="checkbox" checked="checked" />
            <span class="form__checkbox"></span>Запомнить меня
        </label>
        <a class="link" href="<?=HOST?>lost-password">Забыл пароль</a>
    </div>
    <div class="autorization-content-form-button">
        <input class="button button-enter" type="submit" name="login" value="Войти"/>
    </div>
</form>