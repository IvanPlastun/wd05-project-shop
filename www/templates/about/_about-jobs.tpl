<div class="sectoin-workflow pt-80 pb-120">
    <div class="container">
        <div class="row">
            <div class="offset-md-3 col-md-9 experience-work mb-25">
                <h2 class="title-general mt-0 mb-0">Опыт работы</h2>
                <?php if(isAdmin()): ?>
                    <a class="button button-edit" href="<?=HOST?>about-edit-jobs">Редактировать</a>
                <?php endif ?>
            </div>
        </div>
        <div class="row">
            <div class="offset-md-3 col-md-9">
                <?php foreach($jobs as $job)
                    include(ROOT . 'templates/about/_card-job.tpl');
                ?>
            </div>
        </div>
    </div>
</div>