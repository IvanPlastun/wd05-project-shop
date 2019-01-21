<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="UTF-8" />
	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"/><![endif]-->
	<title>
		<?php if(@$title != '') {
			echo "$title - " . SITE_NAME;
		} else {
			echo SITE_NAME;
		}?>
	</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" /><!-- build:cssVendor css/vendor.css -->
	<link rel="stylesheet" href= "<?=HOST?>templates/assets/libs/normalize-css/normalize.css" />
	<link rel="stylesheet" href="<?=HOST?>templates/assets/libs/bootstrap-4-grid/grid.min.css" /><!-- endbuild -->
	<!-- build:cssCustom css/main.css -->
	<link rel="stylesheet" href="<?=HOST?>templates/assets/css/main.css" /><!-- endbuild -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather|Open+Sans:400,600,700&amp;amp;subset=cyrillic-ext" />
	<!--[if lt IE 9]><script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script><![endif]-->
</head>