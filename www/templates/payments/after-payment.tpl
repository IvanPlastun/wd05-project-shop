<div class="container pt-80 pb-120">
    <h1 class="general-title mb-20 mt-0 text-success">Оплата совершена!</h1>
    <?php if(isLoggedIn()) { ?>
        <p>Благодарим за оплату заказа. Проследите за статусом оплаты заказа на странице с <a href="<?=HOST?>myorders">заказами</a>.</p>
    <?php } else {  ?>
        <p>Благодарим за оплату заказа. Сообщение о поступлении оплаты придем вам на Email. Мы свяжемся с вами.</p>
    <?php } ?>
</div>