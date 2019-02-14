<div class="card-box">
    <div class="card-box__img-blog item-center">
        <?php if($item->img_small != '' && file_exists(ROOT . 'usercontent/shop/' . $item->img_small)) { ?>
            <img src="<?=HOST?>usercontent/shop/<?=$item['img_small']?>" alt="<?=$item['title']?>" />
        <?php } else { ?>
            <img src="<?=HOST?>usercontent/no-image.jpg?>" alt="<?=$item['title']?>" />
        <?php } ?>
    </div>
    <div class="card-box__title"><?=mbCutString($item->title, 40)?></div>
    <div class="card-box-holder">
        <div class="card-box-holder__price"><?=price_format($item->price)?> <span>рублей</span></div>
        <a class="button card-box--button" href="<?=HOST?>shop/item?id=<?=$item['id']?>">Смотреть</a>
    </div>
</div>