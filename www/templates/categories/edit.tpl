<div class="container pl-0 pr-0 pt-80 pb-120">
    <div class="row m-0">
        <div class="col-10 offset-1 p-0">
            <div class="add-post-content">
                <h1 class="title-general mt-0 mb-10">Редактировать категорию</h1>
                <?php require(ROOT . 'templates/_parts/_errors.tpl');?>
                <form method="POST" action="<?=HOST?>blog/category-edit?id=<?=$category['id']?>">
                    <div class="add-post-content__name mt-40">
                        <label class="label" for="inputCategory">Название категории</label>
                        <input class="input" name="categoryName" id="inputCategory" type="text" placeholder="Введите название категории" value="<?=$category['category_name']?>"/>
                    </div>
                    <div class="add-post-content__submit mt-30">
                        <input class="button button-save mr-20" type="submit" name="cat-edit" value="Сохранить"/>
                        <a class="button" href="<?=HOST?>blog/categories">Отмена</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>