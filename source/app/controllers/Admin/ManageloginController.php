<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\View;
use Phalcon\Http\Response;
use MyApp\Forms\LoginForm;

class ManageloginController extends Controller
{

    public function onConstruct() {

    }

    public function afterExecuteRoute() {
        $this->view->setViewsDir($this->view->getViewsDir() . 'admin/');
    }

    public function indexAction() {

        //disable layout
        $this->view->disableLevel(array(View::LEVEL_LAYOUT => true));
        $form = new LoginForm();
        $response = new Response();
        $message = "";
        $identity = $this->auth->getIdentityAdmin();
        if (is_array($identity)) {
            return $response->redirect('/admin/managesites');
        }
        if ($this->request->isPost()) {
            if ($form->isValid($this->request->getPost()) == true) {
                $arr['email']      = $this->request->getPost('email');
                $arr['password']   = $this->request->getPost('password');
                $arr['remember']   = $this->request->getPost('rememberme');

                if ($this->auth->checkAdmin($arr)) {

                    return $response->redirect("/admin/managesites");
                }
                $message = 'Wrong email/password';
                //return $response->redirect("admin/login");
            }
        }
        $this->view->messageWrong = $message;
        $this -> view -> form = $form;

    }

    public function logoutAction() {
        $this -> auth ->removeForAdmin();
        return $this->response->redirect('admin/login');
    }
}