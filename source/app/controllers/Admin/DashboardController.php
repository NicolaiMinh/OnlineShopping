<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Mvc\View;
class DashboardController extends ControllerBase
{
    public function indexAction() {
		$this -> view -> pageHeader = "Dashboard";
		$this -> view -> titleForLayout = "Dashboard";
    }
}

