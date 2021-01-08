/*
 * newApplicationFormValidator.js
 * JavaScript Validation For applicationEditForm
 * @type type
 */

/*global $, jQuery, alert*/
$("document").ready(function () {
    console.log("newApplicationFormValidator document.ready  ");


    /*
     * validName 
     * checking for UTF-8 string
     * 
     * @type XRegExp
     */
    var validName = new XRegExp("^[\\p{L}\\p{Nd} .'_-]+$");
    $.validator.addMethod("validname", function (value, element) {
        return this.optional(element) || validName.test(value);
    }, "Please use only letters, numbers, '.',''', '-',', '_' and space");
    /*
     * validName 
     * checking for UTF-8 string
     * 
     * @type XRegExp
     */
    var validAddress = new XRegExp("^[\\p{L}\\p{Nd} .:'_-]+$");
    $.validator.addMethod("validAddress", function (value, element) {
        return this.optional(element) || validAddress.test(value);
    }, "Please use only letters, numbers, '.',''',':', '-',', '_' and space");
    /*
     * validNamEuro 
     * checking for UTF-8 string plus €
     * 
     * @type XRegExp
     */
    var validNamEuro = new XRegExp("^[\\p{L}\\p{Nd} .'_-€]+$");
    $.validator.addMethod("validNamEuro", function (value, element) {
        return this.optional(element) || validNamEuro.test(value);
    }, "Incorect word - please use only letters, numbers, '.',''', '-','€', '_' and space");
    /**
     * validLanguage
     * checking for letters, numbers, '.',''',',' '-', '_' and space
     */
    var validLanguage = new XRegExp("^[\\p{L}\\p{Nd} .',_-]+$");
    $.validator.addMethod("validLanguage", function (value, element) {
        return this.optional(element) || validLanguage.test(value);
    }, "Incorect word - please use only letters, numbers, '.',''',',' '-', '_' and space");
    /*
     * validEmail
     * checking for valid email pattern
     * 
     * @type RegExp
     */
    var validEmail = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]:{2,4})+$/;
    $.validator.addMethod("validemail", function (value, element) {
        return this.optional(element) || validEmail.test(value);
    }, "This is not a valid email address");
    /*
     * nowhitespace
     * checking for nowhitespace pattern
     * 
     * @type RegExp
     */
    $.validator.addMethod("nowhitespace", function (value, element) {
        return value.indexOf(" ") < 0 && value !== "";
    }, "No white space please");
    /*
     * onlyLettersRegex
     * checking for only letters pattern in a string
     * 
     * @type RegExp
     */
    var onlyLettersRegex = new XRegExp("^[\\p{L}\\s._-]+$");
    $.validator.addMethod("onlyLetters", function (value, element) {
        return value.indexOf(" ") < 0 && value !== "";
    }, "Only letters are allowed");
    /*
     * year
     * checking for year (YYYY) pattern
     * 
     * @type RegExp
     */
    var yearRegex = new XRegExp('/^\d{4}$/');
    $.validator.addMethod("year", function (value, element) {
        return value.indexOf(" ") < 0 && value !== "";
    }, "Please enter the year in format: YYYY");
    /*
     * ISBN
     * checking for ISBN pattern
     * 
     * @type RegExp
     */
    var ISBNRegex = new XRegExp("^(?:ISBN(?:-1[03])?:? )?(?=[0-9X]{10}$|(?=(?:[0-9]+[- ]){3})[- 0-9X]{13}$|97[89][0-9]{10}$|(?=(?:[0-9]+[- ]){4})[- 0-9]{17}$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9X]$");
    $.validator.addMethod("ISBN", function (value, element) {
        return value.indexOf(" ") < 0 && value !== "";
    }, "Please enter a valid ISBN number");
    /*
     * validFileName
     * checking for valid file name pattern
     * 
     * @type RegExp
     */
    var validFileName = new XRegExp("^[\\p{L}\\p{Nd} ._-]+$");
    $.validator.addMethod("validFileName", function (value, element) {
        return this.optional(element) || validFileName.test(value);
    }, "Incorect file name - please use only letters, numbers, '.', '-', '_' and space");

//    $.validator.addMethod("filesize", function (value, element, param) {
//         console.log("filesize ::value " + value + "  element  " + element.files[0].name  + "  param  " + param);
//        console.log("filesize ::this.optional(element) " + this.optional(element) + "  element.files[0].size <= param  " + element.files[0].size <= param  + "  param  " + param);
//        
//        return this.optional(element) || (element.files[0].size <= param);
//    }, 'File size must be less than {10}');

    /*
     * validate form
     */
    $("#applicationForm").validate({

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
        onkeydown: function (element) {
            this.element(element);  // <- "eager validation"
        },
        onkeypress: function (element) {
            this.element(element);  // <- "eager validation"
        },
        onfocusout: function (element) {
            this.element(element);  // <- "eager validation"
        },
        onfocus: function (element) {
            this.element(element);  // <- "eager validation"
        },

        ignore: [],
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
                    Address1: {
                        required: true,
                        validAddress: true,
                        maxlength: 250
                    },
                    postCode: {
                        required: true,
                        validname: true
                    },
                    Address2: {
                        required: true,
                        validAddress: true,
                        maxlength: 250
                    },
                    Address3: {
                        validAddress: true,
                        maxlength: 250
                    },
                    Address4: {
                        validAddress: true,
                        maxlength: 250
                    },
                    Country: {
                        required: true,
                        validname: true
                    },
                    City: {
                        required: true,
                        validname: true
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
                    },
                    AuthorFirstName: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    AuthorLastName: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    aFirstName: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    aLastName: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    appBookTitle: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    title: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    appForeignPublisher: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    publicationYear: {
                        required: true,
                        year: true,
                        minlength: 4,
                        maxlength: 4
                    },
                    appGenre: {
                        required: true,
                        validname: true
                    },
                    translationTitle: {
                        required: true,
                        minlength: 2,
                        validname: true
                    },
                    genre: {
                        required: true,
                        validname: true
                    },
                    proposedDateOfPublication: {
                        required: true
                    },
                    appLanguageOriginal: {
                        required: true,
                        validLanguage: true
                    },
                    appCountryOfPublication: {
                        required: true,
                        validname: true
                    },
                    countryOfPublication: {
                        required: true,
                        validname: true
                    },
                    originalPageExtent: {
                        required: true,
                        number: true
                    },
                    nameuser: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    rightsHoldersName0: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    addendum1: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    plannedPageExtent: {
                        required: true,
                        number: true
                    },
                    appproposedPrintRun: {
                        required: true,
                        number: true
                    },
                    appTargetLanguage: {
                        required: true,
                        validLanguage: true,
                        minlength: 2
                    },
                    foreignPublisher: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    appForeignCountry: {
                        required: true,
                        onlyLetters: true,
                        minlength: 2
                    },
                    publicationYear1: {
                        required: true,
                        year: true,
                        minlength: 4,
                        maxlength: 4
                    },
                    appCompany: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    translatorFee: {
                        required: true,
                        number: true
                    },
                    BreakDownOfTranslatorFee: {
                        required: true,
                        validNamEuro: true,
                        minlength: 2
                    },
                    copiesSent: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    /*
                     * removed during Covid-19
                     */
//                    dateCopiesWereSent: {
//                        required: true,
//                        validname: true,
//                        minlength: 2
//                    },
                    Cover1: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    isbn: {
                        required: true,
                        ISBN: true
                    },
                    isnn: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    proofPayment: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    amountApproved: {
                        required: true,
                        number: true
                    },
                    bankDetailForm: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    signedLIcontract: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    translatorName: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    "translatorrightsHolderName": {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    amountRequested: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    "Original": {
                        required: true,
                        validFileName: true,
//                        filesize: 5,
                        minlength: 2
                    },
                    "TranslationSample": {
                        required: true,
                        validFileName: true,
//                        filesize: 5,
                        minlength: 2
                    },
                    "Translator_CV": {
                        required: true,
                        validFileName: true,
//                        filesize: 5,
                        minlength: 2
                    },
                    "Contract": {
                        required: true,
                        validFileName: true,
//                        filesize: 5,
                        minlength: 2
                    },
                    first0: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    firstRightsHolder0: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    firstAuthor0: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    "Agreement-1": {
                        required: true,
                        validFileName: true,
                        minlength: 2
                    },
                    "Addendum-1": {
//                        filesize: 5,
                        validFileName: true
                    },
                    datepicker: {
                        required: true,
                        date: true
                    }
                },
        showErrors: function (errorMap, errorList) {

            var errors = this.numberOfInvalids();  // <- NUMBER OF INVALIDS
            console.log("this.numberOfInvalids 1 ", errors);

//            $("#num_invalids").html(errors);
            console.log(errorMap);
            $.each(errorMap, function (key, value) {
                console.log("pet name of invalid field " + key + " Value " + value); // <- name of invalid field
                var parent = $('[name="' + key + '"]').parent();
                console.log("pet parent: ", parent); // <- parent object
            });

//            if (errors) {
//                var message = errors === 1
//                        ? 'Your form has 1 error'
//                        : 'Your form has ' + errors + ' errors.';
//                message = message + ' Please, fix them first!';
////                $("#help-block span").empty().html(message);
//                $("#help-block").show();
//            } else {
//                $("#help-block").hide();
//            }
            this.defaultShowErrors(); // <- ENABLE default MESSAGES
        },
        messages: {
            username: {
                required: "Please Enter User Name",
                validname: "User name must contain only letters and spaces",
                minlength: "Your Name is Too Short"
            },
//            firstname: {
//                required: "Please Enter First Name",
//                validname: "First name must contain only letters and spaces",
//                minlength: "Your Name is Too Short"
//            },
//            lastname: {
//                required: "Please Enter Last Name",
//                validname: "Last name must contain only letters and spaces",
//                minlength: "Your Name is Too Short"
//            },
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
            },
            AuthorFirstName: {
                required: "Please Enter the Authors First Name",
                validname: "First name must contain only letters and spaces",
                minlength: "Your Name is Too Short"
            },
            AuthorLastName: {
                required: "Please Enter the Authors Last Name",
                validname: "Last name must contain only letters and spaces",
                minlength: "Your Name is Too Short"
            },
            aFirstName: {
                required: "Please Enter the Authors First Name",
                validname: "First name must contain only letters and spaces",
                minlength: "Your Name is Too Short"
            },
            aLastName: {
                required: "Please Enter the Authors Last Name",
                validname: "Last name must contain only letters and spaces",
                minlength: "Your Name is Too Short"
            },
            translationTitle: {
                required: "Please Enter a translation title",
                validname: "Translation title must contain only letters and spaces",
                minlength: "Translation title  is Too Short"
            },
            originalPageExtent: {
                number: "Original page extent contains numbers only"
            },
            plannedPageExtent: {
                number: "Planned page extent contains numbers only"
            },
            appproposedPrintRun: {
                number: "Proposed print run contains numbers only"
            },
            appForeignCountry: {
                validname: "Last name must contain only letters and spaces",
                minlength: "Password at least have 2 characters"
            },
            foreignPublisher: {
                validname: "Last name must contain only letters and spaces"
            },
            publicationYear: {
                year: "Please enter the year (yyyy)",
                minlength: "Publication year has 4 digits"
            },
            publicationYear1: {
                year: "Please enter the year (yyyy)",
                minlength: "Publication year has 4 digits"
            },
            rightsHoldersName0: {
                validname: "Incorect name - please use only letters, numbers, '.',''', '-', '_' and space"
            },
            "Agreement-1": {
                validFileName: "Incorect file name - please use only letters, numbers, '.', '-', '_' and space"
            },
            "Addendum-1": {
                validFileName: "Incorect file name - please use only letters, numbers, '.', '-', '_' and space"
            },
            "Contract": {
                required: "Please Enter the Authors Last Name",
                filesize: "Please Enter the Authors Last Name",
                validFileName: "Incorect file name - please use only letters, numbers, '.', '-', '_' and space"
            },
            "Translator_CV": {
                required: "Please Enter the Authors Last Name",
                filesize: "Please Enter the Authors Last Name",
                validFileName: "Incorect file name - please use only letters, numbers, '.', '-', '_' and space"
            },
            datepicker: {
                required: " * required: You must enter a  date",
                date: "Can contain digits only"
            }

        },
        errorElement: "em",
        errorPlacement: function (error, element) {
            // Add the `help-block` class to the error element
            error.addClass("help-block");

            // Add `has-feedback` class to the parent div.form-group
            // in order to add icons to inputs
            element.parents(".form-group").addClass("has-feedback");
            element.parents(".input-group").addClass("has-feedback");


            var name = element.attr('name');
            console.log("element.attr('name')" + name);
            var errorSelector = '.validation_error_message[for="' + name + '"]';
            var $element = $(errorSelector);
            if ($element.length) {
                $(errorSelector).css("color", "#a9444f");
                $(errorSelector).css("font-weight", "normal");
                $(errorSelector).addClass("pull-left");
                $(errorSelector).html(error.html());

            } else {
                error.insertAfter(element);
            }

            if (element.prop("type") === "checkbox") {
                error.insertAfter(element.parent("label"));
            } else if (element.parent('.form-group').length) {
                error.insertAfter(element.parent());
            } else if (element.parent('.input-group').length) {
                error.insertAfter(element.parent());
            } else if ($('label[for="label_agreement1"]')) {
                error.insertAfter('.label_agreement1_error');
            } else if ($('label[for="label_addendum1"]')) {
                error.insertAfter('.label_addendum1_error');
            } else {
                error.insertAfter(element);
            }

            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if (!element.next("span")[ 0 ]) {
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(element);
            }
        },
        invalidHandler: function (e, validator) {
            //validator.errorList contains an array of objects, where each object has properties "element" and "message".  element is the actual HTML Input.
            var errors = validator.numberOfInvalids();
            console.log("this.numberOfInvalids ", errors);
            console.log("validator.errorList ");
//            for (var i = 0; i < validator.errorList.length; i++) {
//                console.log(validator.errorList[i]);
//            }
//            console.log("validator.errorMap ");
//            //validator.errorMap is an object mapping input names -> error messages
//            for (var i in validator.errorMap) {
//                console.log(i, ":", validator.errorMap[i]);
//            }
            var fieldset = $("#my-tab").parent().parent().parent().parent().parent().parent().parent();
            console.log("plum fieldset ", fieldset);
            for (var i = 0; i < validator.errorList.length; i++) {

                var formId = validator.errorList[i].element.closest('.tab-pane').id;
                console.log("plum formId ", formId);
                var tab = $('[href="#' + formId + '"]');
                console.log("plumInvalidHandler tab ", tab);
                $(tab).css('color', 'red');
                console.log(validator.errorList[i]);
            }
        },

        success: function (label, element) {
            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if (!$(element).next("span")[ 0 ]) {
                $("<span class='glyphicon glyphicon-ok form-control-feedback'></span>").insertAfter($(element));
            }
        },
        highlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-error").removeClass("has-success");
            $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
            var tab = $(element).closest('.tab-pane').attr('id');
            console.log("plum highlight tab ", tab);
            var tabHighlight = $('.nav-tabs a[href="#' + tab + '"]').tab('show');
            console.log("plum highlight tabHighlight ", tabHighlight);
//            $(tabHighlight).css('color', 'red');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-success").removeClass("has-error");
            $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
            var tab = $(element).closest('.tab-pane').attr('id');
            console.log("plum tabUnHighlight tab ", tab);
            var tabUnHighlight = $('.nav-tabs a[href="#' + tab + '"]').tab('show');
//             console.log("plum tabUnHighlight ppp ", ppp);
//            $(tabUnHighlight).css('color', ' black');
        }
//        submitHandler: function (form) {
//            //submit form here
//        }
    });

});


