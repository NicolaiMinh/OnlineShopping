<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Mvc\View;
use MyApp\Model\Orders;
use MyApp\Model\OrderDetails;
use MyApp\Link;
use MyApp\UploadFile;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class ManageordersController extends ControllerBase {

    public function indexAction() {

        $orders = new Orders();
        $orderList = $orders -> findAll();

        if (empty($_GET["page"])) {
            $currentPage = 1;
        } else {
            $currentPage = (int) $_GET["page"];
        }
        $paginator   = new PaginatorModel(
            array(
                "data"  => $orderList,
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
            )
        );

        // Get the paginated results
        $page = $paginator -> getPaginate();
        $this -> view -> data        = $page;
        $this -> view -> currentPage = $currentPage;
        $this -> view -> titleForLayout = "Đơn hàng";
        $this -> view -> pageHeader = "Đơn hàng";
    }


    public function detailAction($id) {
        $this -> view->titleForLayout = "Quản lý chi tiết đơn hàng";
        $this-> view->pageHeader = "Quản lý chi tiết đơn hàng";
        $this -> flashSession -> clear();

        $orders = new Orders();
        $order = $orders -> findById($id);
        if($order == false) {
            return $this -> response -> redirect("/admin/manageorders");
        }
        $this -> view -> data = $order;

        $orderDetails = new OrderDetails();
        $orderDetails = $orderDetails -> findByOrderId($order -> id);
        $this -> view -> orderDetails = $orderDetails;
    }


    public function updateorderAction($orderId, $status) {
        $orders = new Orders();
        $order = $orders -> findById($orderId);
        if($order == false) {
            return $this -> response -> redirect("/admin/manageorders");
        }
        $order -> status = $status;
        if ($order->save() == false) {
            $this->flashSession->error("Không thể lưu Trạng thái");
        } else {
            $this->flashSession->success("Lưu Trạng thái thành công!");
        }
        return $this->response->redirect("/admin/manageorders/detail/".$orderId);
    }
}