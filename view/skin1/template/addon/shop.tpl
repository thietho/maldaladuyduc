<style type="text/css">
	#map{
		height: 500px;
	}
</style>
<div id="map"></div>
<div class="ben-listhop">
	<?php foreach($shops as $key => $shop){ ?>
	<div id="shop-<?php echo $key?>" class="item" shopname="<?php echo $shop['shopname']?>" index="<?php echo $key?>"
		 address="<?php echo $shop['address']?>"
		 phone="<?php echo $shop['phone']?>"
		 email="<?php echo $shop['email']?>"
		 lat="<?php echo $shop['lat']?>"
		 lng="<?php echo $shop['lng']?>"
		 zoom="<?php echo $shop['zoom']?>"
		 image="<?php echo $shop['image']?>">
		<h3><?php echo $shop['shopname']?></h3>
		<div>Địa chỉ: <?php echo $shop['address']?></div>
		<div>Điện thoại: <?php echo $shop['phone']?></div>
		<div>Email: <?php echo $shop['email']?></div>
	</div>
	<?php } ?>
</div>

<script>
    var map;
    var marker;

	var lat = 0;
	var lng = 0;
	var zoom = 10;
	var content = '';

function initMap() {
    
	setParaMap(0);

    var myLatLng = {lat: lat, lng: lng}

    map = new google.maps.Map(document.getElementById('map'), {
        zoom: zoom,
        center: myLatLng
    });
	var infowindow = new google.maps.InfoWindow({
		content: content
	});

    marker = new google.maps.Marker({
          map:map,
          position: myLatLng
	});
	infowindow.open(map, marker);
}
function setParaMap(pos) {
	lat = Number($('#shop-'+pos).attr('lat'));
	lng = Number($('#shop-'+pos).attr('lng'));
	zoom = Number($('#shop-'+pos).attr('zoom'));
	content = '<table>' +
			'<tr>' +
			'<td><img src="'+ $('#shop-'+pos).attr('image') +'"></td>' +
			'<td>' +
			'<h3>'+$('#shop-'+pos).attr('shopname')+'</h3>' +
			'<div>Địa chỉ'+$('#shop-'+pos).attr('address')+'</div>' +
			'<div>Điện thoại: '+$('#shop-'+pos).attr('phone')+'</div>' +
			'<div>Email: '+$('#shop-'+pos).attr('email')+'</div>' +
			'</td>' +
			'</tr>' +
			'</table>';
}
$(document).ready(function () {
	$('item').click(function () {
		var pos = $(this).attr('');
	});
});
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCibpjemwZxmni5m0bFk_ceXWSyCF7iq8Q&callback=initMap">
</script>