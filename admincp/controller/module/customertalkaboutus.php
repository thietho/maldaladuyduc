<?php
/**
 * Class ControllerModuleCustomertalkaboutus
 * @property ModelCoreModule model_core_module
 * @property ModelModuleCustomertalkaboutus model_module_customertalkaboutus
 * @property Document document
 * @property Response response
 * @property Request request
 * @property Pager pager
 *
 */
class ControllerModuleCustomertalkaboutus extends Controller
{
	private $error = array();
	function __construct() 
	{
		$this->load->model("core/module");
		$this->load->model("module/customertalkaboutus");
		$moduleid = $_GET['route'];
		$this->document->title = $this->model_core_module->getBreadcrumbs($moduleid);
		if($this->user->checkPermission($moduleid)==false)
		{
			$this->response->redirect('?route=page/home');
		}
		$this->load->helper('image');
		
   	}
	public function index()
	{
		$this->data['insert'] = $this->url->http('module/customertalkaboutus/insert');
		$this->data['delete'] = $this->url->http('module/customertalkaboutus/delete');
		
		$this->id='content';
		$this->template="module/customertalkaboutus_list.tpl";
		$this->layout="layout/center";
		
		if($this->request->get['opendialog']=='true')
		{
			$this->layout="";
			$this->data['dialog'] = true;
			
		}
		$this->render();
	}
	
	public function insert()
	{
    	$this->getForm();
	}
	
	public function update()
	{
		$this->data['haspass'] = false;
		$this->data['readonly'] = 'readonly="readonly"';
		$this->getForm();		
  	}
	
	public function delete() 
	{
		$listid=$this->request->post['delete'];
		//$listmadonvi=$_POST['delete'];
		
		if(count($listid))
		{
			foreach($listid as $id)
			$this->model_module_customertalkaboutus->delete($id);
			$this->data['output'] = "Xóa thành công";
		}
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
  	}
	
	public function getList() 
	{
		$this->data['datas'] = array();
		$where = "";
		$datasearchlike['customername'] = urldecode($this->request->get['customername']);
		$datasearchlike['customerinfo'] = urldecode($this->request->get['customerinfo']);
		$datasearchlike['talkaboutus'] = urldecode($this->request->get['talkaboutus']);
		$arr = array();
		foreach($datasearchlike as $key => $item) {
            if ($item != "")
                $arr[] = " AND " . $key . " like '" . $item . "%'";
        }
		
		$where = implode("",$arr);
		
		
		$rows = $this->model_module_customertalkaboutus->getList($where);
		//Page
		$page = $this->request->get['page'];		
		$x=$page;		
		$limit = 20;
		$total = count($rows); 
		// work out the pager values 
		$this->data['pager']  = $this->pager->pageLayoutAjax($total, $limit, $page,"#listnguyenlieu");
		
		$pager  = $this->pager->getPagerData($total, $limit, $page); 
		$offset = $pager->offset; 
		$limit  = $pager->limit; 
		$page   = $pager->page;
		for($i=$offset;$i < $offset + $limit && @count($rows[$i])>0;$i++)
		//for($i=0; $i <= count($this->data['datas'])-1 ; $i++)
		{
			$this->data['datas'][$i] = $rows[$i];
			$this->data['datas'][$i]['link_edit'] = $this->url->http('module/customertalkaboutus/update&id='.$this->data['datas'][$i]['id']);
			$this->data['datas'][$i]['text_edit'] = "Sửa";
			//
			
			$imagepreview = "";
			
			$this->data['datas'][$i]['imagethumbnail'] = HelperImage::resizePNG($this->data['datas'][$i]['imagepath'], 100, 0);
			$arr = array($this->data['datas'][$i]['id']);
			$this->data['datas'][$i]['congno'] = $this->loadModule("module/customertalkaboutus","getCongNo",$arr);
		}
		$this->data['refres']=$_SERVER['QUERY_STRING'];
		$this->id='content';
		$this->template="module/customertalkaboutus_table.tpl";
		
		if($this->request->get['opendialog']=='true')
		{
			$this->layout="";
			$this->data['dialog'] = true;
			
		}
		$this->render();
	}
	
	private function getForm()
	{
		$this->data['DIR_UPLOADPHOTO'] = HTTP_SERVER."index.php?route=common/uploadpreview";
		$sanphamid = $this->request->get['id'];
		if($sanphamid) 
		{
			
      		$this->data['item'] = $this->model_module_customertalkaboutus->getItem($this->request->get['id']);
            $this->data['item']['imagethumbnail'] = HelperImage::resizePNG($this->data['item']['imagepath'], 200, 200);
			
    	}
		
		$this->id='content';
		$this->template='module/customertalkaboutus_form.tpl';
		
		
		$this->render();
	}
	
	public function save()
	{
		$data = $this->request->post;
		
		if($this->validateForm($data))
		{
			
			
			$data['id'] = $this->model_module_customertalkaboutus->save($data);
			
			
			$this->data['output'] = "true";
		}
		else
		{
			foreach($this->error as $item)
			{
				$this->data['output'] .= $item."<br>";
			}
		}
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	private function validateForm($data)
	{
    	if($data['customername'] == "")
		{
      		$this->error['customername'] = "Bạn chưa nhập tên nhà cung cấp";
    	}
		if($data['email'])
		{
			if ($this->validation->_checkEmail($this->request->post['email']) == false ) 
			{
				$this->error['email'] = "Email khong đúng định dạng";
			}
		}
		if($data['emailnguoilienhe'])
		{
			if ($this->validation->_checkEmail($this->request->post['emailnguoilienhe']) == false ) 
			{
				$this->error['emailnguoilienhe'] = "Email người liên không đúng định dạng";
			}
		}

		if (count($this->error)==0) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
	}
	//Cac ham xu ly tren form
}
?>