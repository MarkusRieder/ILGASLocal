// JavaScript Validation For Registration Page

/*global $, jQuery, alert*/
$("document").ready(function () {

    // name validation
//    var nameregex = new XRegExp('^[\\p{L}\\p{Nd} _-]+$');
    var nameregex = new XRegExp("^[\\p{L}\\p{Nd} .'_-]+$");
    $.validator.addMethod("validname", function (value, element) {
        return this.optional(element) || nameregex.test(value);
    });

    // valid email pattern
    var eregex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    $.validator.addMethod("validemail", function (value, element) {
        return this.optional(element) || eregex.test(value);
    });

    $("#register-form").validate({
        /*
         * validate on onkeyup
         * 
         * @param {type} element
         * @param {type} event
         * @returns {undefined}
         */
        onkeyup: function (element) {
            this.element(element);  // <- "eager validation"
        },
        rules:
                {
                    username: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    firstname: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    lastname: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    email: {
                        required: true,
                        validemail: true
                    },
                    password: {
                        minlength: 8,
                        maxlength: 15
                    },
                    cpassword: {
                        minlength: 8,
                        equalTo: "#password"
                    },
                    company: {
                        required: true,
                        validname: true,
                        minlength: 2
                    }
                },
        messages:
                {
                    username: {
                        required: "Please Enter User Name",
                        validname: "User name must contain only letters and spaces",
                        minlength: "Your Name is Too Short"
                    },
                    firstname: {
                        required: "Please Enter First Name",
                        validname: "First name must contain only letters and spaces",
                        minlength: "Your Name is Too Short"
                    },
                    lastname: {
                        required: "Please Enter Last Name",
                        validname: "Last name must contain only letters and spaces",
                        minlength: "Your Name is Too Short"
                    },
                    email: {
                        required: "Please Enter Email Address",
                        validemail: "Enter Valid Email Address"
                    },
                    company: {
                        required: "Please Enter Company Name",
                        validname: "Company Name must contain only letters, numbers and spaces",
                        minlength: "Your Name is Too Short"
                    },
                    password: {
                        required: "Please Enter Password",
                        minlength: "Password should have at least have 8 characters"
                    },
                    cpassword: {
                        required: "Please Retype your Password",
                        equalTo: "Passwords do NOT Match !"
                    }
                },
        errorPlacement: function (error, element) {
            $(element).closest('.form-group').find('.help-block').html(error.html());
        },
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
            $(element).closest('.form-group').find('.help-block').html('');
        },

        submitHandler: function (form) {

            alert('Your request has been submitted ...');
            form.submit();
        }
    });
});