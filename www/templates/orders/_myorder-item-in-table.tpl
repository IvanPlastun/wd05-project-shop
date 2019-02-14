<tr>
    <td scope="row">
        <a href="<?=HOST?>myorder?id=<?=$order['id']?>">
        Заказ № <?=$order['id']?></a>
    </td>
    <td><?=$order['date_time']?></td>
    <td><?=$order['total_price']?> рублей</td>
    <?php if($order['payment'] == 'payed') { ?>
        <td class="text-success">Оплачен</td>
        <td></td>
    <?php } else { ?>
        <td class="text-danger">Не оплачен</td>
        <td><a class="button button-profile" href="<?=HOST?>payment-choice?id=<?=$order['id']?>">Оплатить</a></td>
    <?php } ?>
</tr>