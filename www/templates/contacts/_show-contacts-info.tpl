<?php function showContactInfo($title, $nameParameter, $type = 'text') { 
    global $contacts; ?>
    <div class="row mb-15">
        <div class="col-6 contacts-category">
            <p><?=$title?></p>
        </div>
        <?php if($type == 'text') { ?>
            <div class="col-6 info">
                <p><?=$contacts[$nameParameter]?></p>
            </div>
        <?php } else if($type == 'link') { ?>
            <div class="col-6 link-box-info">
                <?php if($nameParameter == 'email') { ?>
                    <p><a class="link" href="mailto:<?=$contacts[$nameParameter]?>" target="_blank"><?=$contacts[$nameParameter]?></a></p>
                <?php } else if($nameParameter == 'skype' && $contacts[$nameParameter] != '') { ?>
                    <p><a class="link" href="skype:<?=$contacts[$nameParameter]?>?chat" target="_blank"><?=$contacts[$nameParameter]?></a></p>
                <?php } else if($nameParameter == 'github' && $contacts[$nameParameter] != '') {  ?>
                    <p><a class="link" href="<?=$contacts[$nameParameter]?>" target="_blank"><?=$contacts[$nameParameter]?></a></p>
                <?php } ?>
            </div>
        <?php } else if($type == 'social') { ?>
            <div class="col-6 link-box-info">
                <?php if(is_array($nameParameter)) { ?>
                    <?php foreach($nameParameter as $socialNet) { ?>
                        <?php if($contacts[$socialNet] != '') { ?>
                            <?php if($socialNet == 'vkontakte') { ?>
                                <p><a class="link link--bold" href="<?=$contacts[$socialNet]?>" target="_blank">Профиль Вконтакте</a></p>
                            <?php } else if($socialNet == 'facebook') {  ?>
                                <p><a class="link link--bold" href="<?=$contacts[$socialNet]?>" target="_blank">Профиль Facebook</a></p>
                            <?php } else if($socialNet == 'twitter') { ?>
                                <p><a class="link link--bold" href="<?=$contacts[$socialNet]?>" target="_blank">Профиль Twitter</a></p>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>
                <?php } ?>
            </div>
        <?php } ?>
    </div>
<?php } ?>
<?php $socialNetworks = array('vkontakte', 'facebook', 'twitter');?>