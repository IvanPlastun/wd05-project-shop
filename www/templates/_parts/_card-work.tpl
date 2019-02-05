<div class="card-box card-box--height">
    <div class="card-box__img-portfolio">
        <?php if($work['imagework_small'] != '' && file_exists(ROOT . 'usercontent/portfolio/' . $work['imagework_small'])) { ?>
            <img src="<?=HOST?>usercontent/portfolio/<?=$work['imagework_small']?>"/>
        <?php } else { ?>
            <img src="<?=HOST?>usercontent/no-img.jpg?>" alt="<?=$work['title']?>" />
        <?php } ?>
    </div>
    <div class="card-box__title"><?=mbCutString($work['title'], 20)?></div>
    <a class="button card-box--button" href="<?=HOST?>portfolio-single-work?id=<?=$work['id']?>">Смотреть кейс</a>
</div>