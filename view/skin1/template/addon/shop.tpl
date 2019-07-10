<style type="text/css">
	#map{
		height: 500px;
	}
</style>
<div id="map"></div>
<div class="ben-listhop">
	<?php foreach($shops as $shop){ ?>
	<div class="item">
		<h3><?php echo $shop['shopname']?></h3>
		<div>Địa chỉ: <?php echo $shop['address']?></div>
		<div>Diện thoại: <?php echo $shop['phone']?></div>
		<div>Email: <?php echo $shop['email']?></div>
	</div>
	<?php } ?>
</div>

<script>
    var map;
    var marker;

function initMap() {
    
    var lat = Number("<?php echo $shops[0]['lat']?>");
    var lng = Number("<?php echo $shops[0]['lng']?>");
	var zoom = Number("<?php echo $shops[0]['zoom']?>");
    
    var myLatLng = {lat: lat, lng: lng}

    map = new google.maps.Map(document.getElementById('map'), {
        zoom: zoom,
        center: myLatLng,
        zoom_changed:function(){
            updateForm(map,marker);
        }
    });
    marker = new google.maps.Marker({
          map:map,
          position: myLatLng,
          
        });
    
}

</script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCibpjemwZxmni5m0bFk_ceXWSyCF7iq8Q&callback=initMap">
</script>