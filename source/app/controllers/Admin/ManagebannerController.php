<?php
namespace MyApp\Controllers\Admin;
use MyApp\Model\Banner;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class ManagebannerController extends ControllerBase {

    public function indexAction() {
        $this -> view->titleForLayout   = "Banner";
        $this-> view->pageHeader        = "Banner";
        $this -> view -> title          = "Banner";
        $banner = new Banner();
        $banner = $banner -> findAll();

        if (empty($_GET["page"])) {
            $currentPage = 1;
        } else {
            $currentPage = (int) $_GET["page"];
        }
        $paginator = new PaginatorModel(
            array(
                "data"  => $banner,
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
            )
        );
        // Get the paginated results
        $page = $paginator->getPaginate();
        $this -> view -> data           = $page;
        $this -> view -> currentPage    = $currentPage;

    }

    public function addAction() {
        $this -> view->titleForLayout = "Add Banner";
        $this -> view->pageHeader      = "Add Banner";
        $this -> view -> title          = "Banner";


        if ($this->request->isPost()) {
            $image = $this -> request -> getPost('image');
            if($image == "") {
                $this -> flashSession->error("Can't save Banner. Please choose image.");
                return $this -> response -> redirect("/admin/managebanner/add");
            }
            $banner = new Banner();
            $banner -> image       = $image;
            $banner -> text        = $this -> request -> getPost('text');
            $banner -> text2        = $this -> request -> getPost('text2');
            $banner -> setParamsForNew($this->user['id']);

            if ($banner -> save()) {
                $this -> flashSession -> success("Save Banner successfully!");
            } else {
                $this -> flashSession->error("Can't save Banner");
                /*foreach ($posts->getMessages() as $message) {
                   echo $message, "\n";
                   exit();
                }*/
            }
            return $this -> response -> redirect("/admin/managebanner");
        }
    }


    public function editAction($id) {
        $this -> view->titleForLayout = "Edit Banner";
        $this-> view->pageHeader = "Edit Banner";
        $banner = new Banner();
        $banner = $banner -> findById($id);
        if($banner == false) {
            $this -> flashSession -> success("Can't found Banner!");
            return $this -> response -> redirect("/admin/managebanner/");
        }
        $this -> view -> banner = $banner;
        if ($this->request->isPost()) {
            $image = $this -> request -> getPost('image');
            if($image == "") {
                $this -> flashSession->error("Can't save Banner. Please choose image.");
                return $this -> response -> redirect("/admin/managebanner/edit/".$id);
            }
            $banner -> image       = $this -> request -> getPost('image');
            $banner -> text        = $this -> request -> getPost('text');
            $banner -> text2        = $this -> request -> getPost('text2');
            $banner -> setParamsForUpdate($this->user['id']);

            if ($banner -> save()) {
                $this -> flashSession -> success("Save Banner successfully!");
            } else {
                $this -> flashSession->error("Can't save Banner");
                /*foreach ($posts->getMessages() as $message) {
                   echo $message, "\n";
                   exit();
                }*/
            }
            return $this -> response -> redirect("/admin/managebanner");
        }
    }

    public function deleteAction($id) {
        $this->flashSession->clear();
        $banner = new Banner();
        if ($banner -> deleteById($id) == true ) {
            $this->flashSession->success("Delete banner successfully!");
        } else {
            $this->flashSession->error("Can't delete banner");
        }
        return $this->response->redirect("/admin/managebanner/");
    }
}