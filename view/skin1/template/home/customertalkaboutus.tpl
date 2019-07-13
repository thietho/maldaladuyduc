<?php if(count($datas)){ ?>
<div class="container">
    <div class="row ben-testimonial">
        <?php foreach($datas as $item){ ?>
        <div class="col-md-4 item">

            <div class="ben-left colinfo">
                <img src="<?php echo $item['imagethumbnail']?>">
                <div class="name">
                    <?php echo $item['customername']?>
                </div>
                <div class="info">
                    <?php echo $item['customerinfo']?>
                </div>
            </div>
            <div class="ben-right coldetail">
                <?php echo $item['talkaboutus']?>
            </div>

        </div>
        <?php } ?>
    </div>
</div>
<?php } ?>