<div class="sticky-footer-content">
    <div class="container add-works pl-0 pr-0 pt-80 pb-120">
        <div class="row ml-0 mr-0">
            <div class="col-10 offset-1 pl-0 pr-0">
                <div class="add-works__title">
                    <h1 class="title-general mt-0 mb-10">Добавить работу</h1>
                </div>
                <?php require(ROOT . 'templates/_parts/_errors.tpl');?>
                <form class="add-works__form mt-40" method="POST" enctype="multipart/form-data" action="<?=HOST?>portfolio-new">
                    <div class="add-works__form-item mb-30">
                        <label class="label" for="field-work-name">Название</label>
                            <input class="input" name="title" id="field-work-name" type="text" placeholder="Введите название работы" />
                        </div>
                    <div class="add-works__form-item mb-30">
                        <section class="upload-file">
                            <h6 class="upload-file__title">Изображение</h6>
                            <p class="upload-file__description">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</p>
                            <input class="input-file" type="file" name="imagework" id="upload-file" data-multiple-caption="{count}" />
                            <label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
                        </section>
                    </div>
                    <label class="label">Содержание</label>
                    <div class="add-works__form-item mt-10 mb-30">
                        <textarea class="textarea" name="description" id="description-work" placeholder="Введите описание"></textarea>
                    </div>
                    <label class="label">Результат</label>
                    <div class="add-works__form-item mt-10 mb-30">
                        <textarea class="textarea" name="result" id="resultwork" placeholder="Введите описание"></textarea>
                    </div>
                    <label class="label">Технологии</label>
                    <div class="add-works__form-item mt-10 mb-30">
                        <textarea class="textarea" name="technologes" id="techwork" placeholder="Введите описание"></textarea></div>
                    <div class="row ml-0 mr-0">
                        <div class="col-3 no-paddings mr-30">
                            <label class="label" for="field-link-project">Ссылка на проект</label>
                            <input class="input" name="linkproject" id="field-link-project" type="url" placeholder="Введите ссылку" />
                        </div>
                        <div class="col-3 no-paddings">
                            <label class="label" for="link-on-github">Ссылка на GitHub</label>
                            <input class="input" name="github" id="link-on-github" type="url" placeholder="Введите ссылку" />
                        </div>
                    </div>
                    <div class="row ml-0 mr-0 mt-30">
                        <input class="button button-save mr-20" type="submit" name="savework" value="Сохранить" />
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