<?php
class ControllerQuanlykhoPhieunhap extends Controller
{
	private $error = array();
	
	function __construct() 
	{
		
		@$this->load->model("core/module");
		$moduleid = $_GET['route'];
		@$this->document->title = @$this->model_core_module->getBreadcrumbs($moduleid);
		if(@$this->user->checkPermission($moduleid)==false)
		{
			@$this->response->redirect('?route=page/home');
		}
		/*@$this->data['loaiphieu'] = array(
								"NK" => "Nhập từ nhà cung cấp",
								"NK-KHTL" => "Khách hàng trả hàng",
								"NK-CH" => "Nhập kho từ cửa hàng",
								);*/
		
		@$this->load->model("quanlykho/phieunhapxuat");
		@$this->load->helper('image');
		@$this->load->model("core/category");
		@$this->load->model("core/media");
		@$this->load->model("sales/shop");
		@$this->load->model("quanlykho/donvitinh");
		
		$this->data['loaiphieu'] = array();
		$this->model_core_category->getTree("import",$this->data['loaiphieu']);
		unset($this->data['loaiphieu'][0]);
		
		$this->data['loaisanpham'] = array();
		$this->model_core_category->getTree("sanpham",$this->data['loaisanpham']);
		unset($this->data['loaisanpham'][0]);
		
		@$this->data['donvitinh'] = @$this->model_quanlykho_donvitinh->getList();
		
		$where = " ORDER BY shopname";
		@$this->data['data_shop'] = @$this->model_sales_shop->getList($where);
		
   	}
	public function index()
	{
		
		@$this->data['insertlist'] = @$this->url->http('quanlykho/phieunhap/insertlist');
		@$this->data['insert'] = @$this->url->http('quanlykho/phieunhap/insert');
		@$this->data['delete'] = @$this->url->http('quanlykho/phieunhap/delete');
		
		@$this->id='content';
		@$this->template="quanlykho/phieunhap_list.tpl";
		@$this->layout="layout/center";
		
		if(@$this->request->get['opendialog']=='true')
		{
			@$this->layout="";
			@$this->data['dialog'] = true;
			
		}
		@$this->render();
	}
	
	public function insert()
	{
    	@$this->getForm();
	}
	public function insertlist()
	{		
    	@$this->id='content';
		@$this->template='quanlykho/phieunhap_form_list.tpl';
		@$this->layout="layout/center";
		@$this->render();
	}
	
	public function update()
	{
		@$this->data['haspass'] = false;
		@$this->data['readonly'] = 'readonly="readonly"';
		@$this->getForm();		
  	}
	
	public function delete() 
	{
		$listid=@$this->request->post['delete'];
		//$listmadonvi=$_POST['delete'];
		
		if(count($listid))
		{
			foreach($listid as $id)
			@$this->model_quanlykho_phieunhapxuat->destroy($id);
			@$this->data['output'] = "Xóa thành công";
		}
		@$this->id="content";
		@$this->template="common/output.tpl";
		@$this->render();
  	}
	
	public function getList() 
	{
		
		$arr = array();
		$where = " AND (loaiphieu like 'NK%' Or loaiphieu like 'CH-NK')";
		
		$datasearchlike['maphieu'] = urldecode(@$this->request->get['maphieu']);
		$datasearchlike['trangthai'] = urldecode(@$this->request->get['trangthai']);
		$datasearchlike['tennhacungcap'] = urldecode(@$this->request->get['tennhacungcap']);
		$datasearchlike['tenkhachhang'] = urldecode(@$this->request->get['tenkhachhang']);
		
		$arr = array();
		foreach($datasearchlike as $key => $item)
		{
			if(@$item !="")
				$arr[] = " AND " . $key ." like '%".$item."%'";
		}
		
		$where .= implode("",$arr);
		$tungay = @$this->date->formatViewDate(urldecode(@$this->request->get['tungay']));
		if(@$tungay !="")
		{
			$where .= " AND ngaylap >= '".$tungay."'";
		}
		$denngay = @$this->date->formatViewDate(urldecode(@$this->request->get['denngay']));
		if(@$denngay !="")
		{
			$where .= " AND ngaylap <= '".$denngay." 24:00:00'";
		}
		
		$rows = @$this->model_quanlykho_phieunhapxuat->getList($where);
		//Page
		@$page = @$this->request->get['page'];		
		$x=$page;		
		$limit = 20;
		$total = count($rows); 
		// work out the pager values 
		@$this->data['pager']  = @$this->pager->pageLayoutAjax($total, $limit, $page,"#listphieunhap");
		
		$pager  = @$this->pager->getPagerData($total, $limit, $page); 
		$offset = $pager->offset; 
		$limit  = $pager->limit; 
		$page   = $pager->page;
		for($i=$offset;$i < $offset + $limit && @count(@$rows[$i])>0;$i++)
		//for($i=0; $i <= count(@$this->data['datas'])-1 ; $i++)
		{
			@$this->data['datas'][$i] = $rows[$i];
			@$this->data['datas'][$i]['link_edit'] = @$this->url->http('quanlykho/phieunhap/update&id='.@$this->data['datas'][$i]['id']);
			@$this->data['datas'][$i]['text_edit'] = "Sửa";
			;
			
		}
		@$this->data['refres']=$_SERVER['QUERY_STRING'];
		@$this->id='content';
		@$this->template="quanlykho/phieunhap_table.tpl";
		
		if(@$this->request->get['opendialog']=='true')
		{
			@$this->layout="";
			@$this->data['dialog'] = true;
			
		}
		@$this->render();
	}
	public function view()
	{
		$id = @$this->request->get['id'];
		if(@$id) 
		{
      		@$this->data['item'] = @$this->model_quanlykho_phieunhapxuat->getItem($id);
			
			$where = " AND phieuid = '".$id."' ORDER BY `vitri` ASC";
			@$this->data['data_nhapkho'] = @$this->model_quanlykho_phieunhapxuat->getPhieuNhapXuatMediaList($where);
			
			
    	}
		
		@$this->id='content';
		@$this->template='quanlykho/phieunhap_view.tpl';
		if(@$_GET['show']=="giamgia")
			@$this->template='quanlykho/phieuxuat_view1.tpl';
		if(@$_GET['opendialog'] == 'print')
			@$this->layout="layout/print";
		@$this->render();
	}
	
	private function getForm()
	{
		$id = @$this->request->get['id'];
		if(@$id) 
		{
      		@$this->data['item'] = @$this->model_quanlykho_phieunhapxuat->getItem($id);
			
			$where = " AND phieuid = '".$id."'  ORDER BY `vitri` ASC";
			@$this->data['data_nhapkho'] = @$this->model_quanlykho_phieunhapxuat->getPhieuNhapXuatMediaList($where);
    	}
		else
		{
			@$this->data['item']['ngaylap'] = @$this->date->getToday();
			if(isset($_SESSION['productlist']))
			{
				$medias = $_SESSION['productlist'];
				$i=0;
				
				foreach($medias as $media)
				{
					@$this->data['data_nhapkho'][$i]['mediaid']=$media['mediaid'];
					@$this->data['data_nhapkho'][$i]['code']=$media['code'];
					@$this->data['data_nhapkho'][$i]['title']=$media['title'];
					if(@$media['color'])
						@$this->data['data_nhapkho'][$i]['title'].= " - ".$media['color'];
					@$this->data['data_nhapkho'][$i]['soluong']=$media['qty'];
					@$this->data['data_nhapkho'][$i]['madonvi']=$media['unit'];
					$price = $media['price'];
					/*if(@$media['pricepromotion'])
						$price = $media['pricepromotion'];*/
					@$this->data['data_nhapkho'][$i]['giatien']=$price;
					$i++;
				}
			}
		}
		@$this->id='content';
		@$this->template='quanlykho/phieunhap_form.tpl';
		@$this->layout="layout/center";
		
		@$this->render();
	}
	
	public function save()
	{
		$data = @$this->request->post;
		//print_r($data);
		if(@$this->validateForm($data))
		{
			$nhanvien = @$this->user->getNhanVien();
			$data['ngaylap'] = @$this->date->formatViewDate($data['ngaylap']);
			$data['ngaythanhtoan'] = @$this->date->formatViewDate($data['ngaythanhtoan']);
			if(@$data['nguoithuchien']=="")
			{
				$data['nguoithuchienid'] = $nhanvien['id'];
				$data['nguoithuchien'] = $nhanvien['hoten'];
			}
			//$data['loaiphieu'] = @$this->loaiphieu;
			$data['id'] = @$this->model_quanlykho_phieunhapxuat->save($data);
			$phieu = @$this->model_quanlykho_phieunhapxuat->getItem($data['id']);
			
			
			$phieu['error'] = '';
			//@$this->model_quanlykho_phieunhapxuat->updateCol($phieuid,'tongtien',$tongtien);
			//@$this->model_quanlykho_phieunhapxuat->updateCol($phieuid,'congno',$tongtien- @$this->string->toNumber($data['thanhtoan']));
			@$this->data['output'] = json_encode($phieu);
			if(isset($_SESSION['productlist']))
			{
				unset($_SESSION['productlist']);	
			}
		}
		else
		{
			foreach(@$this->error as $item)
			{
				$phieu['error'] .= $item."<br>";
			}
			@$this->data['output'] = json_encode($phieu);
		}
		@$this->id='content';
		@$this->template='common/output.tpl';
		@$this->render();
	}
	
	private function validateForm($data)
	{
		
		
    	/*if(@$data['nguoithuchien'] == "")
		{
      		@$this->error['nguoithuchien'] = "Bạn chưa nhập người nhập";
    	}*/
		
		/*if(@$data['nguoigiao'] == "") 
		{
      		@$this->error['nguoigiao'] = "Bạn chưa nhập tên người giao";
    	}*/
		/*if(@$data['nguoinhan'] == "") 
		{
      		@$this->error['nguoinhan'] = "Bạn chưa nhập tên người nhận";
    	}*/

		if (count(@$this->error)==0) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
	}
	
	
	
	
	
	
	//Cac ham xu ly tren form
	public function getFileFormate()
	{
		require_once DIR_COMPONENT.'PHPExcel/Classes/PHPExcel.php';
		$objPHPExcel = new PHPExcel();
		$objPHPExcel->getProperties()->setCreator("Ho Lan Solutions")
							 ->setLastModifiedBy("Lư Thiết Hồ")
							 ->setTitle("Export data")
							 ->setSubject("Export data")
							 ->setDescription("")
							 ->setKeywords("Ho Lan Solutions")
							 ->setCategory("Product");
		$objPHPExcel->setActiveSheetIndex(0)
            
			->setCellValue('A1', 'Mã sản phẩm')
            ->setCellValue('B1', 'Tên sản phẩm')
			->setCellValue('C1', 'Màu sắc')
            ->setCellValue('D1', 'ĐVT')
			->setCellValue('E1', 'Số Lượng')
            ->setCellValue('F1', 'Giá')
			->setCellValue('G1', '% giảm giá')
			
			
			;
		$objPHPExcel->getActiveSheet()->getStyle('A1:G1')->getFont()->setBold(true);
		/*$objPHPExcel->getActiveSheet()->getStyle('A8')->getAlignment()->setWrapText(true);
		$objPHPExcel->getActiveSheet()->setCellValue('A8',"Hello\nWorld");
		$objPHPExcel->getActiveSheet()->getRowDimension(8)->setRowHeight(-1);
		$objPHPExcel->getActiveSheet()->getStyle('A8')->getAlignment()->setWrapText(true);*/
		
		$objPHPExcel->getActiveSheet()->setTitle('Product');
		$objPHPExcel->setActiveSheetIndex(0);
		//
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$filename = "nhapxuat.xls";
		$objWriter->save(DIR_CACHE.$filename);
		@$this->data['output'] = HTTP_IMAGE."cache/".$filename;
		
		@$this->id='content';
		@$this->template='common/output.tpl';
		@$this->render();
	}
	
}
?>