<?php
namespace MyApp\Model;
use Phalcon\Mvc\Model;


class Manufactures extends ModelBase {
    public $id;
    public $name;
    public $slug;
    public $created_by;
    public $updated_by;
    public $created_at;
    public $updated_at;
    public $deleted;

    public function initialize() {
    }
}