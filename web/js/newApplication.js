/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * 
 * newApplication.js
 */


var translatorArray = [];
var rightsHolderArray = [];
var authorArray = [];
var languageArray = [];
var pressCuttingArray = [];
var Name = "";
var Author = "";
var counter = 0;
var Authorcounter = 0;
var pressCuttingCounter = 0;
var translatorCounter = 0;
//            var translatorCounter1 = 0;
var translatorName876 = "";
var itemValue = "";

$.datepicker.setDefaults({
    dateFormat: 'dd/mm/yy',
    showOtherMonths: true,
    selectOtherMonths: true,
    autoclose: true,
    changeMonth: true,
    changeYear: true,
    gotoCurrent: true,
    orientation: "bottom" // <-- and add this
});

//    localStorage.clear();

PDFJS.workerSrc = 'js/pdf.worker.js';


//Section AutoComplete

//AutoComplete_Genres

$(function () {
    $("#genre1").autocomplete({
        source: 'ACGenre', // The source of the AJAX results
        dataType: 'json',
        contentType: "application/json",
        data: '',
        minLength: 3, // The minimum amount of characters that must be typed before the autocomplete is triggered
        focus: function (event, ui) { // What happens when an autocomplete result is focused on
            $("#genre").val(ui.item.name);
            return false;
        },
        select: function (event, ui) { // What happens when an autocomplete result is selected
            $("#genre").val(ui.item.name);
            $('#idgenres').val(ui.item.id);
        }
    });
});


//AutoComplete_international_publishers

$(function () {
    $("#publisher1").autocomplete({
        source: 'ACintPublishers_test', // The source of the AJAX results
        dataType: 'json',
        data: '',
        minLength: 3, // The minimum amount of characters that must be typed before the autocomplete is triggered
        focus: function (event, ui) { // What happens when an autocomplete result is focused on
            $("#publisher").val(ui.item.name);
            return false;
        },
        select: function (event, ui) { // What happens when an autocomplete result is selected
            $("#publisher").val(ui.item.name);
            conslole.log("publisher :: ", ui.item.name);
            $('#Company_Number').val(ui.item.id);
            $('#Address1').val(ui.item.Address1);
            $('#Address2').val(ui.item.Address2);
            $('#Address3').val(ui.item.Address3);
            $('#Address4').val(ui.item.Address4);
            $('#postCode').val(ui.item.postCode);
            $('#City').val(ui.item.City);
            $('#country').val(ui.item.Country);
            $('#countryCode').val(ui.item.CountryCode);
            $('#Telephone').val(ui.item.Telephone);
            $('#Fax_Number').val(ui.item.Fax);
            $('#Web_Address').val(ui.item.WWW);
            $('#doNotMail').val(ui.item.DoNotMail);
            $('#Bursaries').val(ui.item.Bursaries);
            $('#Founded').val(ui.item.Founded);
            $('#Number_Of_Titles').val(ui.item.NumberOfTitles);
            $('#Date_modified').val(ui.item.DateModified);
            $('#note').val(ui.item.Notes);
        }
    });
});



//AutoComplete_country

$(function () {
    $("#countryOfPublication1").autocomplete({
        source: 'AutoComplete_country', // The source of the AJAX results
        dataType: 'json',
        data: '',
        minLength: 3, // The minimum amount of characters that must be typed before the autocomplete is triggered
        focus: function (event, ui) { // What happens when an autocomplete result is focused on
            $("#countryOfPublication").val(ui.item.name);
            return false;
        },
        select: function (event, ui) { // What happens when an autocomplete result is selected
            $("#countryOfPublication").val(ui.item.name);
            $('#countryCode').val(ui.item.id);
        }
    });
});

$(function () {
    $("#appLanguageOriginal").autocomplete({
        source: 'ACLanguages', // The source of the AJAX results
        dataType: 'json',
        data: '',
        minLength: 3, // The minimum amount of characters that must be typed before the autocomplete is triggered
        focus: function (event, ui) { // What happens when an autocomplete result is focused on
            $("#appLanguageOriginal").val(ui.item.name);
            return false;
        },
        select: function (event, ui) { // What happens when an autocomplete result is selected
            $("#appLanguageOriginal").val(ui.item.name);
        }
    });
});
//   AutoComplete_Languages  

//            console.log(" AutoComplete_Languages ");
//$(function () {
//    function split(val) {
//        return val.split(/,\s*/);
//    }
//    function extractLast(term) {
//        return split(term).pop();
//    }
//
//    $("#appLanguageOriginal")
//            // don't navigate away from the field on tab when selecting an item
//            .on("keydown", function (event) {
//                if (event.keyCode === $.ui.keyCode.TAB &&
//                        $(this).autocomplete("instance").menu.active) {
//                    event.preventDefault();
//                }
//            })
//            .autocomplete({
//                source: function (request, response) {
//                    $.getJSON("ACLanguages", {
//                        term: extractLast(request.term)
//                    }, response);
//                },
//                search: function () {
//                    // custom minLength
//                    var term = extractLast(this.value);
//                     console.log("search terms: ", term); //Array
//                    if (term.length < 2) {
//                        return false;
//                    }
//                },
//                focus: function () {
//                    // prevent value inserted on focus
//                    return false;
//                },
//                select: function (event, ui) {
//                    var terms = split(this.value);
//                    // remove the current input
//                    terms.pop();
//                    // add the selected item
//                    terms.push(ui.item.value);
//                    languageArray.push(ui.item.value);
//                    // add placeholder to get the comma-and-space at the end
//                    terms.push("");
//                    this.value = terms.join(", ");
//                    console.log("select this.value:  ", this.value); //List
//                    console.log("select terms: ", terms); //Array
//
//                    //languageArray.push(ui.item.value);
//
//                    //Do something
//                    var arrayLength = languageArray.length;
//                    for (var i = 0; i < arrayLength; i++) {
//                        console.log("itemValue   " + i + ":  ", languageArray[i]);
//                    }
//
//                    $("#language_array").val(languageArray);
//                    return false;
//                }
//
//
//            });
//});


//Load mobile menu
//<script type="text/javascript" src="js/jquery.mobile-menu.js"></script>

//phonenav
//      
//$(function () {
//    $("body").mobile_menu({
//        menu: "#phonenav"
//    });
//});


//get selectpicker selection 

$(document).ready(function () {
    $('.selectpicker').on('change', function () {
        var selected = $(this).find("option:selected").val();
    });

    $("#whichkey").on("mousedown", function (event) {
        $("#log").html(event.type + ": " + event.which);
    });

});





//http://stackoverflow.com/questions/18999501/bootstrap-3-keep-selected-tab-on-page-refresh

$(document).ready(function () {
    if (location.hash) {
        $("a[href='" + location.hash + "']").tab("show");
    }
    $(document.body).on("click", "a[data-toggle]", function (event) {
        location.hash = this.getAttribute("href");
    });
});
$(window).on("popstate", function () {
    var anchor = location.hash || $("a[data-toggle='tab']").first().attr("href");
    $("a[href='" + anchor + "']").tab("show");
});


//https://www.experts-exchange.com/questions/28687200/how-to-load-extrenal-url-in-bootstrap-tabs.html

$(function () {
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
        var tab = $(e.target.attributes.href.value);
        $(tab).load(tab.data('url'));
    });
    $('.nav-tabs a:first').each(function () {
        $(this.attributes.href.value).load($(this.attributes.href.value).data('url'));
    });
});



//Triggering the Tooltips


$(document).ready(function () {

    $('[data-toggle="tooltip"]').tooltip();
    $(".tip-top").tooltip({placement: 'top'});
});




//the following functions will copy
//the selected file name (for upload) to the label input

$(function () {
    $('div.translator_cv').on('change', ':file', function () {
//                    alert("translator_cv");
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
        //                  var label_translatorid2 = "label_translator" + id2;
        document.getElementById("label_translator0").value = label;
    });
});
$(function () {
    $('div.agreement').on('change', ':file', function () {
        alert("div.agreement");
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
        //                  var label_translatorid2 = "label_translator" + id2;
        document.getElementById("label_agreement1").value = label;
    });
});
$(function () {
    $('div.addendum').on('change', ':file', function () {
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
        //                  var label_translatorid2 = "label_translator" + id2;
        document.getElementById("label_addendum1").value = label;
    });
});
$(function () {
    $(document).on('change', 'div.translatorcv :file', function () {
//                    alert("translatorcv");
        var id = parseInt(this.id.replace("translator_cv", ""));
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
        var label_translatorid = "label_translator_cv" + id;
        console.log("label_translatorid Name ", label_translatorid);
        document.getElementById(label_translatorid).value = label;
    });
});
$(function () {
    $('div.originalSample').on('change', ':file', function () {
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
        document.getElementById("label_originalSample").value = label;
    });
});
$(function () {
    $('div.translationSample').on('change', ':file', function () {
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
        document.getElementById("label_translationSample").value = label;
    });
});
$(function () {
    $('div.cover').on('change', ':file', function () {
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');

        input.trigger('fileselect', [numFiles, label]);
        document.getElementById("label_cover").value = label;
    });
});
$(function () {
    $('div.proofPayment').on('change', ':file', function () {
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
        document.getElementById("label_proofPayment").value = label;
    });
});
$(function () {
    $('div.bankDetailForm').on('change', ':file', function () {
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
        document.getElementById("label_BankDetailForm").value = label;
    });
});
$(function () {
    $('div.signedLIcontract').on('change', ':file', function () {
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
        document.getElementById("label_signedLIcontract").value = label;
    });
});


function generatedLabels() {
    $(document).on('change', ':file', function () {
//                    alert($(this));
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
        var id = input[0].id;
        var label_id = "label_" + id;
        console.log("generatedLabels input ", input);
        console.log("label_id              ", label_id);
        document.getElementById(label_id).value = label;
    });
}
;




function del_file(eleId) {
    var ele = document.getElementById("delete_file" + eleId);
    ele.parentNode.removeChild(ele);
}


//add more Translators

$(document).ready(function () {
    counter = 1;
    $("#addElement").click(function (event) {
        counter++;
        var $newDiv = $("<div class='input-group' style='margin-bottom :2px'>" + counter + ". Translator  </div>");
        var $newInput = $("<input placeholder='Translator Name' type='text'> ");
        $newInput
                .attr("name", "Name" + counter)
                .attr("id", "name" + counter)
                .addClass("text wsp");
        $newInput.appendTo($newDiv);
        $newDiv.appendTo($("#generatedForm"));
    });
});


//add more RightsHolders

$(document).ready(function () {
    counter = 1;
    $("#addAdditionalRightsHolders").click(function (event) {
        counter++;
        var $newDiv = $("<div class='input-group' style='margin-bottom :2px'>" + counter + ".  Rights holder  </div>");
        var $newInput = $("<input placeholder='Rights holder name' type='text'> ");
        $newInput
                .attr("name", "Name" + counter)
                .attr("id", "name" + counter)
                .addClass("text wsp");
        $newInput.appendTo($newDiv);
        $newDiv.appendTo($("#RightsHolderGeneratedForm"));
    });
});




// Copy the first translator name to the pop up modal

function  copyFirstTranslatorName() {

    translatorArray = [];
    console.log("copyFirstTranslatorName translatorArray cleared ", translatorArray);

    var fn = document.getElementById("translatorName");
    document.getElementById("first0").value = fn.value;
    Name = fn.value;
    console.log("copyFirstTranslatorName Name ", Name);
    translatorArray.push(Name);
    console.log(" first entry in translatorArray ", fn.value);


    if (!localStorage.translatorContent === 0) {
        //function retrieve(){
        document.getElementById("torget").innerHTML = localStorage.getItem("translatorContent");
        console.log("backToTranslators localStorage.translatorContent ", localStorage.translatorContent.length);
        for (i = 0; i < translatorContent.length; i++) {
            console.log("restored translatorContent " + translatorContent);
        }
    }


    // back To Translators tab
    $('#bs-example-navbar-collapse-2 a[href="#Translator"]').tab('show');
}





// Copy the first translator name to the pop up modal

function  copyFirstRightsHolderName() {

    rightsHolderArray = [];
    console.log("copyFirstRightsHolderName rightsHolderArray cleared ", rightsHolderArray);

    var fn = document.getElementById("rightsHoldersName0");
    document.getElementById("firstRightsHolder0").value = fn.value;
    Name = fn.value;
    console.log("copyFirstRightsHolderName Name ", Name);
    rightsHolderArray.push(Name);
    console.log(" first entry in rightsHolderArray ", fn.value);

    $("#rightsHolderArray").val(rightsHolderArray);
    console.log("copyFirstRightsHolderName rightsHolderArray ", rightsHolderArray);

    // Switch on "Add more translators"
    $('#addAdditionalRightsHoldersModalDiv').toggle();

    if (!localStorage.rightsAgreementContent === 0) {
        //function retrieve(){
        document.getElementById("rightsAgreementContracts").innerHTML = localStorage.getItem("rightsAgreementContent");
        console.log("copyFirstRightsHolderName localStorage.rightsAgreementContent ", localStorage.rightsAgreementContent.length);
        for (i = 0; i < translatorContent.length; i++) {
            console.log("restored rightsAgreementContent " + rightsAgreementContent);
        }
    }


    // back To Rights tab
    $('#bs-example-navbar-collapse-2 a[href="#Rights"]').tab('show');
}



//generateTranslatorTab

function  generateTranslatorTab(indicator) {

    if (indicator === 0) {

        // if we have a final list of translators (more than one)
        // we need to clear a possible existing tab

        $('#tnc').empty(); // empty the div before fetching and adding new data
        $('#tn').empty();  // empty the div before fetching and adding new data

    }

    $('#tnc').empty(); // empty the div before fetching and adding new data
    $('#tn').empty();  // empty the div before fetching and adding new data

    console.log("generateTranslatorTab translatorArray " + translatorArray);
    // Generate Translator Tabs in "Rights Agreement & Contracts"-Tab

    // 1: The Nav-Bar

    var rightsAgreementContractsNavBar = '';

    rightsAgreementContractsNavBar += '<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2" style="background-color: #d9d1d1">';
    rightsAgreementContractsNavBar += '<ul class="nav navbar-nav nav-tabs">';

    for (var i = 0; i < translatorArray.length; i++) {

        var j = i + 1;


        if (i === 0) {

            rightsAgreementContractsNavBar += '<li class="active"><a href="#tn' + j + '" data-toggle="tab">' + translatorArray[i] + '</a></li>';

        } else {

            rightsAgreementContractsNavBar += '<li><a href="#tn' + j + '" data-toggle="tab">' + translatorArray[i] + '</a></li>';
        }
    }

    rightsAgreementContractsNavBar += '</ul>'; // ul class="nav navbar-nav nav-tabs"
    rightsAgreementContractsNavBar += '</div>'; // navbar-collapse

    $(rightsAgreementContractsNavBar).appendTo('#tn');

    // The Tabs themselves

    var rightsAgreementContractsNavContent = '';

    for (var i = 0; i < translatorArray.length; i++) {

        var j = i + 1;

        if (i === 0) {

            rightsAgreementContractsNavContent += '<div class="tab-pane fade in active" id="tn' + j + '">';

        } else {

            rightsAgreementContractsNavContent += '<div class="tab-pane fade" id="tn' + j + '">';

        }

        rightsAgreementContractsNavContent += '<div class="container wrapperContainer">';


        //Upload a copy of the CV
        console.log("processFirstTranslator generateTranslatorTab Upload a copy of the CV i " + i + " j " + j + " :: " + translatorArray[i]);

        rightsAgreementContractsNavContent += '<div class="col-md-8" style="margin-bottom: 40px">';
        rightsAgreementContractsNavContent += '<div class="form-group has-feedback"> ';
        rightsAgreementContractsNavContent += '<label for="label_translator_cv' + j + '" class="control-label pull-left" >Upload a copy of ' + translatorArray[i] + '\'s CV:</label>';
        rightsAgreementContractsNavContent += ' <small class="pull-left" style="margin-bottom: 10px">this should include a list of previous published literary translations</small>';
        rightsAgreementContractsNavContent += '<div class="input-group translatorcv pull-left">';
        rightsAgreementContractsNavContent += '<label class="input-group-addon btn btn-default btn-file">';
        rightsAgreementContractsNavContent += 'Select file <input type="file" onchange="generatedLabels()" name="Translator_CV" id="translator_cv' + j + '">';

        rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
        rightsAgreementContractsNavContent += '</label>';
        rightsAgreementContractsNavContent += '<input id="label_translator_cv' + j + '" class="pull-left">';
        rightsAgreementContractsNavContent += '</div>';
        rightsAgreementContractsNavContent += '<input type="hidden" id="translator_cv_upload' + j + '" value="Translator_CV" name="destination">';
        rightsAgreementContractsNavContent += '</div>';
        rightsAgreementContractsNavContent += '<label for="Translator_CV" class="validation_error_message help-block"></label> ';
        rightsAgreementContractsNavContent += '</div>';


        //Upload a copy of the contract with
        rightsAgreementContractsNavContent += '<div class="col-md-8">';
        rightsAgreementContractsNavContent += '<div class="form-group has-feedback"> ';
        rightsAgreementContractsNavContent += '<label for="label_contract' + j + '" class="control-label pull-left" >Upload a copy of the contract with ' + translatorArray[i] + '</label>';

        rightsAgreementContractsNavContent += '<div class="margin-bottom: 40px"></div>';
        rightsAgreementContractsNavContent += '<div class="input-group contract">';
        rightsAgreementContractsNavContent += '<label class="input-group-addon btn btn-default btn-file">';
        rightsAgreementContractsNavContent += 'Select file <input type="file" onchange="generatedLabels()" name="Contract" id="contract' + j + '">';
        rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
        rightsAgreementContractsNavContent += '</label>';
        rightsAgreementContractsNavContent += '<input id="label_contract' + j + '" class="pull-left"/>';
        rightsAgreementContractsNavContent += '</div>';
        rightsAgreementContractsNavContent += '<input type="hidden" value="Contract" name="destination" id="contract_upload' + j + '"/>';
        rightsAgreementContractsNavContent += '</div>';
        rightsAgreementContractsNavContent += '<label for="Contract" class="validation_error_message help-block"></label> ';
        rightsAgreementContractsNavContent += '</div>';


        rightsAgreementContractsNavContent += '</div  class="container EndwrapperContainer">'; // //container
        rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"

    }

    //show translatorTabs if hidden
    if ($(translatorTabs).css('display') === 'none' || $(translatorTabs).css("visibility") === "hidden") {
        $(translatorTabs).show();
    }

    $(rightsAgreementContractsNavContent).appendTo('#tnc');

}


//backToRightsAgreement

function backToRightsAgreement() {

    alert("backToRightsAgreement");
    console.log("backToRightsAgreement rightsHolderArray  ", rightsHolderArray);

    var upload_number = 2;


    // Get Content
    var rightsAgreementContent = document.getElementById("rightsAgreementContracts").innerHTML;


    // Store Content
    localStorage.setItem("rightsAgreementContent", rightsAgreementContent);
    console.log("backToRightsAgreement localStorage.rightsAgreementContent ", localStorage.rightsAgreementContent.length);
    if (!localStorage.rightsAgreementContent === 0) {
        console.log("backToRightsAgreement rightsAgreementContent " + rightsAgreementContent);
        for (i = 0; i < translatorContent.length; i++) {
            console.log("backToRightsAgreement rightsAgreementContent " + rightsAgreementContent[i]);
        }
//                    alert("backToTranslators false");
//                    return false;
    }

    for (var i = 2; i <= counter; i++) {

        var nr = "name" + i;
        console.log("backToRightsAgreement nr ", nr);
        var item = document.getElementById(nr);
        itemValue = item.value;
        console.log("backToRightsAgreement itemValue ", itemValue);
        rightsHolderArray.push(itemValue);
        console.log("backToRightsAgreement next entry in translatorArray ", itemValue);
    }


    // Switch off "Add more translators"
    $('#addAdditionalRightsHoldersModalDiv').toggle();

    // Change Title from "Translation rights holder" to "Translation rights holder(s)"
    document.getElementById("rightsHoldersNameLabel").innerHTML = 'Translation rights holder(s)';



    // Disable first Translation rights holder name input element
    document.getElementById("rightsHoldersName0").disabled = 'true';

    // Display all TranslatorrightsHolder input element each
    for (var i = 1; i < rightsHolderArray.length; i++) {
        console.log("backToRightsAgreement rightsHolderArray " + rightsHolderArray[i]);
        var additionalTranslatorTag = '';

        additionalTranslatorTag += '<div class="form-group has-feedback">';
        additionalTranslatorTag += ' <input id="translatorrightsHolderName' + i;
        additionalTranslatorTag += 'type="text"  ';
        additionalTranslatorTag += 'class="form-control"';
        additionalTranslatorTag += 'name="translatorrightsHolderName' + i + '"';
        additionalTranslatorTag += 'value="' + rightsHolderArray[i] + '"';
        additionalTranslatorTag += 'disabled = ""';
        additionalTranslatorTag += '</div>';

        $(additionalTranslatorTag).appendTo('#addAddRightsHolders');
    }


    console.log("backToRightsAgreement #rightsHolderArray.val(rightsHolderArray) " + rightsHolderArray);
    console.log(rightsHolderArray);
    console.log("backToRightsAgreement #rightsHolderArray.length " + rightsHolderArray.length);
    $("#rightsHolderArray").val(rightsHolderArray);

    // back To RightsAgreement tab
    $('#bs-example-navbar-collapse-2 a[href="#Rights"]').tab('show');

    // if we have a final list of translators (more than one)
    // we need to clear a possible existing tab first
//                generateTranslatorTab(0);
}


//backToTranslators

function backToTranslators() {

//                alert("backToTranslators");
//                translatorArray = [];
    console.log("backToTranslators translatorArray  ", translatorArray);
    var upload_number = 2;


    // Get Content
    var translatorContent = document.getElementById("torget").innerHTML;


    // Store Content
    localStorage.setItem("translatorContent", translatorContent);
    console.log("backToTranslators localStorage.translatorContent ", localStorage.translatorContent.length);
    if (!localStorage.translatorContent === 0) {
        console.log("backToTranslators translatorContent " + translatorContent);
        for (i = 0; i < translatorContent.length; i++) {
            console.log("backToTranslators translatorContent " + translatorContent[i]);
        }
//                    alert("backToTranslators false");
//                    return false;
    }


    for (var i = 2; i <= counter; i++) {

        var nr = "name" + i;
        console.log("backToTranslators nr ", nr);
        var item = document.getElementById(nr);
        itemValue = item.value;
        console.log("backToTranslators itemValue ", itemValue);
        translatorArray.push(itemValue);
        console.log("backToTranslators next entry in translatorArray ", itemValue);
        var moreUploadTag = '';
        moreUploadTag += '<h1> backToTranslators moreUploadTag </h1>';
        moreUploadTag += '<div class="col-md-8" style="margin-bottom: 20px">';
        moreUploadTag += '<label for="label_translator' + upload_number + '" class="control-label pull-left" id="123">Upload a copy of ' + itemValue + '\'s CV: </label>';
        moreUploadTag += '<br>';
        moreUploadTag += ' <small class="pull-left" style="margin-bottom: 10px">this should include a list of previous published literary translations</small>';
        moreUploadTag += '<div class="input-group translatorcv pull-left" style="margin-bottom: 40px;">';
        moreUploadTag += '<label class="btn btn-default btn-file pull-left">';
        moreUploadTag += 'Select file ';
        moreUploadTag += '<input multiple="" name="Translator_CV-' + upload_number + '" id="translator_cv' + upload_number + '" type="file">';
        moreUploadTag += '<span class="glyphicon glyphicon-folder-open"></span>';
        moreUploadTag += '</label>';
        moreUploadTag += '<input id="label_translator' + upload_number + '" class="pull-left">';
        moreUploadTag += '<br>';
        moreUploadTag += '<br>';
        moreUploadTag += '<input id="translator_cv_upload' + upload_number + '" value="Translator_CV" name="destination" type="hidden">';
        moreUploadTag += '</div>';
        moreUploadTag += '</div>';
        $(moreUploadTag).appendTo('#additionalTranslator');
        upload_number++;
    }

    // Switch off "Add more translators"
    $('#addTranslatorModalDiv').toggle();

    // Change Title from "Translator" to "Translators"
    document.getElementById("translatorNameLabel").innerHTML = 'Translators';

    // Disable first Translator input element
    document.getElementById("translatorName").disabled = 'true';

    // Display all Translators in input element each
    for (var i = 1; i < translatorArray.length; i++) {
        console.log("backToTranslators translatorArray " + translatorArray[i]);
        var additionalTranslatorTag = '';
//                     additionalTranslatorTag += '<h1> backToTranslators additionalTranslatorTag </h1>';
        additionalTranslatorTag += '<div class="form-group has-feedback">';
        additionalTranslatorTag += ' <input id="translatorName"  ';
        additionalTranslatorTag += 'type="text"  ';
        additionalTranslatorTag += 'class="form-control"';
        additionalTranslatorTag += 'name="translatorName"';
        additionalTranslatorTag += 'value="' + translatorArray[i] + '"';
        additionalTranslatorTag += 'disabled = ""';
        additionalTranslatorTag += '</div>';
        $(additionalTranslatorTag).appendTo('#addTransl');
    }


    console.log("backToTranslators #translatorArray.val(translatorArray) " + translatorArray);
    console.log(translatorArray);
    console.log("backToTranslators #translatorArray.length " + translatorArray.length);
    $("#translatorArray").val(translatorArray);

    // back To Translators tab
    $('#bs-example-navbar-collapse-2 a[href="#Translator"]').tab('show');

    // if we have a final list of translators (more than one)
    // we need to clear a possible existing tab first
    generateTranslatorTab(0);

}


//Add another Press Cutting

$(document).ready(function () {
    pressCuttingCounter = 1;
    $("#pressCutting").click(function (event) {
        console.log("pressCuttingCounter   ", pressCuttingCounter);
        pressCuttingCounter++;
        var $newDiv = $("<div class='input-group' style='margin-bottom :2px'>" + pressCuttingCounter + ". Press Cutting  </div>");
        var $newInput = $("<input placeholder='Press Cutting' type='text'> ");
        $newInput
                .attr("name", "pressCutting" + pressCuttingCounter)
                .attr("id", "pressCutting" + pressCuttingCounter)
                .addClass("text wsp");
        $newInput.appendTo($newDiv);
        $newDiv.appendTo($("#addPressCuttingForm"));
    });
});



function backToMisc() {
    var upload_number = 2;
    for (var i = 2; i <= pressCuttingCounter; i++) {
        console.log("backToMisc()   ");
        var nr = "name" + i;
        var item = document.getElementById(nr);
        var itemValue = item.value;

        pressCuttingArray.push(itemValue);

        var moreUploadTag = '';

        moreUploadTag += '<h1> backToMisc moreUploadTag </h1>';
        moreUploadTag += '<div class="col-md-8" style="margin-bottom: 20px">';
        moreUploadTag += '<label for="label_translator' + upload_number + '" class="control-label pull-left" id="123">Upload a copy of ' + itemValue + '\'s CV: </label>';
        moreUploadTag += '<br>';
        moreUploadTag += ' <small class="pull-left" style="margin-bottom: 10px">this should include a list of previous published literary translations</small>';
        moreUploadTag += '<div class="input-group translatorcv pull-left" style="margin-bottom: 40px;">';
        moreUploadTag += '<label class="btn btn-default btn-file pull-left">';
        moreUploadTag += 'Select file ';
        moreUploadTag += '<input multiple="" name="file" id="translator_cv' + upload_number + '" type="file">';
        moreUploadTag += '<span class="glyphicon glyphicon-folder-open"></span>';
        moreUploadTag += '</label>';
        moreUploadTag += '<input id="label_translator' + upload_number + '" class="pull-left">';
        moreUploadTag += '<br>';
        moreUploadTag += '<br>';
        moreUploadTag += '<input id="translator_cv_upload' + upload_number + '" value="Translator_CV" name="destination" type="hidden">';
        moreUploadTag += '</div>';
        moreUploadTag += '</div>';

        $(moreUploadTag).appendTo('#additionalTranslator');

        upload_number++;
    }

    $('#bs-example-navbar-collapse-1 a[href="#Misc"]').tab('show');
    var arrayLength = pressCuttingArray.length;
    for (var i = 0; i < arrayLength; i++) {
        console.log("pressCuttingArray   ", pressCuttingArray[i]);
    }
    $("#pressCuttingArray").val(pressCuttingArray);
}



//add more Authors

$(document).ready(function () {
    Authorcounter = 1;
    $("#addAuthor").click(function (event) {

        Authorcounter++;
        var $newDiv = $("<div class='col-sm-12' style='margin-bottom:2px'>" + Authorcounter + ". Author  </div>");
        var $newInput = $("<input placeholder='First Name'  type='text' autofocus>");
        $newInput
                .attr("name", "FirstName")
                .attr("id", "authorFirstName" + Authorcounter)
                .addClass("text wsp");
        $newInput.appendTo($newDiv);
        var $newInput = $("<input placeholder='Last Name' type='text'> ");
        $newInput
                .attr("name", "LastName")
                .attr("id", "authorLastName" + Authorcounter)
                .addClass("text");
        $newInput.appendTo($newDiv);
        $newDiv.appendTo($("#generatedFormAuthors"));
    });
});



function  copyFirstRow2() {
    authorArray = [];
    console.log("document.getElementById(aFirstName)   ", document.getElementById("aFirstName").value);
    var aFirstName = document.getElementById("aFirstName");
    console.log("aFirstName.value   ", aFirstName.value);
    document.getElementById("firstAuthor0").value = aFirstName.value;
    var aLastName = document.getElementById("aLastName");
    document.getElementById("lastAuthor0").value = aLastName.value;
    var fulln = aFirstName.value + " " + aLastName.value;
    authorArray.push(fulln, aFirstName.value, aLastName.value);
}
;



function backToBooks2() {

    for (var i = 2; i <= Authorcounter; i++) {

        var nr = "authorFirstName" + i;
        var nrL = "authorLastName" + i;
        var first = document.getElementById(nr);
        var last = document.getElementById(nrL);
        var firstValue = first.value;
        var lastValue = last.value;
        var fullName = firstValue + " " + lastValue;

        authorArray.push(fullName, firstValue, lastValue);
    }
    ;

    $('#bs-example-navbar-collapse-1 a[href="#books"]').tab('show');
    var arrayLength = authorArray.length;
    for (var i = 0; i < arrayLength; i++) {
        console.log("authorArray   " + i + ":  ", authorArray[i]);
    }
    $("#author_array").val(authorArray);
}




function myFunction() {
//                alert("myfunction");
    translatorName876 = "";
    var x = document.getElementById("translatorName");
    console.log("document.getElementById(translatorName) ", x);
    translatorName876 = x.value;
    var tester = "Upload a copy of " + translatorName876 + "'s CV:";
    localStorage.setItem('translatorName876', tester);
    localStorage.setItem('translatorName8', translatorName876);
    var tripper = localStorage.getItem("translatorName876");
//                document.getElementById("123").innerHTML = tripper;
//                document.getElementById("translatorName123").value = localStorage.getItem("translatorName8");
////                console.log("translatorName876   ", localStorage.getItem("translatorName876"));
////                console.log("translatorName8   ", localStorage.getItem("translatorName8"));
////                console.log("tester   ", tester);
////                console.log("tripper   ", tripper);

    $("#translatorArray").val(translatorName876);


    translatorArray = [];
    console.log("copyFirstTranslatorName translatorArray cleared ", translatorArray);

    var fn = document.getElementById("translatorName");
    document.getElementById("first0").value = fn.value;
    Name = fn.value;
    console.log("copyFirstTranslatorName Name ", Name);
    translatorArray.push(Name);
    console.log(" first entry in translatorArray ", fn.value);

//                copyFirstTranslatorName();
    generateTranslatorTab(1);
}
;


//https://stackoverflow.com/questions/3392493/adjust-width-of-input-field-to-its-input

$(document).ready(function () {
    var input = document.querySelector('input'); // get the input element
//                alert(input);
    input.addEventListener('input', resizeInput); // bind the "resizeInput" callback on "input" event
    resizeInput.call(input); // immediately call the function

    function resizeInput() {
        this.style.width = this.value.length + "ch";
    }
});


//Translatorform

//check if Translator name has been deleted
$(document).ready(function () {
    $("#translatorName").change(function () {
        if ($('#translatorName').val() === '') {
            $(uploadDocuments).hide();
            translatorArray = []; // clear translatorArray
            $('#tnc').empty(); // empty the div 
            $('#tn').empty();  // empty the div 
            $(translatorTabs).hide(); // close div
            $('#translatorName').trigger('click');
            console.log(translatorArray);
        }

    });
});

// When typing Translator name change text for uploadDocuments 
$(document).ready(function () {
    $("#translatorName").keyup(function () {
        //show translatorTabs if hidden
        if ($(uploadDocuments).css('display') === 'none' || $(uploadDocuments).css("visibility") === "hidden") {
            $(uploadDocuments).show();
        }
        var dInput = $(this).val();
        console.log(dInput);
        $('#uploadDocuments').html("upload documents for <br/>" + $(this).val() + " ");
        $("#uploadDocuments").append($('<span class="glyphicon glyphicon-import"></span>'));
        $('#addTranslatorModala').text("OR add more translators");
        //$(".dDimension:contains('" + dInput + "')").css("display","block");
    });
});

//check if Translator name has been pasted in
$(document).ready(function () {
    $("#translatorName").on("paste", function () {
        //show translatorTabs if hidden
        if ($(uploadDocuments).css('display') === 'none' || $(uploadDocuments).css("visibility") === "hidden") {
            $(uploadDocuments).show();
        }
        var dInput = $(this).val();
        console.log(dInput);
        $('#uploadDocuments').html("upload documents for <br/>" + $(this).val() + " ");
        $("#uploadDocuments").append($('<span class="glyphicon glyphicon-import"></span>'));
        $('#addTranslatorModala').text("OR add more translators");
        $('#translatorName').trigger('click');
        //$(".dDimension:contains('" + dInput + "')").css("display","block");
    });
});

// check if Translator name is been filled from cache
$(document).ready(function () {
    $("#translatorName").mouseup(function () {
        if ($('#translatorName').val() !== '') {
            //show translatorTabs if hidden
            if ($(uploadDocuments).css('display') === 'none' || $(uploadDocuments).css("visibility") === "hidden") {
                $(uploadDocuments).show();
            }
            var dInput = $(this).val();
            console.log(dInput);
            $('#uploadDocuments').html("upload documents for <br/>" + $(this).val() + " ");
            $("#uploadDocuments").append($('<span class="glyphicon glyphicon-import"></span>'));
            $('#addTranslatorModala').text("OR add more translators");
            $('#translatorName').trigger('click');
        }
    });
});

//https://www.thewebflash.com/clear-button-in-bootstrap-input-group-component/
$(document).ready(function () {
    $('.has-clear input[type="text"]').on('input propertychange', function () {
        var $this = $(this);
        var visible = Boolean($this.val());
        $this.siblings('.form-control-clear').toggleClass('hidden', !visible);
    }).trigger('propertychange');

    $('.form-control-clear').click(function () {
        $(this).siblings('input[type="text"]').val('')
                .trigger('propertychange').focus();
        if ($('#translatorName').val() === '') {
            $(uploadDocuments).hide();
            translatorArray = []; // clear translatorArray
            $('#tnc').empty(); // empty the div 
            $('#tn').empty();  // empty the div 
            $(translatorTabs).hide(); // close div
            $('#addTranslatorModala').text("Add more translators"); // reset text
            $('#translatorName').trigger('click');
            console.log(translatorArray);
        }
    });
});

var fileTypes = [
    'image/jpeg',
    'image/pjpeg',
    'image/png',
    'image/*',
    'application/pdf',
    '.doc,.docx,.xml,.pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document'

];

function validFileType(file) {
    for (var i = 0; i < fileTypes.length; i++) {
        if (file.type === fileTypes[i]) {
            return true;
        }
    }

    return false;
}


$(document).ready(function () {
    //Check File API support
    if (window.File && window.FileList && window.FileReader)
    {
        $('#files').on("change", function (event) {
            var files = event.target.files; //FileList object
            var output = document.getElementById("result");
            for (var i = 0; i < files.length; i++)
            {
                var file = files[i];
                var fileName = files[i].name;
                console.log("fileName  " + fileName);

//                            if (file.type.match('image.*')) {
                if (validFileType(files[i])) {
                    if (this.files[0].size < 2097152) {

                        var picReader = new FileReader();
                        picReader.addEventListener("load", function (event) {
                            var picFile = event.target;
                            var div = document.createElement("div");
                            div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                                    "title='preview image'/>";
                            output.insertBefore(div, null);
                        });
                        //Read the image
                        $('#clear, #result').show();
                        picReader.readAsDataURL(file);

                    } else {
                        alert("Image Size is too big.Minimum size is 2MB.");
                        $(this).val("");
                    }
                } else {
                    alert("You can only upload image file.");
                    $(this).val("");
                }
            }

        });
    } else
    {
        console.log("Your browser does not support File API");
    }
});

$(document).on("click", "#files", function () {
    $('.thumbnail').parent().remove();
    $('result').hide();
    $(this).val("");
});

$(document).on("click", "#clear", function () {
    $('.thumbnail').parent().remove();
    $('#result').hide();
    $('#files').val("");
    $(this).hide();
});


$(document).ready(function () {
    var validator = $("#applicationForm").validate();
//    alert("Validate");
    validator.form();
});

$(document).ready(function () {
    var tcACCEPTED = '${tcACCEPTED}';
    var gdprACCEPTED = '${gdprACCEPTED}';
    document.getElementById("tcACCEPTED").value = tcACCEPTED;
    document.getElementById("gdprACCEPTED").value = gdprACCEPTED;

});

$(document).ready(function () {
    function validateURL() {
        var url = document.getElementById("url").value;
        // var  pattern="(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&=]*)";
        var pattern = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
        if (pattern.test(url)) {
            alert("Url is valid");
            return true;
        }
        alert("Url is not valid!");
        return false;

    }
});


$(document).ready(function () {
    $('input[type="file"]').change(function (e) {
        // $('input[type="file"]').valid();
        console.log("$(this)  " + $(this).val());
        console.log("e   " + e.target.files[0].name);
        if ($(this).valid()) {
//            alert("Url is valid  --  " + $(this).val());
//            $($(this)).closest('.form-group').addClass('has-success');
        } else {
//            alert("Url is not valid!");
//            $($(this)).closest('.form-group').addClass('has-error');
        }
    });
});






//window.onscroll = function () {
//    scrollFunction();
//};
//function scrollFunction() {
//    if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
//        document.getElementById("totopBtn").style.display = "block";
//    } else {
//        document.getElementById("totopBtn").style.display = "none";
//    }
//}
//function topFunction() {
//    document.body.scrollTop = 0;
//    document.documentElement.scrollTop = 0;
//}


$(function () {
    $(document).on('scroll', function () {
        if ($(window).scrollTop() > 100) {
            $('.scroll-top-wrapper').addClass('show');
        } else {
            $('.scroll-top-wrapper').removeClass('show');
        }
    });
});


$(function () {
    $(document).on('scroll', function () {
        if ($(window).scrollTop() > 100) {
            $('.scroll-top-wrapper').addClass('show');
        } else {
            $('.scroll-top-wrapper').removeClass('show');
        }
    });

    $('.scroll-top-wrapper').on('click', scrollToTop);
});

function scrollToTop() {
    verticalOffset = typeof (verticalOffset) !== 'undefined' ? verticalOffset : 0;
    element = $('body');
    offset = element.offset();
    offsetTop = offset.top;
    $('html, body').animate({scrollTop: offsetTop}, 500, 'linear');
}

