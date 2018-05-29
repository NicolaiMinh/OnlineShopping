<link rel="stylesheet" type="text/css" href="/admin/menu/jquery.domenu-0.95.77.css"/>
<link rel="stylesheet" type="text/css" href="/admin/menu/select2.min.css"/>
<?php if($this->flashSession->has()) {?>
    <?php echo $this->flashSession->output(); ?>
<?php } ?>
<section>
    <div class="dd" id="domenu-1">
        <button id="domenu-add-item-btn" class="dd-new-item">+</button>
        <!-- .dd-item-blueprint is a template for all .dd-item's -->
        <li class="dd-item-blueprint">
            <!-- @migrating-from 0.48.59 button container -->
            <button class="collapse" data-action="collapse" type="button" style="display: none;">–</button>
            <button class="expand" data-action="expand" type="button" style="display: none;">+</button>
            <div class="dd-handle dd3-handle">Drag</div>
            <div class="dd3-content">
                <span class="item-name">[item_name]</span>
                <!-- @migrating-from 0.13.29 button container-->
                <!-- .dd-button-container will hide once an item enters the edit mode -->
                <div class="dd-button-container">
                    <!-- @migrating-from 0.13.29 add button-->
                    <button class="custom-button-example">&#x270E;</button>
                    <button class="item-add">+</button>
                    <button class="item-remove" data-confirm-class="item-remove-confirm">&times;</button>
                </div>
                <!-- Inside of .dd-edit-box you can add your custom input fields -->
                <div class="dd-edit-box" style="display: none;">
                    <!-- data-placeholder has a higher priority than placeholder -->
                    <!-- data-placeholder can use token-values; when not present will be set to "" -->
                    <!-- data-default-value specifies a default value for the input; when not present will be set to "" -->
                    <input type="text" name="title" autocomplete="off" placeholder="Item"
                    data-placeholder="Any nice idea for the title?"
                    data-default-value="doMenu List Item. {?numeric.increment}">
                    <select name="custom-select">
                        <option value="/">Home</option>
                        <option value="#">Empty link</option>
                        <?php foreach ($data as $item) {?>
                            <option value="{{item.slug}}">{{item.name}}</option>
                        <?php }?>
                    </select>
                    <!-- @migrating-from 0.13.29 an element ".end-edit" within ".dd-edit-box" exists the edit mode on click -->
                    <i class="end-edit">save</i>
                </div>
            </div>
        </li>
        <ol class="dd-list"></ol>
    </div>
    <form action="/user/manageusermenus/save" method="post">
        <input type="hidden" name='menu-data' class='menu-data' value='{{menu.data}}'/>
        <input type="hidden" name='menu-id' class='menu-id' value="{{menu.id}}"/>
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</section>

<script>
    $(document).ready(function() {
        var $domenu = $('#domenu-1'),
            domenu = $('#domenu-1').domenu();

        $domenu.domenu({
            slideAnimationDuration : 0,
            select2 : {
                support : true,
                params : {
                    tags : true
                }
            },
            data : '{{menu.data}}'
        })
        // Example: initializing functionality of a custom button #21
        .onCreateItem(function(blueprint) {
            // We look with jQuery for our custom button we denoted with class "custom-button-example"
            // Note 1: blueprint holds a reference of the element which is about to be added the list
            var customButton = $(blueprint).find('.custom-button-example');

            // Here we define our custom functionality for the button,
            // we will forward the click to .dd3-content span and let
            // doMenu handle the rest
            customButton.click(function() {
                blueprint.find('.dd3-content span').first().click();
            });
        })
        // Now every element which will be parsed will go through our onCreateItem event listener, and therefore
        // initialize the functionality our custom button
        .parseJson().on(['onItemCollapsed', 'onItemExpanded', 'onItemAdded', 'onSaveEditBoxInput', 'onItemDrop', 'onItemDrag', 'onItemRemoved', 'onItemEndEdit'], function(a, b, c) {
            console.log(domenu.toJson());
            $('.menu-data').val(domenu.toJson());
            window.localStorage.setItem('domenu-1Json', domenu.toJson());
        }).onToJson(function() {
        });
    });
</script>

<script src="/admin/menu/jquery.domenu-0.95.77.min.js"></script>
<script src="/admin/menu/select2.min.js"></script>