<div>
<table class="ben-table">
	<thead>
        <tr>
            <th>Hình</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Thành tiền</th>
           
        </tr>
    </thead>
    <tbody>
	<?php 
    	$sum = 0;
    	foreach($medias as $media) {
        $sum = $media['price'] * $media['qty'];
    ?>
        <tr>
            <td><img src="<?php echo $media['imagethumbnail']?>" class="ben-center"/></td>
            <td><?php echo $media['title']?></td>
            <td class="number"><?php echo $this->string->numberFormate($media['price'])?></td>
            <td class="number"><?php echo $this->string->numberFormate($media['qty'])?></td>
            <td class="number"><?php echo $this->string->numberFormate($media['price'] * $media['qty'])?></td>
            
        </tr>
    <?php } ?>
    </tbody>
    <tfoot>
    	<tr>
        	<td></td>
            <td></td>
            <td></td>
            <td>Tông cộng</td>
            <td class="number"><?php echo $this->string->numberFormate($sum)?></td>
        </tr>
    </tfoot>
</table>
</div>
<div>
	<form id="frmCheckOut" method="post" class="form-horizontal">
    	<div id="error" class="ben-error" style="display:none"></div>
        <input type="hidden" id="userid" name="userid" value="<?php echo $member['username']?>" size="40">
        <h2>Thông tin khách hàng</h2>
        <div class="form-group">
            <label class="control-label col-sm-2" for="customername">Họ và tên</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="customername" name="customername" placeholder="Nhập Họ và tên" value="<?php echo $member['customername']?>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="email">Email:</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email" value="<?php echo $member['email']?>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="address">Địa chỉ</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="address" name="address" placeholder="Nhập Họ và tên" value="<?php echo $member['address']?>" <?php echo $readonly?>>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="phone">Điện thoại</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="phone" name="phone" placeholder="Nhập điện thoại" value="<?php echo $member['phone']?>" <?php echo $readonly?>>
            </div>
        </div>

        <input id="chk_fillnhanhang" type="checkbox" /> Thông tin nhận hàng như trên
        <h2>Thông tin giao hàng</h2>
        <div class="form-group">
            <label class="control-label col-sm-2" for="phone">Người nhận hàng</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="receiver" name="receiver" placeholder="Nhập người nhận hàng" value="<?php echo $member['receiver']?>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="receiverphone">Số điện thoại</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="receiverphone" name="receiverphone" placeholder="Nhập số điện thoại" value="<?php echo $member['receiverphone']?>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="shipperat">Địa chỉ giao hàng</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="shipperat" name="shipperat" placeholder="Nhập địa chỉ giao hàng" value="<?php echo $member['shipperat']?>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="paymenttype">Phương thức thanh toán</label>
            <div class="col-sm-10">
                <?php foreach($this->document->paymenttype as $key => $val){ ?>
                <input type="radio" name="paymenttype" value="<?php echo $key?>" /> <?php echo $val?><br />
                <?php } ?>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="comment">Ghi chú</label>
            <div class="col-sm-10">
                <textarea class="form-control" rows="5" id="comment" name="comment"></textarea>
            </div>
        </div>
        <button type="button" class="btn btn-success" id="btnCheckout">Đặt hàng</button>
        
    </form>
</div>
<div class="clearer">&nbsp;</div>
<script language="javascript">
$("#btnCheckout").click(function(){

    waitingDialog.show('Sending...');
	$.post("<?php echo HTTP_SERVER?>?route=addon/checkout/checkout", $("#frmCheckOut").serialize(),
		function(data){
			var arr = data.split("-")
			if(arr[0] == "true")
			{
				window.location = HTTP_SERVER+"checkoutcomplete/"+arr[1]+".html";
			}
			else
			{
				
				$('#error').html(data).show('slow');
				
				
			}
            waitingDialog.hide();
		}
	);					   
});
$("#chk_fillnhanhang").click(function(e) {
    $('#receiver').val($('#customername').val());
	$('#receiverphone').val($('#phone').val());
	$('#shipperat').val($('#address').val());
});
</script>