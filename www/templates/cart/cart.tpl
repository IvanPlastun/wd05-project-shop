<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <h1 class="title-general mb-20 mt-0">Корзина</h1>
            <?php if(count(@$cartGoods) > 0 && count($cookieCartArray) > 0) { ?>
                <table class="table cart-table">
                    <thead>
                        <tr class="table-total">
                            <td></td>
                            <td>Наименование</td>
                            <td>Количество</td>
                            <td width="200">Стоимость за единицу</td>
                            <td width="200">Общая стоимость</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr class="table-total">
                            <td>Итого:</td>
                            <td></td>
                            <td><?=$cartGoodsCount?> <?=endOfOrders($cartGoodsCount)?></td>
                            <td></td>
                            <td><?=price_format($cartGoodsTotalPrice)?> рублей</td>
                            <td></td>
                        </tr>
                    </tfoot>
                    <tbody>
                        <?php foreach($cartGoods as $item) { 
                            include(ROOT . 'templates/cart/_cart-item-in-table.tpl');
                        } ?>
                    </tbody>
                </table>
                <a class="button button-save button--small-save" href="<?=HOST?>order-create">Оформить заказ</a>
            <?php } else { ?>
                <div class="highlight">
                    <div class="title-2">Корзина Пуста</div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>