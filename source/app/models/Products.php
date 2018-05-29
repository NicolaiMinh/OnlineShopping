<?php
namespace MyApp\Model;
use Phalcon\Mvc\Model;
class Products extends ModelBase
{

    /**
     *
     * @var string
     */
    public $id;

    public $category_id;

    public $rating;

    public $count_rating;
    public $benefits;
    public $specifications;
    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $banner;

    /**
     *
     * @var string
     */
    public $price;

    /**
     *
     * @var string
     */
    public $sale_price;

    /**
     *
     * @var string
     */
    public $image_thumbnail;

    /**
     *
     * @var string
     */
    public $image_slides;

    /**
     *
     * @var string
     */
    public $description;
    public $short_description;
    public $status;
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
     * @var string
     */
    public $deleted;

    public function initialize() {

        $this->belongsTo('category_id', 'MyApp\Model\Categories', 'id', array(
            'alias' => 'category',
            'reusable' => true)
        );

        $this->belongsTo('collection_id', 'MyApp\Model\Collections', 'id', array(
            'alias' => 'collection',
            'reusable' => true)
        );
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'products';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Products[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Products
     */
    public function findByCategory($categoryId, $limit = 0, $order='updated_at DESC') {
        if($limit == 0){
            return self::find(array(" category_id = ".$categoryId." AND deleted = 0",
                                    "order" => $order));
        } else {
            return self::find(array("category_id = ".$categoryId." AND deleted = 0",
                                "order" => $order, "limit" => $limit ));
        }
    }

    public function findByManufacture($manufactureId, $limit = 0, $order='updated_at DESC') {
        if($limit == 0){
            return self::find(array(" manufacture_id = ".$manufactureId." AND deleted = 0",
                                    "order" => $order));
        } else {
            return self::find(array("manufacture_id = ".$manufactureId." AND deleted = 0",
                                "order" => $order, "limit" => $limit ));
        }
    }

    public function findByStatus($status, $limit = 0, $order='updated_at DESC') {
        if($limit == 0){
            return self::find(array(" status = ".$status." AND deleted = 0",
                                    "order" => $order));
        } else {
            return self::find(array("status = ".$status." AND deleted = 0",
                                "order" => $order, "limit" => $limit ));
        }
    }

    public function findBySale($limit = 0, $order='updated_at DESC') {
        if($limit == 0){
            return self::find(array(" sale_price <> 0 AND deleted = 0",
                                    "order" => $order));
        } else {
            return self::find(array(" sale_price <> 0 AND deleted = 0",
                                "order" => $order, "limit" => $limit ));
        }
    }

    public function findRelateCategory($id, $categoryIds, $limit = 0) {

        $category = explode(",", substr($categoryIds, 1, -1));
        $getSQL = "SELECT * FROM MyApp\Model\Products p WHERE p.deleted = 0 AND p.id NOT IN (".$id.")";

        $likeSQL = "";
        foreach ($category as $cate) {
            $likeSQL .= " p.category_detail_ids like '%," . $cate . ",%' OR ";
        }
        $getSQL .= !empty($likeSQL) ? " AND (".substr($likeSQL, 0, -3).")" : "";
        $getSQL .= " ORDER BY p.updated_at";
        $getSQL .= $limit == 0 ? "" : (" LIMIT ".$limit);
        $query = $this -> modelsManager -> createQuery($getSQL);
        return $query -> execute();
    }

    public function findByCatelogyDetailAndLimit($categoryDetailId, $limit = 0, $order='updated_at DESC') {
        if($limit == 0){
            return self::find(array(" category_detail_ids like '%,".$categoryDetailId.",%' AND deleted = 0",
                                    "order" => $order));
        } else {
            return self::find(array("category_detail_ids like '%,".$categoryDetailId.",%' AND deleted = 0",
                                "order" => $order, "limit" => $limit ));
        }
    }

    public function search($sql, $order='updated_at DESC') {
        $getSQL = "SELECT * FROM MyApp\Model\Products where " .$sql. " AND deleted = 0 order by ".$order;
        $query = $this -> modelsManager -> createQuery($getSQL);
        return $query -> execute();

    }


}
