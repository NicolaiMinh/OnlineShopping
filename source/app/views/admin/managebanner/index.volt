<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-body">
                <?php if($this->flashSession->has()) {?>
                    <?php echo $this->flashSession->output();
                    $this -> flashSession -> clear(); ?>
                <?php } ?>

                <div class="table-responsive">
                    <table cellpadding="1" cellspacing="1" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Hình ảnh</th>
                            <!-- <th>Tiêu đề nhỏ</th>
                            <th>Tiêu đề lớn</th> -->
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach($data->items as $item){?>
                            <tr>
                                <td> <img src="{{item.image}}" width="75px"/></td>
                                <!-- <td>{{item.text}}</td>
                                <td>{{item.text2}}</td> -->
                                <td><a class="btn btn-info" href="/admin/managebanner/edit/<?php echo $item->id?>"><i class="fa fa-paste"></i> <span class="bold">Edit</span></a></td>
                                <td><a class="btn btn-danger" href="/admin/managebanner/delete/<?php echo $item->id?>"><i class="fa fa-trash-o"></i> <span class="bold">Delete</span></a></td>
                            </tr>
                        <?php }?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
