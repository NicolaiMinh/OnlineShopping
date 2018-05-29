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
                            <th>Site name</th>
                            <th>Manage site</th>
                            <th>Edit</th>
                            <th>Remove site</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach($data->items as $item){?>
                            <tr>
                                <td><a href="/user/manageuserpages/index/{{item.id}}"><?php echo $item->site_name;?></a></td>
                                <td> <a class="btn btn-success" href="/user/manageuserpages/index/{{item.id}}">Manage site</a></td>
                                <td><a class="btn btn-danger" href="/user/managesites/edit/<?php echo $item->id?>"><i class="fa fa-trash-o"></i> <span class="bold">Edit</span></a></td>
                                <td><a class="btn btn-info" href="/user/managesites/delete/<?php echo $item->id?>"><i class="fa fa-trash-o"></i> <span class="bold">Delete</span></a></td>
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

<div id="myModal" class="modal fade hmodal-info" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="color-line"></div>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;
                </button>
                <h4 class="modal-title">Edit tag</h4>
            </div>
            <form action="/admin/managetags/edit" method="post" id="editTag">
                <div class="modal-body">
                    <div class="row form-group">
                        <label class="col-sm-2 control-label text-right">Tag name</label>
                        <div class="col-sm-6">
                            <input class="form-control nameEdit" type="input" name="name" id="name" value=""/>
                            <input class="id" type="hidden" name="id" value=""/>
                        </div>
                        <div class="col-sm-4 text-left">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit" id="btnSubmit">Save change</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Close
                    </button>
                </div>
            </form>
        </div>
    </div>
<script language="javascript" src="/js/jquery.validate.min.js" type="text/javascript"></script>
<!-- <script language="javascript" src="/admin/scripts/tags/validateTag.js" type="text/javascript"></script> -->