<div class="section" id="sitemaplist">

	<div class="section-title"><?php echo $this->document->title?></div>
    
    <div class="section-content padding1">
    
    	<form name="frm" id="frm" action="<?php echo $action?>" method="post" enctype="multipart/form-data">
        
        	<div class="button right">
            	
     	        <input type="hidden" name="id" value="<?php echo $item['id']?>">
                
            </div>
            <div class="clearer">^&nbsp;</div>
        	<div id="error" class="error" style="display:none"></div>
        	<div>
            	<p>
            		<label>Tên khách hàng</label><br />
					<input type="text" id="customername" name="customername" value="<?php echo $item['customername']?>" class="text" size=60/>

            	</p>
                <p>
            		<label>Thông tin khách hàng</label><br />
					<textarea id="customerinfo" name="customerinfo"><?php echo $item['customerinfo']?></textarea>
            	</p>
                <p>
            		<label>Khách hàng nói về chúng tôi</label><br />
					<textarea id="talkaboutus" name="talkaboutus"><?php echo $item['talkaboutus']?></textarea>
                    
            	</p>
				<p id="pnImage">
					<label for="image"><?php echo $entry_image?></label><br />

					<input type="button" class="button" value="<?php echo $entry_photo ?>" onclick="browserFile('imageid','single')"/><br />
					<img id="imageid_preview" src="<?php echo $item['imagethumbnail']?>" onclick="showFile($('#imageid_filepath').val())"/>
					<input type="hidden" id="imageid_filepath" name="imagepath" value="<?php echo $item['imagepath']?>" />


				</p>


				<div id="errorupload" class="error" style="display:none"></div>

				<div class="loadingimage" style="display:none"></div>
            </div>
            
        </form>
    
    </div>
    
</div>

