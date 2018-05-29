<?php
namespace MyApp\Controllers;
use Phalcon\Mvc\View;
use MyApp\Model\Products;
use MyApp\Model\CategoryDetails;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class CategorydetailController extends ControllerBase
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

        $categoryDetails = new CategoryDetails();
        $categoryDetail = $categoryDetails -> findById($id);
        $products = new Products();

        if (empty($_GET['page'])) {
               $currentPage  = 1;
        } else {
               $currentPage  = (int) $_GET['page'];
        }

        $paginator = new PaginatorModel (
            array(
                "data"  => $products -> findByCatelogyDetailAndLimit($id, 0, $orderby),
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
            )
        );

        // Get the paginated results
        $page = $paginator -> getPaginate();
        $this -> view -> data = $page;
        $this -> view -> currentPage = $currentPage;

        $this -> view -> pageTitle = $categoryDetail -> name;
        $this -> view -> titleForLayout = $categoryDetail -> name." - Hàng Xách Tay Conan";
        $this -> view -> saleKeyWords = $categoryDetail -> name;
    }
}

