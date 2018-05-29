<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Mvc\View;
use MyApp\Model\Products;
use MyApp\Model\Manufactures;
use MyApp\Model\Categories;
use MyApp\Model\CategoryDetails;
use MyApp\Link;
use MyApp\UploadFile;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class ManageproductsController extends ControllerBase {

    public function indexAction() {

        $sName = $this -> request -> get("sName");
        $sCate = $this -> request -> get("sCate");
        $sManu = $this -> request -> get("sManu");
        //$catId = $this -> request -> get("catId");
        $condition = " name like '%".trim(htmlspecialchars($sName, ENT_QUOTES))."%'";
        if (is_numeric($sCate) && $sCate > 0) {
            $condition .= " and category_id = ".$sCate;
        }
        if (is_numeric($sManu) && $sManu > 0) {
            $condition .= " and manufacture_id = ".$sManu;
        }

        $products = new Products();
        $products = $products -> search($condition);

        $categories = new Categories();
        $categoryList = $categories -> findAll();

        $manufactures = new Manufactures();
        $manufactureList = $manufactures -> findAll();

        if (empty($_GET["page"])) {
            $currentPage = 1;
        } else {
            $currentPage = (int) $_GET["page"];
        }
        $paginator = new PaginatorModel(
            array(
                "data"  => $products,
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
            )
        );

        // Get the paginated results
        $page = $paginator->getPaginate();
        $this -> view -> data         = $page;
        $this -> view -> currentPage  = $currentPage;
        $this -> view -> titleForLayout = "Quản lý sản phẩm";
        $this -> view -> pageHeader = "Quản lý sản phẩm";
        $this -> view -> categoryList = $categoryList;
        $this -> view -> manufactureList = $manufactureList;
        $this -> view -> sName = $sName;
        $this -> view -> sCate = $sCate;
        $this -> view -> sManu = $sManu;

    }

    public function addAction() {
        $this -> view->titleForLayout = "Thêm sản phẩm";
        $this -> view->pageHeader = "Thêm sản phẩm";
        $this -> flashSession -> clear();
        $manufactures = new Manufactures();
        $this -> view -> manufactures = $manufactures -> findAll();

        $categories = new Categories();
        $this -> view -> categories = $categories -> findAll();

        $categoryDetails = new CategoryDetails();
        $this -> view -> categoryDetailList = $categoryDetails -> findAll();

        if ($this->request->isPost()) {

            $products = new Products();

            $products -> name               = htmlspecialchars($this -> request -> getPost('name'), ENT_QUOTES);
            $products -> slug               = Link::getLink($this -> request -> getPost('name'));
            $products -> price              = $this -> request -> getPost('price');
            $products -> sale_price         = $this -> request -> getPost('sale_price');
            $products -> image_thumbnail    = $this -> request -> getPost('image_thumbnail');
            $products -> description        = htmlspecialchars($this -> request -> getPost('description'), ENT_QUOTES);
            $products -> short_description  = htmlspecialchars($this -> request -> getPost('short_description'), ENT_QUOTES);
            $products -> image_slides       = implode(",", $this -> request -> getPost('images'));
            $products -> category_id        = $this -> request -> getPost('category');
            $products -> manufacture_id        = $this -> request -> getPost('manufacture');
            $products -> category_detail_ids = ','.implode(",", $this -> request -> getPost('category_detail')).',';
            $products -> status             = $this -> request -> getPost('status');

            //$products -> category_id       = implode(",", $this -> request -> getPost('category_id'));

            $products -> setParamsForNew($this->user['id']);
            if ($products -> save()) {
                $this -> flashSession -> success("Thêm sản phẩm thành công!");
            } else {
                $this -> flashSession -> error("Không thể lưu sản phẩm, có thể bạn chưa chọn slide image.\n Hoặc hãy xem lại thông tin đã nhập !!!");
                /*foreach ($products->getMessages() as $message) {
                   echo $message, "\n";
                   exit();
                }*/
            }
            return $this -> response -> redirect("/admin/manageproducts/");
        }
    }

    public function editAction($id) {
        $this -> view->titleForLayout = "Chỉnh sửa sản phẩm";
        $this-> view->pageHeader = "Chỉnh sửa sản phẩm";

        $products = new Products();
        $product = $products -> findById($id);
        $this -> flashSession -> clear();

        $manufactures = new Manufactures();
        $this -> view -> manufactures = $manufactures -> findAll();

        $categories = new Categories();
        $this -> view -> categories = $categories -> findAll();
        
        $categoryDetails = new CategoryDetails();
        $this -> view -> categoryDetailList = $categoryDetails -> findAll();

        if ($product == false) {
            $this -> flashSession -> error("Can't found Product");
            return $this -> response -> redirect("/admin/manageproducts/");
        }
        $this -> view -> data = $product;
        if ($this->request->isPost()) {

            //print_r($this -> request-> getPost());
            //exit;

            $product -> name               = htmlspecialchars($this -> request -> getPost('name'), ENT_QUOTES);
            $product -> price              = $this -> request -> getPost('price');
            $product -> sale_price         = $this -> request -> getPost('sale_price');
            $product -> image_thumbnail    = $this -> request -> getPost('image_thumbnail');
            $product -> description        = htmlspecialchars($this -> request -> getPost('description'), ENT_QUOTES);
            $product -> short_description  = htmlspecialchars($this -> request -> getPost('short_description'), ENT_QUOTES);
            $product -> image_slides       = implode(",", $this -> request -> getPost('images'));
            $product -> category_id        = $this -> request -> getPost('category');
            $product -> manufacture_id        = $this -> request -> getPost('manufacture');
            $product -> category_detail_ids = ','.implode(",", $this -> request -> getPost('category_detail')).',';
            $product -> status             = $this -> request -> getPost('status');

            $product -> setParamsForUpdate($this->user['id']);

            if ($product -> save()) {
                $this -> flashSession -> success("Lưu sản phẩm thành công!");
            } else {
                $this -> flashSession->error("Không thể lưu sản phẩm, có thể bạn chưa chọn slide image.\n Hoặc hãy xem lại thông tin đã nhập !!!");
                /*foreach ($product->getMessages() as $message) {
                   echo $message, "\n";
                   exit();
                }*/
            }
            return $this -> response -> redirect("/admin/manageproducts/");
        }
    }

    public function deleteAction($id) {
        $products = new Products();
        $this -> flashSession -> clear();
        if ($products -> deleteById($id) == true ) {
            $this->flashSession->success("Xóa sản phẩm thành công!");
        } else {
            $this->flashSession->error("Can't delete Product");
        }
        return $this->response->redirect("/admin/manageproducts/");
    }
}