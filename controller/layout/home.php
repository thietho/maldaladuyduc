<?php
/**
 * Class ControllerLayoutHome
 * @property ModelCoreMedia model_core_media
 * @property Document document
 * @property Member member
 *
 */
class ControllerLayoutHome extends Controller
{
	public function index()
	{
		
		$this->data['title'] = $this->document->title;
		@$this->data['url'] = HTTP_SERVER.substr($_SERVER[REQUEST_URI],1);
		if($this->document->meta_description == "")
			$this->data['meta_description'] = $this->document->setup['Description']." ".$this->string->chuyenvekodau($this->document->title);
		else
			$this->data['meta_description'] = $this->document->meta_description ;
		if($this->document->meta_keyword == "")
			$this->data['meta_keyword'] = $this->document->setup['Keyword']." ".$this->string->chuyenvekodau($this->document->title);
		else
			$this->data['meta_keyword'] = $this->document->meta_keyword;
		//
		@$arr = explode(',',$this->document->meta_image);
		$this->data['meta_image'] = "";
		
		if(count($arr))
		{
			foreach($arr as $item)
			{
				if($item)
					$this->data['meta_image'] .= '<meta content="'.$item.'" property="og:image">';
			}
		}
        $this->load->model("core/media");

        //San pham moi
        $template = array(
            'template' => "module/product_list.tpl",
            'width' => 170,
            'height' =>170,
            'widthpreview' => 450,
            'heightpreview' =>450,
            'paging' => false,
            'sorting' =>false
        );

        $medias = $this->getHomeMedias('module/product');

        $arr = array("",20,"",$template,$medias);
        $this->data['producthome'] = $this->loadModule('module/productlist','index',$arr);

        $sitemapid = 'loi-ich-cho-suc-khoe';
        $this->data['media'] = $this->model_core_media->getItem($this->member->getSiteId().$sitemapid);
        $this->data['media']['description'] = html_entity_decode($this->data['media']['description']);
		$this->template="layout/home.tpl";
		$this->children=array(
			'common/header',
			'common/footer'
		);
		$this->render();
	}

    function getHomeMedias($mediatype)
    {

        
        //$siteid = $this->member->getSiteId();
        //$sitemaps = $this->model_core_sitemap->getListByModule("module/product", $siteid);
        //$arrsitemapid = $this->string->matrixToArray($sitemaps,"sitemapid");
        $queryoptions = array();
        $queryoptions['mediaparent'] = '';
        $queryoptions['mediatype'] = $mediatype;
        $queryoptions['refersitemap'] = '%';
        $data = $this->model_core_media->getPaginationList($queryoptions,$step=0,$to=0);

        return $data;
    }
}
?>