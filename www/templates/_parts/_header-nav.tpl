<nav class="nav">
    <a class="nav__link <?=$uri[0] == '' ? 'nav__link--active' : '';?>" href="<?=HOST?>">Главная</a>
    <a class="nav__link <?=$uri[0] == 'about' ? 'nav__link--active' : '';?>" href="<?=HOST?>about">Обо мне</a>
    <a class="nav__link <?=$uri[0] == 'portfolio' ? 'nav__link--active' : '';?>" href="<?=HOST?>portfolio">Работы</a>
    <a class="nav__link <?=$uri[0] == 'blog' ? 'nav__link--active' : '';?>" href="<?=HOST?>blog">Блог</a>
    <a class="nav__link <?=$uri[0] == 'contacts' ? 'nav__link--active' : '';?>" href="<?=HOST?>contacts">Контакты</a>
</nav>