<?php

namespace MyApp\Controllers\Admin;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use MyApp\Model\Abouts;

class ControllerBase extends Controller
{
    public $user;
    public function onConstruct() {

        $this -> view -> setLayout('admin');
        $this -> view -> about = Abouts::findFirst(array("deleted = 0"));
        $this -> view -> titleForLayout = "Hàng Xách Tay Conan";
        $this -> view -> saleKeyWords = "Hàng Xách Tay Conan";

        $this->user = $this -> auth -> getIdentityAdmin();
        $this -> view -> user = $this->user;
        $identity = $this -> auth -> getIdentityAdmin();
        if (!is_array($identity)) {
            $this->response->redirect("/admin/login");
            return false;
        }
    }

    public function afterExecuteRoute() {
        $this->view->setViewsDir($this->view->getViewsDir() . 'admin/');
    }

    public function beforeExecuteRoute(Dispatcher $dispatcher) {

        $controllerName = strtolower($dispatcher -> getControllerName());
        //Only check permissions on private controllers
        if ($this -> acl -> isPrivate($controllerName)) {

            //Get the current identity
            $identity = $this -> auth -> getIdentityAdmin();

            //If there is no identity available the user is redirected to index/index
            if (!is_array($identity)) {
                /*echo "<pre>";
                print_r($identity);
                exit;*/
                //$dispatcher -> forward(array('controller' => 'index', 'action' => 'index'));
                $this->response->redirect("/");
                return false;
            }

            //Check if the user have permission to the current option
            $actionName = $dispatcher -> getActionName();
            if (!$this -> acl -> isAllowed($identity['role'], $controllerName, $actionName)) {
                //$dispatcher -> forward(array('controller' => 'index', 'action' => 'index'));
                $this->response->redirect("/");
                return false;
            }

        }

    }
}
