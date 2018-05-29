<?php
     $controllerName = $this->dispatcher->getControllerName();
     $actionName = $this->dispatcher->getActionName();
?>
<header id="header" class="type_6">

  <!-- - - - - - - - - - - - - - Bottom part - - - - - - - - - - - - - - - - -->

  <div class="bottom_part">

    <div class="container">

      <div class="row">

        <div class="main_header_row">

          <div class="col-sm-3">

            <!-- - - - - - - - - - - - - - Logo - - - - - - - - - - - - - - - - -->

            <a href="/" class="logo">

              <img src="{{about.logo_header}}" width="" height="74px" alt="Hang xach tay Conan">

            </a>

            <!-- - - - - - - - - - - - - - End of logo - - - - - - - - - - - - - - - - -->

          </div><!--/ [col]-->

          <div class="col-sm-3">

            <!-- - - - - - - - - - - - - - Call to action - - - - - - - - - - - - - - - - -->

            <div class="call_us">

              <span>Gọi cho chúng tôi:</span> <b>{{about.phone}}</b>

            </div><!--/ .call_us-->

            <!-- - - - - - - - - - - - - - End call to action - - - - - - - - - - - - - - - - -->

          </div><!--/ [col]-->

          <div class="col-sm-6">

            <!-- - - - - - - - - - - - - - Search form - - - - - - - - - - - - - - - - -->

            <form class="clearfix search" action='/tim-kiem-san-pham' id='search' method='get'>

              <input type="text" name="strSearch" tabindex="1" placeholder="Tìm kiếm..." class="alignleft" value="<?php echo isset($strSearch) ? htmlspecialchars_decode($strSearch) : '' ?>">
              

              <button class="button_blue def_icon_btn alignleft"></button>

            </form><!--/ #search-->
            
            <!-- - - - - - - - - - - - - - End search form - - - - - - - - - - - - - - - - -->

          </div><!--/ [col]-->

        </div><!--/ .main_header_row-->

      </div><!--/ .row-->

    </div><!--/ .container-->

  </div><!--/ .bottom_part -->

  <!-- - - - - - - - - - - - - - End of bottom part - - - - - - - - - - - - - - - - -->

  <!-- - - - - - - - - - - - - - Main navigation wrapper - - - - - - - - - - - - - - - - -->

  <div id="main_navigation_wrap">

    <div class="container">

      <div class="row">

        <div class="col-xs-12">

          <!-- - - - - - - - - - - - - - Sticky container - - - - - - - - - - - - - - - - -->

          <div class="sticky_inner type_2">

            <!-- - - - - - - - - - - - - - Navigation item - - - - - - - - - - - - - - - - -->

            <div class="nav_item size_4">

              <button class="open_menu"></button>

              <!-- - - - - - - - - - - - - - Main navigation - - - - - - - - - - - - - - - - -->

              <ul class="theme_menu cats dropdown">
                <?php
                  use MyApp\Model\Categories;
                  use MyApp\Model\CategoryDetails;

                  $categories = new Categories();
                  $categoryDetails = new CategoryDetails();

                  $categoryList = $categories -> findAllOrderById();
                  foreach ($categoryList as $item) {
                      $categoryDetailList = $categoryDetails -> findByCategoryId($item -> id);?>
                        <li class="has_megamenu animated_item">
                          <a href="/danh-muc/<?php echo $item -> slug ?>"><?php echo $item -> name?></a>
                          <?php if (count($categoryDetailList) > 0) {?>
                          <!-- - - - - - - - - - - - - - Mega menu - - - - - - - - - - - - - - - - -->
                          <div class="mega_menu clearfix">
                            <!-- - - - - - - - - - - - - - Mega menu item - - - - - - - - - - - - - - - - -->
                            <div class="mega_menu_item">
                              <ul class="list_of_links">
                                <?php foreach ($categoryDetailList as $detail) { ?>
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
                        <li class="has_megamenu animated_item"><a href="/danh-muc/tat-ca" class="all"><b>Tất cả danh mục</b></a></li>

              </ul>

              <!-- - - - - - - - - - - - - - End of main navigation - - - - - - - - - - - - - - - - -->

            </div><!--/ .nav_item-->

            <!-- - - - - - - - - - - - - - End of navigation item - - - - - - - - - - - - - - - - -->

            <!-- - - - - - - - - - - - - - Navigation item - - - - - - - - - - - - - - - - -->

            <div class="nav_item">

              <nav class="main_navigation">

                <ul>

                  <li class="<?php echo $controllerName == 'home' && $actionName == 'index' ? 'current' : '';?>"><a href="/">Trang chủ</a></li>
                  <li class="has_submenu <?php echo ($controllerName == 'newproducts' || $controllerName == 'saleproducts' || $controllerName == 'hotproducts') && $actionName == 'index' ? 'current' : '';?>">
                      <a href="#">Sản phẩm</a>
                      <ul class="theme_menu submenu">
                          <li class="<?php echo $controllerName == 'newproducts' && $actionName == 'index' ? 'current' : '';?>">
                              <a href="/san-pham-moi">Sản phẩm mới</a>
                          </li>
                          <li class="<?php echo $controllerName == 'hotproducts' && $actionName == 'index' ? 'current' : '';?>">
                              <a href="/san-pham-noi-bat">Sản phẩm nổi bật</a>
                          </li>
                          <li class="<?php echo $controllerName == 'saleproducts' && $actionName == 'index' ? 'current' : '';?>">
                              <a href="/san-pham-giam-gia">Sản phẩm giảm giá</a>
                          </li>
                      </ul>
                  </li>
                  <li class="has_submenu <?php echo $controllerName == 'manufactures' && ($actionName == 'index' || $actionName == 'all') ? 'current' : '';?>">
                      <a href="#">Thương hiệu</a>
                      <ul class="theme_menu submenu">
                        <?php
                          use MyApp\Model\Manufactures;
                          $manufactures = new Manufactures();
                          $manufactureList = $manufactures -> findAllOrderById();
                            foreach ($manufactureList as $item) {?>
                            <li class="<?php echo $controllerName == 'manufactures' && $actionName == 'index' && $manufacture -> id == $item -> id ? 'current' : '';?>">
                                <a href="/thuong-hieu/<?php echo $item -> slug ?>"><?php echo $item -> name ?></a>
                            </li>
                          <?php }?>
                          <li class="<?php echo $controllerName == 'manufactures' && $actionName == 'all' ? 'current' : '';?>">
                                <a href="/thuong-hieu/tat-ca">Tất cả thương hiệu</a>
                            </li>
                      </ul>
                  </li>
                  <li class="<?php echo $controllerName == 'shoppingcart' && $actionName == 'index' ? 'current' : '';?>"><a href="/gio-hang">Giỏ hàng</a></li>
                  <li class="<?php echo $controllerName == 'introduce' && $actionName == 'index' ? 'current' : '';?>"><a href="/gioi-thieu">Giới thiệu</a></li>
                  <!-- <li><a href="#">Bài viết</a></li> -->
                  <li class="<?php echo $controllerName == 'contacts' && $actionName == 'index' ? 'current' : '';?>"><a href="/lien-he">Liên hệ</a></li>
                </ul>

              </nav><!--/ .main_navigation-->

            </div>

            <!-- - - - - - - - - - - - - - End of navigation item - - - - - - - - - - - - - - - - -->

            <!-- - - - - - - - - - - - - - Navigation item - - - - - - - - - - - - - - - - -->

            <!-- <div class="nav_item size_4">

              <a href="#" class="wishlist_button" data-amount="7"></a>
              
            </div> --><!--/ .nav_item-->

            <!-- - - - - - - - - - - - - - End of main navigation - - - - - - - - - - - - - - - - -->

            <!-- - - - - - - - - - - - - - Navigation item - - - - - - - - - - - - - - - - -->

            <!-- <div class="nav_item size_4">

              <a href="#" class="compare_button" data-amount="3"></a>
              
            </div> --><!--/ .nav_item-->

            <!-- - - - - - - - - - - - - - End of main navigation - - - - - - - - - - - - - - - - -->

            <!-- - - - - - - - - - - - - - Navigation item - - - - - - - - - - - - - - - - -->

            <div class="nav_item size_3">

              <button id="open_shopping_cart" class="notice-num" data-amount="0">
                <b class="">Giỏ hàng</b>
                <b class="total_price color-red">0</b>
              </button>

              <!-- - - - - - - - - - - - - - Products list - - - - - - - - - - - - - - - - -->

              <div class="shopping_cart dropdown">

                  <div class="animated_item">

                    <p class="title">Recently added item(s)</p>

                    <!-- - - - - - - - - - - - - - Product - - - - - - - - - - - - - - - - -->

                    <div class="clearfix sc_product">

                      <a href="#" class="product_thumb"><img src="/images/sc_img_1.jpg" alt=""></a>

                      <a href="#" class="product_name">Natural Factors PGX Daily Ultra Matrix...</a>

                      <p>1 x $499.00</p>

                      <button class="close"></button>

                    </div><!--/ .clearfix.sc_product-->
                    
                    <!-- - - - - - - - - - - - - - End of product - - - - - - - - - - - - - - - - -->

                  </div><!--/ .animated_item-->

                  <div class="animated_item">

                    <!-- - - - - - - - - - - - - - Product - - - - - - - - - - - - - - - - -->

                    <div class="clearfix sc_product">

                      <a href="#" class="product_thumb"><img src="images/sc_img_2.jpg" alt=""></a>

                      <a href="#" class="product_name">Oral-B Glide Pro-Health Floss...</a>

                      <p>1 x $499.00</p>

                      <button class="close"></button>

                    </div><!--/ .clearfix.sc_product-->
                    
                    <!-- - - - - - - - - - - - - - End of product - - - - - - - - - - - - - - - - -->

                  </div><!--/ .animated_item-->

                  <div class="animated_item">

                    <!-- - - - - - - - - - - - - - Product - - - - - - - - - - - - - - - - -->

                    <div class="clearfix sc_product">

                      <a href="#" class="product_thumb"><img src="/images/sc_img_3.jpg" alt=""></a>

                      <a href="#" class="product_name">Culturelle Kids! Probi-<br>otic Packets 30 ea</a>

                      <p>1 x $499.00</p>

                      <button class="close"></button>

                    </div><!--/ .clearfix.sc_product-->
                    
                    <!-- - - - - - - - - - - - - - End of product - - - - - - - - - - - - - - - - -->

                  </div><!--/ .animated_item-->

                  <div class="animated_item">

                    <!-- - - - - - - - - - - - - - Total info - - - - - - - - - - - - - - - - -->

                    <ul class="total_info">

                      <li><span class="price">Tax:</span> $0.00</li>

                      <li><span class="price">Discount:</span> $37.00</li>

                      <li class="total"><b><span class="price">Total:</span> $999.00</b></li>

                    </ul>
                    
                    <!-- - - - - - - - - - - - - - End of total info - - - - - - - - - - - - - - - - -->

                  </div><!--/ .animated_item-->

                  <div class="animated_item">

                    <a href="#" class="button_grey">View Cart</a>

                    <a href="#" class="button_blue">Checkout</a>

                  </div><!--/ .animated_item-->

                </div><!--/ .shopping_cart.dropdown-->
              
              <!-- - - - - - - - - - - - - - End of products list - - - - - - - - - - - - - - - - -->
              
            </div><!--/ .nav_item-->

            <!-- - - - - - - - - - - - - - End of navigation item - - - - - - - - - - - - - - - - -->

          </div><!--/ .sticky_inner -->

          <!-- - - - - - - - - - - - - - End of sticky container - - - - - - - - - - - - - - - - -->

        </div><!--/ [col]-->

      </div><!--/ .row-->

    </div><!--/ .container-->

  </div><!--/ .main_navigation_wrap-->

  <!-- - - - - - - - - - - - - - End of main navigation wrapper - - - - - - - - - - - - - - - - -->

</header>