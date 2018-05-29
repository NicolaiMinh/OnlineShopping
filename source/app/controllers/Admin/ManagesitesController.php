<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Mvc\View;
use MyApp\Link;
use MyApp\UploadFile;
use MyApp\Model\Abouts;

class ManagesitesController extends ControllerBase {

    public function indexAction() {

        $abouts = new Abouts();
        $abouts = Abouts::findFirst(array("deleted = 0"));

        $this -> view -> abouts        = $abouts;

        if ($this->request->isPost()) {
            $abouts -> logo_header = htmlspecialchars($this -> request->getPost('logo_header'), ENT_QUOTES);
            $abouts -> logo_footer = htmlspecialchars($this -> request->getPost('logo_footer'), ENT_QUOTES);
            // $abouts -> description = htmlspecialchars($this -> request->getPost('description'));
            $abouts -> address = htmlspecialchars($this -> request->getPost('address'), ENT_QUOTES);
            $abouts -> content = htmlspecialchars($this -> request->getPost('content'), ENT_QUOTES);
            $abouts -> phone = htmlspecialchars($this -> request->getPost('phone'), ENT_QUOTES);
            $abouts -> email = $this -> request->getPost('email');
            $abouts -> setParamsForNew($this -> user['id']);

            if ($abouts->save() == false) {
                $this->flashSession->error("Can't save sites");
            } else {
                $this->flashSession->success("Save sites successfully!");
            }
            return $this->response->redirect("/admin/managesites");
        }
        $this -> view -> titleForLayout = "Quản lý Thông Tin Web";
        $this -> view -> title     =  "Quản lý Thông Tin Web";
        $this -> view -> pageHeader = "Quản lý Thông Tin Web";
    }
}