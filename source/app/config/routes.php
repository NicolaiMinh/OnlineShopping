<?php

$router = new Phalcon\Mvc\Router();

/*removeExtraSlashes dùng để bỏ dấu '/' sau cùng của link*/
$router->removeExtraSlashes(true);

$router->add('/:controller/:action/:params', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 1,
    'action' => 2,
    'params' => 3,
));
// set home page
$router->add('/', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'home'
));

$router->add('/:controller', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 1,
    'action' => 'index'
));

$router->add('/admin/:controller/:action/:params', array(
    'namespace' => 'MyApp\Controllers\Admin',
    'controller' => 1,
    'action' => 2,
    'params' => 3,
));

$router->add('/admin/:controller', array(
    'namespace' => 'MyApp\Controllers\Admin',
    'controller' => 1,
    'action' => 'index'
));

$router->add('/admin', array(
    'namespace' => 'MyApp\Controllers\Admin',
    'controller' => 'managelogin',
    'action' => 'index'
));
$router->add('/admin/login', array(
    'namespace' => 'MyApp\Controllers\Admin',
    'controller' => 'managelogin',
    'action' => 'index'
));
$router->add('/admin/logout', array(
    'namespace' => 'MyApp\Controllers\Admin',
    'controller' => 'managelogin',
    'action' => 'logout'
));


// USER/...
$router->add('/user/:controller/:action/:params', array(
    'namespace' => 'MyApp\Controllers\User',
    'controller' => 1,
    'action' => 2,
    'params' => 3,
));

$router->add('/user/:controller', array(
    'namespace' => 'MyApp\Controllers\User',
    'controller' => 1,
    'action' => 'index'
));

$router->add('/logout', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'login',
    'action' => 'logout'
));
// end USER/...

$manufactures = new MyApp\Model\Manufactures();
$manus = $manufactures -> findAll();
foreach ($manus as $item) {
    $router->add('/thuong-hieu/'. $item -> slug, array(
        'namespace' => 'MyApp\Controllers',
        'controller' => 'manufactures',
        'action' => 'index',
        'params' => $item -> id
    ));
}

$router->add('/thuong-hieu/tat-ca', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'manufactures',
    'action' => 'all'
));

$categories = new MyApp\Model\Categories();
$cates = $categories -> findAll();
foreach ($cates as $item) {
    $router->add('/danh-muc/'. $item -> slug, array(
        'namespace' => 'MyApp\Controllers',
        'controller' => 'categories',
        'action' => 'index',
        'params' => $item -> id
    ));
}

$categoryDetails = new MyApp\Model\CategoryDetails();
$catesDetail = $categoryDetails -> findAll();
foreach ($catesDetail as $item) {
    $router->add('/danh-muc/'. $item -> category -> slug."/". $item -> slug, array(
        'namespace' => 'MyApp\Controllers',
        'controller' => 'categorydetail',
        'action' => 'index',
        'params' => $item -> id
    ));
}

$router->add('/danh-muc/tat-ca', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'categories',
    'action' => 'all'
));

use MyApp\Model\Products;
$product = new Products();
$products = $product -> findAll();

foreach ($products as $item) {
    $router->add('/san-pham/'.$item -> slug, array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'products',
    'action' => 'detail',
    'params' => $item -> id
    ));
}

$router->add('/lien-he', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'contacts',
    'action' => 'index'
));

$router->add('/gio-hang', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'shoppingcart',
    'action' => 'index'
));

$router->add('/san-pham-moi', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'newproducts',
    'action' => 'index'
));

$router->add('/san-pham-giam-gia', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'saleproducts',
    'action' => 'index'
));

$router->add('/san-pham-noi-bat', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'hotproducts',
    'action' => 'index'
));

$router->add('/tim-kiem-san-pham', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'search',
    'action' => 'index'
));

$router->add('/gioi-thieu', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'introduce',
    'action' => 'index'
));

$router->add('/thong-bao-gio-hang', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'shoppingcart',
    'action' => 'checkout'
));

$router->add('/thong-bao-gio-hang', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'shoppingcart',
    'action' => 'checkout'
));