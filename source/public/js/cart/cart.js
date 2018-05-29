var ADD_TO_CART = '.ajx-add-cart';
var ADD_TO_CART_DETAIL = '.ajx-add-cart-detail';
var QTY_DETAIL = '#qty';
var CART_CONTENT = '.cart_content';
var BTN_DELETE_PRODUCT = '.delete_product_in_cart';
var TOTAL_PRICE_HEADER = '.total_price_header';
var MINICART_COUNT = '.notice-num';
var MINICART_TOTAL_PRICE = '.notice-num .total_price';
//var MINICART_TOTAL = '.minicart-total';
var TOTAL_ALL_PRICE = '.total_all_price';
var OPEN_SHOPPING_CART = '#open_shopping_cart';

// type ajax
var SUCCESS = 0, FAIL = 1;
// type notify
var ADD_ITEM = 1, DELETE_ITEM = 2, LOAD_CART = 3;
var NUMBER_ITEM = 1;
var SETTIMEOUT;
$(document).ready(function() {
    new funcAddToCart();
    new funcAddToCartDetail();
    new funcDeleteProductShopping();
    new funcGotoShoppingCart();
    callAjax({},"/products/getCart", LOAD_CART);
});

funcGotoShoppingCart = function(e) {
    $(OPEN_SHOPPING_CART).on('click', function() {
        window.location.href = "/gio-hang";
    });
};

funcAddToCart = function(e) {
    $(ADD_TO_CART).on('click', function(e) {
        var id = $(this).data('id');
        var data = {'id': id, 'quantity':1, 'sum':0};
        callAjax(data, "/products/addToCart", ADD_ITEM, NUMBER_ITEM);
        e.stopPropagation();
    });
};

funcAddToCartDetail = function() {
    $(ADD_TO_CART_DETAIL).on('click', function () {
        var id = $(this).data('id');
        var quantity = $(QTY_DETAIL).val();
        var data = {'id': id, 'quantity' :quantity, 'sum':0};
        callAjax(data, "/products/addToCart", ADD_ITEM, quantity);
        //console.log(id);
    });
};

funcDeleteProductShopping = function () {
    $('.cart_content').on('click', BTN_DELETE_PRODUCT, function() {
        var id = $(this).data('id');
        var data = {'id': id};
        callAjax(data, "/products/removeProduct", DELETE_ITEM, NUMBER_ITEM);
    });
};

function updateShoppingCart(data) {
    if(data.shoppingCart != "") {
        $(CART_CONTENT).html(data.shoppingCart);
        $(TOTAL_ALL_PRICE).html(data.totalPrice + " VNĐ");
    } else {
        $(CART_CONTENT).html("<tr><td colspan='6' style='text-align: center'>Không có sản phẩm nào</td></tr>");
        $(TOTAL_ALL_PRICE).html('0 VNĐ');
    }
}

function updateMiniCard(data) {
    if(data.shoppingCart != "") {
        $(MINICART_COUNT).attr("data-amount", data.totalQuantity);
        $(MINICART_TOTAL_PRICE).html(data.totalPrice);
        //$(MINICART_TOTAL).html("SG$" + data.totalPrice);
    } else {
        $(MINICART_COUNT).attr("data-amount", 0);
        $(MINICART_TOTAL_PRICE).html("0");
        //$(MINICART_TOTAL).html("SG$0");
    }
}

function callAjax(formData, url, action, number) {
    var flg = true;
    jQuery.ajax({
        url : url,
        type : "POST",
        data : formData,
        //async: false,
        dataType : "json",
        beforeSend: function(){
            //showPopupMessage("notification", '<img src="/images/loading.gif"/>   Sending...');
        },
        success: function(data){
            if(data.error == FAIL){
                flg = false;
                //showPopupMessage("notification", "Contact Us fail, please try ...");
                console.log("err");
            } else {
                //console.log(data);
                updateMiniCard(data);
                //updateMyCart(data);
                updateShoppingCart(data);
                $(".notify_shopping_cart").hide();
                clearTimeout(SETTIMEOUT);
                showNotify(action, number);
                //showNotify(action);
            }
        },
        error: function(error){
            flg = false;
            console.log("err1");
            //closeModal("notification");
        }
    });
    return flg;
}

// function showNotify(action) {
//     switch(action) {
//         case ADD_ITEM:
//             notify("Đã thêm vào giỏ hàng.");
//             break;
//         case DELETE_ITEM:
//             notify("Đã xóa khỏi giỏ hàng.");
//             break;
//         default:
//             break;
//     }
// }
// function notify(text) {
//     var style = 'success';
//     $.notify({
//         title: 'Thông báo',
//         text: text,
//         image: "<img src='/images/notify.png'/>"
//     }, {
//         style: 'metro',
//         className: style,
//         autoHide: true,
//         clickToHide: true,
//         position:"top right"
//     });
// }

function showNotify(action, number) {
    switch(action) {
        case ADD_ITEM:
            notify("Đã thêm vào giỏ hàng.", number);
            break;
        case DELETE_ITEM:
            notify("Đã xóa khỏi giỏ hàng.", number);
            break;
        default:
            break;
    }
}

function notify(text, number) {
    $(".notify_shopping_cart").show();
    $(".notify_shopping_cart .notify_number").text(number);
    $(".notify_shopping_cart .notify_success").text(text);
    SETTIMEOUT = setTimeout(function(){
        $(".notify_shopping_cart").hide();
    }, 2000);
}