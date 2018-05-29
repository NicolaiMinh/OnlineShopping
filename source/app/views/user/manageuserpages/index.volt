<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-heading">Manage Projects</div>
            <div class="panel-body">
                <?php if($this->flashSession->has()) {?>
                    <?php echo $this->flashSession->output(); ?>
                <?php } ?>

                <div class="table-responsive">
                    <table cellpadding="1" cellspacing="1" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Page Name</th>
                            <th>Slug</th>
                            <th>Edit</th>
                            <th>Status</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach($data as $item){?>
                            <tr>
                                <td><?php echo $item->name;?></td>
                                <td><?php echo $item->slug;?></td>
                                <td><a class="btn btn-info " href="/user/manageuserpages/edit/<?php echo $item->id?>"><i class="fa fa-paste"></i> Edit</a></td>
                                <td>
                                    <?php if ($item -> status == 0) { ?>
                                        <a class="btn btn-danger " href="/user/manageuserpages/changeStatus/<?php echo $item->id?>"><i class="fa fa-paste"></i>Disable</a>
                                    <?php } else { ?>
                                        <a class="btn btn-success " href="/user/manageuserpages/changeStatus/<?php echo $item->id?>"><i class="fa fa-paste"></i> Active</a>
                                    <?php } ?>
                                </td>
                                <td><a class="btn btn-danger " href="/user/manageuserpages/delete/<?php echo $item->id?>"><i class="fa fa-paste"></i>Delete</a></td>
                            </tr>
                        <?php }?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="panel-footer"><!--FOOTER TITLE--></div>
        </div>
    </div>
</div>
<script>
$( document ).ready(function() {
    $(".project_id").on("change", function () {
        if($(this).selectedIndex != 0) {
            $(window).attr("location","/admin/manageprojectpages/index/" + $(this).val());
        }

    });
});
</script>