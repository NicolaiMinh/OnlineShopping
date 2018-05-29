<?php
namespace MyApp\Controllers\Admin;
use MyApp\Model\CategoryDetails;
use MyApp\Model\Categories;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use MyApp\Link;
class ManagecategorydetailsController extends ControllerBase
{

    public function indexAction() {
        $this -> view -> titleForLayout = "Category Detail";
        $this -> view -> title     =  "Manager Category Detail";
        $this -> view -> pageHeader = "Quản lý Chi tiết danh mục";

       $categoryDetail = new CategoryDetails();

       if (empty($_GET['page'])) {
               $currentPage  = 1;
       } else {
               $currentPage  = (int) $_GET['page'];
       }

       $paginator = new PaginatorModel (
                array(
                "data"  => $categoryDetail -> findAll(),
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
        $this -> view -> titleForLayout = "category detail";
        $this -> view -> title     =  "Add category detail";
        $this -> view -> pageHeader = "Thêm Chi tiết danh mục";
        $this->flashSession->clear();

        $categories = new categories();
        $categories = $categories -> findAll();
        $this -> view -> categories = $categories;
        if ($this->request->isPost()) {
            $categoryDetail = new CategoryDetails();
            $categoryDetail -> name = $this->request ->getPost('categorydetail_name');
            $categoryDetail -> category_id = $this->request ->getPost('category_name');
            $categoryDetail -> slug = Link::getSlugLink($categoryDetail -> name);
            $categoryDetail -> setParamsForNew($this -> user['id']);
            if ($categoryDetail -> save()) {

                $this->flashSession->success("save Category successfully!");
                return $this->response->redirect("/admin/managecategorydetails/");
            }

        }
    }
    public function editAction($id) {
        $this -> view -> titleForLayout = "category detail";
        $this -> view -> title     =  "Edit category detail";
        $this -> view -> pageHeader = "Sửa Chi tiết danh mục";
        $this->flashSession->clear();

        $categories = new categories();
        $categories = $categories -> findAll();
        $this -> view -> categories = $categories;

        $categoryDetail = new CategoryDetails();
        $categoryDetail = $categoryDetail ->findById($id);
        if ($categoryDetail == false) {
            $this->flashSession->success("Can't found category detail!");
            return $this->response->redirect("admin/managecategorydetails/");
        }
        $this -> view -> data = $categoryDetail;
        if ($this->request->isPost()) {

            $categoryDetail -> name = $this->request ->getPost('categorydetail_name');
            $categoryDetail -> category_id = $this->request ->getPost('category_name');
            //$categoryDetail -> slug = Link::getSlugLink($categoryDetail -> name);
            $categoryDetail -> setParamsForUpdate($this -> user['id']);

            if ($categoryDetail -> save()) {
                $this->flashSession->success("edit category detail successfully!");
                return $this->response->redirect("/admin/managecategorydetails/");
            }
        }
    }

    public function deleteAction($id) {

        $this->flashSession->clear();
        $categoryDetail = new CategoryDetails();
        if ($categoryDetail -> deleteById($id, $this->user['id']) == true ) {
            $this->flashSession->success("Delete category detail successfully!");
        } else {
            $this->flashSession->error("Can't delete category detail");
        }
        return $this->response->redirect("/admin/managecategorydetails");
    }

}
