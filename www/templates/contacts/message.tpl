<div class="sticky-footer-content">
    <div class="container content--padding">
        <div class="row">
            <div class="col-10 offset-1">
                <h1 class="title-general contacts-messages-title--color mt-0 mb-0">Сообщения от посетителей</h1>
                <?php if(count($messages) > 0) { ?>
                    <?php foreach($messages as $message)
                        include(ROOT . 'templates/contacts/_card-message.tpl');
                    ?>
                <?php } else { ?>
                    <p>У вас пока нет новых сообщений.</p>
                <?php } ?>
            </div>
        </div>
    </div>
</div>