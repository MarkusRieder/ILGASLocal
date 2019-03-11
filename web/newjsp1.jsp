<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%-- 
    Document   : newApplication
    Created on : 19-Mar-2017, 11:27:58
    Author     : markus
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html style="height: 100%" lang="en"> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <title>Translation Grant Application System</title>

        <!-- Bootstrap -->

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 

        <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>


        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" >
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.validate.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js" ></script>
        <script type="text/javascript"  src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"  src="js/jquery-ui.js"></script>
        <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>

        <!--  Global Variables  -->
        <script>
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


        </script>

        <!-- Section AutoComplete -->

        <!--AutoComplete_Genres-->
        <script type="text/javascript">
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
        </script>

        <!--AutoComplete_international_publishers-->
        <script>
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
        </script>


        <!--AutoComplete_country-->
        <script>
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
        </script>

        <!--    AutoComplete_Languages   -->
        <script>
//            console.log(" AutoComplete_Languages ");
            $(function () {
                function split(val) {
                    return val.split(/,\s*/);
                }
                function extractLast(term) {
                    return split(term).pop();
                }

                $("#languageOfTheOriginal1")
                        // don't navigate away from the field on tab when selecting an item
                        .on("keydown", function (event) {
                            if (event.keyCode === $.ui.keyCode.TAB &&
                                    $(this).autocomplete("instance").menu.active) {
                                event.preventDefault();
                            }
                        })
                        .autocomplete({
                            source: function (request, response) {
                                $.getJSON("ACLanguages", {
                                    term: extractLast(request.term)
                                }, response);
                            },
                            search: function () {
                                // custom minLength
                                var term = extractLast(this.value);
                                if (term.length < 2) {
                                    return false;
                                }
                            },
                            focus: function () {
                                // prevent value inserted on focus
                                return false;
                            },
                            select: function (event, ui) {
                                var terms = split(this.value);
                                // remove the current input
                                terms.pop();
                                // add the selected item
                                terms.push(ui.item.value);
                                languageArray.push(ui.item.value);
                                // add placeholder to get the comma-and-space at the end
                                terms.push("");
                                this.value = terms.join(", ");
                                console.log("this.value:  ", this.value); //List
                                console.log("terms: ", terms); //Array

                                //languageArray.push(ui.item.value);

                                //Do something
                                var arrayLength = languageArray.length;
                                for (var i = 0; i < arrayLength; i++) {
                                    console.log("itemValue   " + i + ":  ", languageArray[i]);
                                }

                                $("#language_array").val(languageArray);
                                return false;
                            }


                        });
            });
        </script>

        <!-- Load mobile menu -->
        <script type="text/javascript" src="js/jquery.mobile-menu.js"></script>

        <!--phonenav-->
        <script type="text/javascript">
            $(function () {
                $("body").mobile_menu({
                    menu: "#phonenav"
                });
            });
        </script>

        <!--get selectpicker selection--> 
        <script type="text/javascript">
            $(document).ready(function () {
                $('.selectpicker').on('change', function () {
                    var selected = $(this).find("option:selected").val();
                });
            });
        </script>

        <!--http://stackoverflow.com/questions/18999501/bootstrap-3-keep-selected-tab-on-page-refresh -->
        <script type="text/javascript">
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
        </script>

        <!--https://www.experts-exchange.com/questions/28687200/how-to-load-extrenal-url-in-bootstrap-tabs.html-->
        <script type="text/javascript">
            $(function () {
                $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                    var tab = $(e.target.attributes.href.value);
                    $(tab).load(tab.data('url'));
                });
                $('.nav-tabs a:first').each(function () {
                    $(this.attributes.href.value).load($(this.attributes.href.value).data('url'));
                });
            });
        </script> 


        <!--Triggering the Tooltips-->
        <script type="text/javascript">

            $(document).ready(function () {

                $('[data-toggle="tooltip"]').tooltip();
                $(".tip-top").tooltip({placement: 'top'});
            });

        </script>


        <!-- the following functions will copy
         the selected file name (for upload) to the label input-->
        <script>
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

        </script>

        <script type="text/javascript">
            function del_file(eleId) {
                var ele = document.getElementById("delete_file" + eleId);
                ele.parentNode.removeChild(ele);
            }
        </script>

        <!--add more Translators-->
        <script type="text/javascript">
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
        </script>

        <!--add more RightsHolders-->
        <script type="text/javascript">
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
        </script>

        <script>

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

        </script>

        <script>

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

        </script>

        <!--generateTranslatorTab-->
        <script>
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
                    rightsAgreementContractsNavContent += '<div class="col-md-8" style="margin-bottom: 20px">';
                    rightsAgreementContractsNavContent += '<label for="label_translator_cv' + j + '" class="control-label pull-left" >Upload a copy of ' + translatorArray[i] + '\'s CV:</label>';
                    rightsAgreementContractsNavContent += '<br>';
                    rightsAgreementContractsNavContent += ' <small class="pull-left" style="margin-bottom: 10px">this should include a list of previous published literary translations</small>';
                    rightsAgreementContractsNavContent += '<div class="input-group translatorcv pull-left" style="margin-bottom: 40px;">';
                    rightsAgreementContractsNavContent += '<label class="btn btn-default btn-file pull-left">';
                    rightsAgreementContractsNavContent += 'Select file <input type="file" onchange="generatedLabels()" name="Translator_CV-' + j + '" id="translator_cv' + j + '">';

                    rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                    rightsAgreementContractsNavContent += '</label>';
                    rightsAgreementContractsNavContent += '<input id="label_translator_cv' + j + '" class="pull-left">';
                    rightsAgreementContractsNavContent += '<br>';
                    rightsAgreementContractsNavContent += '<br>';
                    rightsAgreementContractsNavContent += '<input id="translator_cv_upload' + j + '" value="Translator_CV" name="destination" type="hidden">';
                    rightsAgreementContractsNavContent += '</div>';
                    rightsAgreementContractsNavContent += '</div>';

                    //Upload a copy of the contract with
                    rightsAgreementContractsNavContent += '<div class="col-md-9" style="margin-bottom: 10px">';
                    rightsAgreementContractsNavContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left">Upload a copy of the contract with ' + translatorArray[i] + '</strong></div>';
                    rightsAgreementContractsNavContent += '<br/>';
                    rightsAgreementContractsNavContent += '<div class="margin-bottom: 40px"></div>';
                    rightsAgreementContractsNavContent += '<div class="input-group contract"  style="margin-bottom: 40px;">';
                    rightsAgreementContractsNavContent += '<label class="btn btn-default btn-file pull-left">';
                    rightsAgreementContractsNavContent += 'Select file <input type="file" onchange="generatedLabels()" name="Contract-' + j + '" id="contract' + j + '">';
                    rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                    rightsAgreementContractsNavContent += '</label>';
                    rightsAgreementContractsNavContent += '<input id="label_contract' + j + '" class="pull-left"/>';
                    rightsAgreementContractsNavContent += '<input type="hidden" value="Contract" name="destination" id="contract_upload' + j + '"/>';
                    rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                    rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 

                    rightsAgreementContractsNavContent += '</div  class="container EndwrapperContainer">'; // <!--container-->
                    rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"

                }

                //show translatorTabs if hidden
                if ($(translatorTabs).css('display') === 'none' || $(translatorTabs).css("visibility") === "hidden") {
                    $(translatorTabs).show();
                }

                $(rightsAgreementContractsNavContent).appendTo('#tnc');

            }
        </script>

        <!--backToRightsAgreement-->
        <script>
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
        </script>

        <!--backToTranslators-->
        <script>
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
        </script>

        <!-- Add another Press Cutting-->
        <script type="text/javascript">
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
        </script>

        <script>
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
        </script>


        <!--add more Authors -->
        <script type="text/javascript">
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
        </script>

        <script>
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
        </script>

        <script>
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
        </script>


        <script>
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
        </script>

        <!--https://stackoverflow.com/questions/3392493/adjust-width-of-input-field-to-its-input-->
        <script>
            $(document).ready(function () {

                var input = document.querySelector('input'); // get the input element
//                alert(input);
                input.addEventListener('input', resizeInput); // bind the "resizeInput" callback on "input" event
                resizeInput.call(input); // immediately call the function

                function resizeInput() {
                    this.style.width = this.value.length + "ch";
                }
            });
        </script>

        <script>
            $(document).ready(function () {
//                var tripper = localStorage.getItem("translatorName");
//                document.getElementById("123").innerHTML = tripper;
//                document.getElementById("translatorName123").value = localStorage.getItem("translatorName8");
//                console.log("translatorName876   ", localStorage.getItem("translatorName876"));
//                console.log("translatorName8   ", localStorage.getItem("translatorName8"));
//                console.log("tripper 1  ", tripper);
            });
        </script>

        <script>
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
        </script>
        <script>
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
        </script>


        <script>
            $(document).ready(function () {
                var tcACCEPTED = '${tcACCEPTED}';
                var gdprACCEPTED = '${gdprACCEPTED}';
                document.getElementById("tcACCEPTED").value = tcACCEPTED;
                document.getElementById("gdprACCEPTED").value = gdprACCEPTED;

            });
        </script>

        <!--        <script type="text/javascript">
        //            $(document).ready(function () {
                    function validate() {
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
        //            });
                </script>-->

        <script>
//            $(document).ready(function () {
//                $('#applicationForm').validate({
//                    
//                    rules: {
//                        Email: {
//                            required: true,
//                            email: true
//                        },
//                        url: {
//                            required: true,
//                            url: true
//                        }
//
//                    },
//                    highlight: function (element, errorClass, validClass) {
//                        $(element).addClass(errorClass).removeClass(validClass);
//                        $(element.form).find("label[for=" + element.id + "]")
//                                .addClass(errorClass);
//                    },
//                    unhighlight: function (element, errorClass, validClass) {
//                        $(element).removeClass(errorClass).addClass(validClass);
//                        $(element.form).find("label[for=" + element.id + "]")
//                                .removeClass(errorClass);
//                    },
//                     validClass: "checked",
//                     success: function(label) {  
// // set &nbsp; as text for IE
// label.html("&nbsp;").addClass("checked");
// 
// }
//
//                });
//            });

            $(document).ready(function () {
                $('#applicationForm').validate({
                    rules: {
                        email: {
                            required: true,
                            email: true
                        },
                        url: {
                            required: true,
                            url: true
                        }
                    },

                    highlight: function (element, errorClass, validClass) {
                        $(element).nextAll('.form-control-feedback').show().removeClass('glyphicon-ok').addClass('glyphicon-remove');
                        $(element).addClass(errorClass).removeClass(validClass);
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    success: function (element) {
                        $(element).nextAll('.form-control-feedback').show().removeClass('glyphicon-remove').addClass('glyphicon-ok');
                        element.closest('.form-group').removeClass('has-error').addClass('has-success');
                        $(element).remove();
                    }
                });
            });
        </script>

        <!--styles-->
        <style>
            .icon-exclamation {
                color: #ff0000;

                ul {
                    margin: 0;
                }
                ul.dashed {
                    list-style-type: none;
                }
                ul.dashed > li {
                    text-indent: -5px;
                }
                ul.dashed > li:before {
                    content: "-";
                    text-indent: -5px;
                }
            }

            /*
             * rewrite h1              
             */

            .header1 {
                display: block;
                font-size: 2em;
                margin-top: 0.67em;
                margin-bottom: 0.67em;
                margin-left: 0;
                margin-right: 0;
                font-weight: bold;
                text-align: center;
            }


            /*
             * Checkboxes with tick mark
             */

            .checkbox label:after, 
            .radio label:after {
                content: '';
                display: table;
                clear: both;
            }

            .checkbox .cr,
            .radio .cr {
                position: relative;
                display: inline-block;
                border: 1px solid #a9a9a9;
                border-radius: .25em;
                width: 1.3em;
                height: 1.3em;
                float: left;
                margin-right: .5em;
            }

            .radio .cr {
                border-radius: 50%;
            }

            .checkbox .cr .cr-icon,
            .radio .cr .cr-icon {
                position: absolute;
                font-size: .8em;
                line-height: 0;
                top: 50%;
                left: 20%;
            }

            .radio .cr .cr-icon {
                margin-left: 0.04em;
            }

            .checkbox label input[type="checkbox"],
            .radio label input[type="radio"] {
                display: none;
            }

            .checkbox label input[type="checkbox"] + .cr > .cr-icon,
            .radio label input[type="radio"] + .cr > .cr-icon {
                transform: scale(3) rotateZ(-20deg);
                opacity: 0;
                transition: all .3s ease-in;
            }

            .checkbox label input[type="checkbox"]:checked + .cr > .cr-icon,
            .radio label input[type="radio"]:checked + .cr > .cr-icon {
                transform: scale(1) rotateZ(0deg);
                opacity: 1;
            }

            .checkbox label input[type="checkbox"]:disabled + .cr,
            .radio label input[type="radio"]:disabled + .cr {
                opacity: .5;
            }


            .checkbox-inline.no_indent,
            .checkbox-inline.no_indent+.checkbox-inline.no_indent {
                margin-left: 0;
                margin-right: 10px;
            }
            .checkbox-inline.no_indent:last-child {
                margin-right: 0;
            }

            body {
                margin: 5px;
                background: #d9d1d1
            }
            /* Tab Navigation */
            .nav-tabs {
                margin: 0;
                padding: 0;
                border: 0;    
            }
            .nav-tabs > li > a {
                background: #DADADA;
                border-radius: 0;
                box-shadow: inset 0 -8px 7px -9px rgba(0,0,0,.4),-2px -2px 5px -2px rgba(0,0,0,.4);
            }
            .nav-tabs > li.active > a,
            .nav-tabs > li.active > a:hover {
                background: #F5F5F5;
                box-shadow: inset 0 0 0 0 rgba(0,0,0,.4),-2px -3px 5px -2px rgba(0,0,0,.4);
            }
            a, u {
                text-decoration: none;
            }
            /* Tab Content */
            .tab-pane {
                background: #d9d1d1;
                box-shadow: 0 0 4px rgba(0,0,0,.4);
                border-radius: 0;
                text-align: center;
                padding: 10px;
            }

            .nav-tabs.two-lines>li {
                height:62px;
            }
            .nav-tabs.two-lines>li>a, .nav-tabs>li>a>div {
                height:100%;
            }
            input[type="text"]:focus + .glyphicon-search{
                color: #FF8C00;
            }

            .ui-state-highlight, 
            .ui-widget-content .ui-state-highlight, 
            .ui-widget-header .ui-state-highlight {
                border: 1px solid #003399;
                background: #003399 url("css/images/ui-bg_glass_55_fbf9ee_1x400.png") 50% 50% repeat-x;
            }

            .ui-datepicker { 
                width: 17em; 
                padding: .2em .2em 0; 
                display: none; 
                position: relative; z-index: 100000 !important;
                /*z-index: 2000 !important;*/
            }

            /*.ui-datepicker-calendar a.ui-state-default { background: cyan; }*/
            .ui-datepicker-calendar td.ui-datepicker-today a { background: lime; } 
            .ui-datepicker-calendar a.ui-state-hover { background: yellow; } 
            .ui-datepicker-calendar a.ui-state-active { background: red; } 

            /* Set whitespace between the generated input fields*/
            input.wsp{

                margin-right: 5px;
            }

            h1 {
                text-align: center;
            }
            .pressCuttingsUpload {
                margin: 20px 0;
            }

            .imageupload{
                margin: 20px 0;
            }
            .btn-file {
                position: relative;
                overflow: hidden;
            }
            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: white;
                cursor: inherit;
                display: block;
            }

            .panel {
                background-color: #d9d1d1 ;
                margin-top: 50px;
                box-shadow: 0 0 30px  #b6a6a6;    
                padding:0 15px 0 15px;
            }
            .panel-horizontal {
                background-color: #d9d1d1;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            .panel-horizontal > .panel-body {
                background-color: #d9d1d1;
                border-radius: 0 4px 4px 0;
                border-left: 1px solid #ddd;
            }

            .longLabel{
                display: inline-table;
                line-height: initial;
            }

            .form-input {
                height: 50px;
                font-size: 16px;    
            }

            .form-btn {
                line-height: 50px;
                font-size: 16px;
            }
            header h1{
                font-size:12pt;
                color: #fff;
                background-color: #1BA1E2;
                padding: 20px;

            }
            #article
            {
                width: 80%;
                margin:auto;
                margin-top:10px;
            }

            .thumbnail{

                height: 100px;
                margin: 10px;
                float: left;
            }
            #clear{
                display:none;
            }
            #result {
                border: 4px dotted #cccccc;
                display: none;
                float: right;
                margin:0 auto;
                width: 511px;

                .hovering i::before {
                    display: none;
                }

                .hovering:hover i::before {
                    display: block;
                }
            }

            .zoom {
                transition: transform .2s; /* Animation */
                margin: 0 auto;
            }

            .zoom:hover {
                transform: scale(2.5); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
            }
            .mytab .tab-pane{ 
                border:solid 1px blue;  
                border-top: 0;    
            }
            .mytab2 .tab-pane{ 
                border:solid 1px blue;  
                border-top: 0;    
            }
            #myTab li a { 
                border-color: blue;
                background-color:#A5C967; 
            }
            #myTab li.active a {
                border-bottom-color: transparent;
                background-color:Yellow; 
            }
            #myTab2 li a { 
                border-color: blue;
                background-color:#A5C967; 
            }
            #myTab2 li.active a {
                border-bottom-color: transparent;
                background-color:Yellow; 
            }
            .my-tab .tab-pane{ 
                border:solid 1px blue;  
                border-top: 0; 
                background-color:#F7EFC6;
            }

            .example{

                margin: 15px;
                font-size: 14px;
                color: #656666;
                content: "Example";

                background-color: #fff;
                border-color: #929494;
                border-width: 1px;
                border-radius: 4px;

                padding: 10px 20px 10px;
                border-style: solid;
            }

            .form-control-feedback{
                display: none;
            }
        </style>

    </head>    
    <body style="height: 100%">
        <sql:query var="companyQuery" dataSource="jdbc/ILGAS">
            SELECT * FROM international_publishers
            WHERE  international_publishers.Company_Number = ?
            <sql:param value="${publisherID}"/>
        </sql:query>    
        <c:set var="companyDetails" value="${companyQuery.rows[0]}"/>

        <div id="shadowholder">
            <div class="shadowtop"> </div>
            <div id="container">
                <div id="topspacer"> </div>

                <div id="topbar">

                    <div class="animateddiv">
                        <a><img src="images/flashtext-animated2.gif" height="80" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a class="logo"><span class="hidden">Literature Ireland</span></a>

                </div> <!--  End of topbar div -->


                <!--container for welcome/logout-->                

                <div class="container-fluid" style="margin-bottom: 20px; width: 100%">
                    <div class="pull-right">
                        <h6> <small>Welcome <strong>${name}</strong> - <strong>not ${name}</strong>? <a href="${pageContext.request.contextPath}/Logout">Click here to log out </a></small></h6>
                    </div>
                </div> <!--container for welcome/logout-->

                <h1 style="align-content: center">Translation Grant Application System for Literature Ireland</h1>

                <div class="container-fluid" style="margin-bottom: 20px"></div> 

                <nav class="navbar navbar-default" >

                    <div class="container-fluid"  style="background-color: #d9d1d1">

                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!--<a class="navbar-brand" href="#">Brand</a>-->
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="myTab" style="background-color: #d9d1d1">
                            <ul class="nav navbar-nav nav-tabs two-lines">
                                <!--<li class="active"><a href="#info" data-toggle="tab">Info</a></li>-->
                                <li class="active"><a href="#Contact" data-toggle="tab">Contact Details</a></li>
                                <li><a href="#books" data-toggle="tab">Book<br/> Details</a></li>
                                <li><a href="#Publication" data-toggle="tab">Publication<br/>  Details</a></li>
                                <li><a href="#Translator" data-toggle="tab">Translator <br/> Details</a></li>
                                <li><a href="#Rights" data-toggle="tab">Rights Agreement <br/> & Contracts</a></li>
                                <!--         <li><a href="#Misc" data-toggle="tab">Misc</a></li>    -->
                                <li><a href="#Original" data-toggle="tab"><span>Original Work &<br/> Sample Translation</span></a></li>
                            </ul>
                            <div style="margin: 20px; text-align: center">
                                <a data-toggle="tooltip" data-placement="top" title="Info" ><i class="material-icons zoom" onclick="showInfoModal();">info</i></a>
                                <a data-toggle="tooltip" data-placement="top" title="Notes" ><i class="material-icons zoom" onclick="showNotesModal();">note</i></a>                           
                            </div>

                        </div><!-- /.navbar-collapse -->

                        <form  
                            method="POST" 
                            id="applicationForm" 
                            name="applicationForm"   
                            class="example"
                            action="${pageContext.request.contextPath}/GrantApplicationServlet" 
                            enctype="multipart/form-data"> 

                            <div id="my-tab-content" class="tab-content"  style="background-color: #E8F6FF">


                                <input type="hidden" name="tcACCEPTED" id="tcACCEPTED">
                                <input type="hidden" name="gdprACCEPTED" id="gdprACCEPTED">
                                <input type="hidden" name="firstname" value ="${firstname}">
                                <input type="hidden" name="lastname" value ="${lastname}">
                                <input type="hidden" name="name" value ="${name}">
                                <input type="hidden" name="userID" value ="${userID}">
                                <input type="hidden" name="publisherID" value ="${publisherID}">
                                <input type="hidden" name="publisherName" value ="${publisherName}">

                                <!-- Contact details -->
                                <div class="tab-pane active" id="Contact">

                                    <!--wrapper for Contact tab pane-->
                                    <div class="container">

                                        <!--first row-->
                                        <!--get Company and Company_Number via autocomplete-->
                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                            <div class="col-sm-4">
                                                <input  id="Company" 
                                                        name="Company" 
                                                        type="text" 
                                                        value="${companyDetails.Company}"
                                                        data-toggle="tooltip"
                                                        title="Please Enter your Company's Name - if it does not show up please fill in the form"
                                                        class="form-control"
                                                        placeholder="Company Name"

                                                        >
                                            </div>

                                            <div class="col-sm-4">        
                                                <input id="Company_Number"                                
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="Company_Number"                                
                                                       value="${companyDetails.Company_Number}"                                   
                                                       placeholder="internal Company Number"
                                                       disabled
                                                       >
                                            </div>
                                        </div> <!--row-->

                                        <!--second row-->
                                        <div class="row" style="margin-bottom: 10px">
                                            <div class="col-sm-4">
                                                <label class="pull-left">Address1</label>
                                                <input id="Address1"
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="Address1"                                
                                                       value="${companyDetails.Address1}"                                
                                                       placeholder="Address1"
                                                       >
                                            </div>
                                            <div class="col-sm-2">
                                                <label class="pull-left">Post code</label>
                                                <input id="postCode"                                
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="postCode"                                
                                                       value="${companyDetails.postCode}"                                
                                                       placeholder="Post Code"
                                                       >
                                            </div>
                                            <div class="col-sm-3">
                                                <label class="pull-left">City</label>
                                                <input id="City"                                
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="City"                                
                                                       value="${companyDetails.City}"                                
                                                       placeholder="City"
                                                       >
                                            </div>
                                        </div> <!--row-->

                                        <!--third row-->
                                        <div class="row" style="margin-bottom: 10px">
                                            <div class="col-sm-4">
                                                <label class="pull-left">Address2</label>
                                                <input id="Address2"                                
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="Address2"                                
                                                       value="${companyDetails.Address2}"                                
                                                       placeholder="Address2"
                                                       >
                                            </div>

                                            <div class="col-sm-4">
                                                <label class="pull-left">Country</label>
                                                <input id="country"                                
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="Country"                                
                                                       value="${companyDetails.Country}"                                
                                                       placeholder="Country"
                                                       >
                                            </div>
                                        </div> <!--row-->

                                        <!--fourth row-->
                                        <div class="row" style="margin-bottom: 10px">
                                            <div class="col-sm-4">
                                                <label class="pull-left">Address3</label>
                                                <input id="Address3"                                
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="Address3"                                
                                                       value="${companyDetails.Address3}"                                
                                                       placeholder="Address3"
                                                       >
                                            </div>
                                            <div class="col-sm-2">   
                                                <label class="pull-left">&nbsp;</label>
                                                <input id="countryCode"                                
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="Country_Code"                                
                                                       value="${companyDetails.CountryCode}"                               
                                                       readonly
                                                       placeholder="Country Code"
                                                       >
                                            </div>
                                        </div> <!--row-->

                                        <!--fifth row-->
                                        <div class="row" style="margin-bottom: 10px">
                                            <div class="col-sm-4">      
                                                <label class="pull-left">Address4</label>
                                                <input id="Address4"                                
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="Address4"                                
                                                       value="${companyDetails.Address4}"                                
                                                       placeholder="Address4"
                                                       >
                                            </div>
                                            <div class="col-sm-3">
                                                <label class="pull-left">Telephone</label>
                                                <input id="Telephone"                                
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="Telephone"                                
                                                       value="${companyDetails.Telephone}"  
                                                       required
                                                       >
                                            </div>
                                        </div> <!--row-->

                                        <!--sixth row-->
                                        <div class="row" style="margin-bottom: 10px">
                                            <div class="col-sm-4"></div>
                                            <div class="col-sm-3">
                                                <label class="pull-left">Fax number</label>
                                                <input id="Fax"                                
                                                       type="text"                                
                                                       class="form-control"                                
                                                       name="Fax"                                
                                                       value="${companyDetails.Fax}"
                                                       >
                                            </div>
                                        </div> <!--row-->

                                        <!--seventh row-->
                                        <div class="row" style="margin-bottom: 10px">
                                            <div class="col-sm-4">
                                                <div class="form-group has-feedback">
                                                    <label for="Email" class="pull-left">Email</label>
                                                    <input id="Email"                                
                                                           type="email"                                
                                                           class="form-control"                                
                                                           name="Email"                                
                                                           value="${companyDetails.Email}"                                
                                                           placeholder="Main Email"
                                                           required
                                                           >
                                                    <span class="form-control-feedback glyphicon glyphicon-ok"></span>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group has-feedback">
                                                    <label for="url" class="pull-left">Website</label>
                                                    <!--<div class="control-group">-->
                                                    <input id="url"                                
                                                           type="url"                                
                                                           class="form-control"                                
                                                           name="WWW"                  
                                                           pattern="(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&=]*)"
                                                           value="${companyDetails.WWW}"                                
                                                           placeholder="Web Address"                                                      
                                                           required
                                                           >
                                                    <span class="form-control-feedback glyphicon glyphicon-ok"></span>
                                                    <!--</div>-->
                                                </div>
                                            </div>
                                        </div> <!--row-->

                                        <!--eighth row-->
                                        <div class="row" style="margin-bottom: 10px;margin-top: 20px">
                                            <div class="col-sm-4"> 
                                                <div class="well well-sm">
                                                    <div class="checkbox">                                                        
                                                        <input id="doNotMail" 
                                                               type="checkbox" 
                                                               name="doNotMail" 
                                                               value="${companyDetails.doNotMail}" 
                                                               checked =""
                                                               >  
                                                        <label for="doNotMail">Sign up to newsletters</label>
                                                    </div><!--checkbox-->
                                                </div> <!--well-->
                                            </div> <!--<div class="col-sm-3">-->   

                                        </div> <!--row-->
                                        <input type="hidden" id="translatorArray" name="translatorArray" >
                                        <input type="hidden" id="rightsHolderArray" name="rightsHolderArray" >
                                        <div class="row" style="margin-bottom: 10px;margin-top: 20px">
                                            <div class="col-sm-4"> 
                                                <!--keep in one line otherwise placeholder doesn't show-->
                                                <label class="pull-left">Additional contact information (where applicable)</label>
                                                <textarea id="companyNotes"  class="form-control" style="width: 780px; height: 332px;" name="companyNotes" placeholder="enter optional notes"> <c:out value="${companyDetails.Notes}" /></textarea>
                                            </div> <!-- wrapper container for Contact tab pane-->
                                        </div>
                                    </div> <!--row-->

                                </div> <!-- tab Contact details -->

                                <!-- Book Details -->
                                <div class="tab-pane fade" id="books">
                                    <p class="header1">
                                        Book Details
                                    </p>
                                    <div class="container-fluid">
                                        <div class="row"  style="display: block;
                                             margin-right: auto;
                                             margin-left: auto;">

                                            <!--First row-->
                                            <!--in Panel-->
                                            <div class = "panel panel-default">
                                                <div class = "panel-body">

                                                    <div class="row" style="margin-bottom: 10px">
                                                        <div class="col-sm-4">    
                                                            <div class="form-group has-feedback">
                                                                <label for="aFirstName" class="pull-left">Author</label>
                                                                <input id="aFirstName"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="AuthorFirstName"                                
                                                                       value=""    
                                                                       placeholder="Author First Name"
                                                                       >                                                               
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-4">    
                                                            <div class="form-group has-feedback">
                                                                <label for="aLastName" class="pull-left">&nbsp;</label>
                                                                <input id="aLastName"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="AuthorLastName"                                
                                                                       value=""    
                                                                       onblur="copyFirstRow2();"
                                                                       placeholder="Author Last Name"
                                                                       >                                                                
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-4" style="margin-top: 30px; ">  
                                                            <a href="#" class="btn btn-group-sm btn-default pull-left" 
                                                               data-toggle="modal" 
                                                               data-target="#addAuthorModal"
                                                               onclick="copyFirstRow2();"
                                                               >Add more authors</a>

                                                        </div>

                                                    </div> <!--row-->


                                                    <input type="hidden" id="author_array" name="authorArray" >

                                                    <!--Second row-->
                                                    <div class="row" style="margin-bottom: 15px">

                                                        <div class="col-sm-4">    
                                                            <label for="title" class="pull-left">Title</label> 
                                                            <input id="title"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="title"                                
                                                                   value=""    
                                                                   placeholder="Title"
                                                                   >
                                                        </div>

                                                        <div class="col-sm-4">          
                                                            <label for="appForeignPublisher" class="pull-left">Publisher (of the original work)</label>                                                           
                                                            <input id="appForeignPublisher"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="appForeignPublisher"                                
                                                                   value=""    
                                                                   placeholder="Publisher of original work"
                                                                   >                                                     
                                                        </div>

                                                        <div class="col-sm-3">    
                                                            <label for="publicationYear" class="pull-left">Publication year</label>
                                                            <input id="publicationYear"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="publicationYear"                                
                                                                   value=""    
                                                                   placeholder="Publication Year"
                                                                   >
                                                        </div>
                                                    </div> <!--row-->


                                                    <!--Third row-->

                                                    <div class="row" style="margin-bottom: 10px">

                                                        <div class="col-sm-4">    
                                                            <div class="form-group has-feedback">
                                                                <label for="genre" class="pull-left">Genre</label>
                                                                <input id="genre"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="genre"                                
                                                                       value=""    
                                                                       placeholder="Genre"
                                                                       >
                                                                <i class="glyphicon glyphicon-search form-control-feedback"></i>
                                                            </div>
                                                        </div>


                                                        <div class="col-sm-4">    
                                                            <label for="translationTitle" class="pull-left">Translation title</label>
                                                            <input id="translationTitle"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="translationTitle"                                
                                                                   value=""    
                                                                   placeholder="Translation Title"
                                                                   >
                                                        </div>
                                                    </div> <!--row-->


                                                    <div class="row" style="margin-bottom: 10px">
                                                        <div class="col-xs-4">
                                                            <div class="mini-box">
                                                                <div class="form-group has-feedback">
                                                                    <label for="languageOfTheOriginal" class="pull-left" >Language (of the original)</label>
                                                                    <input id="languageOfTheOriginal"                                
                                                                           type="text"                                
                                                                           class="form-control"                                
                                                                           name="languageOfTheOriginal"                                
                                                                           value=""    
                                                                           placeholder="Language"
                                                                           >      
                                                                    <i class="glyphicon glyphicon-search form-control-feedback"></i>
                                                                </div>
                                                            </div><!--mini-box-->
                                                        </div> <!--col-xs-6-->

                                                        <div class="col-xs-4">
                                                            <div class="mini-box">
                                                                <div class="form-group has-feedback">
                                                                    <label for="countryOfPublication" class="pull-left" > Country of publication</label>
                                                                    <input id="countryOfPublication"                                
                                                                           type="text"                                
                                                                           class="form-control"                                
                                                                           name="countryOfPublication"                                
                                                                           value=""    
                                                                           placeholder="Country of Publication"
                                                                           >
                                                                    <i class="glyphicon glyphicon-search form-control-feedback"></i>
                                                                </div>
                                                            </div><!--mini-box-->
                                                        </div> <!--col-xs-4-->         
                                                    </div> <!--row-->

                                                    <div class="row">
                                                        <div class="col-xs-4">
                                                            <div class="mini-box" style="margin-bottom: 20px">
                                                                <label for="series" class="pull-left"> &nbsp;<br/> Series</label>
                                                                <input id="series"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="series"                                
                                                                       value=""    
                                                                       placeholder="Series"
                                                                       >
                                                            </div>
                                                        </div> <!--col-xs-6-->


                                                        <div class='col-sm-4'  style="margin-bottom: 40px;">                                                
                                                            <label for="pageExtentOfTheOriginal" class="control-label pull-left">Page extent of the <br/> (of the original) </label>
                                                            <div class="input-group pull-left"  style="margin-bottom: 40px;">
                                                                <span class="input-group-addon" id="sizing-addon3">  
                                                                    <span class="glyphicon glyphicon-book"></span>                                                            
                                                                </span>
                                                                <input type="text" name="pageExtentOfTheOriginal" id="pageExtentOfTheOriginal" class="form-control" placeholder="number of pages" aria-describedby="sizing-addon3">
                                                            </div>
                                                        </div>
                                                    </div> <!--row-->

                                                    <!--Eigth row-->

                                                    <div class="row" style="margin-bottom: 10px">

                                                        <div class="col-sm-4">   
                                                            <label for="bookNotes" class="pull-left">Notes</label>
                                                            <div class="form-group">
                                                                <!--keep in one line otherwise placeholder doesn't show-->
                                                                <textarea class="form-control" id="bookNotes" name="bookNotes" style="width: 800px; height: 215px" placeholder="Notes"></textarea>
                                                            </div>
                                                        </div>                                                    
                                                    </div> <!-- row  -->
                                                </div>  <!-- panel-body-->     
                                            </div>  <!-- panel --> 
                                        </div> <!-- row  -->
                                    </div>  <!-- container-fluid  -->
                                </div> <!-- class="tab-pane" id="books" -->

                                <!-- Rights Agreement -->
                                <div class="tab-pane" id="Rights">
                                    <p class="header1" style="margin-bottom: 40px">
                                        Rights Agreement & Contracts
                                    </p>

                                    <div class="container-fluid"  id="rightsAgreementContracts">

                                        <div class="tab-content">
                                            <div class="row" style="margin-bottom: 10px;">
                                                <!--Upload a copy of the agreement with the translation rights holder-->
                                                <div class="col-md-10 agreement" style="margin-bottom: 1px">
                                                    <div  style="margin-bottom: 10px;"><strong class="pull-left">Upload a copy of the agreement with the translation rights holder</strong> <small class="pull-left"> &nbsp;  (where applicable)</small> </div>
                                                    <br/>
                                                    <div class="margin-bottom: 4px"></div>
                                                    <div class="input-group agreement"  style="margin-bottom: 10px;">
                                                        <label class="btn btn-default btn-file pull-left">
                                                            Select file <input type="file" name="Agreement-1" id="agreement1">
                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                        </label>
                                                        <input id="label_agreement1" class="pull-left" value=""/>
                                                        <input type="hidden" value="Agreement" name="destination" id="agreement_upload1"/>
                                                    </div> 
                                                </div> 
                                            </div> <!-- row  -->

                                            <!--Name of translation rights holder-->
                                            <div class="row" style="margin-bottom: 10px;">                                               
                                                <div class="col-sm-6">      
                                                    <div class="form-group has-feedback">
                                                        <label for="rightsHoldersName0" class="pull-left" id="rightsHoldersNameLabel">Translation rights holder</label>
                                                        <input id="rightsHoldersName0"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="rightsHoldersName0"                                
                                                               value=""  
                                                               onblur="copyFirstRightsHolderName();"
                                                               placeholder="Translation rights holder"
                                                               >
                                                    </div>

                                                    <div id="addAddRightsHolders"></div>
                                                </div>


                                                <div class="col-sm-4" style="margin-top: 30px; visibility: block" id="addAdditionalRightsHoldersModalDiv">  
                                                    <a href="#" class="btn btn-group-sm btn-default pull-left" 
                                                       data-toggle="modal" 
                                                       data-target="#addAdditionalRightsHoldersModal"
                                                       onclick="copyFirstRightsHolderName();"
                                                       >Add more Translation rights holders</a>
                                                </div>
                                            </div> <!-- row  -->

                                            <div class="row" style="margin-bottom: 10px;">
                                                <!--Upload form for addendum to the rights agreement-->
                                                <div class="col-md-12" style="margin-bottom: 10px">
                                                    <div  style="margin-bottom: 10px;"><strong class="pull-left">Upload a copy of the addendum to the rights agreement </strong> <small class="pull-left"> &nbsp;  (where applicable)</small></div>
                                                    <br/>
                                                    <div class="margin-bottom: 40px"></div>
                                                    <div class="input-group addendum"  style="margin-bottom: 40px;">
                                                        <label class="btn btn-default btn-file pull-left">
                                                            Select file <input type="file"  name="Addendum-1" id="addendum1">
                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                        </label>
                                                        <input id="label_addendum1" class="pull-left"/>
                                                        <input type="hidden" value="Addendum" name="destination" id="addendum_upload1"/>
                                                    </div> 
                                                </div> 
                                            </div> <!-- row  -->
                                        </div> <!--tab-content-->
                                    </div> <!-- container-fluid  -->
                                </div> <!-- class="tab-pane" id="Rights" -->

                                <!-- Publication Details -->
                                <div class="tab-pane" id="Publication">
                                    <p class="header1" style="margin-bottom: 40px">
                                        Publication Details
                                    </p>

                                    <div class="container-fluid">


                                        <div class="row">

                                            <div class='col-sm-4'>
                                                <label for="proposedDateOfPublication" class="control-label pull-left">Proposed date of publication<br/> &nbsp;</label>
                                                <div class="input-group pull-left"   style="margin-bottom: 40px;">
                                                    <input type="text" name="proposedDateOfPublication" id="proposedDateOfPublication" class="form-control" placeholder="DD/MM/YYYY" />    
                                                    <label class="input-group-addon" for="proposedDateOfPublication">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </label>
                                                </div>
                                            </div>    

                                        </div>

                                        <div class="row">

                                            <div class='col-sm-4'  style="margin-bottom: 40px;">                                                
                                                <label for="plannedPageExtent" class="control-label pull-left">Planned page extent of the <br/>  published translation </label>
                                                <div class="input-group pull-left"  style="margin-bottom: 40px;">
                                                    <span class="input-group-addon" id="sizing-addon2">  
                                                        <span class="glyphicon glyphicon-book"></span>                                                            
                                                    </span>
                                                    <input type="text" name="plannedPageExtent" id="plannedPageExtent" class="form-control" placeholder="number of pages" aria-describedby="sizing-addon2">
                                                </div>
                                            </div>

                                            <script>
                                                $("#DateOfPublicationOriginal").datepicker();
                                            </script>

                                            <script>
                                                $("#proposedDateOfPublication").datepicker();
                                            </script>

                                        </div>

                                        <div class="row">
                                            <div class='col-sm-4'>
                                                <label for="proposedPrintRun" class="control-label pull-left">Proposed print run </label>
                                                <div class="input-group pull-left"  style="margin-bottom: 40px;">
                                                    <span class="input-group-addon" id="sizing-addon1">  
                                                        <span class="glyphicon glyphicon-book"></span>                                                            
                                                    </span>
                                                    <input type="text" name="proposedPrintRun" id="proposedPrintRun" class="form-control" placeholder="number of books" aria-describedby="sizing-addon1">  
                                                </div>
                                            </div>

                                            <div class="col-sm-4">   
                                                <div class="form-group has-feedback">
                                                    <label for="appTargetLanguage" class="control-label pull-left"> Target language(s)</label>
                                                    <input id="appTargetLanguage"                                
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="appTargetLanguage"                                
                                                           >
                                                    <i class="glyphicon glyphicon-search form-control-feedback"></i>
                                                </div>
                                            </div>

                                            <input type="hidden" id="language_Array" name="languageArray" >

                                            <div class="col-sm-3">                                              
                                                <label for="bilingual" class="control-label">Bilingual edition</label>
                                                <br/> 
                                                <label style="font-size: 2.0em; " class="checkbox-inline  no_indent">
                                                    <input id="bilingual"
                                                           type="checkbox"                                
                                                           class="form-control"                                
                                                           name="bilingual"  
                                                           >
                                                </label>
                                            </div>
                                        </div> <!--row-->   

                                    </div> <!-- container-fluid  -->
                                </div> <!-- class="tab-pane" id="Publication" -->

                                <!-- Translator's Details -->
                                <div class="tab-pane" id="Translator"> 
                                    <p class="header1" style="margin-bottom: 5px">
                                        Translator Details
                                    </p>

                                    <div class="container-fluid" id="torget">

                                        <div class="row" style="margin-bottom: 1px">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="col-md-4" style="margin-top: 40px; margin-bottom: 20px">                                              

                                                        <label for="translatorFee" class="control-label pull-left">Translator(s)'s fee</label>                                                                        
                                                        <div class="input-group pull-left" style="margin-bottom: 20px">
                                                            <label class="input-group-addon" for="translatorFee">
                                                                <span class="glyphicon glyphicon-euro"></span>                                     
                                                            </label>
                                                            <input type="text" class="form-control pull-left" name="translatorFee" id="translatorFee" placeholder="fee">    
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4" style="margin-top: 40px; margin-bottom: 20px">  
                                                        <label for="BreakDownOfTranslatorFee" class="control-label pull-left">Break-down of translator(s)'s fee</label>                                                  
                                                        <div class="form-group">
                                                            <!--keep in one line otherwise placeholder doesn't show-->
                                                            <textarea class="form-control" placeholder="Break-down of translator fee" name="BreakDownOfTranslatorFee" id='BreakDownOfTranslatorFee' style="width: 280px; height: 196px;"></textarea>
                                                        </div>
                                                    </div>
                                                </div>  <!--panel--body-->
                                            </div> <!--panel-default-->
                                        </div> <!-- row -->


                                        <div class="row" style="margin-bottom: 10px">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="col-sm-4"> 
                                                        <div class="form-group has-feedback">
                                                            <label for="translatorName" class="pull-left" id="translatorNameLabel">Translator</label>
                                                            <input id="translatorName"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="translatorName"                                
                                                                   value=""    
                                                                   onblur="myFunction();"
                                                                   placeholder="Translator Name"
                                                                   >
                                                        </div>

                                                        <div id="addTransl">

                                                        </div>
                                                    </div>

                                                    <div class="col-sm-4" style="margin-top: 30px; visibility: block" id="addTranslatorModalDiv">  
                                                        <a href="#" class="btn btn-group-sm btn-default pull-left" 
                                                           data-toggle="modal" 
                                                           data-target="#addTranslatorModal"
                                                           onclick="copyFirstTranslatorName();"
                                                           >Add more translators</a>
                                                    </div>                                                    
                                                </div><!--panel-body-->
                                            </div><!--panel-default-->
                                        </div> <!--row-->

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="container-fluid" id="translatorTabs" style="display: none">
                                                <nav class="navbar navbar-default" >
                                                    <div class="container-fluid"  style="background-color: #d9d1d1">
                                                        <div class="navbar-header">
                                                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2" aria-expanded="false">
                                                                <span class="sr-only">Toggle navigation</span>
                                                                <span class="icon-bar"></span>
                                                                <span class="icon-bar"></span>
                                                                <span class="icon-bar"></span>
                                                            </button>
                                                        </div>
                                                        <div  id="tn">
                                                        </div>  <!-- tn -->
                                                        <div class="tab-content" id="tnc">
                                                        </div>  <!-- tnc -->
                                                    </div>  <!-- <div class="container-fluid"  -->
                                                </nav>  <!-- <nav class="navbar -->
                                            </div> <!-- container-fluid  -->

                                        </div> <!--row-->
                                    </div> <!-- container-fluid  -->
                                </div> <!-- class="tab-pane" id="Translator" -->

                                <!-- Original Work & Sample Translation -->
                                <div class="tab-pane" id="Original">
                                    <p class="header1" style="margin-bottom: 40px">
                                        Original Work & Sample Translation
                                    </p>
                                    <div class="container-fluid">
                                        <div class="row" >
                                            <div class="panel panel-default">
                                                <div class="panel-body">

                                                    <!--copies of the original work-->
                                                    <div class="col-md-9" >
                                                        <div class="checkbox">                                                             
                                                            <label for="copiesSent" class=" pull-left"><strong>One copy of the original work<sup>*</sup> sent to Literature Ireland by post</strong></label>
                                                            <label style="font-size: 2.0em; " class="checkbox-inline  no_indent">
                                                                <input type="checkbox" 
                                                                       name="copiesSent" 
                                                                       id="copiesSent" 
                                                                       value="ticked" 
                                                                       class="form-control">
                                                                <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                                            </label>
                                                            <!--<input type="text" name="ApplicationNumber" value="${ApplicationNumber}">-->
                                                            <input type="hidden" name="userID" value="${userID}">
                                                            <input type="hidden" name="publisherID" value="${publisherID}">
                                                            <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                        </div>
                                                    </div> <!-- col-md-9 -->

                                                    <!--Date copies were sent:-->
                                                    <div class="col-md-3" >
                                                        <strong>Date copies were sent:</strong> 
                                                        <div class="input-group">
                                                            <input type="text" name="dateCopiesWereSent" id="dateCopiesWereSent" class="form-control" placeholder="DD/MM/YYYY" />    
                                                            <label class="input-group-addon" for="dateCopiesWereSent">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </label>
                                                        </div>  <!-- input-group -->
                                                    </div> <!--col-md-3-->

                                                    <!--datepicker  mail-sent-->
                                                    <script>
                                                        $("#dateCopiesWereSent").datepicker();
                                                    </script>
                                                </div> <!--panel--body-->
                                            </div> <!--panel-default-->
                                        </div> <!-- row -->

                                        <div class="row" >
                                            <div class="panel panel-default">        
                                                <div class="panel-body">
                                                    <div class="col-md-12">

                                                        <div class="alert alert-danger" role="alert" id="errorField" style="display:none">
                                                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                                            <span class="sr-only">Error:</span>
                                                            <span class="message"></span>
                                                        </div>
                                                        <div class="alert alert-success" role="alert" id="successField" style="display:none">
                                                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                                            <span class="sr-only">Success:</span>
                                                            <span class="message"></span>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-8"   style="margin-bottom: 40px">
                                                                <label for="label_originalSample" class="control-label pull-left">Upload electronic copy of original work</label>
                                                                <div class="input-group originalSample pull-left"  
                                                                     >
                                                                    <label class="btn btn-default btn-file pull-left">
                                                                        Select file 
                                                                        <input type="file"  
                                                                               name="Original" 
                                                                               id="originalSample" >
                                                                        <span class="glyphicon glyphicon-folder-open"></span>
                                                                    </label>
                                                                    <input id="label_originalSample" class="pull-left">                                                                               
                                                                    <br/>
                                                                    <br/>          
                                                                    <input type="hidden" name="userID" value="${userID}">
                                                                    <input type="hidden" name="publisherID" value="${publisherID}">
                                                                    <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                                    <!--Destination:-->
                                                                    <input type="hidden" id="originalSample_upload" value="originalSample" name="destination" />                                          
                                                                </div>
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <label for="translationSample" class="control-label pull-left">Upload copy of translation sample<sup>**</sup><br/> (10 to 12 pages of prose or six poems)</label>
                                                                <div class="input-group translationSample pull-left" >
                                                                    <label class="btn btn-default btn-file pull-left">
                                                                        Select file 
                                                                        <input type="file"  name="TranslationSample" id="translationSample" class="form-input">
                                                                        <span class="glyphicon glyphicon-folder-open"></span>
                                                                    </label>
                                                                    <input id="label_translationSample" class="pull-left"/>
                                                                    <br/>
                                                                    <br/>          
                                                                    <input type="hidden" name="userID" value="${userID}">
                                                                    <input type="hidden" name="publisherID" value="${publisherID}">
                                                                    <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                                    <!--Destination:-->
                                                                    <input type="hidden" id="translationSample_upload" value="translationSample" name="destination" />                                          
                                                                </div>
                                                            </div> <!-- col-md-8 -->
                                                        </div> <!--row-->                                                            

                                                        <!-- translationSampleForm -->                                                                                                              
                                                    </div>  <!-- col-md-12 -->
                                                </div>  <!--panel--body-->
                                            </div> <!--panel-default-->
                                        </div> <!-- row -->

                                        <div class="row" >
                                            <div class="panel panel-default">        
                                                <div class="panel-body">

                                                    <div class="col-md-9"   >
                                                        <div class="input-group input-group-lg">
                                                            <button type="submit"              
                                                                    data-toggle="tooltip" 
                                                                    class="btn btn-success"
                                                                    title="Click to submit the application!"
                                                                    style="margin-bottom: 10px"
                                                                    name="Start New Application"
                                                                    >
                                                                Submit the application
                                                                <span class="glyphicon glyphicon-import"></span>
                                                            </button>                                        
                                                        </div><!-- input-group -->
                                                    </div>  <!-- col-md-9 -->
                                                </div>  <!-- panel--body -->
                                            </div>  <!--panel--default-->                                                
                                        </div> <!-- row -->
                                        <hr/>
                                        <div class="col-md-10">
                                            <i class="pull-left"><strong>*</strong> Please contact Literature Ireland if a hard copy the original work cannot be obtained.<br/>
                                                &nbsp;  <strong>**</strong> If more than one translator is involved, a translation sample must be submitted for each translator.</i>
                                        </div>    
                                    </div>  <!-- container-fluid -->
                                </div> <!-- tab-pane Original --> 


                            </div> <!-- my-tab-content -->           

                            <!--pressCuttingsModal-->
                            <div class="modal fade" id="pressCuttingsModal" tabindex="-1" role="dialog" aria-labelledby="pressCuttingsModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal"  onclick="backToMisc();"  aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="pressCuttingsModalLabel">add Press Cuttings</h4>
                                        </div> <!--modal header -->

                                        <div class="modal-body" style="background-color: #d9d1d1">
                                            <div class="row" style="margin-bottom: 10px">
                                                <output id="result">Press Cuttings</output>
                                                <!--<button type="button" id="clear">Clear</button>-->
                                            </div>
                                            <div class="row" style="margin-bottom: 10px">
                                                <div class='col-sm-12'>
                                                    <button type="button" id="clear">Clear</button>
                                                </div>
                                            </div>
                                        </div> <!--modal body -->

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <!--<button id="pressCutting" type="button" value="Add another Press Cutting"  class="btn btn-group-sm  button teal pull-left">Add Press Cuttings</button>-->
                                            <label class="btn btn-default btn-file">
                                                Add Press Cuttings<input type="file" id="files" multiple  accept=".gif,.jpg,.jpeg,.png,.doc,.docx,.pdf">
                                            </label>
                                            <!--<button type="button" id="clear">Clear</button>-->
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="backToMisc();">Done</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!--modal fade-->

                            <input type="hidden" value="pressCuttings" name="image-file" id="label_pressCuttings"/>

                            <!--addTranslatorModal-->
                            <div class="modal fade" id="addTranslatorModal" tabindex="-1" role="dialog" aria-labelledby="addTranslatorModalLabel">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal"  onclick="backToTranslators();"  aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="addTranslatorModalLabel">add more Translators</h4>
                                        </div>


                                        <div class="modal-body" style="background-color: #d9d1d1">

                                            <div class="row" style="margin-bottom: 10px">
                                                <div class='col-sm-12'>

                                                    <div  id="generatedForm" class="input-group" style='margin-bottom:2px'>
                                                        1. Translator <input type="text" id="first0" value="Name" style='margin-bottom:2px'>                                                         
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <button id="addElement" type="button" value="Add another Translator"  class="btn btn-group-sm  button teal pull-left">Add another Translator</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="backToTranslators();">Done</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!--modal fade-->

                            <!--addAdditionalRightsHoldersModal-->
                            <div class="modal fade" id="addAdditionalRightsHoldersModal" tabindex="-1" role="dialog" aria-labelledby="addAdditionalRightsHoldersModalLabel">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal"  onclick="backToRightsAgreement();"  aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="addAdditionalRightsHoldersModalLabel">add more Translation rights holder</h4>
                                        </div>


                                        <div class="modal-body" style="background-color: #d9d1d1">

                                            <div class="row" style="margin-bottom: 10px">
                                                <div class='col-sm-12'>

                                                    <div  id="RightsHolderGeneratedForm" class="input-group" style='margin-bottom:2px'>
                                                        1. Rights holder <input type="text" id="firstRightsHolder0" value="Name" style='margin-bottom:2px'>                                                         
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <button id="addAdditionalRightsHolders" type="button" value="additional rights holders"  class="btn btn-group-sm  button teal pull-left">Add additional rights holders</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="backToRightsAgreement();">Done</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!--modal fade-->


                            <!--addAuthorModal-->
                            <div class="modal fade" id="addAuthorModal" tabindex="-1" role="dialog" aria-labelledby="addAuthorModalLabel">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal"  onclick="backToBooks();"  aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="addAuthorModalLabel">add more Authors</h4>
                                        </div>


                                        <div class="modal-body" style="background-color: #d9d1d1">

                                            <div class="row" style="margin-bottom: 10px">


                                                <div  id="generatedFormAuthors" class="input-group" style='margin-bottom:2px'>
                                                    <div class='col-sm-12'>
                                                        1. Author <input type="text" id="firstAuthor0" value="Name" style='margin-bottom:2px'> <input type="text" id="lastAuthor0" value="Name" style='margin-bottom:2px'>                                                         
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <button id="addAuthor" type="button" value="Add another Author"  class="btn btn-group-sm  button teal pull-left">Add another Author</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="backToBooks2();">Done</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!-- addAuthorModal -->

                            <!--showInfoModal-->
                            <div class="modal fade" id="showInfoModal" tabindex="-1" role="dialog" aria-labelledby="showInfoModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal"  aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="showInfoModalLabel">Info</h4>
                                        </div>


                                        <div class="modal-body" style="background-color: #d9d1d1">

                                            <h2><strong>Translation Grant Programme Application Checklist</strong></h2>
                                            <br/>
                                            <br/>
                                            <strong>Your application to the Literature Ireland Translation Grant Programme should include the following:</strong>
                                            <br/>
                                            <br/>
                                            <h3> Contact Details</h3>
                                            <ul class="dashed">
                                                <li>The name, address, email and phone number of the applicant</li>
                                            </ul>

                                            <h3> Contracts</h3>
                                            <ul class="dashed">
                                                <li>A copy of the agreement with the translation rights holder (where applicable)<br/>
                                                <li> A copy of the contract with the translator </li>
                                            </ul>

                                            <h3> Publication Details</h3>
                                            <ul class="dashed">
                                                <li>The proposed date of publication<br/>
                                                <li>The proposed print run<br/></li>
                                                <li>The planned page extent of the published translation </li>
                                            </ul>

                                            <h3> Translator's Details</h3>
                                            <ul class="dashed">
                                                <li>A copy of the translator's CV, including a list of previous published literary translations</li>
                                                <li>Details of the fee to be paid to the translator (this should include the total sum in Euro and a breakdown of the rate according to which this sum has been calculated)</li>
                                            </ul>

                                            <h3> Original Work & Sample Translation</h3>
                                            <ul class="dashed">
                                                <li>Two copies of the original work* </li>
                                                <li>Two copies of a translation sample** consisting of 10 to 12 pages of prose or six poems</li>
                                            </ul>

                                            <br/>
                                            <p> <i> * &nbsp; Please contact Literature Ireland if two copies of the original work cannot be obtained.<br/>
                                                    ** If more than one translator is involved, a translation sample must be submitted for each translator.
                                                </i> </p>
                                            All queries in relation to the Translation Grant Programme should be addressed to Deputy Director Rita McCann at rita[at]literatureireland[dot]com or Administrator Orla King at orla[at]literatureireland[dot]com.
                                            <br/>
                                        </div>

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!--modal fade-->

                            <!--showNotesModal-->
                            <div class="modal fade" id="showNotesModal" tabindex="-1" role="dialog" aria-labelledby="showNotesModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="showNotesModalLabel">Notes</h4>
                                        </div>


                                        <div class="modal-body" style="background-color: #d9d1d1">
                                            <div class="row" style="margin-bottom: 10px">

                                                <p class="header1"> 
                                                    NOTES
                                                </p>
                                                <br/>
                                                <ol>
                                                    <li>The <strong>deadlines for application</strong> are available on the Literature Ireland website at <a href="http://www.literatureireland.com/programmes/translation-grant-programme/">http://www.literatureireland.com/programmes/translation-grant-programme/</a>. There are typically three deadlines per year.  </li>

                                                    <li>The deadline for application is the <strong>date by which applications should be received</strong> by Literature Ireland and not the date by which they should be posted. Allowance is made for postal delays but submissions received more than one week after the deadline may not be accepted.  </li>

                                                    <li><strong>Late applications</strong> may, in rare cases, be accepted at the discretion of Literature Ireland. However, late submission will affect the timeliness with which the applicant publisher can be informed of the outcome of his/her application. </li>

                                                    <li>It is recommended that the <strong>translation sample</strong> submitted be a final or near-final version which has been <strong>proofread and edited</strong>. If the sample submitted is an early or unedited draft, the applicant is requested to inform Literature Ireland of this fact.  </li>

                                                    <li>Literature Ireland maintains records of the <strong>average/typical rates paid to literary translators</strong> in different countries. If the rate being paid to the translator is substantially different from that which might be usual, the applicant is requested to include an explanation for this in his/her application. </li> 

                                                    <li> For each application, the <strong>translation sample is assessed by an independent expert</strong>, who provides a report which is made available to the board of Literature Ireland when it considers the request for funding (see note 7). </li>

                                                    <li>All applications are considered by the board of Literature Ireland at meeting held six to <strong>eight weeks after the deadline</strong>. Applications for translations due for publication before the date of the board meeting will be deemed ineligible.  </li>

                                                    <li>Applicants are informed of the <strong>outcome of the application</strong> within 10 days of the board meeting. Successful applicants will be issued with formal contracts and a letter of award within six weeks of grant approval.   </li> 
                                                </ol>

                                            </div>
                                        </div>

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!--modal fade-->


                        </form> 
                    </div>  <!-- container-fluid -->
                </nav>

                <form class="form-horizontal" 
                      role="form"  
                      autocomplete="on"  
                      action="${pageContext.request.contextPath}/Application" 
                      method="POST" 
                      name="regF"
                      >
                    <input type="hidden" name="userID" value="${userID}">
                    <input type="hidden" name="publisherID" value="${publisherID}">
                    <input type="hidden" name="Company" value="${companyDetails.Company}">
                    <input type="hidden" name="publisherName" value="${companyDetails.Company}">

                    <div class="container col-sm-12" style="margin-bottom: 40px">
                        <input type="submit" id="NewApplication" name="New Application"  class = "btn btn-default btn-sm active" value="New Application" />
                        <input type="submit" id="ListOpenApplications" name="List Open Applications"  class = "btn btn-default btn-sm" value="List Open Applications" />
                        <input type="submit" id="ListPendingApplications" name="List Pending Applications"  class = "btn btn-default btn-sm" value="List Pending Applications" />
                        <input type="submit" id="ListClosedApplications" name="List Closed Applications"  class = "btn btn-default btn-sm" value="List Closed Applications" />
                    </div>
                </form>

                <!--footer start-->

                <div id="base">  

                    <div class="basetext">  
                        <h2>Literature Ireland</h2>
                        <a href="contact-us">Contact Details</a> &nbsp;|&nbsp; <a href="legal-note">Legal Note</a>
                    </div><!-- end of BaseText div -->

                    <div class="baselogo-1 hidden-phone"><a href="http://www.cultureireland.gov.ie" target="_blank"><span class="hidden">Culture Ireland</span></a></div>
                    <div class="baselogo-2 hidden-phone"><a href="http://www.artscouncil.ie" target="_blank"><span class="hidden">The Arts Council</span></a></div>
                    <div class="baselogo-4 hidden-phone"><a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a></div>

                    <div class="mobile-baselogos visible-phone"> 
                        <a href="http://www.cultureireland.gov.ie" target="_blank"><span class="hidden">Culture Ireland</span></a>
                        <a href="http://www.artscouncil.ie" target="_blank"><span class="hidden">The Arts Council</span></a>
                        <a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a>
                    </div>

                </div><!-- end of Base div -->

            </div><!-- end of container div -->
            <div class="shadowbase"> </div>
        </div><!-- end of Shadowholder container div -->

        <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
            &copy; 2019 mgr Software
        </div>
    </body>
</html>