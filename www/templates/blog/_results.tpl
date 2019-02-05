<?php if($_GET['result'] == 'postDeleted') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Пост успешно удален!</div>
    </div>
<?php } else if($_GET['result'] == 'postCreated') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Пост успешно добавлен!</div>
    </div>
<?php } else if($_GET['result'] == 'postUpdated') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Пост успешно отредактирован!</div>
    </div>
<?php } ?>