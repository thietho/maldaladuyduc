<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
      }
     
     
     
    </style>
<div class="section" id="sitemaplist">

	<div class="section-title"><?php echo @$this->document->title?></div>
    
    <div class="section-content padding1">
    
    	<form name="frm" id="frm" action="<?php echo @$action?>" method="post" enctype="multipart/form-data">
        
        	<div class="button right">
            	<input type="button" value="Lưu" class="button" onClick="save()"/>
     	        <input type="button" value="Bỏ qua" class="button" onclick="linkto('?route=quanlykho/donvitinh')"/>   
     	        <input type="hidden" name="id" value="<?php echo @$item['id']?>"/>
            </div>
            <div class="clearer">^&nbsp;</div>
        	<div id="error" class="error" style="display:none"></div>
        	<div class="col2 left">
            	<p>
            		<label>Tên cửa hàng</label><br />
					<input type="text" name="shopname" value="<?php echo @$item['shopname']?>" class="text" size=60/>
                    
            	</p>
              	<p>
            		<label>Loại cửa hàng</label><br />
					<select id="shoptype" name="shoptype">
                    	<?php foreach(@$this->document->shoptype as $type => $typename){ ?>
                        <option value="<?php echo @$type?>"><?php echo @$typename?></option>
                        <?php } ?>
                    </select>
                    
            	</p>
                
                <p>
            		<label>Địa chỉ</label><br />
					<input type="text" id="address" name="address" value="<?php echo @$item['address']?>" class="text" size=60 />
                    
            	</p>
               
                <p>
            		<label>Số điện thoại</label><br />
					<input type="text" name="phone" value="<?php echo @$item['phone']?>" class="text" size=60 />
                    
            	</p>
                <p>
                    <label>Email</label><br />
                    <input type="text" name="email" value="<?php echo @$item['email']?>" class="text" size=60 />
                    
                </p>
               
                
            </div>
            <div class="col2 right">
                 <p>
                    <label>Kinh độ</label><br />
                    <input type="text" id="lat" name="lat" value="<?php echo @$item['lat']?>" class="text" size=60 />
                    
                </p>
                <p>
                    <label>Vĩ độ</label><br />
                    <input type="text" id="lng" name="lng" value="<?php echo @$item['lng']?>" class="text" size=60 />
                    
                </p>
                <p>
                    <label>Zoom</label><br />
                    <input type="text" id="zoom" name="zoom" value="<?php echo @$item['zoom']?>" class="text" size=60 />
                    
                </p>
                
                <p id="pnImage">
                    <label for="image"><?php echo @$entry_image?></label><br />
                    
                    <input type="button" class="button" value="<?php echo @$entry_photo ?>" onclick="browserFile('imageid','single')"/><br />
                    <img id="imageid_preview" src="<?php echo @$item['imagethumbnail']?>" onclick="showFile($('#imageid_filepath').val())"/>
                    <input type="hidden" id="imageid_filepath" name="imagepath" value="<?php echo @$post['imagepath']?>" />
                    <input type="hidden" id="imageid_fileid" name="imageid" value="<?php echo @$post['imageid']?>" />
                    
                </p>
                
                
                <div id="errorupload" class="error" style="display:none"></div>
                
                <div class="loadingimage" style="display:none"></div>
            </div>
            <div class="clearer">^&nbsp;</div>
            <div style="position: relative;">
                
                <div id="map"></div>
            </div>
            
        </form>
    
    </div>
    
</div>
<script language="javascript">
function save()
{
	$.blockUI({ message: "<h1>Please wait...</h1>" }); 
	
	$.post("?route=sales/shop/save", $("#frm").serialize(),
		function(data){
			if(data == "true")
			{
				window.location = "?route=sales/shop";
			}
			else
			{
			
				$('#error').html(data).show('slow');
				$.unblockUI();
				
			}
			
		}
	);
}

</script>
<script>
    var map;
    var marker;
function initMap() {
    
    var lat = $('#lat').val()!=''?Number($('#lat').val()):14.058324;
    var lng = $('#lng').val()!=''?Number($('#lng').val()):108.277199;
    var zoom = $('#zoom').val()!=''?Number($('#zoom').val()):10;
    
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
          draggable:true,
          position_changed:function(){
            updateForm(map,marker);
          }
        });
    var geocoder = new google.maps.Geocoder();
    if($('#lat').val()==0 && $('#address').val()!=''){
        geocodeAddress(geocoder, map);
    }
    document.getElementById('address').addEventListener('change', function() {
        geocodeAddress(geocoder, map);
    });
}

function geocodeAddress(geocoder, resultsMap) {
    var address = document.getElementById('address').value;
    geocoder.geocode({'address': address}, function(results, status) {
      if (status === 'OK') {
       
        marker.setPosition(results[0].geometry.location)
        map.panTo(results[0].geometry.location);
        updateForm(map,marker);
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
}
function updateForm(map,marker){
    var position = marker.getPosition();
    $('#lat').val(position.lat());
    $('#lng').val(position.lng());
    $('#zoom').val(map.getZoom());
}
</script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCibpjemwZxmni5m0bFk_ceXWSyCF7iq8Q&callback=initMap">
</script>