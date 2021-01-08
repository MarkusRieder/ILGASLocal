/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * 
 * 
 * openApplications.js
 * 
 */



var translatorArray = [];
var translators = [];
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


var cntr = 0;
//var publisherID = '${publisherID}';
var publisherID = document.getElementById("pid").value;

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

                    return '<a href="https://www.literatureirelandgrantapplication.com' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                }}, {"data": "contract",
                "render": function (data, type, row) {
                    console.log("contract " + data);
                    return '<a href="https://www.literatureirelandgrantapplication.com' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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

                    return '<a href="https://www.literatureirelandgrantapplication.com' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                    console.log("copiesSent " + data);
//                    if (data === 0) {
//                        document.getElementById("copiesSent").checked = false;
//                        return 'No';
//                    } else {
//                        document.getElementById("copiesSent").checked = true;
//                        return 'Yes';
//                    }
                    if (typeof (data) === "undefined") {
                        return "n/a";
                    } else
                    {

                        return data;
                    }
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
                    return '<a href="https://www.literatureirelandgrantapplication.com' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
            {"data": "expertReaderName"},
            {"data": "bookTitle",
                "render": function (data) {
                    if (typeof (data) === "undefined") {
                        return "n/a";
                    } else
                    {

                        return data;
                    }
                }},
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
                    return '<a href="https://www.literatureirelandgrantapplication.com' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                    console.log("foreignPublisher " + data);
                    if (typeof (data) === "undefined") {
                        return "n/a";
                    } else
                    {
                        return data;
                    }
                }},
            {"data": "foreignCountry",
                "render": function (data) {
                    console.log("foreignCountry " + data);
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
                    return '<a href="https://www.literatureirelandgrantapplication.com' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                    return '<a href="https://www.literatureirelandgrantapplication.com' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                    return '<a href="https://www.literatureirelandgrantapplication.com' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                        return '<a href="https://www.literatureirelandgrantapplication.com' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                    return '<a href="https://www.literatureirelandgrantapplication.com' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                "render": function (data) {
                    if (typeof (data) === "undefined") {
                        console.log("data: rightsHolderArray Nope  " + data);
                        return "Nope";
                    } else
                    {
                        console.log("data: rightsHolderArray " + data);
                        return data;
                    }
                }},
            {"data": "companyCountry",
                "render": function (data) {
                    console.log("companyCountry " + data);
                    if (typeof (data) === "undefined") {
                        console.log("data: companyCountry " + data);
                        return "Nope";
                    } else
                    {
                        console.log("data: companyCountry " + data);
                        return data;
                    }
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

        var agreemnt = 'https://www.literatureirelandgrantapplication.com' + rowdata.agreement + '';

        var orig = 'https://www.literatureirelandgrantapplication.com' + rowdata.original + '';
        document.getElementById("originalSample1").href = orig;

        var addendumRightsAgreemnt = 'https://www.literatureirelandgrantapplication.com' + rowdata.addendumRightsAgreement + '';
        $("#appAddendumRightsAgreement").val(addendumRightsAgreemnt);

        var contr = 'https://www.literatureirelandgrantapplication.com' + rowdata.contract + '';

        var transSamp = 'https://www.literatureirelandgrantapplication.com' + rowdata.copiesTranslationSample + '';
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
//        var translators = rowdata.TranslatorName;
        console.log("888 TranslName " + TranslName);
        $("#translatorNames").val(TranslName);
        console.log("888 TranslatorName length ", TranslName.length);
        var bookTitles = rowdata.Titles;
        $("#currentItem").val(bookTitles.join(""));

        $("#appcontract").val(contr);
//                    $("#proposedDateOfPublication").val($(this).closest('tr').children()[7].textContent);
//                    $("#appproposedPrintRun").val($(this).closest('tr').children()[8].textContent);
//                    $("#plannedPageExtent").val($(this).closest('tr').children()[9].textContent);
        $("#appnumberOfPages").val($(this).closest('tr').children()[11].textContent);
//                    $("#breakDownTranslatorFee").val($(this).closest('tr').children()[12].textContent);
//                    $("#translatorFee").val($(this).closest('tr').children()[13].textContent);
//                    $("#bookNotes").val($(this).closest('tr').children()[14].textContent);
        $("#appStatus").val($(this).closest('tr').children()[15].textContent);
        console.log("999 Status  appStatus " + $(this).closest('tr').children()[15].textContent);
        $("#Status").val(rowdata.Status);
        console.log("999 Status  Status " + rowdata.Status);
//        $("#copiesSent").val($(this).closest('tr').children()[16].textContent);
        var dateCopiesWereSent = formatDate(rowdata.dateCopiesWereSent);
        $("#dateCopiesWereSent").val(dateCopiesWereSent);
//        $("#dateCopiesWereSent").val($(this).closest('tr').children()[17].textContent);
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
//        document.getElementById("appForeignCountry").value = rowdata.foreignCountry;
        $("#appForeignCountry").val(rowdata.companyCountry);
        console.log("rowdata.companyCountry " + rowdata.companyCountry);
        document.getElementById("appproposedPrintRun").value = rowdata.proposedPrintRun;
        var languageArray = rowdata.targetLanguage;
        document.getElementById("appTargetLanguage").value = languageArray;
        document.getElementById("publicationYear1").value = rowdata.publicationYear;
        document.getElementById("languages").value = rowdata.originalLanguage;
        document.getElementById("translatorFee").value = rowdata.translatorFee;
        document.getElementById("BreakDownOfTranslatorFee").value = rowdata.breakDownTranslatorFee;
        document.getElementById("company").value = rowdata.company;
        document.getElementById("appCompany").value = rowdata.company;

        console.log("123v rightsHolderArray  ");
        var rightsHolderArray = rowdata.rightsHolderArray;
        document.getElementById("rightsHolderArray").value = rowdata.rightsHolderArray;
        console.log(rightsHolderArray);

        console.log("123v TranslatorName ");
        for (var i = 0; i < rowdata.TranslatorName.length; i++) {

            console.log("123v TranslatorName " + rowdata.TranslatorName[i]);
        }

//        if (rowdata.rightsHolderArray.length === 0) {
//            $('#addAddRightsHolders').empty();
//            document.getElementById("rightsHoldersName0").style.display = "inline";
//            console.log("123v ist empty ");
//            $("#RightsHolderGeneratedForm").empty();
//            document.getElementById("rightsHoldersName0").value = "";
//            document.getElementById("rightsHoldersName0").disabled = false;
//            document.getElementById("rightsHoldersName0").readOnly = false;
//        }
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



        console.log("rowdata.rightsHolderArray.length  ", rowdata.rightsHolderArray.length);
        $('#addAddRightsHolders').empty();
        if (rowdata.rightsHolderArray.length > 0) {

            /*                         
             * Change Title from "Translation rights holder" to "Translation rights holder(s)"
             */
            document.getElementById("rightsHoldersName0").style.display = "none";
            document.getElementById("rightsHoldersNameLabel").innerHTML = 'Translation rights holders';

            console.log("rowdata.rightsHolderArray.length " + rightsHolderArray.length);

            for (var i = 0; i < rowdata.rightsHolderArray.length; i++) {
                console.log("rowdata.rightsHolderArray[i= " + i + "]  ", rowdata.rightsHolderArray[i]);
                var rightsHolders = rowdata.rightsHolderArray[i];
                console.log("rowdata.rightsHolderArray[i= " + i + "]  ", rightsHolders);
                console.log("rowdata.rightsHolderArray[i= " + i + "]  ", rightsHolders[0]);


                var additionalTranslatorTag = '';

                additionalTranslatorTag += '<div class="form-group has-feedback">';
                additionalTranslatorTag += ' <input id="rightsHoldersName' + i;
                additionalTranslatorTag += ' type="text"  ';
                additionalTranslatorTag += ' class="form-control"';
                additionalTranslatorTag += ' name="rightsHoldersName' + i + '"';
                additionalTranslatorTag += ' value="' + rightsHolders + '"';
                additionalTranslatorTag += ' disabled = ""';
                additionalTranslatorTag += ' </div>';

                $(additionalTranslatorTag).appendTo('#addAddRightsHolders');
            }

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

        var translatorNamesForGenerateTranslatorTab = [];
        translators = [];


        console.log("8 xyz 000 translators.length: " + translators.length);
        console.log("8 xyz 000 TranslatorDocs[0].length: " + TranslatorDocs[0].length);
        console.log("8 xyz 000 TranslatorDocs.length: " + TranslatorDocs.length);
        console.log(TranslatorDocs[0]); // contais 2 arrays

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
                        var entry = "location.href='https://www.literatureirelandgrantapplication.com" + destination + "'";
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

        $('#tn').empty(); // empty the div before fetching and adding new data
        $('#tnc').empty(); // empty the div before fetching and adding new data
        $('#agreementTranslationRightsHolder').empty();
        $('#addendumAgreementTranslationRightsHolder').empty();


        /*
         * Generate Translator Tabs in "Rights Agreement & Contracts"-Tab
         */

        /*
         * 1: The Nav-Bar
         */
        console.log("555agreement 1 translators.length " + translators.length);

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

        /*
         * 2: The Tabs themselves
         */

        var rightsAgreementContractsNavContent = '';
        var agreementTranslationRightsHolderContent = '';
        var addendumAgreementTranslationRightsHolder = "";
        var agreementTranslationRightsHolderName = "";

        for (var i = 0; i < translators.length; i++) {

            var j = i + 1;

            if (i === 0) {

                rightsAgreementContractsNavContent += '<div class="tab-pane fade in active" id="tn' + j + '">';

            } else {

                rightsAgreementContractsNavContent += '<div class="tab-pane fade" id="tn' + j + '">';
            }

            /*
             * Agreement with the translation rights holder
             */
            if (j === 1) {

                agreementTranslationRightsHolderContent += '<div class="row" style="margin-bottom: 80px;">';
                agreementTranslationRightsHolderContent += '<div style=" margin: 0 auto; position: relative;">';
                agreementTranslationRightsHolderContent += '<div class="col-md-9"  id="agreementToggle' + j + '" style="margin-bottom: 40px; position:absolute; z-index:0;">';
                agreementTranslationRightsHolderContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadAgreement' + j + '"></strong></div> ';
                agreementTranslationRightsHolderContent += '<br/>';
                agreementTranslationRightsHolderContent += '<div class="col-sm-5">';
                agreementTranslationRightsHolderContent += '<label id="uploadAgreement" class="control-label pull-left"></label>';
                agreementTranslationRightsHolderContent += '<label  class="control-label pull-left">No Agreement with the translation rights holder has been uploaded!</label>';
                agreementTranslationRightsHolderContent += '</div>';
                agreementTranslationRightsHolderContent += '</div>'; //<div class="input-group agreement" 
                agreementTranslationRightsHolderContent += '</div>'; //<div class="col-md-9" 

                agreementTranslationRightsHolderContent += '<div class="col-md-4" id="agreement_button' + j + '" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> ';
                agreementTranslationRightsHolderContent += '<label  class="control-label pull-left" id="agreement_button_label' + j + '" ></label>';
                agreementTranslationRightsHolderContent += '<div class="input-group agreement_buttonText pull-left">';
                agreementTranslationRightsHolderContent += '<a class="btn btn-info btn-file pull-left" role="button" id="agreement_link' + j + '" href=""  target="_blank">';
                agreementTranslationRightsHolderContent += '<span class="glyphicon glyphicon-file"></span>';
                agreementTranslationRightsHolderContent += 'Click to open</a>';
                agreementTranslationRightsHolderContent += '</div>';
                agreementTranslationRightsHolderContent += '</div>'; // -- col-md-7--


                agreementTranslationRightsHolderContent += '</div>'; //-- position:relative;--
                agreementTranslationRightsHolderContent += '</div>'; // row

                $(agreementTranslationRightsHolderContent).appendTo('#agreementTranslationRightsHolder');
            }

            rightsAgreementContractsNavContent += '<div class="container wrapperContainer">';

            /*
             * CV
             */

            rightsAgreementContractsNavContent += '<div class="row" style="margin-bottom: 80px;">';
            rightsAgreementContractsNavContent += '<div style=" margin: 0 auto; position: relative;">';

            rightsAgreementContractsNavContent += '<div class="col-md-9"  id="cvToggle' + j + '" style="margin-bottom: 40px; position:absolute; z-index:0;">';
            rightsAgreementContractsNavContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadCV' + j + '"></strong></div>';
            rightsAgreementContractsNavContent += '<br/>';
            rightsAgreementContractsNavContent += '<div class="col-sm-5">';
            rightsAgreementContractsNavContent += '<label id="uploadCV" class="control-label pull-left"></label>';
            rightsAgreementContractsNavContent += '<label  class="control-label pull-left">Nothing has been uploaded!</label>';

            rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
            rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 

            rightsAgreementContractsNavContent += '<div class="col-md-3" id="cv_button' + j + '" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> ';
            rightsAgreementContractsNavContent += '<label  class="control-label pull-left" id="cv_button_label' + j + '" ></label>';
            rightsAgreementContractsNavContent += '<div class="input-group cv_buttonText pull-left">';
            rightsAgreementContractsNavContent += '<a class="btn btn-info btn-file pull-left" role="button" id="cv_link' + j + '" href=""  target="_blank">';
            rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-file"></span>';
            rightsAgreementContractsNavContent += 'Click to open</a>';
            rightsAgreementContractsNavContent += '</div>';
            rightsAgreementContractsNavContent += '</div>'; // -- col-md-10--


            rightsAgreementContractsNavContent += '</div>'; //-- position:relative;--
            rightsAgreementContractsNavContent += '</div>'; // row

            /*
             * Contract with translator
             */

            rightsAgreementContractsNavContent += '<div class="row" style="margin-bottom: 80px;">';
            rightsAgreementContractsNavContent += '<div style=" margin: 0 auto; position: relative; ">';
            rightsAgreementContractsNavContent += '<div class="col-md-9"  id="contractToggle' + j + '" style="margin-bottom: 40px; position:absolute; z-index:0;">';
            rightsAgreementContractsNavContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadContract' + j + '"></strong></div>';
            rightsAgreementContractsNavContent += '<br/>';
            rightsAgreementContractsNavContent += '<div class="col-sm-5">';
            rightsAgreementContractsNavContent += '<label id="uploadContract" class="control-label pull-left"></label>';
            rightsAgreementContractsNavContent += '<label  class="control-label pull-left">Nothing has been uploaded!</label>';

            rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
            rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 

            rightsAgreementContractsNavContent += '<div class="col-md-3" id="contract_button' + j + '" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> ';
            rightsAgreementContractsNavContent += '<label  class="control-label pull-left" id="contract_button_label' + j + '" ></label>';
            rightsAgreementContractsNavContent += '<div class="input-group contract_buttonText pull-left">';
            rightsAgreementContractsNavContent += '<a class="btn btn-info btn-file pull-left" role="button" id="contract_link' + j + '" href=""  target="_blank">';
            rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-file"></span>';
            rightsAgreementContractsNavContent += 'Click to open</a>';
            rightsAgreementContractsNavContent += '</div>';
            rightsAgreementContractsNavContent += '</div>'; // -- col-md-10--

            rightsAgreementContractsNavContent += '</div>'; //-- position:relative;--
            rightsAgreementContractsNavContent += '</div>'; // row


            /*
             * Addendum to the rights agreement
             */

            if (j === 1) {

                addendumAgreementTranslationRightsHolder += '<div class="row" style="margin-bottom: 80px;">';
                addendumAgreementTranslationRightsHolder += '<div style=" margin: 0 auto; position: relative; ">';

                addendumAgreementTranslationRightsHolder += '<div class="col-md-9"  id="addendumToggle' + j + '"  style="margin-bottom: 40px; position:absolute; z-index:0; ">';
                addendumAgreementTranslationRightsHolder += '<div  style="margin-bottom: 10px;"><strong class="pull-left" id="uploadAddendum' + j + '" ></strong> </div>';
                addendumAgreementTranslationRightsHolder += '<br/>';
                addendumAgreementTranslationRightsHolder += '<div class="margin-bottom: 40px"></div>';
                addendumAgreementTranslationRightsHolder += '<div class="col-sm-12">';
                addendumAgreementTranslationRightsHolder += '<label id="uploadAddendum" class="control-label pull-left"></label>';
                addendumAgreementTranslationRightsHolder += '<label  class="control-label pull-left">No addendum to the rights agreement has been uploaded!</label>';

                addendumAgreementTranslationRightsHolder += '</div>'; //<div class="input-group agreement" 
                addendumAgreementTranslationRightsHolder += '</div>'; //<div class="col-md-10" 

                addendumAgreementTranslationRightsHolder += '<div class="col-md-3" id="addendum_button' + j + '"  style="margin-bottom: 40px; position:absolute;z-index:1; display:none;">  ';
                addendumAgreementTranslationRightsHolder += '<label  class="control-label pull-left" id="addendum_button_label' + j + '" ></label>';
                addendumAgreementTranslationRightsHolder += '<div class="input-group addendum_buttonText pull-left" style="width: 190px; hight: 34px" >';
                addendumAgreementTranslationRightsHolder += '<a class="btn btn-info btn-file pull-left" role="button" id="addendum_link' + j + '" href=""  target="_blank">';
                addendumAgreementTranslationRightsHolder += '<span class="glyphicon glyphicon-file"></span>';
                addendumAgreementTranslationRightsHolder += 'Click to open</a>';
                addendumAgreementTranslationRightsHolder += '</div>';
                addendumAgreementTranslationRightsHolder += '</div>'; // -- col-md-8--

                addendumAgreementTranslationRightsHolder += '</div>'; //-- position:relative;--
                addendumAgreementTranslationRightsHolder += '</div>'; // row

                $(addendumAgreementTranslationRightsHolder).appendTo('#addendumAgreementTranslationRightsHolder');

            }

            rightsAgreementContractsNavContent += '</div>'; //  --container--
            rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"
        }

        $(rightsAgreementContractsNavContent).appendTo('#tnc');

        for (var d = 0; d < rightsHolderArray.length; d++)
        {
            console.log("rightsHolderArray.length  " + rightsHolderArray.length);
            //  agreementTranslationRightsHolderName += '<div class="container wrapperContainer pull-left">';
            agreementTranslationRightsHolderName += '<div class="row">';
            agreementTranslationRightsHolderName += '<div class="col-md-12">';
            agreementTranslationRightsHolderName += '<label  id="agreementTranslationRightsHolderName' + d + '"  class="control-label pull-left"></label>';
            agreementTranslationRightsHolderName += '</div>';
            agreementTranslationRightsHolderName += '</div>';

            $(agreementTranslationRightsHolderName).appendTo('#agreementTranslationRightsHolderName');

            console.log("agreementTranslationRightsHolderName" + d + " created ");
        }

        /*
         * 3: Fill the tabs - Translator(s)
         */

        var w = 1;

        console.log("translators.length  " + translators.length);

        for (var j = 0; j < translators.length; j++) {

            console.log("8 xyz  translators  :");
            console.log(translators);

            console.log("555transArray  #################   j  " + j + " i " + i);
            console.log("555transArray  #################   translators", translators);
//                        console.log("555transArray  #################   translatorNamesForGenerateTranslatorTab[" + j + "]", translators[j][0]);
            console.log("8 xyz  translatorNamesForGenerateTranslatorTab[" + j + "]", translatorNamesForGenerateTranslatorTab[j]);


            /*
             * CV
             */

            if (translatorNamesForGenerateTranslatorTab[j] === 'null') {

                console.log("8 xyz  translatorNamesForGenerateTranslatorTab=[" + j + "]", translatorNamesForGenerateTranslatorTab[j]);
                document.getElementById('uploadCV' + j).innerHTML = 'Copy of the CV with ' + translatorNamesForGenerateTranslatorTab[j];

            } else {

                console.log("8 xyz ON i " + i);
                console.log("8 xyz ON j " + j);
                console.log("8 xyz ON w " + w);

                console.log("8 xyz Array translatorNamesForGenerateTranslatorTab j ", translatorNamesForGenerateTranslatorTab[j]);

                $('#cvToggle' + w).toggle();
                $('#cv_button' + w).toggle();

                $('#contractToggle' + w).toggle();
                $('#contract_button' + w).toggle();

                console.log("8 xyz 1 Array translators ", translators);
                console.log("8 xyz 1 Array translators.length ", translators.length);

                for (var s = 0; s < translators.length; s++) {
                    console.log("8 xyz 2 Loop translators s=" + s, translators[0][s]);
                }

                console.log("8 xyz 2 Array translators j=" + j, translators[0][j]);



                var transArray = translators[0][j];
                console.log("8 xyz  transArray 1 transArray ");
                console.log(transArray);

                var transArray1 = translators[0][j];
                console.log("8 xyz  transArray 1 transArray1 ");
                console.log(transArray1);

                console.log("8 xyz 1 ON i " + i);
                console.log("8 xyz 1 ON j " + j);
                console.log("8 xyz 1 ON w " + w);

                var transArray1 = transArray.replace("[", "");
                var transArray2 = transArray1.replace("]", "");

                var linkArray = transArray2.split(",");
                for (var s = 0; s < linkArray.length; s++) {
                    console.log("8 xyz 2 Loop linkArray s=" + s, linkArray[s]);
                }



                console.log("8 xyz linkArray[1]  " + linkArray[1]);
                console.log("8 xyz linkArray[2]  " + linkArray[2]);
                console.log("8 xyz linkArray[3]  " + linkArray[3]);
                console.log("8 xyz linkArray[4]  " + linkArray[4]);
                console.log("8 xyz 1 ON i " + i);
                console.log("8 xyz 1 ON j " + j);
                console.log("8 xyz 1 ON w " + w);
                document.getElementById("cv_button_label" + w).innerHTML = 'Open copy of the CV';// + translatorNamesForGenerateTranslatorTab[j];
                document.getElementById('cv_link' + w).href = "https://www.literatureirelandgrantapplication.com" + linkArray[2].trim() + " ";

                console.log("8 xyz linkArray[3]  " + linkArray[3]);

                document.getElementById("contract_button_label" + w).innerHTML = 'Open copy of the contract';// + translatorNamesForGenerateTranslatorTab[j];
                document.getElementById('contract_link' + w).href = "https://www.literatureirelandgrantapplication.com" + linkArray[3].trim() + " ";

            }

            w++;  // next translator

        }

        /*
         * 3: Fill the tabs - Rights Agreement
         */

        for (var j = 0; j < rowdata.rightsAgreement.length; j++) {

            var rightsAgreementArray = rowdata.rightsAgreement[j].split(",");

            console.log("8 xyz  rightsAgreementArray for Loop :");
            console.log(rightsAgreementArray);
            console.log("8 xyz  rightsHolderArray for Loop :");
            console.log(rightsHolderArray);

            for (var v = 0; v < rightsAgreementArray.length; v++) {

                console.log("8 xyz  rightsAgreementArray  :" + rightsAgreementArray[v].substr(1) + " w: " + w);
                console.log("8 xyz ON i " + i);
                console.log("8 xyz ON j " + j);
                console.log("8 xyz ON v " + v);
                console.log("8 xyz ON w " + w);
                console.log("8 xyz  rightsAgreementArray before switch :", rightsAgreementArray[v].substr(1) + ":");
                console.log("8 xyz  rightsAgreementArray 1 before switch  :", rightsAgreementArray[v].substr(1) + ":");
                console.log("8 xyz  rightsAgreementArray 1 before switch  :", rightsHolderArray[0] + ":");
                console.log("8 xyz  rightsAgreementArray before switch j :", rightsHolderArray[j] + ":");
                console.log("8 xyz  rightsAgreementArray 1 before switch  :", rightsHolderArray[0][1] + ":");

                switch (v) {

                    case 0:
//                        if (w === 1) {
                        console.log("8 xyz  rightsAgreementArray case 0: w :", w + ":");
                        // Agreement
                        console.log("8 xyz  rightsAgreementArray case 0: :", rightsAgreementArray[v].substr(1) + ":");
                        console.log("8 xyz  rightsAgreementArray case 0: w:", w + ":");
                        if (rightsAgreementArray[v].substr(1) !== 'null') {
                            console.log("8 xyz case 0  [" + j + "]");
                            console.log("8 xyz  rightsAgreementArray 1 case 0:  :", rightsAgreementArray[v].substr(1) + ":");
                            console.log("8 xyz  rightsAgreementArray 1 case 0:  :", rightsHolderArray[0] + ":");
                            console.log("8 xyz  rightsAgreementArray 1 case 0: j :", rightsHolderArray[j] + ":");
//                                        document.getElementById('agreement_link' + w).href = "https://www.literatureirelandgrantapplication.com" + rightsAgreementArray[v].substr(1) + " ";
                            document.getElementById('agreement_link1').href = "https://www.literatureirelandgrantapplication.com" + rightsAgreementArray[v].substr(1) + " ";
                        }
                        break;
//                        }
                    case 1:
//                        if (w === 1) {
                        console.log("8 xyz  rightsAgreementArray w :", w + ":");
                        // AgreementDocName
                        console.log("8 xyz case 1 [" + j + "]");
                        if (rightsAgreementArray[v].substr(1) === 'null') {
                            console.log("8 xyz  ", translatorNamesForGenerateTranslatorTab[j]);
                            console.log("8 xyz case 1 === null ");

                            document.getElementById('uploadAgreement1').innerHTML = 'Copy of the agreement with ' + translatorNamesForGenerateTranslatorTab[j];
                        } else {
                            console.log("8 xyz case 1 toggle ");
                            $('#agreementToggle1').toggle();
                            $('#agreement_button1').toggle();
                            console.log("8 xyz  rightsAgreementArray case 1: j :", rightsHolderArray[j] + ":");
                            console.log("8 xyz  rightsAgreementArray [0]  case 1:  :", rightsHolderArray[0] + ":");
                            var rha = rightsHolderArray[0];
                            console.log("8 xyz  rightsAgreementArray rha[0] case 1:  :", rha[0] + ":");

//                                        document.getElementById("agreement_button_label" + w).innerHTML = 'Open copy agreement with ' + translatorNamesForGenerateTranslatorTab[j] + ' <br/>'; //+ translatorNamesForGenerateTranslatorTab[j];
                            document.getElementById("agreement_button_label1").innerHTML = 'Open a copy agreement with with the translation rights holder(s) <br/>'; //+ translatorNamesForGenerateTranslatorTab[j];

                        }
                        break;
//                        }
//                    case 2:
                        // Contract

//                        if (rightsAgreementArray[v].substr(1) !== 'null') {
//
//                            document.getElementById('contract_link' + w).href = "https://www.literatureirelandgrantapplication.com" + rightsAgreementArray[v].substr(1) + " ";
//                        }
//                        break;
//                    case 3:
                        // ContractDocName

//                        if (rightsAgreementArray[v].substr(1) === 'null') {
//                            document.getElementById('uploadContract' + w).innerHTML = 'Copy of the contract with ' + translatorNamesForGenerateTranslatorTab[j];
//                        } else {
//
////                                        $('#contractToggle' + w).toggle();
////                                        $('#contract_button' + w).toggle();
//                            document.getElementById("contract_button_label" + w).innerHTML = 'Open copy of the contract '; //with ' + translatorNamesForGenerateTranslatorTab[j];
//
//                        }
//                        break;
                    case 2:
                        // AddendumRightsAgreement
                        console.log("8 xyz  rightsAgreementArray AddendumRightsAgreement: :", rightsAgreementArray[v].substr(1) + ":");

                        if (rightsAgreementArray[v].substr(1) !== 'null') {
                            console.log("8 xyz case 2  [" + j + "]");
                            console.log("8 xyz  rightsAgreementArray 1 case 2:  :", rightsAgreementArray[v].substr(1) + ":");
                            console.log("8 xyz  rightsAgreementArray 1 rightsHolderArray case 2:  :", rightsHolderArray[0] + ":");
                            console.log("8 xyz  rightsAgreementArray 1 rightsHolderArray case 2: j :", rightsHolderArray[j] + ":");
//                                        document.getElementById('agreement_link' + w).href = "https://www.literatureirelandgrantapplication.com" + rightsAgreementArray[v].substr(1) + " ";
                            document.getElementById('addendum_link1').href = "https://www.literatureirelandgrantapplication.com" + rightsAgreementArray[v].substr(1) + " ";
//                            document.getElementById('addendum_link' + w).href = "https://www.literatureirelandgrantapplication.com" + rightsAgreementArray[v].substr(1) + " ";
                        }
                        break;
                    case 3:
                        // AddendumRightsAgreementName
                        console.log("8 xyz case 3 [" + j + "]");
                        console.log("8 xyz  rightsAgreementArray case 3  AddendumRightsAgreementName: :", rightsAgreementArray[v].substr(1) + ":");

                        if (rightsAgreementArray[v].substr(1) === 'null') {
                            console.log("8 xyz  ", translatorNamesForGenerateTranslatorTab[j]);
                            console.log("8 xyz case 3 === null ");

//                            document.getElementById('uploadAddendum1').innerHTML = 'Copy of the agreement with ' + translatorNamesForGenerateTranslatorTab[j];
                        } else {
                            console.log("8 xyz case 3 toggle AddendumRightsAgreementName");
                            $('#addendumToggle1').toggle();
                            $('#addendum_button1').toggle();
                            document.getElementById("addendum_button_label1").innerHTML = 'Open a copy of the addendum to the rights agreement with the translation rights holder(s) <br/>'; //+ translatorNamesForGenerateTranslatorTab[j];
                        }

                        break;

                }//switch

            } //for (var v = 0; v < rightsAgreementArray.length; v++) {

            console.log("555transArray  #################   j  " + j + " i " + i);
            console.log("555transArray  #################   translators", translators);
//                        console.log("555transArray  #################   translatorNamesForGenerateTranslatorTab[" + j + "]", translators[j][0]);
            console.log("8 xyz  translatorNamesForGenerateTranslatorTab[" + j + "]", translatorNamesForGenerateTranslatorTab[j]);



            /*
             * CV
             */

            if (translatorNamesForGenerateTranslatorTab[j] === 'null') {

                console.log("8 xyz  translatorNamesForGenerateTranslatorTab[" + j + "]", translatorNamesForGenerateTranslatorTab[j]);
                document.getElementById('uploadCV' + j).innerHTML = 'Upload a copy of the CV with ' + translatorNamesForGenerateTranslatorTab[j];
                document.getElementById('label_translator' + j).value = "not entered";

            } else {
                console.log("8 xyz ON i " + i);
                console.log("8 xyz ON j " + j);
                console.log("8 xyz ON w " + w);

                console.log("8 xyz Array translatorNamesForGenerateTranslatorTab[j= " + j + "] ", translatorNamesForGenerateTranslatorTab[j]);
//                console.log("81 xyz translators[j][0]  " + translators[j][0]);
                console.log("81 xyz translators[0][j]  " + translators[0][j]);

                $('#cvToggle' + w).toggle();
                $('#cv_button' + w).toggle();
                console.log("Toggle 1 " + w);
                var transArray = translators[0][j];

                transArray = transArray.replace("[", "");
                transArray = transArray.replace("]", "");

                var linkArray = transArray.split(",");

                console.log("8 xyz linkArray[2]  " + linkArray[2]);
                console.log("8 xyz ON i " + i);
                console.log("8 xyz ON j " + j);
                console.log("8 xyz ON w " + w);
                console.log("Toggle 2 " + w);
//                document.getElementById("cv_button_label" + w).innerHTML = 'Open copy of the CV for ' + translatorNamesForGenerateTranslatorTab[j];
//                document.getElementById('cv_link' + w).href = "https://www.literatureirelandgrantapplication.com" + linkArray[2].trim() + " ";

            }
            console.log("8 xyz ON i " + i);
            console.log("8 xyz ON j " + j);
            console.log("8 xyz ON w " + w);
            w++;  // next translator

        }

        console.log("generateTranslatorTab translatorArray " + translators.length);

    });
});






//get selectpicker selection 

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


// the following functions will copy the selected file name (for upload) to the label input
//get selectpicker selection 

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


// the following functions will copy the selected file name (for upload) to the label input

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


//copyFirstTranslatorName

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
 * copyFirstRightsHolderName
 */

function  copyFirstRightsHolderName() {

    rightsHolderArray = [];
    console.log("copyFirstRightsHolderName rightsHolderArray cleared ", rightsHolderArray);

    var fn = document.getElementById("agreementTranslationRightsHolderName0").textContent;
    console.log("copyFirstRightsHolderName agreementTranslationRightsHolderName0 ", document.getElementById("agreementTranslationRightsHolderName0").textContent);
    console.log("copyFirstRightsHolderName fn.value ", fn.value);
    document.getElementById("firstRightsHolder0").value = document.getElementById("agreementTranslationRightsHolderName0").textContent;
    rightsHolderName = document.getElementById("agreementTranslationRightsHolderName0").textContent;
    console.log("copyFirstRightsHolderName rightsHolderName ", rightsHolderName);
    rightsHolderArray.push(rightsHolderName);
    console.log(" first entry in rightsHolderArray ", fn.value);

    $("#rightsHolderArray").val(rightsHolderArray);
    console.log("copyFirstRightsHolderName rightsHolderArray ", rightsHolderArray);

    // Switch on "Add Additional Rights Holders"
    $('#addAdditionalRightsHoldersModalDiv').toggle();

    // Get Content
    var rightsAgreementContent = document.getElementById("rightsAgreementContracts").innerHTML;

    // Store Content
    if (!localStorage.rightsAgreementContent === 0) {
        //function retrieve(){
        document.getElementById("rightsAgreementContracts").innerHTML = localStorage.getItem("rightsAgreementContent");
        console.log("copyFirstRightsHolderName localStorage.rightsAgreementContent ", localStorage.rightsAgreementContent.length);
        for (i = 0; i < rightsAgreementContent.length; i++) {
            console.log("restored rightsAgreementContent " + rightsAgreementContent);
        }
    }

    // back To Rights tab
//                $('#bs-example-navbar-collapse-2 a[href="#Rights"]').tab('show');
    $('#bs-example-navbar-collapse-2 a[href="#translatorTabs"]').tab('show');
}


/*
 * backToRightsAgreement
 */

function backToRightsAgreement() {
//                alert("backToRightsAgreement");

    $("#addAddRightsHolders").empty();
//    $("#agreementTranslationRightsHolderName").empty();

    $('#agreementTranslationRightsHolderName0').toggle();

    console.log("123v backToRightsAgreement rightsHolderArray  ", rightsHolderArray);

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
//                    alert("backToTranslators false");
//                    return false;
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
    document.getElementById("rightsHoldersNameLabel").innerHTML = 'Translation rights holders';

    /*
     * remove empty items from array
     */
    rightsHolderArray = rightsHolderArray.filter(function (e) {
        return e;
    });

    /*
     * Display all TranslatorrightsHolder input element each
     */
    for (var i = 0; i < rightsHolderArray.length; i++) {

        console.log("backToRightsAgreement rightsHolderArray " + rightsHolderArray[i]);

        var additionalRightsHoldersTag = '';

        additionalRightsHoldersTag += '<div class="row">';
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
        additionalRightsHoldersTag += '</div>';

        $(additionalRightsHoldersTag).appendTo('#agreementTranslationRightsHolderName');

//        console.log("rightsHolderArray.length  " + rightsHolderArray.length + "   <         ");
//        //  agreementTranslationRightsHolderName += '<div class="container wrapperContainer pull-left">';
//        additionalRightsHoldersTag += '<div class="row">';
//        additionalRightsHoldersTag += '<div class="col-md-12">';
//        additionalRightsHoldersTag += '<label  id="agreementTranslationRightsHolderName' + i + '"  class="control-label pull-left"></label>';
//        additionalRightsHoldersTag += '</div>';
//        additionalRightsHoldersTag += '</div>';
//
//        $(additionalRightsHoldersTag).appendTo('#agreementTranslationRightsHolderName');
//
//        document.getElementById("agreementTranslationRightsHolderName" + i).textContent = rightsHolderArray[i];

        console.log("agreementTranslationRightsHolderName" + i + " created ");
        console.log("backToRightsAgreement rightsHolderArray ");
        console.log(rightsHolderArray);

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
    $('#myTab a[href="#Rights"]').tab('show');

    // if we have a final list of translators (more than one)
    // we need to clear a possible existing tab first
//    generateTranslatorTab(0);
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

    /*
     * Generate Translator Tabs in "Publisher and Translation"-Tab
     */

    /*
     * 1: The Nav-Bar
     */

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

    /*
     * 2: The Tabs themselves
     */

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

        rightsAgreementContractsNavContent += '</div  class="container EndwrapperContainer">'; // //container
        rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"

    }

//                show translatorTabs if hidden
    if ($(translatorTabs).css('display') === 'none' || $(translatorTabs).css("visibility") === "hidden") {
        $(translatorTabs).show();
    }

    $(rightsAgreementContractsNavContent).appendTo('#tnc');

}


//backToTranslators

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

        rightsAgreementContractsNavContent += '</div  class="container EndwrapperContainer">'; // //container
        rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"
    }

//                $(rightsAgreementContractsNavContent).appendTo('#tnc');
    $("#translatorArray").val(translatorArray);

}


// add Press Cuttings 

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





$(document).on('hidden.bs.modal', function (event) {
    if ($('.modal:visible').length) {
        $('body').addClass('modal-open');
    }
});


// https://github.com/mgcrea/angular-strap/issues/1343
//var modal_counter = 0;
//$(document).ready(function () {
//    $('.modal').on('shown.bs.modal', function () {
//        modal_counter++;
//    });
//    $('.modal').on('hidden.bs.modal', function () {
//        modal_counter--;
//        if (modal_counter) {
//            $('body').addClass('modal-open');
//        } else {
//            $('body').removeClass('modal-open');
//        }
//    });
//});



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



//formatDate


function formatDate(unformattedDate) {
    if (typeof unformattedDate === "undefined") {
        formattedDate === "";
    } else {
        var date = new Date(unformattedDate);
        var day = date.getDate();
//        console.log("9 xyz day  " + day);
        if (day < 10)
            day = "0" + day;
        var month = date.getMonth() + 1;
//        console.log("9 xyz month  " + month);
        if (month < 10)
            month = "0" + month;
        var year = date.getFullYear();
        var formattedDate = day + "/" + month + "/" + year;

//        console.log("9 xyz unformattedDate  " + unformattedDate);
//        console.log("9 xyz day  " + day);
//        console.log("9 xyz month  " + month);
//        console.log("9 xyz year  " + year);
//        console.log("9 xyz formattedDate  " + formattedDate);


        return formattedDate;
    }
}

$(window).bind("beforeunload", function () {
    var username = document.getElementById("username1").value;
    //   alert("username 2 " + username);
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
    console.log("username openApplication ", username);
    document.getElementById("username4").value = username;
});