<div class="content animate-panel">
    <div class="row">
        <div class="hpanel">
            <div class="panel-body">
                <form class="form-horizontal" role="form" action="/admin/manageproducts/edit/{{data.id}}" method="post" id="addProduct" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Tên</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="name" id="name" value="{{data.name}}"  maxlength="100">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Thương hiệu</label>
                        <div class="col-sm-4">
                            <select name="manufacture" class="form-control" id="manufacture">
                                <option value="0">-- Không có thương hiệu --</option>
                                <?php foreach ($manufactures as $item) { ?>
                                    <option value="<?php echo $item -> id?>" <?php echo $item->id == $data->manufacture_id ? 'selected' : ''?>><?php echo $item -> name?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Danh mục</label>
                        <div class="col-sm-4">
                            <select name="category" class="form-control" id="category">
                                <?php foreach ($categories as $item) { ?>
                                    <option value="<?php echo $item -> id?>" <?php echo $item->id == $data->category_id ? 'selected' : ''?>><?php echo $item -> name?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Danh mục</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <?php
                                    $arr = substr($data -> category_detail_ids, 1, -1);
                                    $arr = explode(',', $arr);
                                    foreach ($categoryDetailList as $item) {?>
                                    <div class="col-sm-3 checkbox-custom checkbox-default checkbox-inline mt-sm ml-md mr-md div_category_detail" data-categoryid="{{item.category_id}}">
                                        <input type="checkbox"  name="category_detail[]" value="{{item.id}}" id="exampleCheckbox{{item.id}}" <?php echo in_array($item->id, $arr)==true?'checked':''?> />
                                        <label for="exampleCheckbox{{item.id}}">{{item.name}}</label>
                                    </div>
                                <?php }?>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Giá</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="price" id="price" value="{{data.price}}" maxlength="100">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Giá giảm (nếu có)</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="sale_price" id="sale_price" value="{{data.sale_price}}" maxlength="100">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Tình trạng</label>
                        <div class="col-sm-10">
                            <div class="radio-custom radio-primary radio-inline">
                                <input type="radio" id="status_normal" name="status" value="0" <?php echo $data->status == 0 ? 'checked' : ''?>/>
                                <label for="status_normal">Bình thường</label>
                            </div>
                            <div class="radio-custom radio-primary radio-inline">
                                <input type="radio" id="status_new" value="1" name="status" <?php echo $data->status == 1 ? 'checked' : ''?>/>
                                <label for="status_new">Mới</label>
                            </div>
                            <div class="radio-custom radio-primary radio-inline">
                                <input type="radio" id="status_hot" value="2" name="status" <?php echo $data->status == 2 ? 'checked' : ''?>/>
                                <label for="status_hot">Hot</label>
                            </div>
                        </div>
                    </div>

                    <div class= "form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-6">
                            <img src="<?php echo $data -> image_thumbnail != '' ? $data -> image_thumbnail : '/files/images/Logo-26-Dec-2015-3.jpg';?>" class="col-sm-6 imageUpload img-responsive pl0 pr0" id="image_thumbnail_show" style="width: 130px; height: 130px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Image for Thumbnail (320 x 480)</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="image_thumbnail" id="image_thumbnail" value="{{data.image_thumbnail}}" type="hidden">
                            <a class="btn btn-primary" href="javascript:void(0)" onclick="openKCFinder('image_thumbnail','image_thumbnail_show')"><i class="fa fa-folder-open-o"></i> Chọn thumbnail</a>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Images Slide (320 x 480)</label>
                        <div class="col-sm-10">
                           <div class="row show-image col-sm-12">
                                <?php
                                    $detailImages = explode(',', $data -> image_slides);
                                    foreach($detailImages as $img) {?>
                                        <div class="img-upload">
                                            <img class="img-responsive image-show" src="<?php echo $img ?>" alt="Project">
                                            <img src="/images/icon-delete-16x16.png" alt="" class="img-delete">
                                            <input type="hidden" name="images[]" value="<?php echo $img ?>" class="image-hidden">
                                        </div>
                                <?php }
                                ?>
                            </div>
                            <a class="btn btn-primary btn-select-image" href="javascript:void(0)"><i class="fa fa-folder-open-o"></i> Select image</a>
                        </div>
                    </div>

                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Short description</label>
                        <div class="col-sm-10">
                            <textarea name="short_description" id="short_description" >{{data.short_description}}</textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-10">
                            <textarea name="description" id="description" >{{data.description}}</textarea>
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
<script language="javascript" src="/themeadmin/ckeditor/ckeditor.js" type="text/javascript"></script>
<script language="javascript" src="/themeadmin/scripts/products/product.js" type="text/javascript"></script>
<script language="javascript" src="/themeadmin/scripts/products/product-validation.js" type="text/javascript"></script>


<link rel="stylesheet" href="/themeadmin/stylesheets/products/product.css" type="text/css">
<script type="text/javascript">
    function openKCFinder(input, id) {
        window.KCFinder = {
            callBackMultiple: function(files) {
                window.KCFinder = null;
                $("#" + input).value = "";
                if (files.length > 1) {
                    showPopupMessage("notification", "Please choose one file");
                    return;
                }
                for (var i = 0; i < files.length; i++) {
                    $("#" + input).val(files[i]);
                    $("#" + id).prop("src", files[i]);
                }
            }
        };
        window.open('/themeadmin/kcfinder/browse.php?type=images',  'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
        'directories=0, resizable=1, scrollbars=0, width=800, height=600');
    }
</script>