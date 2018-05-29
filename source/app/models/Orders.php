<?php
namespace MyApp\Model;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as Email;

class Orders extends ModelBase
{

    /**
     *
     * @var string
     */
    public $id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $total_price;

    /**
     *
     * @var string
     */
    public $email;

    /**
     *
     * @var string
     */
    public $phone;

    /**
     *
     * @var string
     */
    public $address;

    /**
     *
     * @var string
     */
    public $note;

    /**
     *
     * @var string
     */
    public $updated_at;

    /**
     *
     * @var string
     */
    public $created_at;

    /**
     *
     * @var string
     */
    public $updated_by;

    /**
     *
     * @var string
     */
    public $created_by;

    /**
     *
     * @var integer
     */
    public $deleted;

    public function initialize() {

        // $this->belongsTo('province_id', 'MyApp\Model\Provinces', 'id', array(
            // 'alias' => 'province',
            // 'reusable' => true)
        // );
    }


    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
       
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Orders[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Orders
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }
    public function updatePaymentStatus($id) {
        $data = self::findFirst(array("id = :id: AND deleted = 0", "bind" => array("id" => $id)));
        if($data){
            $data -> payment_status = PAYMENT_SUCCESS;
            $data -> save ();
            return true;
        }
        return false;
    }
    public function findByUserId($id) {
        $data = self::find(array("belong_user_id = :id: AND deleted = 0", "bind" => array("id" => $id)));
        return $data;
    }

    public function findIncomceByDateBetween($dateFrom, $dateTo) {
        //$getSQL = "select sum(total_price) as total, belong_user_id from MyApp\Model\Orders orders where deleted = 0 and created_at BETWEEN '2016-05-06 00:00:0' and '2016-05-31 23:59:59' group by belong_user_id";
        $getSQL = "select sum(total_price) as total , users.* from MyApp\Model\Orders orders left join MyApp\Model\Users users on orders.belong_user_id = users.id where orders.created_at";
        $getSQL .= " BETWEEN '".$dateFrom." 00:00:0' and '".$dateTo." 23:59:59' group by orders.belong_user_id";
        $query = $this -> modelsManager -> createQuery($getSQL);
        return $query -> execute();
    }
    public function findIncomceByMonth($month) {

        $getSQL = 'select sum(total_price) as total , orders.* from MyApp\Model\Orders orders where';
        $getSQL .= ' orders.deleted = 0 and Month(orders.created_at) = '.$month;
        $getSQL .= ' group by orders.belong_user_id';
        $query = $this -> modelsManager -> createQuery($getSQL);
        return $query -> execute();
    }
    public function getTotalIncomeInYear($id, $year = 0) {
        if($year == 0) $year = date("Y");
        $getSQL = "SELECT sum(orders.total_price) as tt,MOnth(created_at) as m  FROM MyApp\Model\Orders orders WHERE belong_user_id = " . $id . " and year(created_at) = " . $year . " GROUP by MOnth(created_at)";
        $query = $this -> modelsManager -> createQuery($getSQL);
        $data = $query -> execute();
        $month = array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
        $n = count($data);
        $rs = array();
        for($i = 0; $i < $n; $i++) {

            $rs[] = array('m' => $month[($data[$i]-> m -1)], 'tt' => $data[$i]-> tt);
        }
        //echo "<pre>";
        //print_r($rs);exit;
        return $rs;
    }

    public function getByYear($id, $year) {
        $getSQL = "SELECT *  FROM MyApp\Model\Orders orders WHERE orders.belong_user_id = " . $id . " and year(orders.created_at) = " . $year;
        $query = $this -> modelsManager -> createQuery($getSQL);
        return $query -> execute();
    }

    public function getByMonth($id,$month,$year) {
        $getSQL = "SELECT *  FROM MyApp\Model\Orders orders WHERE orders.belong_user_id = " . $id . " and year(orders.created_at) = " . $year ." and month(orders.created_at) = " . $month;
        $query = $this -> modelsManager -> createQuery($getSQL);
        return $query -> execute();
    }

    public function getByDay ($id, $day, $month, $year) {
        $getSQL = "SELECT *  FROM MyApp\Model\Orders orders WHERE orders.belong_user_id = " . $id . " and year(orders.created_at) = " . $year ." and month(orders.created_at) = " . $month ." and day(orders.created_at) = " . $day;
        $query = $this -> modelsManager -> createQuery($getSQL);
        return $query -> execute();
    }

     public function genarationMonthlyIncomeUser($user_id, $month, $year) {
        $getSQL = 'select sum(orders.total_price) as total from MyApp\Model\Orders orders where';
        $getSQL .= ' orders.deleted = 0 and Month(orders.created_at) = '.$month .' and year (orders. created_at) ='. $year ;
        $getSQL .= ' and orders.belong_user_id = ' . $user_id;
        $query = $this -> modelsManager -> createQuery($getSQL);
        return $query -> execute();
    }

    public function calculateMonthlyIncome($month, $year) {
        $getSQL = 'select u.id, IFNULL(SUM(o.total_price),0) as total ';
        $getSQL .= ' from MyApp\Model\Users u ';
        $getSQL .= ' left join MyApp\Model\Orders o';
        $getSQL .= ' on o.belong_user_id = u.id AND Month(o.created_at) = '.$month .' and year (o.created_at) = '. $year .' AND o.deleted = 0';
        $getSQL .= ' where u.role_id IN('.GROUP_SALER.','.GROUP_MEMBER.') and u.deleted = 0';
        $getSQL .= ' Group by u.id';
        $query = $this -> modelsManager -> createQuery($getSQL);
        return $query -> execute();
    }

}
