<?php
class M_tahun extends CI_Model
{
    var $_table = 'tahun_berkas';
    var $table = 'tahun_berkas rk';
    var $column_order = array('rk.thn_id', 'rk.thn_status'); //set column field database for datatable orderable
    var $column_search = array('rk.thn_id', 'rk.thn_status'); //set column field database for datatable searchable
    var $order = array('rk.thn_id' => 'asc'); // default order
    public function __construct()
    {
        parent::__construct();
    }
    private function _get_datatables_query($param='')
    {
        $this->db->from($this->table);
    
        $i = 0;
        foreach ($this->column_search as $item) // loop column
        {
            if($_POST['search']['value']) // if datatable send POST for search
            {
                if($i===0) // first loop
                {
                    $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                    $this->db->like($item, $_POST['search']['value']);
                }
                else
                {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
                if(count($this->column_search) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $i++;
        }
        if(isset($_POST['order'])) // here order processing
        {
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        }
        else if(isset($this->order))
        {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }
    function get_datatables($param='')
    {
        $this->_get_datatables_query($param);
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }
    function count_filtered($param='')
    {
        $this->_get_datatables_query($param);
        $query = $this->db->get();
        return $query->num_rows();
    }
    public function count_all($param='')
    {
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }
    public function all(){
        return $this->db->order_by('thn_id','asc')->get('tahun_berkas');
    }
    public function by_id($id){
        return $this->db->from('tahun_berkas')
            ->where('thn_id',$id)->get();
    }
    public function update($id){
        $this->db->trans_begin();
            $tahun['thn_id'] = $this->input->post('tahun',TRUE);
            $tahun['thn_status'] = $this->input->post('status',TRUE);
            if ($tahun['thn_status']==1){
                $this->db->update('tahun_berkas',['thn_status'=>0]);
            }
            $this->db->where('thn_id',$id)->update('tahun_berkas',$tahun);
        if ($this->db->trans_status()===FALSE){
            $this->db->trans_rollback();
            return FALSE;
        }else{
            $this->db->trans_commit();
            return TRUE;
        }
    }
    public function delete($data){
        $this->db->trans_begin();
            $this->db->delete('tahun_berkas',$data);
        if ($this->db->trans_status()===FALSE){
            $this->db->trans_rollback();
            return FALSE;
        }else{
            $this->db->trans_commit();
            return TRUE;
        }
    }
    public function insert(){
        $this->db->trans_begin();
            $tahun['thn_id'] = $this->input->post('tahun',TRUE);
            $tahun['thn_status'] = $this->input->post('status',TRUE);
            if ($tahun['thn_status']==1){
                $this->db->update('tahun_berkas',['thn_status'=>0]);
            }
            $this->db->insert('tahun_berkas',$tahun);
        if ($this->db->trans_status()===FALSE){
            $this->db->trans_rollback();
            return FALSE;
        }else{
            $this->db->trans_commit();
            return TRUE;
        }
    }
    
}