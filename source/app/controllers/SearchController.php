<?php
namespace MyApp\Controllers;
use Phalcon\Mvc\View;
use MyApp\Model\Products;
use MyApp\Model\ProductCategories;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class SearchController extends ControllerBase
{
    public function indexAction() {
        $orderby = 'if(sale_price=0,price,sale_price) asc';
        $sortby = $this -> session -> get('sortby');
        if ($sortby == 1) {
            $orderby = 'if(sale_price=0,price,sale_price) asc';
        } elseif ($sortby == 2) {
            $orderby = 'if(sale_price=0,price,sale_price) desc';
        } else {
            $orderby = 'updated_at desc';
        }

        $strSearch = $this -> request -> get("strSearch");
        //$catId = $this -> request -> get("catId");
        $condition = " name like '%".trim(htmlspecialchars($strSearch, ENT_QUOTES))."%'";
        // if ($catId != "" && ctype_digit($catId)) {
        //     $condition .= " and category_id like '%,".$catId.",%'";
        // }
        $products = new Products();

        if (empty($_GET['page'])) {
               $currentPage  = 1;
        } else {
               $currentPage  = (int) $_GET['page'];
        }

        $paginator = new PaginatorModel (
            array(
                "data"  => $products -> search($condition, $orderby),
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
            )
        );

        // Get the paginated results
        $page = $paginator -> getPaginate();
        $this -> view -> data = $page;
        $this -> view -> currentPage = $currentPage;

        //$this -> view ->catId = $catId;
        $this -> view -> pageTitle = "Tìm kiếm '".(empty($strSearch) ? "tất cả sản phẩm" : $strSearch)."'";
        $this -> view -> strSearch = $strSearch;
        $this -> view -> titleForLayout = "Tìm kiếm ".$strSearch." - Hàng Xách Tay Conan";
        $this -> view -> saleKeyWords = "Tìm kiếm ".$strSearch." - Hàng Xách Tay Conan";
    }
}

