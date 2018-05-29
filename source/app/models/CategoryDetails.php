<?php
namespace MyApp\Model;
use Phalcon\Mvc\Model;

class CategoryDetails extends ModelBase {
    public $id;
    public $name;
    public $slug;
    public $category_id;
    public $created_by;
    public $updated_by;
    public $created_at;
    public $updated_at;
    public $deleted;

    public function initialize() {
        $this->belongsTo('category_id', 'MyApp\Model\Categories', 'id', array(
            'alias' => 'category',
            'reusable' => true)
        );
    }

    // ids : ,1,2,3,4
    public function findByIds($ids) {
        $ids = substr($ids, 1, -1);
        $sql = 'select * from MyApp\Model\CategoryDetails c where c.deleted = 0 AND ';
        $sql .= 'c.id IN ('.$ids.') order by c.id ASC';
        $query = $this->modelsManager->createQuery($sql);
        return $query->execute();
    }

    public function findByCategoryId($categoryId) {
    	return self::find(array("category_id = :category_id: AND deleted = 0", 
    							"order" => "updated_at DESC",
    							"bind" => array("category_id" => $categoryId)));
    }

    public function findByCategoryIdAndLimit($categoryId, $limit) {
        return self::find(array("category_id = :category_id: AND deleted = 0", 
                                "limit" => $limit,
                                "order" => "updated_at DESC",
                                "bind" => array("category_id" => $categoryId)));
    }
}