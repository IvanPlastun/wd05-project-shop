<div class="message-user mb-20"><a class="button button-delete button--small-delete float-right" href="<?=HOST?>about-edit-jobs?id=<?=$job['id']?>&jobDeleted">Удалить</a>
    <div class="message-user__date mb-20"><?=$job['period']?></div>
    <div class="message-user-info">
        <h4 class="title-4 mt-0 mb-0"><?=$job['title']?></h4>
    </div>
    <p class="about-me-job__text"><?=$job['description']?></p>
</div>