<?php
namespace MyApp\Controllers;
use Phalcon\Mvc\View;
use MyApp\Model\Banner;
use MyApp\Model\Categories;

class HomeController extends ControllerBase
{
    public function indexAction() {

	    $banner = new Banner();
	    $ban = $banner -> findAll();

	    $this -> view -> bannerList = $ban;

	    $categories = new Categories();
	    $this ->view -> categoryList = $categories -> findByLimit(4);
    }

}

