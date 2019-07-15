<style type="text/css">
	#map{
		height: 500px;
	}
</style>

<div class="ben-listhop">
	<div class="row">
		<?php foreach($shops as $key => $shop){ ?>
		<div class="col-sm-6">
			<div id="shop-<?php echo $key?>" class="item" shopname="<?php echo $shop['shopname']?>" index="<?php echo $key?>"
				 address="<?php echo $shop['address']?>"
				 phone="<?php echo $shop['phone']?>"
				 email="<?php echo $shop['email']?>"
				 fanpage="<?php echo $shop['fanpage']?>"
				 lat="<?php echo $shop['lat']?>"
				 lng="<?php echo $shop['lng']?>"
				 zoom="<?php echo $shop['zoom']?>"
				 image="<?php echo $shop['image']?>">
				<div class="shopname"><?php echo $shop['shopname']?></div>
				<table>
					<tr>
						<td width="100px"><img width="100px" src="<?php echo $shop['image']?>"></td>
						<td class="infor">
							<div>Địa chỉ: <?php echo $shop['address']?></div>
							<div>Điện thoại: <?php echo $shop['phone']?></div>
							<div>Email: <?php echo $shop['email']?></div>
							<div>Fanpage: <a href="<?php echo $shop['fanpage']?>"><?php echo $shop['fanpage']?></a></div>
						</td>
					</tr>
				</table>

			</div>
		</div>

		<?php } ?>
	</div>


</div>
<div id="map"></div>
<script>
    var map;
    var marker;
	var infowindow;


function initMap() {
	var pos = 0;
	var lat = Number($('#shop-'+pos).attr('lat'));
	var lng = Number($('#shop-'+pos).attr('lng'));
	var zoom = Number($('#shop-'+pos).attr('zoom'));
	var content = '<table>' +
			'<tr>' +
			'<td><img src="'+ $('#shop-'+pos).attr('image') +'"></td>' +
			'<td>' +
			'<h3>'+$('#shop-'+pos).attr('shopname')+'</h3>' +
			'<div>Địa chỉ'+$('#shop-'+pos).attr('address')+'</div>' +
			'<div>Điện thoại: '+$('#shop-'+pos).attr('phone')+'</div>' +
			'<div>Email: '+$('#shop-'+pos).attr('email')+'</div>' +
			'<div>fanpage: '+$('#shop-'+pos).attr('fanpage')+'</div>' +
			'</td>' +
			'</tr>' +
			'</table>';

    var myLatLng = {lat: lat, lng: lng}

    map = new google.maps.Map(document.getElementById('map'), {
        zoom: zoom,
        center: myLatLng
    });
	infowindow = new google.maps.InfoWindow({
		content: content
	});

    marker = new google.maps.Marker({
          map:map,
          position: myLatLng
	});
	infowindow.open(map, marker);
}

function setMap(pos){
	var lat = Number($('#shop-'+pos).attr('lat'));
	var lng = Number($('#shop-'+pos).attr('lng'));
	var zoom = Number($('#shop-'+pos).attr('zoom'));
	var content = '<table>' +
			'<tr>' +
			'<td><img src="'+ $('#shop-'+pos).attr('image') +'"></td>' +
			'<td>' +
			'<h3>'+$('#shop-'+pos).attr('shopname')+'</h3>' +
			'<div>Địa chỉ'+$('#shop-'+pos).attr('address')+'</div>' +
			'<div>Điện thoại: '+$('#shop-'+pos).attr('phone')+'</div>' +
			'<div>Email: '+$('#shop-'+pos).attr('email')+'</div>' +
			'<div>fanpage: '+$('#shop-'+pos).attr('fanpage')+'</div>' +
			'</td>' +
			'</tr>' +
			'</table>';
	var myLatLng = {lat: lat, lng: lng};
	map.setCenter(myLatLng);
	map.setZoom(zoom);
	marker.setPosition(myLatLng);
	infowindow.setContent(content);
	$(document).scrollTop($('#map').position().top)
}
$(document).ready(function () {
	$('.ben-listhop .item').click(function () {
		var pos = $(this).attr('index');
		setMap(pos);
	});
});
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCibpjemwZxmni5m0bFk_ceXWSyCF7iq8Q&callback=initMap">
</script>