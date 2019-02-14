<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <h2 class="title-2 mb-20 mt-0">Состав заказа</h2>
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
            <h1 class="title-general mb-20 mt-0">Оформить заказ</h1>
            <?php include(ROOT . 'templates/_parts/_errors.tpl');?>
            <form method="POST" action="<?=HOST?>order-create">
                <div class="row mb-20">
                    <div class="col-6">
                        <label class="label" for="userName">Имя</label>
                        <?php if(isset($_SESSION['logged_user']['name'])) { ?>
                            <input class="input" name="firstname" id="userName" type="text" placeholder="Введите имя" value="<?=$_SESSION['logged_user']['name']?>"/>
                        <?php } else { ?>
                            <input class="input" name="firstname" id="userName" type="text" placeholder="Введите имя"/>
                        <?php } ?>
                    </div>
                    <div class="col-6">
                        <label class="label" for="userLastName">Фамилия</label>
                        <?php if(isset($_SESSION['logged_user']['lastname'])) { ?>
                            <input class="input" name="lastname" id="userLastName" type="text" placeholder="Введите фамилию" value="<?=$_SESSION['logged_user']['lastname']?>"/>
                        <?php } else { ?>
                            <input class="input" name="lastname" id="userLastName" type="text" placeholder="Введите фамилию"/>
                        <?php } ?>
                    </div>
                </div>

                <div class="row mb-20">
                    <div class="col-6">
                        <label class="label" for="userEmail">Email</label>
                        <?php if(isset($_SESSION['logged_user']['email'])) { ?>
                            <input class="input" name="email" id="userEmail" type="text" placeholder="Введите email" value="<?=$_SESSION['logged_user']['email']?>"/>
                        <?php } else { ?>
                            <input class="input" name="email" id="userEmail" type="text" placeholder="Введите email"/>
                        <?php } ?>
                    </div>
                    <div class="col-6">
                        <label class="label" for="userPhone">Телефон</label>
                        <input class="input" name="phone" id="userPhone" type="text" placeholder="Введите телефон"/>
                    </div>
                </div>
                <label class="label" for="address">Адрес доставки</label>
                <input class="input" name="address" id="address" type="text" placeholder="Введите адрес"/>
                <input type="submit" name="createOrder" class="button button-save button--small-save mt-20" value="Оформить заказ">
            </form>
        </div>
    </div>
</div>