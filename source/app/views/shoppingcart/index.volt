<section class="section_offset">

	<h1>Giỏ hàng</h1>

	<!-- - - - - - - - - - - - - - Shopping cart table - - - - - - - - - - - - - - - - -->

	<div class="table_wrap">
		<form id="giohang" action="/products/updateCart" method="post">
		<table class="table_type_1 shopping_cart_table">

			<thead>

				<tr>
					<th class="product_image_col">Hình</th>
					<th class="product_title_col">Tên</th>
					<th>Giá</th>
					<th class="product_qty_col">Số lượng</th>
					<th>Giá tổng</th>
					<th class="product_actions_col">Sửa/Xóa</th>
				</tr>

			</thead>

			<tbody class="cart_content">
			</tbody>

		</table>
		</form>
	</div><!--/ .table_wrap -->

	<footer class="bottom_box on_the_sides">

		<div class="left_side">

			<a href="/san-pham-moi" class="btn btn-primary middle_btn">Tiếp tục mua</a>

		</div>

		<div class="right_side">

			<a href="javascript:void(0)" class="btn btn-danger middle_btn btn-empty" name="update_cart_action">Xóa giỏ hàng</a>

		</div>

	</footer><!--/ .bottom_box -->

	<!-- - - - - - - - - - - - - - End of shopping cart table - - - - - - - - - - - - - - - - -->

</section><!--/ .section_offset -->

<section class="section_offset">
	<div class="col-sm-6">
        <h3 class=""><strong>Tổng cộng thanh toán</strong></h3>
        <div class="cart-totals border pdd-horizon-30 pdd-vertical-30 mrg-top-50">
            
            <table class="zebra">
				<tfoot>
					<tr class="total">
						<td>Total</td>
						<td class="color-red text-right total_all_price"></td>
					</tr>
				</tfoot>

			</table>
        </div>
        <!-- /cart-totals -->
    </div>
    <!-- /column -->
    <div class="col-sm-6">
        <h3 class=""><strong>Thông tin đặt hàng</strong></h3>
        <form method="POST" action="/shoppingcart/checkout" id="checkout" class="type_2">
            <div class="row">
                <div class="form-group">
                    <div class="col-md-12">
                        <p class="mb10">Tên <span class="required"></span></p>
                        <input type="text" name="name" id="name" value="" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <p class="mb10 mt10">Địa chỉ <span class="required"></span></p>
                        <input type="text" name="address" id="address" value="" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <p class="mb10 mt10">Email <span class="required"></span></p>
                        <input type="text" name="email" value="" id="email" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <p class="mb10 mt10">Số điện thoại <span class="required"></span></p>
                        <input type="text" name="phone" id="phone" value="" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <p class="mb10 mt10">Ghi chú thêm</p>
                        <textarea name="comment" id="comment" class="form-control" rows="3"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12 mt15">
                        <a href="javascript:void(0)" id="btnSubmit" class="btn btn-primary middle_btn btn-md mrg-right-10">Lưu giỏ hàng</a>
                    </div>
                </div>
                <!-- /text-right -->
            </div>
        </form>
    </div>
    <!-- /column -->
</section>
<script language="javascript" src="/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/cart/checkout.js"></script>
<script>
    $(document).ready(function() {

        $('.btn-empty').on('click', function(event){
            event.preventDefault();
            window.location.href ='/products/emptycart';
            return false;
        });

        $('.cart_content').on('click', '.update_product_in_cart', function() {
            $("#giohang").submit();
        });

    });
</script>