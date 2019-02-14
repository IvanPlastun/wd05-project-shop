<tr>
    <td scope="row">
        <a href="<?=HOST?>order?id=<?=$order['id']?>">
        Заказ № <?=$order['id']?></a>
    </td>
    <td><?=$order['firstname']?></td>
    <td><?=$order['lastname']?></td>
    <td><?=$order['email']?></td>
    <td><?=$order['phone']?></td>
    <td><?=$order['date_time']?></td>
    <td><?=$order['total_price']?> рублей</td>
    <?php if($order['payment'] == 'yes') { ?>
        <td class="text-success">Оплачен</td>
    <?php } else { ?>
        <td class="text-danger">Не оплачен</td>
    <?php } ?>
</tr>