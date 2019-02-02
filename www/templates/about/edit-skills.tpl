<?php
    function dataFromPOST($nameField) {
        global $skills;
        echo (@$_POST[$nameField] != '') ? @$_POST[$nameField] : $skills[$nameField];
    }
?>

<?php function showTechnologyInput($title, $nameField) { ?>
    <div class="col-3">
        <div class="about-me-tech__input">
            <label class="label" for="technology-html"><?=$title?></label>
            <input class="input" name=<?=$nameField?> id="technology-html" type="number" placeholder="0" min="0" max="100"  value="<?=dataFromPOST($nameField)?>"/>
            <p class="percent">%</p>
        </div>
    </div>
<?php } ?>

<div class="content-exp-page">
    <div class="container">
        <div class="row">
            <div class="col-md-9 offset-md-1">
                <h1 class="title-general mt-0 mb-35">Редактировать - Технологии</h1>
                <?php require(ROOT . 'templates/_parts/_errors.tpl');?>
                <form method="POST" action="<?=HOST?>about-edit-skills">
                    <div class="row mb-40">
                        <?php showTechnologyInput("HTML5", 'html');?>
                        <?php showTechnologyInput("CSS3", 'css');?>
                        <?php showTechnologyInput("JS", 'js');?>
                        <?php showTechnologyInput("jQuery", 'jquery');?>
                    </div>
                    <div class="row mb-40">
                        <?php showTechnologyInput("PHP", 'php');?>
                        <?php showTechnologyInput("MySQL", 'mysql');?>
                    </div>
                    <div class="row mb-30">
                        <?php showTechnologyInput("Git", 'git');?>
                        <?php showTechnologyInput("Gulp", 'gulp');?>
                        <?php showTechnologyInput("NPM", 'npm');?>
                        <?php showTechnologyInput("Yarn", 'yarn');?>
                    </div>
                    <div class="row">
                        <div class="col-auto pr-30">
                            <input class="button button-save" type="submit" name="saveSkills" value="Сохранить" /></div>
                        <div class="col-auto">
                            <a class="button" href="<?=HOST?>about">Отмена</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>