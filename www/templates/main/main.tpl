<div class="main-wrapper">
    <div class="about-me container section">
        <div class="wrapper-space-around">
            <div class="about-me__avatar col-md-3">
                <?php if($about['photo'] != '' && file_exists(ROOT . 'usercontent/about/' . $about['photo'])): ?>
                    <div class="avatar"><img src="<?=HOST?>usercontent/about/<?=$about['photo']?>" alt="<?=$about['firstname']?> <?=$about['lastname']?>"/></div>
                <?php endif ?>
            </div>
            <div class="about-me__description col-md-9">
                <h3 class="title-1 title-1--blue title-1--weight"><?=$about['firstname']?> <?=$about['lastname']?></h3>
                <?=$about['aboutinfo']?>
                <div class="about-me__button"><a class="button" href="<?=HOST?>about">Подробнее</a></div>
            </div>
        </div>
    </div>
    <div class="line"></div>
    <div class="new-works container section">
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-2 title-1--weight mb-30">Новые <a href="<?=HOST?>portfolio" class="link title-1--underline">работы</a></h2>
            </div>
        </div>
        <div class="row">
            <?php foreach($portfolio as $work) { ?>
                <div class="col-md-4">
                    <?php include(ROOT . 'templates/_parts/_card-work.tpl');?>
                </div>
            <?php } ?>
        </div>
    </div>
    <div class="blog-entries container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-2 title-1--weight"> Новые записи в <a href="<?=HOST?>blog" class="link title-1--underline">блоге</a></h2>
            </div>
        </div>
        <div class="row">
            <?php foreach($posts as $post) { ?>
                <div class="col-md-4">
                    <?php include(ROOT . 'templates/_parts/_card-post.tpl');?>
                </div>
            <?php } ?>
        </div>
    </div>
</div>