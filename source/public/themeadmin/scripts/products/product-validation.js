$(document).ready(function() {
    validateForm($('#addProduct'));
    initRule();
    $("#btnSubmit").on("click", function() {
        CKEDITOR.instances.description.updateElement();
        //var bannerImage = $('#banner-image').size();
        //var thumbnailImage = $('#thumbnail-image').size();
        if ($("#addProduct").valid()) {
            return true;
        }
        return false;
    });

    var basePath = "/admin/";
    CKEDITOR.replace('description',{allowedContent:true,
    filebrowserBrowseUrl : basePath + 'kcfinder/browse.php?type=files',
    filebrowserImageBrowseUrl : basePath + 'kcfinder/browse.php?type=images',
    filebrowserFlashBrowseUrl : basePath + 'kcfinder/browse.php?type=flash',
    filebrowserUploadUrl : basePath + 'kcfinder/upload.php?type=files',
    filebrowserImageUploadUrl : basePath + 'kcfinder/upload.php?type=images',
    filebrowserFlashUploadUrl : basePath + 'kcfinder/upload.php?type=flash'});

    var basePath = "/admin/";
    CKEDITOR.replace('short_description',{allowedContent:true,
    filebrowserBrowseUrl : basePath + 'kcfinder/browse.php?type=files',
    filebrowserImageBrowseUrl : basePath + 'kcfinder/browse.php?type=images',
    filebrowserFlashBrowseUrl : basePath + 'kcfinder/browse.php?type=flash',
    filebrowserUploadUrl : basePath + 'kcfinder/upload.php?type=files',
    filebrowserImageUploadUrl : basePath + 'kcfinder/upload.php?type=images',
    filebrowserFlashUploadUrl : basePath + 'kcfinder/upload.php?type=flash'});

});

function validateForm($form) {
    $form.validate({
        ignore: "",
        onsubmit: false,
        onfocusout: function(element, event) {
            if ($(element).valid()) {
                $(element).closest("div.form-group").removeClass("has-error");
                $(element).closest("div.form-group").find("label.error").remove();
            }
        },

        onkeyup: function(element, event) {
            CKEDITOR.instances.description.updateElement();
            $(element).valid();
        },

        errorPlacement: function(error, element) {
            $(element).closest("div.form-group").addClass("has-error");
            error.insertAfter(element);
        },

        invalidHandler: function(form, validator) {
            if (!validator.numberOfInvalids()) {
                return;
            }
        }
    });
}

function initRule() {

    $('#name').rules("add", {
        required: true,
        minlength: 2,
        maxlength:100,
    });

    $('#price').rules("add", {
        required : true,
        number: true
    });

    $('#image_thumbnail').rules("add", {
        required : true,
    });

    $('input[id^="exampleCheckbox"]').rules("add", {
        required : true,
    });

    $('#category').rules("add", {
        required : true,
    });

    $('input[name^="images"]').rules("add", {
        required : true,
    });
}
