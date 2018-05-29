$(document).ready(function() {
    validateForm($('#sites'));
    initRule();
    $("#btnSubmit").on("click", function(){
        CKEDITOR.instances.description.updateElement();
        CKEDITOR.instances.content.updateElement();
        if ($("#sites").valid()) {
            return true;
        }
        return false;
    });

    // var basePath = "/themeadmin/";
    // CKEDITOR.replace('description',{allowedContent:true,
    // filebrowserBrowseUrl : basePath + 'kcfinder/browse.php?type=files',
    // filebrowserImageBrowseUrl : basePath + 'kcfinder/browse.php?type=images',
    // filebrowserFlashBrowseUrl : basePath + 'kcfinder/browse.php?type=flash',
    // filebrowserUploadUrl : basePath + 'kcfinder/upload.php?type=files',
    // filebrowserImageUploadUrl : basePath + 'kcfinder/upload.php?type=images',
    // filebrowserFlashUploadUrl : basePath + 'kcfinder/upload.php?type=flash'});

    var basePath = "/themeadmin/";
    CKEDITOR.replace('content',{allowedContent:true,
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
        onfocusout : function( element, event ) {
            if ($(element).valid()) {
                $(element).closest("div.form-group").removeClass("has-error");
                //$(element).closest("div.form-group").addClass("has-success");
                $(element).closest("div.form-group").find("label.error").remove();
            }
        },

        onkeyup: function( element, event ) {
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

function initRule() {
    
    $('#email').rules("add", {
        email: true,
    });
    $('#logo_header').rules("add", {
        required: true,
    });
    $('#logo_footer').rules("add", {
        required: true,
    });
    

}

function openKCFinder(textarea) {
    window.KCFinder = {
        callBackMultiple: function(files) {
            window.KCFinder = null;
            textarea.value = "";
            for (var i = 0; i < files.length; i++) {
                textarea.value += files[i];
            }
        }
    };
    window.open('/themeadmin/kcfinder/browse.php?type=images',  'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
    'directories=0, resizable=1, scrollbars=0, width=800, height=600');
}
