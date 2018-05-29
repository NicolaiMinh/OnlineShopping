<?php
namespace MyApp\Controllers\Admin;
use MyApp\Model\Manufactures;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use MyApp\Link;
class ManagemanufacturesController extends ControllerBase
{

    public function indexAction() {
        $this -> view -> titleForLayout = "Thương hiệu";
        $this -> view -> title     =  "Quản lý Thương hiệu";
        $this -> view -> pageHeader = "Quản lý Thương hiệu";

       $manufactures = new Manufactures();

       if (empty($_GET['page'])) {
               $currentPage  = -1;
       } else {
               $currentPage  = (int) $_GET['page'];
       }

       $paginator = new PaginatorModel (
                array(
                "data"  => $manufactures -> findAll(),
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
                )
        );

        // Get the paginated results
        $page = $paginator->getPaginate();
        $this -> view -> data = $page;
        $this -> view -> currentPage = $currentPage;
    }
    public function addAction() {
        $this -> view -> titleForLayout = "Thương hiệu";
        $this -> view -> title     =  "Thêm Thương hiệu";
        $this -> view -> pageHeader = "Thêm Thương hiệu";
        $this->flashSession->clear();
        if ($this->request->isPost()) {
            $manufactures = new Manufactures();
            $manufactures -> name = $this->request ->getPost('name');
            $manufactures -> slug = Link::getSlugLink($manufactures -> name);
            $manufactures -> setParamsForNew($this -> user['id']);
            if ($manufactures -> save()) {

                $this->flashSession->success("Thêm thành công!!");
                return $this->response->redirect("/admin/managemanufactures/");
            }

        }
    }
    public function editAction($id) {
        $this -> view -> titleForLayout = "Thương hiệu";
        $this -> view -> title     =  "Sửa Thương hiệu";
        $this -> view -> pageHeader = "Sửa Thương hiệu";
        $this->flashSession->clear();
        $manufactures = new Manufactures();
        $manufacture = $manufactures ->findById($id);
        if ($manufacture == false) {
            $this->flashSession->success("Không tìm thấy!!");
            return $this->response->redirect("admin/managecategories/");
        }
        $this -> view -> data = $manufacture;
        if ($this->request->isPost()) {

            $manufacture -> name = $this->request ->getPost('name');
            $manufacture -> slug = Link::getSlugLink($manufacture -> name);
            $manufacture -> setParamsForUpdate($this -> user['id']);

            if ($manufacture -> save()) {
                $this->flashSession->success("Sửa thành công!!!");
                return $this->response->redirect("/admin/managemanufactures/");
            }
        }
    }

    public function deleteAction($id) {

        $this->flashSession->clear();
        $manufactures = new Manufactures();
        if ($manufactures -> deleteById($id) == true ) {
            $this->flashSession->success("Xóa thành công!");
        } else {
            $this->flashSession->error("Không thể xóa");
        }
        return $this->response->redirect("/admin/managemanufactures");
    }

}
