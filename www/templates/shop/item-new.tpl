<div class="container pl-0 pr-0 pt-80 pb-120">
    <div class="row m-0">
        <div class="col-10 offset-1 p-0">
            <div class="add-post-content">
                <h1 class="title-general mt-0 mb-0">Добавить товар</h1>
                <?php include(ROOT . 'templates/_parts/_errors.tpl');?>
                <form method="POST" enctype="multipart/form-data" action="<?=HOST?>shop/new">
                    <div class="add-post-content__name mt-40 mb-20">
                        <label class="label" for="product-title">Название товара</label>
                        <input class="input" name="itemTitle" id="product-title" type="text" placeholder="Введите название товара" />
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-6">
                            <label class="label" for="price-field">Цена</label>
                            <input class="input" name="price" id="price-field" type="text" placeholder="Введите цену"/>
                        </div>
                        <div class="col-6">
                            <label class="label" for="price-old-field">Старая цена</label>
                            <input class="input" name="priceOld" id="price-old-field" type="text" placeholder="Введите цену"/>
                        </div>
                    </div>
                    <div class="add-post-content__img mt-30">
                        <section class="upload-file">
                            <h6 class="upload-file__title">Изображение</h6>
                            <p class="upload-file__description">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 10Мб.</p>
                            <input class="input-file" type="file" name="itemImg" id="upload-file" data-multiple-caption="{count}" />
                            <label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
                        </section>
                    </div>
                    <p class="label mb-10 mt-30">Описание товара</p>
                    <div class="add-post-content__main">
                        <textarea class="textarea" name="itemDesc" id="descriptionProduct"></textarea>
                    </div>
                    <div class="add-post-content__submit mt-30">
                        <input class="button button-save mr-20" type="submit" name="itemNew" value="Сохранить" />
                        <a class="button" href="<?=HOST?>shop">Отмена</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        CKEDITOR.replace('descriptionProduct');
    });
</script>