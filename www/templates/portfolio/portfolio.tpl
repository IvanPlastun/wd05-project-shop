<div class="container pb-120 pt-80 pl-0 pr-0">
    <div class="works-title mb-35">
        <div class="works-title-left">
            <h1 class="works-title-text"><span class="works-title-text--bold">Работы</span>, которые сделал я и моя команда</h1>
        </div>
        <div class="works-title-right">
            <?php if(isAdmin()): ?>
                <a class="button button-edit" href="<?=HOST?>portfolio-new">Добавить работу</a>
            <?php endif ?>
        </div>
    </div>
    <div class="row ml-0 mr-0">
        <?php foreach($works as $work) { ?>
            <div class="col-auto pl-0 pr-0 work-box">
                <?php include(ROOT . 'templates/_parts/_card-work.tpl'); ?>
            </div>
        <?php } ?>

    </div>
</div>