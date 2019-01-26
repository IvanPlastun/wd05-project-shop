<?php if(count($comments) > 0) { ?>
    <div id="comments-users" class="user-comments-wrapper mb-25">
        <div class="title-2"><?=commentNumber(count($comments))?></div>
        <?php foreach($comments as $comment) { ?>
            <div class="user-comment">
                <div class="user-comment__avatar">
                    <?php if($comment['avatar_small'] != '') { ?>
                        <div class="avatar avatar--small">
                            <img src="<?=HOST?>usercontent/avatar/<?=$comment['avatar_small']?>" alt="<?=$comment['name']?> <?=$comment['lastname']?>"/>
                        </div>
                    <?php } ?>
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