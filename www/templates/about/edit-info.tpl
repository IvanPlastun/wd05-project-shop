<?php
    function dataFromPOST($nameField) {
        global $about;
        echo (@$_POST[$nameField] != '') ? @$_POST[$nameField] : $about[$nameField];
    }
?>
<div class="about-me-edit">
    <div class="container">
        <div class="row">
            <div class="col-md-10 offset-md-1">
                <h1 class="title-general edit-title--color mt-0 mb-35">Редактировать - Обо Мне</h1>
                <?php require(ROOT . 'templates/_parts/_errors.tpl');?>
                <form method="POST" enctype="multipart/form-data" action="<?=HOST?>about-edit" class="about-me-edit-info-form" id="about-me-edit-info">
                    <div class="edit-name mb-20">
                        <label class="label" for="editfirstName">Имя</label>
                        <input class="input" name="firstname" id="editFirstName" type="text" placeholder="Введите имя" value="<?=dataFromPOST('firstname')?>"/>
                    </div>
                    <div class="edit-name">
                        <label class="label" for="editLastName">Фамилия</label>
                        <input class="input" name="lastname" id="editLastName" type="text" placeholder="Введите фамилию" value="<?=dataFromPOST('lastname')?>"/>
                    </div>
                    <div class="upload-photo mt-30 mb-35">
                        <section class="upload-file">
                            <h6 class="upload-file__title">Фотография</h6>
                            <p class="upload-file__description">Изображение jpg или png, рекомендуемый размер 205x205 пикселей, и весом до 2Мб.</p>
                            <input class="input-file" type="file" name="photo" id="photo-file" data-multiple-caption="{count}" />
                            <label class="input-file-mark" for="photo-file">Выбрать файл</label><span>Файл не выбран</span>
                        </section>
                        <?php if($about['photo'] != '' && file_exists(ROOT . 'usercontent/about/' . $about['photo'])): ?>
                            <div class="upload-photo__result">
                                <img src="<?=HOST?>usercontent/about/<?=$about['photo']?>" alt="<?=$about['firstname']?> <?=$about['lastname']?>" />
                            </div>
                        <?php endif ?>
                    </div>
                    <div class="edit-information">
                        <textarea class="textarea edit-information__textarea" name="aboutinfo" id="aboutdescription" placeholder="Напишите информацию о себе">
                            <?=dataFromPOST('aboutinfo')?>
                        </textarea>
                    </div>
                    <div class="about-me-edit-buttons">
                        <input class="button button-save mr-20" type="submit" name="saveInfo" value="Сохранить" />
                        <a class="button" href="<?=HOST?>about">Отмена</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        CKEDITOR.replace('aboutdescription');
    });
</script>