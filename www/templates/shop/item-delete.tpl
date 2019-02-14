<div class="container pl-0 pr-0 pt-80 pb-120">
    <div class="row m-0">
        <div class="col-10 offset-1 p-0">
            <div class="add-post-content">
                <h1 class="title-general mt-0 mb-10">Удалить Товар</h1>
                <p>Вы действительно хотите удалить товар <strong><?=$item['title']?></strong> с id = <?=$item['id']?>?</p>
                <form method="POST" action="<?=HOST?>shop/item-delete?id=<?=$item['id']?>">
                    <div class="add-post-content__submit mt-30">
                        <input class="button button-delete mr-20" type="submit" name="itemDelete" value="Удалить">
                        <a class="button" href="<?=HOST?>shop">Отмена</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>