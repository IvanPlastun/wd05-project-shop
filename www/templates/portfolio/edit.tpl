<?php
    function dataFromPOST($nameField) {
        global $work;
        echo (@$_POST[$nameField] != '') ? @$_POST[$nameField] : $work[$nameField];
    }
?>
<div class="sticky-footer-content">
    <div class="container add-works pl-0 pr-0 pt-80 pb-120">
        <div class="row ml-0 mr-0">
            <div class="col-10 offset-1 pl-0 pr-0">
                <div class="add-works__title">
                    <h1 class="title-general mt-0 mb-10">Редактировать работу</h1>
                </div>
                <?php require(ROOT . 'templates/_parts/_errors.tpl');?>
                <form class="add-works__form mt-40" method="POST" enctype="multipart/form-data" action="<?=HOST?>portfolio-edit?id=<?=$work['id']?>">
                    <div class="add-works__form-item mb-30">
                        <label class="label" for="field-work-name">Название</label>
                            <input class="input" name="title" id="field-work-name" type="text" placeholder="Введите название работы" value="<?=dataFromPOST('title')?>"/>
                        </div>
                    <div class="add-works__form-item mb-30">
                        <section class="upload-file">
                            <h6 class="upload-file__title">Изображение</h6>
                            <p class="upload-file__description">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 10Мб.</p>
                            <div class="upload-file-input-file">
                                <input class="input-file" type="file" name="imagework" id="upload-file" data-multiple-caption="{count}" />
                                <label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
                            </div>
                            <?php if($work['imagework_small'] != '' && $work['imagework'] != '' && file_exists(ROOT . 'usercontent/portfolio/' . $work['imagework_small'])) { ?>
                                <div class="upload-file-image-box">
                                    <img src="<?=HOST?>usercontent/portfolio/<?=$work['imagework_small']?>" alt="<?=$work['title']?>">
                                    <input class="button button-delete button--small-delete upload-file-image-box--button-position" type="submit" name="deleteImgWork" value="Удалить">
                                </div>
                            <?php } ?>
                        </section>
                    </div>
                    <label class="label">Содержание</label>
                    <div class="add-works__form-item mt-10 mb-30">
                        <textarea class="textarea" name="description" id="description-work" placeholder="Введите описание"><?=dataFromPOST('description')?></textarea>
                    </div>
                    <label class="label">Результат</label>
                    <div class="add-works__form-item mt-10 mb-30">
                        <textarea class="textarea" name="result" id="resultwork" placeholder="Введите описание"><?=dataFromPOST('result')?></textarea>
                    </div>
                    <label class="label">Технологии</label>
                    <div class="add-works__form-item mt-10 mb-30">
                        <textarea class="textarea" name="technologes" id="techwork" placeholder="Введите описание"><?=dataFromPOST('technologes')?></textarea>
                    </div>
                    <div class="row ml-0 mr-0">
                        <div class="col-3 no-paddings mr-30">
                            <label class="label" for="field-link-project">Ссылка на проект</label>
                            <input class="input" name="linkproject" id="field-link-project" type="url" placeholder="Введите ссылку" value="<?=dataFromPOST('linkproject')?>"/>
                        </div>
                        <div class="col-3 no-paddings">
                            <label class="label" for="link-on-github">Ссылка на GitHub</label>
                            <input class="input" name="github" id="link-on-github" type="url" placeholder="Введите ссылку" value="<?=dataFromPOST('github')?>"/>
                        </div>
                    </div>
                    <div class="row ml-0 mr-0 mt-30">
                        <input class="button button-save mr-20" type="submit" name="editwork" value="Сохранить" />
                        <a class="button" href="<?=HOST?>portfolio">Отмена</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        CKEDITOR.replace('description-work');
        CKEDITOR.replace('resultwork');
        CKEDITOR.replace('techwork');
    });
</script>