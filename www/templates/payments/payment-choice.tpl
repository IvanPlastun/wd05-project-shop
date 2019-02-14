<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <h1 class="general-title mb-20 mt-0">Оплата заказа</h1>
            <div class="highlight">
                <p><strong>Номер заказа:</strong>
                    <?=$order['id']?>
                </p>
                <p><strong>Сумма заказа:</strong>
                    <?=price_format($order['total_price'])?> рублей
                </p>
            </div>
            <div class="title-2 mb-20 mt-30">Выберите способ оплаты</div>
            <div class="card mb-30 user-content">
                <div class="card__title">Система Яндекс.Деньги</div>
                <p>Для оплаты с помощью:</p>
                <ul>
                    <li>Карт Visa, MasterCard, Мир</li>
                    <li>или с кошелька Яндекс деньги</li>
                </ul>
                <a href="<?=HOST?>payment-yandex" class="link card__select">Выбрать</a>
            </div>
        </div>
    </div>
</div>