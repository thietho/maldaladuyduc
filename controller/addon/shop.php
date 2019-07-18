
<?php
/**
 * Class ControllerAddonShop
 * @property ModelSalesShop model_sales_shop
 *
 */
class ControllerAddonShop extends Controller
{
	private $error = array();
	public function index()
	{
		$this->load->model("sales/shop");
        $this->load->helper('image');
		$this->data['shops'] = $this->model_sales_shop->getList();

		foreach ($this->data['shops'] as &$shop){
		    if($shop['imagepath']){
                $shop['image'] = HelperImage::resizePNG($shop['imagepath'], 100, 100);
            }else{
                $shop['image'] = HTTP_SERVER.DIR_IMAGE."logo.png";
            }

        }

		$this->id="content";
		$this->template="addon/shop.tpl";
		$this->render();	
		
	}
	
	
}
?>