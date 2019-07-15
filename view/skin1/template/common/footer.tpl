<div id="ben-footer">
    <div class="pagefacebook ben-left">
        <div class="item">
            <div class="fb-page" data-href="https://www.facebook.com/maldaladuyduc" data-tabs="" data-width="" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/maldaladuyduc" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/maldaladuyduc">Đông Trùng Hạ Thảo Maldala Duy Đức</a></blockquote></div>
        </div>
        
    </div>
    <div class="about ben-left">
        <div class="item">
            <h5>Về Duy Đức</h5>
            <ul>
                <li><a href="<?php echo $this->document->createLink('gioi-thieu-ve-cong-ty-duy-duc')?>">Giới thiệu</a></li>
                <li><a href="<?php echo $this->document->createLink('tai-lieu-tham-khao')?>">Tài liệu tham khảo</a></li>
            </ul>
        </div>
        
    </div>
    <div class="policy ben-left">
        <div class="item">
            <h5>Chính sách</h5>
            <ul>
                <li><a href="<?php echo $this->document->createLink('chinh-sach-ban-hang')?>">Chính sách bán hàng</a></li>
                <li><a href="<?php echo $this->document->createLink('quy-dinh-va-hinh-thuc-thanh-toan')?>">Quy định và hình thức thanh toán</a></li>
            </ul>
        </div>
        
    </div>
    <div class="contact ben-left">
        <div class="item">
            <h5>Liên hệ</h5>
            <ul>
                <li>Địa chỉ: 252 Hải Thượng Lãng Ông - Phường 14 - Quận 5 - TP. HCM</li>
                <li>Điện thoại: (08) 3853 9991/9992 Fax: (08) 3853 9995 - MST: 0306387121</li>
                <li>Mail: info@maldaladuyduc.vn</li>
            </ul>
        </div>
        
    </div>
	

</div>

<!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script>
    window.fbAsyncInit = function() {
        FB.init({
            xfbml            : true,
            version          : 'v3.3'
        });
    };

    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

<!-- Your customer chat code -->
<div class="fb-customerchat"
     attribution=setup_tool
     page_id="189914514887033"
     logged_in_greeting="Chào bạn! Tôi có thể giúp gì cho bạn?"
     logged_out_greeting="Chào bạn! Tôi có thể giúp gì cho bạn?">
</div>
<!-- Modal -->
<div class="modal fade" id="cartModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="window.location = HTTP_SERVER+'cart.html';">Xem giỏ hàng</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<style>
    .alo-phone{background-color:transparent;cursor:pointer;height:150px;position:fixed;left:-20px;bottom: -20px;-webkit-transition:visibility 0.5s ease 0s;transition:visibility 0.5s ease 0s;visibility:hidden;width:150px;z-index: 20;}
    .alo-phone.alo-show{visibility:visible}
    .fadeOutRight{-webkit-animation-name:fadeOutRight;animation-name:fadeOutRight}
    .alo-phone.alo-static{opacity:0.6}.alo-phone.alo-hover,.alo-phone:hover{opacity:1}
    .alo-phone.alo-hover .alo-ph-text,.alo-phone:hover .alo-ph-text{background-color:#141414}
    .alo-ph-circle{-webkit-animation:1.2s ease-in-out 0s normal none infinite running alo-circle-anim;animation:1.2s ease-in-out 0s normal none infinite running alo-circle-anim;background-color:transparent;border:2px solid rgba(30,30,30,0.4);border-radius:100%;height:120px;left:20px;opacity:0.1;position:absolute;top:-10px;-webkit-transform-origin:50% 50% 0;transform-origin:50% 50% 0;-webkit-transition:all 0.5s ease 0s;transition:all 0.5s ease 0s;width:120px}
    .alo-phone.alo-active .alo-ph-circle{-webkit-animation:1.1s ease-in-out 0s normal none infinite running alo-circle-anim !important;animation:1.1s ease-in-out 0s normal none infinite running alo-circle-anim !important}
    .alo-phone.alo-static .alo-ph-circle{-webkit-animation:2.2s ease-in-out 0s normal none infinite running alo-circle-anim !important;animation:2.2s ease-in-out 0s normal none infinite running alo-circle-anim !important}
    .alo-phone.alo-hover .alo-ph-circle,.alo-phone:hover .alo-ph-circle{border-color:#cd3121;opacity:0.5}
    .alo-phone.alo-green.alo-hover .alo-ph-circle,.alo-phone.alo-green:hover .alo-ph-circle{border-color:#141414;opacity:0.5}
    .alo-phone.alo-green .alo-ph-circle{border-color: #d71149;opacity:0.5;}
    .alo-phone.alo-gray.alo-hover .alo-ph-circle,.alo-phone.alo-gray:hover .alo-ph-circle{border-color:#ccc;opacity:0.5}
    .alo-phone.alo-gray .alo-ph-circle{border-color:#141414;opacity:0.5}
    .alo-ph-circle-fill{-webkit-animation:2.3s ease-in-out 0s normal none infinite running alo-circle-fill-anim;animation:2.3s ease-in-out 0s normal none infinite running alo-circle-fill-anim;background-color:#000;border:2px solid transparent;border-radius:100%;height:100px;left:30px;opacity:0.1;position:absolute;top:0;-webkit-transform-origin:50% 50% 0;transform-origin:50% 50% 0;-webkit-transition:all 0.5s ease 0s;transition:all 0.5s ease 0s;width:100px}
    .alo-phone.alo-active .alo-ph-circle-fill{-webkit-animation:1.7s ease-in-out 0s normal none infinite running alo-circle-fill-anim !important;animation:1.7s ease-in-out 0s normal none infinite running alo-circle-fill-anim !important}
    .alo-phone.alo-static .alo-ph-circle-fill{-webkit-animation:2.3s ease-in-out 0s normal none infinite running alo-circle-fill-anim !important;animation:2.3s ease-in-out 0s normal none infinite running alo-circle-fill-anim !important;opacity:0 !important}
    .alo-phone.alo-hover .alo-ph-circle-fill,.alo-phone:hover .alo-ph-circle-fill{background-color:rgba(233,59,53,0.5);opacity:0.75 !important}
    .alo-phone.alo-green.alo-hover .alo-ph-circle-fill,.alo-phone.alo-green:hover .alo-ph-circle-fill{background-color:rgba(0,0,8,0.5);opacity:0.75 !important}
    .alo-phone.alo-green .alo-ph-circle-fill{background-color:rgba(233,59,53,0.5);opacity:0.75 !important}
    .alo-phone.alo-gray.alo-hover .alo-ph-circle-fill,.alo-phone.alo-gray:hover .alo-ph-circle-fill{background-color:rgba(20,20,20,0.5);opacity:0.75 !important}
    .alo-phone.alo-gray .alo-ph-circle-fill{background-color:rgba(0,0,8,0.5);opacity:0.75 !important}
    .alo-ph-img-circle{
        -webkit-animation:1s ease-in-out 0s normal none infinite running alo-circle-img-anim;
        animation:1s ease-in-out 0s normal none infinite running alo-circle-img-anim;
        border:2px solid transparent;color:#fff;font-size:2.25rem;line-height:60px;text-align:center;border-radius:100%;height:60px;left:50px;opacity:0.7;position:absolute;top:20px;-webkit-transform-origin:50% 50% 0;transform-origin:50% 50% 0;width:60px}
    .alo-ph-text{
        background-color: #d2243d;color:#fff;border-radius:4px;padding: 0px 5px;bottom:30px;display:block;
        font-size:1em !important;
        margin-right:-50px;position:absolute;left:20%;text-align:center;text-transform:uppercase;width:100px;font-size: 16px;}
    .alo-phone.alo-active .alo-ph-img-circle{-webkit-animation:1s ease-in-out 0s normal none infinite running alo-circle-img-anim !important;animation:1s ease-in-out 0s normal none infinite running alo-circle-img-anim !important}
    .alo-phone.alo-static .alo-ph-img-circle{-webkit-animation:0s ease-in-out 0s normal none infinite running alo-circle-img-anim !important;animation:0s ease-in-out 0s normal none infinite running alo-circle-img-anim !important}
    .alo-phone.alo-hover .alo-ph-img-circle,.alo-phone:hover .alo-ph-img-circle{background-color:#cd3121}
    .alo-phone.alo-green.alo-hover .alo-ph-img-circle,.alo-phone.alo-green:hover .alo-ph-img-circle{background-color:#141414}
    .alo-phone.alo-green .alo-ph-img-circle{background-color: #d42b3e;}
    .alo-phone.alo-gray.alo-hover .alo-ph-img-circle,.alo-phone.alo-gray:hover .alo-ph-img-circle{background-color:#ccc}
    .alo-phone.alo-gray .alo-ph-img-circle{background-color:#141414}
    @-webkit-keyframes alo-circle-anim{0%{opacity:0.1;-webkit-transform:rotate(0deg) scale(0.5) skew(1deg);transform:rotate(0deg) scale(0.5) skew(1deg)}30%{opacity:0.5;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}100%{opacity:0.6;-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}}@keyframes alo-circle-anim{0%{opacity:0.1;-webkit-transform:rotate(0deg) scale(0.5) skew(1deg);transform:rotate(0deg) scale(0.5) skew(1deg)}30%{opacity:0.5;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}100%{opacity:0.6;-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}}@-webkit-keyframes alo-circle-fill-anim{0%{opacity:0.2;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}50%{opacity:0.2}100%{opacity:0.2;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}}@keyframes alo-circle-fill-anim{0%{opacity:0.2;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}50%{opacity:0.2}100%{opacity:0.2;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}}@-webkit-keyframes alo-circle-img-anim{0%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}10%{-webkit-transform:rotate(-25deg) scale(1) skew(1deg);transform:rotate(-25deg) scale(1) skew(1deg)}20%{-webkit-transform:rotate(25deg) scale(1) skew(1deg);transform:rotate(25deg) scale(1) skew(1deg)}30%{-webkit-transform:rotate(-25deg) scale(1) skew(1deg);transform:rotate(-25deg) scale(1) skew(1deg)}40%{-webkit-transform:rotate(25deg) scale(1) skew(1deg);transform:rotate(25deg) scale(1) skew(1deg)}50%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}100%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}}@keyframes alo-circle-img-anim{0%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}10%{-webkit-transform:rotate(-25deg) scale(1) skew(1deg);transform:rotate(-25deg) scale(1) skew(1deg)}20%{-webkit-transform:rotate(25deg) scale(1) skew(1deg);transform:rotate(25deg) scale(1) skew(1deg)}30%{-webkit-transform:rotate(-25deg) scale(1) skew(1deg);transform:rotate(-25deg) scale(1) skew(1deg)}40%{-webkit-transform:rotate(25deg) scale(1) skew(1deg);transform:rotate(25deg) scale(1) skew(1deg)}50%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}100%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}}@keyframes fadeInRight{0%{opacity:0;-webkit-transform:translate3d(100%, 0px, 0px);transform:translate3d(100%, 0px, 0px)}100%{opacity:1;-webkit-transform:none;transform:none}}@keyframes fadeInRight{0%{opacity:0;-webkit-transform:translate3d(100%, 0px, 0px);transform:translate3d(100%, 0px, 0px)}100%{opacity:1;-webkit-transform:none;transform:none}}@keyframes fadeOutRight{0%{opacity:1}100%{opacity:0;-webkit-transform:translate3d(100%, 0px, 0px);transform:translate3d(100%, 0px, 0px)}}@keyframes fadeOutRight{0%{opacity:1}100%{opacity:0;-webkit-transform:translate3d(100%, 0px, 0px);transform:translate3d(100%, 0px, 0px)}}@keyframes alo-circle-anim{0%{opacity:0.1;-webkit-transform:rotate(0deg) scale(0.5) skew(1deg);transform:rotate(0deg) scale(0.5) skew(1deg)}30%{opacity:0.5;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}100%{opacity:0.1;-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}}@keyframes alo-circle-anim{0%{opacity:0.1;-webkit-transform:rotate(0deg) scale(0.5) skew(1deg);transform:rotate(0deg) scale(0.5) skew(1deg)}30%{opacity:0.5;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}100%{opacity:0.1;-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}}@keyframes alo-circle-fill-anim{0%{opacity:0.2;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}50%{opacity:0.2;-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}100%{opacity:0.2;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}}@keyframes alo-circle-fill-anim{0%{opacity:0.2;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}50%{opacity:0.2;-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}100%{opacity:0.2;-webkit-transform:rotate(0deg) scale(0.7) skew(1deg);transform:rotate(0deg) scale(0.7) skew(1deg)}}@keyframes alo-circle-img-anim{0%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}10%{-webkit-transform:rotate(-25deg) scale(1) skew(1deg);transform:rotate(-25deg) scale(1) skew(1deg)}20%{-webkit-transform:rotate(25deg) scale(1) skew(1deg);transform:rotate(25deg) scale(1) skew(1deg)}30%{-webkit-transform:rotate(-25deg) scale(1) skew(1deg);transform:rotate(-25deg) scale(1) skew(1deg)}40%{-webkit-transform:rotate(25deg) scale(1) skew(1deg);transform:rotate(25deg) scale(1) skew(1deg)}50%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}100%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}}@keyframes alo-circle-img-anim{0%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}10%{-webkit-transform:rotate(-25deg) scale(1) skew(1deg);transform:rotate(-25deg) scale(1) skew(1deg)}20%{-webkit-transform:rotate(25deg) scale(1) skew(1deg);transform:rotate(25deg) scale(1) skew(1deg)}30%{-webkit-transform:rotate(-25deg) scale(1) skew(1deg);transform:rotate(-25deg) scale(1) skew(1deg)}40%{-webkit-transform:rotate(25deg) scale(1) skew(1deg);transform:rotate(25deg) scale(1) skew(1deg)}50%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}100%{-webkit-transform:rotate(0deg) scale(1) skew(1deg);transform:rotate(0deg) scale(1) skew(1deg)}}
    .glyphicon-earphone{
        top:16px !important;
    }
</style>
<a id="alo-phoneIcon" href="tel:0903940171" class="alo-phone alo-green alo-show">
    <div class="alo-ph-circle"></div>
    <div class="alo-ph-circle-fill"></div>
    <div class="alo-ph-img-circle"><span class="glyphicon glyphicon-earphone"></span></div><span class="alo-ph-text">0903.940.171</span>
</a>