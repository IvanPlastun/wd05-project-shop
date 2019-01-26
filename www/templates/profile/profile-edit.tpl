<div class="container pb-120 pt-80 pl-0 pr-0">
    <div class="row">
        <div class="col-10 offset-1">
            <h1 class="title-general mt-0 mb-10">Редактировать профиль</h1>
            <?php include(ROOT . 'templates/_parts/_errors.tpl');?>
            <form class="mt-35" enctype="multipart/form-data" method="POST" action="<?HOST?>profile-edit">
                <div class="user-edit-wrapper">
                    <div class="user-edit-name">
                        <label class="label" for="userEditName">Имя</label>
                        <input class="input" name="username" id="userEditName" type="text" placeholder="Введите имя" value="<?=$currentUser['name']?>"/>
                    </div>
                    <div class="user-edit-lastname mt-30">
                        <label class="label" for="userEditLastname">Фамилия</label>
                        <input class="input" name="lastname" id="userEditLastname" type="text" placeholder="Введите фамилию" value="<?=$currentUser['lastname']?>"/>
                    </div>
                    <div class="user-edit-email mt-30">
                        <label class="label" for="userEditEmail">Email</label>
                        <input class="input" name="useremail" id="userEditEmail" type="email" placeholder="Введите email" value="<?=$currentUser['email']?>"/>
                    </div>
                </div>
                <div class="user-edit-foto mt-30">
                    <section class="upload-file">
                        <h6 class="upload-file__title">Фотография</h6>
                        <p class="upload-file__description">Изображение jpg или png, рекомендуемый размер 220x220 пикселей, и весом до 10Мб.</p>
                        <input class="input-file" type="file" name="avatar" id="upload-file" data-multiple-caption="{count}" />
                        <label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
                    </section>
                </div>
                <div class="user-edit-wrapper mt-30">
                    <div class="user-edit-land">
                        <label class="label" for="userEditLand">Страна</label>
                        <input class="input" name="country" id="userEditLand" type="text" placeholder="Введите страну" value="<?=$currentUser['country']?>"/>
                    </div>
                    <div class="user-edit-city mt-30">
                        <label class="label" for="userEditCity">Город</label>
                        <input class="input" name="city" id="userEditCity" type="text" placeholder="Введите город" value="<?=$currentUser['city']?>"/>
                    </div>
                    <div class="user-edit-buttons mt-30">
                        <input class="button button-save" type="submit" name="save-profile" value="Сохранить"/>
                        <input class="button" type="submit" name="cancel-profile-edit" value="Отмена"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>