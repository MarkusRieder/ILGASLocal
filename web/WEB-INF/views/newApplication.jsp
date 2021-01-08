<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%-- 
    Document   : newApplication.jsp
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
        <meta name="robots" content="noindex, nofollow">

        <title>Translation Grant Application System</title>

        <!-- Bootstrap -->

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 

        <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.inputfile.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css" />
        <link rel="stylesheet" type="text/css" href="css/newApplication.css">


        <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-autocomplete/1.0.7/jquery.auto-complete.min.js"></script>
        <script type="text/javascript"  src="js/moment.js"></script>
        <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js" ></script>
        <script type="text/javascript"  src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"  src="js/jquery-ui.js"></script>
        <script type="text/javascript"  src="js/pdf.js"></script>
        <script type="text/javascript"  src="js/pdf.worker.js"></script>
        <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
        <script type="text/javascript"  src="js/xregexp-all.js"></script> 
        <script type="text/javascript"  src="js/newApplicationFormValidator.js"></script>



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
            var counterTranslators = 0;
            var counterRightsHolders = 0;
            var pressCuttingCounter = 0;
            var translatorCounter = 0;
            var translatorName876 = "";
            var itemValue = "";



            //    localStorage.clear();

            PDFJS.workerSrc = 'js/pdf.worker.js';

//            $(document).ready(function () {
            $("#genre").removeAttr("autocomplete").attr("autocomplete", "On");
            $("#countryOfPublication").removeAttr("autocomplete").attr("autocomplete", "On");
            $("#appTargetLanguage").removeAttr("autocomplete").attr("autocomplete", "On");
            $("#appLanguageOriginal").removeAttr("autocomplete").attr("autocomplete", "On");

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
//            });

            /*
             * Section AutoComplete
             */

            /*
             * AutoComplete_Genres
             */

            $(function () {
                $("#genre").autocomplete({
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
                    },
                    change: function (event, ui) {
                        if (ui.item === null) {
                            event.currentTarget.value = '';
                            event.currentTarget.focus();
                            console.log("brim $(this) ", $(this));
                            $(this).valid();  // trigger validation test
                        }
                    }
                });
            });


            //AutoComplete_country

            $(function () {
                $("#countryOfPublication").autocomplete({
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
//                        $('#countryCode').val(ui.item.id);
                    },
                    change: function (event, ui) {
                        if (ui.item === null) {
                            event.currentTarget.value = '';
                            event.currentTarget.focus();
                            console.log("brim $(this) ", $(this));
                            $(this).valid();  // trigger validation test
                        }
                    }
                });
            });

            $(function () {
                function split(val) {
                    return val.split(/,\s*/);
                }
                function extractLast(term) {
                    return split(term).pop();
                }

                $("#appTargetLanguage")
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
                            },
                            change: function (event, ui) {
                                if (ui.item === null) {
                                    event.currentTarget.value = '';
                                    event.currentTarget.focus();
                                    console.log("brim $(this) ", $(this));
                                    $(this).valid();  // trigger validation test
                                }
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
                    },
                    change: function (event, ui) {
                        if (ui.item === null) {
                            event.currentTarget.value = '';
                            event.currentTarget.focus();
                            console.log("brim $(this) ", $(this));
                            $(this).valid();  // trigger validation test
                        }
                    }
                });
            });


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




            /*
             * the following functions will copy 
             * the selected file name (for upload) to the label input
             */

//            $(function () {
//                $('div.translator_cv').on('change', ':file', function () {
//                    //                    alert("translator_cv");
//                    var input = $(this),
//                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
//                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
//                    input.trigger('fileselect', [numFiles, label]);
//                    //                  var label_translatorid2 = "label_translator" + id2;
//                    console.log("div.translator_cv Name ", label);
//                    document.getElementById("label_translator0").value = label;
//                });
//            });
            $(function () {
                $('div.agreement').on('change', ':file', function () {
                    alert("div.agreement");
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    //                  var label_translatorid2 = "label_translator" + id2;
                    console.log("label_agreement1 Name ", label);
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
//            $(function () {
//                $(document).on('change', 'div.translatorcv :file', function () {
//                    //                    alert("translatorcv");
//                    var id = parseInt(this.id.replace("translator_cv", ""));
//                    var input = $(this),
//                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
//                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
//                    input.trigger('fileselect', [numFiles, label]);
//                    var label_translatorid = "label_translator_cv" + id;
//                    console.log("label_translatorid Name ", label_translatorid);
//                    document.getElementById(label_translatorid).value = label;
//                });
//            });
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
                    console.log("generatedLabels this ", $(this));

                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    console.log("generatedLabels numFiles ", numFiles);
                    console.log("generatedLabels label ", label);
                    var id = input[0].id;
                    var label_id = "label_" + id;
                    console.log("generatedLabels input ", input);
                    console.log("generatedLabels id ", id);
                    console.log("label_id              ", label_id);
                    document.getElementById(label_id).value = label;
                    console.log("generatedLabels document.getElementById(" + label_id + " = ", label);
                    console.log("The rulez:  ");
                    console.log($("#applicationForm").validate().settings.rules);
                    /*
                     * validate the input element 
                     */
                    $("#applicationForm").validate(label);

                });
            }




            function del_file(eleId) {
                var ele = document.getElementById("delete_file" + eleId);
                ele.parentNode.removeChild(ele);
            }


            /*
             * add more Translators
             */
            $(document).ready(function () {
                counterTranslators = 1;
                $("#addElement").click(function (event) {
                    counterTranslators++;
                    var $newDiv = $("<div class='input-group' style='margin-bottom :2px'>" + counterTranslators + ". Translator  </div>");
                    var $newInput = $("<input placeholder='Translator Name' type='text'> ");
                    $newInput
                            .attr("name", "Name" + counterTranslators)
                            .attr("id", "tname" + counterTranslators)
                            .addClass("text wsp");
                    $newInput.appendTo($newDiv);
                    $newDiv.appendTo($("#generatedForm"));
                });
            });


            /*
             * add more RightsHolders
             */
            $(document).ready(function () {
                counterRightsHolders = 1;
                $("#addAdditionalRightsHolders").click(function (event) {
                    counterRightsHolders++;
                    var $newDiv = $("<div class='input-group' style='margin-bottom :2px'>" + counterRightsHolders + ".  Rights holder  </div>");
                    var $newInput = $("<input placeholder='Rights holder name' type='text'> ");
                    $newInput
                            .attr("name", "Name" + counterRightsHolders)
                            .attr("id", "rhname" + counterRightsHolders)
                            .addClass("text wsp");
                    $newInput.appendTo($newDiv);
                    $newDiv.appendTo($("#RightsHolderGeneratedForm"));
                });
            });




            /*
             * Copy the first translator name to the pop up modal
             */
            function  copyFirstTranslatorName() {

                translatorArray = [];
                console.log("copyFirstTranslatorName translatorArray cleared ", translatorArray);

                /*
                 * hide the single document upload and
                 * remove 'OR' from 'OR add more translators'
                 */
                $("#uploadDocuments").hide();
                $('#addTranslatorModala').text("add more translators");

                var fn = document.getElementById("translatorName");
                document.getElementById("first0").value = fn.value;
                translatorName = fn.value;
                console.log("copyFirstTranslatorName translatorName ", translatorName);
                translatorArray.push(translatorName);
                console.log(" first entry in translatorArray ", fn.value);

                if (!localStorage.translatorContent === 0) {
                    //function retrieve(){
                    document.getElementById("torget").innerHTML = localStorage.getItem("translatorContent");
                    console.log("backToTranslators localStorage.translatorContent ", localStorage.translatorContent.length);
                    for (i = 0; i < translatorContent.length; i++) {
                        console.log("restored translatorContent " + translatorContent);
                    }
                }


                /*
                 * back To Translators tab
                 */
                $('#bs-example-navbar-collapse-2 a[href="#Translator"]').tab('show');
            }


            /*
             * Copy the first translator name to the pop up modal
             */
            function  copyFirstRightsHolderName() {

                rightsHolderArray = [];
                console.log("copyFirstRightsHolderName rightsHolderArray cleared ", rightsHolderArray);

                var fn = document.getElementById("rightsHoldersName0");
                document.getElementById("firstRightsHolder0").value = fn.value;
                rightsHolderName = fn.value;
                console.log("copyFirstRightsHolderName rightsHolderName ", rightsHolderName);
                rightsHolderArray.push(rightsHolderName);
                console.log(" first entry in rightsHolderArray ", fn.value);

                $("#rightsHolderArray").val(rightsHolderArray);
                console.log("copyFirstRightsHolderName rightsHolderArray ", rightsHolderArray);

                // Switch on "Add Additional Rights Holders"
                $('#addAdditionalRightsHoldersModalDiv').toggle();

                if (!localStorage.translatorContent === 0) {
                    //function retrieve(){
                    document.getElementById("torget").innerHTML = localStorage.getItem("translatorContent");
                    console.log("backToTranslators localStorage.translatorContent ", localStorage.translatorContent.length);
                    for (i = 0; i < translatorContent.length; i++) {
                        console.log("restored translatorContent " + translatorContent);
                    }
                }


                // back To Rights tab
                $('#bs-example-navbar-collapse-2 a[href="#Rights"]').tab('show');
//                $('#bs-example-navbar-collapse-2 a[href="#Rights"]').tab('show');
            }



            /*
             * generateTranslatorTab
             */
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

                rightsAgreementContractsNavBar += '<div class="collapse navbar-collapse"  style="background-color: #d9d1d1">';
                rightsAgreementContractsNavBar += '<ul class="nav navbar-nav nav-tabs two-lines">';

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


                    console.log("processFirstTranslator generateTranslatorTab Upload a copy of the CV i " + i + " j " + j + " :: " + translatorArray[i]);

                    /*
                     * Upload a copy of the CV
                     */

                    rightsAgreementContractsNavContent += '<div class="col-md-8" style="margin-bottom: 40px">';
                    rightsAgreementContractsNavContent += '<div class="form-group has-feedback">';

                    rightsAgreementContractsNavContent += '<label for="translator_cv' + j + '"  class="control-label pull-left required-field">Upload a copy of ' + translatorArray[i] + '\'s CV:</label>';
                    rightsAgreementContractsNavContent += ' <small class="pull-left" style="margin-bottom: 10px"> &nbsp; &nbsp;   this should include a list of previous published literary translations</small>';

                    rightsAgreementContractsNavContent += '<div class="input-group translatorcv pull-left">';
                    rightsAgreementContractsNavContent += '<label class="input-group-addon btn btn-default btn-file">';
                    rightsAgreementContractsNavContent += ' Select file <input type="file" required  onchange="generatedLabels();" class="form-input Translator_CV file-upload" name="Translator_CV-' + j + '" id="translator_cv' + j + '">';
                    rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                    rightsAgreementContractsNavContent += '</label> ';
                    rightsAgreementContractsNavContent += '<input id="label_translator_cv' + j + '" class="pull-left" value=""/>  ';
                    rightsAgreementContractsNavContent += '</div>  ';
                    rightsAgreementContractsNavContent += '<input type="hidden" value="Translator_CV" name="destination" id="translator_cv_upload' + j + '"/>';
                    rightsAgreementContractsNavContent += '</div>';
                    rightsAgreementContractsNavContent += '<label for="Translator_CV' + j + '" class="validation_error_message help-block"></label>';
                    rightsAgreementContractsNavContent += '</div> ';
                    /*
                     * Upload a copy of the contract with
                     */
                    rightsAgreementContractsNavContent += '<div class="col-md-8">';
                    rightsAgreementContractsNavContent += '<div class="form-group has-feedback"> ';
                    rightsAgreementContractsNavContent += '<label for="label_contract' + j + '" class="control-label pull-left required-field" >Upload a copy of the contract with ' + translatorArray[i] + '</label>';
                    rightsAgreementContractsNavContent += '<div class="input-group contract pull-left">';
                    rightsAgreementContractsNavContent += '<label class="input-group-addon btn btn-default btn-file">';
                    rightsAgreementContractsNavContent += 'Select file <input type="file" required onchange="generatedLabels()" class="form-input Contract file-upload" name="Contract' + j + '" id="contract' + j + '" >';
                    rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                    rightsAgreementContractsNavContent += '</label>';
                    rightsAgreementContractsNavContent += '<input id="label_contract' + j + '" class="pull-left"/>';
                    rightsAgreementContractsNavContent += '</div>';
                    rightsAgreementContractsNavContent += '<input type="hidden" value="Contract" name="destination" id="contract_upload' + j + '"/>';
                    rightsAgreementContractsNavContent += '</div>';
                    rightsAgreementContractsNavContent += '<label for="Contract' + j + '" class="validation_error_message help-block"></label> ';
                    rightsAgreementContractsNavContent += '</div>';


                    rightsAgreementContractsNavContent += '</div>';
                    rightsAgreementContractsNavContent += '</div>';

                }

                //show translatorTabs if hidden
                if ($('#translatorTabs').css('display') === 'none' || $('#translatorTabs').css("visibility") === "hidden") {
                    $('#translatorTabs').show();
                }

                $(rightsAgreementContractsNavContent).appendTo('#tnc');

                /* add validation rules for each dynamically genereated Translator_CV */
                $('.Translator_CV').each(function () {
                    $(this).rules("add",
                            {
                                required: true,
                                validFileName: true,
                                minlength: 2,
                                messages: {
                                    validFileName: "Incorect file name - please use only letters, numbers, '.', '-', '_' and space"
                                }
                            });
                });

                /* add validation rules for each dynamically genereated Contract */
                $(".Contract").each(function () {
                    $(this).rules("add",
                            {
                                required: true,
                                validFileName: true,
//                                filesize: 5,
                                minlength: 2,
                                messages: {
                                    validFileName: "Incorect file name - please use only letters, numbers, '.', '-', '_' and space"
                                }
                            });
                    console.log("rightsAgreementContractsNavContent $(this)  ", $(this));
//                    $("#applicationForm").validate($(this));

                });
            }

            /* We need the alert to make user click so the error message can be displayed immediately */
            $(document).on('change', '.file-upload', function () {
                console.log("file-upload  ", $(this));
                var input = $(this),
                        numFiles = input.get(0).files ? input.get(0).files.length : 1,
                        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                console.log("You selected file: ", label);
                console.log("file-upload  ", this.name);
                alert("You selected file: " + label);
            });


            //backToRightsAgreement
            function backToRightsAgreement() {

                $('#addAddRightsHolders').empty(); // empty the div before fetching and adding new data

                console.log("backToRightsAgreement rightsHolderArray  ", rightsHolderArray);

                var upload_number = 2;

                // Get Content
                var rightsAgreementContent = document.getElementById("rightsAgreementContracts").innerHTML;

                // Store Content
                localStorage.setItem("rightsAgreementContent", rightsAgreementContent);
                console.log("backToRightsAgreement localStorage.rightsAgreementContent ", localStorage.rightsAgreementContent.length);
                if (!localStorage.rightsAgreementContent === 0) {
                    console.log("backToRightsAgreement rightsAgreementContent " + rightsAgreementContent);
                    for (i = 0; i < rightsAgreementContent.length; i++) {
                        console.log("backToRightsAgreement rightsAgreementContent " + rightsAgreementContent[i]);
                    }
                }

                /*
                 * fill rightsHolderArray with rightsAgreementItemValue
                 */
                for (var i = 2; i <= counterRightsHolders; i++) {
                    var nr = "rhname" + i;
                    console.log("backToRightsAgreement nr ", nr);
                    var itemRightsAgreement = document.getElementById(nr);
                    rightsAgreementItemValue = itemRightsAgreement.value;
                    console.log("backToRightsAgreement itemValue ", rightsAgreementItemValue);
                    rightsHolderArray.push(rightsAgreementItemValue);
                    console.log("backToRightsAgreement next entry in translatorArray ", rightsAgreementItemValue);
                }


                // Switch off "Add more translators"
                $('#addAdditionalRightsHoldersModalDiv').toggle();

                // Change Title from "Translation rights holder" to "Translation rights holder(s)"
                document.getElementById("rightsHoldersNameLabel").innerHTML = 'Translation rights holder(s)';

                // Disable first Translation rights holder name input element
                document.getElementById("rightsHoldersName0").disabled = 'true';

                /*
                 * remove empty items from array
                 */
                rightsHolderArray = rightsHolderArray.filter(function (e) {
                    return e;
                });

                /*
                 * Display all TranslatorrightsHolder input element each
                 */
                for (var i = 1; i < rightsHolderArray.length; i++) {

                    console.log("backToRightsAgreement rightsHolderArray " + rightsHolderArray[i]);

                    var additionalRightsHoldersTag = '';

                    additionalRightsHoldersTag += '<div class="form-group pull-left has-feedback">';
                    additionalRightsHoldersTag += '<div class="input-group pull-left">';
                    additionalRightsHoldersTag += ' <input id="rightsHoldersName' + i + '"';
                    additionalRightsHoldersTag += ' type="text"  ';
                    additionalRightsHoldersTag += ' class="form-control addRightsHolder"';
                    additionalRightsHoldersTag += ' name="rightsHoldersName' + i + '"';
                    additionalRightsHoldersTag += ' value="' + rightsHolderArray[i] + '"';
                    additionalRightsHoldersTag += ' required="required">';
                    additionalRightsHoldersTag += '</div>';
                    additionalRightsHoldersTag += '</div>';

                    $(additionalRightsHoldersTag).appendTo('#addAddRightsHolders');

                }

                console.log("additionalRightsHoldersTag).appendTo('#addAddRightsHolders' ");

//    $("#applicationForm").validate();

                $('.addRightsHolder').each(function () {

                    $(this).rules("add",
                            {
                                required: true,
                                validname: true,
                                minlength: 2
                            });



                    if (!$("#applicationForm").valid()) {
                        console.log(" Not valid ");
                    }

                    /*
                     * validate the input element 
                     */
                    $("#applicationForm").validate($(this));
                });

                $("#rightsHolderArray").val(rightsHolderArray);

                // back To RightsAgreement tab
//                $('#bs-example-navbar-collapse-2 a[href="#Rights"]').tab('show');
                // back To Translators tab
                $('#bs-example-navbar-collapse-1 a[href="#Translator"]').tab('show');

                // if we have a final list of translators (more than one)
                // we need to clear a possible existing tab first
                generateTranslatorTab(0);
            }


            //backToTranslators
            function backToTranslators() {

                $('#addTransl').empty(); // empty the div before fetching and adding new data

                console.log("backToTranslators translatorArray  ", translatorArray);

                var upload_number = 2;

                // Get Content
                var translatorContent = document.getElementById("torget").innerHTML;

                // Store Content
                if (!localStorage.translatorContent === 0) {
                    //function retrieve(){
                    document.getElementById("torget").innerHTML = localStorage.getItem("translatorContent");
                    console.log("backToTranslators localStorage.translatorContent ", localStorage.translatorContent.length);
                    for (i = 0; i < translatorContent.length; i++) {
                        console.log("restored translatorContent " + translatorContent);
                    }
                }



                for (var i = 2; i <= counterTranslators; i++) {

                    var nr = "tname" + i;
                    console.log("backToTranslators nr ", nr);
                    var translatorItem = document.getElementById(nr);
                    translatorItemValue = translatorItem.value;
                    console.log("backToTranslators itemValue ", translatorItemValue);
                    translatorArray.push(translatorItemValue);
                    console.log("backToTranslators next entry in translatorArray ", translatorItemValue);
                }

                // Switch off "Add more translators"
                $('#addTranslatorModalDiv').toggle();

                // Change Title from "Translator" to "Translators"
                document.getElementById("translatorNameLabel").innerHTML = 'Translators';

                // Disable first Translator input element
//                document.getElementById("translatorName").disabled = 'true';

                /*
                 * remove empty items from array
                 */
                translatorArray = translatorArray.filter(function (e) {
                    return e;
                });

                /*
                 * Display all Translators in input element each
                 */
                for (var i = 1; i < translatorArray.length; i++) {

                    console.log("backToTranslators translatorArray " + translatorArray[i]);

                    var additionalTranslatorTag = '';

                    additionalTranslatorTag += '<div class="form-group pull-left has-feedback">';
                    additionalTranslatorTag += '<div class="input-group pull-left">';
                    additionalTranslatorTag += ' <input id="translatorName' + i + '" ';
                    additionalTranslatorTag += ' type="text"  ';
                    additionalTranslatorTag += ' class="form-control"';
                    additionalTranslatorTag += ' name="translatorName" ';
                    additionalTranslatorTag += ' value="' + translatorArray[i] + '"';
                    additionalTranslatorTag += ' required="required">';
                    additionalTranslatorTag += '</div>';
                    additionalTranslatorTag += '</div>';

                    $(additionalTranslatorTag).appendTo('#addTransl');

                    $("#remove_field").click(function () {
                        alert("remove_field");
                        $("#translatorName" + i).remove();

                    });
                }

                console.log("additionalTranslatorTag).appendTo('#addTransl' ");

//    $("#applicationForm").validate();

                /*
                 * loop through .addTranslators (class in additionalTranslatorTag)
                 */
                $('.addTranslators').each(function () {

                    /*
                     * add the rule to each input element
                     */
                    $(this).rules("add",
                            {
                                required: true,
                                validname: true,
                                minlength: 2
                            });

                    if (!$("#applicationForm").valid()) {
                        console.log(" Not valid ");
                    }

                    /*
                     * validate the input element 
                     */
                    $("#applicationForm").validate($(this));
                });

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

//                    var moreUploadTag = '';
//
//                    moreUploadTag += '<h1> backToMisc moreUploadTag </h1>';
//                    moreUploadTag += '<div class="col-md-8" style="margin-bottom: 20px">';
//                    moreUploadTag += '<label for="label_translator' + upload_number + '" class="control-label pull-left" id="123">Upload a copy of ' + itemValue + '\'s CV: </label>';
//                    moreUploadTag += '<br>';
//                    moreUploadTag += ' <small class="pull-left" style="margin-bottom: 10px">this should include a list of previous published literary translations</small>';
//                    moreUploadTag += '<div class="input-group translatorcv pull-left" style="margin-bottom: 40px;">';
//                    moreUploadTag += '<label class="btn btn-default btn-file pull-left">';
//                    moreUploadTag += 'Select file ';
//                    moreUploadTag += '<input multiple="" name="file" id="translator_cv' + upload_number + '" type="file">';
//                    moreUploadTag += '<span class="glyphicon glyphicon-folder-open"></span>';
//                    moreUploadTag += '</label>';
//                    moreUploadTag += '<input id="label_translator' + upload_number + '" class="pull-left">';
//                    moreUploadTag += '<br>';
//                    moreUploadTag += '<br>';
//                    moreUploadTag += '<input id="translator_cv_upload' + upload_number + '" value="Translator_CV" name="destination" type="hidden">';
//                    moreUploadTag += '</div>';
//                    moreUploadTag += '</div>';
//
//                    $(moreUploadTag).appendTo('#additionalTranslator');

//                    upload_number++;
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



//            $(document).ready(function () {
//                var validator = $("#applicationForm").validate();
//                validator.form();
//            });

            $(document).ready(function () {
                var tcACCEPTED = '${TCACCEPTED}';
                var gdprACCEPTED = '${gdprACCEPTED}';
                console.log("tcACCEPTED " + tcACCEPTED);
                console.log("gdprACCEPTED " + gdprACCEPTED);

                if (tcACCEPTED === '1') {
                    document.getElementById("tcACCEPTED").value = "ticked";
                    console.log("tcACCEPTED ticked");
                } else {
                    document.getElementById("tcACCEPTED").value = "not ticked";
                    console.log("tcACCEPTED not ticked");
                }

                if (gdprACCEPTED === '1') {
                    document.getElementById("gdprACCEPTED").value = "ticked";
                } else {
                    document.getElementById("gdprACCEPTED").value = "not ticked";
                }

                //document.getElementById("tcACCEPTED").value = tcACCEPTED;
                //document.getElementById("gdprACCEPTED").value = gdprACCEPTED;

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

//            $(document).ready(function () {
//                $("input[type=file]").on("change", function (e) {
//                    // $('input[type="file"]').valid();
//                    alert("Url is valid  --  ");
//                    console.log("input[type=file $(this)  " + $(this).val());
//                    console.log("input[type=file e   " + e.target.files[0].name);
//                    if ($(this).valid()) {
//                        alert("Url is valid  --  " + $(this).val());
//                        //            $($(this)).closest('.form-group').addClass('has-success');
//                    } else {
//                        alert("Url is not valid!");
//                        //            $($(this)).closest('.form-group').addClass('has-error');
//                    }
//                });
//            });
//            $(document).ready(function () {
//                $('input[type="file"]').on("change", function (e) {
//                    // $('input[type="file"]').valid();
//                    alert("Url is valid  --  ");
//                    console.log("input[type=file $(this)  " + $(this).val());
//                    console.log("input[type=file e   " + e.target.files[0].name);
//                    if ($(this).valid()) {
//                        alert("Url is valid  --  " + $(this).val());
//                        //            $($(this)).closest('.form-group').addClass('has-success');
//                    } else {
//                        alert("Url is not valid!");
//                        //            $($(this)).closest('.form-group').addClass('has-error');
//                    }
//                });
//            });
//
//            $(document).ready(function () {
//                $('input[type="file"]').select(function () {
//                    alert("A file has been selected.");
//                });
//            });

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

            $(window).bind("beforeunload", function () {
                var username = document.getElementById("username1").value;
//                alert("username 2 " + username);
                $.ajax({
                    async: false, //This will make sure the browser waits until request completes
                    url: "./Logout",
                    type: 'post',
                    cache: false,
                    data: {"username": username}
                });
            });

            $(document).ready(function () {
                var username = document.getElementById("username1").value;
                console.log("username newApplication ", username);
                document.getElementById("username3").value = username;
            });

        </script>


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
                        <form action="${pageContext.request.contextPath}/Logout" method="GET">
                            <h6> <small>Welcome <strong>${name}</strong> - <strong>not ${name}</strong>? 
                                    <button type="submit" name="username" id="username" value="${username}" class="btn-link">Click here to log out </button></small></h6>
                            <input type="hidden" name="username" id="username1" value="${username}">
                        </form>
                    </div>
                </div> <!--container for welcome/logout-->

                <h1 style="align-content: center">Translation Grant Application System for Literature Ireland</h1>

                <div class="container-fluid" style="margin-bottom: 20px"></div> 

                <nav class="navbar navbar-default" >
                    <div class="container-fluid"  style="background-color: #d9d1d1">
                        <!-- Brand and toggle get grouped for better mobile display -->


                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="myTab" style="background-color: #d9d1d1">
                            <ul class="nav navbar-nav nav-tabs two-lines">
                                <li class="active"><a href="#Contact" data-toggle="tab">Contact Details</a></li>
                                <li><a href="#Books" data-toggle="tab">Book<br/> Details</a></li>
                                <li><a href="#Publication" data-toggle="tab">Publication<br/>  Details</a></li>
                                <li><a href="#Translator" data-toggle="tab">Translator <br/> Details</a></li>
                                <li><a href="#RightsAgreement" data-toggle="tab">Rights  <br/>Agreement</a></li>
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
                            action="${pageContext.request.contextPath}/GrantApplicationServlet" 
                            enctype="multipart/form-data"> 

                            <div id="my-tab-content" class="tab-content tab-validate"  style="background-color: #E8F6FF">


                                <input type="hidden" name="tcACCEPTED" id="tcACCEPTED">
                                <input type="hidden" name="gdprACCEPTED" id="gdprACCEPTED">
                                <input type="hidden" name="name" value ="${name}">
                                <input type="hidden" name="userID" value ="${userID}">
                                <input type="hidden" name="publisherID" value ="${publisherID}">
                                <input type="hidden" name="publisherName" value="${companyDetails.Company}">

                                <input type="hidden" name="username" id="username2" value="${username}">

                                <!--////////////////////////////////////////////////////////////////////////////
                                ///
                                ///  For Publisher Contact details Update
                                ///
                                ////////////////////////////////////////////////////////////////////////////-->

                                <!-- Contact details -->
                                <div class="tab-pane active" id="Contact">

                                    <!--wrapper for Contact tab pane-->
                                    <div class="container" id="top">

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
                                                <div class="form-group">
                                                    <label for="Address1" class="control-label pull-left">Address1</label>
                                                    <input id="Address1"
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="Address1"                                
                                                           value="${companyDetails.Address1}"                                
                                                           placeholder="Address1"
                                                           >
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label class="control-label pull-left">Post code</label>
                                                    <input id="postCode"                                
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="postCode"                                
                                                           value="${companyDetails.postCode}"                                
                                                           placeholder="Post Code"
                                                           >
                                                </div>
                                            </div>

                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label class="control-label pull-left">City</label>
                                                    <input id="City"                                
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="City"                                
                                                           value="${companyDetails.City}"                                
                                                           placeholder="City"
                                                           >
                                                </div>
                                            </div>

                                        </div> <!--row-->

                                        <!--third row-->
                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="control-label pull-left">Address2</label>
                                                    <input id="Address2"                                
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="Address2"                                
                                                           value="${companyDetails.Address2}"                                
                                                           placeholder="Address2"
                                                           >
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="control-label pull-left">Country</label>
                                                    <input id="country"                                
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="Country"                                
                                                           value="${companyDetails.Country}"                                
                                                           placeholder="Country"
                                                           >
                                                </div>
                                            </div>

                                        </div> <!--row-->

                                        <!--fourth row-->
                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-sm-4">
                                                <label class="control-label pull-left">Address3</label>
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
                                                <div class="form-group">
                                                    <label for="Telephone" class="control-label pull-left">Telephone</label>
                                                    <input id="Telephone"                                
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="Telephone"                                
                                                           value="${companyDetails.Telephone}"  
                                                           required
                                                           >
                                                </div>
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
                                                <div class="form-group">
                                                    <label for="Email" class="pull-left">Email</label>
                                                    <input id="Email"                                
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="Email"                                
                                                           value="${companyDetails.Email}"                                
                                                           placeholder="Main Email"
                                                           required
                                                           >
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="WWW" class="pull-left">Website</label>
                                                    <input id="WWW"                                
                                                           type="url"                                
                                                           class="form-control"                                
                                                           name="WWW"                  
                                                           pattern="(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&=]*)"
                                                           value="${companyDetails.WWW}"                                
                                                           placeholder="Web Address"
                                                           onblur="validateURL();"
                                                           required
                                                           >
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
                                        <!--keep in one line otherwise placeholder doesn't show-->
                                        <label class="pull-left">Additional contact information (where applicable)</label>
                                        <textarea id="companyNotes"  class="form-control" style="width: 870px; height: 343px;" name="companyNotes" placeholder="enter optional notes"> <c:out value="${companyDetails.Notes}" /></textarea>
                                    </div> <!--container-->
                                </div> <!--tab contact-->

                                <!--////////////////////////////////////////////////////////////////////////////
                                    ///
                                    ///  For Book details
                                    ///
                                    ////////////////////////////////////////////////////////////////////////////-->

                                <!-- Book Details -->
                                <div class="tab-pane fade" id="Books">
                                    <p class="header1">
                                        Book Details
                                    </p>
                                    <div class="container-fluid">

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-sm-4">    
                                                <div class="form-group has-feedback">
                                                    <label for="aFirstName" class="control-label pull-left required-field">Author&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2510;</label>                                                  
                                                    <div class="input-group pull-left">
                                                        <input id="aFirstName"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="AuthorFirstName"                                
                                                               value=""    
                                                               required
                                                               placeholder="Author First Name"
                                                               >                                                              
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">    
                                                <div class="form-group has-feedback">
                                                    <div class="input-group pull-left">
                                                        <label for="aLastName" class="control-label pull-left">&nbsp;</label>
                                                        <input id="aLastName"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="AuthorLastName"                                
                                                               value=""    
                                                               required
                                                               onblur="copyFirstRow2();"
                                                               placeholder="Author Last Name"
                                                               >                                                                
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-4" style="margin-top: 30px; ">  
                                                <a href="#" class="btn btn-group-sm btn-default pull-left" 
                                                   data-toggle="modal" 
                                                   data-target="#addAuthorModal"
                                                   onclick="copyFirstRow2();"
                                                   >Add more authors</a>
                                                <label  class="control-label pull-left">&nbsp;<i class="glyphicon glyphicon-info-sign my-tooltip" title="''Please note that the names of additional authors are not displayed but are saved to the system.'"></i></label>
                                            </div>

                                        </div> <!--row-->


                                        <input type="hidden" id="author_array" name="authorArray" >

                                        <!--Second row-->
                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-sm-4">  
                                                <div class="form-group has-feedback"> 
                                                    <div class="input-group pull-left">
                                                        <label for="title" class="control-label pull-left required-field">Title</label> 
                                                        <input id="title"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="title"                                
                                                               value=""    
                                                               required
                                                               placeholder="Title"
                                                               >
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">  
                                                <div class="form-group has-feedback">  
                                                    <div class="input-group pull-left">
                                                        <label for="appForeignPublisher" class="control-label pull-left required-field">Publisher (of the original work)</label>                                                           
                                                        <input id="appForeignPublisher"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="appForeignPublisher"                                
                                                               value=""    
                                                               required
                                                               placeholder="Publisher of original work"
                                                               >                                                     
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-3">  
                                                <div class="form-group has-feedback">  
                                                    <div class="input-group pull-left">
                                                        <label for="publicationYear" class="control-label pull-left required-field">Publication year</label>
                                                        <input id="publicationYear"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="publicationYear"                                
                                                               value=""    
                                                               required
                                                               placeholder="Publication Year"
                                                               >
                                                    </div>
                                                </div>
                                            </div>

                                        </div> <!--row-->


                                        <!--Third row-->

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-sm-4">    
                                                <div class="form-group has-feedback">
                                                    <div class="input-group pull-left">
                                                        <label for="genre" class="control-label pull-left required-field">Genre</label>
                                                        <input id="genre"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="genre"                                
                                                               value=""    
                                                               required
                                                               placeholder="Genre"
                                                               >
                                                        <i class="glyphicon glyphicon-search form-control-feedback" style="margin-right: 20px"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">    
                                                <div class="form-group has-feedback">
                                                    <div class="input-group pull-left">
                                                        <label for="anthologyAuthor" class="control-label pull-left required-field">Anthology Author</label>
                                                        <input id="anthologyAuthor"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="anthologyAuthor"                                
                                                               value=""    
                                                               required
                                                               placeholder="Anthology Author"
                                                               >
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">    
                                                <div class="form-group has-feedback">
                                                    <div class="input-group pull-left">
                                                        <label for="anthologyTitle" class="control-label pull-left required-field">Anthology Title</label>
                                                        <input id="anthologyTitle"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="anthologyTitle"                                
                                                               value=""    
                                                               required
                                                               placeholder="Anthology Title"
                                                               >
                                                    </div>
                                                </div>
                                            </div>
                                        </div> <!--row-->


                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-xs-4">
                                                <div class="form-group has-feedback">
                                                    <label for="appLanguageOriginal" class="control-label  pull-left required-field">Language (of the original)</label>
                                                    <div class="input-group pull-left">                                                    
                                                        <div class="input-group pull-left">
                                                            <span class="input-group-addon">  
                                                                <span class="fa fa-language  fa-1x"></span>                                                            
                                                            </span>
                                                            <input id="appLanguageOriginal"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="appLanguageOriginal"                                
                                                                   value=""    
                                                                   required
                                                                   placeholder="Language"
                                                                   >      
                                                            <i class="glyphicon glyphicon-search form-control-feedback" style="margin-right: 20px"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> <!--col-xs-4-->

                                            <div class="col-xs-4">
                                                <div class="form-group has-feedback">
                                                    <label for="countryOfPublication" class="control-label pull-left required-field" >Country of publication</label>
                                                    <div class="input-group pull-left">                                                        
                                                        <div class="input-group pull-left">
                                                            <span class="input-group-addon">  
                                                                <span class="glyphicon glyphicon-globe fa-1x"></span>                                                            
                                                            </span>
                                                            <input id="countryOfPublication"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="countryOfPublication"                                
                                                                   value=""    
                                                                   required
                                                                   placeholder="Country of Publication"
                                                                   >
                                                            <i class="glyphicon glyphicon-search form-control-feedback" style="margin-right: 15px"></i>
                                                        </div>   
                                                    </div>   
                                                </div>   
                                            </div> <!--col-xs-4-->   

                                        </div> <!--row-->

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-xs-4">                                                
                                                <div class="form-group has-feedback">  
                                                    <div class="input-group pull-left">
                                                        <label for="series" class="control-label pull-left"> Series</label>
                                                        <input id="series"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="series"                                
                                                               value=""    
                                                               placeholder="Series"
                                                               >
                                                    </div>
                                                </div>
                                            </div> <!--col-xs-6-->

                                            <div class="col-xs-4">           
                                                <div class="form-group has-feedback">  
                                                    <label for="originalPageExtent" class="control-label pull-left required-field">Page extent (of the original) </label>                                                                                             
                                                    <div class="input-group pull-left">
                                                        <div class="input-group pull-left">      
                                                            <span class="input-group-addon">  
                                                                <span class="glyphicon glyphicon-book"></span>                                                            
                                                            </span>
                                                            <input type="text" 
                                                                   name="originalPageExtent" 
                                                                   id="originalPageExtent" 
                                                                   class="form-control" 
                                                                   required
                                                                   placeholder="number of pages" 
                                                                   >                                               
                                                        </div>
                                                    </div>                                    
                                                </div>
                                            </div>

                                        </div> <!--row-->

                                        <!--Eigth row-->

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-sm-4">   

                                                <label for="bookNotes" class="control-label pull-left">Notes</label>
                                                <div class="form-group">
                                                    <!--keep in one line otherwise placeholder doesn't show-->
                                                    <textarea class="form-control" id="bookNotes" name="bookNotes" style="width: 800px; height: 215px" placeholder="Notes"></textarea>
                                                </div>

                                            </div> <!-- col-sm-4  -->

                                        </div> <!-- row  -->
                                        <label  class="control-label pull-left required-field">Required fields</label>                                                                        
                                    </div>  <!-- container-fluid  -->
                                </div> <!-- class="tab-pane" id="books" -->

                                <!-- Publication Details -->
                                <div class="tab-pane" id="Publication">

                                    <p class="header1" style="margin-bottom: 40px">
                                        Publication Details
                                    </p>

                                    <div class="container-fluid">


                                        <div class="row" style="margin-bottom: 40px">

                                            <div class='col-sm-4'>
                                                <div class="form-group has-feedback">
                                                    <label for="proposedDateOfPublication" class="control-label pull-left required-field">Proposed date of publication</label>
                                                    <div class="input-group">
                                                        <input type="text" 
                                                               name="proposedDateOfPublication" 
                                                               id="proposedDateOfPublication" 
                                                               class="form-control" 
                                                               required
                                                               placeholder="DD/MM/YYYY" 
                                                               >    
                                                        <label class="input-group-addon" for="proposedDateOfPublication">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </label>
                                                    </div>
                                                </div>    
                                                <script>
                                                    $("#proposedDateOfPublication").datepicker().on('change', function () {
                                                        $(this).valid();  // triggers the validation test
                                                        // '$(this)' refers to '$("#datepicker")'
                                                    });
                                                </script>
                                            </div>   

                                        </div> <!-- row  -->

                                        <div class="row" style="margin-bottom: 40px;">

                                            <div class='col-sm-5 form-inline'>        
                                                <div class="form-group has-feedback">
                                                    <label for="plannedPageExtent" class="control-label pull-left required-field">Planned page extent (published translation) </label>
                                                    <div class="input-group pull-left">
                                                        <span class="input-group-addon">  
                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                        </span>
                                                        <input type="text" 
                                                               name="plannedPageExtent" 
                                                               id="plannedPageExtent" 
                                                               class="form-control" 
                                                               required
                                                               placeholder="number of pages" 
                                                               >
                                                    </div>
                                                </div>
                                            </div>
                                            <script>
                                                $("#DateOfPublicationOriginal").datepicker().on('change', function () {
                                                    $(this).valid();  // triggers the validation test
                                                    // '$(this)' refers to '$("#datepicker")'
                                                });
                                            </script>

                                            <div class='col-sm-4 form-inline'>        
                                                <div class="form-group has-feedback">
                                                    <label for="appproposedPrintRun" class="control-label pull-left required-field">Proposed print run
                                                    </label>
                                                    <div class="input-group pull-left">
                                                        <span class="input-group-addon">  
                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                        </span>
                                                        <input type="text" 
                                                               name="appproposedPrintRun" 
                                                               id="appproposedPrintRun" 
                                                               class="form-control" 
                                                               required
                                                               placeholder="number of copies" 
                                                               >
                                                    </div>
                                                </div>
                                            </div>

                                        </div> <!-- row  -->


                                        <div class="row" style="margin-bottom: 40px;">
                                            <div class="col-sm-5">    
                                                <div class="form-group has-feedback">
                                                    <div class="input-group pull-left">
                                                        <label for="translationTitle" class="control-label pull-left required-field">Translation title</label>
                                                        <input id="translationTitle"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="translationTitle"                                
                                                               value=""    
                                                               required
                                                               placeholder="Translation Title"
                                                               >
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="col-sm-4">  
                                                <div class="form-group has-feedback"> 
                                                    <label for="appTargetLanguage" class="control-label required-field"> Target language(s)</label>
                                                    <div class="input-group pull-left">
                                                        <span class="input-group-addon">  
                                                            <i class="fa fa-language  fa-1x"></i>                                                            
                                                        </span>
                                                        <input id="appTargetLanguage"                                
                                                               type="text"                                
                                                               class="form-control"   
                                                               required
                                                               name="appTargetLanguage"                                
                                                               >
                                                        <i class="glyphicon glyphicon-search form-control-feedback" style="margin-right: 20px"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <input type="hidden" id="language_Array" name="languageArray" >

                                            <div class="col-sm-3">  
                                                <div class="form-group has-feedback">
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
                                            </div>
                                        </div> <!--row-->   
                                        <label  class="control-label pull-left required-field">Required fields</label>  
                                    </div> <!-- container-fluid  -->
                                </div> <!-- class="tab-pane" id="Publication" -->

                                <!-- Translator's Details -->
                                <div class="tab-pane" id="Translator"> 
                                    <p class="header1" style="margin-bottom: 5px">
                                        Translator Details
                                    </p>

                                    <div class="container-fluid" id="torget">

                                        <div class="row" style="margin-bottom: 40px">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="col-md-3">                                              
                                                        <div class="form-group has-feedback"> 
                                                            <label for="translatorFee" class="control-label pull-left required-field">Translator(s)'s fee</label>          
                                                            <label  class="control-label pull-left">&nbsp;<i class="glyphicon glyphicon-info-sign my-tooltip" title="Enter the amount paid to the translator."></i></label>                                                                    
                                                            <div class="input-group pull-left">
                                                                <div class="input-group pull-left">     
                                                                    <span class="input-group-addon">
                                                                        <span class="glyphicon glyphicon-euro"></span>                                     
                                                                    </span>
                                                                    <input type="text" 
                                                                           class="form-control" 
                                                                           name="translatorFee" 
                                                                           id="translatorFee" 
                                                                           placeholder="fee"
                                                                           >    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-5"> 
                                                        <div class="form-group has-feedback"> 
                                                            <label for="BreakDownOfTranslatorFee" class="control-label pull-left required-field">Break-down of translator(s)'s fee</label>  
                                                            <label  class="control-label pull-left">&nbsp;<i class="glyphicon glyphicon-info-sign my-tooltip" title="Here you enter how the amount paid to the translator is calculated."></i></label>
                                                            <div class="input-group">
                                                                <!--keep in one line otherwise placeholder doesn't show-->
                                                                <textarea class="form-control" placeholder="Break-down of translator fee" name="BreakDownOfTranslatorFee" id='BreakDownOfTranslatorFee' style="width: 280px; height: 196px;"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>  <!--panel--body-->
                                            </div> <!--panel-default-->
                                        </div> <!-- row -->

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="panel panel-default">
                                                <div class="panel-body">

                                                    <div class="col-sm-4"> 

                                                        <div class="form-group  has-feedback">
                                                            <div class="input-group pull-left">  
                                                                <label class="control-label pull-left required-field" id="translatorNameLabel">Translator</label>                                                             
                                                                <input id="translatorName"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="translatorName"                                
                                                                       value=""    
                                                                       required="required"
                                                                       placeholder="Translator Name"
                                                                       >
                                                            </div>
                                                        </div>

                                                        <div id="addTransl"></div>

                                                    </div>

                                                    <div class="col-sm-4"> 
                                                        <button type="button"                   
                                                                id="uploadDocuments"
                                                                class="btn btn-success"
                                                                title="upload documents"
                                                                style="margin-top: 20px;display:none;"
                                                                name="uploadDocuments"
                                                                onclick="myFunction();"
                                                                >                                                               
                                                            <span class="glyphicon glyphicon-import"></span>
                                                        </button>           
                                                    </div>

                                                    <div class="col-sm-4">
                                                        <label for="addTranslatorModala" class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        <button type="button"                   
                                                                id="addTranslatorModala"
                                                                class="btn btn-success"
                                                                data-toggle="modal" 
                                                                data-target="#addTranslatorModal"
                                                                title="Add more translators"
                                                                style="margin-top: 25px;"
                                                                name="addTranslatorModala"
                                                                onclick="copyFirstTranslatorName();"
                                                                >Add more translators                                                             
                                                            <span class="glyphicon glyphicon-import"></span>
                                                        </button>           
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
                                        <label  class="control-label pull-left required-field">Required fields</label>  
                                    </div> <!-- container-fluid  -->
                                </div> <!-- class="tab-pane" id="Translator" -->

                                <!-- Rights Agreement -->
                                <div class="tab-pane" id="RightsAgreement">
                                    <p class="header1" style="margin-bottom: 40px">
                                        Rights Agreement
                                    </p>

                                    <div class="container-fluid"  id="rightsAgreementContracts">

                                        <div class="row" style="margin-bottom: 10px;">

                                            <div class="col-md-10">
                                                <div class="form-group has-feedback">
                                                    <!--<i class="glyphicon glyphicon-info-sign my-tooltip" title="'For multiple rights contracts, please upload all contracts as one file"></i>--> 
                                                    <!--<label for="agreement1" class="control-label pull-left">Upload a copy of the agreement with the translation rights holder</label>-->
                                                    <label for="agreement1" class="control-label pull-left">Upload a copy of the agreement with the translation rights holder(s) <i class="glyphicon glyphicon-info-sign my-tooltip" title="'For multiple rights contracts, please upload all contracts as one file"></i></label>
                                                    <div class="input-group pull-left">
                                                        <label class="input-group-addon btn btn-default btn-file">
                                                            <input type="file"  
                                                                   id="agreement1" 
                                                                   name="Agreement-1"                                                                       
                                                                   onchange="generatedLabels();"
                                                                   >
                                                            Select file 
                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                        </label> 
                                                        <input id="label_agreement1" class="pull-left" value=""/>  
                                                    </div>  
                                                    <input type="hidden" value="Agreement" name="destination" id="agreement_upload1"/>
                                                </div>                                                                
                                                <label for="Agreement-1" class="validation_error_message help-block"></label>                                                         
                                            </div> 

                                        </div> <!-- row  -->

                                        <!--Name of translation rights holder-->
                                        <div class="row" style="margin-bottom: 10px;"> 

                                            <div class="col-sm-4">      
                                                <div class="form-group has-feedback">
                                                    <div class="input-group pull-left has-feedback">  
                                                        <label for="rightsHoldersName0" class="control-label pull-left" id="rightsHoldersNameLabel">Translation rights holder</label>
                                                        <input id="rightsHoldersName0"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="rightsHoldersName0"                                
                                                               value=""  
                                                               onblur="copyFirstRightsHolderName();"
                                                               placeholder="Translation rights holder"
                                                               >
                                                    </div>
                                                </div>
                                                <div id="addAddRightsHolders"></div>
                                            </div>


                                            <div class="col-sm-4" style="margin-top: 30px; visibility: block;display:none" id="addAdditionalRightsHoldersModalDiv">  
                                                <a href="#" class="btn btn-group-sm btn-default pull-left" 
                                                   data-toggle="modal" 
                                                   data-target="#addAdditionalRightsHoldersModal"
                                                   onclick="copyFirstRightsHolderName();"
                                                   >Add more Translation rights holders</a>
                                            </div>

                                        </div> <!-- row  -->

                                        <div class="row" style="margin-bottom: 10px;">

                                            <!--Upload form for addendum to the rights agreement-->
                                            <div class="col-md-10">
                                                <div class="form-group has-feedback">
                                                    <label for="addendum1" class="control-label pull-left">Upload a copy of the addendum to the rights agreement</label>
                                                    <div class="input-group pull-left">
                                                        <label class="input-group-addon btn btn-default btn-file">
                                                            <input type="file"  
                                                                   id="addendum1" 
                                                                   name="Addendum-1"      
                                                                   class="form-control"
                                                                   onchange="generatedLabels();"
                                                                   >
                                                            Select file 
                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                        </label> 
                                                        <input id="label_addendum1" class="pull-left" value=""/>      
                                                    </div> 
                                                    <input type="hidden" value="Addendum" name="destination" id="addendum_upload1" class="destination"/>
                                                </div>  
                                                <label for="Addendum-1" class="validation_error_message help-block"></label>                                         
                                            </div> 

                                        </div> <!-- row  -->

                                        <!--                                        </div> tab-content-->
                                    </div> <!-- container-fluid  -->
                                </div> <!-- class="tab-pane" id="Rights" -->             

                                <!-- Original Work & Sample Translation -->
                                <div class="tab-pane" id="Original">
                                    <p class="header1" style="margin-bottom: 40px">
                                        Original Work & Sample Translation
                                    </p>
                                    <div class="container-fluid">

                                        <div class="row" >
                                            <div class="panel panel-default">        
                                                <div class="panel-body">

                                                    <div class="row" style="margin-bottom: 10px">

                                                        <div class="col-md-8">
                                                            <div class="form-group has-feedback">
                                                                <label for="originalSample" class="control-label pull-left required-field">Upload electronic copy of original work</label>
                                                                <div class="input-group originalSample pull-left">                                                                         
                                                                    <label class="input-group-addon btn btn-default btn-file">
                                                                        Select file 
                                                                        <input type="file"  
                                                                               name="Original" 
                                                                               id="originalSample" 
                                                                               onchange="generatedLabels();"
                                                                               required
                                                                               class="form-input">
                                                                        <span class="glyphicon glyphicon-folder-open"></span>
                                                                    </label>
                                                                    <input id="label_originalSample" class="pull-left">   

                                                                    <!--<input type="text" name="userID" value="${userID}">-->
                                                                    <input type="hidden" name="publisherID" value="${publisherID}">
                                                                    <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                                    <!--Destination:-->

                                                                </div>
                                                                <input type="hidden" id="originalSample_upload" value="originalSample" name="destination" />                           
                                                            </div>
                                                            <label for="Original" class="validation_error_message help-block"></label>      
                                                        </div>

                                                    </div> <!--row-->

                                                    <div class="row">

                                                        <div class="col-md-8">
                                                            <div class="form-group has-feedback">
                                                                <label for="translationSample" class="control-label pull-left required-field">Upload copy of translation sample<sup>**</sup><br/> (10 to 12 pages of prose or six poems)</label>
                                                                <div class="input-group translationSample pull-left" >
                                                                    <label class="input-group-addon btn btn-default btn-file">
                                                                        Select file 
                                                                        <input type="file"  
                                                                               name="TranslationSample" 
                                                                               id="translationSample" 
                                                                               required
                                                                               class="form-control"
                                                                               >
                                                                        <span class="glyphicon glyphicon-folder-open"></span>
                                                                    </label>
                                                                    <input id="label_translationSample" class="pull-left"/>

<!--                                                                    <input type="text" name="userID" value="${userID}">-->
                                                                    <input type="hidden" name="publisherID" value="${publisherID}">
                                                                    <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                                    <!--Destination:-->
                                                                    <input type="hidden" id="translationSample_upload" value="translationSample" name="destination" />                                          
                                                                </div>
                                                                <label for="TranslationSample" class="validation_error_message help-block"></label>  
                                                            </div>
                                                        </div> <!-- col-md-8 -->

                                                    </div> <!--row-->                                                            

                                                    <!-- translationSampleForm -->                                                                                                              
                                                    <!--</div>   col-md-12 -->
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
                                                                    <!--name="Start New Application"-->

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
                                            <i class="pull-left"><strong>**</strong> If more than one translator is involved, a translation sample must be submitted for each translator.</i>
                                        </div> 

                                        <div class="col-md-10">
                                            <label  class="control-label pull-left required-field">Required fields</label>  
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

                                            <h3> Original Work & Sample Translation</h3>
                                            <ul class="dashed">
                                                <!--<li>One copy of the original work* </li>-->
                                                <li>A translation sample** consisting of 10 to 12 pages of prose or six poems</li>
                                            </ul>

                                            <br/>
                                            <!--                                            <p> <i> * &nbsp; Please contact Literature Ireland if a hard copy of the original work cannot be obtained.<br/>
                                                                                                ** If more than one translator is involved, a translation sample must be submitted for each translator.
                                                                                            </i> </p>-->
                                            <p> <i>
                                                    ** If more than one translator is involved, a translation sample must be submitted for each translator.
                                                </i> </p>
                                            All queries in relation to the Translation Grant Programme should be sent to info@literatureireland.com.
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
                                                <div class="container-fluid">
                                                    <ol>
                                                        <li>
                                                            <p>There
                                                                are three translation grant rounds per year. The <b> deadlines
                                                                    for submission of applications</b>
                                                                are available on the Literature Ireland website at
                                                                <u><a href="http://www.literatureireland.com/programmes/translation-grant-programme/">http://www.literatureireland.com/programmes/translation-grant-programme/</a></u>.
                                                                A translation grant round is considered to consist of a period of
                                                                two months from the date of the deadline.
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p>
                                                        <br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="2">
                                                        <li>
                                                            <p><b>Applications can be submitted from two weeks prior to the deadline.</b>
                                                                Applications submitted after the deadline may not be accepted or may
                                                                be postponed to the next round.
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="3">
                                                        <li>
                                                            <p><b>Late
                                                                    applications or applications for consideration outside the usual
                                                                    round</b> may, in rare
                                                                cases, be accepted at the discretion of Literature Ireland.
                                                                Applicants in these cases should contact 
                                                                <u><a href="mailto:info@literatureireland.com">
                                                                        info@literatureireland.com</a></u>
                                                                before submitting an application. Applicants are also advised that
                                                                late submission will affect the timeliness with which they can be
                                                                informed of the outcome of the application.
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="4">
                                                        <li>
                                                            <p>It
                                                                is recommended that the <b>translation
                                                                    sample</b> submitted
                                                                with the application be a final or near-final version which has been
                                                                <b>proofread and
                                                                    edited</b>. If the
                                                                sample submitted is an early or unedited draft, the applicant is
                                                                requested to inform Literature Ireland of this fact. There is a
                                                                ‘Notes’ field in the ‘Book Details’ tab of the application
                                                                system which may be used for this purpose. 
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="5">
                                                        <li>
                                                            <p>Literature
                                                                Ireland reserves the right to have <b>translation
                                                                    samples submitted assessed for quality by an independent expert</b>,
                                                                who will write a report that will be presented to the board of
                                                                directors when it considers the request for funding (see note 7).
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="6">
                                                        <li>
                                                            <p>Literature
                                                                Ireland maintains records of the average/typical rates paid to
                                                                literary translators in different countries. If the rate being paid
                                                                to the translator is substantially different from that which might
                                                                be usual, the application is requested to include an explanation for
                                                                this in his/her application.
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p>
                                                        <br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="7">
                                                        <li>
                                                            <p>All
                                                                applications in a given round will be considered by the board of
                                                                Literature Ireland at a <b>meeting
                                                                    held six to eight weeks after the deadline</b>.
                                                                Applications for <b>translations
                                                                    due for printing or publication before this meeting takes place will
                                                                    be deemed ineligible</b>.	
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="8">
                                                        <li>
                                                            <p><b>Applicants will be informed of the outcome of the application within 10 days of the board meeting.</b>.
                                                                Successful applicants will be issued with formal contracts and a letter of award within six weeks of approval. Each grant contract is valid for a term of twelve (12) months. 
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="9">
                                                        <li>
                                                            <p><b>All decisions of the board of Literature Ireland are final</b>.	
                                                            </p>
                                                        </li>
                                                    </ol>
                                                </div>
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
                      action="${pageContext.request.contextPath}/Application" 
                      method="POST" 
                      name="regF"
                      >
<!--                    <input type="hidden" name="userID" value="${userID}">-->
                    <input type="hidden" name="name" value="${name}">
                    <input type="hidden" name="publisherID" value="${publisherID}">
                    <input type="hidden" name="Company" value="${companyDetails.Company}">
                    <input type="hidden" name="publisherName" value="${companyDetails.Company}">
                    <input type="hidden" name="username" id="username3" value="${username}">
                    <div class="container col-sm-12" style="margin-bottom: 40px">
                        <input type="submit" id="NewApplication" name="New Application"  class = "btn btn-default btn-sm active" value="New Application" />
                        <input type="submit" id="ListOpenApplications" name="List Open Applications"  class = "btn btn-default btn-sm" value="List Open Applications" />
                        <input type="submit" id="ListPendingApplications" name="List Pending Applications"  class = "btn btn-default btn-sm" value="List Pending Applications" />
                        <input type="submit" id="ListClosedApplications" name="List Closed Applications"  class = "btn btn-default btn-sm" value="List Closed Applications" />


                        <div class="scroll-top-wrapper ">
                            <span class="scroll-top-inner">
                                <i class="fa fa-3x fa-arrow-circle-up"></i>
                            </span>
                        </div>
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

                    <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
                        &copy; 2017-2020 mgr Software
                    </div>

                </div><!-- end of Base div -->

            </div><!-- end of container div -->

            <div class="shadowbase"> </div>

        </div><!-- end of Shadowholder container div -->

        <script src="js/bootstrap-imageupload.js"></script>

        <script>
                                                var $imageupload = $('.imageupload');
                                                $imageupload.imageupload();

                                                function pressCuttingsModal() {
                                                    $("#pressCuttingsModal").modal("show");
                                                }

                                                var pressCuttingsUpload = $('.pressCuttingsUpload');
                                                pressCuttingsUpload.imageupload();

                                                function  showInfoModal() {
                                                    $("#showInfoModal").modal("show");
                                                }
                                                function  showNotesModal() {
                                                    $("#showNotesModal").modal("show");
                                                }
        </script> 
    </body>
</html>
