<?php
namespace MyApp\Controllers;
use Phalcon\Mvc\View;
use MyApp\Model\Products;
use MyApp\Model\Manufactures;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class ManufacturesController extends ControllerBase
{
    public function indexAction($id = 0) {
        $orderby = 'if(sale_price=0,price,sale_price) asc';
        $sortby = $this -> session -> get('sortby');
        if ($sortby == 1) {
            $orderby = 'if(sale_price=0,price,sale_price) asc';
        } elseif ($sortby == 2) {
            $orderby = 'if(sale_price=0,price,sale_price) desc';
        } else {
            $orderby = 'updated_at desc';
        }

        $productManufactures = new Manufactures();
        $manufacture = $productManufactures -> findById($id);
        $products = new Products();

        if (empty($_GET['page'])) {
               $currentPage  = 1;
        } else {
               $currentPage  = (int) $_GET['page'];
        }

        $paginator = new PaginatorModel (
            array(
                "data"  => $products -> findByManufacture($id, 0, $orderby),
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
            )
        );

        // Get the paginated results
        $page = $paginator -> getPaginate();
        $this -> view -> data = $page;
        $this -> view -> currentPage = $currentPage;
        $this -> view -> manufacture = $manufacture;

        $this -> view -> pageTitle = "Thương hiệu : ".$manufacture -> name;
        $this -> view -> titleForLayout = "Thương hiệu : ".$manufacture -> name." - Hàng Xách Tay Conan";
        $this -> view -> saleKeyWords = "Thương hiệu : ".$manufacture -> name;
    }

    public function allAction() {
        $orderby = 'if(sale_price=0,price,sale_price) asc';
        $sortby = $this -> session -> get('sortby');
        if ($sortby == 1) {
            $orderby = 'if(sale_price=0,price,sale_price) asc';
        } elseif ($sortby == 2) {
            $orderby = 'if(sale_price=0,price,sale_price) desc';
        } else {
            $orderby = 'updated_at desc';
        }

        $products = new Products();

        if (empty($_GET['page'])) {
               $currentPage  = 1;
        } else {
               $currentPage  = (int) $_GET['page'];
        }

        $paginator = new PaginatorModel (
            array(
                "data"  => $products -> findAll($orderby),
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
            )
        );

        // Get the paginated results
        $page = $paginator -> getPaginate();
        $this -> view -> data = $page;
        $this -> view -> currentPage = $currentPage;

        $this -> view -> pageTitle = "Tất cả sản phẩm";
        $this -> view -> titleForLayout = "Tất cả sản phẩm - Hàng Xách Tay Conan";
        $this -> view -> saleKeyWords = "Tất cả sản phẩm";
    }
}

