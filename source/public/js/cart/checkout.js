$(document).ready(function() {
    $("#ship-to-address").on('click', function() {
        if ($(this).is(':checked')) {
            $("#ship-to-address-container").show();

            $('#first_name_ship').rules("add", {
                required : true
            });
            $('#last_name_ship').rules("add", {
                required : true
            });
            $('#country_id_ship').rules("add", {
                required : true
            });
            $('#address1_ship').rules("add", {
                required : true
            });
            $('#town_city_ship').rules("add", {
                required : true
            });
            $('#postcode_zip_ship').rules("add", {
                required : true,
                number: true
            });
        } else {
            $("#ship-to-address-container").hide();

            $('#first_name_ship').rules("remove");
            $('#last_name_ship').rules("remove");
            $('#country_id_ship').rules("remove");
            $('#address1_ship').rules("remove");
            $('#town_city_ship').rules("remove");
            $('#postcode_zip_ship').rules("remove");
        }
    });

    // $("#province_container").hide();
    // $("#country_id").on('change', function() {
        // if ($(this).val() == 1) {
            // $("#province_container").hide();
        // } else {
            // $("#province_container").show();
        // }
    // });

    // $("#province_ship_container").hide();
    // $("#country_id_ship").on('change', function() {
        // if ($(this).val() == 1) {
            // $("#province_ship_container").hide();
        // } else {
            // $("#province_ship_container").show();
        // }
    // });

    validateForm($('#checkout'));
    initRule();
    $("#btnSubmit").on("click", function(){
        if ($("#checkout").valid()) {
            $("#checkout").submit();
        }
        return false;
    });

    /*
    $.validator.addMethod("isExtension", function (value, element, options) {
        return checkIsExtension(value);
    },"Wrong extension type");
    */

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
    $('#name').rules("add", {
        required : true,
        messages: {
            required: "Xin hãy điền tên",
        }
    });
    
    $('#email').rules("add", {
        required : true,
        email: true,
        messages: {
            required: "Xin hãy điền Email",
            email: "Xin hãy nhập đúng Email"
        }
    });
    $('#phone').rules("add", {
        required : true,
        number: true,
        messages: {
            required: "Xin hãy điền số điện thoại",
            number: "Xin hãy điền số"
        }
    });
    
    $('#address').rules("add", {
        required : true,
        messages: {
            required: "Xin hãy điền địa chỉ",
        }
    });
}
