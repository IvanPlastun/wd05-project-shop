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
            <?php ($contacts['firstname'] != '' || $contacts['firstname'] != NULL) ? showContactInfo('Имя', 'firstname') : '';?>
            <?php ($contacts['lastname'] != '' || $contacts['lastname'] != NULL) ? showContactInfo('Фамилия', 'lastname') : '';?>
            <?php ($contacts['email'] != '' || $contacts['email'] != NULL) ? showContactInfo('Email', 'email', 'link') : '';?>
            <?php ($contacts['github'] != '' || $contacts['github'] != NULL) ? showContactInfo('Github', 'github', 'link') : '';?>
            <?php ($contacts['skype'] != '' || $contacts['skype'] != NULL) ? showContactInfo('Skype', 'skype', 'link') : '';?>
            <?php if(count($socialNetworks) != 0):?>
                <div class="row mb-15">
                    <div class="col-6 contacts-category">
                        <p>Социальные сети:</p>
                    </div>
                    <div class="col-6 link-box-info">
                    <?php
                        showSocialNetworks($socialNetworks);
                    ?>
                    </div>
                </div>
            <?php endif ?>
            <?php ($contacts['address'] != '' || $contacts['address'] != NULL) ? showContactInfo('Телефон', 'phone') : '';?>
            <?php ($contacts['address'] != '' || $contacts['address'] != NULL) ? showContactInfo('Адрес', 'address') : '';?>
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
                <input type="hidden" name="recaptcha_response" id="recaptchaResponse">
            </form>
        </div>
    </div>
</div>
<div class="geolocation" id="map"></div>