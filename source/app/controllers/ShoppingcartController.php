<?php
namespace MyApp\Controllers;
use Phalcon\Mvc\View;
use MyApp\Model\Orders;
use MyApp\Model\OrderDetails;
use MyApp\Model\Abouts;
use MyApp\Model\Users;
use MyApp\MyEmail;

class ShoppingcartController extends ControllerBase
{
    public function indexAction() {
        $this -> view -> setLayout('home_no_leftsidebar');
        $this -> view -> pageTitle = "Giỏ hàng";
        $this -> view -> title     = "Giỏ hàng - Hàng xách tay Conan";
        $this -> view -> titleForLayout = "Giỏ hàng - Hàng xách tay Conan";
        $this -> view -> titleForPage   = "Giỏ hàng";
        $this -> view -> saleKeyWords   = "Giỏ hàng - Hàng xách tay Conan";
    }

    public function checkoutAction() {
        $this -> view -> pageTitle = "Thông báo giỏ hàng";
        $this -> view -> titleForLayout = "Thông báo giỏ hàng - ".DEFAULT_NAME;
        $delivery_cost = 20;
        $ssShoppingCart = $this->session->get('shoppingcart');
        $totalPrice = 0;
        if (empty($ssShoppingCart) || !is_array($ssShoppingCart)) {
            return $this -> response -> redirect("/");
        }
        if ($this -> request -> isPost()) {
            $name               = $this -> request -> getPost('name');
            $email              = $this -> request -> getPost('email');
            $phone              = $this -> request -> getPost('phone');
            $address            = $this -> request -> getPost('address');
            $comment            = $this -> request -> getPost('comment');

            // $ship_difference    = $this -> request -> getPost('ship_difference');
            // $first_name_ship    = $this -> request -> getPost('first_name_ship');
            // $last_name_ship     = $this -> request -> getPost('last_name_ship');
            // $company_name_ship  = $this -> request -> getPost('company_name_ship');
            // $country_id_ship    = $this -> request -> getPost('country_id_ship');
            // $address1_ship      = $this -> request -> getPost('address1_ship');
            // $town_city_ship     = $this -> request -> getPost('town_city_ship');
            // $province_id_ship   = $this -> request -> getPost('province_id_ship');
            // $postcode_zip_ship  = $this -> request -> getPost('postcode_zip_ship');

            $orders = new Orders();
            $orders -> name             = $name;
            $orders -> email            = $email;
            $orders -> phone            = $phone;
            $orders -> address          = $address;
            $orders -> note             = $comment;
            $orders -> setParamsForNew(0);
            $orders -> save();
            foreach ($ssShoppingCart as $item) {
                $orderDetails = new OrderDetails();
                $orderDetails -> order_id    = $orders -> id;
                $orderDetails -> product_id  = $item["productId"];
                $orderDetails -> price       = $item["price"];
                $orderDetails -> quantity    = $item["quantity"];
                $orderDetails -> setParamsForNew(0);
                $orderDetails -> save();
                $totalPrice += $orderDetails -> price * $orderDetails -> quantity;
            }

            $order = $orders -> findById($orders -> id);
            $order -> total_price = $totalPrice;
            $order -> save();
            
            //$total_price
            //$this -> session -> set('order', array('id' => $orders -> id, 'price' => $totalPrice));

            // Gửi mail
            //$this -> sendmail($orders -> id);

            //$this -> session -> remove('order');
            $this -> session -> remove('shoppingcart');

            return $this -> response -> redirect("/thong-bao-gio-hang");
        }
    }

    public function sendmail($orderId) {
        $orders = new Orders();
        $orderDetails = new OrderDetails();

        $order = $orders -> findById($orderId);
        $orderDetails = $orderDetails -> findByOrderId($orderId);

        $about = Abouts::findFirst(array("deleted = 0"));

        $mail = new MyEmail();
        $mail -> sendOrderBillingInfo($about -> email, "Thông tin đặt hàng - Hàng xách tay Conan", $order, $orderDetails);
    }
}

