<?php
namespace MyApp\Model;
use Phalcon\Mvc\Model;
class OrderDetails extends ModelBase
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
    public $order_id;

    /**
     *
     * @var string
     */
    public $product_id;

    /**
     *
     * @var string
     */
    public $price;

    /**
     *
     * @var integer
     */
    public $quantity;

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

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'order_details';
    }

    public function initialize() {

        $this->belongsTo('order_id', 'MyApp\Model\Oders', 'id', array(
            'alias' => 'oder',
            'reusable' => true)
        );
        $this->belongsTo('product_id', 'MyApp\Model\Products', 'id', array(
            'alias' => 'product',
            'reusable' => true)
        );
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return OrderDetails[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return OrderDetails
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function findByOrderId($orderId) {
        return self::find(array("order_id = :order_id: AND deleted = 0", "order" => "updated_at DESC",
                        "bind" => array("order_id" => $orderId)));
    }

}
