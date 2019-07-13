<script language="javascript">
var video = '';
if(detectflash()){
    //alert("Flash is enabled");
	video = '<embed width="438" height="266" wmode="transparent" flashvars="file=<?php echo HTTP_SERVER.DIR_IMAGE?>QC DTHT 120 - YouTube.FLV&amp;image=<?php echo HTTP_SERVER.DIR_IMAGE?>hinhvideo.png&amp;provider=video" allowfullscreen="true" allowscriptaccess="always" src="<?php echo HTTP_SERVER?>component/player/mediaplayer.swf" name="player2" type="application/x-shockwave-flash">';
} else{
    video = '<video src="<?php echo HTTP_SERVER.DIR_IMAGE?>QC.mp4" width="438" height="266" controls="controls"></video>';
}

$(document).ready(function(e) {
    $('#videohome').html(video);
});


</script>
<div id="home-desktop">
    <div id="videohome" class="homeitem">

    </div>
    <div id="sloganhome" class="homeitem">
        <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>slogan.png"/>
    </div>

    <div id="aboutdtht" class="homeitem">
        <div class="item">
            <div class="ben-left text">
                <a href="<?php echo $this->document->createLink('dong-trung-ha-thao-1')?>">Đông trùng hạ thảo</a>
            </div>
            <div class="ben-right icon">
                <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon-dtht.png" />
            </div>
            <div class="clearer">&nbsp;</div>
        </div>
        <div class="item">
            <div class="ben-left text">
                <a href="<?php echo $this->document->createLink('loi-ich-cho-suc-khoe')?>">Lợi ích cho sức khỏe</a>
            </div>
            <div class="ben-right icon">
                <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon-suckhoe.png" />
            </div>
            <div class="clearer">&nbsp;</div>
        </div>
        <div class="item">
            <div class="ben-left text">
                <a href="<?php echo $this->document->createLink('nguon-goc')?>">Nguồn gốc</a>
            </div>
            <div class="ben-right icon">
                <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon-nguongoc.png" />
            </div>
            <div class="clearer">&nbsp;</div>
        </div>
        <div class="item">
            <div class="ben-left text">
                <a href="<?php echo $this->document->createLink('huong-dan-su-dung')?>">Hường dẫn sử dụng</a>
            </div>
            <div class="ben-right icon">
                <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon-huongdan.png" />
            </div>
            <div class="clearer">&nbsp;</div>
        </div>
    </div>
    <div id="sanphamhome" class="homeitem">
        <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>hopthuoc.png" />
    </div>
</div>
<div id="home-mobile">
    <video src="<?php echo HTTP_SERVER.DIR_IMAGE?>QC.mp4" width="100%" controls="controls"></video>
    <table class="homedtht">
        <tr>
            <td width="50px"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon-dtht.png" /></td>
            <td> <a href="<?php echo $this->document->createLink('dong-trung-ha-thao-1')?>">Đông trùng hạ thảo</a></td>
        </tr>
        <tr>
            <td><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon-suckhoe.png" /></td>
            <td><a href="<?php echo $this->document->createLink('loi-ich-cho-suc-khoe')?>">Lợi ích cho sức khỏe</a></td>
        </tr>
        <tr>
            <td><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon-nguongoc.png" /></td>
            <td><a href="<?php echo $this->document->createLink('nguon-goc')?>">Nguồn gốc</a></td>
        </tr>
        <tr>
            <td><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon-huongdan.png" /></td>
            <td><a href="<?php echo $this->document->createLink('huong-dan-su-dung')?>">Hường dẫn sử dụng</a></td>
        </tr>
    </table>
    <div>
        <img width="100%" src="<?php echo HTTP_SERVER.DIR_IMAGE?>slogan.png" />
    </div>
</div>

