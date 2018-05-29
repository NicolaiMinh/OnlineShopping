$(document).ready(function() {
    $('.btn-select-image').on('click', function() {
        openKCFinderMulti();
    });

    $(document).on('click','.img-delete',function() {
        var img = jQuery(this).closest('div.img-upload');
        img.remove();
    });
    // $("#image1").on("click", function() {
    //     openKCFinder1(this);
    // });
    var categorySelected = $("#category").val();
    $(".div_category_detail").each(function() {
        if ($(this).data("categoryid") != categorySelected) {
            $(this).hide();
            $(this).find("input").prop("checked", false);
        }
    });

    $("#category").on('change',function() {
        var value = $(this).val();
        $(".div_category_detail").each(function() {
            $(this).show();
            if ($(this).data("categoryid") != value) {
                $(this).hide();
                $(this).find("input").prop("checked", false);
            }
        });
    });
});

function openKCFinderMulti() {
    window.KCFinder = {
        callBackMultiple: function(files) {
            window.KCFinder = null;
            for (var i = 0; i < files.length; i++) {
                $(".show-image").append(addImage(files[i]));
                $(".image_temp").remove();
                $('input[name^="images"]').rules("add", {
                    required : false,
                });
            }
        }
    };
    window.open('/themeadmin/kcfinder/browse.php?type=images',  'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
    'directories=0, resizable=1, scrollbars=0, width=800, height=600');
}

function openKCFinder1(textarea) {
    window.KCFinder = {
        callBackMultiple: function(files) {
            window.KCFinder = null;
            textarea.value = "";
            if (files.length > 1) {
                showPopupMessage("notification", "Please choose one file");
                return;
            }
            for (var i = 0; i < files.length; i++) {
                //console.log(files[i]);
                textarea.value += files[i];
            }
        }
    };
    window.open('/themeadmin/kcfinder/browse.php?type=images',  'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
    'directories=0, resizable=1, scrollbars=0, width=800, height=600');
}

function addImage(src) {
    var strHtml = '';
    strHtml = strHtml + '<div class="img-upload">';
    strHtml = strHtml + '   <img class="img-responsive image-show" src="' + src + '" alt="project">';
    strHtml = strHtml + '   <img src="/images/icon-delete-16x16.png" alt="" class="img-delete">';
    strHtml = strHtml + '   <input type="hidden" name="images[]" class="image-hidden" value="' + src + '">';
    strHtml = strHtml + '</div>';
    return strHtml;
}