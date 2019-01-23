<?php if($_GET['result'] == 'catCreated') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Категория успешно добавлена!</div>
    </div>
<?php } else if($_GET['result'] == 'catUpdated') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Категория успешно отредактирована!</div>
    </div>
<?php } else if($_GET['result'] == 'catDeleted') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Категория успешно удалена!</div>
    </div>
<?php } ?>