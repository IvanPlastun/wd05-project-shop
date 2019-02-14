<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <h2 class="title-2 mb-20 mt-0">Мои заказы</h2>
            <table class="table">
                <tbody>
                    <?php foreach($myOrders as $order)
                        include(ROOT . 'templates/orders/_myorder-item-in-table.tpl');
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>