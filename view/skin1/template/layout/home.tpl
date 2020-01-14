<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>"
      xml:lang="<?php echo $language; ?>">
<head>
    <link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="icon">
    <link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="shortcut icon">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="robots" content="INDEX,FOLLOW"/>
    <meta http-equiv="REFRESH" content="5400"/>
    <meta name="description" content="<?php echo $meta_description?>"/>
    <meta name="keywords" content="<?php echo $meta_keyword?>"/>
    <title><?php echo $title?></title>
    <meta property="og:title" content="<?php echo $title?>">
    <meta property="og:type" content="Website">
    <meta property="og:url" content="<?php echo $url?>">
    <meta property="og:description" content="<?php echo $meta_description?>">
    <meta property="og:image" content="<?php echo HTTP_SERVER.DIR_IMAGE?>logo.png">

</head>

<!--[if lt IE 7]>
<link href="<?php echo DIR_VIEW?>css/ie_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo DIR_VIEW?>js/ie_png.js"></script>
<script type="text/javascript">
    ie_png.fix('.png');
</script>
<![endif]-->
<link rel='stylesheet' type='text/css' href='<?php echo HTTP_SERVER.DIR_VIEW?>css/style.css'>

<link rel='stylesheet' type='text/css' href='<?php echo HTTP_SERVER.DIR_VIEW?>css/niceform.css'>
<link rel='stylesheet' type='text/css' href='<?php echo HTTP_SERVER.DIR_CSS?>product.css'>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script language="javascript">
    var HTTP_SERVER = '<?php echo HTTP_SERVER?>';
</script>
<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/common.js'></script>
<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/cart.js'></script>

<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/product.js'></script>
<script src="https://sp.zalo.me/plugins/sdk.js"></script>

<script>
    (function (i, s, o, g, r, a, m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)}, i[r].l = 1 * new Date();
    a = s.createElement(o),
        m = s.getElementsByTagName(o)[0];
    a.async = 1;
    a.src = g;
    m.parentNode.insertBefore(a, m)
    })
    (window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-50928684-1', 'maldaladuyduc.com');
    ga('send', 'pageview');

</script>
<body>

<div style="display:none"><?php echo $meta_keyword?></div>
<div id="ben-body">
    <div id="ben-main">

        <?php echo $header?>
        <div id="ben-home">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>bg-ben-body.png" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>bg-ben-body2.png" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>bg-ben-body3.png" style="width:100%;">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>


        </div>


    </div>

    <div id="ben-content">
        <div id="ben-maincontent">
            <div class="ben-section">
                <div class="ben-section-title"><?php echo $media['title']?></div>
            </div>
        </div>
        <div class="ben-section-content">

            <div class="ben-editor">
                <?php echo $media['description']?>
            </div>
        </div>

    </div>
    <div id="ben-content">
        <div id="ben-maincontent">
            <div class="ben-section">
                <div class="ben-section-title">Sản phẩm</div>
            </div>
        </div>
        <div class="ben-section-content">
            <?php echo $producthome?>
        </div>

    </div>
    <div id="ben-content">
        <div id="ben-maincontent">
            <div class="ben-section">
                <div class="ben-section-title">Khách hàng nói về chúng tôi</div>
            </div>
        </div>
        <div class="ben-section-content">
            <?php echo $customertalkaboutus?>
        </div>

    </div>
</div>
<div id="ben-bottom">
    <?php echo $footer?>
</div>
<div id="ben-popup" style="display:none">
    <div id="ben-popup-content"></div>

</div>

</body>

</html>

</script>
