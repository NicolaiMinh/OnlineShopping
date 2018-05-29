<div class="section_offset" >

  <div id="myCarousel" class="carousel slide" data-ride="carousel">

    <!-- Indicators -->
      <ol class="carousel-indicators">
      <?php
        $iBanner = 0;
        foreach ($bannerList as $item) {?>
        <li data-target="#myCarousel" data-slide-to="<?php echo $iBanner;?>" class="<?php echo $iBanner == 0 ? 'active' : ''?>"></li>
        <?php $iBanner ++;}?>
      </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <?php
        $iBanner2 = 0;
        foreach ($bannerList as $item) {?>
        <div class="item <?php echo $iBanner2 == 0 ? 'active' : ''?>">
            <img class="" src="{{item.image}}" alt="{{item.text}}">
        </div>
        <?php $iBanner2 ++;}?>
    </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
  </div>
        
        <!-- - - - - - - - - - - - - - End of Revolution slider - - - - - - - - - - - - - - - - -->

      </div><!--/ .section_offset -->

      <?php
        use MyApp\Model\CategoryDetails;
        use MyApp\Model\Products; 
        $index = 0;
        $categoryDetails = new CategoryDetails();
        $products = new Products();
        foreach ($categoryList as $category) {
          $categoryDetailList = $categoryDetails -> findByCategoryIdAndLimit($category -> id, 5);
        ?>
      <section class="section_offset <?php echo ($index > 0) ? 'animated transparent' : '' ?>" <?php echo ($index > 0) ? 'data-animation="fadeInDown"' : ''; $index += 1; ?>>
        <h3>{{category.name}}</h3>
        <!-- - - - - - - - - - - - - - Tabs - - - - - - - - - - - - - - - - -->
        <div class="tabs type_2 products">
          <!-- - - - - - - - - - - - - - Navigation of tabs - - - - - - - - - - - - - - - - -->
          <ul class="tabs_nav clearfix">
            <?php foreach ($categoryDetailList as $categoryDetail) {?>
            <li><a href="#tab-{{categoryDetail.id}}">{{categoryDetail.name}}</a></li>
            <?php }?>
          </ul>
          
          <!-- - - - - - - - - - - - - - End navigation of tabs - - - - - - - - - - - - - - - - -->

          <!-- - - - - - - - - - - - - - Tabs container - - - - - - - - - - - - - - - - -->

          <div class="tab_containers_wrap">
            <?php foreach ($categoryDetailList as $categoryDetail) {
              $productList = $products -> findByCatelogyDetailAndLimit($categoryDetail -> id, 5);

            ?>
            <div id="tab-{{categoryDetail.id}}" class="tab_container">
              <!-- - - - - - - - - - - - - - Carousel of featured products - - - - - - - - - - - - - - - - -->
              <div class="owl_carousel carousel_in_tabs">
              <?php foreach ($productList as $product) {?>
                <div class="product_item type_2">
                  <!-- - - - - - - - - - - - - - Thumbmnail - - - - - - - - - - - - - - - - -->
                  <div class="image_wrap">
                    <img src="{{product.image_thumbnail}}" alt="{{product.name}}">
                    <!-- - - - - - - - - - - - - - Product actions - - - - - - - - - - - - - - - - -->
                    <div class="actions_wrap">
                      <div class="centered_buttons">
                        <a href="/san-pham/{{product.slug}}" class="button_dark_grey middle_btn quick_view">Xem chi tiết</a>
                      </div><!--/ .centered_buttons -->
                    </div><!--/ .actions_wrap-->
                    <!-- - - - - - - - - - - - - - End of product actions - - - - - - - - - - - - - - - - -->
                  </div><!--/. image_wrap-->
                  <!-- - - - - - - - - - - - - - End thumbmnail - - - - - - - - - - - - - - - - -->
                  <!-- - - - - - - - - - - - - - Label - - - - - - - - - - - - - - - - -->
                  <?php if ($product -> status == 1) {?>
                  <div class="label_new">Mới</div>
                  <?php } elseif ($product -> status == 2) {?>
                  <div class="label_hot">Hot</div>
                  <?php }?>
                  <!-- - - - - - - - - - - - - - End label - - - - - - - - - - - - - - - - -->
                  <!-- - - - - - - - - - - - - - Product title & price - - - - - - - - - - - - - - - - -->
                  <div class="description text-center">
                    <a href="/san-pham/{{product.slug}}" class="text-overflow">{{product.name}}</a>
                    <div class="clearfix product_info">
                      <?php if ($product->sale_price > 0) {?>
                          <p class="old-price"><s><?php echo number_format($product -> price)?> VNĐ</s></p>
                          <p class="product_price discount-price color-red"><strong><?php echo number_format($product -> sale_price)?> VNĐ</strong></p>
                      <?php } else {?>
                          <p class="old-price">&nbsp;</p>
                          <p class="product_price discount-price color-red"><strong><?php echo number_format($product -> price)?> VNĐ</strong></p>
                      <?php }?>
                    </div>
                  </div>
                  <!-- - - - - - - - - - - - - - End of product title & price - - - - - - - - - - - - - - - - -->
                  <!-- - - - - - - - - - - - - - Actions - - - - - - - - - - - - - - - - -->
                  <div class="buttons_row">
                    <a href="javascript:void(0)" class="button_blue ajx-add-cart" data-id="{{product.id}}">Thêm vào giỏ hàng</a>
                    <!-- <button class="button_dark_grey middle_btn def_icon_btn add_to_wishlist tooltip_container"><span class="tooltip top">Add to Wishlist</span></button>
                    <button class="button_dark_grey middle_btn def_icon_btn add_to_compare tooltip_container"><span class="tooltip top">Add to Compare</span></button> -->
                  </div>
                  <!-- - - - - - - - - - - - - - End of actions - - - - - - - - - - - - - - - - -->
                </div>
                <?php }?>
              </div>
              <!-- - - - - - - - - - - - - - View all - - - - - - - - - - - - - - - - -->
              <footer class="bottom_box">
                <a href="/danh-muc/{{category.slug}}/{{categoryDetail.slug}}" class="button_grey middle_btn">Xem tất cả sản phẩm</a>
              </footer>
              <!-- - - - - - - - - - - - - - End of view all - - - - - - - - - - - - - - - - -->
            </div>
            <?php }?>

          </div>

          <!-- - - - - - - - - - - - - - End of tabs containers - - - - - - - - - - - - - - - - -->

        </div><!--/ .tabs.section_offset-->
        
        <!-- - - - - - - - - - - - - - End of tabs - - - - - - - - - - - - - - - - -->

      </section><!--/ .section_offset -->
      <?php }?>

<script>
$(document).ready(function() {

    $('.carousel').carousel({
        interval: 4000
    })
});
</script>