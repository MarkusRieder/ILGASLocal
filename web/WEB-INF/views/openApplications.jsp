<%-- 
    Document   : openApplications
    Created on : 07-Ma7-2017, 23:27:58
    Author     : markus
--%>

<%@ page import="java.io.*,java.io.*,org.apache.poi.hwpf.HWPFDocument,org.apache.poi.hwpf.extractor.WordExtractor" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html style="height: 100%" >
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Translation Grant Application System</title>
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 
        <!--
           https://www.javaworld.com/article/2072937/java-web-development/solving-the-logout-problem-properly-and-elegantly.html?page=2
           Solving the logout problem properly and elegantly
        -->

        <%
//            response.setHeader("Cache-Control", "no-cache"); //forces caches to obtain a new copy of the page from the origin server
//            response.setHeader("Cache-Control", "no-store"); //directs caches not to store the page under any circumstance
//            response.setDateHeader("Expires", 0); //causes the proxy cache to see the page as "stale"
//            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

//            String userName = (String) session.getAttribute("username");
//            if (null == userName) {
//                System.out.println("userName: " + userName + " not found");
//                request.setAttribute("Error", "Session has ended.  Please login.");
//                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
//                rd.forward(request, response);
//            }
        %>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->

        <!-- Bootstrap -->


        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="css/irishLiterature.css">



        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.dataTables.js"></script>
        <script src="js/dataTables.bootstrap.js"></script>
        <script src="js/dataTables.responsive.min.js"></script>
        <script src="js/dataTables.bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script>

        <script type="text/javascript"  src="js/pdf.js"></script>
        <script type="text/javascript"  src="js/pdf.worker.js"></script>
        <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
        <script src="js/xregexp-all.js"></script>     
        <script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.3.6/require.min.js"></script>

        <script src="js/validateFileName.js"></script>

        <script>
            var translatorArray = [];
            var translators = [];
            var authorArray = [];
            var languageArray = [];
            var pressCuttingArray = [];
            var rightsHolderArray = [];
            var translatorNamesForGenerateTranslatorTab = [];
            var Name = "";
            var Author = "";
            var counter = 0;
            var translationrightsholdercounter = 0;
            var Authorcounter = 0;
            var pressCuttingCounter = 0;
            var translatorCounter = 0;
            var translatorCounter1 = 0;
            var translatorName876 = "";
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
            PDFJS.workerSrc = 'js/pdf.worker.js';
            //localStorage.clear();

            var i;

            console.log("local storage - openApplication.jsp");
            for (i = 0; i < localStorage.length; i++) {
                console.log(localStorage.key(i) + "=[" + localStorage.getItem(localStorage.key(i)) + "]");
            }

            console.log("session storage");
            for (i = 0; i < sessionStorage.length; i++) {
                console.log(sessionStorage.key(i) + "=[" + sessionStorage.getItem(sessionStorage.key(i)) + "]");
            }
        </script>      

        <script type="text/javascript">
            var cntr = 0;
            var publisherID = '${publisherID}';
            var newURL = "./openApplicationPublisherDataServlet?publisherID=" + publisherID;
            console.log("13131 publisherID  " + publisherID);
            console.log("13131 newURL  " + newURL);
            $(document).ready(function () {
                var table = $("#applications").DataTable({
                    stateSave: true,
                    autoWidth: false,
                    initComplete: function () {
                        this.api().columns('.select-filter').every(function () {
                            var column = this;
                            var select = $('<select><option value=""></option></select>')
                                    .appendTo($(column.footer()).empty())
                                    .on('change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex(
                                                $(this).val()
                                                );
                                        column
                                                .search(val ? '^' + val + '$' : '', true, false)
                                                .draw();
                                    });
                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>');
                            });
                        });
                    },
                    responsive: {
                        details: {
                            display: $.fn.dataTable.Responsive.display.modal({
                                header: function (row) {
                                    var data = row.data();
                                    return 'Details for ' + data[0] + ' ' + data[1];
                                }
                            }),
                            renderer: $.fn.dataTable.Responsive.renderer.tableAll({
                                tableClass: 'table'
                            })
                        }
                    },
                    dom: 'Bfrtip',
                    buttons: [{

                            text: '<i class="fa fa-files-o"></i>', titleAttr: 'email',
                            exportOptions: {
                                columns: ':contains("Office")'
                            }
                        },
                        {
                            extend: 'copyHtml5',
                            text: '<i class="fa fa-files-o"></i>',
                            titleAttr: 'Copy',
                            exportOptions: {
                                columns: ':contains("Office")'
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            text: '<i class="fa fa-file-excel-o"></i>',
                            titleAttr: 'Excel',
                            title: 'Irish Literature Library'
                        },
                        {extend: 'csvHtml5',
                            text: '<i class="fa fa-file-text-o"></i>',
                            titleAttr: 'CSV',
                            title: 'Irish Literature Library'
                        },
                        {
                            extend: 'pdfHtml5',
                            text: '<i class="fa fa-file-pdf-o"></i>',
                            titleAttr: 'PDF',
                            title: 'Irish Literature Library',
                            customize: function (doc) {
                                content: [{
                                        alignment: 'justify',
                                        columns: [
                                            {width: 'auto'},
                                            {width: '*'},
                                            {width: '*'}
                                        ],
                                        table: {widths: ['auto', '*', '*']}
                                    }];
                            }
                        }
                    ],
                    "bServerSide": false,
                    "sAjaxSource": newURL,

                    "columns": [
                        {
                            "targets": 0,
                            "class": "details-control",
                            "orderable": false,
                            "data": null,
                            "defaultContent": ""
                        },
                        {"data": "ApplicationNumber"},
                        {"data": "ApplicationYear"},
                        {"data": "ReferenceNumber"},
                        //    {"data": "ReferenceNumber"},

                        {"data": "company"},
                        {"data": "agreement",
                            "render": function (data, type, row) {

                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }}, {"data": "contract",
                            "render": function (data, type, row) {

                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "proposedDateOfPublication",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "proposedPrintRun"},
                        {"data": "plannedPageExtent"},
                        {"data": "translatorCV",
                            "render": function (data, type, row) {

                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "numberOfPages"},
                        {"data": "breakDownTranslatorFee"},
                        {"data": "translatorFee",
                            "render": function (data, type, row) {
                                var mValue = parseFloat(0.00);
                                mValue = parseFloat(data);
                                if (mValue > 0) {
                                    //mValue = Math.round(mValue);                                             
                                    return mValue.toFixed(2);
                                } else
                                    return '-';
                                return data;
                            }
                        },
                        {"data": "bookNotes",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {

                                    return data;
                                }
                            }},
                        {"data": "Status"},
                        {"data": "copiesSent",
                            "render": function (data, type, row) {
                                // console.log("copiesSent " + data);
                                if (data === 0) {
                                    document.getElementById("copiesSent").checked = false;
                                    return 'No';
                                } else {
                                    document.getElementById("copiesSent").checked = true;
                                    return 'Yes';
                                }
                                ;
                            }},
                        {"data": "dateCopiesWereSent",
                            "render": function (data) {
                                console.log("dateCopiesWereSent " + data);
                                var date = new Date(data);
                                var month = date.getMonth() + 1;
                                return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                            }
                        },
                        {"data": "copiesTranslationSample",
                            "render": function (data, type, row) {
                                //     console.log("copiesTranslationSample " + data);
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "TC_ACCEPTED",
                            "render": function (data, type, row) {
                                if (data === 0) {
                                    return 'No';
                                } else {
                                    return 'Yes';
                                }
                                ;
                            }},
                        {"data": "APPROVED",
                            "render": function (data, type, row) {
                                if (data === 0) {
                                    return 'No';
                                } else {

                                    return 'Yes';
                                }
                                ;
                            }},
                        {"data": "genre",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "TranslatorName",
                            "render": function (data) {
                                console.log("TranslatorName  " + data);
                                return data;
                            }},
                        {"data": "expertReaderName",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "bookTitle"},
                        {"data": "TranslatorTrack2",
                            "render": function (data) {
                                console.log("TranslatorTrack  " + data);
                                return data;
                            }},
                        {"data": "Titles",
                            "render": function (data) {
                                console.log("Titles  " + data);
                                return data;
                            }},
                        {"data": "translatorCVDocName",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "cover",
                            "render": function (data) {
                                console.log("81 xyz cover  " + data);
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "sampleSentOut",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "sampleReturned",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "readerReport",
                            "render": function (data, type, row) {
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        //                        {"data": "readerReportSummary"},
                        {"data": "expertReaderList"},
                        {"data": "unassignedExpertReaderList"},
                        {"data": "idTranslator"},
                        {"data": "publicationYear",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "originalLanguage",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    console.log("originalLanguage " + data);
                                    return data;
                                }
                            }},
                        {"data": "originalPageExtent",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "countryOfPublication",
                            "render": function (data) {
                                //             console.log("countryOfPublication " + data);
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "foreignPublisher",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "foreignCountry",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "targetLanguage",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "boardMeeting",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "amountRequested",
                            "render": function (data, type, row) {
                                var mValue; // = parseFloat(0.00);
                                mValue = data; //parseFloat(data);
                                if (mValue > 0) {
                                    //mValue = Math.round(mValue);                                             
                                    return mValue; //.toFixed(2);
                                } else
                                    return '-';
                                return data;
                            }
                        },
                        {"data": "amountApproved",
                            "render": function (data, type, row) {
                                var mValue = parseFloat(0.00);
                                mValue = parseFloat(data);
                                if (mValue > 0) {
                                    //mValue = Math.round(mValue);                                             
                                    return mValue.toFixed(2);
                                } else
                                    return '-';
                                return data;
                            }
                        },
                        {"data": "publisherInformedOfMeeting",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "boardComments_Instructions",
                            "render": function (data) {
                                //                                console.log("boardComments_Instructions"  + data);
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "contractSentToPublisher",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "acknowledgementApproved",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "datePublishedBooksReceived",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "datePaymentMadeToPublisher",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "paymentReferenceNumber",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "addendumRightsAgreement",
                            "render": function (data, type, row) {
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "addendumRightsAgreementName",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "proofOfPaymentToTranslator",
                            "render": function (data, type, row) {
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "proofOfPaymentToTranslatorName",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "bankDetailsForm",
                            "render": function (data, type, row) {
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "bankDetailsFormName",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "SignedLIContract",
                            "render": function (data, type, row) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                    return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "SignedLIContractName",
                            "render": function (data, type, row) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                    return  data;
                            }},
                        {"data": "paymentStatus",
                            "render": function (data, type, row) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                    return data;
                            }},
                        {"data": "previousGrantAid",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "award",
                            "render": function (data, type, row) {
                                return (data === 1) ? '<span class="glyphicon glyphicon-ok"></span>' : '<span class="glyphicon glyphicon-remove"></span>';
                            }
                        },
                        {"data": "salesFigures"},
                        {"data": "original",
                            "render": function (data, type, row) {
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "originalName",
                            "render": function (data) {

                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return data;
                                }
                            }},
                        {"data": "Author"},
                        {"data": "publicationYear"},
                        {"data": "Series",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                    return data;
                                console.log("Series  " + data);
                            }},
                        {"data": "translationTitle",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                    return data;
                                console.log("translationTitle  " + data);
                            }},
                        {"data": "transList",
                            "render": function (data, type, row) {

                                console.log("transList data" + data + " \n ");
                                return data;
                            }},
                        {"data": "rightsAgreement",
                            "render": function (data, type, row) {

                                console.log("123v4 rightsAgreement data  " + data + "\n");
                                return data;
                            }},
                        {"data": "rightsHolderArray",
                            "render": function (data, type, row) {
                                rightsHolderArray = data;
                                console.log("rightsHolderArray data  " + data + "\n");
                                return data;
                            }},
                        {"data": "idTranslator"}


                    ],
                    columnDefs: [
                        {
                            targets: -1,
                            visible: false
                        },
                        {
                            "targets": [-1, 0],
                            "orderable": false
                        },
                        {
                            "targets": 2,
                            "createdCell": function (td, cellData, rowData, row, col) {
                                if (cellData === 'new') {
                                    $(td).css('color', 'red');
                                }
                            }
                        },
//                        {
//                            targets: [7, 8],
//                            render: function (data) {
//                                return moment(data).format('MM DD, YYYY','DD/MM/YYYY');
//                            }},
                        {className: "dt-left", "targets": [2, 7, 8]}
                    ]

                });
//                $("#applications tbody").off("click").on("click", 'tr td.details-control', function (e) {
//                    alert("clicked");
////                });
                //     console.log("bookTitle " + bookTitle),
                //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
                $('#additionalExpertReaderModal').empty(); // empty the div before fetching and adding new data


                $('#applications tbody').on('click', 'tr td.details-control', function (e) {
                    e.preventDefault();
                    //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
                    $('#additionalExpertReaderModal').empty(); // empty the div before fetching and adding new data

                    cntr++;
                    var agreemnt = "";
                    var contr = "";
                    var transSamp = "";
                    var trans = "";
                    var cver = "";
                    var orig = "";
                    var addendumRightsAgreemnt = "";
                    var proofOfPaymentToTrans = "";
                    var bankDetailsFrm = "";
                    var signedLIContr = "";
                    var TranslName = "";
                    var bookTitles = "";
                    var TranslTitles = "";
                    var readerReport = "";
                    var tr = $(this).closest('tr');
                    var row = table.row(tr);
                    var rowdata = (table.row(tr).data());
                    var expertReaderName = "";
//                    var TranslatorDocs = rowdata.transList;
//                    console.log("1 TranslatorDocs rowdata.transList-> " + rowdata.transList);

//                    var awardValue = rowdata.award;
//                    console.log("awardValue:  " + awardValue);
//                    if (awardValue === 1) {
//                        document.getElementById("award").checked = true;
//                        console.log("awardValue:  TRUE");
//                    } else if (awardValue === 0) {
//                        document.getElementById("award").checked = false;
//                        console.log("awardValue:  FALSE");
//                    }

//                    var statii = rowdata.Status;
//                    if (statii === 'new') {
//
//                        document.getElementById("appStatus").style.backgroundColor = '#aefca1';
//                        document.getElementById("agreement").value = 'new';
//                    } else if (statii === 'pending') {
//
//                        document.getElementById("appStatus").style.backgroundColor = '#a1fcef';
//                        document.getElementById("agreement").value = 'pending';
//                    } else {
//
//                        document.getElementById("appStatus").style.backgroundColor = '#efa1fc';
//                        document.getElementById("agreement").value = 'closed';
//                    }
//                    ;
                    var agreemnt = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.agreement + '';
//                    $("#appAgreement").val(agreemnt);
//                    document.getElementById("agreement").href = agreemnt;

                    var orig = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.original + '';
//                   $("#appOriginal").val(orig);                                  
//                    document.getElementById("original").href = orig;
                    document.getElementById("originalSample1").href = orig;
                    var addendumRightsAgreemnt = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.addendumRightsAgreement + '';
                    $("#appAddendumRightsAgreement").val(addendumRightsAgreemnt);
//                    document.getElementById("addendum").href = addendumRightsAgreemnt;

//                    var proofOfPaymentToTrans = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.proofOfPaymentToTranslator + '';
//                    $("#appProofPaymentToTranslator").val(proofOfPaymentToTrans);
//                    document.getElementById("proofPayment").href = proofOfPaymentToTrans;
//                    var bankDetailsFrm = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.bankDetailsForm + '';
//                    $("#appBankDetailsForm").val(bankDetailsFrm);
//                    document.getElementById("bankDetailForm").href = bankDetailsFrm;
//                    var signedLIContr = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.SignedLIContract + '';
//                    $("#appSignedLIContract").val(signedLIContr);
//                    document.getElementById("signedLIcontract").href = signedLIContr;
                    //             console.log("showUploadCover rowdata.cover " + rowdata.cover);
//
//                    if (typeof (rowdata.cover) === "undefined" || rowdata.cover === "") {
//                        var cver = 'images/not-available.jpg';
//                        $("#showUploadCover").show();
//                        $("#showCover").hide();
//                        document.getElementById("cover").src = cver;
//                    } else {
//
//                        $("#showCover").show();
//                        $("#showUploadCover").hide();
//                        var cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
//                        $("#cover").val(cver);
//                        document.getElementById("cover").src = cver;
//                    }
                    var contr = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.contract + '';
//                    document.getElementById("contract").href = contr;
//
//                    var trans = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.translatorCV + '';
//                    document.getElementById("translatorCV").href = trans;
//
                    var transSamp = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.copiesTranslationSample + '';
                    document.getElementById("translationSample1").href = transSamp;


                    $("#applicationsModal").modal("show");
//                    rightsHolderArray = [];
//                    $("#applications").DataTable().ajax.reload();
                    $("#appApplicationNumber").val($(this).closest('tr').children()[1].textContent);
                    $("#appApplicationYear").val($(this).closest('tr').children()[2].textContent);
                    $("#appReferenceNumber").val($(this).closest('tr').children()[3].textContent);
//                    $("#appCompany").val($(this).closest('tr').children()[4].textContent);
//                    $("#appAgreement").val($(this).closest('tr').children()[5].textContent);

                    var appReferenceNumber = rowdata.ReferenceNumber;
                    document.getElementById("appReferenceNumber").innerHTML = appReferenceNumber;
                    document.getElementById("ReferenceNumber").value = appReferenceNumber;
                    //          console.log("appReferenceNumber " + appReferenceNumber);
                    $("#unassignedERRefNo").val(appReferenceNumber);
                    var TranslName = rowdata.TranslatorName;
                    console.log("888 TranslName " + TranslName);
                    $("#translatorNames").val(TranslName);
                    console.log("888 TranslatorName length ", TranslName.length);
                    var bookTitles = rowdata.Titles;
                    $("#currentItem").val(bookTitles.join(""));



                    console.log("8 xyz bookTitle: " + rowdata.bookTitle);
                    document.getElementById("appBookTitle").value = rowdata.bookTitle;
//                    document.getElementById("publicationYear").value = rowdata.publicationYear;
                    document.getElementById("appGenre").value = rowdata.genre;
                    document.getElementById("appLanguageOriginal").value = rowdata.originalLanguage;
                    document.getElementById("appCountryOfPublication").value = rowdata.countryOfPublication;
                    document.getElementById("bookNotes").value = rowdata.bookNotes;
                    document.getElementById("proposedDateOfPublication").value = formatDate(rowdata.proposedDateOfPublication);
                    document.getElementById("foreignPublisher").value = rowdata.foreignPublisher;
                    document.getElementById("plannedPageExtent").value = rowdata.plannedPageExtent;
                    document.getElementById("appForeignCountry").value = rowdata.foreignCountry;
                    document.getElementById("appproposedPrintRun").value = rowdata.proposedPrintRun;
                    var languageArray = rowdata.targetLanguage;
                    document.getElementById("appTargetLanguage").value = languageArray;
                    document.getElementById("publicationYear1").value = rowdata.publicationYear;
                    document.getElementById("languages").value = rowdata.originalLanguage;
                    document.getElementById("translatorFee").value = rowdata.translatorFee;
                    document.getElementById("BreakDownOfTranslatorFee").value = rowdata.breakDownTranslatorFee;
                    document.getElementById("company").value = rowdata.company;
                    document.getElementById("appCompany").value = rowdata.company;

                    console.log("123v rightsHolderArray ");
                    console.log("123v rightsHolderArray.length " + rowdata.rightsHolderArray.length);
                    for (var i = 0; i < rowdata.rightsHolderArray.length; i++) {

                        console.log("123v rightsHolderArray " + rowdata.rightsHolderArray[i]);
                    }
                    console.log("123v TranslatorName ");
                    for (var i = 0; i < rowdata.TranslatorName.length; i++) {

                        console.log("123v TranslatorName " + rowdata.TranslatorName[i]);
                    }
                    $("#addAddRightsHolders").empty();
                    if (rowdata.rightsHolderArray.length === 0) {
                        $('#addAddRightsHolders').empty();
                        document.getElementById("rightsHoldersName0").style.display = "inline";
                        console.log("123v ist empty ");
                        $("#RightsHolderGeneratedForm").empty();
                        document.getElementById("rightsHoldersName0").value = "";
                        document.getElementById("rightsHoldersName0").disabled = false;
                        document.getElementById("rightsHoldersName0").readOnly = false;
                    }
                    /*
                     * Process rights holders
                     * 1) check if there is one in the array - if so fill the input field and disable it
                     */
//                    if (rowdata.rightsHolderArray.length > 1) {
//                        document.getElementById("rightsHoldersName0").value = rowdata.rightsHolderArray[0];
//                        document.getElementById("rightsHoldersName0").disabled = true;
//                    }

                    /*
                     * Process rights holders
                     * 2) check if it's an array i.e. more data
                     * if so
                     * 3)  change title to plural
                     * 4) iterate through the array - starting with 1 as we done 0 already
                     * 5) make sure input fields are disabled so they wont be inserted into table again
                     */



                    if (rowdata.rightsHolderArray.length > 0) {
                        /*                         
                         * Change Title from "Translation rights holder" to "Translation rights holder(s)"
                         */
                        document.getElementById("rightsHoldersName0").style.display = "none";
                        document.getElementById("rightsHoldersNameLabel").innerHTML = 'Translation rights holders';
                        for (var i = 0; i < rowdata.rightsHolderArray.length; i++) {

                            var additionalTranslatorTag = '';

                            additionalTranslatorTag += '<div class="form-group has-feedback">';
                            additionalTranslatorTag += ' <input id="rightsHoldersName' + i;
                            additionalTranslatorTag += ' type="text"  ';
                            additionalTranslatorTag += ' class="form-control"';
                            additionalTranslatorTag += ' name="rightsHoldersName' + i + '"';
                            additionalTranslatorTag += ' value="' + rowdata.rightsHolderArray[i] + '"';
                            additionalTranslatorTag += ' disabled = ""';
                            additionalTranslatorTag += ' </div>';

                            $(additionalTranslatorTag).appendTo('#addAddRightsHolders');
                        }
                        ;
                    } else {
                        document.getElementById("rightsHoldersNameLabel").innerHTML = 'Translation rights holder';
                    }

                    var Authors = rowdata.Author;
                    document.getElementById("authors").value = rowdata.Author;
                    document.getElementById("authorArray").value = rowdata.Author;
                    console.log("rowdata.Author  ", rowdata.Author);
                    console.log("originalPageExtent >>> " + rowdata.originalPageExtent);
                    document.getElementById("originalPageExtent").value = rowdata.originalPageExtent;


                    languageArray = rowdata.targetLanguage;
                    console.log("languageArray  ", languageArray);


                    // Generate table translatorTrackTable
                    var TranslTitles = rowdata.translatorTitles;
                    var translationTitle = rowdata.translationTitle;
                    document.getElementById("translationTitle").value = rowdata.translationTitle;

                    console.log("translationTitle >>> " + translationTitle);

                    document.getElementById("series").value = rowdata.Series;
                    console.log("Series >>> " + rowdata.Series);


                    console.log("TranslTitles: " + TranslTitles);
                    var TranslatorDocs = "";
                    var TranslatorDocs = [];
                    TranslatorDocs = rowdata.transList; //  .transList.values();
                    console.log("8 xyz  TranslatorDocs " + TranslatorDocs);
                    translatorArray = rowdata.transList;
                    console.log("8 xyz  translatorArray " + translatorArray);

                    $("#translatorArray").val(translatorArray);

                    //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
                    $('#translatorTableDiv').empty(); // empty the div before fetching and adding new data
                    var docName = "";
                    var translatorTableDiv = document.getElementById("translatorTableDiv");
                    var tble = document.createElement('TABLE');
                    tble.id = 'TranslatorTable';
                    tble.border = '1';
                    tble.title = 'TranslatorTable';
                    tble.className = "table";
                    tble.style = 'width: auto;overflow-x: auto';
                    var tableBody = document.createElement('TBODY');
                    var header = document.createElement('thead');
                    header.style = 'font-weight: bold;';
                    var headingRow = document.createElement('tr');
                    var headingCell1 = document.createElement('td');
                    var headingText1 = document.createTextNode('Translator name');
                    headingCell1.appendChild(headingText1);
                    headingRow.appendChild(headingCell1);
                    var headingCell2 = document.createElement('td');
                    var headingText2 = document.createTextNode('Translator CV');
                    headingCell2.appendChild(headingText2);
                    headingRow.appendChild(headingCell2);
//                    var headingCell3 = document.createElement('td');
//                    var headingText3 = document.createTextNode('Translator translation sample');
//                    headingCell3.appendChild(headingText3);
//                    headingRow.appendChild(headingCell3);

//                    header.appendChild(headingRow);
//                    tble.appendChild(header);


                    console.log("8 xyz 000 translators.length: " + translators.length);
                    console.log("8 xyz 000 TranslatorDocs[0].length: " + TranslatorDocs[0].length);
                    console.log("8 xyz 000 TranslatorDocs.length: " + TranslatorDocs.length);
                    console.log(TranslatorDocs[0]); // contais 2 arrays
                    translatorNamesForGenerateTranslatorTab = [];
                    translators = [];
                    //    var loopLength = TranslatorDocs[0].length;
                    //  console.log("8 xyz loopLength " + loopLength);
                    for (var i = 0; i < TranslatorDocs.length; ++i) {
                        console.log("8 xyz TranslatorDocs.length  first loop [" + i + "]");
                        for (var j = 0; j < TranslatorDocs[i].length; ++j) {
                            console.log("8 xyz TranslatorDocs.length  second loop ", TranslatorDocs[i].length);
                            console.log("8 xyz TranslatorDocs[" + i + "] ");
                            console.log(TranslatorDocs[i]);
                            console.log("8 xyz TranslatorDocs[" + i + "] [" + j + "]");
                            console.log(TranslatorDocs[i][j]);
                            // skip undefined values to preserve sparse array
                            if (TranslatorDocs[i][j] === undefined)
                                continue;
                            // create row if it doesn't exist yet
                            if (translators[j] === undefined)
                                translators[j] = [];
                            // swap the x and y coords for the copy
                            translators[i][j] = TranslatorDocs[i][j];
                            console.log("8 xyz 1 translators[" + i + "][" + j + "] " + translators[i][j]);
                        }
                    }

                    //TABLE ROWS
                    for (i = 0; i < translators.length; i++) {
                        var tr = document.createElement('TR');
                        for (j = 0; j < translators[i].length; j++) {
                            console.log("8 xyz  translators[i].length: " + translators[i].length);
                            console.log("8 xyz  translators[i]: " + translators[i]);
                            console.log("8 xyz translators[i][j] " + translators[i][j]);
                            var td = document.createElement('TD');
                            if (i === 0) {
                                td.className = 'highlightHeader';
                            }
                            // remove "undefined" cells
                            if (typeof (translators[i][j]) === "undefined") {
                                translators[i][j] = '';
                            }

                            console.log("8 xyz   3 translators[i][j] " + translators[i][j]);
                            var nls = translators[i][j].split(",");
                            for (k = 0; k < nls.length; k++) {
                                console.log("1 nls [" + k + " ] " + nls[k]);
                            }


                            var newTranslatorName = nls[0];
                            newTranslatorName = newTranslatorName.substring(1);
                            translatorNamesForGenerateTranslatorTab.push(newTranslatorName);
                            console.log("8 xyz   translatorNamesForGenerateTranslatorTab " + translatorNamesForGenerateTranslatorTab);
                            for (o = 0; o < translatorNamesForGenerateTranslatorTab.length; o++) {
                                console.log("8 xyz   loop translatorNamesForGenerateTranslatorTab " + translatorNamesForGenerateTranslatorTab[o]);
                            }

                            for (l = 0; l < nls.length; l++) {
                                docName = "";
                                if (l === 0) {
                                    td = document.createElement('td');
                                    td.className = 'highlightHeader';
                                    var rep = nls[l].substr(1);
                                    console.log("rep [" + l + " ] " + rep);
                                    td.appendChild(document.createTextNode(rep));
                                    tr.appendChild(td);
                                } else if (l === 2) {
                                    td = document.createElement('td');
                                    var btn = document.createElement('input');
                                    btn.type = "button";
                                    btn.className = "btn btn-info";
                                    btn.value = nls[1].trim();
                                    var dir = nls[l].substr(1);
                                    var destination = dir.replace("/home/markus/public_html/", "/~markus/");
                                    console.log("destination " + destination);
                                    var entry = "location.href='http://www.literatureirelandgrantapplication.com:8080" + destination + "'";
                                    console.log("localhost " + entry);
                                    btn.setAttribute("onclick", entry);
                                    td.appendChild(btn);
                                    console.log("nls[l] [" + l + " ] " + nls[l]);
                                    td.appendChild(btn);
                                    tr.appendChild(td);
                                } else if (l === 3) {

                                    docName = nls[l].trim();
                                }
                            }
                            tr.appendChild(td);
                            tableBody.appendChild(tr);
                            tr = document.createElement('tr');
                        }
                        tableBody.appendChild(tr);
                    }
                    tble.appendChild(tableBody);

                    var expertReaderName = rowdata.expertReaderList;


                    //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
                    $('#additionalExpertReader').empty(); // empty the div before fetching and adding new data

                    //reset the blocks
                    document.getElementById("agreementToggle1").style.display = "block";
                    document.getElementById("agreement_button1").style.display = "none";
                    document.getElementById("addendumToggle1").style.display = "block";
                    document.getElementById("addendum_button1").style.display = "none";

                    //Get all Expert Readers that are not assigned at the moment
                    var unassignedExpertReaderList = rowdata.unassignedExpertReaderList;


                    $('#tn').empty(); // empty the div before fetching and adding new data
                    $('#tnc').empty(); // empty the div before fetching and adding new data

                    // Generate Translator Tabs in "Rights Agreement & Contracts"-Tab

                    // 1: The Nav-Bar

                    var rightsAgreementContractsNavBar = '';
                    rightsAgreementContractsNavBar += '<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2" style="background-color: #d9d1d1">';
                    rightsAgreementContractsNavBar += '<ul class="nav navbar-nav nav-tabs">';
                    for (var i = 0; i < rowdata.rightsAgreement.length; i++) {
                        console.log("translatorNamesForGenerateTranslatorTab[' + i + ' " + translatorNamesForGenerateTranslatorTab[i]);
                        var j = i + 1;
                        if (i === 0) {

                            rightsAgreementContractsNavBar += '<li class="active"><a href="#tn' + j + '" data-toggle="tab">' + translatorNamesForGenerateTranslatorTab[i] + '</a></li>';
                        } else {

                            rightsAgreementContractsNavBar += '<li><a href="#tn' + j + '" data-toggle="tab">' + translatorNamesForGenerateTranslatorTab[i] + '</a></li>';
                        }
                    }

                    rightsAgreementContractsNavBar += '</ul>'; // ul class="nav navbar-nav nav-tabs"
                    rightsAgreementContractsNavBar += '</div>'; // navbar-collapse


                    $(rightsAgreementContractsNavBar).appendTo('#tn');



                    // The Tabs themselves

                    var rightsAgreementContractsNavContent = '';

                    for (var i = 0; i < rowdata.rightsAgreement.length; i++) {

                        var j = i + 1;

                        if (i === 0) {

                            rightsAgreementContractsNavContent += '<div class="tab-pane fade in active" id="tn' + j + '">';
                        } else {

                            rightsAgreementContractsNavContent += '<div class="tab-pane fade" id="tn' + j + '">';
                        }


                        rightsAgreementContractsNavContent += '<div class="container wrapperContainer">';

                        //Upload a copy of the CV

                        console.log("8 xyz Upload a copy of the CV v " + v + "  w  " + w + "  j  " + j);
                        rightsAgreementContractsNavContent += '<div class="row" style="margin-bottom: 80px;">';
                        rightsAgreementContractsNavContent += '<div style=" margin: 0 auto; position: relative;">';

                        rightsAgreementContractsNavContent += '<div class="col-md-9"  id="cvToggle' + j + '" style="margin-bottom: 40px; position:absolute; z-index:0;">';
                        rightsAgreementContractsNavContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadCV' + j + '"></strong></div>';
                        rightsAgreementContractsNavContent += '<br/>';
                        rightsAgreementContractsNavContent += '<div class="margin-bottom: 40px"></div>';
                        rightsAgreementContractsNavContent += '<div class="input-group cv"  style="margin-bottom: 40px;">';
                        rightsAgreementContractsNavContent += '<label class="btn btn-default btn-file pull-left">';
                        rightsAgreementContractsNavContent += 'Select file <input type="file" onchange="generatedLabels()" name="CV-' + j + '" id="cv' + j + '">';
                        rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                        rightsAgreementContractsNavContent += '</label>';
                        rightsAgreementContractsNavContent += '<input  type="text" id="label_cv' + j + '" class="pull-left"/>';
                        rightsAgreementContractsNavContent += '<input type="hidden" value="CV" name="destination" id="cv_upload' + j + '"/>';
                        rightsAgreementContractsNavContent += '<span class="help-block"></span> ';
                        rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                        rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 

                        rightsAgreementContractsNavContent += '<div class="col-md-5" id="cv_button' + j + '" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> ';
                        rightsAgreementContractsNavContent += '<label  class="control-label pull-left" id="cv_button_label' + j + '" ></label>';
                        rightsAgreementContractsNavContent += '<div class="input-group cv_buttonText pull-left">';
                        rightsAgreementContractsNavContent += '<a class="btn btn-info btn-file pull-left" role="button" id="cv_link' + j + '" href=""  target="_blank">';
                        rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-file"></span>';
                        rightsAgreementContractsNavContent += 'Click to open</a>';
                        rightsAgreementContractsNavContent += '</div>';
                        rightsAgreementContractsNavContent += '</div>'; // -- col-md-10--


                        rightsAgreementContractsNavContent += '</div>'; //-- position:relative;--
                        rightsAgreementContractsNavContent += '</div>'; // row

                        //Upload a copy of the contract with translator

                        console.log("8 xyz Upload a copy of the contract with translator v " + v + "  w  " + w + "  j  " + j);
                        rightsAgreementContractsNavContent += '<div class="row" style="margin-bottom: 80px;">';
                        rightsAgreementContractsNavContent += '<div style=" margin: 0 auto; position: relative; ">';

                        rightsAgreementContractsNavContent += '<div class="col-md-9"  id="contractToggle' + j + '" style="margin-bottom: 40px; position:absolute; z-index:0;">';
                        rightsAgreementContractsNavContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadContract' + j + '"></strong></div>';
                        rightsAgreementContractsNavContent += '<br/>';
                        rightsAgreementContractsNavContent += '<div class="margin-bottom: 40px"></div>';
                        rightsAgreementContractsNavContent += '<div class="input-group contract"  style="margin-bottom: 40px;">';
                        rightsAgreementContractsNavContent += '<label class="btn btn-default btn-file pull-left">';
                        rightsAgreementContractsNavContent += 'Select file <input type="file" onchange="generatedLabels()" name="Contract-' + j + '" id="contract' + j + '">';
                        rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                        rightsAgreementContractsNavContent += '</label>';
                        rightsAgreementContractsNavContent += '<input  type="text" id="label_contract' + j + '" class="pull-left"/>';
                        console.log("8 xyz Upload a copy of the contract with translator id=label_contract" + j);
                        rightsAgreementContractsNavContent += '<input type="hidden" value="Contract" name="destination" id="contract_upload' + j + '"/>';
                        rightsAgreementContractsNavContent += '<span class="help-block"></span> ';
                        rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                        rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 

                        rightsAgreementContractsNavContent += '<div class="col-md-5" id="contract_button' + j + '" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> ';
                        rightsAgreementContractsNavContent += '<label  class="control-label pull-left" id="contract_button_label' + j + '" ></label>';
                        rightsAgreementContractsNavContent += '<div class="input-group contract_buttonText pull-left">';
                        rightsAgreementContractsNavContent += '<a class="btn btn-info btn-file pull-left" role="button" id="contract_link' + j + '" href=""  target="_blank">';
                        rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-file"></span>';
                        rightsAgreementContractsNavContent += 'Click to open</a>';
                        rightsAgreementContractsNavContent += '</div>';
                        rightsAgreementContractsNavContent += '</div>'; // -- col-md-10--


                        rightsAgreementContractsNavContent += '</div>'; //-- position:relative;--
                        rightsAgreementContractsNavContent += '</div>'; // row

                        rightsAgreementContractsNavContent += '</div>';  //  --container--
                        rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"

                    }

                    $(rightsAgreementContractsNavContent).appendTo('#tnc');

                    //Fill the tabs

                    var w = 1;

                    console.log("8 xyz Fill the tabs v " + v + "  w  " + w + "  j  " + j);
                    console.log("8 xyz 1: Fill the tabs translators.length " + translators.length);
                    console.log("8 xyz 1: Fill the tabs TranslatorDocs.length " + TranslatorDocs.length);
                    console.log("8 xyz 1: Fill the tabs rightsAgreement.length " + rowdata.rightsAgreement.length);
                    for (var j = 0; j < rowdata.rightsAgreement.length; j++) {
                        var rightsAgreementArray = rowdata.rightsAgreement[j].split(",");
                        for (var v = 0; v < rightsAgreementArray.length; v++) {
                            console.log("8 xyz Fill the tabs v " + v + "  w  " + w + "  j  " + j);
                            console.log("8 xyz 1: Fill the tabs rightsAgreement " + rightsAgreementArray[v].substr(1));
                            switch (v) {
                                case 0:
                                    // Agreement
                                    console.log("8 xyz Agreement ");
                                    if (w === 1) {
                                        if (rightsAgreementArray[v].substr(1) !== 'null') {
                                            console.log("8 xyz Agreement not null");
                                            console.log("8 xyz case 0  j[" + j + "] w  " + w);
                                            console.log("8 xyz  rightsAgreementArray  :", rightsAgreementArray[v].substr(1) + ":");
                                            document.getElementById('agreement_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
                                        }
                                    }
                                    break;
                                case 1:
                                    // AgreementDocName
                                    console.log("8 xyz AgreementDocName ");
                                    console.log("8 xyz case 1 [" + j + "]");
                                    console.log("8 xyz rightsAgreementArray[" + v + "].substr(1) :" + rightsAgreementArray[v].substr(1) + ":");
                                    console.log("8 xyz  ", translatorNamesForGenerateTranslatorTab[j]);
                                    if (w === 1) {
                                        if (rightsAgreementArray[v].substr(1) === '') {
                                            console.log("8 xyz AgreementDocName ===  empty");
                                            console.log("8 xyz  ", translatorNamesForGenerateTranslatorTab[j]);
                                            document.getElementById('uploadAgreement' + w).innerHTML = 'Upload a copy of the agreement with the translation rights holder';
                                            document.getElementById('label_agreement' + w).value = "not entered";

                                        } else {
                                            console.log("8 xyz AgreementDocName toggle");
                                            console.log("8 xyz case 1 toggle ");
                                            $('#agreementToggle' + w).toggle();
                                            $('#agreement_button' + w).toggle();

                                            document.getElementById("agreement_button_label" + w).innerHTML = 'Open copy of the agreement with the translation rights holder';

                                        }
                                    }
                                    break;
                                case 2:
                                    // Contract
                                    if (rightsAgreementArray[v].substr(1) !== 'null') {
                                        console.log("8 xyz Contract ===  available");
                                        document.getElementById('contract_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
                                    } else {
                                        console.log("8 xyz Contract ===  empty");
                                    }
                                    break;
                                case 3:
                                    // ContractDocName
                                    console.log("8 xyz ContractDocName");
                                    console.log("81 xyz Process ContractDocName #############################################");
                                    console.log("81 xyz Process ContractDocName for ", translatorNamesForGenerateTranslatorTab[j]);
                                    console.log("8 xyz v " + v + "  w  " + w + "  j  " + j); // 8 xyz v 3  w  1
                                    if (rightsAgreementArray[v].substr(1) === '') {
                                        console.log("8 xyz ContractDocName ===  empty");
                                        console.log("8 xyz  ", translatorNamesForGenerateTranslatorTab[j]);
                                        console.log("8 xyz rightsAgreementArray[" + v + "].substr(1) :" + rightsAgreementArray[v].substr(1) + ":");
                                        document.getElementById('label_contract' + w).value = "not entered";
                                        document.getElementById('uploadContract' + w).innerHTML = 'Upload a copy of the contract with ' + translatorNamesForGenerateTranslatorTab[j];
                                        console.log("8 xyz label_contract ", document.getElementById('label_contract' + w).value);
                                    } else {

                                        $('#contractToggle' + w).toggle();
                                        $('#contract_button' + w).toggle();

                                        document.getElementById("contract_button_label" + w).innerHTML = 'Open copy of the contract with ' + translatorNamesForGenerateTranslatorTab[j];

                                    }
                                    break;
                                case 4:
                                    // AddendumRightsAgreement
                                    if (w === 1) {
                                        if (rightsAgreementArray[v].substr(1) !== 'null') {
                                            console.log("8 xyz AddendumRightsAgreement not null");
                                            console.log("8 xyz case 0  j[" + j + "] w  " + w);
                                            console.log("8 xyz  rightsAgreementArray  :", rightsAgreementArray[v].substr(1) + ":");
                                            document.getElementById('addendum_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
                                        }
                                    }
                                    break;
                                case 5:
                                    // AddendumRightsAgreementName

                                    console.log("81 xyz Process AddendumRightsAgreementName #############################################");
                                    console.log("81 xyz Process AddendumRightsAgreementName for ", translatorNamesForGenerateTranslatorTab[j]);
                                    console.log("8 xyz v " + v + "  w  " + w + "  j  " + j); // 8 xyz v 3  w  1
                                    if (w === 1) {
                                        if (rightsAgreementArray[v].substr(1) === '') {
                                            console.log("8 xyz AddendumRightsAgreementName === empty");
                                            document.getElementById('label_addendum' + w).value = "not entered";
                                            var uploadAddendum = "Upload a copy of the addendum to the rights agreement &nbsp";

                                            document.getElementById('uploadAddendum' + w).innerHTML = uploadAddendum;

                                        } else {
                                            console.log("8 xyz AddendumRightsAgreementName  toggle");
                                            $('#addendumToggle' + w).toggle();
                                            $('#addendum_button' + w).toggle();

                                            document.getElementById("addendum_button_label" + w).innerHTML = "<strong>Open copy of the addendum to the rights agreement </strong>";
                                        }
                                    }
                                    break;
                            }
                        }

//                        console.log("8 xyz  #################   translatorNamesForGenerateTranslatorTab[" + j + "]", translators[j][0]);
                        console.log("81 xyz  translatorNamesForGenerateTranslatorTab[" + j + "]", translatorNamesForGenerateTranslatorTab[j]);


                        // CV
                        console.log("81 xyz  Process CVs #############################################");
                        console.log("81 xyz Process CV for ", translatorNamesForGenerateTranslatorTab[j]);
                        if (translatorNamesForGenerateTranslatorTab[j] === 'null') {
                            console.log("81 xyz  translatorNamesForGenerateTranslatorTab[j] === 'null' ");
                            console.log("81 xyz  translatorNamesForGenerateTranslatorTab[" + j + "]", translatorNamesForGenerateTranslatorTab[j]);
                            document.getElementById('uploadCV' + j).innerHTML = 'Upload a copy of the CV with ' + translatorNamesForGenerateTranslatorTab[j];
                            document.getElementById('label_translator' + j).value = "not entered";

                        } else {
                            console.log("81 xyz  translatorNamesForGenerateTranslatorTab[j] NOT 'null' ");
                            console.log("81 xyz ON i " + i);
                            console.log("81 xyz ON j " + j);
                            console.log("81 xyz ON w " + w);


                            $('#cvToggle' + w).toggle();
                            $('#cv_button' + w).toggle();
                            for (var g = 0; g < translators.length; g++) {
                                console.log("81 xyz transArray = translators[0] [" + g + "]", translators[0][g]);
                            }
                            var transArray = translators[0][j];

                            console.log("81 xyz translators[j][0]  " + translators[j][0]);
                            console.log("81 xyz translators[0][j]  " + translators[0][j]);

                            transArray = transArray.replace("[", "");
                            transArray = transArray.replace("]", "");

                            var linkArray = transArray.split(",");
                            for (var h = 0; h < linkArray.length; h++) {
                                console.log("81 xyz linkArray[" + h + "]  " + linkArray[h]);
                            }

                            console.log("81 xyz linkArray[2]  " + linkArray[2]);

                            document.getElementById("cv_button_label" + w).innerHTML = 'Open copy of the CV for ' + translatorNamesForGenerateTranslatorTab[j];
                            document.getElementById('cv_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + linkArray[2].trim() + " ";

                        }

                        w++;  // next translator

                    }


                    $("#appcontract").val(contr);
//                    $("#proposedDateOfPublication").val($(this).closest('tr').children()[7].textContent);
//                    $("#appproposedPrintRun").val($(this).closest('tr').children()[8].textContent);
//                    $("#plannedPageExtent").val($(this).closest('tr').children()[9].textContent);
                    $("#appnumberOfPages").val($(this).closest('tr').children()[11].textContent);
//                    $("#breakDownTranslatorFee").val($(this).closest('tr').children()[12].textContent);
//                    $("#translatorFee").val($(this).closest('tr').children()[13].textContent);
//                    $("#bookNotes").val($(this).closest('tr').children()[14].textContent);
                    $("#appStatus").val($(this).closest('tr').children()[15].textContent);
                    $("#copiesSent").val($(this).closest('tr').children()[16].textContent);
                    document.getElementById("dateCopiesWereSent").value = formatDate(rowdata.dateCopiesWereSent);
//                    $("#dateCopiesWereSent").val($(this).closest('tr').children()[17].textContent);
                    $("#appTC_ACCEPTED").val($(this).closest('tr').children()[19].textContent);
                    $("#appAPPROVED").val($(this).closest('tr').children()[20].textContent);
//                    $("#appGenre").val($(this).closest('tr').children()[21].textContent);
                    $("#appExpertReader").val($(this).closest('tr').children()[23].textContent);
//                    $("#appBookTitle").val($(this).closest('tr').children()[24].textContent);
                    $("#expertReaderName").val($(this).closest('tr').children()[22].textContent);
                    $("#sampleSentOut").val($(this).closest('tr').children()[29].textContent);
                    $("#sampleReturned").val($(this).closest('tr').children()[30].textContent);
                    $("#appReadersReport").val($(this).closest('tr').children()[31].textContent);
//                  $("#readerReportSummary").val($(this).closest('tr').children()[32].textContent);

//                  $("#appDateOfPublicationOriginal").val($(this).closest('tr').children()[35].textContent);
//                    $("#publicationYear1").val($(this).closest('tr').children()[35].textContent);
//                    $("#languages").val($(this).closest('tr').children()[36].textContent);
//                    $("#appLanguageOriginal").val($(this).closest('tr').children()[36].textContent);
                    $("#originalPageExtent").val($(this).closest('tr').children()[37].textContent);
//                    $("#appCountryOfPublication").val($(this).closest('tr').children()[38].textContent);
//                    $("#appForeignPublisher").val($(this).closest('tr').children()[39].textContent);
//                    $("#foreignPublisher").val($(this).closest('tr').children()[39].textContent);
//                    $("#appForeignCountry").val($(this).closest('tr').children()[40].textContent);
//                    $("#appTargetLanguage").val($(this).closest('tr').children()[41].textContent);
                    $("#amountRequested").val($(this).closest('tr').children()[43].textContent);
                    $("#award").val($(this).closest('tr').children()[62].textContent);
                    $("#salesFigures").val($(this).closest('tr').children()[63].textContent);
//                    $("#authors").val($(this).closest('tr').children()[66].textContent);
//                    $("#publicationYear").val($(this).closest('tr').children()[67].textContent);
////                    $("#series").val($(this).closest('tr').children()[68].textContent);
////                    $("#translationTitle").val($(this).closest('tr').children()[69].textContent);




                    console.log("generateTranslatorTab translatorArray " + translators.length);

                });
                
                
//                $('#applicationForm :file').each(function () {
//                    var input = $(this); // This is the jquery object of the input, do what you will
//                    console.log("88 xyz ", input[0].name);
//                    $(this).rules("add",
//                            {
//                                validFileName: true
//                            });
//
//                });
            });
        </script>





        <!--get selectpicker selection--> 
        <script type="text/javascript">
            $(document).ready(function () {
                $('.selectpicker').on('change', function () {
                    var selected = $(this).find("option:selected").val();
                });
            });
            // Returns if a value is an array
            function isArray(value) {
                return value && typeof value === 'object' && value.constructor === Array;
            }
            function hasEmptyElement(array) {
                for (var i = 0; i < array.length; i++) {
                    if (typeof array[i] === 'undefined') {
                        return true;
                        // and then ?
                        // should I use double for loop or helper variable?
                    }
                }
            }
        </script>

        <!-- the following functions will copy
     the selected file name (for upload) to the label input-->
        <!--get selectpicker selection--> 
        <script type="text/javascript">
            $(document).ready(function () {
                $('.selectpicker').on('change', function () {
                    var selected = $(this).find("option:selected").val();
                });
            });
            // Returns if a value is an array
            function isArray(value) {
                return value && typeof value === 'object' && value.constructor === Array;
            }
            function hasEmptyElement(array) {
                for (var i = 0; i < array.length; i++) {
                    if (typeof array[i] === 'undefined') {
                        return true;
                        // and then ?
                        // should I use double for loop or helper variable?
                    }
                }
            }
        </script>

        <!-- the following functions will copy
     the selected file name (for upload) to the label input-->
        <script>
            $(function () {
                $('div.agreement').on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    //                  var label_translatorid2 = "label_translator" + id2;
                    document.getElementById("label_agreement1").value = label;
                    document.getElementById("label_agreement1").size = label.length;
                });
            });
            $(function () {
                $('div.contract').on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    document.getElementById("label_contract").value = label;
                    document.getElementById("label_contract").size = label.length;
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
                    document.getElementById("label_addendum1").size = label.length;
                });
            });
            $(function () {
                $('div.translator_cv').on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
//                  var label_translatorid2 = "label_translator" + id2;
                    document.getElementById("label_translator0").value = label;
                    document.getElementById("label_translator0").size = label.length;
                });
            });
            $(function () {
                $(document).on('change', 'div.translatorcv :file', function () {

                    var id = parseInt(this.id.replace("translator_cv", ""));
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    var label_translatorid = "label_translator" + id;
                    document.getElementById(label_translatorid).value = label;
                    document.getElementById(label_translatorid).size = label.length;
                });
            });
            $(function () {
                $('div.originalSample').on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    document.getElementById("label_originalSample").value = label;
                    document.getElementById("label_originalSample").size = label.length;
                });
            });
            $(function () {
                $('div.translationSample').on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    document.getElementById("label_translationSample").value = label;
                    document.getElementById("label_translationSample").size = label.length;
                });
            });
            $(function () {
                $('div.cover').on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    document.getElementById("label_cover").value = label;
                    document.getElementById("label_cover").size = label.length;
                });
            });
            $(function () {
                $('div.proofPayment').on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    document.getElementById("label_proofPayment").value = label;
                    document.getElementById("label_proofPayment").size = label.length;
                });
            });
            $(function () {
                $('div.bankDetailForm').on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    document.getElementById("label_BankDetailForm").value = label;
                    document.getElementById("label_BankDetailForm").size = label.length;
                });
            });
            $(function () {
                $('div.signedLIcontract').on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    document.getElementById("label_signedLIcontract").value = label;
                    document.getElementById("label_signedLIcontract").size = label.length;
                });
            });

            function generatedLabels() {
                $(document).on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    var id = input[0].id;
                    var label_id = "label_" + id;
                    document.getElementById(label_id).value = label;
                    document.getElementById(label_id).size = label.length;
                    if ($(this).valid()) {
                        $($(this)).closest('.input-group').addClass('has-error');
                    } else {

                    }
                });
            }
            ;
        </script>

        <!--copyFirstTranslatorName-->
        <script>
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
                $("#addAdditionalRightsHolders").click(function (event) {
                    console.log("addAdditionalRightsHolders   ", rightsHolderArray);
                    console.log("123v2 addAdditionalRightsHolders   ", rightsHolderArray.length);
                    translationrightsholdercounter = rightsHolderArray.length;
                    translationrightsholdercounterInput = rightsHolderArray.length;
                    translationrightsholdercounter++;

                    console.log("123v2 addAdditionalRightsHolders  translationrightsholdercounter ", translationrightsholdercounter);
                    var $newDiv = $("<div class='input-group' style='margin-bottom :2px'>" + translationrightsholdercounter + ".  Rights holder  </div>");
                    var $newInput = $("<input placeholder='Rights holder name' type='text'> ");
                    $newInput
                            .attr("name", "rightsHoldersName" + translationrightsholdercounterInput)
                            .attr("id", "name" + translationrightsholdercounterInput)
                            .addClass("text wsp");
                    $newInput.appendTo($newDiv);
                    $newDiv.appendTo($("#RightsHolderGeneratedForm"));
                });
            });
        </script>

        <!--addAdditionalRightsHoldersModalDiv-->
        <script type="text/javascript">
            $(document).ready(function () {
                translationrightsholdercounter = 1;
                $("#RightsHolderGeneratedForm").empty();
                $("#addAdditionalRightsHoldersModalDiv").click(function (event) {
//                    alert("addAdditionalRightsHoldersModalDiv");
                    console.log("123v addAdditionalRightsHolders   ", rightsHolderArray.length);
                    if (rightsHolderArray.length > 0) {
                        for (var i = 0; i < rightsHolderArray.length; i++) {
                            var counter = i + 1;
                            console.log("123v addAdditionalRightsHolders   ", rightsHolderArray[i]);
                            var name = rightsHolderArray[i];

                            var $newDiv = $("<div class='input-group' style='margin-bottom :2px'>" + counter + ".  Rights holder  </div>");
                            var $newInput = $('<input placeholder="Rights holder name" disabled="" type="text" value="' + name + '"  > ');
                            $newInput
                                    .attr("name", "rightsHoldersName" + i)
                                    .attr("id", "name" + i)
                                    .addClass("text wsp");
                            $newInput.appendTo($newDiv);
                            $newDiv.appendTo($("#RightsHolderGeneratedForm"));

                        }
                    } else {

                    }
                });
            });
        </script>



        <!--copyFirstRightsHolderName-->
        <script>
            function  copyFirstRightsHolderName() {

                console.log("123v copyFirstRightsHolderName addAdditionalRightsHolders length  ", rightsHolderArray.length);

                if (rightsHolderArray.length === 0) {
                    var fn = document.getElementById("rightsHoldersName0");
                    document.getElementById("firstRightsHolder0").value = fn.value;
                    Name = fn.value;
                    console.log("copyFirstRightsHolderName Name ", Name);
                    rightsHolderArray.push(Name);
                    console.log(" first entry in rightsHolderArray ", fn.value);
                }

                if (!localStorage.rightsAgreementContent === 0) {
                    //function retrieve(){
                    document.getElementById("rightsAgreementContracts").innerHTML = localStorage.getItem("rightsAgreementContent");
                    console.log("copyFirstRightsHolderName localStorage.rightsAgreementContent ", localStorage.rightsAgreementContent.length);
                    for (i = 0; i < translatorContent.length; i++) {
                        console.log("restored rightsAgreementContent " + rightsAgreementContent);
                    }
                }


                // back To Translators tab
//                $('#bs-example-navbar-collapse-2 a[href="#Rights"]').tab('show');
            }
        </script>

        <!--backToRightsAgreement-->
        <script>
            function backToRightsAgreement() {
//                alert("backToRightsAgreement");

                $("#addAddRightsHolders").empty();

                console.log("123v backToRightsAgreement rightsHolderArray  ", rightsHolderArray);

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



                console.log("123v2 backToRightsAgreement translationrightsholdercounter  ", translationrightsholdercounter);
                for (var i = 2; i < translationrightsholdercounter; i++) {
                    console.log("123v2 backToRightsAgreement rightsHolderArray ", rightsHolderArray);
                    var nr = "name" + i;
                    console.log("backToRightsAgreement nr ", nr);
                    var item = document.getElementById(nr);
                    itemValue = item.value;
                    console.log("123v2  backToRightsAgreement nr " + nr + " itemValue " + itemValue);
                    //only push itemValue with a value and not already in array
                    if (itemValue !== "") {
                        if (rightsHolderArray.includes(itemValue)) {
                            console.log("123v2 backToRightsAgreement excluding  ", itemValue);
                        } else {
                            console.log("123v2 backToRightsAgreement push itemValue ", itemValue);
                            rightsHolderArray.push(itemValue);
                            console.log("123v2 backToRightsAgreement next entry in translatorArray ", itemValue);
                        }
                    }
                }

                // Switch off "Add more translators"
                $('#addAdditionalRightsHoldersModalDiv').toggle();

                // Change Title from "Translation rights holder" to "Translation rights holder(s)"
                document.getElementById("rightsHoldersNameLabel").innerHTML = 'Translation rights holders';

                // Disable first Translation rights holder name input element
                document.getElementById("rightsHoldersName0").readonly = 'true';
                document.getElementById("rightsHoldersName0").style.display = "none";

                // Display all TranslatorrightsHolder input element each
                for (var i = 0; i < rightsHolderArray.length; i++) {

                    var additionalTranslatorTag = '';
                    console.log("LOOP rightsHolderArray " + rightsHolderArray[i]);

                    additionalTranslatorTag += '<div class="form-group has-feedback">';
                    additionalTranslatorTag += ' <input id="rightsHoldersName' + i;
                    additionalTranslatorTag += ' type="text"  ';
                    additionalTranslatorTag += 'class="form-control"';
                    additionalTranslatorTag += 'name="rightsHoldersName' + i + '"';
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
//                $('#bs-example-navbar-collapse-2 a[href="#Rights"]').tab('show');
// on load of the page: switch to the currently selected tab
                var hash = window.location.hash;
                console.log("window.location.hash " + hash);
                $('#myTab a[href="' + hash + '"]').tab('show');


                // if we have a final list of translators (more than one)
                // we need to clear a possible existing tab first
//                generateTranslatorTab(0);
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
                    rightsAgreementContractsNavContent += '<label for="label_translator' + j + '" class="control-label pull-left" >Upload a copy of ' + translatorArray[i] + '\'s CV:</label>';
                    rightsAgreementContractsNavContent += '<br>';
                    rightsAgreementContractsNavContent += ' <small class="pull-left" style="margin-bottom: 10px">this should include a list of previous published literary translations</small>';
                    rightsAgreementContractsNavContent += '<div class="input-group translatorcv pull-left" style="margin-bottom: 40px;">';
                    rightsAgreementContractsNavContent += '<label class="btn btn-default btn-file pull-left">';
                    rightsAgreementContractsNavContent += 'Select file ';
                    rightsAgreementContractsNavContent += '<input multiple="" name="file" id="translator_cv' + j + '" type="file">';
                    rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                    rightsAgreementContractsNavContent += '</label>';
                    rightsAgreementContractsNavContent += '<input  type="text" id="label_translator' + j + '" class="pull-left">';
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
                    rightsAgreementContractsNavContent += 'Select file <input type="file" onchange="generatedLabels()"  id="contract' + j + '">';
                    rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                    rightsAgreementContractsNavContent += '</label>';
                    rightsAgreementContractsNavContent += '<input  type="text" id="label_contract' + j + '" class="pull-left"/>';
                    rightsAgreementContractsNavContent += '<input type="hidden" value="Contract" name="destination" id="contract_upload' + j + '"/>';
                    rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                    rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 

                    rightsAgreementContractsNavContent += '</div  class="container EndwrapperContainer">'; // <!--container-->
                    rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"

                }

//                show translatorTabs if hidden
                if ($(translatorTabs).css('display') === 'none' || $(translatorTabs).css("visibility") === "hidden") {
                    $(translatorTabs).show();
                }

                $(rightsAgreementContractsNavContent).appendTo('#tnc');

            }
        </script>

        <!--backToTranslators-->
        <script>
            function backToTranslators() {
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
                    var item = document.getElementById(nr);
                    itemValue = item.value;
                    translatorArray.push(itemValue);
                    console.log("backToTranslators next entry in translatorArray ", itemValue);
                    var moreUploadTag = '';
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
                    moreUploadTag += '<input  type="text" id="label_translator' + upload_number + '" class="pull-left">';
                    moreUploadTag += '<br>';
                    moreUploadTag += '<br>';
                    moreUploadTag += '<input id="translator_cv_upload' + upload_number + '" value="Translator_CV" name="destination" type="hidden">';
                    moreUploadTag += '</div>';
                    moreUploadTag += '</div>';
                    $(moreUploadTag).appendTo('#additionalTranslator');
                    upload_number++;
                }

                $('#bs-example-navbar-collapse-1 a[href="#Translator"]').tab('show');
                $('#addTranslatorModalDiv').toggle();
                // Change Title from "Translator" to "Translators"
                document.getElementById("translatorNameLabel").innerHTML = 'Translators';
                // Disable first Translator input element
                document.getElementById("translatorName").readonly = 'true';
                //Display all Translators in input element each
                for (var i = 1; i < translatorArray.length; i++) {
                    console.log("backToTranslators translatorArray " + translatorArray[i]);
                    var additionalTranslatorTag = '';
                    additionalTranslatorTag += '<div class="form-group has-feedback">';
                    additionalTranslatorTag += ' <input id="translatorName"  ';
                    additionalTranslatorTag += 'type="text"  ';
                    additionalTranslatorTag += 'class="form-control"';
                    additionalTranslatorTag += 'name="translatorName"';
                    additionalTranslatorTag += 'value="' + translatorArray[i] + '"';
                    additionalTranslatorTag += 'readonly = true';
                    additionalTranslatorTag += '</div>';
                    $(additionalTranslatorTag).appendTo('#addTransl');
                }

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

                var rightsAgreementContractsNavContent = '';

                for (var i = 0; i < translatorArray.length; i++) {

                    var j = i + 1;
                    if (i === 0) {

                        rightsAgreementContractsNavContent += '<div class="tab-pane fade in active" id="tn' + j + '">';
                    } else {

                        rightsAgreementContractsNavContent += '<div class="tab-pane fade" id="tn' + j + '">';
                    }

                    //  --container--
                    rightsAgreementContractsNavContent += '<div class="container wrapperContainer">';

                    //Upload a copy of the agreement with the translation rights holder
                    rightsAgreementContractsNavContent += '<div class="col-md-10"   style="margin-bottom: 10px">';
                    rightsAgreementContractsNavContent += '<div  style="margin-bottom: 40px;margin-top: 30px"> <strong class="pull-left">Upload a copy of the agreement with the translation rights holder' + j + '</strong> <small class="pull-left"> &nbsp;  (where applicable)</small> </div>';
                    rightsAgreementContractsNavContent += '<br/>';
                    rightsAgreementContractsNavContent += '<div class="margin-bottom: 40px"></div>';
                    rightsAgreementContractsNavContent += '<div class="input-group agreement"  style="margin-bottom: 40px;">';
                    rightsAgreementContractsNavContent += '<label class="btn btn-default btn-file pull-left">';
                    rightsAgreementContractsNavContent += 'Select file <input type="file"  name="file" id="agreement' + j + '">';
                    rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                    rightsAgreementContractsNavContent += '</label>';
                    rightsAgreementContractsNavContent += '<input  type="text"  id="label_agreement' + j + '" class="pull-left"/>';
                    rightsAgreementContractsNavContent += '<input type="hidden" value="Agreement" name="destination" id="agreement_upload' + j + '"/>';
                    rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                    rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-10" 


                    //Upload a copy of the contract with

                    rightsAgreementContractsNavContent += '<div class="col-md-9" style="margin-bottom: 10px">';
                    rightsAgreementContractsNavContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left">Upload a copy of the contract with ' + translatorArray[i] + '</strong></div>';
                    rightsAgreementContractsNavContent += '<br/>';
                    rightsAgreementContractsNavContent += '<div class="margin-bottom: 40px"></div>';
                    rightsAgreementContractsNavContent += '<div class="input-group contract"  style="margin-bottom: 40px;">';
                    rightsAgreementContractsNavContent += '<label class="btn btn-default btn-file pull-left">';
                    rightsAgreementContractsNavContent += 'Select file <input type="file"  name="file" id="contract' + j + '">';
                    rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                    rightsAgreementContractsNavContent += '</label>';
                    rightsAgreementContractsNavContent += '<input  type="text"  id="label_contract' + j + '" class="pull-left"/>';
                    rightsAgreementContractsNavContent += '<input type="hidden" value="Contract" name="destination" id="contract_upload' + j + '"/>';
                    rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                    rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 


                    //Upload form for addendum to the rights agreement

                    rightsAgreementContractsNavContent += '<div class="col-md-12" style="margin-bottom: 10px">';
                    rightsAgreementContractsNavContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left">Upload a copy of the addendum to the rights agreement ' + translatorArray[i] + '</strong> <small class="pull-left"> &nbsp;  (where applicable)</small></div>';
                    rightsAgreementContractsNavContent += '<br/>';
                    rightsAgreementContractsNavContent += '<div class="margin-bottom: 40px"></div>';
                    rightsAgreementContractsNavContent += '<div class="input-group addendum"  style="margin-bottom: 40px;">';
                    rightsAgreementContractsNavContent += '<label class="btn btn-default btn-file pull-left">';
                    rightsAgreementContractsNavContent += 'Select file <input type="file"  name="file" id="addendum' + j + '">';
                    rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                    rightsAgreementContractsNavContent += '</label>';
                    rightsAgreementContractsNavContent += '<input  type="text"  id="label_addendum' + j + '" class="pull-left"/>';
                    rightsAgreementContractsNavContent += '<input type="hidden" value="Contract" name="destination" id="addendum_upload' + j + '"/>';
                    rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                    rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-12" 

                    rightsAgreementContractsNavContent += '</div  class="container EndwrapperContainer">'; // <!--container-->
                    rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"
                }

//                $(rightsAgreementContractsNavContent).appendTo('#tnc');
                $("#translatorArray").val(translatorArray);

            }
        </script>

        <!-- add Press Cuttings -->
        <script type="text/javascript">
            $(document).ready(function () {
                pressCuttingCounter = 1;
                $("#pressCutting").click(function (event) {
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
                    //           console.log("backToMisc()   ");
                    var nr = "name" + i;
                    var item = document.getElementById(nr);
                    var itemValue = item.value;
                    pressCuttingArray.push(itemValue);
                    var moreUploadTag = '';
                    moreUploadTag += '<div class="col-md-8" style="margin-bottom: 20px">';
                    moreUploadTag += '<label for="label_pressCuttings' + upload_number + '" class="control-label pull-left" id="123">Upload a copy of ' + itemValue + '\'s CV: </label>';
                    moreUploadTag += '<br>';
                    moreUploadTag += ' <small class="pull-left" style="margin-bottom: 10px">this should include a list of previous published literary translations</small>';
                    moreUploadTag += '<div class="input-group translatorcv pull-left" style="margin-bottom: 40px;">';
                    moreUploadTag += '<label class="btn btn-default btn-file pull-left">';
                    moreUploadTag += 'Select file ';
                    moreUploadTag += '<input multiple="" name="file" id="translator_cv' + upload_number + '" type="file">';
                    moreUploadTag += '<span class="glyphicon glyphicon-folder-open"></span>';
                    moreUploadTag += '</label>';
                    moreUploadTag += '<input id="label_pressCuttings' + upload_number + '" class="pull-left">';
                    moreUploadTag += '<br>';
                    moreUploadTag += '<br>';
                    moreUploadTag += '<input id="translator_cv_upload' + upload_number + '" value="pressCuttings" name="destination" type="hidden">';
                    moreUploadTag += '</div>';
                    moreUploadTag += '</div>';
                    $(moreUploadTag).appendTo('#additionalTranslator');
                    upload_number++;
                }

                $('#bs-example-navbar-collapse-1 a[href="#Misc"]').tab('show');
                var arrayLength = pressCuttingArray.length;
                for (var i = 0; i < arrayLength; i++) {
                }
                $("#pressCuttingArray").val(pressCuttingArray);
            }
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
                //Set all filled input fields to readOnly
                //so only empty ones can be filled in!!!

                var emptyTextBoxes = $('input:text').filter(function () {
                    return (this.value !== "" || this.value.length !== 0);
                });
                var string = "The following input fields have been marked readonly - \n";

                emptyTextBoxes.each(function () {
                    string += "\n" + this.id;
                    document.getElementById(this.id).readOnly = true;
                });
                console.log("7 xyz ", string);

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



        <style>
            .coverBackgroundImage
            {
                background-image:<c:url value="../images/not-available.jpg" />;
                width: 100%;
                height: auto;
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

            .checkbox label input[type="checkbox"]:readonly + .cr,
            .radio label input[type="radio"]:readonly + .cr {
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

            .highlightHeader {
                background:yellow;
                /*      background-color:#d9d1d1;*/
            }
            .modal {
                overflow-y:auto;
                text-align: center;
            }

            #addAdditionalRightsHoldersModal{
                width: 400px;

                top: 50%;
                left: 50%;
                margin-top: -90px;
                margin-left: -200px;
                padding: 20px;               

            }
            /* Set whitespace between the generated input fields*/
            input.wsp{

                margin-right: 5px;
            }
            .modal-footer {  

                background: #81ccfb;
                padding: 1em;
                position: absolute;
                left: 0;
                right: 0;
                bottom: 0;
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
                border-bottom: 1px solid #d45500; 
            }
            .nav-tabs > li > a {
                background: #DADADA;
                border-radius: 0;
                box-shadow: inset 0 -8px 7px -9px rgba(0,0,0,.4),-2px -2px 5px -2px rgba(0,0,0,.4);
                color: #575757;
            }
            .nav-tabs > li.active > a,
            .nav-tabs > li.active > a:hover {
                background: #F5F5F5;
                box-shadow: inset 0 0 0 0 rgba(0,0,0,.4),-2px -3px 5px -2px rgba(0,0,0,.4);
                border-color: #d45500;
                border-bottom-color: transparent;
                color: #3c5a78;
                font-size: 16px;
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
            .mytab .tab-pane{ border:solid 1px blue;  border-top: 0;    }
            #myTab li a { border-color: blue;background-color:#A5C967; }
            #myTab li.active a {border-bottom-color: transparent;background-color:Yellow; }
            .my-tab .tab-pane{ border:solid 1px blue;  border-top: 0; background-color:#F7EFC6;}
            
                        
            .scroll-top-wrapper {
                position: fixed;
                opacity: 0;
                visibility: hidden;
                overflow: hidden;
                text-align: center;
                z-index: 99999999;
                background-color: #777777;
                color: #eeeeee;
                width: 50px;
                height: 48px;
                line-height: 48px;
                right: 30px;
                bottom: 30px;
                padding-top: 2px;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
                border-bottom-left-radius: 10px;
                -webkit-transition: all 0.5s ease-in-out;
                -moz-transition: all 0.5s ease-in-out;
                -ms-transition: all 0.5s ease-in-out;
                -o-transition: all 0.5s ease-in-out;
                transition: all 0.5s ease-in-out;
            }
            .scroll-top-wrapper:hover {
                background-color: #888888;
            }
            .scroll-top-wrapper.show {
                visibility:visible;
                cursor:pointer;
                opacity: 1.0;
            }
            .scroll-top-wrapper i.fa {
                line-height: inherit;
            }

        </style>


        <script type="text/javascript">
            // https://github.com/mgcrea/angular-strap/issues/1343
            var modal_counter = 0;
            $(document).ready(function () {
                $('.modal').on('shown.bs.modal', function () {
                    modal_counter++;
                });
                $('.modal').on('hidden.bs.modal', function () {
                    modal_counter--;
                    if (modal_counter) {
                        $('body').addClass('modal-open');
                    } else {
                        $('body').removeClass('modal-open');
                    }
                });
            })
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

                //copyFirstTranslatorName();
                generateTranslatorTab(1);
            }

        </script>

        <!--formatDate-->
        <script type="text/javascript">

            function formatDate(unformattedDate) {
                if (typeof unformattedDate === "undefined") {
                    formattedDate === "";
                } else {
                    var date = new Date(unformattedDate);
                    var day = date.getDate();
                    console.log("9 xyz day  " + day);
                    if (day < 10)
                        day = "0" + day;
                    var month = date.getMonth() + 1;
                    console.log("9 xyz month  " + month);
                    if (month < 10)
                        month = "0" + month;
                    var year = date.getFullYear();
                    var formattedDate = day + "/" + month + "/" + year;

                    console.log("9 xyz unformattedDate  " + unformattedDate);
                    console.log("9 xyz day  " + day);
                    console.log("9 xyz month  " + month);
                    console.log("9 xyz year  " + year);
                    console.log("9 xyz formattedDate  " + formattedDate);


                    return formattedDate;
                }
            }
        </script>


    </head>

    <body style="height: 100%">

        <sql:query var="applicationQuery" dataSource="jdbc/ILGAS">
            SELECT * FROM GrantApplication
            WHERE GrantApplication.Status = 'open' 
            AND publisherID = ?;
            <sql:param value="${publisherID}"/>
        </sql:query>
        <c:set var="applicationDetails" value="${applicationQuery.rows[0]}"/>

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

                <h1 align="center" style="align-content: center">Translation Grant Application System for Literature Ireland</h1>

                <div class="container-fluid" style="margin-bottom: 20px"></div>

                <!-- Main Grid Container -->  
                <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                    <h3 align="center" style="align-content: center">Display open applications</h3>
                    <br/>

                    <!--Application-->
                    <div class="tab-pane fade  active in" id="Application">
                        <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                            <!-- Main Grid -->  
                            <div class="table-responsive">
                                <table id="applications" class="table display table-striped table-bordered  dt-responsive nowrap" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="details-control"></th>   
                                            <th class="never">Application<br/>  No</th>
                                            <th class="never">Application<br/>  Year</th>
                                            <th class="all">Reference<br/>  No</th>
                                            <th class="never">Publisher</th>       
                                            <th class="never">Agreement</th>
                                            <th class="never">Contract</th>
                                            <th class="never">Proposed<br/> Date of <br/> Publication</th>
                                            <th class="never">Proposed<br/> Print Run</th>
                                            <th class="never">Planned Page <br/>  Extent</th>
                                            <th class="never">Translator<br/> CV</th>
                                            <th class="never">Number<br/> Pages</th>
                                            <th class="never">Break-down of <br/> Translator fee</th>
                                            <th class="never">Translator  <br/> Fee</th>
                                            <th class="never">Notes</th>
                                            <th class="never">Status</th>
                                            <th class="never">Copies <br/> Sent</th>
                                            <th class="never">Date Copies  <br/> Were Sent</th>
                                            <th class="never">Copies of  <br/> Translation Sample</th>
                                            <th class="never">T&C has been <br/> Accepted</th>
                                            <th class="never">Approved</th> 
                                            <th class="never">Genre</th>   
                                            <th class="never"></th>
                                            <th class="never">Expert Reader</th>
                                            <th class="all">Book Title</th>
                                            <th class="never">24Translator Titles</th>
                                            <th class="never">25 Titles</th>
                                            <th class="never">26 Translator CV Doc Name</th>
                                            <th class="never">27 Cover</th>
                                            <th class="never">28 Sample Sent Out</th>
                                            <th class="never">29 Sample Returned</th>
                                            <th class="never">30 Reader Report</th>
                                            <th class="never">31 Expert Reader List</th>
                                            <th class="never">32 Unassigned Expert Reader List</th>    
                                            <th class="never">33 idTranslator</th>
                                            <th class="never">34 Original Date of Publication</th>
                                            <th class="never">35 Original Language</th>
                                            <th class="never">36 Page Extent <br/>(of the original)</th>
                                            <th class="never">37 Country of Publication</th>    
                                            <th class="never">38 Foreign Publisher</th>
                                            <th class="never">39 Foreign Country</th>
                                            <th class="never">Target Language</th>
                                            <th class="never">Board Meeting</th>
                                            <th class="never">Amount Requested</th>
                                            <th class="never">Amount Approved</th>
                                            <th class="never">Publisher informed of Meeting</th>
                                            <th class="never">Board Comments/Instructions</th>
                                            <th class="never">Contract Sent to Publisher</th>
                                            <th class="never">Acknowledgement Approved</th>
                                            <th class="never">Date Published Books Received</th>    
                                            <th class="never">Date Payment made to Publisher</th>
                                            <th class="never">Payment Reference Number</th>
                                            <th class="never">Addendum</th>
                                            <th class="never">Addendum Name</th>
                                            <th class="never">Proof of Payment</th>    
                                            <th class="never">Proof of Payment Name</th>
                                            <th class="never">Bank Details</th>
                                            <th class="never">Bank Details Name</th>    
                                            <th class="never">Signed LI Contract</th>
                                            <th class="never">Signed LI ContractName</th>
                                            <th class="never">Payment Status</th>
                                            <th class="never">Previous Grant Aid</th>
                                            <th class="never">Award</th>    
                                            <th class="never">Sales Figures</th>
                                            <th class="never">Original</th>
                                            <th class="never">Original Name</th>
                                            <th class="all">Author(s)</th>
                                            <th class="never"></th>                                            
                                            <th class="never"></th>
                                            <th class="never"></th>
                                            <th class="never"></th>
                                            <th class="never"></th>
                                            <th class="never"></th>
                                            <th class="never"></th>
                                        </tr>
                                    </thead>

                                    <tfoot>
                                        <tr>
                                            <th class="details-control"></th>   
                                            <th class="never">Application<br/>  No</th>
                                            <th class="never">Application<br/>  Year</th>
                                            <th class="all">Reference<br/>  No</th>
                                            <th class="never">Publisher</th>       
                                            <th class="never">Agreement</th>
                                            <th class="never">Contract</th>
                                            <th class="never">Proposed<br/> Date of <br/> Publication</th>
                                            <th class="never">Proposed<br/> Print Run</th>
                                            <th class="never">Planned Page <br/>  Extent</th>
                                            <th class="never">Translator<br/> CV</th>
                                            <th class="never">Number<br/> Pages</th>
                                            <th class="never">Break-down of <br/> Translator fee</th>
                                            <th class="never">Translator  <br/> Fee</th>
                                            <th class="never">Notes</th>
                                            <th class="never">Status</th>
                                            <th class="never">Copies <br/> Sent</th>
                                            <th class="never">Date Copies  <br/> Were Sent</th>
                                            <th class="never">Copies of  <br/> Translation Sample</th>
                                            <th class="never">T&C has been <br/> Accepted</th>
                                            <th class="never">Approved</th> 
                                            <th class="never">Genre</th>   
                                            <th class="never"></th>
                                            <th class="never">Expert Reader</th>
                                            <th class="all">Book Title</th>
                                            <th class="never">24Translator Titles</th>
                                            <th class="never">25 Titles</th>
                                            <th class="never">26 Translator CV Doc Name</th>
                                            <th class="never">27 Cover</th>
                                            <th class="never">28 Sample Sent Out</th>
                                            <th class="never">29 Sample Returned</th>
                                            <th class="never">30 Reader Report</th>
                                            <th class="never">31 Expert Reader List</th>
                                            <th class="never">32 Unassigned Expert Reader List</th>    
                                            <th class="never">33 idTranslator</th>
                                            <th class="never">34 Original Date of Publication</th>
                                            <th class="never">35 Original Language</th>
                                            <th class="never">36 Page Extent <br/>(of the original)</th>
                                            <th class="never">37 Country of Publication</th>    
                                            <th class="never">38 Foreign Publisher</th>
                                            <th class="never">39 Foreign Country</th>
                                            <th class="never">Target Language</th>
                                            <th class="never">Board Meeting</th>
                                            <th class="never">Amount Requested</th>
                                            <th class="never">Amount Approved</th>
                                            <th class="never">Publisher informed of Meeting</th>
                                            <th class="never">Board Comments/Instructions</th>
                                            <th class="never">Contract Sent to Publisher</th>
                                            <th class="never">Acknowledgement Approved</th>
                                            <th class="never">Date Published Books Received</th>    
                                            <th class="never">Date Payment made to Publisher</th>
                                            <th class="never">Payment Reference Number</th>
                                            <th class="never">Addendum</th>
                                            <th class="never">Addendum Name</th>
                                            <th class="never">Proof of Payment</th>    
                                            <th class="never">Proof of Payment Name</th>
                                            <th class="never">Bank Details</th>
                                            <th class="never">Bank Details Name</th>    
                                            <th class="never">Signed LI Contract</th>
                                            <th class="never">Signed LI ContractName</th>
                                            <th class="never">Payment Status</th>
                                            <th class="never">Previous Grant Aid</th>
                                            <th class="never">Award</th>    
                                            <th class="never">Sales Figures</th>
                                            <th class="never">Original</th>
                                            <th class="never">Original Name</th>
                                            <th class="all">Author(s)</th>
                                            <th class="never"></th>
                                            <th class="never"></th>
                                            <th class="never"></th>
                                            <th class="never"></th>
                                            <th class="never"></th>
                                            <th class="never"></th>
                                            <th class="never"></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <!-- Main Grid -->   
                                    </tbody>
                                </table>
                            </div> <!-- Main Grid -->       

                        </div> <!-- container-fluid -->  
                    </div> <!-- tab-pane "Application" -->     

                    <c:if test="${not empty error}">Error: ${error}</c:if>

                    </div> <!-- container-fluid -->

                    <div class="modal fade" id="applicationsModal" data-modal-index="1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #c3bcbc">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title">Add details to application <span id="appReferenceNumber"></span></h4>
                                </div>

                                <!-- modal-body -->
                                <div class="modal-body" style="background-color: #d9d1d1">

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
                                            <div class="collapse navbar-collapse" id="myTab"  style="font-size: 0.8em !important;  background-color: #d9d1d1">
                                                <ul class="nav navbar-nav nav-tabs two-lines">
                                                    <li class="active"><a href="#Contact" data-toggle="tab">Contact <br/>Details</a></li>
                                                    <li><a href="#books" data-toggle="tab">Book<br/> Details</a></li>                                                    
                                                    <li><a href="#Publication" data-toggle="tab">Publication<br/>  Details</a></li>
                                                    <li><a href="#Translator" data-toggle="tab">Translator's <br/> Details</a></li>
                                                    <li><a href="#Rights" data-toggle="tab">Rights Agreement <br/> & Contracts </a></li>
                                                    <!--              <li><a href="#Misc" data-toggle="tab">Misc</a></li>  -->
                                                    <li><a href="#Original" data-toggle="tab"><span>Original Work<br/>& Sample Translation</span></a></li>
                                                </ul>
                                            </div><!-- /.navbar-collapse -->

                                            <form  method="POST" id="applicationForm" name="applicationForm" action="${pageContext.request.contextPath}/OpenApplicationServlet" enctype="multipart/form-data">
                                            <%request.getSession().setAttribute("task", "openApplications");%>
                                            <div id="applicationEditForm-tab-content" class="tab-content"  style="background-color: #E8F6FF">


                                                <!-- Contact details -->
                                                <div class="tab-pane active" id="Contact">

                                                    <!--wrapper for Contact tab pane-->
                                                    <div class="container-fluid">

                                                        <!--first row-->
                                                        <!--get Company and Company_Number via autocomplete-->
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-6">
                                                                <input  id="company" 
                                                                        name="company" 
                                                                        type="text" 
                                                                        value="${publisherName}"
                                                                        data-toggle="tooltip"
                                                                        title="Please Enter your Company's Name - if it does not show up please fill in the form"
                                                                        class="form-control"
                                                                        placeholder="Company Name"
                                                                        readonly
                                                                        >
                                                            </div>

                                                            <div class="col-sm-4">        
                                                                <input id="Company_Number"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Company_Number"                                
                                                                       value="${publisherID}"                                   
                                                                       placeholder="internal Company Number"
                                                                       readonly
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <!--second row-->
                                                        <div class="row" style="margin-bottom: 10px">
                                                            <div class="col-sm-6">
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
                                                            <div class="col-sm-6">
                                                                <label class="pull-left">Address2</label>
                                                                <input id="Address2"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Address2"                                
                                                                       value="${companyDetails.Address2}"                                
                                                                       placeholder="Address2"
                                                                       >
                                                            </div>

                                                            <div class="col-sm-5">
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
                                                            <div class="col-sm-6">
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
                                                            <div class="col-sm-6">      
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
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <!--sixth row-->
                                                        <div class="row" style="margin-bottom: 10px">
                                                            <div class="col-sm-6"></div>
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
                                                            <div class="col-sm-6">
                                                                <label class="pull-left">Email</label>
                                                                <input id="Email"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Email"                                
                                                                       value="${companyDetails.Email}"                                
                                                                       placeholder="Main Email"
                                                                       >
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <label class="pull-left">Website</label>
                                                                <input id="WWW"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="WWW"                                
                                                                       value="${companyDetails.WWW}"                                
                                                                       placeholder="Web Address"
                                                                       >
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
                                                        <input type="hidden" id="authorArray" name="authorArray" >
                                                        <input type="hidden" id="ReferenceNumber" name="ReferenceNumber" >
                                                        <input type="hidden" id="translatorArray" name="translatorArray" >
                                                        <input type="hidden" id="rightsHolderArray" name="rightsHolderArray" >
                                                        <!--keep in one line otherwise placeholder doesn't show-->
                                                        <textarea id="companyNotes"  class="form-control" style="width: 870px; height: 343px;" name="companyNotes" placeholder="enter optional notes"> <c:out value="${companyDetails.Notes}" /></textarea>

                                                    </div> <!--container-->
                                                </div> <!-- tab-pane "Contact" -->

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
                                                                        <div class="col-sm-8">    

                                                                            <label for="authors" class="pull-left">Author(s)</label><br/>
                                                                            <div class="form-group">

                                                                                <textarea class="form-control" id="authors" readonly name="authors" ></textarea>
                                                                                <!--       <input id="aFirstName"                                
                                                                                      type="text"                                
                                                                                      class="form-control"                                
                                                                                      name="AuthorFirstName"                                
                                                                                      value=""    
                                                                                      placeholder="Author First Name"
                                                                                      >
                                                                               <i class="glyphicon glyphicon-search form-control-feedback"></i>-->
                                                                            </div>  <!-- input-group -->
                                                                        </div>
                                                                    </div> <!--row-->




                                                                    <!--Second row-->
                                                                    <div class="row" style="margin-bottom: 15px">

                                                                        <div class="col-sm-5">    
                                                                            <label for="appBookTitle" class="pull-left">Title<br/> &nbsp;</label> 
                                                                            <input id="appBookTitle"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="appBookTitle"                                
                                                                                   value=""    
                                                                                   placeholder="Title"
                                                                                   >
                                                                        </div>
                                                                        <input type="hidden" id="bookTitle" name="bookTitle" >
                                                                        <div class="col-sm-4">          
                                                                            <label for="foreignPublisher" class="pull-left">Publisher (of the original)<br/> &nbsp;</label>                                                           
                                                                            <input id="foreignPublisher"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="foreignPublisher"                                
                                                                                   value="${companyDetails.Company}"    
                                                                                   placeholder="Publisher"
                                                                                   >                                                     
                                                                        </div>

                                                                        <!--                                                                        <div class="col-sm-3">    
                                                                                                                                                    <label for="publicationYear" class="control-label pull-left">Year of Publication<br/> (of the original) </label>
                                                                        
                                                                                                                                                    <input id="publicationYear"                                
                                                                                                                                                           type="text"                                
                                                                                                                                                           class="form-control"                                
                                                                                                                                                           name="publicationYear"                                
                                                                                                                                                           value=""    
                                                                                                                                                           placeholder="Publication Year"
                                                                                                                                                           >
                                                                                                                                                </div>-->
                                                                    </div> <!--row-->


                                                                    <!--Third row-->

                                                                    <div class="row" style="margin-bottom: 10px">

                                                                        <div class="col-sm-4">    
                                                                            <div class="form-group has-feedback">
                                                                                <label for="appGenre" class="pull-left">Genre</label>
                                                                                <input id="appGenre"                                
                                                                                       type="text"                                
                                                                                       class="form-control"                                
                                                                                       name="genre"                                
                                                                                       value=""    
                                                                                       placeholder="Genre"
                                                                                       >
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!--Fourth row-->
                                                                    <div class="row" style="margin-bottom: 10px">

                                                                        <div class="col-xs-8">

                                                                            <div class="row">

                                                                                <div class="col-xs-6">
                                                                                    <div class="mini-box">
                                                                                        <div class="form-group has-feedback">
                                                                                            <label for="appLanguageOriginal" class="pull-left" >Language <br/>(of the original)</label>
                                                                                            <input id="appLanguageOriginal"                                
                                                                                                   type="text"                                
                                                                                                   class="form-control"                                
                                                                                                   name="languageOfTheOriginal"                                
                                                                                                   value=""    
                                                                                                   placeholder="Language"

                                                                                                   >
                                                                                        </div>
                                                                                    </div>
                                                                                </div> <!--col-xs-6-->

                                                                                <div class="col-xs-6" style="margin-bottom: 20px">
                                                                                    <div class="mini-box">
                                                                                        <label for="appCountryOfPublication" class="control-label pull-left" >Country of publication <br/>(of the original)</label>
                                                                                        <input id="appCountryOfPublication"                                
                                                                                               type="text"                                
                                                                                               class="form-control"                                
                                                                                               name="appCountryOfPublication"                                
                                                                                               value=""    
                                                                                               placeholder="Country of Publication"
                                                                                               >
                                                                                    </div>
                                                                                </div> <!--col-xs-6-->
                                                                            </div> <!--row-->

                                                                            <div class="row">

                                                                                <div class='col-sm-6'  style="margin-bottom: 40px;">                                                
                                                                                    <label for="originalPageExtent" class="control-label pull-left">Page extent of the <br/> (of the original): </label>
                                                                                    <div class="input-group pull-left"  style="margin-bottom: 40px;">
                                                                                        <span class="input-group-addon" id="sizing-addon3">  
                                                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                                                        </span>
                                                                                        <input type="text" name="originalPageExtent" id="originalPageExtent" class="form-control" placeholder="number of pages" aria-describedby="sizing-addon3">
                                                                                    </div>
                                                                                </div>
                                                                            </div> <!--row-->
                                                                        </div><!--col-xs-8-->
                                                                    </div> <!-- row-->


                                                                    <!--Eigthrow-->

                                                                    <div class="row" style="margin-bottom: 10px">

                                                                        <div class="col-sm-4">   
                                                                            <label for="bookNotes" class="pull-left">Notes</label>
                                                                            <div class="form-group">
                                                                                <textarea class="form-control" id="bookNotes" name="bookNotes" style="width: 600px; height: 215px" placeholder="Notes"></textarea>
                                                                            </div>
                                                                        </div>                                                    
                                                                    </div> <!-- row  -->

                                                                </div>  <!-- panel-body-->     
                                                            </div>  <!-- panel --> 

                                                        </div> <!-- row  -->

                                                    </div>  <!-- container-fluid  -->

                                                </div><!-- tab-pane "Book" -->

                                                <!-- Publication Details -->
                                                <div class="tab-pane" id="Publication">
                                                    <p class="header1" style="margin-bottom: 40px">
                                                        Publication Details
                                                    </p>

                                                    <div class="container-fluid">
                                                        <div class="col-xs-12 content">

                                                            <div class="row">


                                                                <div class='col-sm-4'>
                                                                    <label for="proposedDateOfPublication" class="control-label pull-left">Proposed date of publication</label>
                                                                    <div class="input-group pull-left"   style="margin-bottom: 40px;">
                                                                        <input type="text" name="proposedDateOfPublication" id="proposedDateOfPublication" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                        <label class="input-group-addon" for="proposedDateOfPublication">
                                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                                        </label>
                                                                    </div>
                                                                    <script>
                                                                        $("#proposedDateOfPublication").datepicker();
                                                                    </script>
                                                                </div>

                                                            </div> <!-- row -->

                                                            <div class="row">

                                                                <div class='col-md-4'  style="margin-bottom: 40px;">                                                
                                                                    <label for="plannedPageExtent" class="control-label pull-left">Planned page extent of the <br/>  published translation </label>
                                                                    <div class="input-group pull-left"  style="margin-bottom: 40px;">
                                                                        <span class="input-group-addon" id="sizing-addon2">  
                                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                                        </span>
                                                                        <input type="text" name="plannedPageExtent" id="plannedPageExtent" class="form-control" placeholder="number of pages" aria-describedby="sizing-addon2">
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-4 col-md-offset-1">
                                                                    <label for="appForeignCountry" class="control-label pull-left">Foreign Country <br/> &nbsp;</label>
                                                                    <input  id="appForeignCountry" 
                                                                            name="appForeignCountry" 
                                                                            type="text"                                                                
                                                                            class="form-control"     
                                                                            >
                                                                </div>

                                                            </div>  <!-- row -->

                                                            <div class="row">
                                                                <div class='col-sm-4'>
                                                                    <label for="appproposedPrintRun" class="control-label pull-left">Proposed print run </label>
                                                                    <div class="input-group pull-left"  style="margin-bottom: 40px;">
                                                                        <span class="input-group-addon" id="sizing-addon1">  
                                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                                        </span>
                                                                        <input type="text" name="appproposedPrintRun" id="appproposedPrintRun" class="form-control" placeholder="number of books" aria-describedby="sizing-addon1">  
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-4 col-md-offset-1">      
                                                                    <label for="appTargetLanguage" class="control-label pull-left"> Target Language</label>
                                                                    <input id="appTargetLanguage"                                
                                                                           type="text"                                
                                                                           class="form-control"                                
                                                                           name="appTargetLanguage"                                
                                                                           >
                                                                </div>
                                                            </div> <!-- row -->

                                                            <div class="row">

                                                                <div class="col-sm-5" style="margin-bottom: 20px">
                                                                    <label for="translationTitle" class="pull-left">Translation Title<br/> &nbsp;</label>
                                                                    <input id="translationTitle"                                
                                                                           type="text"                                
                                                                           class="form-control"                                
                                                                           name="translationTitle"                                
                                                                           value=""    
                                                                           placeholder="Translation Title"
                                                                           >
                                                                </div>

                                                                <div class="col-xs-5">
                                                                    <div class="mini-box" style="margin-bottom: 20px">
                                                                        <label for="publicationYear1" class="control-label pull-left">Year of Publication<br/> (of the original) </label>
                                                                        <div class="input-group pull-left">
                                                                            <input type="text" 
                                                                                   name="publicationYear1" 
                                                                                   id="publicationYear1" 
                                                                                   class="form-control" 
                                                                                   placeholder="DD/MM/YYYY"
                                                                                   />    
                                                                        </div>
                                                                    </div>
                                                                    <script>
                                                                        $("#appDateOfPublicationOriginal").datepicker();
                                                                    </script>
                                                                </div> <!--col-xs-6-->

                                                            </div> <!-- row -->


                                                            <div class="row">

                                                                <div class="col-xs-5">
                                                                    <div class="mini-box"   style="margin-bottom: 20px">
                                                                        <label for="appCompany" class="pull-left">Translation Publisher</label>
                                                                        <input id="appCompany"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="appCompany"                                
                                                                               value=""    
                                                                               placeholder="Translation Publisher"
                                                                               >
                                                                    </div>
                                                                </div> <!--col-xs-6-->

                                                                <div class="col-xs-5">
                                                                    <div class="mini-box">
                                                                        <div class="form-group has-feedback">
                                                                            <label for="languages" class="pull-left" >Languages</label>
                                                                            <input id="languages"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="languages"                                
                                                                                   value=""    
                                                                                   placeholder="Languages"
                                                                                   >
                                                                            <!--<i class="glyphicon glyphicon-search form-control-feedback"></i>-->
                                                                        </div>
                                                                    </div>
                                                                </div> <!--col-xs-6-->

                                                                <input type="hidden" id="languageArray" name="languageArray" >

                                                            </div> <!-- row -->
                                                            <div class="row">
                                                                <div class="col-xs-4">
                                                                    <div class="mini-box" style="margin-bottom: 20px">
                                                                        <label for="series" class="pull-left" style="margin-top: 10px">Series</label>
                                                                        <input id="series"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="series"                                
                                                                               value=""    
                                                                               placeholder="Series"
                                                                               >
                                                                    </div>
                                                                </div> <!--col-xs-6-->
                                                            </div> <!-- row -->

                                                        </div>  <!-- col-xs-12 content -->
                                                    </div> <!-- container-fluid -->
                                                </div> <!-- tab-pane "Publication Details" -->

                                                <!-- Translator's Details -->
                                                <div class="tab-pane fade" id="Translator"> 
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

                                                            <!--<div class="container-fluid" id="translatorTabs" style="display: none">-->
                                                            <div class="container-fluid" id="translatorTabs" >
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

                                                <!-- Rights Agreement -->
                                                <div class="tab-pane fade" id="Rights">
                                                    <p class="header1" style="margin-bottom: 80px">
                                                        Rights Agreement & Contracts
                                                    </p>

                                                    <div class="container-fluid"  id="rightsAgreementContracts">
                                                        <!--<div class="container-fluid">-->
                                                        <!--<div class="tab-content">-->

                                                        <!--Upload form for agreement-->
                                                        <div class="row" style="margin-bottom: 80px;">
                                                            <div style=" margin: 0 auto; position: relative;">

                                                                <div class="col-md-8"  id="agreementToggle1" style="margin-bottom: 40px; position:absolute; z-index:0;">
                                                                    <!--<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadAgreement1"></strong></div>--> 
                                                                    <label  class="control-label pull-left" id="uploadAgreement1" ></label>
                                                                    <br/>
                                                                    <div class="margin-bottom: 40px"></div>
                                                                    <div class="input-group agreement"  style="margin-bottom: 40px;">
                                                                        <label class="btn btn-default btn-file pull-left">
                                                                            Select file <input type="file" onchange="generatedLabels()" name="Agreement-1" id="agreement1">
                                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                                        </label>
                                                                        <input  type="text" id="label_agreement1" class="pull-left"/>
                                                                        <input type="hidden" value="Agreement" name="destination" id="agreement_upload1"/>
                                                                        <span class="help-block"></span>
                                                                    </div> 
                                                                </div> <!-- position:absolute; z-index:0 -->

                                                                <div class="col-md-7" id="agreement_button1" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> 
                                                                    <label  class="control-label pull-left" id="agreement_button_label1" ></label>
                                                                    <div class="input-group agreement_buttonText pull-left">
                                                                        <a class="btn btn-info btn-file pull-left" role="button" id="agreement_link1" href=""  target="_blank">
                                                                            <span class="glyphicon glyphicon-file"></span>
                                                                            Click to open</a>
                                                                    </div>
                                                                </div> <!-- position:absolute; z-index:1; display:none -->

                                                            </div> <!-- position: relative  -->
                                                            
                                                        </div> <!-- row  -->

                                                        <!--Name of translation rights holder-->
                                                        <div class="row" style="margin-bottom: 40px;margin-top: 60px">  

                                                            <div class="col-sm-6">  
                                                                <div class="input-group has-feedback"  style="margin-bottom: 10px">  
                                                                    <label for="rightsHoldersName0" class="pull-left" id="rightsHoldersNameLabel">Translation rights holder</label>
                                                                    <input id="rightsHoldersName0"                                
                                                                           type="text"                                
                                                                           class="form-control"                                
                                                                           name="rightsHoldersName"                                
                                                                           value=""    

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

                                                        <!--Upload form for addendum to the rights agreement-->
                                                        <div class="row" style="margin-bottom: 80px;">    

                                                            <div style=" margin: 0 auto; position: relative;">

                                                                <div class="col-md-10"  id="addendumToggle1" style="margin-bottom: 40px; position:absolute; z-index:0;">
                                                                    <label  class="control-label pull-left"> <strong class="pull-left"  id="uploadAddendum1"></strong>
                                                                        <small> (where applicable)</small>     
                                                                    </label>
                                                                    <br/>                                                               
                                                                    <div class="input-group addendum  pull-left"  style="margin-bottom: 40px;">
                                                                        <label class="btn btn-default btn-file pull-left">
                                                                            Select file <input type="file" onchange="generatedLabels()" name="Addendum-1" id="addendum1">
                                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                                        </label>
                                                                        <input type="text" id="label_addendum1" class="pull-left"/>
                                                                        <input type="hidden" value="Addendum" name="destination" id="addendum_upload1"/>
                                                                        <span class="help-block"></span>
                                                                    </div> 
                                                                </div> <!-- position:absolute; z-index:0 -->

                                                                <div class="col-md-6" id="addendum_button1" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> 
                                                                    <label class="control-label pull-left" id="addendum_button_label1"></label>
                                                                    <div class="input-group addendum_buttonText pull-left">
                                                                        <a class="btn btn-info btn-file pull-left" role="button" id="addendum_link1" href=""  target="_blank">
                                                                            <span class="glyphicon glyphicon-file"></span>
                                                                            Click to open</a>
                                                                    </div>
                                                                </div> <!-- position:absolute; z-index:1; display:none -->

                                                            </div> <!-- position: relative  -->
                                                        </div> <!-- row  -->
                                                        <div class="col-sm-12" style="min-height: 100%;height: 100%;margin-bottom: 60px"></div>

                                                        <!--</div> tab-content-->
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

                                                                    <!--copies of the original work-->
                                                                    <div class="col-md-9" >
                                                                        <div class="checkbox pull-left">                                                             
                                                                            <label for="copiesSent" class="pull-left"><strong>One copy of the original work<sup>*</sup> sent to Literature Ireland by post</strong></label>
                                                                            <label style="font-size: 2.0em; " class="checkbox-inline  no_indent">
                                                                                <input type="checkbox" 
                                                                                       name="copiesSent" 
                                                                                       id="copiesSent" 
                                                                                       checked =""
                                                                                       value="" 
                                                                                       class="form-control">
                                                                                <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                                                            </label>
                                                                            <input type="hidden" name="userID" value="${userID}">
                                                                            <input type="hidden" name="publisherID" value="${publisherID}">
                                                                            <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                                        </div>
                                                                    </div> <!-- col-md-7 -->



                                                                    <!--Date copies were sent:-->
                                                                    <div class="col-md-3" >
                                                                        <label for="copiesSent" class="pull-left"><strong>Date copies were sent</strong> </label>
                                                                        <div class="input-group pull-left" >
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

                                                                        <div class="row">
                                                                            <div class="col-md-6"   style="margin-bottom: 20px">        
                                                                                <label  class="control-label pull-left">Open electronic copy of original work </label>
                                                                                <div class="input-group originalSample1 pull-left" >
                                                                                    <a class="btn btn-info btn-file pull-left" role="button" id="originalSample1" href=""  target="_blank">
                                                                                        <span class="glyphicon glyphicon-file"></span>
                                                                                        Copy of original work</a>
                                                                                </div>
                                                                            </div>
                                                                        </div> <!--row-->

                                                                        <div class="row">

                                                                            <div class="col-md-6"   style="margin-bottom: 20px">        
                                                                                <label  class="control-label pull-left">Open copy of translation sample<sup>**</sup><br/> (10 to 12 pages of prose or six poems)</label>
                                                                                <div class="input-group translationSample1 pull-left" >
                                                                                    <a class="btn btn-info btn-file pull-left" role="button" id="translationSample1" href=""  target="_blank">
                                                                                        <span class="glyphicon glyphicon-file"></span>
                                                                                        Copy of translation sample</a>
                                                                                </div>
                                                                            </div>
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
                                                                        <div class="input-group input-group-lg"> <br/>
                                                                            <button type="submit"                                                                          
                                                                                    data-toggle="tooltip" 
                                                                                    class="btn btn-success"
                                                                                    title="Click to update the application!"
                                                                                    style="margin-bottom: 10px"
                                                                                    >
                                                                                Update the application
                                                                                <span class="glyphicon glyphicon-import"></span>
                                                                            </button>
                                                                        </div><!-- input-group -->
                                                                    </div>  <!-- col-md-9 -->
                                                                </div>  <!-- panel--body -->
                                                            </div>  <!--panel--default-->     

                                                        </div> <!-- row -->

                                                        <hr/>
                                                        <div class="col-md-12">
                                                            <i class="pull-left"><strong> &nbsp; *</strong> Please contact Literature Ireland if a hard copy of the original work cannot be obtained.</i><br/>
                                                            <i class="pull-left">  <strong>**</strong> If more than one translator is involved, a translation sample must be submitted for each translator.</i>
                                                        </div>    
                                                    </div>  <!-- container-fluid -->
                                                </div> <!-- tab-pane "Original Work & Sample Translation" --> 

                                            </div> <!-- applicationEditForm-tab-content -->

                                        </form>
                                    </div> <!-- container-fluid -->  
                                </nav>    
                            </div> <!-- /.modal-body -->
                            <div class="modal-footer"  style="background-color: #c3bcbc">
                                &nbsp; &nbsp;
                            </div>
                        </div> <!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal applicationsModal -->

                <div class="modal fade" id="addAdditionalRightsHoldersModal" tabindex="-1" role="dialog" aria-labelledby="addAdditionalRightsHoldersModalLabel"  data-modal-index="2">
                    <div class="modal-dialog">
                        <div class="modal-content" style="background-color: #d9d1d1">
                            <div class="modal-header" style="background-color: #c3bcbc">
                                <button type="button" class="close" data-dismiss="modal"  onclick="backToRightsAgreement();"  aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="addAdditionalRightsHoldersModalLabel">add more Translation rights holder</h4>
                            </div>


                            <div class="modal-body" style="background-color: #d9d1d1">

                                <div class="row" style="margin-bottom: 10px">
                                    <div class='col-sm-12'>

                                        <div  id="RightsHolderGeneratedForm" class="input-group" style='margin-bottom:2px;'>
                                            <!--1. Rights holder <input  type="text" id="firstRightsHolder0" value="Name" style='margin-bottom:2px'>-->                                                         
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
                <div class="scroll-top-wrapper ">
                    <span class="scroll-top-inner">
                        <i class="fa fa-3x fa-arrow-circle-up"></i>
                    </span>
                </div>
                <form class="form-horizontal" 
                      role="form"  
                      autocomplete="on"  
                      action="${pageContext.request.contextPath}/Application" 
                      method="POST" 
                      name="regF"
                      >

                    <input type="hidden" name="userID" value="${userID}">
                    <input type="hidden" name="name" value="${name}">
                    <input type="hidden" name="publisherID" value="${publisherID}">
                    <input type="hidden" name="Company" value="${companyDetails.Company}">
                    <input type="hidden" name="publisherName" value="${companyDetails.Company}">

                    <div class="container col-sm-12" style="margin-bottom: 40px">
                        <input type="submit" id="NewApplication" name="task"  class = "btn btn-default btn-sm" value="Start New Application" />
                        <input type="submit" id="ListOpenApplications" name="task"  class = "btn btn-default btn-sm active" value="List Open Applications" />
                        <input type="submit" id="ListPendingApplications" name="task"  class = "btn btn-default btn-sm" value="List Pending Applications" />
                        <input type="submit" id="ListClosedApplications" name="task"  class = "btn btn-default btn-sm" value="List Closed Applications" />
                    </div>

                </form>


                <!-- footer start -->
                <div id="base">  

                    <div class="basetext">  
                        <h2>Literature Ireland</h2>
                        <a data-toggle="tooltip" data-placement="top" title="Contact Details" >
                            <i  onclick="contactUsModal();">Contact Details</i>
                        </a> &nbsp;|&nbsp; 
                        <a data-toggle="tooltip" data-placement="top" title="Legal Note" >
                            <i  onclick="showLegalNoteModal();">Legal Note</i></a>

                    </div><!-- end of BaseText div -->  

                    <div class="baselogo-1 hidden-phone"><a href="http://www.cultureireland.gov.ie" target="_blank"><span class="hidden">Culture Ireland</span></a></div>
                    <div class="baselogo-2 hidden-phone"><a href="http://www.artscouncil.ie" target="_blank"><span class="hidden">The Arts Council</span></a></div>
                    <!--<div class="baselogo-4 hidden-phone"><a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a></div>-->

                    <div class="mobile-baselogos visible-phone"> 
                        <a href="http://www.cultureireland.gov.ie" target="_blank"><span class="hidden">Culture Ireland</span></a>
                        <a href="http://www.artscouncil.ie" target="_blank"><span class="hidden">The Arts Council</span></a>
                        <!--                        <a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a>-->
                    </div>

                </div><!-- end of Base div -->
            </div><!-- end of container div -->
            <div class="shadowbase"> </div>
        </div><!-- end of Shadowholder container div -->

        <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
            &copy; 2017-2019 mgr Software
        </div>
        <!--contactUsModal-->
        <div class="modal fade" id="contactUsModal" tabindex="-1" role="dialog" aria-labelledby="contactUsModalLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header"  style="background-color: #d9d1d1;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h1 class="modal-title" id="contactUsModalLabel"   style="background-color: #d9d1d1;">Contact Us</h1>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="container-fluid">         
                            <div id="contentarea">
                                <div class="textpadding">
                                    <div class="typography">
                                        <p><strong>Director</strong>   Sinéad Mac Aodha</p>
                                        <p>sinead@literatureireland.com </p>
                                        <p> </p>
                                        <p><strong>Deputy Director   </strong>Rita McCann </p>
                                        <p>rita@literatureireland.com</p>
                                        <p> </p>
                                        <p><strong>Administrator</strong>   Andrew Deering</p>
                                        <p>andrew@literatureireland.com</p>
                                        <p> </p>
                                        <p><strong style="white-space: pre;"><br/></strong></p>
                                        <p><strong><span style="text-decoration: underline;">PLEASE NOTE OUR NEW ADDRESS: </span></strong></p>
                                        <p>Literature Ireland</p>
                                        <p>Trinity Centre for Literary and Cultural Translation</p>
                                        <p>36 Fenian Street</p>
                                        <p>Trinity College Dublin</p>
                                        <p>Dublin D02 CH22</p>
                                        <p>Ireland</p>
                                        <p><strong>Telephone: +353 (0)1 896 4184</strong></p>
                                        <p><span style="white-space: pre;"><strong>Email: info@literatureireland.com</strong></span></p>
                                        <p> </p>
                                        <p> </p>
                                        <p> </p>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <!--showLegalNoteModal-->
        <div class="modal fade" id="showLegalNoteModal" tabindex="-1" role="dialog" aria-labelledby="showLegalNoteModallLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header"   style="background-color: #d9d1d1;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h1 class="modal-title" id="showLegalNoteModallLabel" style="background-color: #d9d1d1;">Legal Note</h1>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="container-fluid">
                            <div id="contentarea">
                                <div class="textpadding">
                                    <div class="typography">
                                        <h4>Company Registration</h4>
                                        <p>Literature Ireland is registered in Dublin, Ireland, at the following address: </p>
                                        <p>Trinity Centre for Literary Translation, 36 Fenian Street, Trinity College Dublin, Dublin 2.</p>
                                        <p>Registered company number: 212420</p>
                                        <p> </p>
                                        <h4><span style="color: #3b3b3b;">Disclaimer</span></h4>
                                        <p>Literature Ireland offers the material on this website, in good faith, for the information of visitors to the site, but disclaims any responsibility for error, omission or inaccuracy, and for the consequences of pursuing any link from these pages to another site.</p>
                                        <p> </p>
                                        <h4>Copyright</h4>
                                        <p>The copyright in all material on this website is owned by Literature Ireland, or is reproduced with the permission (if required) of the copyright owner. The material may be retrieved and downloaded for personal use, but may not otherwise be reproduced or made available in any manner or form, and may not be modified or altered in any way, without the permission of Literature Ireland.</p>
                                        <p> </p>
                                        <h4>Privacy</h4>
                                        <p>All documentation submitted to Literature Ireland will be treated with the utmost discretion. If you have any concerns in relation to privacy, please contact Literature Ireland at info@literatureireland.com.</p>
                                    </div><!-- end of typography div -->
                                </div><!-- end of text padding div -->
                            </div><!-- end of contentarea div -->
                        </div>
                    </div><!-- modal body -->
                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->


        <script>
            function  contactUsModal() {
                $("#contactUsModal").modal("show");
            }
            function  showLegalNoteModal() {
                $("#showLegalNoteModal").modal("show");
            }
        </script>
    </body>
</html>
