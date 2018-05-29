<aside class="col-md-3 col-sm-4 has_mega_menu hidden-xs">

              <!-- - - - - - - - - - - - - - Today's deals - - - - - - - - - - - - - - - - -->

            
              <!-- - - - - - - - - - - - - - End of today's deals - - - - - - - - - - - - - - - - -->

              <!-- - - - - - - - - - - - - - Categories - - - - - - - - - - - - - - - - -->

              <section class="section_offset">

                <h3>Danh mục</h3>

                <ul class="theme_menu cats">
                  <?php
                  use MyApp\Model\Categories;
                  use MyApp\Model\CategoryDetails;

                  $categories = new Categories();
                  $categoryDetails = new CategoryDetails();

                  $categoryList = $categories -> findAllOrderByUpdated();
                  foreach ($categoryList as $item) {
                      $categoryDetailListSidebar = $categoryDetails -> findByCategoryId($item -> id);?>
                      
                          <li class="has_megamenu">
                            <a href="#"><?php echo $item -> name?></a>
                            <?php if (count($categoryDetailListSidebar) > 0) {?>
                              <!-- - - - - - - - - - - - - - Mega menu - - - - - - - - - - - - - - - - -->
                              <div class="mega_menu clearfix">
                                <!-- - - - - - - - - - - - - - Mega menu item - - - - - - - - - - - - - - - - -->
                                <div class="mega_menu_item">
                                  <ul class="list_of_links">
                                  <?php foreach ($categoryDetailListSidebar as $detail) { ?>
                                    <li><a href="/danh-muc/<?php echo $item -> slug ?>/<?php echo $detail -> slug ?>"><?php echo $detail -> name ?></a></li>
                                  <?php }?>
                                  </ul>
                                </div><!--/ .mega_menu_item-->
                                <!-- - - - - - - - - - - - - - End of mega menu item - - - - - - - - - - - - - - - - -->
                              </div><!--/ .mega_menu-->
                              <?php }?>
                            <!-- - - - - - - - - - - - - - End of mega menu - - - - - - - - - - - - - - - - -->
                          </li>
                  <?php }?>
                  <li class="has_megamenu"><a href="/danh-muc/tat-ca" class="all"><b>Tất cả danh mục</b></a></li>

                </ul>

              </section><!--/ .animated.transparent-->

              <!-- - - - - - - - - - - - - - End of categories - - - - - - - - - - - - - - - - -->

              <!-- - - - - - - - - - - - - - Bestseller Products - - - - - - - - - - - - - - - - -->

              <section class="section_offset">
                <h3>Sản phẩm nổi bật</h3>
                <ul class="products_list_widget products_list_sidebar">
                  <!-- - - - - - - - - - - - - - Product - - - - - - - - - - - - - - - - -->
                  <?php 
                    use MyApp\Model\Products;
                    $products = new Products();
                    $productHotSidebar = $products -> findByStatus(PRODUCT_HOT, 3);
                    foreach ($productHotSidebar as $productHot) {
                  ?>
                  <li>
                    <a href="/san-pham/{{productHot.slug}}" class="product_thumb">
                      <img src="{{productHot.image_thumbnail}}" alt="{{productHot.name}}">
                    </a>
                    <div class="wrapper">
                      <a href="/san-pham/{{productHot.slug}}" class="product_title text-overflow">{{productHot.name}}</a>
                      <div class="clearfix product_info">
                        <?php if ($productHot->sale_price > 0) {?>
                          <p class="old-price"><s><?php echo number_format($productHot -> price)?> VNĐ</s></p>
                          <p class="product_price discount-price color-red"><strong><?php echo number_format($productHot -> sale_price)?> VNĐ</strong></p>
                        <?php } else {?>
                            <p class="product_price discount-price color-red"><strong><?php echo number_format($productHot -> price)?> VNĐ</strong></p>
                        <?php }?>
                      </div>
                    </div>
                  </li>
                  <?php }?>
                  <!-- - - - - - - - - - - - - - End of product - - - - - - - - - - - - - - - - -->
                </ul><!--/ .list_of_products-->

                <!-- - - - - - - - - - - - - - View all products - - - - - - - - - - - - - - - - -->

                <footer class="bottom_box">

                  <a href="/san-pham-noi-bat" class="button_grey middle_btn">View All</a>

                </footer>

                <!-- - - - - - - - - - - - - -End of view all products - - - - - - - - - - - - - - - - -->

              </section>

              <!-- - - - - - - - - - - - - - End of Bestseller Products - - - - - - - - - - - - - - - - -->

              <!-- - - - - - - - - - - - - - Banner - - - - - - - - - - - - - - - - -->

              <div class="section_offset">

                <a href="#">
                  
                  <img src="/images/banner_img_11.png" alt="">

                </a>

              </div>

              <!-- - - - - - - - - - - - - - End of banner - - - - - - - - - - - - - - - - -->

              <!-- - - - - - - - - - - - - - On Sale Products - - - - - - - - - - - - - - - - -->

              <section class="section_offset">

                <h3>Sản phẩm giảm giá</h3>

                <ul class="products_list_widget products_list_sidebar">
                <?php 
                    $productSaleSidebar = $products -> findBySale(3);
                    foreach ($productSaleSidebar as $productSale) {
                  ?>
                  <li>
                    <a href="/san-pham/{{productSale.slug}}" class="product_thumb">
                      <img src="{{productSale.image_thumbnail}}" alt="{{productSale.name}}">
                    </a>
                    <div class="wrapper">
                      <a href="/san-pham/{{productSale.slug}}" class="product_title text-overflow">{{productSale.name}}</a>
                      <div class="clearfix product_info">
                        <?php if ($productSale->sale_price > 0) {?>
                          <p class="old-price"><s><?php echo number_format($productSale -> price)?> VNĐ</s></p>
                          <p class="product_price discount-price color-red"><strong><?php echo number_format($productSale -> sale_price)?> VNĐ</strong></p>
                        <?php } else {?>
                            <p class="product_price discount-price color-red"><strong><?php echo number_format($productSale -> price)?> VNĐ</strong></p>
                        <?php }?>
                      </div>
                    </div>
                  </li>
                  <?php }?>
                </ul><!--/ .list_of_products-->

                <!-- - - - - - - - - - - - - - View all products - - - - - - - - - - - - - - - - -->

                <footer class="bottom_box">

                  <a href="/san-pham-giam-gia" class="button_grey middle_btn">View All</a>

                </footer>

                <!-- - - - - - - - - - - - - -End of view all products - - - - - - - - - - - - - - - - -->

              </section>

              <!-- - - - - - - - - - - - - - End of On Sale Products - - - - - - - - - - - - - - - - -->

            </aside><!--/ [col]-->