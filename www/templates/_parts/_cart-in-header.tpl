<?php if(isset($_COOKIE['cart'])) { ?>
    <?php $itemsInCart = array_sum(json_decode($_COOKIE['cart'], true));?>
    <?php if($itemsInCart > 0) { ?>
        <div class="cart">
            <a href="<?=HOST?>cart"><i class="fas fa-shopping-cart"></i>
                <?=$itemsInCart?> <?=endOfOrders($itemsInCart)?>
            </a>
        </div>
    <?php } ?>
<?php } ?>