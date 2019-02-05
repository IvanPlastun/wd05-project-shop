<?php 
    $options = array('radius' => 56, 'width' => 126, 'height' => 126);

    function showIndicator($options, $title, $value, $color) { 
    $lengthCircle = round(2 * pi() * $options['radius'], 2);
    $offset = $lengthCircle * (1 - (intval($value) / 100));
    $cx = $options['width'] / 2;
    $cy = $options['height'] / 2;
?>    
    <div class="indicator">
        <svg class="svg-box">
            <circle class="circle circle-default--<?=$color?>" r="<?=$options['radius']?>" cx="<?=$cx?>" cy="<?=$cy?>" style="stroke-dasharray:<?=$lengthCircle?>"></circle>
            <circle class="circle circle--<?=$color?>" r="<?=$options['radius']?>" cx="<?=$cx?>" cy="<?=$cy?>" stroke-dashoffset="<?=$offset?>"></circle>
        </svg>
        <div class="indicator__text"><?=$title?></div>
    </div>
<?php } ?>

<div class="section-indikators pt-50">
    <div class="container">
        <div class="row indikators-block">
            <div class="offset-md-3 col-md-7">
                <h2 class="title-general mb-10 color-width">Технологии</h2>
                <p class="indikators-block__text mt-0 mb-0">Которые использую в работе</p>
            </div>
            <div class="col-md-2">
                <?php if(isAdmin()): ?>
                    <a class="button button-edit" href="<?=HOST?>about-edit-skills">Редактировать</a>
                <?php endif ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 list-technology"><span class="list-technology__text">Frontend</span><span class="list-technology__text">Backend</span><span class="list-technology__text">Workflow</span></div>
            <div class="col-md-10">
                <div class="container-indicators">
                    <div class="row ml-90 pt-40">
                        <?php showIndicator($options, 'HTML5', $skills['html'], 'green'); ?>
                        <?php showIndicator($options, 'CSS3', $skills['css'], 'green'); ?>
                        <?php showIndicator($options, 'JS', $skills['js'], 'green'); ?>
                        <?php showIndicator($options, 'jQuery', $skills['jquery'], 'green');?>
                    </div>
                    <div class="row ml-90 pt-40">
                        <?php showIndicator($options, 'PHP', $skills['php'], 'blue');?>
                        <?php showIndicator($options, 'MySQL', $skills['mysql'], 'blue');?>
                    </div>
                    <div class="row ml-90 pt-40">
                        <?php showIndicator($options, 'Git', $skills['git'], 'yellow');?>
                        <?php showIndicator($options, 'Gulp', $skills['gulp'], 'yellow');?>
                        <?php showIndicator($options, 'NPM', $skills['npm'], 'yellow');?>
                        <?php showIndicator($options, 'Yarn', $skills['yarn'], 'yellow');?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>