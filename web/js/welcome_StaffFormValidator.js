/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * 
 * 
 *  * welcome_Staff_1FormValidator.js
 *  
 *  
 */


/*global $, jQuery, alert*/
$("document").ready(function () {
    console.log("welcome_Staff_1FormValidator document.ready  ");
    // override jquery validate plugin defaults
//    $.validator.setDefaults({
//        highlight: function (element, errorClass, validClass) {
//            $(element).closest('.form-group').removeClass('has-success has-feedback').addClass('has-error has-feedback');
//        },
//        unhighlight: function (element, errorClass, validClass) {
//            $(element).closest('.form-group').removeClass('has-error has-feedback').addClass('has-success has-feedback');
//        },
//        errorElement: 'span',
//        errorClass: 'help-block',
//        errorPlacement: function (error, element) {
//            if (element.parent('.input-group').length) {
//                error.insertAfter(element.parent());
//            } else {
//                error.insertAfter(element);
//            }
//        }
//    });

    /*
     * validName 
     * checking for UTF-8 string
     * 
     * @type XRegExp
     */
    var validName = new XRegExp("^[\\p{L}\\p{Nd} .'_-]+$");
    $.validator.addMethod("validname", function (value, element) {
        return this.optional(element) || validName.test(value);
    }, "Incorect word - please use only letters, numbers, '.',''', '-', '_' and space");
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
//       var validName = new XRegExp ("^[\\p{L}\\p{Nd} .'_-]+$");
    var validFileName = new XRegExp("^[\\p{L}\\p{Nd} ._-]+$");
    $.validator.addMethod("validFileName", function (value, element) {
//        alert("here...");
//        console.log("validFileName  value " + value);
//        console.log("validFileName  re " + validFileName + " re.test(value)  " + validFileName.test(value));
        return this.optional(element) || validFileName.test(value);
//        console.log("newApplicationFormvalidate  element " + element.files[0].name + " event " + event);
//        return this.optional(element) || (validFileName.test(element.files[0].name));
    }, "Incorect file name - please use only letters, numbers, '.', '-', '_' and space");

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
        onkeyup: function (element, event) {

            if (event.which === 9 && this.elementValue(element) === "") {
//                console.log("applicationFormvalidate  element " + element.value + " event " + event);
                return;
            } else {
//                console.log("applicationFormvalidate  element " + element.value + " event " + event);
                this.element(element);
            }
        },
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
                        validname: true
                    },
                    postCode: {
                        required: true,
                        validname: true
                    },
                    Address2: {
                        required: true,
                        validname: true
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
                    appBookTitle: {
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
                        validname: true
                    },
                    languageOfTheOriginal: {
                        required: true,
                        validLanguage: true
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
                    series: {
                        validname: true,
                        minlength: 2
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
                    agreement1: {
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
                        onlyLetters: true,
                        minlength: 2
                    },
                    foreignPublisher: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    appForeignCountry: {
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
                    languages: {
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
                        validname: true,
                        minlength: 2
                    },
                    copiesSent: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
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
                    amountRequested: {
                        required: true,
                        validname: true,
                        minlength: 2
                    },
                    "Original": {
                        required: true,
                        validFileName: true,
                        minlength: 2
                    },
                    "TranslationSample": {
                        required: true,
                        validFileName: true,
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
                        validFileName: true
                    },
                    "Addendum-1": {
                        validFileName: true
                    },
                    datepicker: {
                        required: true,
                        date: true
                    }
                },
        messages: {
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
                required: "<span class='pull_left'>Last name must contain only letters and spaces</span>",
                validname: "Incorect word - please use only letters, numbers, '.',''', '-', '_' and space"
            },
            "Agreement-1": {
//                required: "Please enter Translation rights holder",
                validFileName: "Incorect file name - please use only letters, numbers, '.', '-', '_' and space Agreement"
            },
            "Addendum-1": {
//                required: "Please enter Translation rights holder",
                validFileName: "Incorect file name - please use only letters, numbers, '.', '-', '_' and space Addendum"
            },
            datepicker: {
                required: " * required: You must enter a destruction date",
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
        success: function (label, element) {
            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if (!$(element).next("span")[ 0 ]) {
                $("<span class='glyphicon glyphicon-ok form-control-feedback'></span>").insertAfter($(element));
            }
        },
        highlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-error").removeClass("has-success");
            $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-success").removeClass("has-error");
            $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
        }
    });
});

//        submitHandler: function (form) {
//
//            alert('Your request has been submitted ...');
//            form.submit();
//            //var url = $('#register-form').attr('action');
//            //location.href=url;
//
//        };

/*submitHandler: function() 
 :{ 
 alert("Submitted!");
 $("#register-form").resetForm(); 
 }*/
//    });

//});

