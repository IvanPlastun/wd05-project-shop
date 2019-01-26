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
                <div class="card-box">
                    <div class="card-box__img-blog">
                        <?php if($post->post_img_small != '') { ?>
                            <img src="<?=HOST?>usercontent/blog/<?=$post['post_img_small']?>" alt="<?=$post['title']?>" />
                        <?php } else { ?>
                            <img src="<?=HOST?>usercontent/no-image.jpg?>" alt="<?=$post['title']?>" />
                        <?php } ?>
                    </div>
                    <div class="card-box__title"><?=mbCutString($post['title'], 49)?></div>
                    <a class="button card-box--button" href="<?=HOST?>blog/post?id=<?=$post['id']?>">Читать</a>
                </div>
            </div>
        <?php } ?>
    </div>
</div>