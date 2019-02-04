    <div class="separate-work-header-bg">
        <div class="logo ml-50 mb-120">
            <div class="logo__wrapper">
                <div class="logo__img logo__img--dark mr-15"><i class="far fa-paper-plane mr-0"></i></div>
                <div class="logo__title logo__title--dark">Digital Lifestyle</div>
            </div>
            <div class="logo__description logo__description--dark ml-50">Сайт IT специалиста</div>
        </div>
        <div class="container mb-50">
            <div class="separate-work-head">
                <div class="row no-gutters justify-content-between">
                    <div class="col-8 offset-1">
                        <h1 class="title-general separate-work-title--size"><?=$work['title']?></h1>
                    </div>
                    <div class="col-2">
                        <div class="separate-work-head__button-edit">
                            <?php if(isAdmin()): ?>
                                <a class="button button-edit" href="<?=HOST?>portfolio-edit?id=<?=$work['id']?>">Редактировать</a>
                            <?php endif ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="separate-work-info mt-10">
                <div class="row">
                    <div class="col-8 offset-1">
                        <span class="separate-work-info__author mr-20"><?=$work['name']?> <?=$work['lastname']?></span>
                        <a class="separate-work-info__category mr-20" href="<?=HOST?>portfolio">Работы</a>
                        <span class="separate-work-info__date">
                            <?php if(isset($work['date_edit']) || isset($_GET['result'])) {
                                echo rus_date('j F Y H:i', strtotime($work['date_edit']));
                            } else {
                                echo rus_date('j F Y', strtotime($work['date']));
                            } ?>
                        </span>
                    </div>
                </div>
            </div>
            <?php if(isset($_GET['result'])) { ?>
                <div class="row">
                    <div class="col-10 offset-1">
                        <?php include(ROOT . 'templates/portfolio/_result.tpl'); ?>
                    </div>
                </div>
            <?php } ?>
            <?php if($work['imagework'] != '' && file_exists(ROOT . "usercontent/portfolio/" . $work['imagework'])) { ?>
                <div class="separate-work-image mt-55">
                    <div class="row">
                        <div class="col-10 offset-1">
                            <div class="separate-work-image-preview">
                                <img src="<?=HOST?>usercontent/portfolio/<?=$work['imagework']?>" alt="<?=$work['title']?>" />
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
        <div class="container">
            <div class="separate-work-description-wrapper">
                <div class="row">
                    <div class="col-5 offset-1">
                        <div class="separate-work-description"><?=$work['description']?></div>
                        <div class="separate-work-result"><?=$work['result']?></div>
                    </div>
                    <div class="col-5">
                        <div class="separate-work-technologies mb-25"><?=$work['technologes']?></div>
                        <div class="separate-work-link-project mb-35">
                            <h3 class="title-3 mb-20 mt-25 strong">Ссылка на проект</h3>
                            <a class="separate-work-link-project__link" href="<?=$work['linkproject']?>" target="_blank"><?=$work['linkproject']?></a>
                        </div>
                        <div class="separate-work-link-github">
                            <h3 class="title-3 title-3 mb-20 mt-0 strong">Код на github</h3>
                            <a class="separate-work-link-github__link" href="<?=$work['github']?>" target="_blank"><?=$work['github']?></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="separate-work-pagination-wrapper mt-45">
                <div class="row">
                    <div class="col-10 offset-1">
                        <div class="separate-work-pagination">
                            <a class="button button-previous button-work-pagination-prev" href="<?=HOST?>portfolio">Все работы <span class="button__icon button__icon--mright float-left"><i class="mr-0 fas fa-arrow-left"></i></span></a>
                            <a class="button button-next button-work-pagination-next" href="#">Следующая работа <span class="button__icon"><i class="mr-0 fas fa-arrow-right"></i></span></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>