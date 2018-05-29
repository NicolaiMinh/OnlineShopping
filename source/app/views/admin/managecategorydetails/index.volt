<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-body">
                <?php if($this->flashSession->has()) {?>
                    <?php echo $this -> flashSession -> output(); ?>
                <?php } ?>
                <div class="table-responsive">
                    <table cellpadding="1" cellspacing="1" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Category Name</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach($data->items as $item){?>
                            <tr>
                                <td><?php echo $item->name;?></td>
                                <td><?php echo $item->category->name;?></td>
                                <td><a class="btn btn-info " href="/admin/managecategorydetails/edit/<?php echo $item->id?>"><i class="fa fa-paste"></i> Edit</a></td>
                                <td><a class="btn btn-danger" href="/admin/managecategorydetails/delete/<?php echo $item->id?>"><i class="fa fa-trash-o"></i> <span class="bold">Delete</span></a></td>
                            </tr>
                        <?php }?>
                        </tbody>
                    </table>
                </div>
                {{ partial('partials/paging') }}
            </div>
        </div>
    </div>
</div>
