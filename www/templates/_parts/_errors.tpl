<?php
    foreach($errors as $error) { ?>
        <?php if(count($error) == 1) { ?>
            <div class="notification">
                <div class="notification__title notification--error"><?=$error['title']?></div>
            </div>
        <?php } else if(count($error) == 2) { ?>
            <div class="notification">
                <div class="notification__title notification--error notification--with-description"><?=$error['title']?></div>
                <div class="notification__description"><?=$error['description']?></div>
            </div>
        <?php } ?>
<?php } ?>