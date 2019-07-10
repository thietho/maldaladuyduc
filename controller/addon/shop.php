
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

		$this->data['shops'] = $this->model_sales_shop->getList();
		
		$this->id="content";
		$this->template="addon/shop.tpl";
		$this->render();	
		
	}
	
	
}
?>