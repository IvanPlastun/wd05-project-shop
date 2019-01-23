<div class="container pl-0 pr-0 pt-80 pb-120">
<div class="row m-0">
    <div class="col-10 offset-1 p-0">
        <?php if(isset($_GET['result'])) {
            include(ROOT . 'templates/categories/_results.tpl');
        }?>
        <div class="blog-title mb-40">
            <h1 class="title-general mb-10 mt-0 blog-title--color">Категории блога</h1><a class="button button-edit" href="<?=HOST?>blog/category-new">Добавить категорию</a>
        </div>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">Название</th>
                    <th scope="col">Редактировать</th>
                    <th scope="col">Удалить</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($categories as $category) { ?>
                    <tr>
                        <th scope="row"><?=$category['id']?></th>
                        <td><?=$category['category_name']?></td>
                        <td><a class="postlink" href="<?=HOST?>blog/category-edit?id=<?=$category['id']?>">Редактировать</a></td>
                        <td><a class="postlink" href="<?=HOST?>blog/category-delete?id=<?=$category['id']?>">Удалить</a></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</div>
</div>