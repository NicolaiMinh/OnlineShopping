<?php
namespace MyApp\Model;
use Phalcon\Mvc\Model;
class Posts extends ModelBase
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
    public $slug;

    /**
     *
     * @var string
     */
    public $content;

    /**
     *
     * @var string
     */
    public $description;

    /**
     *
     * @var string
     */
    public $site_id;

    /**
     *
     * @var integer
     */
    public $status;

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
    public $created_by;

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

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'posts';
    }

    public function findBySiteId($siteId) {
        return self::find(array("site_id = :site_id: AND deleted = 0" ,
                    "order"  => "updated_at DESC",
                    "bind" => array("site_id" => $siteId)
                ));
    }
}
