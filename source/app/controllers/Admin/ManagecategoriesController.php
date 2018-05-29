<?php
namespace MyApp\Controllers\Admin;
use MyApp\Model\Categories;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use MyApp\Link;
class ManagecategoriesController extends ControllerBase
{

    public function indexAction() {
        $this -> view -> titleForLayout = "Danh mục";
        $this -> view -> title     =  "Quản lý Danh mục";
        $this -> view -> pageHeader = "Quản lý Danh mục";

       $categories = new Categories();

       if (empty($_GET['page'])) {
               $currentPage  = -1;
       } else {
               $currentPage  = (int) $_GET['page'];
       }

       $paginator = new PaginatorModel (
                array(
                "data"  => $categories -> findAll(),
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
        $this -> view -> titleForLayout = "Danh mục";
        $this -> view -> title     =  "Thêm Danh mục";
        $this -> view -> pageHeader = "Thêm Danh mục";
        $this->flashSession->clear();
        if ($this->request->isPost()) {
            $categories = new Categories();
            $categories -> name = $this->request ->getPost('name');
            $categories -> slug = Link::getSlugLink($categories -> name);
            $categories -> setParamsForNew($this -> user['id']);
            if ($categories -> save()) {

                $this->flashSession->success("Thêm thành công!!");
                return $this->response->redirect("/admin/managecategories/");
            }

        }
    }
    public function editAction($id) {
        $this -> view -> titleForLayout = "Danh mục";
        $this -> view -> title     =  "Sửa Danh mục";
        $this -> view -> pageHeader = "Sửa Danh mục";
        $this->flashSession->clear();
        $categories = new Categories();
        $category = $categories ->findById($id);
        if ($category == false) {
            $this->flashSession->success("Không tìm thấy!!");
            return $this->response->redirect("admin/managecategories/");
        }
        $this -> view -> data = $category;
        if ($this->request->isPost()) {

            $category -> name = $this->request ->getPost('name');
            $category -> slug = Link::getSlugLink($category -> name);
            $category -> setParamsForUpdate($this -> user['id']);

            if ($category -> save()) {
                $this->flashSession->success("Sửa thành công!!!");
                return $this->response->redirect("/admin/managecategories/");
            }
        }
    }

    public function deleteAction($id) {

        $this->flashSession->clear();
        $categories = new Categories();
        if ($categories -> deleteById($id) == true ) {
            $this->flashSession->success("Xóa thành công!");
        } else {
            $this->flashSession->error("Không thể xóa");
        }
        return $this->response->redirect("/admin/managecategories");
    }

}
