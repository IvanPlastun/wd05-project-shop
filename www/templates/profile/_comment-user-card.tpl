<div class="user-comment">
    <div class="user-comment-profile">
        <a class="mr-20" href="<?=HOST?>blog/post?id=<?=$comment['id']?>" target="_blank">
        <span class="user-comment__article-title"><?=$comment['title']?></span></a>
        <span class="user-comment__date"><i class="far fa-clock icon--mr"></i><?php echo rus_date('j F Y H:i', strtotime($comment['date_time']));?></span>
        <div class="user-comment__text-profile">
            <p><?=$comment['text']?></p>
        </div>
    </div>
</div>