<?php
class ModelModuleCustomertalkaboutus extends Model
{
    private $arr_col = array(
        'id',
        'customername',
        'customerinfo',
        'talkaboutus',
        'imagepath'
    );
    public function getItem($id, $where="")
    {
        $sql = "Select `customertalkaboutus`.*
									from `customertalkaboutus` 
									where id ='".$id."' ".$where;
        //$tb = @$this->document->select($sql);
        //return $tb[0];
        $query = @$this->db->query($sql);
        return $query->row;
    }

    public function getList($where="", $from=0, $to=0,$order="")
    {

        $sql = "Select `customertalkaboutus`.*
									from `customertalkaboutus` 
									where 1=1 " . $where;
        if(@$order=="")
        {
            $order = " Order by customername";

        }
        $sql.=$order;
        if(@$to > 0)
        {
            $sql .= " Limit ".$from.",".$to;
        }
        //$tb = @$this->document->select($sql);
        //return $tb;
        $query = @$this->db->query($sql);
        return $query->rows;
    }

    public function save($data)
    {
        $value = array();
        foreach(@$this->arr_col as $col)
        {
            $value[] = @$this->db->escape(@$data[$col]);
        }


        $field=@$this->arr_col;
        if((int)$data['id'] == 0)
        {
            $data['id'] = @$this->db->insertData("customertalkaboutus",$field,$value);
            //$data['id'] = @$this->document->insertData("customertalkaboutus",$field,$value);
        }
        else
        {
            $where="id = '".$data['id']."'";
            @$this->db->updateData("customertalkaboutus",$field,$value,$where);
            //@$this->document->updateData("customertalkaboutus",$field,$value,$where);
        }
        return $data['id'];
    }
    public function delete($id)
    {
        $where="id = '".$id."'";
        @$this->db->deleteData("customertalkaboutus",$where);
        //@$this->document->deleteData("customertalkaboutus",$where);
    }
}