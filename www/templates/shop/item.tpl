<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <div class="post-head mb-20">
                <h1 class="title-general mb-0 mt-0">Страница товара</h1>
                <?php if(isAdmin()) { ?>
                    <div class="post-head-buttons">
                        <a class="button button-edit mr-20" href="<?=HOST?>shop/item-edit?id=<?=$item['id']?>">Редактировать</a>
                        <a class="button button-delete" href="<?=HOST?>shop/item-delete?id=<?=$item['id']?>">Удалить</a>
                    </div>
                <?php } ?>
            </div>

            <div class="row">
                <?php if($item['img'] != '' && $item['img_small'] != '' && file_exists(ROOT . 'usercontent/shop/' . $item['img']) && file_exists(ROOT . 'usercontent/shop/' . $item['img_small'])) { ?>
                    <div class="col-6">
                        <div class="post-img mb-0">
                            <img src="<?=HOST?>usercontent/shop/<?=$item['img']?>" alt="<?=$item['title']?>"/>
                        </div>
                    </div>
                <?php }?>

                <div class="col-6 pt-25">
                    <div class="title-general mb-0 mt-0"><?=$item['title']?></div>
                    <div class="price-holder">
                        <?php if($item['price_old']): ?>
                            <div class="price-old"><?=price_format($item['price_old'])?></div>
                        <?php endif ?>
                        <div class="price"><?=price_format($item['price'])?> <span>рублей</span></div>
                    </div>

                    <!--Здесь будет кнопка добавить в корзину-->
                    <form method="POST" class="mb-10" id="addToCart" action="<?=HOST?>addToCart">
                        <input type="hidden" name="itemId" id="itemId" value="<?=$item['id']?>">
                        <input name="addToCart" class="button button--small-primary" type="submit" value="В корзину">
                    </form>
                    <div class="post-content"><?=$item['description']?></div>
                </div>

            </div>
        </div>
    </div>
</div>