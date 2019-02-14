<div class="user-block col-auto pl-0 pr-0 mr-40">
    <div class="user-block__wrapper">
        <div class="row user-group">
            <div class="avatar avatar--small">
                <?php if($_SESSION['logged_user']['avatar_small'] != '' && file_exists(ROOT . 'usercontent/avatar/' . $_SESSION['logged_user']['avatar_small'])) { ?>
                    <img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_small']?>" alt="<?=$_SESSION['logged_user']['name']?> <?=$_SESSION['logged_user']['lastname']?>" />
                <?php } else { ?>
                    <img src="<?=HOST?>templates/assets/img/avatars/user.png" alt="<?=$_SESSION['logged_user']['name']?> <?=$_SESSION['logged_user']['lastname']?>"/>
                <?php }?>
            </div>
            <div class="user-name">
                <span><?=$_SESSION['logged_user']['name']?> <?=$_SESSION['logged_user']['lastname']?></span>
                <p>Пользователь</p>
                <div class="row user-buttons">
                    <a class="button button-profile" href="<?=HOST?>profile">Профиль</a>
                    <a class="button button-profile" href="<?=HOST?>myorders">Заказы</a>
                    <a class="button button-profile" href="<?=HOST?>logout">Выход</a>
                </div>
            </div>
        </div>
    </div>
</div>
