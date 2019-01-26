<div class="container pl-0 pr-0 pt-80 pb-120">
    <div class="row m-0">
        <div class="col-10 offset-1 p-0">
            <div class="add-post-content">
                <h1 class="title-general mt-0 mb-10">Редактировать пост</h1>
                <?php include(ROOT . 'templates/_parts/_errors.tpl');?>
                <form enctype="multipart/form-data" method="POST" action="<?=HOST?>blog/post-edit?id=<?=$post['id']?>">
                    <div class="add-post-content__name mt-40 mb-20">
                        <label class="label" for="edit-post-name">Заголовок</label>
                        <input class="input" name="post-title" id="edit-post-name" type="text" placeholder="Введите заголовок поста" value="<?=$post['title']?>"/>
                    </div>
                    <label class="label" for="select-category">Категории</label>
                    <select class="form-control mt-10" name="post-categories" id="select-category">
                        <?php foreach($categories as $category): ?>
                            <option value="<?=$category['id']?>" <?php echo ($post['category'] == $category['id']) ? "selected" : "";?>><?=$category['category_name']?></option>
                        <?php endforeach ?>
                    </select>
                    <div class="add-post-content__img mt-30">
                        <section class="upload-file">
                            <h6 class="upload-file__title">Изображение</h6>
                            <p class="upload-file__description">изображение и параметры 945px и больше, высота от 400px</p>
                            <div class="upload-file-input-file">
                                <input class="input-file" type="file" name="post-image" id="upload-file" data-multiple-caption="{count}" />
                                <label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
                            </div>
                            <?php if($post['post_img_small'] != '') { ?>
                            <div class="upload-file-image-box">
                                <img src="<?=HOST?>usercontent/blog/<?=$post['post_img_small']?>" alt="<?=$post['title']?>">
                                <input class="button button-delete button--small-delete upload-file-image-box--button-position" type="submit" name="delete-postImg" value="Удалить">
                            </div>
                            <?php } ?>
                        </section>
                    </div>
                    <div class="add-post-content__main mt-30">
                        <label class="label" for="editPostText">Содержание</label>
                            <textarea class="textarea input-post-content" name="post-text" id="editPostText" placeholder="Введите текст поста"><?=$post['text']?></textarea>
                        </div>
                    <div class="add-post-content__submit mt-30">
                        <input class="button button-save mr-20" type="submit" name="update-post" value="Обновить" />
                        <a class="button" href="<?=HOST?>blog">Отмена</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        CKEDITOR.replace('editPostText');
    });
</script>