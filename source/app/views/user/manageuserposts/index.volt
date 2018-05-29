<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-body">
                <?php if($this->flashSession->has()) {?>
                    <?php echo $this->flashSession->output(); ?>
                <?php } ?>
                <div class="table-responsive">
                    <table cellpadding="1" cellspacing="1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Time update</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($data->items as $item) {?>
                            <tr class="odd gradeX">
                                <td><?php echo $item->name; ?></td>
                                <td><?php echo $item->description; ?></td>
                                <td><?php echo $item->updated_at; ?></td>
                                <td class="center"><a class="btn btn-success" href="/user/manageuserposts/edit/<?php echo $item->id;?>"> edit </a></td>
                                <td class="center"><a class="btn btn-danger delete-element" href="/user/manageuserposts/delete/<?php echo $item->id;?>"> delete </a></td>
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