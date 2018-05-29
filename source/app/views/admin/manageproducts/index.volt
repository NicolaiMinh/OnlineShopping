<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-body">
                <?php if($this->flashSession->has()) {?>
                    <?php echo $this->flashSession->output(); ?>
                <?php } ?>
                <div class="row mb15">
                    <form action="/admin/manageproducts" method="GET" id="search">
                        <div class="col-md-4">
                            <input type="text" class="form-control focus-out" placeholder="Nhập tên" name="sName" value="{{sName}}"/>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control select-change" name="sCate">
                                <option value="0">-- Tất cả --</option>
                                <?php foreach ($categoryList as $item) {?>
                                    <option value="<?php echo $item -> id; ?>" <?php echo $item -> id == $sCate ? 'selected' : '';?>><?php echo $item -> name; ?></option>
                                <?php }?>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control select-change" name="sManu">
                                <option value="0">-- Tất cả --</option>
                                <?php foreach ($manufactureList as $item) {?>
                                    <option value="<?php echo $item -> id; ?>" <?php echo $item -> id == $sManu ? 'selected' : '';?>><?php echo $item -> name; ?></option>
                                <?php }?>
                            </select>
                        </div>
                        <input type="submit" class="hide" />
                    </form>
                </div>
                <div class="table-responsive">
                    <table cellpadding="1" cellspacing="1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Name</th>
                                <!-- <th>Time update</th> -->
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($data->items as $item) {?>
                            <tr class="odd gradeX">
                                <td><img width="50" src="<?php echo $item -> image_thumbnail;?>"/></td>
                                <td><?php echo $item -> name; ?></td>
                                <!-- <td><?php echo $item -> updated_at; ?></td> -->
                                <td class="center"><a class="btn btn-info" href="/admin/manageproducts/edit/<?php echo $item->id;?>"><i class="fa fa-paste"></i> Edit </a></td>
                                <td class="center"><a class="btn btn-danger delete-element" href="/admin/manageproducts/delete/<?php echo $item->id;?>"><i class="fa fa-trash-o"></i> Delete </a></td>
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

<script>
$(document).ready(function() {
    $(".focus-out").on('focusout', function() {
        $("#search").submit();
    });

    $(".select-change").on('change', function() {
        $("#search").submit();
    });
});
</script>