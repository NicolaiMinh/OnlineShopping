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
                                <th>Id</th>
                                <th>Tên KH</th>
                                <th>Tổng giá</th>
                                <th>Địa chỉ</th>
                                <th>Ngày đặt</th>
                                <th>Chi tiết</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($data->items as $item) {?>
                            <tr class="odd gradeX">
                                <td><?php echo $item->id; ?></td>
                                <td><?php echo $item -> name ?></td>
                                <td><?php echo number_format($item->total_price); ?></td>
                                <td><?php echo $item->address; ?></td>
                                <td><?php echo date("d-m-Y", strtotime($item->created_at)); ?></td>
                                <td class="center"><a class="btn btn-success" href="/admin/manageorders/detail/<?php echo $item->id;?>"> View </a></td>
                                <td class="center">
                                    <?php if ($item -> status == 1) {?>
                                        <a class="btn btn-success"> Chưa xử lý </a>
                                    <?php } elseif ($item -> status == 2) {?>
                                        <a class="btn btn-warning"> Đang xử lý </a>
                                    <?php } elseif ($item -> status == 3) {?>
                                        <a class="btn btn-primary"> Đã giao hàng </a>
                                    <?php } elseif ($item -> status == 4) {?>
                                        <a class="btn btn-danger"> Đã hủy </a>
                                    <?php }?>
                                </td>
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