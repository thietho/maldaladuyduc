<?php
/**
 * Class ControllerModuleCustomertalkaboutus
 * @property ModelModuleCustomertalkaboutus model_module_customertalkaboutus
 * @property Document document
 * @property Response response
 * @property Request request
 * @property Pager pager
 *
 */
class ControllerAddonCustomertalkaboutus extends Controller
{
    private $error = array();
    function __construct()
    {
        $this->load->model("module/customertalkaboutus");
        $this->load->helper('image');

    }
    public function getList()
    {
        $this->data['datas'] = array();
        $where = "";
        $rows = $this->model_module_customertalkaboutus->getList($where);
        for($i=0; $i < count($rows) ; $i++)
        {
            $this->data['datas'][$i] = $rows[$i];
            $this->data['datas'][$i]['imagethumbnail'] = HelperImage::resizePNG($rows[$i]['imagepath'], 100, 0);

        }
        $this->id='content';
        $this->template="home/customertalkaboutus.tpl";
        $this->render();
    }

}
?>