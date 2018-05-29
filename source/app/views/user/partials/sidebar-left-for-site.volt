<?php
     $contrllerName = $this->dispatcher->getControllerName();
     $actionName = $this->dispatcher->getActionName();
?>
<aside id="sidebar-left" class="sidebar-left">

    <div class="sidebar-header">
        <div class="sidebar-title">
            Navigation
        </div>
        <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
            <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
        </div>
    </div>

    <div class="nano">
        <div class="nano-content">
            <nav id="menu" class="nav-main" role="navigation">
                <ul class="nav nav-main">
                    <li class="nav-parent <?php echo $contrllerName == 'manageuserpages' ? 'nav-expanded nav-active' : '';?>">
                        <a href="#">
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Pages</span>
                        </a>
                        <ul class="nav nav-children">
                            <li class="<?php echo $contrllerName == 'manageuserpages' && $actionName== 'add' ? 'nav-active' : '';?>">
                                <a href="/user/manageuserpages/add">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    <span>Create New Page</span>
                                </a>
                            </li>
                            <li class="<?php echo $contrllerName == 'manageuserpages' && $actionName== 'index' ? 'nav-active' : '';?>">
                                <a href="/user/manageuserpages">
                                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                                    <span>Pages</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-parent <?php echo $contrllerName == 'manageuserposts' ? 'nav-expanded nav-active' : '';?>">
                        <a href="#">
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Posts</span>
                        </a>
                        <ul class="nav nav-children">
                            <li class="<?php echo $contrllerName == 'manageuserposts' && $actionName== 'add' ? 'nav-active' : '';?>">
                                <a href="/user/manageuserposts/add">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    <span>Create New Post</span>
                                </a>
                            </li>
                            <li class="<?php echo $contrllerName == 'manageuserposts' && $actionName== 'index' ? 'nav-active' : '';?>">
                                <a href="/user/manageuserposts">
                                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                                    <span>Posts</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="<?php echo $contrllerName == 'manageusermenus' ? 'nav-active' : '';?>">
                        <a href="/user/manageusermenus/">
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Menus/Tags</span>
                        </a>
                    </li>
                    <li class="">
                        <a>
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Template (Layouts)</span>
                        </a>
                    </li>
                    <li class="">
                        <a>
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>Site Settings</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</aside>