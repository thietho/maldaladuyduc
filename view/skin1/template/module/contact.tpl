<script language="">
function GetKey(evt)
{
	if(navigator.appName=="Netscape"){theKey=evt.which}
	if(navigator.appName.indexOf("Microsoft")!=-1)
	{
		theKey=window.event.keyCode
	}
	window.status=theKey;
	if(theKey==13)
	{
		sendMessage()
	}
}
function sendMessage()
{
	waitingDialog.show('Sending...');
	$.post(HTTP_SERVER+"?route=module/contact/sendMessage", 
			$("#contractForm").serialize(), 
			function(data)
			{
				if(data!="true")
				{
					$('.ben-error').html(data)
					$('.ben-error').fadeIn("slow")
					
				}
				else
				{
					alert("<?php echo $war_contactsuccess?>")
					window.location.reload();
				}
				waitingDialog.hide();
			}
	);
}
</script>

<div class="ben-post">
<h3>Thông tin liên hệ</h3>
<p>
    <?php echo $post['description']?>
</p>

<div class="clearer">&nbsp;</div>
<div class="ben-error ben-hidden"></div>
<form method="post" action="" id="contractForm" name="contractForm">
<div>
    <input type="hidden" name="sitemapid" value="<?php echo $this->document->sitemapid;?>" />
    <div class="form-group">
        <label for="fullname"><?php echo $text_fullname?></label>
        <input type="fullname" class="form-control" id="fullname">
    </div>
    <div class="form-group">
        <label for="email"><?php echo $text_email?></label>
        <input type="email" class="form-control" id="email">
    </div>
    <div class="form-group">
        <label for="address"><?php echo $text_address?></label>
        <input type="address" class="form-control" id="address" onkeypress='GetKey(event)'>
    </div>
    <div class="form-group">
        <label for="phone"><?php echo $text_phone?></label>
        <input type="phone" class="form-control" id="phone" onkeypress='GetKey(event)'>
    </div>
    <div class="form-group">
        <label for="type">Liên hệ</label>
        <select class="form-control" id="type" name="type">
            <option>Gửi thông tin liên hệ</option>
            <option>Liên hệ làm đại lý</option>
        </select>
    </div>
    <div class="form-group">
        <label for="description"><?php echo $text_note?></label>
        <textarea class="form-control" rows="5" id="description" name="description"></textarea>
    </div>
    <button type="button" class="btn btn-success" onclick="sendMessage()"><?php echo $button_send?></button>
    <button type="reset" class="btn btn-danger"><?php echo $button_reset?></button>

</div>			
</form>
</div>
<?php echo $sododuongdi?>