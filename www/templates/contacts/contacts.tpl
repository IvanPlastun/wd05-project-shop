<?php include(ROOT . 'templates/contacts/_show-contacts-info.tpl');?>
<div class="container pt-55 pb-80">
    <div class="row">
    <?php if(isAdmin()): ?>
        <div class="col-12 clearfix mb-30">
            <a class="button float-right" href="<?=HOST?>contacts-messages">Сообщения</a>
            <a class="button button-edit float-right mr-20" href="<?=HOST?>contacts-edit">Редактировать</a>
        </div>
    <?php endif ?>
        <div class="col-5">
            <h1 class="title-general mb-30">Контакты</h1>
            <?php showContactInfo('Имя', 'firstname');?>
            <?php showContactInfo('Фамилия', 'lastname');?>
            <?php showContactInfo('Email', 'email', 'link');?>
            <?php showContactInfo('Github', 'github', 'link');?>
            <?php showContactInfo('Skype', 'skype', 'link');?>
            <?php showContactInfo('Социальные сети', $socialNetworks, 'social');?>
            <?php showContactInfo('Телефон', 'phone');?>
            <?php showContactInfo('Адрес', 'address');?>
        </div>
        <div class="col-4 offset-1">
            <div class="title-general mb-40">Связаться со мной</div>
            <?php require(ROOT . 'templates/_parts/_errors.tpl');?>
            <?php require(ROOT . 'templates/_parts/_success.tpl');?>
            <form class="feedback-form" method="POST" enctype="multipart/form-data" action="<?=HOST?>contacts">
                <input class="input" name="name" type="text" placeholder="Введите имя" />
                <input class="input" name="email" type="email" placeholder="Email" />
                <textarea class="textarea mb-20" name="message" placeholder="Сообщение"></textarea>
                <section class="upload-file">
                    <h6 class="upload-file__title">Прикрепить файл</h6>
                    <p class="upload-file__description">jpg, png, pdf, doc, весом до 2Мб.</p>
                    <input class="input-file" type="file" name="file" id="upload-file" data-multiple-caption="{count}" />
                    <label class="input-file-mark input-file-mark--rounded" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
                </section>
                <input class="button button-save mt-20" type="submit" name="sendMessage" value="Отправить" />
            </form>
        </div>
    </div>
</div>
<div class="geolocation" id="map"></div>