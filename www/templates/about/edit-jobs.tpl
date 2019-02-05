<div class="content-exp-page">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <h1 class="title-general mt-0 mb-35">Редактировать - Опыт работы</h1>
                <?php include(ROOT . 'templates/about/_result.tpl');?>
                <?php if(count($jobExp) > 0) { ?>
                    <?php foreach($jobExp as $job)
                        include(ROOT . 'templates/about/_card-job-edit.tpl');
                    ?>
                <?php }  else { ?>
                    <p>Сейчас у вас нет записей об опыте работы.</p>
                <?php }?>
                <h3 class="title-3 mt-0 mb-35">Добавить новое место</h3>
                <?php require(ROOT . 'templates/_parts/_errors.tpl');?>
                <form class="about-me-edit-form" method="POST" action="<?=HOST?>about-edit-jobs">
                    <label class="label" for="work-period">Период</label>
                    <input class="input" name="period" id="work-period" type="text" placeholder="Введите даты начала и окончания работы"/>
                    <label class="label" for="name-post">Название должности</label>
                    <input class="input" name="title" id="name-post" type="text" placeholder="Введите название должности" />
                    <label class="label" for="text">Описание работы, должностные обязанности, достигнутые результаты</label>
                    <textarea class="textarea" name="description" id="text" placeholder="Напишите интересное краткое содержательное описание"></textarea>
                    <input class="button button-save" type="submit" name="saveJob" value="Добавить" />
                </form>
            </div>
        </div>
    </div>
</div>