<?php
namespace MyApp\Model;
class Banner extends ModelBase
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
    public $image;

    /**
     *
     * @var string
     */
    public $text;

    public $text2;

    /**
     *
     * @var string
     */
    public $link;

    /**
     *
     * @var integer
     */
    public $deleted;

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
     * @var string
     */
    public $created_by;

    /**
     *
     * @var string
     */
    public $updated_by;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'banner';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Banner[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Banner
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
