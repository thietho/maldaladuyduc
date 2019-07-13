<div class="section">

	<div class="section-title"><?php echo @$this->document->title?></div>
    
    <div class="section-content">
    	
        <form action="" method="post" id="frm_nhacungcap">
        	<div id="ben-search">
            	<label>Tên khách hàng</label>
                <input type="text" id="customername" name="customername" class="text" value="" />
                <label>Thông tin</label>
                <input type="text" id="customerinfo" name="customerinfo" class="text" value="" />
                <label>Nói về chúng tôi</label>
                <input type="text" id="talkaboutus" name="talkaboutus" class="text" value="" />
                <br />
                <input type="button" class="button" name="btnSearch" value="Tìm" onclick="searchForm()"/>
                <input type="button" class="button" name="btnSearch" value="Xem tất cả" onclick="viewAll()"/>
            </div>
        	<div class="button right">
            	<?php if(@$dialog==true){ ?>
            	<?php if(@$this->user->checkPermission("module/customertalkaboutus/insert")==true){ ?>
                <input class="button" value="Thêm" type="button" onclick="showForm('','searchForm()')">
                <?php } ?>
                
                <?php }else{ ?>
                
               
                <?php if(@$this->user->checkPermission("module/customertalkaboutus/insert")==true){ ?>
                <input class="button" value="Thêm" type="button" onclick="showForm('','searchForm()')">
                <?php } ?>
                <?php if(@$this->user->checkPermission("module/customertalkaboutus/delete")==true){ ?>
            	<input class="button" type="button" name="delete_all" value="Xóa" onclick="deleteitem()"/>
                <?php } ?>
                <?php } ?>
            </div>
            <div class="clearer">^&nbsp;</div>
            
            <div id="listsanpham" class="sitemap treeindex">
                
            </div>
        	
        
        </form>
        
    </div>
    
</div>
<script language="javascript">

function deleteitem()
{
	var answer = confirm("Bạn có muốn xóa không?")
	if (answer)
	{
		$.post("?route=module/customertalkaboutus/delete", 
				$("#frm_nhacungcap").serialize(), 
				function(data)
				{
					if(data!="")
					{
						alert(data)
						window.location.reload();
					}
				}
		);
	}
}
$(document).ready(function(e) {
    viewAll();
});

$('.text').keyup(function(e) {
    searchForm();
});
$('select').change(function(e) {
    searchForm();
});
function viewAll()
{
	url = "?route=module/customertalkaboutus/getList";
	if("<?php echo @$_GET['opendialog']?>" == "true")
	{
		url += "&opendialog=true";
	}
	$('#listsanpham').html(loading);
	$('#listsanpham').load(url);
}

function searchForm()
{
	var url =  "";
	if($("#frm_nhacungcap #customername").val() != "")
		url += "&customername=" + encodeURI($("#frm_nhacungcap #customername").val());
	
	if($("#frm_nhacungcap #customerinfo").val() != "")
		url += "&customerinfo="+ encodeURI($("#frm_nhacungcap #customerinfo").val());
	
	if($("#frm_nhacungcap #talkaboutus").val() != "")
		url += "&talkaboutus="+ encodeURI($("#frm_nhacungcap #talkaboutus").val());

	
	if("<?php echo @$_GET['opendialog']?>" == "true")
	{
		url += "&opendialog=true";
	}
	$('#listsanpham').html(loading);
	$('#listsanpham').load("?route=module/customertalkaboutus/getList"+url);
}

function moveto(url,eid)
{
	$(eid).html(loading);
	$(eid).load(url);	
}
function showForm(id,strFun)
{
    $('body').append('<div id="frm_member" style="display:none"></div>');
    var eid = "#frm_member";
    $(eid).attr('title','Thông tin khách hàng');
    $( eid ).dialog({
        autoOpen: false,
        show: "blind",
        hide: "explode",
        //width: $(document).width()-100,
        width: 600,
        height: window.innerHeight,
        modal: true,
        close:function()
        {
            $(eid).remove();
        },
        buttons: {



            'Lưu':function()
            {


                $.blockUI({ message: "<h1>Please wait...</h1>" });

                $.post("?route=module/customertalkaboutus/save", $("#frm").serialize(),
                    function(data){
                        var arr = data.split("-");
                        if(arr[0] == "true")
                        {
                            //window.location = "?route=core/member";\
                            alert("Lưu thành công!");
                            if(strFun!="")
                                var ret = eval(strFun);
                            $(eid).dialog( "close" );
                        }
                        else
                        {

                            $('#error').html(data).show('slow');
                            $.unblockUI();

                        }
                        $.unblockUI();
                    }
                );




            },
            'Đóng': function()
            {

                $(eid).dialog( "close" );

            },
        }
    });
    var url = "?route=module/customertalkaboutus/insert&dialog=true";
    if(id)
    {
        url = "?route=module/customertalkaboutus/update&id="+id+"&dialog=true";
    }
    $(eid).dialog("open");
    $(eid).html(loading);
    $(eid).load(url,function(){

    });
}
</script>