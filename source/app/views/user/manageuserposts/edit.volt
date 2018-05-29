<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-body">
                <form class="form-horizontal" role="form" action="/user/manageuserposts/edit/<?php echo $post -> id?>" method="post" id="addPosts" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="name" id="name" value="<?php echo $post -> name?>" maxlength="100">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="description" id="description" value="<?php echo $post -> description?>" maxlength="100">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Content</label>
                        <div class="col-sm-10">
                            <textarea name="content" id="content" ><?php echo $post -> content?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Image</label>
                        <div class="col-sm-4">
                            <input type="file" name="image" id="image-edit" value="<?php echo $post -> image?>" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Status</label>
                        <div class="col-sm-4">
                            <div class="radio-inline">
                                <label>
                                    <input type="radio" name="status" value="1" checked="checked">
                                    Active
                                </label>
                            </div>
                            <div class="radio-inline">
                                <label>
                                    <input type="radio" name="status" value="0">
                                    Disactive
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-4">
                            <button id="btnSubmit" type="submit" class="btn btn-primary">
                                Submit
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script language="javascript" src="/js/jquery.validate.min.js" type="text/javascript"></script>
<script language="javascript" src="/admin/ckeditor/ckeditor.js" type="text/javascript"></script>
<script type="text/javascript">
    var basePath = "/admin/";
    CKEDITOR.replace('content',{allowedContent:true,
    filebrowserBrowseUrl : basePath + 'kcfinder/browse.php?type=files',
    filebrowserImageBrowseUrl : basePath + 'kcfinder/browse.php?type=images',
    filebrowserFlashBrowseUrl : basePath + 'kcfinder/browse.php?type=flash',
    filebrowserUploadUrl : basePath + 'kcfinder/upload.php?type=files',
    filebrowserImageUploadUrl : basePath + 'kcfinder/upload.php?type=images',
    filebrowserFlashUploadUrl : basePath + 'kcfinder/upload.php?type=flash'});
</script>
<script language="javascript" src="/user/js/posts/posts.js" type="text/javascript"></script>