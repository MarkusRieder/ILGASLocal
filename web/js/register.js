// JavaScript Validation For Registration Page

/*global $, jQuery, alert*/
$("document").ready(function () {
    // name validation
//    var nameregex = /^[a-zA-Z ]+$/;
    var nameregex = new XRegExp('^[\\p{L}\\p{Nd} ._-]+$');
    $.validator.addMethod("validname", function (value, element) {
        return this.optional(element) || nameregex.test(value);
    });

    // valid email pattern
    var eregex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    $.validator.addMethod("validemail", function (value, element) {
        return this.optional(element) || eregex.test(value);
    });
    $.validator.addMethod("nowhitespace", function (value, element) {
        return value.indexOf(" ") < 0 && value !== "";
    }, "No white space please");

    $("#register-form").validate({

        rules:
                {
                    username: {
                        required: true,
                        validname: true,
                        minlength: 2,
                        nowhitespace: true
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
                        required: true,
                        minlength: 8,
                        maxlength: 15
                    },
                    cpassword: {
                        required: true,
                        equalTo: "#password"
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
                    password: {
                        required: "Please Enter Password",
                        minlength: "Password at least have 8 characters"
                    },
                    cpassword: {
                        required: "Please Retype your Password",
                        equalTo: "Password Did not Match !"
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
            //var url = $('#register-form').attr('action');
            //location.href=url;

        }

        /*submitHandler: function() 
         { 
         alert("Submitted!");
         $("#register-form").resetForm(); 
         }*/

    });


    /*function submitForm(){
     
     
     /*$('#message').slideDown(200, function(){
     
     $('#message').delay(3000).slideUp(100);
     $("#register-form")[0].reset();
     $(element).closest('.form-group').find("error").removeClass("has-success");
     
     });
     
     alert('form submitted...');
     $("#register-form").resetForm();
     
     }*/

});