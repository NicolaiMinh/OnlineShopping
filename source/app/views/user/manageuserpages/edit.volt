<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-heading">Edit Project Pages</div>
            <div class="panel-body">
                <form class="form-horizontal" method="post" id="addProjectPage" action="/user/manageuserpages/edit/{{data.id}}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-6">
                            <input name="name" type="text" class="form-control" value="{{data.name}}" id="name" maxlength="100">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Content</label>
                        <div class="col-sm-10">
                            <textarea name="content" id="content"><?php echo $data ->content ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Status</label>
                        <div class="col-sm-6">
                            <select name="status">
                                <option value="1" <?php echo $data -> status == "1" ? "selected" :"" ?>>Active</option>
                                <option value="0" <?php echo $data -> status == "0" ? "selected" :"" ?>>Disable</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-6">
                            <button class="btn btn-primary" type="submit" id="btnSubmit">Save</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="panel-footer"></div>
        </div>
    </div>
</div>
<script language="javascript" src="/js/jquery.validate.min.js" type="text/javascript"></script>
<script language="javascript" src="/admin/ckeditor/ckeditor.js" type="text/javascript"></script>
<script language="javascript" src="/admin/javascripts/sitepages/sitepages.js" type="text/javascript"></script>