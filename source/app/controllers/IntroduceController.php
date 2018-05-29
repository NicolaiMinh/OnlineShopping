<?php
namespace MyApp\Controllers;
use Phalcon\Mvc\View;
use MyApp\Model\Products;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class IntroduceController extends ControllerBase
{
    public function indexAction() {
        
        $this -> view -> titleForLayout = "Giới thiệu về chúng tôi - Hàng Xách Tay Conan";
        $this -> view -> saleKeyWords = "Giới thiệu về chúng tôi - Hàng Xách Tay Conan";
        $this -> view -> pageTitle = "Giới thiệu về chúng tôi";
    }
}

