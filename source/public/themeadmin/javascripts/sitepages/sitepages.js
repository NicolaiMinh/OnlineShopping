$(document).ready(function() {

    validateForm($('#addProjectPage'));
    initRule();

    $("#btnSubmit").on("click", function() {
        CKEDITOR.instances.content.updateElement();
        if ($("#addProjectPage").valid()) {
            return true;
        }
        return false;
    });
    var basePath = "/admin/";
    CKEDITOR.replace('content',{allowedContent:true,startupMode :'source',
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
        onfocusout : function( element, event ) {
            if ($(element).valid()) {
                $(element).closest("div.form-group").removeClass("has-error");
                //$(element).closest("div.form-group").addClass("has-success");
                $(element).closest("div.form-group").find("label.error").remove();
            }
        },

        onkeyup: function( element, event ) {
            CKEDITOR.instances.content.updateElement();
            $(element).valid();
        },

        errorPlacement: function (error, element) {
            $(element).closest("div.form-group").addClass("has-error");
            //$(element).closest("div.form-group").removeClass("has-success");
            error.insertAfter(element);
        },

        invalidHandler: function(form, validator) {
            if (!validator.numberOfInvalids()){
                return;
            }
            //scrollToTopElement($(validator.errorList[0].element));
        }
    });
}

function openKCFinder(input, id) {
    window.KCFinder = {
        callBackMultiple: function(files) {
            window.KCFinder = null;
            $("#" + input).val("");
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
    window.open('/admin/kcfinder/browse.php?type=images',  'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
    'directories=0, resizable=1, scrollbars=0, width=800, height=600');
}

function initRule() {
     $("#content").rules("add", {
        required: true,
    });
    $("#name").rules("add", {
        required: true,
    });
}
