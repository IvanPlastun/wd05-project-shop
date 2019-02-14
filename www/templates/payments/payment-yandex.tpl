<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <h1 class="general-title mb-20 mt-0">Оплата заказа через Яндекс.Деньги</h1>
            <form method="POST" action="https://money.yandex.ru/quickpay/confirm.xml">    
            <input type="hidden" name="receiver" value="<?=YANDEX_WALLET?>">    
            <input type="hidden" name="formcomment" value="Онлайн покупка: <?=SITE_NAME?>">   
            <input type="hidden" name="short-dest" value="Онлайн покупка: <?=SITE_NAME?>">    
            <input type="hidden" name="label" value="<?=$_SESSION['order']['id']?>"> 
            <input type="hidden" name="quickpay-form" value="shop">   
            <input type="hidden" name="targets" value="Оплата в магазине <?=SITE_NAME?> заказ № <?=$_SESSION['order']['id']?>">
            <input type="hidden" name="sum" value="<?=$_SESSION['order']['total_price']?>" data-type="number">
            <input type="hidden" name="successURL" value="<?=HOST?>after-payment"/>    
            <!--<input type="hidden" name="comment" value="Хотелось бы получить дистанционное управление.">    
            <input type="hidden" name="need-fio" value="true">
            <input type="hidden" name="need-email" value="true">    
            <input type="hidden" name="need-phone" value="false">
            <input type="hidden" name="need-address" value="false">-->    
            <label class="radio"><input class="radio__input" type="radio" name="paymentType" value="PC"><span class="radio__label"></span>Яндекс.Деньгами</label>
            <label class="radio"><input class="radio__input" type="radio" name="paymentType" value="AC"><span class="radio__label"></span>Банковской картой</label>    
            <input class="button button-save button--small-save" type="submit" value="Перевести">
            </form>
        </div>
    </div>
</div>