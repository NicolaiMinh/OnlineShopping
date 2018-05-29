<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-body">
                <?php if($this->flashSession->has()) {?>
                    <?php echo $this->flashSession->output();
                    $this -> flashSession -> clear();?>
                <?php } ?>
                <form class="form-horizontal" role="form" action="/admin/managebanner/add" method="post" id="addBanner">

                    <!-- <div class="form-group">
                        <label class="col-sm-2 control-label">Tiêu đề nhỏ</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="text" maxlength="100">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Tiêu đề lớn</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="text2" maxlength="100">
                        </div>
                    </div> -->

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Image (1500 x 737)</label>
                        <div class="col-sm-4">
                            <input readonly placeholder="click choose image" type="text" name="image" id="image1" class="form-control">
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
<script language="javascript" src="/themeadmin/ckeditor/ckeditor.js" type="text/javascript"></script>
<script language="javascript" src="/themeadmin/scripts/banner/edit.js" type="text/javascript"></script>
<script language="javascript" src="/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#addBanner").validate({
            ignore: "",
           // onsubmit: false,
            onfocusout: function(element, event) {
                if ($(element).valid()) {
                    $(element).closest("div.form-group").removeClass("has-error");
                    //$(element).closest("div.form-group").addClass("has-success");
                    $(element).closest("div.form-group").find("label.error").remove();
                }
            },

            onkeyup: function(element, event) {
                $(element).valid();
            },

            errorPlacement: function(error, element) {
                $(element).closest("div.form-group").addClass("has-error");
                //$(element).closest("div.form-group").removeClass("has-success");
                error.insertAfter(element);
            },

            invalidHandler: function(form, validator) {
                if (!validator.numberOfInvalids()) {
                    return;
                }
            }
        });
        $('#image1').rules("add", {
            required: true,
            minlength: 2,
            maxlength:100,
        });
    });
</script>