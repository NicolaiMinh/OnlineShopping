<?php
namespace MyApp\Controllers\Admin;
use MyApp\Model\Contacts;
use MyApp\Model\Users;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
class ManagecontactsController extends ControllerBase
{

    public function indexAction() {
        $contacts = new Contacts();
        $contacts = $contacts -> findAll();


        if (empty($_GET["page"])) {
            $currentPage = 1;
        } else {
            $currentPage = (int) $_GET["page"];
        }
        $paginator = new PaginatorModel(
            array(
                "data"  => $contacts,
                "limit" => ITEM_PER_PAGE,
                "page"  => $currentPage
            )
        );

        // Get the paginated results
        $page = $paginator->getPaginate();
        $this -> view -> data         = $page;
        $this -> view -> currentPage  = $currentPage;
        $this -> view -> titleForLayout = "Manage Contacts";
        $this -> view -> title = "Manage Contacts";
        $this -> view -> pageHeader = "Manage Contacts";
    }

    public function deleteAction($id) {
        $this->flashSession->clear();
        $contacts = new Contacts();
        if ($contacts -> deleteById($id) == true ) {
            $this->flashSession->success("Delete contacts successfully!");
        } else {
            $this->flashSession->error("Can't delete contacts");
        }
        return $this->response->redirect("admin/managecontacts/");
    }

}
