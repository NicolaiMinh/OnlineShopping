<script language="javascript" src="/js/jquery.validate.min.js" type="text/javascript"></script>
<script language="javascript" src="/themeadmin/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="/themeadmin/scripts/sites/index.js"></script>

<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-body">
                <?php if($this->flashSession->has()) {?>
                    <?php echo $this->flashSession->output(); ?>
                <?php } ?>
                <form class="form-horizontal" role="form" action="/admin/managesites" method="post" id="sites">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Logo Header (1730 x 900)</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="logo_header" id="logo_header" value="<?php echo $abouts -> logo_header?>" maxlength="100" onclick="openKCFinder(this)" placeholder="click me..." readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Logo Footer (1730 x 900)</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="logo_footer" id="logo_footer" value="<?php echo $abouts -> logo_footer?>" maxlength="100" onclick="openKCFinder(this)" placeholder="click me..." readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Địa chỉ</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="address" id="address" maxlength="100" value="<?php echo $abouts -> address?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Số điện thoại</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="phone" id="phone" maxlength="100" value="<?php echo $abouts -> phone?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email" maxlength="100" value="<?php echo $abouts -> email?>">
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Giới thiệu website</label>
                        <div class="col-sm-10">
                            <textarea name="content" id="content" ><?php echo $abouts -> content?></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary" id="btnSubmit">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>