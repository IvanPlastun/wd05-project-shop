<?php if($_GET['result'] == 'itemCreated') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Товар успешно добавлен!</div>
    </div>
<?php } else if($_GET['result'] == 'itemUpdated') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Товар успешно отредактирован!</div>
    </div>
<?php } else if($_GET['result'] == 'itemDeleted') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Товар успешно удален!</div>
    </div>
<?php } ?>