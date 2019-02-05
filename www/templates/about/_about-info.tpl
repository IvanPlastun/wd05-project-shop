<div class="section-about-info mt-80 mb-65">
    <div class="container">
        <div class="row about-info">
            <div class="col-md-3">
                <div class="avatar">
                    <?php if($about['photo'] != '' && file_exists(ROOT . 'usercontent/about/' . $about['photo'])): ?>
                        <img src="<?=HOST?>usercontent/about/<?=$about['photo']?>" alt="<?=$about['firstname']?> <?=$about['lastname']?>"/>
                    <?php endif ?>
                </div>
            </div>
            <div class="col-md-9">
                <div class="about-info">
                    <?php if(isAdmin()): ?>
                        <a class="button button-edit float-right" href="<?=HOST?>about-edit">Редактировать</a>
                    <?php endif ?>
                    <h2 class="mb-15 about-info__name"><?=$about['firstname']?> <?=$about['lastname']?></h2>
                    <?=$about['aboutinfo']?>
                </div>
            </div>
        </div>
    </div>
</div>