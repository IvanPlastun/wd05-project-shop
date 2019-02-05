<?php if(count($comments) > 0) { ?>
    <div id="comments-users" class="user-comments-wrapper mb-25">
        <div class="title-2"><?=commentNumber(count($comments))?></div>
        <?php foreach($comments as $comment) { ?>
            <div class="user-comment">
                <div class="user-comment__avatar">
                        <div class="avatar avatar--small">
                        <?php if($comment['avatar_small'] != '' && file_exists(ROOT . 'usercontent/avatar/' . $comment['avatar_small'])) { ?>
                            <img src="<?=HOST?>usercontent/avatar/<?=$comment['avatar_small']?>" alt="<?=$comment['name']?> <?=$comment['lastname']?>"/>
                        <?php } else { ?>
                            <img src="<?=HOST?>templates/assets/img/avatars/user.png?>" alt="<?=$comment['name']?> <?=$comment['lastname']?>"/>
                        <?php } ?>
                        </div>
                </div>
                <div class="user-comment-info-wrapper">
                    <span class="user-comment__name"><?=$comment['name']?> <?=$comment['lastname']?></span>
                    <span class="user-comment__date"><i class="far fa-clock"></i><?=rus_date('j F Y H:i', strtotime($comment['date_time']))?></span>
                    <div class="user-comment__text">
                        <p><?=$comment['text']?></p>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
<?php } ?>