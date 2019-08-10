// JavaScript Validation For Registration Page




//$("document").ready(function () {
//    var string = "The following input[type='file'] have been found - \n";
//});


/*global $, jQuery, alert*/
$("document").ready(function () {

    console.log("validFileName document.ready  ");

    var re = new XRegExp('^[\\p{L}\\p{Nd} ._-]+$');
    $.validator.addMethod('validFileName', function (value, element) {
//        alert("here...");
        console.log("validFileName  value " + value + " element  " + element.value);
        console.log("validFileName  re " + re + " re.test(value)  " + re.test(value));
//       return this.optional(element) || re.test(value);
        console.log("applicationFormvalidate  element " + element.files[0].name + " event " + event);
        return this.optional(element) || (re.test(element.files[0].name));
    }, "Incorect file name - please use only letters, numbers, '.', '-', '_' and space");

    $("#applicationForm").validate({
        rules: {
            file: {
                validFileName: true
            },
            "ExpertReaderReport-1": {
                validFileName: true
            },
            "ExpertReaderInvoice-1": {
                validFileName: true
            }
//            },
//
//            "Agreement-1": {
//                number: true
//            }
        },
        messages:
                {
                    "ExpertReaderReport-1": "Incorect file name - please use only letters, numbers, '.', '-', '_' and space",
                    "ExpertReaderInvoice-1": "Incorect file name - please use only letters, numbers, '.', '-', '_' and space"
                },
        file: {
            required: "Please enter Translation rights holder",
            validname: "Last name must contain only letters and spaces"
        },
        "ExpertReaderReport-1": {
            required: "Please enter Translation rights holder",
            validname: "Last name must contain only letters and spaces"
        },
        "ExpertReaderInvoice-1": {
            required: "Please enter Translation rights holder",
            validname: "Last name must contain only letters and spaces"
        },
        errorElement: "em",
        errorPlacement: function (error, element) {
            // Add the `help-block` class to the error element
            error.addClass("help-block");

            // Add `has-feedback` class to the parent div.form-group
            // in order to add icons to inputs
//            element.parents(".col-sm-3").addClass("has-feedback");
            element.parents(".form-group").addClass("has-feedback");
//            element.parents(".col-sm-5").addClass("has-feedback");



            if (element.prop("type") === "checkbox") {
                error.insertAfter(element.parent("label"));
            } else {
                error.insertAfter(element);
            }

            if (element.parent('.input-group').length) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }

            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if (!element.next("span")[ 0 ]) {
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(element);
            }
        },
        success: function (label, element) {
            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if (!$(element).next("span")[ 0 ]) {
                $("<span class='glyphicon glyphicon-ok form-control-feedback'></span>").insertAfter($(element));
            }
        },
        highlight: function (element, errorClass, validClass) {
//            $(element).parents(".col-sm-3").addClass("has-error").removeClass("has-success");
//            $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
            $(element).parents(".form-group").addClass("has-error").removeClass("has-success");
            $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
//            $(element).parents(".col-sm-5").addClass("has-error").removeClass("has-success");
//            $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
        },
        unhighlight: function (element, errorClass, validClass) {
//            $(element).parents(".col-sm-3").addClass("has-success").removeClass("has-error");
//            $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
            $(element).parents(".form-group").addClass("has-success").removeClass("has-error");
            $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
//            $(element).parents(".col-sm-5").addClass("has-success").removeClass("has-error");
//            $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
        }
    });
});

