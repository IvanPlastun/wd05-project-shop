<?php if(isset($_GET['result']) && $_GET['result'] == 'workUpdated') { ?>
    <div class="notification mt-10">
        <div class="notification__title notification--success" data-notify-hide>Работа успешено отредактирована!</div>
    </div>
<?php } elseif(isset($_GET['result']) && $_GET['result'] == 'workDeleted') { ?>
    <div class="notification mt-10">
        <div class="notification__title notification--success" data-notify-hide>Работа успешено удалена!</div>
    </div>
<?php } ?>