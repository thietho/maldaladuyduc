<?php
class ControllerSitebarListimage extends Controller
{
	public function index($mediaid)
	{
		$this->load->model("core/media");
		
		$this->load->helper('image');
		$listfile = $this->model_core_media->getInformation($mediaid, "attachment");
		$listfileid=array();
		if($listfile)
			$listfileid=explode(",",$listfile);
			
		array_unshift($listfileid,@$this->data['post']['imageid']);
		
		$this->data['subimage']=array();
		$this->data['attachment']=array();
		
		foreach($listfileid as $key => $item)
		{
			$file = $this->model_core_file->getFile($item);
			if($this->string->isImage(@$file['extension']))
			{
				$this->data['subimage'][$key] = $file;
				$this->data['subimage'][$key]['imagethumbnail'] = HelperImage::resizePNG($file['filepath'], 188, 0);
				
				$this->data['subimage'][$key]['imagepreview'] = HelperImage::resizePNG($file['filepath'],  800, 800);
			}
			
			if(!$this->string->isImage(@$file['extension']))
			{
				$this->data['attachment'][$key] = $file;
				$this->data['attachment'][$key]['imagethumbnail'] = DIR_IMAGE."icon/dinhkem.png";
			}
			
		}
		
		
		$this->id="content";
		$this->template="sitebar/listimage.tpl";
		$this->render();
	}
}
?>