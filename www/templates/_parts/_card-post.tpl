<div class="card-box">
    <div class="card-box__img-blog">
        <?php if($post->post_img_small != '' && file_exists(ROOT . 'usercontent/blog/' . $post->post_img_small)) { ?>
            <img src="<?=HOST?>usercontent/blog/<?=$post['post_img_small']?>" alt="<?=$post['title']?>" />
        <?php } else { ?>
            <img src="<?=HOST?>usercontent/no-image.jpg?>" alt="<?=$post['title']?>" />
        <?php } ?>
    </div>
    <div class="card-box__title"><?=mbCutString($post['title'], 49)?></div>
    <a class="button card-box--button" href="<?=HOST?>blog/post?id=<?=$post['id']?>">Читать</a>
</div>