<?php if(count($datas)){ ?>
<div class="container">
    <div class="row ben-testimonial">
        <?php foreach($datas as $item){ ?>
        <div class="col-md-4 item">
            <img class="ben-left" src="<?php echo $item['imagethumbnail']?>">
            <strong><?php echo $item['customername']?></strong><br>
            <?php echo $item['customerinfo']?><br>
            <?php echo $item['talkaboutus']?>
        </div>
        <?php } ?>

    </div>
</div>
<?php } ?>
