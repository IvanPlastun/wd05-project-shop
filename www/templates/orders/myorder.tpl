<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <h2 class="title-2 mb-20 mt-0">Состав заказа № <?=$order['id']?></h2>
            <table class="table table-hover">
                <thead>
                    <tr class="table-total">
                        <td>Наименование</td>
                        <td>Количество</td>
                        <td width="200">Стоимость</td>
                    </tr>
                </thead>
                <tfoot>
                    <tr class="table-total">
                        <td></td>
                        <td scope="row"><strong><?=$order['items_count']?> <?php endOfOrders($order['items_count'])?></strong></td>
                        <td><strong><?=price_format($order['total_price'])?> рублей</strong></td>
                    </tr>
                </tfoot>
                <tbody>
                    <?php foreach($orderItems as $item) { 
                        include(ROOT . 'templates/orders/_item-in-order-table-history.tpl');
                    } ?>
                </tbody>
            </table>
            <a class="button button-previous" href="<?=HOST?>myorders">Назад к моим заказам <span class="button__icon button__icon--mright float-left"><i class="mr-0 fas fa-arrow-left"></i></span></a>
        </div>
    </div>
</div>