<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <div class="post">
                <?php
                    if(isset($_GET['result'])) {
                        include(ROOT . 'templates/blog/_results.tpl');
                    }
                ?>
                <div class="post-head">
                    <h1 class="title-general mb-0 mt-0"><?=$post['title']?></h1>
                    <?php if(isAdmin()) { ?>
                        <div class="post-head-buttons">
                            <a class="button button-edit mr-20" href="<?=HOST?>blog/post-edit?id=<?=$post['id']?>">Редактировать</a>
                            <a class="button button-delete" href="<?=HOST?>blog/post-delete?id=<?=$post['id']?>">Удалить</a>
                        </div>
                    <?php } ?>
                </div>
                <div class="post-info">
                    <div class="post-info__author"><?=$post['name']?> <?=$post['lastname']?></div>
                    <?php if($post['category_name'] != ''): ?>
                        <div class="post-info__topic"><span><?=$post['category_name']?></span></div>
                    <?php endif ?>
                    <div class="post-info__date">
                        <?php if(isset($post['update_time']) || isset($_GET['result']))
                            echo rus_date('j F Y H:i', strtotime($post['update_time']));
                        else 
                            echo rus_date('j F Y H:i', strtotime($post['data_time']));
                        ?>
                    </div>
                    <?php if(count($comments) > 0) { ?>
                        <div class="post-info__comments">
                            <a class="postlink" href="#comments-users"><?=commentNumber(count($comments))?></a>
                        </div>
                    <?php } ?>
                </div>
                <?php if($post['post_img'] != '' && $post['post_img_small'] != '' && file_exists(ROOT . 'usercontent/blog/' . $post['post_img']) && file_exists(ROOT . 'usercontent/blog/' . $post['post_img_small'])) { ?>
                    <div class="post-img">
                        <img src="<?=HOST?>usercontent/blog/<?=$post['post_img']?>" alt="Горы"/>
                    </div>
                <?php }?>
                <div class="post-content mb-25"><?=$post['text']?></div>
                <div class="post-buttons-nav mb-25"><a class="button button-previous" href="#">Назад <span class="button__icon button__icon--mright float-left"><i class="mr-0 fas fa-arrow-left"></i></span></a><a class="button button-next" href="#">Вперед <span class="button__icon"><i class="mr-0 fas fa-arrow-right"></i></span></a></div>
            </div>
            <?php include(ROOT . 'templates/blog/_comments.tpl');?>            
            <?php include(ROOT . 'templates/blog/_comments-form.tpl');?>
        </div>
    </div>
</div>