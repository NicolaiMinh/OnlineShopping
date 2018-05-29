<section class="section_offset mb0">
	<h1>{{pageTitle}}</h1>
</section>
<div class="section_offset">
<header class="top_box on_the_sides">
<div class="left_side clearfix v_centered">
	<!-- - - - - - - - - - - - - - Sort by - - - - - - - - - - - - - - - - -->
	<div class="v_centered">
		<span>Sắp xếp:</span>
		<div class="custom_select sort_select">
			<select name="sort" class="change-value">	
				<option value="1" <?php echo $sortby == 1 ? 'selected' : ''; ?>>Giá từ thấp đến cao</option>
				<option value="2" <?php echo $sortby == 2 ? 'selected' : ''; ?>>Giá từ cao xuống thấp</option>
				<option value="3" <?php echo $sortby == 3 ? 'selected' : ''; ?>>Sản phẩm mới cập nhật</option>
			</select>
		</div>
	</div>
	<!-- - - - - - - - - - - - - - End of sort by - - - - - - - - - - - - - - - - -->
	<!-- - - - - - - - - - - - - - Number of products shown - - - - - - - - - - - - - - - - -->
	<!-- <div class="v_centered">
		<span>Show:</span>
		<div class="custom_select">
			<select name="">
				<option value="15">15</option>
				<option value="12">12</option>
				<option value="9">9</option>
				<option value="6">6</option>
				<option value="3">3</option>
			</select>
		</div>
	</div> -->
	<!-- - - - - - - - - - - - - - End of number of products shown - - - - - - - - - - - - - - - - -->
</div>

<div class="right_side">
	<!-- - - - - - - - - - - - - - Product layout type - - - - - - - - - - - - - - - - -->
	<div class="layout_type buttons_row" data-table-container="#products_container">
		<a href="#" data-table-layout="grid_view" class="button_grey middle_btn icon_btn active tooltip_container grid_view"><i class="icon-th"></i><span class="tooltip top">Grid View</span></a>
		<a href="#" data-table-layout="list_view list_view_products" class="button_grey middle_btn icon_btn tooltip_container list_view"><i class="icon-th-list"></i><span class="tooltip top">List View</span></a>
	</div>
	<!-- - - - - - - - - - - - - - End of product layout type - - - - - - - - - - - - - - - - -->
</div>
</header>

<div class="table_layout" id="products_container">
	<!-- mỗi lần loop là lấy 3 phần tử, vì theo theme thì đang sử dụng table_row -->
	<?php for($i = 0; $i < count($data->items); $i = $i + 3) {?>
	<div class="table_row">
		<!-- - - - - - - - - - - - - - Product - - - - - - - - - - - - - - - - -->
		<div class="table_cell">
			<div class="product_item">
				<!-- - - - - - - - - - - - - - Thumbmnail - - - - - - - - - - - - - - - - -->
				<div class="image_wrap">
					<img src="<?php echo $data->items[$i] -> image_thumbnail?>" alt="<?php echo $data->items[$i] -> name?>">
					<!-- - - - - - - - - - - - - - Product actions - - - - - - - - - - - - - - - - -->
					<div class="actions_wrap">
						<div class="centered_buttons">
							<a href="/san-pham/<?php echo $data->items[$i] -> slug?>" class="button_dark_grey middle_btn quick_view">Xem chi tiết</a>
							
						</div>
					</div><!--/ .actions_wrap-->
					<?php if ($data->items[$i] -> status == 1) {?>
			          <div class="label_new">Mới</div>
			          <?php } elseif ($data->items[$i] -> status == 2) {?>
			          <div class="label_hot">Hot</div>
			          <?php }?>
					<!-- - - - - - - - - - - - - - End of product actions - - - - - - - - - - - - - - - - -->
				</div><!--/. image_wrap-->
				<!-- - - - - - - - - - - - - - End thumbmnail - - - - - - - - - - - - - - - - -->
				<!-- - - - - - - - - - - - - - Product title & price - - - - - - - - - - - - - - - - -->
				<div class="description text-center">

					<a href="/san-pham/<?php echo $data->items[$i] -> slug?>" class="text-overflow"><?php echo $data->items[$i] -> name?></a>

					<div class="clearfix product_info">
						<?php if ($data->items[$i]->sale_price > 0) {?>
		                  <p class="old-price"><s><?php echo number_format($data->items[$i] -> price)?> VNĐ</s></p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i] -> sale_price)?> VNĐ</strong></p>
		              <?php } else {?>
		                  <p class="old-price">&nbsp;</p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i] -> price)?> VNĐ</strong></p>
		              <?php }?>

					</div>

				</div>
				<div class="buttons_row text-center mt15">
                    <a href="javascript:void(0)" class="button_blue ajx-add-cart float-none" data-id="<?php echo $data->items[$i] -> id?>">Thêm vào giỏ hàng</a>
                </div>

				<!-- - - - - - - - - - - - - - End of product title & price - - - - - - - - - - - - - - - - -->

				<!-- - - - - - - - - - - - - - Full description (only for list view) - - - - - - - - - - - - - - - - -->

				<div class="full_description">
					<a href="/san-pham/<?php echo $data->items[$i] -> slug?>" class="product_title text-overflow"><?php echo $data->items[$i] -> name?></a>
					<!-- <a href="#" class="product_category">Beauty Clearance</a> -->
					<p><?php echo htmlspecialchars_decode($data->items[$i] -> short_description) ?></p>
					<a href="/san-pham/<?php echo $data->items[$i] -> slug?>" class="learn_more">Chi tiết</a>
				</div>

				<!-- - - - - - - - - - - - - - End of full description (only for list view) - - - - - - - - - - - - - - - - -->

				<!-- - - - - - - - - - - - - - Product price & actions (only for list view) - - - - - - - - - - - - - - - - -->

				<div class="actions text-center">
					<?php if ($data->items[$i]->sale_price > 0) {?>
		                  <p class="old-price"><s><?php echo number_format($data->items[$i] -> price)?> VNĐ</s></p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i] -> sale_price)?> VNĐ</strong></p>
		              <?php } else {?>
		                  <p class="old-price">&nbsp;</p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i] -> price)?> VNĐ</strong></p>
		              <?php }?>
					<ul class="buttons_col">
						<li><a href="javascript:void(0)" class="button_blue ajx-add-cart" data-id="<?php echo $data->items[$i] -> id?>">Thêm vào giỏ hàng</a></li>
					</ul>
				</div>
				<!-- - - - - - - - - - - - - - Product price & actions (only for list view) - - - - - - - - - - - - - - - - -->

			</div><!--/ .product_item-->

		</div>

		<?php if (isset($data->items[$i + 1])) {?>
		<div class="table_cell">
			<div class="product_item">
				<!-- - - - - - - - - - - - - - Thumbmnail - - - - - - - - - - - - - - - - -->
				<div class="image_wrap">
					<img src="<?php echo $data->items[$i + 1] -> image_thumbnail?>" alt="<?php echo $data->items[$i + 1] -> name?>">
					<!-- - - - - - - - - - - - - - Product actions - - - - - - - - - - - - - - - - -->
					<div class="actions_wrap">
						<div class="centered_buttons">
							<a href="/san-pham/<?php echo $data->items[$i + 1] -> slug?>" class="button_dark_grey middle_btn quick_view">Xem chi tiết</a>
						</div>
					</div><!--/ .actions_wrap-->
					<?php if ($data->items[$i + 1] -> status == 1) {?>
			          <div class="label_new">Mới</div>
			          <?php } elseif ($data->items[$i + 1] -> status == 2) {?>
			          <div class="label_hot">Hot</div>
			          <?php }?>
					<!-- - - - - - - - - - - - - - End of product actions - - - - - - - - - - - - - - - - -->
				</div><!--/. image_wrap-->
				<!-- - - - - - - - - - - - - - End thumbmnail - - - - - - - - - - - - - - - - -->
				<!-- - - - - - - - - - - - - - Product title & price - - - - - - - - - - - - - - - - -->
				<div class="description text-center">

					<a href="/san-pham/<?php echo $data->items[$i + 1] -> slug?>" class="text-overflow"><?php echo $data->items[$i + 1] -> name?></a>

					<div class="clearfix product_info">
						<?php if ($data->items[$i + 1]->sale_price > 0) {?>
		                  <p class="old-price"><s><?php echo number_format($data->items[$i + 1] -> price)?> VNĐ</s></p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i + 1] -> sale_price)?> VNĐ</strong></p>
		              <?php } else {?>
		                  <p class="old-price">&nbsp;</p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i + 1] -> price)?> VNĐ</strong></p>
		              <?php }?>

					</div>

				</div>
				<div class="buttons_row text-center mt15">
                    <a href="javascript:void(0)" class="button_blue ajx-add-cart float-none" data-id="<?php echo $data->items[$i + 1] -> id?>">Thêm vào giỏ hàng</a>
                </div>
				<!-- - - - - - - - - - - - - - End of product title & price - - - - - - - - - - - - - - - - -->

				<!-- - - - - - - - - - - - - - Full description (only for list view) - - - - - - - - - - - - - - - - -->

				<div class="full_description">
					<a href="/san-pham/<?php echo $data->items[$i + 1] -> slug?>" class="product_title text-overflow"><?php echo $data->items[$i + 1] -> name?></a>
					<!-- <a href="#" class="product_category">Beauty Clearance</a> -->
					<p><?php echo htmlspecialchars_decode($data->items[$i + 1] -> short_description) ?></p>
					<a href="/san-pham/<?php echo $data->items[$i] -> slug?>" class="learn_more">Chi tiết</a>
				</div>

				<!-- - - - - - - - - - - - - - End of full description (only for list view) - - - - - - - - - - - - - - - - -->

				<!-- - - - - - - - - - - - - - Product price & actions (only for list view) - - - - - - - - - - - - - - - - -->

				<div class="actions text-center">
					<?php if ($data->items[$i + 1]->sale_price > 0) {?>
		                  <p class="old-price"><s><?php echo number_format($data->items[$i + 1] -> price)?> VNĐ</s></p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i + 1] -> sale_price)?> VNĐ</strong></p>
		              <?php } else {?>
		                  <p class="old-price">&nbsp;</p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i + 1] -> price)?> VNĐ</strong></p>
		              <?php }?>
					<ul class="buttons_col">
						<li><a href="javascript:void(0)" class="button_blue ajx-add-cart" data-id="<?php echo $data->items[$i + 1] -> id?>">Thêm vào giỏ hàng</a></li>
					</ul>
				</div>
				<!-- - - - - - - - - - - - - - Product price & actions (only for list view) - - - - - - - - - - - - - - - - -->

			</div><!--/ .product_item-->

		</div>
		<?php } else {?>
		<div class="table_cell empty pa0">
		</div>
		<?php }?>
		<?php if (isset($data->items[$i + 2])) {?>
		<div class="table_cell">
			<div class="product_item">
				<!-- - - - - - - - - - - - - - Thumbmnail - - - - - - - - - - - - - - - - -->
				<div class="image_wrap">
					<img src="<?php echo $data->items[$i + 2] -> image_thumbnail?>" alt="<?php echo $data->items[$i + 2] -> name?>">
					<!-- - - - - - - - - - - - - - Product actions - - - - - - - - - - - - - - - - -->
					<div class="actions_wrap">
						<div class="centered_buttons">
							<a href="/san-pham/<?php echo $data->items[$i + 2] -> slug?>" class="button_dark_grey middle_btn quick_view">Xem chi tiết</a>
						</div>
					</div><!--/ .actions_wrap-->
					<?php if ($data->items[$i + 2] -> status == 1) {?>
			          <div class="label_new">Mới</div>
			          <?php } elseif ($data->items[$i + 2] -> status == 2) {?>
			          <div class="label_hot">Hot</div>
			          <?php }?>
					<!-- - - - - - - - - - - - - - End of product actions - - - - - - - - - - - - - - - - -->
				</div><!--/. image_wrap-->
				<!-- - - - - - - - - - - - - - End thumbmnail - - - - - - - - - - - - - - - - -->
				<!-- - - - - - - - - - - - - - Product title & price - - - - - - - - - - - - - - - - -->
				<div class="description text-center">

					<a href="/san-pham/<?php echo $data->items[$i + 2] -> slug?>" class="text-overflow"><?php echo $data->items[$i + 2] -> name?></a>

					<div class="clearfix product_info">
						<?php if ($data->items[$i + 2]->sale_price > 0) {?>
		                  <p class="old-price"><s><?php echo number_format($data->items[$i + 2] -> price)?> VNĐ</s></p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i + 2] -> sale_price)?> VNĐ</strong></p>
		              <?php } else {?>
		                  <p class="old-price">&nbsp;</p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i + 2] -> price)?> VNĐ</strong></p>
		              <?php }?>

					</div>

				</div>
				<div class="buttons_row text-center mt15">
                    <a href="javascript:void(0)" class="button_blue ajx-add-cart float-none" data-id="<?php echo $data->items[$i + 2] -> id?>">Thêm vào giỏ hàng</a>
                </div>
				<!-- - - - - - - - - - - - - - End of product title & price - - - - - - - - - - - - - - - - -->

				<!-- - - - - - - - - - - - - - Full description (only for list view) - - - - - - - - - - - - - - - - -->

				<div class="full_description">
					<a href="/san-pham/<?php echo $data->items[$i + 2] -> slug?>" class="product_title text-overflow"><?php echo $data->items[$i + 2] -> name?></a>
					<!-- <a href="#" class="product_category">Beauty Clearance</a> -->
					<p><?php echo htmlspecialchars_decode($data->items[$i + 2] -> short_description) ?></p>
					<a href="/san-pham/<?php echo $data->items[$i + 2] -> slug?>" class="learn_more">Chi tiết</a>
				</div>

				<!-- - - - - - - - - - - - - - End of full description (only for list view) - - - - - - - - - - - - - - - - -->

				<!-- - - - - - - - - - - - - - Product price & actions (only for list view) - - - - - - - - - - - - - - - - -->

				<div class="actions text-center">
					<?php if ($data->items[$i + 2]->sale_price > 0) {?>
		                  <p class="old-price"><s><?php echo number_format($data->items[$i + 2] -> price)?> VNĐ</s></p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i + 2] -> sale_price)?> VNĐ</strong></p>
		              <?php } else {?>
		                  <p class="old-price">&nbsp;</p>
		                  <p class="product_price discount-price color-red"><strong><?php echo number_format($data->items[$i + 2] -> price)?> VNĐ</strong></p>
		              <?php }?>
					<ul class="buttons_col">
						<li><a href="javascript:void(0)" class="button_blue ajx-add-cart" data-id="<?php echo $data->items[$i + 2] -> id?>">Thêm vào giỏ hàng</a></li>
					</ul>
				</div>
				<!-- - - - - - - - - - - - - - Product price & actions (only for list view) - - - - - - - - - - - - - - - - -->

			</div><!--/ .product_item-->

		</div>
		<?php } else {?>
		<div class="table_cell empty pa0">
		</div>
		<?php }?>
	</div>
	<?php }?>

</div><!--/ .table_layout -->

<footer class="bottom_box on_the_sides">

<div class="margin-auto">

	{{ partial('partials/paging-search')}}

</div>

</footer>

</div>