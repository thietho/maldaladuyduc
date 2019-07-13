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
        $this->load->model("module/customertalkaboutus");
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

}
?>