<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-12">
            <h2 class="title-2 mb-20 mt-0">Заказы в системе</h2>
            <table class="table">
                <tbody>
                    <?php foreach($orders as $order)
                        include(ROOT . 'templates/orders/_order-in-list.tpl');
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>