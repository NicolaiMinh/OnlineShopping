<?php
namespace MyApp\Controllers;
use Phalcon\Mvc\View;
use MyApp\Model\TsaContacts;
use MyApp\MyEmail;
use MyApp\Model\TsaAbouts;
class ContactsController extends ControllerBase
{

    public function indexAction() {
        $this -> view -> setLayout('home_no_leftsidebar');
        $this -> view -> titleForLayout = "Liên hệ - Hàng Xách Tay Conan";
        $this -> view -> saleKeyWords = "Liên hệ - Hàng Xách Tay Conan";

        // $contacts = new TsaContacts();
        // if ($this->request->isPost()) {
        //     $contacts -> name = strip_tags($this -> request -> getPost('name'));
        //     $contacts -> email = strip_tags($this -> request -> getPost('email'));
        //     $contacts -> phone = strip_tags($this -> request -> getPost('phone'));
        //     $contacts -> message = strip_tags($this -> request -> getPost('message'));
        //     $contacts -> setParamsForNew(1);
        //     try {
        //         $contacts -> save();
        //         // send mail
        //         $about =  TsaAbouts::findFirst(array("del_if = 0" ));
        //         $mail = new MyEmail();
        //         $mail -> sendFeedback($about -> email,
        //                     strip_tags($this -> request -> getPost('name')),
        //                     strip_tags($this -> request -> getPost('phone')),
        //                     strip_tags($this -> request -> getPost('email')),
        //                     strip_tags($this -> request -> getPost('message')));

        //     } catch (Exception $e) {
        //         $this->flashSession->success("Gửi email không thành công! Xin hãy thử lại.");
        //         return $this->response->redirect('/lien-he');
        //     }
        //     $this->flashSession->success("Gửi email thành công!");
        //     return $this->response->redirect('/lien-he');
        // }
    }
}

