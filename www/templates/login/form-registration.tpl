    <h1 class="autorization-content__title mb-40">Регистрация</h1>
    <form id="registration-form" class="autorization-content-form" method="POST" action="<?=HOST?>registration">
    <?php require(ROOT . 'templates/_parts/_errors.tpl')?>
        <input class="input mb-10" name="email" id="input-reg-email" type="text" placeholder="E-mail"/>
        <input class="input mb-30" name="password" id="input-reg-password" type="password" placeholder="Пароль" />
        <div class="autorization-content-form-button">
            <input class="button button-enter" type="submit" name="register" value="Регистрация" />
        </div>
    </form>
    <!-- build:jsLibs js/libs.js -->
    <script src="<?=HOST?>templates/assets/libs/jquery/jquery.min.js"></script><!-- endbuild -->
	<!-- build:jsMain js/main.js -->
	<script src="<?=HOST?>templates/assets/js/main.js"></script>
	<!-- endbuild -->
	<script defer="defer" src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</body>
</html>