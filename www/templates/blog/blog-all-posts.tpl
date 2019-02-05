<div class="container pb-120 pt-80 pl-0 pr-0">
    <?php
        if(isset($_GET['result'])) {
            include(ROOT . 'templates/blog/_results.tpl');
        }
    ?>
    <div class="blog-title mb-40">
        <h1 class="title-general mb-0 mt-0 blog-title--color">Блог веб-разработчика</h1>
        <?php if(isAdmin()) { ?>
            <a class="button button-edit" href="<?=HOST?>blog/post-new">Добавить пост</a>
        <?php } ?>
    </div>
    <div class="row ml-0 mr-0">
        <?php foreach($posts as $post) { ?>
            <div class="col-auto pl-0 pr-0 col--margin">
                <?php include(ROOT . 'templates/_parts/_card-post.tpl');?>
            </div>
        <?php } ?>
    </div>
    <div class="row ml-0 mr-0">
        <?php ($pagination['number_of_pages'] > 1) ? include(ROOT . 'templates/_parts/_pagination.tpl') : '';?>
    </div>
</div>