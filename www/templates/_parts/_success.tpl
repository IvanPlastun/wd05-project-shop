<?php
    foreach($success as $ok) { ?>
        <?php if(count($ok) == 1) { ?>
            <div class="notification">
                <div class="notification__title notification--success mb-10"><?=$ok['title']?></div>
            </div>
        <?php } else if(count($ok) == 2) { ?>
            <div class="notification">
                <div class="notification__title notification--success notification--with-description"><?=$ok['title']?></div>
                <div class="notification__description"><?=$ok['description']?></div>
            </div>
        <?php } ?>
<?php } ?>