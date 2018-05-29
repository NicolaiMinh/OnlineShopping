<?php
     $contrllerName = $this->dispatcher->getControllerName();
     $actionName = $this->dispatcher->getActionName();
?>
<aside id="sidebar-left" class="sidebar-left">

    <div class="sidebar-header">
        <div class="sidebar-title">&nbsp;</div>
        <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
            <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
        </div>
    </div>

    <div class="nano">
        <div class="nano-content">
            <nav id="menu" class="nav-main" role="navigation">
                <ul class="nav nav-main">
                    <li class="<?php echo $contrllerName == 'managesites' ? 'nav-expanded nav-active' : '';?>">
                        <a href="/admin/managesites">
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Cài đặt chung</span>
                        </a>
                    </li>
                    <li class="nav-parent <?php echo $contrllerName == 'managemanufactures' ? 'nav-expanded nav-active' : '';?>">
                        <a href="#">
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Thương hiệu</span>
                        </a>
                        <ul class="nav nav-children">
                            <li class="<?php echo $contrllerName == 'managemanufactures' && $actionName== 'add' ? 'nav-active' : '';?>">
                                <a href="/admin/managemanufactures/add">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    <span>Tạo Thương hiệu</span>
                                </a>
                            </li>
                            <li class="<?php echo $contrllerName == 'managemanufactures' && $actionName== 'index' ? 'nav-active' : '';?>">
                                <a href="/admin/managemanufactures">
                                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                                    <span>DS Thương hiệu</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-parent <?php echo $contrllerName == 'managecategories' ? 'nav-expanded nav-active' : '';?>">
                        <a href="#">
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Danh mục</span>
                        </a>
                        <ul class="nav nav-children">
                            <li class="<?php echo $contrllerName == 'managecategories' && $actionName== 'add' ? 'nav-active' : '';?>">
                                <a href="/admin/managecategories/add">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    <span>Tạo danh mục</span>
                                </a>
                            </li>
                            <li class="<?php echo $contrllerName == 'managecategories' && $actionName== 'index' ? 'nav-active' : '';?>">
                                <a href="/admin/managecategories">
                                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                                    <span>DS danh mục</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-parent <?php echo $contrllerName == 'managecategorydetails' ? 'nav-expanded nav-active' : '';?>">
                        <a href="#">
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Chi tiết danh mục</span>
                        </a>
                        <ul class="nav nav-children">
                            <li class="<?php echo $contrllerName == 'managecategorydetails' && $actionName== 'add' ? 'nav-active' : '';?>">
                                <a href="/admin/managecategorydetails/add">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    <span>Tạo mới</span>
                                </a>
                            </li>
                            <li class="<?php echo $contrllerName == 'managecategorydetails' && $actionName== 'index' ? 'nav-active' : '';?>">
                                <a href="/admin/managecategorydetails">
                                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                                    <span>DS chi tiết danh mục</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-parent <?php echo $contrllerName == 'manageproducts' ? 'nav-expanded nav-active' : '';?>">
                        <a href="#">
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Sản phẩm</span>
                        </a>
                        <ul class="nav nav-children">
                            <li class="<?php echo $contrllerName == 'manageproducts' && $actionName== 'add' ? 'nav-active' : '';?>">
                                <a href="/admin/manageproducts/add">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    <span>Thêm sản phẩm</span>
                                </a>
                            </li>
                            <li class="<?php echo $contrllerName == 'manageproducts' && $actionName== 'index' ? 'nav-active' : '';?>">
                                <a href="/admin/manageproducts">
                                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                                    <span>DS sản phẩm</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-parent <?php echo $contrllerName == 'manageorders' ? 'nav-expanded nav-active' : '';?>">
                        <a href="#">
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Đặt hàng</span>
                        </a>
                        <ul class="nav nav-children">
                            <li class="<?php echo $contrllerName == 'manageorders' && $actionName== 'index' ? 'nav-active' : '';?>">
                                <a href="/admin/manageorders">
                                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                                    <span>DS Đặt hàng</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-parent <?php echo $contrllerName == 'managebanner' ? 'nav-expanded nav-active' : '';?>">
                        <a href="#">
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Banner</span>
                        </a>
                        <ul class="nav nav-children">
                            <li class="<?php echo $contrllerName == 'managebanner' && $actionName== 'add' ? 'nav-active' : '';?>">
                                <a href="/admin/managebanner/add">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    <span>Tạo Banner</span>
                                </a>
                            </li>
                            <li class="<?php echo $contrllerName == 'managebanner' && $actionName== 'index' ? 'nav-active' : '';?>">
                                <a href="/admin/managebanner">
                                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                                    <span>DS Banner</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</aside>