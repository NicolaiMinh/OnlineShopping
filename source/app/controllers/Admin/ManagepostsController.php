<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Mvc\View;
use MyApp\Model\Posts;
use MyApp\Link;
use MyApp\UploadFile;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class ManagepostsController extends ControllerBase {

    public function indexAction() {

        $posts = new Posts();
        $postList = $posts -> findAll();

        if (empty($_GET["page"])) {
            $currentPage = 1;
        } else {
            $currentPage = (int) $_GET["page"];
        }
        $paginator   = new PaginatorModel(
            array(
                "data"  => $postList,
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
            )
        );

        // Get the paginated results
        $page = $paginator->getPaginate();
        $this -> view -> data        = $page;
        $this -> view -> currentPage = $currentPage;
        $this -> view->titleForLayout = "Posts";
        $this-> view->pageHeader = "Posts";
    }

    public function addAction() {
        $this -> view->titleForLayout = "Create New Post";
        $this-> view->pageHeader = "Create New Post";
        $this -> flashSession -> clear();
        if ($this->request->isPost()) {

            $upload = new UploadFile();
            $posts = new Posts();

            $posts -> name        = $this -> request -> getPost('name');
            $posts -> slug        = Link::getLink($this -> request -> getPost('name'));
            $posts -> description = $this -> request -> getPost('description');
            $posts -> content     = $this -> request -> getPost('content');
            $posts -> status      = $this -> request -> getPost('status');
            $posts -> setParamsForNew($this->user['id']);

            $posts -> image     = $this -> request -> getPost('image');

            if ($posts -> save()) {
                $this -> flashSession -> success("Save Post successfully!");
            } else {
                $this -> flashSession->error("Can't save Post");
                /*foreach ($posts->getMessages() as $message) {
                   echo $message, "\n";
                   exit();
                }*/
            }
            return $this -> response -> redirect("/admin/manageposts/");
        }
    }

    public function editAction($id) {
        $this -> view->titleForLayout = "Edit Post";
        $this-> view->pageHeader = "Edit Post";

        $posts = new Posts();
        $post = $posts -> findById($id);
        if($post == false) {
            $this -> flashSession -> success("Can't found Post!");
            return $this -> response -> redirect("/admin/manageposts/");
        }
        $this -> view -> post = $post;
        $this -> flashSession -> clear();
        if ($this->request->isPost()) {

            $post -> name        = $this -> request -> getPost('name');
            //$post -> slug        = Link::getSlugLink($this -> request -> getPost('name'));
            $post -> description = $this -> request -> getPost('description');
            $post -> content     = $this -> request -> getPost('content');
            $post -> status      = $this -> request -> getPost('status');
            $post -> image      = $this -> request -> getPost('image');
            $post -> setParamsForNew($this->user['id']);

            if ($post -> save()) {
                $this -> flashSession -> success("Save Post successfully!");
            } else {
                $this -> flashSession->error("Can't save Post");
                /*foreach ($posts->getMessages() as $message) {
                   echo $message, "\n";
                   exit();
                }*/
            }
            return $this -> response -> redirect("/admin/manageposts/");
        }
    }

    public function deleteAction($id) {
        $this -> flashSession -> clear();
        $posts = new Posts();
        if ($posts -> deleteById($id) == true ) {
            $this->flashSession->success("Delete Post successfully!");
        } else {
            $this->flashSession->error("Can't delete Post");
        }
        return $this->response->redirect("/admin/manageposts/");
    }
}