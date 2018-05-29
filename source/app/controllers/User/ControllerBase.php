<?php

namespace MyApp\Controllers\User;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;

class ControllerBase extends Controller
{
    public $user;
    public $currentSite;
    public function onConstruct() {

        $this->view->setLayout('user');

        $ssUser = $this->session->get('auth-identity');

        if (!is_null($ssUser) && ($ssUser['role_id'] == GROUP_USER)) {
            $this -> user = $ssUser;
        } else {
            $this -> response->redirect("/login");
            return false;
        }
        $this -> view -> ssUser = $this -> user;
    }

    public function afterExecuteRoute() {
        $this->view->setViewsDir($this->view->getViewsDir() . 'user/');
    }

    public function beforeExecuteRoute(Dispatcher $dispatcher) {

        $controllerName = strtolower($dispatcher -> getControllerName());

        //Only check permissions on private controllers
        if ($this -> acl -> isPrivate($controllerName)) {

            //Get the current identity
            $identity = $this -> auth -> getIdentity();

            //If there is no identity available the user is redirected to index/index
            if (!is_array($identity)) {
                //echo "eee";exit;
                $this->session->set('keep-link', "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
                $this -> response->redirect("/login");
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
    public function checkCurrentSite() {
        $currentSite = $this->session->get('currentSite');
        if (!is_null($currentSite)) {
            $this -> currentSite = $currentSite;
        } else {
            $this -> flashSession -> error('Can not found Site.');
            return $this->response->redirect("/user/managesites/");
        }
    }
}
