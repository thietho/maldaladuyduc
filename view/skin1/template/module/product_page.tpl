

<h2><?php echo $sitemap['breadcrumb']?></h2>
<div class="ben-post">
	<div class="ben-left product-left">
    	<?php if(in_array("sanphamhot",$properties)){ ?>
        <div id="ben-icon-hot-detail" class="ben-icon">
            <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon/ico-hot.png" />
        </div>
        <?php } ?>
        <?php if(in_array("sanphamkhuyenmai",$properties)){ ?>
        <div id="ben-icon-sale-detail" class="ben-icon">
            <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon/ico-sale.png" />
        </div>
        <?php } ?>
        <?php if(in_array("sanphammoi",$properties)){ ?>
        <div id="ben-icon-new-detail" class="ben-icon">
            <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>icon/ico-new.png" />
        </div>
        <?php } ?>
        <?php if($media['imagethumbnail'] !=""){ ?>
        <a class="islink" href="<?php echo $media['link']?>"><img src='<?php echo $media['imagethumbnail']?>' class='ben-center' /></a>
        <?php }?>
    	<?php if($post['imagethumbnail'] !=""){ ?>
        <div class="product-mainimage">
        	<table>
            	<tr valign="middle">
                	<td id="product-preview" height="250px" align="center"><a class="zoom" href="<?php echo $post['imagepreview']?>"><img  src="<?php echo $post['imagethumbnail']?>" /></a></td>
                </tr>
            </table>
	        
        </div>
        
        <?php }?>
        
        <div id="ben-galary" class="ben-center">
            <table>
                <tr>
                    <td style="width:14px">
                        <img class="ben-link" id="ben-prev" src="<?php echo HTTP_SERVER.DIR_IMAGE?>galary_button_prev.png" title="<?php echo $post['title']?>" alt="<?php echo $post['title']?>"/>
                    </td>
                    <td>
                        <div style="overflow:hidden;width:248px;margin:0 auto;">
                            <table id="ben-scroll">
                                <tr>
                                   
                                    <?php foreach($subimage as $key => $val){ ?>
                                    <td>
                                        <img  id="icon-<?php echo $key?>" class="ben-icon-item" src="<?php echo $val['icon']?>" />
                                    </td>
                                    <?php } ?>
                                </tr>
                            </table>
                        </div>
                        
                    </td>
                    <td style="width:14px">
                        <img class="ben-link" id="ben-next" src="<?php echo HTTP_SERVER.DIR_IMAGE?>galary_button_next.png" />
                    </td>
                </tr>
            </table>
        </div>
<script language="javascript">
$(document).ready(function() { 
$(".ben-icon-item").click(function(){
	var arr = this.id.split("-");
	var key = arr[1];
	$("#product-preview").html($("#preview-"+key).html());
	$(".zoom").fancybox({
			'overlayShow'	: true,
			'transitionIn'	: 'elastic',
			'transitionOut'	: 'elastic'
		});
});

	
	$('#ben-container').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
	
	$(".zoom").fancybox({
			'overlayShow'	: true,
			'transitionIn'	: 'elastic',
			'transitionOut'	: 'elastic'
		});
});
</script>
<script language="javascript">
var block1 = 62;
var length = $("#ben-scroll").width();
var view = 248;
var move = true
var movenext = true
$("#ben-prev").click(function(){
	movenext = true;
	if(move == true)
	{
		move = false;
		var left = $("#ben-scroll").css("margin-left").replace("px","");
		//alert(left);
		if(left < 0)
		{
			
			$("#ben-scroll").animate({"marginLeft": "+="+ block1 +"px"}, "slow",function(){
				/*left = $("#ben-scoll").css("margin-left").replace("px","");
				if(left > 0)
					$("#ben-scoll").css("margin-left","0px");*/
				move = true;
			});
			
			
		}
		else
			move = true;
	}
		
});
$("#ben-next").click(function(){
	length = $("#ben-scroll").width();
	if(movenext == true)
	{
		movenext = false;
		
		var left = $("#ben-scroll").css("margin-left").replace("px","");
		
		if( parseInt(length) + parseInt(left) > view)
			$("#ben-scroll").animate({"marginLeft": "-="+ block1 +"px"}, "slow",function(){
				movenext = true;
			});
	}
	
});
</script>
        <div style="display:none">
            <?php foreach($subimage as $key => $val){ ?>
            <div  id="preview-<?php echo $key?>">
                <a class="zoom" href="<?php echo $val['imagepreview']?>"><img src="<?php echo $val['imagethumbnail']?>" /></a>
            </div>
            <?php } ?>
        </div>
     
    </div>
    <div class="ben-right product-right">
        
        <?php if($post['noted'] != "") echo "<h4>".$post['noted']."</h4>"; ?>
        


        
        <div class="ben-post-body">
        	<p class="short_intro">
            	<?php echo $post['summary']?>
                
            </p>
        	<p>
            	<table>
                	<?php if($post['code'] != ""){ ?>
                    <tr>
                    	<td><strong>Model:</strong></td>
                        <td>
                        	
                            <?php echo $post['code']?>
                            
                        </td>
                    </tr>
                    <?php } ?>
                		
                    <?php if($post['code'] != ""){ ?>
                    <tr>
                    	<td><strong>Nhản hiệu:</strong></td>
                        <td>
                        	
                            <a href="<?php echo $this->document->createLink('brandinfor',$post['brand'])?>" title="<?php echo $this->document->getCategory($post['brand'])?>"><?php echo $this->document->getCategory($post['brand'])?></a>
                            
                        </td>
                    </tr>
                    <?php }?>
                    <?php if($post['sizes'] != ""){ ?>
                    <tr>
                    	<td><strong>Qui cách:</strong></td>
                        <td>
                        	
                            <?php echo $post['sizes']?>
                            
                        </td>
                    </tr>
                    <?php } ?>
                    <?php if($post['color'] != ""){ ?>
                    <tr>
                    	<td><strong>Màu:</strong></td>
                        <td>
                        	
                            <?php echo $post['color']?>
                            
                        </td>
                    </tr>
                    <?php } ?>
                    <?php if($post['material'] != ""){ ?>
                    <tr>
                    	<td><strong>Chất liệu:</strong></td>
                        <td>
                        	
                            <?php echo $post['material']?>
                            
                        </td>
                    </tr>
                    <?php } ?>
                    <?php if(count($priceproduct) == 0){ ?>
                    <tr>
                    	<td><strong>Giá:</strong></td>
                        <td>
                        	<?php $cls = '';?>
                            <?php if($post['pricepromotion']!=0){ ?>
                            <?php $cls = 'product-price-no';?>
                            <span class="product-pricepromotion">
                            <?php echo $this->string->numberFormate($post['pricepromotion'])?> <?php echo $this->document->setup['Currency']?>
                            </span>
                            <?php } ?>
                                
                            <span  class="product-price <?php echo $cls?>"><?php echo $this->string->numberFormate($post['price'])?> <?php echo $this->document->setup['Currency']?></span>
                            
                            
                        </td>
                    </tr>
                    <?php } ?>
                </table>
            	
                
            </p>
            
            <?php if(count($data_samplecode)>1){ ?>
            <p>
            	<?php foreach($data_samplecode as $key => $item){?>
                <a href="<?php echo $this->document->createLink($this->document->sitemapid,$item['alias'])?>" title="<?php echo $item['color']?>"><img src="<?php echo $item['icon']?>" /></a>
                <?php } ?>
            </p>
            <?php } ?>
        </div>
        
    </div>
    <div class="clearer">&nbsp;</div>

    <div class="ben-hline"></div>
    <p>
        <?php echo $post['description']?>
    </p>
    
    <p class="ben-text-right">
        <b><?php echo $post['source']?></b>
    </p>
    <?php if(count($priceproduct)){ ?>
    <div id="listprice">
        <table>
            <thead>
                <tr>
                    <th>Sẩn phẩm</th>
                    
                    <th>Giá bán</th>
                    <th>Khuyến mãi</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                
                
                <?php foreach($priceproduct as $val){ ?>
                <tr>
                    <td>
                    	<?php echo $val['title']!=""?$val['title']:$post['title'] ?>
                    	<?php if($val['tenkhuyenmai']){ ?>
                        <p class="ben-khuyenmai"><a  onclick="xemkhuyenmai('<?php echo $val['makhuyenmai']?>')"><?php echo $val['tenkhuyenmai']?></a></p>
                        <?php } ?>
                    </td>
                    
                    <td class="number">
                        <?php if($val['price']!=0){ ?>
                        <?php echo $this->string->numberFormate($val['price'])?> <?php echo $this->document->setup['Currency']?>
                        <?php } ?>
                    </td>
                    <td class="number">
                        <?php if($val['pricepromotion']!=0){ ?>
                        <?php echo $this->string->numberFormate($val['pricepromotion'])?><?php echo $this->document->setup['Currency']?>
                        <?php } ?>
                    </td>
                    <td><input type="button" class="ben-button ben-center" onclick="cart.add('<?php echo $val['mediaid']?>')" value="Đặt hàng"></td>
                </tr>
                <?php } ?>
                
            </tbody>
        </table>
    </div>
    <?php } ?>
    
    
    
    
    
    <div class="clearer">&nbsp;</div>
</div>

