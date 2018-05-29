<?php
namespace MyApp\Controllers;
use Phalcon\Mvc\View;
use MyApp\Model\Products;
class ProductsController extends ControllerBase
{
    public function indexAction() {
    }

    public function detailAction($id = 1) {

        $products = new Products();
        $product = $products -> findById($id);

        if ($product == false) {
            return $this -> response -> redirect("/");
        }
        $this -> view -> product = $product;

        $relateProduct = $products -> findRelateCategory($id, $product -> category_detail_ids, 9);
        $this -> view -> relateProduct = $relateProduct;
        $this -> view -> titleForLayout = $product -> name." - Hàng Xách Tay Conan";
        $this -> view -> saleKeyWords = $product -> name." - Hàng Xách Tay Conan";
        $this -> view -> mega_image =  $product -> image_thumbnail;
        $this -> view -> mega_description =  $product -> name;
    }

    public function addToCartAction() {
        //kiểm tra không phải post
        if (!$this -> request -> isPost()) {
            echo json_encode(array('error' => 11));
            exit;
        }

        $productId = $this -> request -> getPost('id');
        $quantity  = $this -> request -> getPost('quantity');
        // $size  = $this -> request -> getPost('size');

        // kiểm tra phải là số hay không
        if (!ctype_digit($productId) || !ctype_digit($quantity)) {
            echo json_encode(array('error' => 111));
            exit;
        }

        $products = new Products();
        $product = $products->findById($productId);
        if (empty($product)) {
            echo json_encode(array('error' => 1111));
            exit;
        }

        // lấy session giỏ hàng
        $ssShoppingCart = $this->session->get('shoppingcart');
        //kiểm tra chưa tồn tại giỏ hàng set []
        if (!is_array($ssShoppingCart)) {
            $ssShoppingCart = array();
        }
        // tạo 1 giỏ hàng tạm thời để lưu lại giá trị mới
        $ssShoppingCartNew = array();
        // kiểm tra xem product có tồn tại hay không
        $ssscExists = false;

        // kiểm tra giỏ hàng có tồn tại chưa, tồn tại rồi thì cộng số lượng vào thêm
        foreach ($ssShoppingCart as $sssc) {
            if ($sssc['productId'] == $productId) {
                //if($quantity != 0){
                    //$sssc['quantity'] = $sssc['quantity'] + $quantity;
                //}
                // else {
                    // $sssc['quantity'] = $total_quantity;
                // }
                $sssc['quantity'] = $sssc['quantity'] + $quantity;
                $sssc['total'] = $sssc['quantity'] * $sssc['price'];
                $ssscExists = true;
            }
            $ssShoppingCartNew[] = $sssc;
        }

        // Nếu giỏ hàng chưa tồn tại product đang được chọn, thì add mới vào giỏ hàng
        if (!$ssscExists) {
            //$quantity = $quantity != 0 ? $quantity : $total_quantity;
            $ssShoppingCartNew[] = array(
                    'productId' => $productId,
                    'quantity'  => $quantity,
                    // 'size'      => $size,
                    'name'      => $product->name,
                    'slug'      => '/san-pham/'. $product->slug,
                    'images'    => $product -> image_thumbnail,
                    'price'     => $product -> sale_price > 0 ? $product -> sale_price : $product -> price,
                    'total'     => ($product -> sale_price > 0 ? $product -> sale_price : $product -> price) * $quantity
                );
        }
        // xóa bỏ session của giỏ hàng cũ
        $this->session->remove('shoppingcart');
        // tạo mới session cho giỏ hàng mới
        $this->session->set('shoppingcart' , $ssShoppingCartNew);

        $miniCart = $this -> createMiniCart();
        $arrCart = array(
            'error' => 0,
            'quantityproduct' => count($this->session->get('shoppingcart')),
            //'miniCart' => $miniCart['miniCart'],
            'totalQuantity' => $miniCart['totalQuantity'],
            'totalPrice' => $miniCart['totalPrice'],
        );
        echo json_encode($arrCart);
        exit;
    }

    public function getCartAction() {
         $miniCart = $this -> createMiniCart();
         $arrCart = array(
            'error' => 0,
            'quantityproduct' => count($this -> session -> get('shoppingcart')),
            'totalQuantity' => $miniCart['totalQuantity'],
            'totalPrice' => $miniCart['totalPrice'],
            'shoppingCart' => $miniCart['shopingCart']
        );
        echo json_encode($arrCart);
        exit;
    }

    private function createMiniCart() {
        $html = "";
        $ssShoppingCart = $this->session->get('shoppingcart');
        //kiểm tra chưa tồn tại giỏ hàng set []
        if (!is_array($ssShoppingCart)) {
           return array('totalPrice' => 0, 'totalQuantity' => 0, 'shopingCart' => "");
        }
        $totalPrice = 0;
        $totalQuantity = 0;

        foreach ($ssShoppingCart as $cart) {
            $price = number_format($cart['price']);

            $html .= '<tr>';
            $html .= '  <td class="product_image_col" data-title="Product Image">';
            $html .= '      <a href="'.$cart['slug'].'"><img src="'.$cart['images'].'" alt="'.$cart['name'].'"></a>';
            $html .= '  </td>';
            $html .= '  <td data-title="Product Name">';
            $html .= '      <a href="'.$cart['slug'].'" class="product_title">'.$cart['name'].'</a>';
            $html .= '  </td>';
            $html .= '  <td class="subtotal" data-title="Price">'.$price.'</td>';
            $html .= '  <td data-title="Quantity">';
            $html .= '      <input type="hidden" name="id[]" value="'.$cart['productId'].'">';
            $html .= '      <div class="qty min clearfix">';            
            $html .= '          <button class="theme_button" data-direction="minus">&#45;</button>';
            $html .= '          <input type="text" name="quantity[]" value="'.$cart['quantity'].'">';
            $html .= '          <button class="theme_button" data-direction="plus">&#43;</button>';
            $html .= '      </div>';
            $html .= '  </td>';
            $html .= '  <td class="total" data-title="Total">'.number_format($cart['total']).'</td>';
            $html .= '  <td data-title="Action">';
            $html .= '      <a href="javascript:void(0)" class="update_product_in_cart button_dark_grey icon_btn edit_product"><i class="icon-pencil"></i></a>';
            $html .= '      <a href="javascript:void(0)" data-id="'.$cart['productId'].'" class="delete_product_in_cart button_dark_grey icon_btn remove_product" title="Xóa sản phẩm này"><i class="icon-cancel-2"></i></a>';
            $html .= '  </td>';
            $html .= '</tr>';

            $totalPrice += $cart['total'];
            $totalQuantity += $cart['quantity'];
        }
        return array('totalPrice' => number_format($totalPrice), 'totalQuantity' => $totalQuantity, 'shopingCart' => $html);
    }

    public function updateCartAction() {
        //kiểm tra không phải post
        if (!$this -> request -> isPost()) {
            return $this->response->redirect("/gio-hang");
        }
        $arrId =  $this -> request -> getPost('id');
        $arrQuantity =  $this -> request -> getPost('quantity');
        // $arrSize  = $this -> request -> getPost('size');

        if(empty($arrId)) {
            return $this->response->redirect("/gio-hang");
        }

        $products = new Products();

        $i = 0;
        $arrCart = array();
        foreach ($arrId as $id) {
            if (!is_int((int)$arrQuantity[$i]) || (int)$arrQuantity[$i] <= 0) {
                $i ++;
                continue;
            }
            $product = $products->findById($id);
            if($product == false) {
                $i ++;
                continue;
            }
            $arrCart[] = array(
                    'productId' => $id,
                    'quantity'  => $arrQuantity[$i],
                    // 'size'      => $arrSize[$i],
                    'name'      => $product->name,
                    'slug'      => '/san-pham/'. $product -> slug,
                    'images'    => $product -> image_thumbnail,
                    'price'     => $product -> sale_price > 0 ? $product -> sale_price : $product -> price,
                    'total'     => ($product -> sale_price > 0 ? $product -> sale_price : $product -> price) * $arrQuantity[$i]
                );
            $i ++;
        }
        // xóa bỏ session của giỏ hàng cũ
        $this->session->remove('shoppingcart');
        // tạo mới session cho giỏ hàng mới
        $this->session->set('shoppingcart' , $arrCart);
        return $this->response->redirect("/gio-hang");
    }

    public function removeProductAction() {

        if (!$this -> request -> isPost()) {
            echo json_encode(array('error' => 1));
            exit;
        }

        $productId = $this -> request -> getPost('id');
        // $size  = $this -> request -> getPost('size');
        // kiểm tra phải là số hay không
        if (!ctype_digit($productId)) {
            echo json_encode(array('error' => 1));
            exit;
        }

        $ssShoppingCart = $this->session->get('shoppingcart');
        if (is_null($ssShoppingCart)) {
            echo json_encode(array('error' => 1));
            exit;
        }

        // tạo 1 giỏ hàng tạm thời để lưu lại giá trị mới
        $ssShoppingCartNew = array();

        foreach ($ssShoppingCart as $sssc) {
            if ($sssc['productId'] == $productId) {
                continue;
            }
            $ssShoppingCartNew[] = $sssc;
        }
        // xóa bỏ session của giỏ hàng cũ
        $this->session->remove('shoppingcart');
        // tạo mới session cho giỏ hàng mới
        $this->session->set('shoppingcart' , $ssShoppingCartNew);

        $miniCart = $this -> createMiniCart();
        $arrCart = array(
            'error' => 0,
            'quantityproduct' => count($this -> session -> get('shoppingcart')),
            'totalQuantity' => $miniCart['totalQuantity'],
            'totalPrice' => $miniCart['totalPrice'],
            'shoppingCart' => $miniCart['shopingCart']
        );
        echo json_encode($arrCart );
        exit;
    }

    public function emptycartAction() {
        // xóa bỏ session của giỏ hàng cũ
        $this->session->remove('shoppingcart');
        $this->session->set('shoppingcart' , array());
        return $this->response->redirect("/gio-hang");
    }


}

