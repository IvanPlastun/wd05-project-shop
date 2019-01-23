<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <div class="post">
                <div class="post-head">
                    <h1 class="title-general mb-0 mt-0 title--width"><?=$post['title']?></h1><a class="button button-edit post-head--position" href="#">Редактировать</a>
                </div>
                <div class="post-info">
                    <div class="post-info__author">Емельян Казаков</div>
                    <div class="post-info__topic"><a class="postlink" href="#">Путешествия</a></div>
                    <div class="post-info__date"><?=rus_date('j F Y H:i', strtotime($post['data_time']))?></div>
                    <div class="post-info__comments"><a class="postlink" href="#">2 комментария</a></div>
                </div>
                <?php if($post['post_img'] != '' && $post['post_img_small'] != '') { ?>
                    <div class="post-img">
                        <img src="<?=HOST?>usercontent/blog/<?=$post['post_img']?>" alt="Горы"/>
                    </div>
                <?php }?>
                <div class="post-content mb-25"><?=$post['text']?></div>
                <div class="post-buttons-nav mb-25"><a class="button button-previous" href="#">Назад <span class="button__icon button__icon--mright float-left"><i class="mr-0 fas fa-arrow-left"></i></span></a><a class="button button-next" href="#">Вперед <span class="button__icon"><i class="mr-0 fas fa-arrow-right"></i></span></a></div>
            </div>
            <div class="user-comments-wrapper mb-25">
                <div class="title-2">2 комментария</div>
                <div class="user-comment">
                    <div class="user-comment__avatar">
                        <div class="avatar avatar--small"><img src="../img/avatars/avatar-2.jpg" alt="Джон До собственной персоной" /></div>
                    </div>
                    <div class="user-comment-info-wrapper"><span class="user-comment__name">Джон До</span><span class="user-comment__date"><i class="far fa-clock"></i>01 декабря 2018 года в 15:37</span>
                        <div class="user-comment__text">
                            <p>Замечательный парк, обязательно отправлюсь туда этим летом. </p>
                        </div>
                    </div>
                </div>
                <div class="user-comment">
                    <div class="user-comment__avatar">
                        <div class="avatar avatar--small"><img src="../img/avatars/avatar-3.jpg" alt="Джейн До собственной персоной" /></div>
                    </div>
                    <div class="user-comment-info-wrapper"><span class="user-comment__name">Джейн До</span><span class="user-comment__date"><i class="far fa-clock"></i>02 декабря 2018 года в 19:47</span>
                        <div class="user-comment__text">
                            <p>Согласна, парк просто потрясающий! Была там в прошлом году и нисколько не пожалела. Обязательно вернусь туда снова в следующем году.</p>
                        </div>
                    </div>
                </div>
            </div>
            <h2 class="title-2 m-0 mb-15">Оставить комментарий</h2>
            <div class="comments-submit">
                <div class="avatar avatar--small"><img src="../img/avatars/avatar.jpg" alt="alt text avatar" /></div>
                <div class="comments-form"><b class="comments__author">Юрий Ключевский</b>
                    <div class="notification">
                        <div class="notification__title notification--error">Комментарий не может быть пустым</div>
                    </div><textarea class="textarea" name="comment-user" placeholder="Присоединиться к обсуждению..."></textarea><input class="button mt-10" type="submit" name="infoButton" value="Опубликовать" />
                </div>
            </div>
        </div>
    </div>
</div>