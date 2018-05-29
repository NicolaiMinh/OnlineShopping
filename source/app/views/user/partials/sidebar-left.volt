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
                    <li class="nav-parent <?php echo $contrllerName == 'managesites' ? 'nav-expanded nav-active' : '';?>">
                        <a>
                            <i class="fa fa-columns" aria-hidden="true"></i>
                            <span>My Sites</span>
                        </a>
                        <ul class="nav nav-children">
                            <li class="<?php echo $contrllerName == 'managesites' && $actionName == 'add' ? 'nav-active' : '';?>">
                                <a href="/user/managesites/add">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    <span>Create New Site</span>
                                </a>
                            </li>
                            <li class="<?php echo $contrllerName == 'managesites' && $actionName == 'index' ? 'nav-active' : '';?>">
                                <a href="/user/managesites">
                                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                                    <span>Sites</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="<?php echo $contrllerName == 'managemyaccount' ? 'nav-active' : '';?>">
                        <a href="/user/dashboarduser">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <span>My Account</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</aside>