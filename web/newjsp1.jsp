<%@ page import="java.io.*,java.io.*,java.util.*,org.apache.poi.hwpf.HWPFDocument,org.apache.poi.hwpf.extractor.WordExtractor" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
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
     <!-- bootstrap 4.x is supported. You can also use the bootstrap css 3.3.x versions -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    <!-- if using RTL (Right-To-Left) orientation, load the RTL CSS file after fileinput.css by uncommenting below -->
    <!-- link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput-rtl.min.css" media="all" rel="stylesheet" type="text/css" /-->
    <!-- the font awesome icon library if using with `fas` theme (or Bootstrap 4.x). Note that default icons used in the plugin are glyphicons that are bundled only with Bootstrap 3.x. -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
    
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
    <!-- piexif.min.js is needed for auto orienting image files OR when restoring exif data in resized images and when you
        wish to resize images before upload. This must be loaded before fileinput.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/piexif.min.js" type="text/javascript"></script>
    <!-- sortable.min.js is only needed if you wish to sort / rearrange files in initial preview. 
        This must be loaded before fileinput.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/sortable.min.js" type="text/javascript"></script>
    <!-- purify.min.js is only needed if you wish to purify HTML content in your preview for 
        HTML files. This must be loaded before fileinput.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/purify.min.js" type="text/javascript"></script>
    <!-- popper.min.js below is needed if you use bootstrap 4.x (for popover and tooltips). You can also use the bootstrap js 
       3.3.x versions without popper.min.js. -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- bootstrap.min.js below is needed if you wish to zoom and preview file content in a detail modal
        dialog. bootstrap 4.x is supported. You can also use the bootstrap js 3.3.x versions. -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <!-- the main fileinput plugin file -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/fileinput.min.js"></script>
    <!-- following theme script is needed to use the Font Awesome 5.x theme (`fas`) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/themes/fas/theme.min.js"></script>
    <!-- optionally if you need translation for your language then include the locale file as mentioned below (replace LANG.js with your language locale) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/locales/LANG.js"></script>

    
     <script type="text/javascript">

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
            var bookCover;
            var bookTranslationTitle;
            var uploadCounter = 1;

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
//            PDFJS.workerSrc = 'js/pdf.worker.js';
//      localStorage.clear();

            var i;

            console.log("local storage - pendingApplications.jsp");
            for (i = 0; i < localStorage.length; i++) {
                console.log(localStorage.key(i) + "=[" + localStorage.getItem(localStorage.key(i)) + "]");
            }

            console.log("session storage - pendingApplications.jsp");
            for (i = 0; i < sessionStorage.length; i++) {
                console.log(sessionStorage.key(i) + "=[" + sessionStorage.getItem(sessionStorage.key(i)) + "]");
            }
        </script>      

        <!--applications-->
        <script type="text/javascript">
            var cntr = 0;
            var publisherID = '${publisherID}';
            var newURL = "./pendingApplicationPublisherDataServlet?publisherID=" + publisherID;
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

                                return '<a href="http://localhost' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }}, {"data": "contract",
                            "render": function (data, type, row) {

                                return '<a href="http://localhost' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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

                                return '<a href="http://localhost' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                                return '<a href="http://localhost' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                        {"data": "genre"},
                        {"data": "TranslatorName",
                            "render": function (data) {
                                console.log("TranslatorName  " + data);
                                return data;
                            }},
                        {"data": "expertReaderName"},
                        {"data": "bookTitle"},
                        {"data": "TranslatorTrack",
                            "render": function (data) {
                                console.log("TranslatorTrack  " + data);
                                return data;
                            }},
                        {"data": "Titles",
                            "render": function (data) {
                                console.log("Titles  " + data);
                                return data;
                            }},
                        {"data": "translatorCVDocName"},
                        {"data": "cover"},
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
                                return '<a href="http://localhost' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                                return '<a href="http://localhost' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "addendumRightsAgreementName"},
                        {"data": "proofOfPaymentToTranslator",
                            "render": function (data, type, row) {
                                console.log("7771 1 proofOfPaymentToTranslator  " + data);
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return '<a href="http://localhost' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                                }
                            }},
                        {"data": "proofOfPaymentToTranslatorName"},
                        {"data": "bankDetailsForm",
                            "render": function (data, type, row) {
                                console.log("7771 2 bankDetailsForm  " + data);
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return '<a href="http://localhost' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                                }
                            }},
                        {"data": "bankDetailsFormName"},
                        {"data": "SignedLIContract",
                            "render": function (data, type, row) {
                                console.log("7771 3 SignedLIContract  " + data);
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    return '<a href="http://localhost' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                                }
                            }},
                        {"data": "SignedLIContractName"},
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
                                return '<a href="http://localhost' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "originalName"},
                        {"data": "Author"},
                        {"data": "publicationYear"},
                        {"data": "Series",
                            "render": function (data) {
                                console.log("Series  " + data);
                            }},
                        {"data": "translationTitle",
                            "render": function (data) {
                                console.log("translationTitle  " + data);
                            }},
                        {"data": "transList",
                            "render": function (data, type, row) {

                                console.log("777 transList data" + data + " \n ");
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
                        {"data": "ISBN",
                            "render": function (data) {
                                console.log("ISBN  " + data);
                            }},
                        {"data": "ISSN",
                            "render": function (data) {
                                console.log("ISSN  " + data);
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
                    var agreemnt = 'http://localhost' + rowdata.agreement + '';
//                    $("#appAgreement").val(agreemnt);
//                    document.getElementById("agreement").href = agreemnt;

                    var orig = 'http://localhost' + rowdata.original + '';
//                   $("#appOriginal").val(orig);                                  
//                    document.getElementById("original").href = orig;
                    document.getElementById("originalSample1").href = orig;
                    var addendumRightsAgreemnt = 'http://localhost' + rowdata.addendumRightsAgreement + '';
                    $("#appAddendumRightsAgreement").val(addendumRightsAgreemnt);
//                    document.getElementById("addendum").href = addendumRightsAgreemnt;

                    if (rowdata.proofOfPaymentToTranslator !== 'null' && rowdata.proofOfPaymentToTranslator !== undefined) {
                        console.log("7771 A proofOfPaymentToTranslator null");
                        $("#proofPaymentDiv1").toggle();
                        $("#proofPaymentDiv2").toggle();
                    }
                    proofOfPaymentToTrans = 'http://localhost' + rowdata.proofOfPaymentToTranslator + '';
                    $("#appProofPaymentToTranslator").val(proofOfPaymentToTrans);
                    console.log("7771 A proofOfPaymentToTranslator rowdata.proofOfPaymentToTranslator " + rowdata.proofOfPaymentToTranslator);
                    console.log("7771 A proofOfPaymentToTranslator proofOfPaymentToTrans " + proofOfPaymentToTrans);
                    document.getElementById("proofPayment_link").href = proofOfPaymentToTrans;


                    if (rowdata.bankDetailsForm !== 'null' && rowdata.bankDetailsForm !== undefined) {
                        console.log("7771 B bankDetailsForm !== undefined");
                        $("#bankDetailForm1").toggle();
                        $("#bankDetailForm2").toggle();
                    }
                    bankDetailsFrm = 'http://localhost' + rowdata.bankDetailsForm + '';
                    $("#appBankDetailsForm").val(bankDetailsFrm);
                    console.log("7771 B bankDetailsForm rowdata.bankDetailsForm " + rowdata.bankDetailsForm);
                    console.log("7771 B bankDetailsForm bankDetailsFrm " + bankDetailsFrm);
                    document.getElementById("bankDetailForm_link").href = bankDetailsFrm;

                    if (rowdata.SignedLIContract !== 'null' && rowdata.SignedLIContract !== undefined) {
                        console.log("7771 C SignedLIContract undefined");
                        $("#signedLIContract1").toggle();
                        $("#signedLIContract2").toggle();
                    }
                    signedLIContr = 'http://localhost' + rowdata.SignedLIContract + '';
                    $("#appSignedLIContract").val(signedLIContr);
                    console.log("7771 C SignedLIContract rowdata.SignedLIContract " + rowdata.SignedLIContract);
                    console.log("7771 C SignedLIContract signedLIContr signedLIContr " + signedLIContr);
                    document.getElementById("signedLIcontract_link").href = signedLIContr;


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
//                        var cver = 'http://localhost' + rowdata.cover + '';
//                        $("#cover").val(cver);
//                        document.getElementById("cover").src = cver;
//                    }
                    var contr = 'http://localhost' + rowdata.contract + '';
//                    document.getElementById("contract").href = contr;
//
//                    var trans = 'http://localhost' + rowdata.translatorCV + '';
//                    document.getElementById("translatorCV").href = trans;
//
                    var transSamp = 'http://localhost' + rowdata.copiesTranslationSample + '';
                    document.getElementById("translationSample1").href = transSamp;


                    $("#applicationsModal").modal("show");
//                    rightsHolderArray = [];
//                    $("#applications").DataTable().ajax.reload();
                    $("#appApplicationNumber").val($(this).closest('tr').children()[1].textContent);
                    $("#appApplicationYear").val($(this).closest('tr').children()[2].textContent);
                    $("#appReferenceNumber").val($(this).closest('tr').children()[3].textContent);
                    $("#company").val($(this).closest('tr').children()[4].textContent);
//                    $("#appAgreement").val($(this).closest('tr').children()[5].textContent);

                    var appReferenceNumber = rowdata.ReferenceNumber;
                    document.getElementById("appReferenceNumber").innerHTML = appReferenceNumber;
                    document.getElementById("ReferenceNumber").value = appReferenceNumber;
                    //          console.log("appReferenceNumber " + appReferenceNumber);
                    $("#unassignedERRefNo").val(appReferenceNumber);
                    var TranslName = rowdata.TranslatorName;
                    //          console.log("TranslName " + TranslName);
                    $("#translatorNames").val(TranslName);
                    console.log("TranslatorName length ", TranslName.length);
                    var bookTitles = rowdata.Titles;
                    $("#currentItem").val(bookTitles.join(""));

                    console.log("8 xyz bookTitle: " + rowdata.bookTitle);
                    document.getElementById("appBookTitle").value = rowdata.bookTitle;
                    document.getElementById("publicationYear").value = rowdata.publicationYear;
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

                    document.getElementById("isbn").value = rowdata.ISBN;
                    document.getElementById("isnn").value = rowdata.ISSN;

                    for (var i = 0; i < rowdata.rightsHolderArray.length; i++) {

                        console.log("123v rightsHolderArray " + rowdata.rightsHolderArray[i]);
                    }
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

                    console.log("123v rightsHolderArray.length " + rowdata.rightsHolderArray.length);

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

                    document.getElementById("originalPageExtent").value = rowdata.originalPageExtent;





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
                    console.log("888 TranslatorDocs " + TranslatorDocs);
                    translatorArray = rowdata.transList;

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
                    var translatorNamesForGenerateTranslatorTab = [];
                    translators = [];

                    for (var i = 0; i < TranslatorDocs.length; ++i) {
                        console.log("8 xyz TranslatorDocs.length " + TranslatorDocs.length);

                        for (var j = 0; j < TranslatorDocs[i].length; ++j) {
                            console.log(TranslatorDocs[i]);
                            // skip undefined values to preserve sparse array
                            if (TranslatorDocs[i][j] === undefined)
                                continue;
                            // create row if it doesn't exist yet
                            if (translators[j] === undefined)
                                translators[j] = [];
                            // swap the x and y coords for the copy
                            translators[i][j] = TranslatorDocs[i][j];

                            console.log("8 xyz 1 translators[" + j + "][" + i + "] " + translators[j][i]);
                            console.log("8 xyz 2 TranslatorDocs[" + i + "][" + j + "] " + TranslatorDocs[i][j]);
                            console.log("8 xyz 3 translators[i].length: " + translators[i].length);
                            console.log("8 xyz 4 TranslatorDocs[i].length: " + TranslatorDocs[i].length);
                            console.log("8 xyz 5 translators.length: " + translators.length);
                        }
                    }

                    //TABLE ROWS
                    for (i = 0; i < translators.length; i++) {

                        var tr = document.createElement('TR');
                        for (j = 0; j < translators[i].length; j++) {
                            console.log("translators[i].length: " + translators[i].length);
                            console.log("translators[i]: " + translators[i]);
                            console.log("2 translators[i][j] " + translators[i][j]);
                            var td = document.createElement('TD');
                            if (i === 0) {
                                td.className = 'highlightHeader';
                            }
                            // remove "undefined" cells
                            if (typeof (translators[i][j]) === "undefined") {
                                translators[i][j] = '';
                            }

                            console.log("3 translators[i][j] " + translators[i][j]);
                            var nls = translators[i][j].split(",");
                            for (k = 0; k < nls.length; k++) {
                                console.log("1 nls [" + k + " ] " + nls[k]);
                            }

                            var newTranslatorName = nls[0];
                            newTranslatorName = newTranslatorName.substring(1);
                            translatorNamesForGenerateTranslatorTab.push(newTranslatorName);
                            console.log("translatorNamesForGenerateTranslatorTab " + translatorNamesForGenerateTranslatorTab);
                            for (o = 0; o < translatorNamesForGenerateTranslatorTab.length; o++) {
                                console.log("translatorNamesForGenerateTranslatorTab " + translatorNamesForGenerateTranslatorTab[o]);
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
                                    var entry = "location.href='http://localhost" + destination + "'";
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

                    //Get all Expert Readers that are not assigned at the moment
                    var unassignedExpertReaderList = rowdata.unassignedExpertReaderList;

                    //reset the blocks
                    document.getElementById("agreementToggle1").style.display = "block";
                    document.getElementById("agreement_button1").style.display = "none";
                    document.getElementById("addendumToggle1").style.display = "block";
                    document.getElementById("addendum_button1").style.display = "none";

                    /*
                     * empty the div before fetching and adding new data
                     */
                    $('#tn').empty();
                    $('#tnc').empty();

                    console.log("8 xyz 6 translators.length: " + translators.length);
                    // Generate Translator Tabs in "Rights Agreement & Contracts"-Tab

                    // 1: The Nav-Bar

                    var rightsAgreementContractsNavBar = '';
                    rightsAgreementContractsNavBar += '<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2" style="background-color: #d9d1d1">';
                    rightsAgreementContractsNavBar += '<ul class="nav navbar-nav nav-tabs">';
                    for (var i = 0; i < translators.length; i++) {

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

                    for (var i = 0; i < translators.length; i++) {

                        var j = i + 1;

                        if (i === 0) {

                            rightsAgreementContractsNavContent += '<div class="tab-pane fade in active" id="tn' + j + '">';
                        } else {

                            rightsAgreementContractsNavContent += '<div class="tab-pane fade" id="tn' + j + '">';
                        }


                        rightsAgreementContractsNavContent += '<div class="container wrapperContainer">';

                        //Upload a copy of the CV
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
                        rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                        rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 

                        rightsAgreementContractsNavContent += '<div class="col-md-5" id="cv_button' + j + '" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> ';
                        rightsAgreementContractsNavContent += '<label  class="control-label pull-left" id="cv_button_label' + j + '" ></label>';
                        rightsAgreementContractsNavContent += '<div class="input-group cv_buttonText pull-left">';
                        rightsAgreementContractsNavContent += '<a class="btn btn-info btn-file pull-left" role="button" id="cv_link' + j + '" href="">';
                        rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-file"></span>';
                        rightsAgreementContractsNavContent += 'Click to open</a>';
                        rightsAgreementContractsNavContent += '</div>';
                        rightsAgreementContractsNavContent += '</div>'; // -- col-md-10--


                        rightsAgreementContractsNavContent += '</div>'; //-- position:relative;--
                        rightsAgreementContractsNavContent += '</div>'; // row

                        //Upload a copy of the contract with translator
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
                        rightsAgreementContractsNavContent += '<input type="hidden" value="Contract" name="destination" id="contract_upload' + j + '"/>';
                        rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                        rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 

                        rightsAgreementContractsNavContent += '<div class="col-md-5" id="contract_button' + j + '" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> ';
                        rightsAgreementContractsNavContent += '<label  class="control-label pull-left" id="contract_button_label' + j + '" ></label>';
                        rightsAgreementContractsNavContent += '<div class="input-group contract_buttonText pull-left">';
                        rightsAgreementContractsNavContent += '<a class="btn btn-info btn-file pull-left" role="button" id="contract_link' + j + '" href="">';
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
                    console.log("8 xyz 1: Fill the tabs rightsAgreement.length " + rowdata.rightsAgreement.length);
                    for (var j = 0; j < rowdata.rightsAgreement.length; j++) {
                        var rightsAgreementArray = rowdata.rightsAgreement[j].split(",");
                        for (var v = 0; v < rightsAgreementArray.length; v++) {

                            switch (v) {
                                case 0:
                                    // Agreement
                                    console.log("8 xyz Agreement ");
                                    if (w === 1) {
                                        if (rightsAgreementArray[v].substr(1) !== 'null') {
                                            console.log("8 xyz Agreement not null");
                                            console.log("8 xyz case 0  j[" + j + "] w  " + w);
                                            console.log("8 xyz  rightsAgreementArray  :", rightsAgreementArray[v].substr(1) + ":");
                                            document.getElementById('agreement_link' + w).href = "http://localhost" + rightsAgreementArray[v].substr(1) + " ";
                                        }
                                    }
                                    break;
                                case 1:
                                    // AgreementDocName
                                    console.log("8 xyz AgreementDocName ");
                                    console.log("8 xyz case 1 [" + j + "]");
                                    console.log("8 xyz rightsAgreementArray[" + v + "].substr(1) :" + rightsAgreementArray[v].substr(1) + ":");
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
                                    console.log("8 xyz Contract ");
                                    if (rightsAgreementArray[v].substr(1) !== 'null') {
                                        console.log("8 xyz Contract ===  available");
                                        document.getElementById('contract_link' + w).href = "http://localhost" + rightsAgreementArray[v].substr(1) + " ";
                                    }
                                    break;
                                case 3:
                                    // ContractDocName
                                    console.log("8 xyz ContractDocName");
                                    console.log("8 xyz rightsAgreementArray[" + v + "].substr(1) :" + rightsAgreementArray[v].substr(1) + ":");
                                    if (rightsAgreementArray[v].slice(0, -1)) {
                                        console.log("8 xyz ContractDocName ===  empty");
                                        console.log("8 xyz  ", translatorNamesForGenerateTranslatorTab[j]);
                                        console.log("8 xyz rightsAgreementArray[" + v + "].substr(1) :" + rightsAgreementArray[v].substr(1) + ":");
                                        document.getElementById('label_contract' + w).value = "not entered";
                                        document.getElementById('uploadContract' + w).innerHTML = 'Upload a copy of the contract with ' + translatorNamesForGenerateTranslatorTab[j];

                                    } else {
                                        console.log("8 xyz ContractDocName toggle");
                                        $('#contractToggle' + w).toggle();
                                        $('#contract_button' + w).toggle();

                                        document.getElementById("contract_button_label" + w).innerHTML = 'Open copy of the contract with ' + translatorNamesForGenerateTranslatorTab[j];

                                    }
                                    break;
                                case 4:
                                    // AddendumRightsAgreement
                                    console.log("8 xyz AddendumRightsAgreement ");
                                    if (w === 1) {
                                        if (rightsAgreementArray[v].substr(1) !== 'null') {
                                            console.log("8 xyz AddendumRightsAgreement not null");
                                            console.log("8 xyz case 0  j[" + j + "] w  " + w);
                                            console.log("8 xyz  rightsAgreementArray  :", rightsAgreementArray[v].substr(1) + ":");
                                            document.getElementById('addendum_link' + w).href = "http://localhost" + rightsAgreementArray[v].substr(1) + " ";
                                        }
                                    }
                                    break;
                                case 5:
                                    // AddendumRightsAgreementName
                                    console.log("8 xyz AddendumRightsAgreement ");
                                    if (w === 1) {
                                        if (rightsAgreementArray[v].slice(0, -1)) {
                                            console.log("8 xyz AddendumRightsAgreementName is blank");
                                            console.log("8 xyz case 1 not entered");
                                            document.getElementById('label_addendum' + w).value = "not entered";
                                            var uploadAddendum = "Upload a copy of the addendum to the rights agreement";
                                            console.log("8 xyz 2 rightsAgreementArray[" + v + "].substr(1) :" + rightsAgreementArray[v].substr(1) + ":");
                                            document.getElementById('uploadAddendum' + w).innerHTML = uploadAddendum;

                                        } else {
                                            console.log("8 xyz AddendumRightsAgreementName toggle");
                                            console.log("8 xyz case 1 toggle ");
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
                            document.getElementById('cv_link' + w).href = "http://localhost" + linkArray[2].trim() + " ";

                        }

                        w++;  // next translator

                    }

//
//
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
                    $("#dateCopiesWereSent").val($(this).closest('tr').children()[17].textContent);
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
                    $("#authors").val($(this).closest('tr').children()[66].textContent);
//                    $("#publicationYear").val($(this).closest('tr').children()[67].textContent);
////                    $("#series").val($(this).closest('tr').children()[68].textContent);
////                    $("#translationTitle").val($(this).closest('tr').children()[69].textContent);

                    if (typeof (rowdata.cover) === "undefined" || rowdata.cover === "") {

                        // no cover - show upload
                        var cver = '..images/not-available.jpg';
                        $("#showUploadCover1").show();
                        $("#showUploadCover2").hide();
                        //                        document.getElementById("cover21").src = cver;
                    } else {
                        // we have a cover - show cover
                        $("#showUploadCover2").show();
                        $("#showUploadCover1").hide();
                        var cver = 'http://localhost' + rowdata.cover + '';

                        $("#cover").val(cver);
                        console.log("81 xyz show bookCover cover " + bookCover);
                        console.log("81 xyz show Book cover for \n" + rowdata.translationTitle);
                        document.getElementById("cover21").src = cver;
                        document.getElementById("showUploadCoverTitle").innerHTML = "Book cover for \n" + rowdata.translationTitle;

                        bookTranslationTitle = rowdata.translationTitle;
                        console.log("81 xyz show Book bookTranslationTitle for \n" + bookTranslationTitle);
                    }
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
                    console.log("generatedLabels id ", id);
                    console.log("generatedLabels label_id ", label);
                    console.log("generatedLabels label ", label);
                    document.getElementById(label_id).value = label;
                    document.getElementById(label_id).size = label.length;
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
                    alert("addAdditionalRightsHoldersModalDiv");
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
                alert("backToRightsAgreement");

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
                    rightsAgreementContractsNavContent += 'Select file <input type="file" onchange="generatedLabels()" name="Contract-' + j + '" id="contract' + j + '">';
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
            function backToDrawDown() {

                $('#bs-example-navbar-collapse-1 a[href="#DrawDown"]').tab('show');
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

        <!--backToMisc-->
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
                    moreUploadTag += '<input  type="text" id="label_pressCuttings' + upload_number + '" class="pull-left">';
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

        <!--fileTypes-->
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
                console.log("validFileType(file)", file);
                for (var i = 0; i < fileTypes.length; i++) {
                    if (file.type === fileTypes[i]) {
                        console.log("validFileType(file) valid  ", file);
                        return true;
                    }
                }

                return false;
            }
        </script>

        <!--        <script>
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
                </script>-->

        <!--        <script type="text/javascript">
                    window.onload = function () {
                        document.getElementById('files').addEventListener('change', handleFileSelect, false);
        
        
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
        
                    };
                    $(document).on("click", "#files", function () {
                        $('.thumbnail').parent().remove();
                        $('result').hide();
                        $(this).val("");
                    });
                    $(document).on("click", "#clearCoverageCuttings", function () {
                        $('.thumbnail').parent().remove();
                        $('#result').hide();
                        $('#files').val("");
                        $(this).hide();
                    });
        
                </script>
        
                handleFileSelect
                <script>
                    // Loaded via <script> tag, create shortcut to access PDF.js exports.
                    var pdfjsLib = window['pdfjs-dist/build/pdf'];
        // The workerSrc property shall be specified.
                    pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://mozilla.github.io/pdf.js/build/pdf.worker.js';
        
        //            https://stackoverflow.com/questions/23402187/multiple-files-upload-and-using-file-reader-to-preview
                    function handleFileSelect(evt) {
                        var files = evt.target.files; // FileList object
                        console.log("files ", files);
                        // Loop through the FileList and render image files as thumbnails.
                        for (var i = 0, f; f = files[i]; i++) {
        
                            // Only process image files.
                            if (!validFileType(files[i])) {
                                continue;
                            }
        
                            var reader = new FileReader();
        
                            // Closure to capture the file information.
                            reader.onload = (function (theFile) {
        
                                if (theFile.type === "application/pdf") {
                                    console.log("files pdf ", theFile.name);
                                    var fileReader = new FileReader();
                                    fileReader.onload = function () {
                                        var pdfData = new Uint8Array(this.result);
                                        // Using DocumentInitParameters object to load binary data.
                                        var loadingTask = pdfjsLib.getDocument({data: pdfData});
                                        loadingTask.promise.then(function (pdf) {
                                            console.log('PDF loaded');
        
                                            // Fetch the first page
                                            var pageNumber = 1;
                                            pdf.getPage(pageNumber).then(function (page) {
                                                console.log('Page loaded');
        
                                                var scale = 1.5;
                                                var viewport = page.getViewport({scale: scale});
        
                                                // Prepare canvas using PDF page dimensions
                                                var canvas = $("#pdfViewer")[0];
                                                var context = canvas.getContext('2d');
                                                canvas.height = viewport.height;
                                                canvas.width = viewport.width;
        
                                                // Render PDF page into canvas context
                                                var renderContext = {
                                                    canvasContext: context,
                                                    viewport: viewport
                                                };
                                                var renderTask = page.render(renderContext);
                                                renderTask.promise.then(function () {
                                                    console.log('Page rendered');
                                                });
                                            });
                                        }, function (reason) {
                                            // PDF loading error
                                            console.error(reason);
                                        });
                                    };
        
                                    fileReader.readAsArrayBuffer(theFile);
        
                                } else
                                {
                                    return function (e) {
                                        console.log("e.target.result ", e.target.result);
                                        // Render thumbnail.
                                        var span = document.createElement('span');
        //                            var cleanFileName = decodeURI(escape(theFile.name));
                                        span.innerHTML = ['<img class="thumbnail" src="', e.target.result,
                                            '" title="', theFile.name, '"/>'].join('');
                                        document.getElementById('coverageCuttings').insertBefore(span, null);
                                    };
                                }
                            })(f);
        
                            // Read in the image file as a data URL.
                            reader.readAsDataURL(f);
                        }
                    }
        //            document.getElementById("files").addEventListener('change', handleFileSelect, false);
                </script>-->


        <!--Styles-->
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
            .mytab2 .tab-pane{ border:solid 1px blue;  border-top: 0;    }
            #myTab li a { border-color: blue;background-color:#A5C967; }
            #myTab li.active a {border-bottom-color: transparent;background-color:Yellow; }
            #myTab2 li a { border-color: blue;background-color:#A5C967; }
            #myTab2 li.active a {border-bottom-color: transparent;background-color:Yellow; }
            .my-tab .tab-pane{ border:solid 1px blue;  border-top: 0; background-color:#F7EFC6;}

            span > i {
                color: white;
            }
            span > input {
                background: none;
                color: white;
                padding: 0;
                border: 0;
            }

            input[type="file"] {
                display: none;
            }
            .custom-file-upload {
                border: 1px solid #ccc;
                display: inline-block;
                padding: 6px 12px;
                cursor: pointer;
            }

            .black, .black a {
                color: #000000;
            }
            .modal-dialog,
            .modal-content {
                /* 80% of window height */
                height: 100%;
            }

            .modal-body {
                /* 100% = dialog height, 120px = header + footer */
                max-height: calc(100% - 80px);
                overflow-y: scroll;
            }
        </style>

        <!--modal_counter-->
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

        <!--myFunction-->
        <script>
            function myFunction() {
                alert("myfunction");
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
                var date = new Date(unformattedDate);
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                var formattedDate = day + "/" + month + "/" + year;
                return formattedDate;
            }
        </script>


    </head>

    <body>
        <div class="container" >

            <h1>File upload demo
            </h1>

            <form enctype="multipart/form-data">
                <input id="test" type="file" multiple style="transform: none;"><br/>
                <button type="submit" class="btn btn-success">Upload Files</button>
                <button type="reset" class="btn btn-warning">Reset</button>
            </form>

        </div>

        <script>

            $(document).ready(function () {

                $("#test").fileinput({
                    'theme': 'fas',
                    'uploadUrl': '#',
                    overwriteInitial: true

                });

            });
        </script>
    </body>

</html>