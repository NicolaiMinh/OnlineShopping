<?php
namespace MyApp\Model;
use Phalcon\Mvc\Model;

class Contacts extends ModelBase
{

    /**
     *
     * @var string
     */
    public $id;

    public $product_id;
    public $user_id;

    /**
     *
     * @var string
     */
    public $name;

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
    public $message;


    /**
     *
     * @var string
     */
    public $created_by;

    /**
     *
     * @var string
     */
    public $updated_by;

    /**
     *
     * @var string
     */
    public $created_at;

    /**
     *
     * @var string
     */
    public $updated_at;

    /**
     *
     * @var integer
     */
    public $deleted;

    public function initialize() {

        $this->belongsTo('product_id', 'MyApp\Model\Products', 'id', array(
            'alias' => 'product',
            'reusable' => true)
        );

        $this->belongsTo('user_id', 'MyApp\Model\Users', 'id', array(
            'alias' => 'user',
            'reusable' => true)
        );
    }
    public function findByUserId($id) {
        return self::find(array("user_id = :id: AND deleted = 0", "bind" => array("id" => $id), "order" => "updated_at DESC"));
    }

}
