<div class="sticky-footer-content">
    <div class="container content--padding">
        <div class="row">
            <div class="col-10 offset-1">
                <div class="user-profile-block">
                    <h1 class="title-general mt-0 mb-0">Профиль</h1>
                    <div class="user-profile__button"><a class="button button-edit" href="<?=HOST?>profile-edit">Редактировать</a></div>
                </div>
                <div class="user-profile-information mb-35 mt-40">
                    <div class="user-profile__avatar">
                        <div class="avatar">
                            <?php if($currentUser->avatar != '' && file_exists(ROOT . 'usercontent/avatar/' . $_SESSION['logged_user']['avatar'])) { ?>
                                <img src="<?=HOST?>usercontent/avatar/<?=$currentUser->avatar?>" alt="<?=$currentUser->name?> <?=$currentUser->lastname?>"/>
                            <?php } else { ?>
                                <img src="<?=HOST?>templates/assets/img/avatars/user.png" alt="<?=$currentUser->name?> <?=$currentUser->lastname?>"/>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="user-profile__description">
                        <span>Имя и фамилия</span>
                        <p><?=$currentUser->name?> <?=$currentUser->lastname?></p>
                        <span>Email</span>
                        <p><?=$currentUser->email?></p>
                        <span>Страна, Город</span>
                        <?php if($currentUser->country != '' && $currentUser->city != ''): ?>
                            <p><?=$currentUser->country?>, <?=$currentUser->city?></p>
                        <?php endif ?>
                    </div>
                </div>
                <?php if(count($comments) > 0): ?>
                    <h2 class="title-2 title-2--color mt-0 mb-25">Комментарии пользователя</h2>
                    <div class="user-profile-comments">
                        <?php foreach($comments as $comment): ?>
                            <?php include(ROOT . 'templates/profile/_comment-user-card.tpl');?>
                        <?php endforeach ?>
                    </div>
                <?php endif ?>
            </div>
        </div>
    </div>
</div>