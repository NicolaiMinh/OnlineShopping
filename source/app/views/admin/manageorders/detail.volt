<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-2 control-label"><strong>Tên</strong></label>
                    <label class="col-sm-10"><?php echo $data -> name?></label>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><strong>Tổng tiền</strong></label>
                    <label class="col-sm-10"><?php echo number_format($data->total_price, 2)  ?></label>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><strong>Email</strong></label>
                    <label class="col-sm-10"><?php echo $data -> email?></label>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><strong>Số điện thoại</strong></label>
                    <label class="col-sm-10"><?php echo $data -> phone?></label>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><strong>Địa chỉ</strong></label>
                    <label class="col-sm-10"><?php echo $data -> address?></label>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><strong>Ghi chú</strong></label>
                    <label class="col-sm-10"><?php echo $data -> note?></label>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><strong>Trạng thái đơn hàng</strong></label>
                    <label class="col-sm-10">
                        <?php if ($data -> status == 1) {?>
                            <a class="btn btn-success"> Chưa xem </a>
                        <?php } elseif ($data -> status == 2) {?>
                            <a class="btn btn-warning"> Đang xử lý </a>
                        <?php } elseif ($data -> status == 3) {?>
                            <a class="btn btn-primary"> Đã giao hàng </a>
                        <?php } elseif ($data -> status == 4) {?>
                            <a class="btn btn-danger"> Đã hủy </a>
                        <?php }?>
                    </label>
                </div>
                <hr>

                <div class="table-responsive">
                    <table cellpadding="1" cellspacing="1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($orderDetails as $item) {?>
                            <tr class="odd gradeX">
                                <td style="width:'50px'"><img width="50" src="<?php echo $item -> product -> image_thumbnail;?>"/></td>
                                <td><?php echo $item -> product -> name?></td>
                                <td><?php echo $item->quantity; ?></td>
                                <td><?php echo number_format($item->price); ?></td>
                            </tr>
                            <?php }?>
                        </tbody>
                    </table>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><strong>Cập nhật trạng thái</strong></label>
                    <label class="col-sm-10">
                            <a class="btn btn-success" href="/admin/manageorders/updateorder/{{data.id}}/1"> Chưa xem </a>
                            <a class="btn btn-warning" href="/admin/manageorders/updateorder/{{data.id}}/2"> Đang xử lý </a>
                            <a class="btn btn-primary" href="/admin/manageorders/updateorder/{{data.id}}/3"> Đã giao hàng </a>
                            <a class="btn btn-danger" href="/admin/manageorders/updateorder/{{data.id}}/4"> Đã hủy </a>
                    </label>
                </div>
            </div>
        </div>
    </div>
</div>