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
                            <?php if($currentUser->avatar != ''): ?>
                                <img src="<?=HOST?>usercontent/avatar/<?=$currentUser->avatar?>" alt="<?=$currentUser->name?> <?=$currentUser->lastname?>"/>
                            <?php endif ?>
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
                <h2 class="title-2 title-2--color mt-0 mb-25">Комментарии пользователя</h2>
                <div class="user-profile-comments">
                    <div class="user-comment">
                        <div class="user-comment-profile"><a class="mr-20" href="#!" target="_blank"><span class="user-comment__article-title">Поездка в LA</span></a><span class="user-comment__date"><i class="far fa-clock icon--mr"></i>05 Мая 2017 года в 15:45</span>
                            <div class="user-comment__text-profile">
                                <p>Замечательный парк, обязательно отправлюсь туда этим летом. </p>
                            </div>
                        </div>
                    </div>
                    <div class="user-comment">
                        <div class="user-comment-profile"><a class="mr-20" href="#!" target="_blank"><span class="user-comment__article-title">Ноутбук для веб-разработчика</span></a><span class="user-comment__date"><i class="far fa-clock icon--mr"></i>15 Мая 2017 года в 10:02</span>
                            <div class="user-comment__text-profile">
                                <p>Замечательный парк, обязательно отправлюсь туда этим летом. </p>
                            </div>
                        </div>
                    </div>
                    <div class="user-comment">
                        <div class="user-comment-profile"><a class="mr-20" href="#!" target="_blank"><span class="user-comment__article-title">Настройка Sublime</span></a><span class="user-comment__date"><i class="far fa-clock icon--mr"></i>12 Мая 2017 года в 20:39</span>
                            <div class="user-comment__text-profile">
                                <p>Замечательный парк, обязательно отправлюсь туда этим летом. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>