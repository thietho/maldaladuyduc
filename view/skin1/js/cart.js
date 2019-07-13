function Cart()
{
	this.load = function()
	{
		$("#sitebarcartlist").load(HTTP_SERVER+"?route=sitebar/cart/getList");
			
		$.ajax({
			url: HTTP_SERVER+"?route=sitebar/cart/getCount",
			cache: false,
			success: function(html){
				$("#cartcout").html(html);
				if(html == 0)
					$("#ben-cart").hide();
				else
				{
					$("#ben-cart").show();
				}
			}
		});
	}
	this.add = function(mediaid)
	{
		
		$.get(HTTP_SERVER+"?route=addon/cart/add&mediaid="+mediaid,
			function(data){
				if(data == "true")
				{
					$('#cartModal .modal-title').html('Thông đặt hàng');
					$('#cartModal .modal-body').load(HTTP_SERVER+"?route=common/warring/cart&mediaid="+mediaid,function(){
						$('#cartModal').modal();
					});
					cart.load()
					
				}
				
			}
		);
	}
	
	this.update = function(mediaid,qty)
	{
		$.get(HTTP_SERVER+"?route=addon/cart/update&mediaid="+mediaid+"&qty="+qty,
			function(data){
				if(data == "true")
				{
					$("#sitebarcartlist").load(HTTP_SERVER+"?route=sitebar/cart/getList");
					$("#addoncartlist").load(HTTP_SERVER+"?route=addon/cart/getList");
				}
				
			}
		);
	}
	
	this.remove = function(mediaid)
	{
		$.get(HTTP_SERVER+"?route=addon/cart/remove&mediaid="+mediaid,
			function(data){
				if(data == "true")
				{
					$("#sitebarcartlist").load(HTTP_SERVER+"?route=sitebar/cart/getList");
					$("#addoncartlist").load(HTTP_SERVER+"?route=addon/cart/getList");
				}
				
			}
		);
	}
}

var cart = new Cart();
$(document).ready(function(e) {
    cart.load();
});