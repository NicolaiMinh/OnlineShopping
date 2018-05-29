<?php
namespace MyApp\Controllers;
use Phalcon\Mvc\View;
use MyApp\Model\Products;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class NewproductsController extends ControllerBase
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

        $products = new Products();

        if (empty($_GET['page'])) {
               $currentPage  = 1;
        } else {
               $currentPage  = (int) $_GET['page'];
        }

        $paginator = new PaginatorModel (
            array(
                "data"  => $products -> findByLimit(GET_NEW_PRODUCT,0,$orderby),
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
            )
        );

        // Get the paginated results
        $page = $paginator -> getPaginate();
        $this -> view -> data = $page;
        $this -> view -> currentPage = $currentPage;
        $this -> view -> titleForLayout = "Sản phẩm mới - Hàng Xách Tay Conan";
        $this -> view -> saleKeyWords = "Sản phẩm mới - Hàng Xách Tay Conan";
        $this -> view -> pageTitle = "Sản phẩm mới";
    }

    public function ajaxChangeViewAction()
    {
        if ($this -> request -> isPost()) {
            $view = $this -> request -> getPost('view');
            if ($view == 'list') {
                $this -> session -> set('viewlayout', 'list');
            } else {
                $this -> session -> set('viewlayout', 'grid');
            }
            // $this -> view -> viewlayout = $this -> session -> get('viewlayout');
            echo json_encode(array('error' => 0));
            exit;
        }
    }

    public function ajaxChangeSortAction() {
        if ($this -> request -> isPost()) {
            $sortby = $this -> request -> getPost('sortby');

            if (!is_numeric($sortby)) {
                $this -> session -> set('sortby', 1);
                echo json_encode(array('error' => 0, 'sortby' => $sortby));
                exit;
            }

            if ($sortby == 2) {
                $this -> session -> set('sortby', 2);
                echo json_encode(array('error' => 0, 'sortby' => $sortby));
                exit;
            } elseif ($sortby == 3) {
                $this -> session -> set('sortby', 3);
                echo json_encode(array('error' => 0, 'sortby' => $sortby));
                exit;
            }
            $this -> session -> set('sortby', 1);
            echo json_encode(array('error' => 0, 'sortby' => $sortby));
            exit;
        }
    }
}

