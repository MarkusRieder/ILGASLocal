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

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 

        <!--JQuery-->
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <!--<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>-->


        <!-- Bootstrap -->

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--DataTables-->

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/plug-ins/1.10.15/integration/font-awesome/dataTables.fontAwesome.css">


        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker.css" />

        <link rel="stylesheet" href="css/lesshat.css" />
        <link rel="stylesheet" href="css/newfile.css" />
        <link rel="stylesheet" type="text/css" href="css/lightbox.min.css">
        <link rel="stylesheet" href="css/chosen.min.css" />
        <link rel="stylesheet" href="css/jquery.dataTables.yadcf.css" />
        <!--        <link rel="stylesheet" href="css/widgContent.css" />
                <link rel="stylesheet" href="css/widgEditor.css" />-->

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>        
        <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>


        <script type="text/javascript"   src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>  

        <script type="text/javascript"   src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>       
        <!--<script type="text/javascript"   src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>-->
        <script type="text/javascript"   src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript"   src="//cdn.datatables.net/plug-ins/1.10.12/sorting/datetime-moment.js"></script>
        <script type="text/javascript"   src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript"   src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
        <script type="text/javascript"   src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
        <script type="text/javascript"   src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js "></script>
        <script type="text/javascript"   src="//cdn.datatables.net/plug-ins/1.10.15/dataRender/datetime.js"></script>
        <script type="text/javascript"   src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"   src="js/jquery-ui.js"></script>
        <script type="text/javascript"   src="js/lightbox.min.js"></script>

        <script type="text/javascript"   src="js/jquery.dataTables.yadcf.js"></script>
        <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>

        <title>Translation Grant Application System</title>

        <!--Validation-->
        <script>
            $(document).ready(function () {
                $("#alertSuccess").hide();
                $("#errid").hide();
                $("#errname").hide();
                $("#erremail").hide();  //Initially hiding the error spans
                $("#errpass").hide();

                $("#Rbtn").click(function () {
                    var userid = $("#id").val();
                    var username = $("#username").val();
                    var password = $("#password").val(); //triggers on click of register
                    var email = $("#email").val();
                    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                    var letters = /^[A-Za-z]+$/;

                    if (userid == "" || userid == null) {
                        alert("UserID cannot be Empty");
                        return false;
                    } else if (username == null || username == "") {
                        alert("UserName cannot be Empty");
                        return false;
                    } else if (password == "" || password == null) {
                        alert("Password cannot be Empty");
                        return false;

                    } else if (email == "" || email == null) {

                        alert("Email cannot be Empty");
                        return false;
                    } else if (isNaN(userid)) {

                        alert("User ID should contain Only Digits");
                        return false;
                    } else if (!(email.match(mailformat))) {
                        alert("Please Enter Valid Mail ID");

                        return false;
                    } else if (!(username.match(letters))) {
                        alert("Pleas Enter only Characters for Username");
                        return false;
                    } else {
                        $("#alertSuccess").show();
                        $("#formid").submit();
                        return true;
                    }

                });


                $("#id").change(function () {
                    var userid = $("#id").val();   //here we are restricting the user at the time of typing,we called an event "Keyup"
                    if (isNaN(userid)) {

                        $("#errid").show();  //if user enters other than number then the error span will be shown
                        return false;
                    } else {
                        $("#errid").hide();


                        return true;
                    }


                });
                $("#username").change(function () {
                    var username = $("#username").val();
                    var letters = /^[A-Za-z]+$/;

                    if (!(username.match(letters))) {
                        $("#errname").show();

                        return false;
                    } else {
                        $("#errname").hide();
                        return true;
                    }

                });
                $("#email").change(function () {
                    var email = $("#email").val();

                    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                    if (!(email.match(mailformat))) {
                        $("#erremail").show();


                        return false;
                    } else {
                        $("#erremail").hide();
                        return true;


                    }

                });

                $("#cpassword").change(function () {
                    var password = $("#password").val();
                    var cpassword = $("#cpassword").val();
                    if (!(password === cpassword)) {
                        $("#errpass").show();
                        return false;

                    } else {
                        $("#errpass").hide();

                        return true;
                    }
                });
            });

        </script>

        <!--getTodaysDate-->
        <script type="text/javascript">

            function getTodaysDate() {
                var date = new Date();
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                if (month < 10)
                    month = "0" + month;
                if (day < 10)
                    day = "0" + day;
                var today = day + "/" + month + "/" + year;
                document.getElementById('sampleSentOut1').value = today;
            }
            ;
        </script>

        <!--Global Variables-->
        <script>
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
//            var i;
//            console.log("local storage - welcome_staff.jsp");
//            for (i = 0; i < localStorage.length; i++) {
//                console.log(localStorage.key(i) + "=[" + localStorage.getItem(localStorage.key(i)) + "]");
//            }
//
//            console.log("session storage");
//            for (i = 0; i < sessionStorage.length; i++) {
//                console.log(sessionStorage.key(i) + "=[" + sessionStorage.getItem(sessionStorage.key(i)) + "]");
//            }
//            var table = null;

            var detailsTable = null;
            var agreemnt = "";
            var contr = "";
            var transSamp = "";
            var trans = "";
            var cver = "";
            var cntr = 0;
            var orig = "";
            var addendumRightsAgreemnt = "";
            var proofOfPaymentToTrans = "";
            var bankDetailsFrm = "";
            var signedLIContr = "";
            var TranslName = "";
            var bookTitles = "";
            var TranslTitles = "";
            var TranslatorDocs = [];
            var readerReport = "";
            var genreTable = null;
//
//            var floprowdata;
//
//            var floprowdata1;
//            var row1;
            var rowdata1 = [];
            var rowdata = [];
            var oTable;
        </script>

        <!--newGenre-->
        <script type="text/javascript">
            $(document).ready(function () {
                $.fn.dataTable.ext.buttons.newGenre = {
                    text: 'newGenre'
                };
                var genreTable = $('#genreTable').DataTable({

                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'newGenre',
                            text: '<i class="fa fa-plus-square " style="font-size:24px;color:blue"></i>',
                            titleAttr: 'Add new Genre',
                            attr: {
                                id: 'newGenre'
                            }

                            //                            action: function (e, dt, button, config) {
                            //                                $('.reportFiltrsButton').attr(
                            //                                        {
                            //                                            "data-toggle": "modal",
                            //                                            "data-target": "#createNewGenremodal"
                            //                                        }
                            //                                );
                            ////                                $('#createNewGenremodal').modal('show');
                            //                            }
                        }
                    ],
                    "bProcessing": false,
                    "bServerSide": false,
                    "sAjaxSource": "./GenresDataServlet",
                    "columns": [
                        {
                            "class": "delete-control",
                            "orderable": false,
                            "data": null,
                            "defaultContent": ""
                        },
                        {"data": "genre",
                            "render": function (data, type, row) {
                                console.log("genres: " + data);
                                return  data;
                            }},
                        {"data": "idgenres"},
                        {"data": "idgenres"}
                    ],
                    columnDefs: [
                        {width: "5%", targets: 0},
                        {
                            targets: -1,
                            visible: false
                        },
                        {className: "dt-left", "targets": [1, 2]}
                    ],
                    fixedColumns: true
                });
                $('#genreTable tbody').on('click', 'tr td.delete-control', function () {

                    var tr = $(this).closest('tr');
                    var row = genreTable.row(tr);
                    var rowdata = (genreTable.row(tr).data());
                    console.log(genreTable.row(this).data());
                    var idToDelete = rowdata.idgenres;
                    var genreToDelete = rowdata.genre;
                    console.log("idToDelete  " + idToDelete);
                    console.log("genreToDelete  " + genreToDelete);
                    if ($(this).hasClass('selected')) {
                        $(this).removeClass('selected');
                    } else {
                        genreTable.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                    }

                    console.log("genreToDelete 22 " + $(this).val());
                    $.ajax({
                        type: "POST",
                        url: "./GenreDelete",
                        data: "id=" + idToDelete,
                        success: function (data, status, xhr) {

                            //delete the row
                            genreTable.row('.selected').remove().draw(false);
                            genreTable.ajax.reload();
                            document.getElementById("showDeletedGenre").innerHTML = "Genre: <strong>'" + genreToDelete + "'</strong> has been  <strong>successfully</strong> deleted!";
                            $("#deleteGenreSuccessModal").modal('show');
                        },
                        error: function (xhr) {
                            alert("Error");
                            $('#edtModal').show();
                            //error handling
                        }});
                });
                var genreToAdd = document.getElementById('addGenre').value;
                $('#newGenre').on('click', function () {
                    $('#createNewGenremodal').modal('show');
                    console.log("genreToAdd " + genreToAdd);
                });

                $('#addGenreButton').on('click', function () {
                    var genreToAdd = document.getElementById('addGenre').value;
                    console.log("genreToAdd " + genreToAdd);
                    $.ajax({
                        type: "POST",
                        url: "./GenreAdd",
                        data: "genre=" + genreToAdd,
                        success: function (data, status, xhr) {
                            console.log("data " + data);
                            console.log("status " + status);
                            console.log("xhr " + xhr);
                            genreTable.ajax.reload();
                            document.getElementById("showAddedGenre").innerHTML = "Genre: <strong>'" + genreToAdd + "'</strong> has been  <strong>successfully</strong> added!";
                            $("#addGenreSuccessModal").modal('show');
                        },
                        error: function (xhr) {
                            alert("Error");
                            $('#edtModal').show();
                            //error handling
                        }});

                });
            });
        </script>

        <!--User-->
        <script type="text/javascript">
            $(document).ready(function () {
                $.fn.dataTable.ext.buttons.newStaff = {
                    text: 'NewStaff'

                };
                var table = $("#user").DataTable({

                    dom: 'Bfrtip',
                    buttons: [
                        {

                            text: '<i class="fa fa-envelope" style="font-size:24px;color:blue"></i> Email',
                            titleAttr: 'email',
                            action: function (e, node, config) {
                                $('#email').modal('show');
                            }

                        },
                        {
                            extend: 'newStaff',
                            text: '<i class="fa fa-user-plus" style="font-size:24px;color:blue"></i>',
                            titleAttr: 'Add new Staff Member',
                            action: function (e, dt, button, config) {
                                $('.reportFiltrsButton').attr(
                                        {
                                            "data-toggle": "modal",
                                            "data-target": "#createNewStaffmodal"
                                        }
                                );
                                $('#createNewStaffmodal').modal('show');
                            }
                        }
                    ],
                    "bProcessing": false,
                    "bServerSide": false,
                    "sAjaxSource": "./UserDataServlet",
                    "columns": [{
                            "targets": -1,
                            "class": "details-control",
                            "orderable": false,
                            "data": null,
                            "defaultContent": ""
                        },
                        {"data": "USERNAME"},
                        {"data": "FIRST_NAME"},
                        {"data": "LAST_NAME"},
                        {"data": "EMAIL",
                            "render": function (data, type, row) {
//                                $mail = 'mailto: ' + data + '';
//                                console.log($mail);
                                return '<a href="mailto:' + data + '"><i class="fa fa-envelope" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "FUNCTION"},
                        {"data": "ROLE"},
                        {"data": "EMAIL_VERIFICATION_ATTEMPTS"}
                    ],
                    columnDefs: [
                        {
                            targets: -1,
                            visible: false
                        },
                        {className: "dt-left", "targets": [1, 2, 3]}
                    ]
                });
                $('#user tbody').on('click', 'tr td.details-control', function () {


                    var tr = $(this).closest('tr');
                    var row = table.row(tr);
                    var rowdata = (table.row(tr).data());
//                    console.log("rowdata  "  + rowdata.value);

                    $('#usr_name').html("User Details for: " + rowdata.FIRST_NAME + " " + rowdata.LAST_NAME);
                    var mail = 'mailto: ' + rowdata.EMAIL;
                    $('#msg_val').html("Send email to: " + rowdata.FIRST_NAME + " " + rowdata.LAST_NAME);
                    document.getElementById("mails").href = mail;
                    $("#userModal").modal("show");
                    $("#userUname").val($(this).closest('tr').children()[1].textContent); // uname
                    $("#userFirstName").val($(this).closest('tr').children()[2].textContent); // First
                    $("#userLastName").val($(this).closest('tr').children()[3].textContent); // Last
                    $("#userEmail").val($(this).closest('tr').children()[4].textContent); // EMAIL     
//                    var m = $mail;
//                    alert(m);
//                    $("#userEmail").val(m);
                    $("#userFunction").val($(this).closest('tr').children()[5].textContent); // Function
                    $("#userRole").val($(this).closest('tr').children()[6].textContent); // Role
                    console.log(table.row(this).data());
                });
//                console.log(table);

            });
        </script>


        <!--ExpertReader-->
        <script type="text/javascript">
            $(document).ready(function () {
                $.fn.dataTable.ext.buttons.reload = {
                    text: 'Reload'

                };
                var table = $('#expReader').DataTable({

                    /**
                     B - Buttons
                     f - filtering input
                     r - processing display element
                     t - The table!
                     p - pagination control
                     
                     **/

                    dom: 'Bfrtip',
                    buttons: [
//                           {
//                            //only enabled when one row is selected (like edit / delete)
//                            extend: 'selectedSingle', //alternative would be 'selected' (multiple rows)
//                                    text: 'reportFiltrsLabel',
//                                    className: "reportFiltrsButton",
//                                    action: function (e, dt, button, config) {
//                                    $('.reportFiltrsButton').attr(
//                                    {
//                                    "data-toggle": "modal",
//                                            "data-target": "#createNewEReadermodal"
//                                    }
//                                    );
//                                    showReportFiltrTable();
//                                    }
//                            },
                        {
                            extend: 'reload',
                            text: '<i class="fa fa-user-plus" style="font-size:24px;color:blue"></i>',
                            titleAttr: 'Add new Expert Reader',
                            action: function (e, dt, button, config) {
                                $('.reportFiltrsButton').attr(
                                        {
                                            "data-toggle": "modal",
                                            "data-target": "#createNewEReadermodal"
                                        }
                                );
                                $('#createNewEReadermodal').modal('show');
                            }

                        }


                    ],
                    "columnDefs": [
                        {className: "dt-left", "targets": [1, 2, 3]}
                    ],
                    "bProcessing": false,
                    "bServerSide": false,
                    "sAjaxSource": "./ExpertReaderDataServlet",
                    "columns": [{
                            "targets": -1,
                            "class": "details-control",
                            "orderable": false,
                            "data": null,
                            "defaultContent": ""
                        },
                        {"data": "FIRST_NAME"},
                        {"data": "LAST_NAME"},
                        {"data": "EMAIL"}
                    ]
                });
                $('#expReader tbody').on('click', 'tr td.details-control', function () {
                    $("#expReaderModal").modal("show");
                    $("#FirstNameExpReader").val($(this).closest('tr').children()[1].textContent); // Reference
                    $("#LastNameExpReader").val($(this).closest('tr').children()[2].textContent); // Author
                    $("#EmailExpReader").val($(this).closest('tr').children()[3].textContent); // Year                    
                    //   console.log(table.row(this).data());
                });
            });
        </script>


        <!--Books-->
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $("#books").DataTable({
                    "processing": true,
                    'language': {
                        "loadingRecords": "&nbsp; ",
                        "processing": "Loading Library..."
                    },
                    "bServerSide": false,
                    "sAjaxSource": "./LibraryDataServlet",
                    "columns": [{
                            "className": 'details-control',
                            "orderable": false,
                            "data": null,
                            "defaultContent": ''
                        },
                        {"data": "bookID"},
                        {"data": "referenceNumber"},
                        {"data": "Author",
                            "render": function (data, type, full, meta) {

                                //if length = 1 we have just 1 Author ==> display
                                //if length > 1 we have more than 1 Author ==>
                                // display first Author - put the rest into modal2
                                //     console.log("Author length :" + data.length);
//                                if (type === 'display') {
//                                    return '<textarea name="Author" rows="2" cols="40">'
//                                            + data
//                                            + '</textarea>';
//                                }
                                return data;
                            }
                        },
                        {"data": "Title",
                            "render": function (data, type, full, meta) {
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                                console.log("Title " + data);
                            }},
                        {"data": "Publisher",
                            "render": function (data, type, full, meta) {
                                console.log("Publisher " + data);
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                            }},
                        {"data": "Publisheryear",
                            "render": function (data, type, full, meta) {
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                                console.log("Publisheryear " + data);
                            }},
                        {"data": "Genre",
                            "render": function (data, type, full, meta) {
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                                console.log("Genre " + data);
                            }},
                        {"data": "translationTitle",
                            "render": function (data, type, full, meta) {
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                                console.log("translationTitle " + data);
                            }},
                        {"data": "translationPublisher",
                            "render": function (data, type, full, meta) {
                                console.log("translationPublisher " + data);
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                            }},
                        {"data": "translationPublisherYear",
                            "render": function (data, type, full, meta) {
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                                console.log("translationPublisherYear " + data);
                            }},
                        {"data": "Translator",
                            "render": function (data, type, full, meta) {

                                //if length = 1 we have just 1 Translator ==> display
                                //if length >  we have more than 1 Translator ==>
                                // display first Translator - put the rest into modal2
                                //     console.log("Author length :" + data.length);
//                                if (type === 'display') {
//                                    return '<textarea name="Translator" rows="2" cols="40">'
//                                            + data
//                                            + '</textarea>';
//                                }
                                return data;
                            }},
                        {"data": "Language",
                            "render": function (data, type, full, meta) {
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                                console.log("Language: " + data);
                            }},
//                        {"data": "physicalDescription"},
//                        {"data": "Duplicates"},
                        //{"data": "Copies"},
                        {"data": "translationPublisherYear",
                            "render": function (data, type, full, meta) {
                                console.log("translationPublisherYear " + data);
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                            }
                        }, //as dummy for Copies
                        {"data": "Notes",
                            "render": function (data, type, full, meta) {
                                console.log("Notes " + data);
                                if (typeof (data) === "undefined") {
                                    return 'Notes n/a';
                                } else {
                                    return data;
                                }
                            }},
                        {"data": "ISBN",
                            "render": function (data, type, full, meta) {
                                console.log("ISBN " + data);
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                            }
                        },
                        {"data": "ISSN",
                            "render": function (data, type, full, meta) {
                                console.log("ISSN " + data);
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                            }
                        },
                        {"data": "cover",
                            "render": function (data, type, row) {
                                if (typeof (data) === "undefined") {

                                    return '<img src="http://localhost/images/not-available.jpg" width="275" height="275" alt="not-available"/>';
                                } else {
                                    return '<img src="http://localhost' + data + '">';
                                }
                            }}
                    ],
                    columnDefs: [
                        {
                            targets: -1,
                            visible: false
                        },
                        {className: "dt-left", "targets": [1, 2, 3, 4, 5, 6, 7, 8]}
                    ]

                });
                $('#books tbody').on('click', 'tr td.details-control', function () {

                    var cver = "";
                    var tr = $(this).closest('tr');
                    var row = table.row(tr);
                    var rowdata = (table.row(tr).data());
                    $("#booksModal").modal("show");
                    $("#referenceNumber").val($(this).closest('tr').children()[3].textContent); // ID
                    //  $("#Author").val($(this).closest('tr').children()[4].textContent); // uname

                    console.log("lib a1  " + $(this).closest('tr').children()[1].textContent);
                    console.log("lib b2 id " + $(this).closest('tr').children()[2].textContent);
                    console.log("lib c3 ref " + $(this).closest('tr').children()[3].textContent);
                    console.log("lib d4 Author  " + $(this).closest('tr').children()[4].textContent); //Author
                    console.log("lib e5 Org Title " + $(this).closest('tr').children()[5].textContent);
                    console.log("lib f6 Publisher " + $(this).closest('tr').children()[6].textContent);
                    console.log("lib g7 Publisheryear " + $(this).closest('tr').children()[7].textContent);
                    console.log("lib h8 Genre " + $(this).closest('tr').children()[8].textContent);
                    console.log("lib i9 Trans Title " + $(this).closest('tr').children()[9].textContent);
                    console.log("lib j10 Translator " + $(this).closest('tr').children()[10].textContent);
                    console.log("lib k11 Language " + $(this).closest('tr').children()[11].textContent);
                    console.log("lib l12 translationPublisherYear " + $(this).closest('tr').children()[12].textContent);
                    console.log("lib m13 Notes " + $(this).closest('tr').children()[13].textContent);
                    console.log("lib n14  " + $(this).closest('tr').children()[14].textContent);
                    console.log("lib o15 ISSN " + $(this).closest('tr').children()[15].textContent);
                    console.log("lib p16 ISBN " + $(this).closest('tr').children()[16].textContent);
//                    console.log("lib q17 ??? " + $(this).closest('tr').children()[17].textContent);

                    var authors = rowdata.Author;
                    // var authors = "AuthorFirst7 AuthorLast7, AuthorFirst777 AuthorLast777, AuthorFirst7 AuthorLast7";
                    console.log("lib 41 Author  " + rowdata.Author);
                    $("#Author").val(authors);
                    $("#Translator").val(rowdata.Translator);

                    if (typeof (rowdata.cover) === "undefined") {
                        var cver = 'images/not-available.jpg';
                    } else {
                        var cver = 'http://localhost' + rowdata.cover + '';
                    }

                    $("#bookCover").val(cver);
                    document.getElementById("bookCover").src = cver;
                    $("#OrgTitle").val($(this).closest('tr').children()[4].textContent); // First
                    $("#Publisher").val($(this).closest('tr').children()[5].textContent); // First
                    $("#Publisheryear").val($(this).closest('tr').children()[6].textContent); // First
                    $("#TransTitle").val($(this).closest('tr').children()[8].textContent); // First
                    $("#Translator").val($(this).closest('tr').children()[11].textContent); // First
                    $("#translationPublisher").val($(this).closest('tr').children()[9].textContent); // First
                    $("#Genre").val($(this).closest('tr').children()[7].textContent); // Last
                    $("#Language").val($(this).closest('tr').children()[12].textContent); // Function
                    $("#ISBN").val($(this).closest('tr').children()[15].textContent); // Role
                    $("#ISSN").val($(this).closest('tr').children()[16].textContent); // Role

                    console.log(table.row(this).data());
                });
//                $('#books tbody').on('click', 'tr td.btn-control', function () {
//
//                    var cver = "";
//                    var tr = $(this).closest('tr');
//                    var row = table.row(tr);
//                    var rowdata = (table.row(tr).data());
//                    $("#editBooksModal").modal("show");
//                    $("#referenceNumber2").val($(this).closest('tr').children()[3].textContent); // ID
//                    $("#Author2").val($(this).closest('tr').children()[4].textContent); // uname
//
//                    if (typeof (rowdata.cover) === "undefined") {
//                        var cver = 'images/not-available.jpg';
//                    } else {
//                        var cver = 'http://localhost' + rowdata.cover + '';
//                    }
//
//                    $("#bookCover").val(cver);
//                    document.getElementById("bookCover").src = cver;
//                    $("#Title2").val($(this).closest('tr').children()[5].textContent); // First
//                    $("#Genre2").val($(this).closest('tr').children()[7].textContent); // Last
//                    $("#Language2").val($(this).closest('tr').children()[11].textContent); // Function
//                    //      $("#ISBN2").val($(this).closest('tr').children()[16].textContent); // Role
//
//                    console.log(table.row(this).data());
//                });
            });
        </script>

        <script type="text/javascript">
            function saveBooks() {
                alert("save Books to do");
            }
        </script>

        <!-- detailsTable-->              
        <script>
            $(document).ready(function () {
                var rowdata1 = [];
                var rowdata = [];
                detailsTable = $('#applications1').DataTable({
                    "processing": true,
                    'language': {
                        "loadingRecords": "&nbsp; ",
                        "processing": "Loading Applications..."
                    },
                    data: [],
                    "columns": [
                        {
                            "targets": 0,
                            "class": "details-control",
                            "orderable": false,
                            "data": null,
                            "defaultContent": ""
                        },
                        {"data": "ReferenceNumber",
                            "render": function (data) {
//                                console.log("ReferenceNumber  " + data);
                                return data;
                            }},
                        {"data": "company"},
                        {"data": "agreement",
                            "render": function (data, type, row) {

                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "contract",
                            "render": function (data, type, row) {

                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "proposedDateOfPublication",
                            "render": function (data) {

                                var date = new Date(data);
                                var month = date.getMonth() + 1;
                                return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                            }},
                        {"data": "proposedPrintRun"},
                        {"data": "plannedPageExtent",
                            "render": function (data, type, row) {
                                console.log("88888 plannedPageExtent " + data);

                            }},
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
                        {"data": "bookNotes"},
                        {"data": "Status"},
                        {"data": "copiesSent",
                            "render": function (data) {
                                console.log("88888 copiesSent " + data);
                                if (data === 0) {
                                    return 'No';
                                } else {
                                    return 'Yes';
                                }
                                ;
                            }},
                        {"data": "dateCopiesWereSent",
                            "render": function (data) {
                                var date = new Date(data);
                                var month = date.getMonth() + 1;
                                return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                            }
                        },
                        {"data": "copiesTranslationSample",
                            "render": function (data, type, row) {

                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "TC_ACCEPTED",
                            "render": function (data, type, row) {
                                if (data === 0) {
                                    console.log("TC_ACCEPTED " + 'No');
                                    return 'No';
                                } else {
                                    console.log("TC_ACCEPTED " + 'Yes');
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
//                                console.log("data:TranslatorName  " + data);
                                return data;
                            }},
                        {"data": "expertReaderName",
                            "render": function (data) {
                                console.log("expertReaderName  " + data);
                                return data;
                            }},
                        {"data": "bookTitle",
                            "render": function (data) {
                                console.log("data:bookTitle  " + data);
                                return data;
                            }},
                        {"data": "TranslatorTrack2",
                            "render": function (data) {
                                console.log("data:TranslatorTrack2  " + data);
                                return data;
                            }},
                        {"data": "Titles",
                            "render": function (data) {
                                console.log("data:Titles  " + data);
                                return data;
                            }},
                        {"data": "translatorCVDocName"},
                        {"data": "cover",
                            "render": function (data, type, row) {
                                if (typeof (data) === "undefined") {

                                    return '<img src="http://www.literatureirelandgrantapplication.com:8080/images/not-available.jpg" width="275" height="275" alt="not-available"/>';
                                } else {
                                    return '<img src="http://www.literatureirelandgrantapplication.com:8080' + data + '">';
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
                        {"data": "expertReaderList"},
                        {"data": "unassignedExpertReaderList"},
                        {"data": "idTranslator"},
                        {"data": "originalDateOfPublication",
                            "render": function (data) {
                                console.log("originalDateOfPublication  " + data);
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "originalLanguage"},
                        {"data": "originalPageExtent"},
                        {"data": "countryOfPublication"},
                        {"data": "foreignPublisher"},
                        {"data": "foreignCountry"},
                        {"data": "targetLanguage"},
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
                        {"data": "boardComments_Instructions"},
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
                        {"data": "paymentReferenceNumber"},
                        {"data": "addendumRightsAgreement",
                            "render": function (data, type, row) {
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "addendumRightsAgreementName"},
                        {"data": "proofOfPaymentToTranslator",
                            "render": function (data, type, row) {
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "proofOfPaymentToTranslatorName"},
                        {"data": "bankDetailsForm",
                            "render": function (data, type, row) {
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "bankDetailsFormName"},
                        {"data": "SignedLIContract",
                            "render": function (data, type, row) {
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "SignedLIContractName"},
                        {"data": "paymentStatus",
                            "render": function (data, type, row) {
                                if (typeof (data) === "undefined") {
                                    return "n/a";
                                } else
                                    return data;
                            }},
                        {"data": "previousGrantAid"},
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
                        {"data": "originalName"},
                        {"data": "Author"},
                        {"data": "publicationYear",
                            "render": function (data, type, row) {
                                console.log("8888 publicationYear " + data);
                                return data;
                            }
                        },
                        {"data": "pressCoverage",
                            "render": function (data, type, row) {
                                console.log("data:pressCoverage " + data);
                                return data;
                            }
                        },
                        {"data": "approveWithdrawnReject"},
                        {"data": "idTranslator"}
                    ],
                    rowCallback: function (row, data) {
                        console.log("rowCallback: rowCallback: 1 ");
                        console.log(data);
//;
//                        console.log("rowCallback: floprowdata ");
//                        console.log(floprowdata);
//                        rowdata = data;
                        rowdata1 = data;
                        console.log("rowCallback: rowdata1 ");
                        console.log(rowdata1);
                        return data;
                    },
//                    async: false,
                    filter: true,
                    info: true,
                    ordering: true,
                    processing: true,
                    retrieve: true
                });
                $('#applications tbody').on('click', 'tr td.details-control', function (e) {
                    e.preventDefault();
                    console.log("eeeeeeeeeeeeeeeeeeee ");
                    console.log(e);
                    /*
                     * 
                     * get rowdata from table where row has been clicked
                     * 
                     */
                    var cver = "";
                    var tr = $(this).closest('tr');
                    var row = oTable.row(tr);
                    var rowdata = (oTable.row(tr).data());
                    console.log("oTable rowdata ");
                    console.log(rowdata);

                    /*
                     * 
                     * Pick up the ReferenceNumber
                     * 
                     */

                    var ReferenceNumber = rowdata.ReferenceNumber;
                    //      alert("ReferenceNumber  " + ReferenceNumber);


                    /*
                     * 
                     * create new URL to retrieve ALL data for detailsTable
                     */


                    var newUrl = "./openSingleApplicationDataServlet?ReferenceNumber=" + ReferenceNumber;

                    $.ajax({
                        type: "get",
                        url: newUrl,
                        async: false,
                        success: function (data) {
                            console.log("success: data");
                            console.log(data);
//                            rowdata = data;
                            rowdata1 = data;
                        }
                    });


                    console.log("rowdata1 |BB||B");
                    console.log(rowdata1);
                    console.log("rowdata1[aaData][0]");
                    console.log(rowdata1["aaData"][0]);
                    rowdata1 = rowdata1["aaData"][0];
                    console.log("rowdata rowdata");
                    rowdata = rowdata1;
                    console.log(rowdata);
//                    var ReferenceNumber1 = rowdata1.ReferenceNumber;
//                    alert("ReferenceNumber 1 " + ReferenceNumber1);

                    $("#applicationsModal").modal("show");

                    var approveWithdrawnReject = rowdata.approveWithdrawnReject;
                    console.log("13131 approveWithdrawnReject  " + approveWithdrawnReject);

                    $("#applicationsModal").modal("show");
                    var approveWithdrawnReject = rowdata.approveWithdrawnReject;
                    console.log("approveWithdrawnReject  " + approveWithdrawnReject);
                    if (approveWithdrawnReject === "Approved") {
                        document.getElementById("Approved").classList.add('active');
                        $("#Approved").click();
                    }

                    if (approveWithdrawnReject === "Withdrawn") {
                        document.getElementById("Withdrawn").classList.add('active');
                        $("#Withdrawn").click();
                    }

                    if (approveWithdrawnReject === "Rejected") {
                        document.getElementById("Rejected").classList.add('active');
                        $("#Rejected").click();
                    }


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
                    var TranslatorDocs = [];
                    var readerReport = "";
                    var expertReaderName = "";
                    var awardValue = rowdata.award;
                    console.log("awardValue:  " + awardValue);
                    if (awardValue === 1) {
                        document.getElementById("award").checked = true;
                        console.log("awardValue:  TRUE");
                    } else if (awardValue === 0) {
                        document.getElementById("award").checked = false;
                        console.log("awardValue:  FALSE");
                    }

                    readerReport = rowdata.readerReport;
                    console.log("rowdata readerReport " + readerReport);
                    bookTitles = rowdata.Titles;
                    console.log("rowdata bookTitles: " + bookTitles);
                    $("#appBookTitle").val(bookTitles.join(""));
                    $("#authorList").val(rowdata.Author);

                    console.log("rowdata.boardMeeting " + rowdata.boardMeeting);
                    if (typeof rowdata.boardMeeting === "undefined") {
                        $("#appDateOfBoardMeeting").val("n/a");
                    } else {
                        $("#appDateOfBoardMeeting").val(formatDate(rowdata.boardMeeting));
                    }


                    if (typeof rowdata.contractSentToPublisher === "undefined") {
                        $("#dateContractSenttoPublisher").val("n/a");
                    } else {
                        $("#dateContractSenttoPublisher").val(formatDate(rowdata.contractSentToPublisher));
                    }
//                    $("#dateContractSenttoPublisher").val(formatDate(rowdata.contractSentToPublisher));

                    if (typeof rowdata.acknowledgementApproved === "undefined") {
                        $("#dateILEAcknowledgementApproved").val("n/a");
                    } else {
                        $("#dateILEAcknowledgementApproved").val(formatDate(rowdata.acknowledgementApproved));
                    }
//                    $("#dateILEAcknowledgementApproved").val(formatDate(rowdata.acknowledgementApproved));


                    if (typeof rowdata.datePublishedBooksReceived === "undefined") {
                        $("#datePublishedBooksReceived").val("n/a");
                    } else {
                        $("#datePublishedBooksReceived").val(formatDate(rowdata.datePublishedBooksReceived));
                    }
//                    $("#datePublishedBooksReceived").val(formatDate(rowdata.datePublishedBooksReceived));

                    if (typeof rowdata.datePaymentMadeToPublisher === "undefined") {
                        $("#datePaymentMadeToPublisher").val("n/a");
                    } else {
                        $("#datePaymentMadeToPublisher").val(formatDate(rowdata.datePaymentMadeToPublisher));
                    }
//                    $("#datePaymentMadeToPublisher").val(formatDate(rowdata.datePaymentMadeToPublisher));
                    console.log("rowdata.paymentReferenceNumber " + rowdata.paymentReferenceNumber);
                    if (rowdata.paymentReferenceNumber === 'null' || rowdata.paymentReferenceNumber === "") {
                        $("#paymentReferenceNumber").val("");
                    } else {
                        $("#paymentReferenceNumber").val(rowdata.paymentReferenceNumber);
                    }
//                    $("#paymentReferenceNumber").val(rowdata.paymentReferenceNumber);
                    var paymentStatusSelected = rowdata.paymentStatus;
                    console.log("13131 paymentStatusSelected " + paymentStatusSelected);
                    setSelectedIndex(document.getElementById('paymentStatus'), paymentStatusSelected);
                    $("#amountApproved").val(rowdata.amountApproved);
                    console.log("rowdata.publisherInformedOfMeeting " + rowdata.publisherInformedOfMeeting);
                    if (typeof rowdata.publisherInformedOfMeeting === "undefined") {
                        $("#datePublisherInformedOfMeeting").val("n/a");
                    } else {
                        $("#datePublisherInformedOfMeeting").val(formatDate(rowdata.publisherInformedOfMeeting));
                    }
//                    $("#datePublisherInformedOfMeeting").val(formatDate(rowdata.publisherInformedOfMeeting));


                    console.log("rowdata.boardComments_Instructions " + rowdata.boardComments_Instructions);
                    if (rowdata.boardComments_Instructions === 'null' || rowdata.boardComments_Instructions === "") {
                        $("#commentsAboutMeeting").val("n/a");
                    } else {
                        $("#commentsAboutMeeting").val(rowdata.boardComments_Instructions);
                    }
//                    $("#commentsAboutMeeting").val(rowdata.boardComments_Instructions);

                    console.log("rowdata.directorChairDecision " + rowdata.directorChairDecision);
                    $("#directorChairDecision").val(rowdata.directorChairDecision);
                    var statii = rowdata.Status;
                    if (statii === 'new') {

                        document.getElementById("appStatus").style.backgroundColor = '#aefca1';
                        document.getElementById("appStatus").value = 'new';
                    } else if (statii === 'open') {

                        document.getElementById("appStatus").style.backgroundColor = '#EFFCA1';
                        document.getElementById("appStatus").value = 'open';
                    } else if (statii === 'pending') {

                        document.getElementById("appStatus").style.backgroundColor = '#FCEFA1';
                        document.getElementById("appStatus").value = 'pending';
                    } else {

                        document.getElementById("appStatus").style.backgroundColor = '#efa1fc';
                        document.getElementById("appStatus").value = 'closed';
                    }

                    $("#appcopiesTranslationSample").val(rowdata.copiesTranslationSample);
                    $("#appDateOfPublicationOriginal").val(rowdata.publicationYear);
                    $("#appPageExtentOriginal").val(rowdata.originalPageExtent);
                    $("#appCountryOfPublication").val(rowdata.countryOfPublication);
                    $("#appLanguageOriginal").val(rowdata.originalLanguage);
                    $("#appGenre").val(rowdata.genre);
                    var copiesSent = rowdata.copiesSent;
                    if (copiesSent === 0) {
                        copiesSent = "No";
                    } else {
                        copiesSent = "Yes";
                    }
                    $("#appcopiesSent").val(copiesSent);
//                    var date = new Date(rowdata.dateCopiesWereSent);
//                    var month = date.getMonth() + 1;
                    var dateCopiesWereSent = formatDate(rowdata.dateCopiesWereSent);
                    $("#appdateCopiesWereSent").val(dateCopiesWereSent);
                    $("#appTC_ACCEPTED").val(rowdata.TC_ACCEPTED);
                    $("#appAPPROVED").val(rowdata.APPROVED);
                    $("#NotesAboutApplication").val(rowdata.bookNotes);
                    $("#ForeignPublisher").val(rowdata.foreignPublisher);
                    $("#ForeignCountry").val(rowdata.foreignCountry);
                    $("#TargetLanguage").val(rowdata.targetLanguage);
                    $("#appForeignPublisher").val(rowdata.foreignPublisher);
                    $("#appForeignCountry").val(rowdata.foreignCountry);
                    $("#appTargetLanguage").val(rowdata.originalLanguage);
                    $("#languageArray").val(rowdata.Author);
                    $("#feePerPage").val(rowdata.Author);
                    $("#appfeePerPage").val(rowdata.breakDownTranslatorFee);
                    $("#apptranslatorFee").val(rowdata.translatorFee);
                    $("#previousGrantAid").val(rowdata.previousGrantAid);
                    $("#amountRequested").val(rowdata.translatorFee);
                    var proposedDateOfPublication = formatDate(rowdata.proposedDateOfPublication);
                    $("#appproposedDateOfPublication").val(proposedDateOfPublication);
                    $("#appplannedPageExtent").val(rowdata.plannedPageExtent);
                    console.log("plannedPageExtent " + rowdata.plannedPageExtent);
                    $("#appproposedPrintRun").val(rowdata.proposedPrintRun);
                    console.log("proposedPrintRun " + rowdata.proposedPrintRun);
                    $("#amountApproved").val(rowdata.amountApproved);
//                    $("#commentsAboutMeeting").val(rowdata.boardComments_Instructions);
//                    $("#paymentReferenceNumber").val(rowdata.paymentReferenceNumber);
                    $("#ProofPaymentToTranslator").val(rowdata.proofOfPaymentToTranslator); // http://www.literatureirelandgrantapplication.com:8080undefined
                    $("#BankDetailsForm").val(rowdata.bankDetailsForm); // http://www.literatureirelandgrantapplication.com:8080undefined
                    $("#SignedLIContract").val(rowdata.SignedLIContract); // http://www.literatureirelandgrantapplication.com:8080undefined
                    $("#salesFigures").val(rowdata.salesFigures);
//                    $("#dateUpdate").val(rowdata.foreignPublisher);

//                    ##################################################################################################################

//                    var agreemnt = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.agreement + '';
//                    $("#appAgreement").val(agreemnt);
//                    document.getElementById("agreement").href = agreemnt;
                    var orig = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.original + '';
                    $("#appOriginal").val(orig);
                    document.getElementById("original").href = orig;
//                    var addendumRightsAgreemnt = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.addendumRightsAgreement + '';
//                    $("#appAddendumRightsAgreement").val(addendumRightsAgreemnt);
//                    document.getElementById("addendumRightsAgreement").href = addendumRightsAgreemnt;
                    var proofOfPaymentToTrans = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.proofOfPaymentToTranslator + '';
                    $("#appProofPaymentToTranslator").val(proofOfPaymentToTrans);
                    document.getElementById("proofPaymentToTranslator").href = proofOfPaymentToTrans;
                    var bankDetailsFrm = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.bankDetailsForm + '';
                    $("#appBankDetailsForm").val(bankDetailsFrm);
                    document.getElementById("bankDetailsForm").href = bankDetailsFrm;
                    var signedLIContr = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.SignedLIContract + '';
                    $("#appSignedLIContract").val(signedLIContr);
                    document.getElementById("signedLIContract").href = signedLIContr;
                    if (typeof (rowdata.cover) === "undefined") {
                        var cver = 'images/not-available.jpg';
                    } else {
                        var cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
                    }

                    $("#cover").val(cver);
                    document.getElementById("cover").src = cver;
//                    var contr = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.contract + '';
//                    document.getElementById("contract").href = contr;
//                    var trans = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.translatorCV + '';
//                    document.getElementById("translatorCV").href = trans;
                    var transSamp = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.copiesTranslationSample + '';
                    console.log("444  copiesTranslationSample " + transSamp);
                    document.getElementById("copiesTranslationSample").href = transSamp;
//                    $("#applicationsModal").modal("show");
//                    $('#applications1').DataTable().ajax.reload();
                    $("#appApplicationNumber").val($(this).closest('tr').children()[1].textContent);
                    $("#appApplicationYear").val($(this).closest('tr').children()[2].textContent);
                    $("#appCompany").val($(this).closest('tr').children()[2].textContent); //ok
//                    $("#appAgreement").val($(this).closest('tr').children()[5].textContent);

                    var appReferenceNumber = rowdata.ReferenceNumber;
                    console.log("appReferenceNumber " + appReferenceNumber);
                    $("#appReferenceNumber").val(appReferenceNumber); //ok
                    document.getElementById("ReferenceNumber").textContent = appReferenceNumber;
                    $("#unassignedERRefNo").val(appReferenceNumber);
                    var TranslName = rowdata.TranslatorName;
                    var translators = rowdata.TranslatorName;


                    var TranslatorDocs = [];
                    TranslatorDocs = rowdata.transList;
                    translatorArray = rowdata.TranslatorTrack2;
                    $("#TranslatorName").val(TranslName);
                    // Generate table translatorTrackTable
                    var TranslTitles = rowdata.TranslatorTrack2;
                    TranslTitles = TranslatorDocs;

                    //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
                    $('#translatorTableDiv').empty(); // empty the div before fetching and adding new data
                    var docName = "";

                    //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
                    $('#translTrackDiv').empty(); // empty the div before fetching and adding new data

                    var TranslTitles = rowdata.TranslatorTrack2;

                    $('#translTrackDiv').empty(); // empty the div before fetching and adding new data

                    var myTableDiv = document.getElementById("translTrackDiv");
                    var tble = document.createElement('TABLE');
                    tble.id = 'translatorTrackTable';
                    tble.border = '1';
                    tble.width = '100%';
                    tble.title = 'translatorTrackTable';
                    tble.className = "table table-striped table-condensed small";
                    tble.style = 'overflow-x: auto;';
                    var tableBody = document.createElement('TBODY');
                    var translatorTrack = [];
                    for (var i = 0; i < TranslTitles.length; ++i) {
                        for (var j = 0; j < TranslTitles[i].length; ++j) {
                            // skip undefined values to preserve sparse array
                            if (TranslTitles[i][j] === undefined)
                                continue;
                            // create row if it doesn't exist yet
                            if (translatorTrack[j] === undefined)
                                translatorTrack[j] = [];
                            // swap the x and y coords for the copy
                            translatorTrack[j][i] = TranslTitles[i][j];
//                               console.log("after --- transformation translatorTrack  " + translatorTrack[i][j]);
                        }

                    }

                    var idx = 0;
                    //TABLE ROWS
                    for (i = 0; i < TranslTitles.length; i++) {
                        var tr = document.createElement('TR');
                        for (j = 0; j < TranslTitles[i].length; j++) {
                            var td = document.createElement('TD');
                            var td2 = document.createElement('TD');
                            var td3 = document.createElement('TD');
                            td.width = '33.33%';
                            td2.width = '33.33%';
                            td3.width = '33.33%';
                            if (j === 0) {
                                var stringyfiedTranslTitles = String(TranslTitles[i][j]);
                                var translatorNameFromTranslTitles = stringyfiedTranslTitles.split(',');
                                var TranslatorName = translatorNameFromTranslTitles[0];
                                var th = document.createElement('TH');
                                th.style = 'text-align:center';
                                th.className = 'highlightHeader';
                                th.colspan = '2';
                                th.appendChild(document.createTextNode(TranslatorName));
                                tr.appendChild(th);
                                var th = document.createElement('TH');
                                th.className = 'highlightHeader';
                                th.appendChild(document.createTextNode(''));
                                tr.appendChild(th);
                                tableBody.appendChild(tr);
                                var th = document.createElement('TH');
                                th.className = 'highlightHeader';
                                th.appendChild(document.createTextNode(''));
                                tr.appendChild(th);
                                tableBody.appendChild(tr);
                                var heading = ["Author(s)", "Title(s)", "ReferenceNumber(s)"];
                                var tr = document.createElement('TR');
                                for (var col = 0; col < heading.length; col++)
                                {
                                    var th2 = document.createElement('TH');
                                    th2.style = 'text-align:center';
                                    th2.width = '50%';
                                    th2.appendChild(document.createTextNode(heading[col]));
                                    tr.appendChild(th2);
                                }
                                tableBody.appendChild(tr);
//                                continue;
                            }
                            // remove "undefined" cells
                            if (typeof (TranslTitles[i][j]) === "undefined") {
                                TranslTitles[i][j] = '';
                            }

                            var tr = document.createElement('TR');
                            td.width = '33.33%';
                            td2.width = '33.33%';
                            td3.width = '33.33%';
                            td.style = 'text-align:left';
                            td2.style = 'text-align: left';
                            td3.style = 'text-align: left';

                            var record = TranslTitles[i][j];
                            var Translator = record[0];
                            var Author = record[1];
                            var Title = record[2];
                            var ReferenceNumber = record[3];
                            idx++;
                            td.appendChild(document.createTextNode(Author));
                            td2.appendChild(document.createTextNode(Title));
                            td3.appendChild(document.createTextNode(ReferenceNumber));
                            tr.appendChild(td);
                            tr.appendChild(td2);
                            tr.appendChild(td3);
                            tableBody.appendChild(tr);
                        }
                    }

                    tble.appendChild(tableBody);
                    myTableDiv.appendChild(tble);


                    for (i = 0; i < translatorTrack.length; i++) {
                        for (j = 0; j < translatorTrack[i].length; j++) {

                            // get translators
                            if (i === 0) {
                                var newdiv = $('<div>', {class: 'text-left', text: translatorTrack[i][j]});
                                var a = document.createElement('a');
                                var linkText = document.createTextNode("  see Trackrecord");
                                a.appendChild(linkText);
                                a.title = "see Trackrecord";
                                a.class = "button";
                                a.href = "#stack2";
                                newdiv.append(a);
                            }
                            $('#testcontainer').find('a').attr('data-toggle', 'modal');
                            $('#testcontainer').append(newdiv);
                            //print track record
                            if (i !== 0) {
                                // console.log("translatorTrack[" + i + " ][ " + j + " ] :  " + translatorTrack[i][j]);
                            }
                        }
                    }


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


                    /*
                     * Generate Translator Tabs in "Rights Agreement & Contracts"-Tab
                     */

                    /*
                     * 1: The Nav-Bar
                     */

                    //reset the blocks
//                    document.getElementById("agreementToggle1").style.display = "block";
//                    document.getElementById("agreement_button1").style.display = "none";
//                    document.getElementById("addendumToggle1").style.display = "block";
//                    document.getElementById("addendum_button1").style.display = "none";

                    //Get all Expert Readers that are not assigned at the moment
                    var unassignedExpertReaderList = rowdata.unassignedExpertReaderList;


                    $('#tn').empty(); // empty the div before fetching and adding new data
                    $('#tnc').empty(); // empty the div before fetching and adding new data

                    console.log("8 xyz ##############Generate Translator Tabs in Rights Agreement & Contracts-Tab#########################################################################################");
                    // Generate Translator Tabs in "Rights Agreement & Contracts"-Tab

                    // 1: The Nav-Bar
                    console.log("8 xyz  rowdata.rightsAgreement.length " + rowdata.rightsAgreement.length);
                    var rightsAgreementContractsNavBar = '';
                    rightsAgreementContractsNavBar += '<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2" style="background-color: #d9d1d1">';
                    rightsAgreementContractsNavBar += '<ul class="nav navbar-nav nav-tabs">';
                    for (var i = 0; i < rowdata.rightsAgreement.length; i++) {
                        console.log("8 xyz translatorNamesForGenerateTranslatorTab[' + i + ' " + translatorNamesForGenerateTranslatorTab[i]);
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
                        console.log("8 xyz Upload a copy of the contract with translator v " + v + "  w  " + w + "  j  " + j);
                        rightsAgreementContractsNavContent += '<div class="row" style="margin-bottom: 40px;">';
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

                    console.log("123v rightsHolderArray ");
                    console.log("123v rightsHolderArray.length " + rowdata.rightsHolderArray.length);
                    for (var i = 0; i < rowdata.rightsHolderArray.length; i++) {

                        console.log("123v rightsHolderArray " + rowdata.rightsHolderArray[i]);
                    }
                    console.log("123v TranslatorName ");
                    for (var i = 0; i < rowdata.TranslatorName.length; i++) {

                        console.log("123v TranslatorName " + rowdata.TranslatorName[i]);
                    }
                    $('#addAddRightsHolders').empty();
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
                        $('#addAddRightsHolders').empty();
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

                    var pressCoverageTag = '';
                    pressCoverageTag += '<div class="col-md-8" style="margin-bottom: 20px">';
                    var pressCoverage = rowdata.pressCoverage;
                    for (var i = 0; i < pressCoverage.length; ++i) {
//                        for (var j = 0; j < pressCoverage[i].length; ++j) {

                        console.log("before111 pressCoverage[" + i + "    " + pressCoverage[i]);
                        var pressCoverageURL_cleaned = pressCoverage[i].substr(1).slice(0, -1);
                        console.log("before111 pressCoverageURL_cleaned  " + pressCoverageURL_cleaned);
                        var pressCoverageURL = pressCoverageURL_cleaned.split(",");
                        console.log("before111 pressCoverageURL split " + pressCoverageURL);
//                        if (!pressCoverageURL.includes("Thumbs")) {
                        var jpgURL = pressCoverageURL[0];
                        var jpgURLName = pressCoverageURL[1];
                        console.log("before111 jpgURL  " + jpgURL);
                        console.log("before111 jpgURLName  " + jpgURLName);
//                    }
//                        if (jpgURL.includes("_thumb.jpg")) {
                        var thumbURL = pressCoverageURL[2];
                        var thumbURLName = pressCoverageURL[3];
                        console.log("before111 thumbURL  " + thumbURL);
                        console.log("before111 thumbURLName  " + thumbURLName);
//                        }

                        pressCoverageTag += '<a href="' + jpgURL + '" target="_blank"><img src="' + thumbURL + '" alt=""/></a>';
                    }

                    pressCoverageTag += '</div>';
                    $(pressCoverageTag).appendTo('#pressCoverageTag');
                    var expertReaderName = rowdata.expertReaderList;
                    console.log("000 expertReaderName");
                    console.log(expertReaderName);
                    console.log("000 ReferenceNumber" + rowdata.ReferenceNumber);
                    document.getElementById("unassignedERRefNo").value = rowdata.ReferenceNumber;
                    document.getElementById("NewAssignedERRefNo").value = rowdata.ReferenceNumber;
                    /*
                     * get the whole List with the arrays  
                     * no of arrays = expertReaderName.length
                     */
//                     alert(cntr);

                    //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
                    $('#additionalExpertReader').empty(); // empty the div before fetching and adding new data

                    //expertReaders
                    if (cntr === 1) {


                        //   var addExpertReaderModalDiv = document.getElementById("translTrackDiv");
                        for (var i = 0; i < expertReaderName.length; ++i) {


                            /*
                             * build the link buttons in the listAssignedEReadermodal
                             */

                            var addExpertReaderTag = '';
                            addExpertReaderTag += '<div class="col-md-8" style="margin-bottom: 20px">';
                            addExpertReaderTag += '<button type="button" class="btn btn-success btn-xs pull-left" style="margin-bottom: 20px;" data-toggle="modal" data-target="#listAssignedEReadermodal' + i + '">';
                            addExpertReaderTag += 'Assigned Expert Reader for Reference: ' + expertReaderName[i][1] + "<br/> - <u>" + expertReaderName[i][6];
                            addExpertReaderTag += '</u></button>';
                            addExpertReaderTag += '</div>';
                            $(addExpertReaderTag).appendTo('#additionalExpertReader');
//                        var addExpertReaderModal = '';
                            //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
//                            $('#additionalExpertReaderModal').empty();  // empty the div before fetching and adding new data
                            var addExpertReaderModal = document.getElementById("additionalExpertReaderModal");
                            addExpertReaderModal = '';
//                        console.log("i  " + i);
                            /*
                             * adjust data-modal-index
                             * z = i + 4
                             */
                            var z = i + 4;
                            addExpertReaderModal += '<div class="modal fade" id="listAssignedEReadermodal' + i + '" data-modal-index="' + z + '">';
                            addExpertReaderModal += '<div class="modal-dialog">';
                            addExpertReaderModal += '<div class="modal-content">';
                            addExpertReaderModal += '<div class="modal-header" style="background-color: #c3bcbc">';
                            addExpertReaderModal += '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>';
                            addExpertReaderModal += '<h4 class="modal-title">Assigned Expert Reader</h4>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '<div class="modal-body" style="background-color: #d9d1d1">';
                            addExpertReaderModal += '<div class="row" style="margin-bottom: 20px;margin-top: 5px"> ';
                            addExpertReaderModal += '<div class="col-sm-6">';
                            addExpertReaderModal += '<strong class="pull-left">Expert Reader</strong>';
                            addExpertReaderModal += '<div class="input-group pull-left">';
                            var ExpertReader = "appExpertReader" + i;
                            console.log("ExpertReader  " + ExpertReader);
                            addExpertReaderModal += '<input type="text" name="appExpertReader' + i + '"';
                            addExpertReaderModal += ' id="appExpertReader' + i + '" class="form-control" />';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += ' </div> ';
                            addExpertReaderModal += '<div class="row" style="margin-top: 30px;margin-bottom: 10px">';
                            addExpertReaderModal += '<div class="col-sm-4">';
                            addExpertReaderModal += '<strong class=" pull-left"> Sample sent out</strong>';
                            addExpertReaderModal += '<div class="input-group pull-left">';
                            var sampleSentOut = "sampleSentOut" + i;
                            console.log("sampleSentOut  " + sampleSentOut);
                            addExpertReaderModal += '<input type="text" readonly name="sampleSentOut' + i + '" id="' + sampleSentOut + '" class="form-control" placeholder="DD/MM/YYYY" /> ';
                            addExpertReaderModal += '<label class="input-group-addon" for="sampleSentOut' + i + '">';
                            addExpertReaderModal += '<span class="glyphicon glyphicon-calendar"></span>';
                            addExpertReaderModal += '</label>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += ' </div>';
                            addExpertReaderModal += '<div class="col-sm-5">';
                            addExpertReaderModal += '<strong class=" pull-left"> Sample returned</strong>';
                            addExpertReaderModal += '<div class="input-group pull-left">';
                            var sampleReturned = "sampleReturned" + i;
                            console.log("sampleReturned  " + sampleReturned);
                            addExpertReaderModal += '<input type="text" readonly name="sampleReturned' + i + '" id="' + sampleReturned + '" class="form-control" placeholder="DD/MM/YYYY" />';
                            addExpertReaderModal += '<label class="input-group-addon" for="sampleReturned' + i + '">';
                            addExpertReaderModal += '<span class="glyphicon glyphicon-calendar"></span>';
                            addExpertReaderModal += '</label>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '<div class="row" style="margin-bottom: 20px;">';
                            addExpertReaderModal += '<div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">';
                            addExpertReaderModal += '<div class="col-sm-2">';
                            addExpertReaderModal += '<input id="ReadersReport' + i + '"';
                            addExpertReaderModal += 'type="hidden"';
                            addExpertReaderModal += 'name="ReadersReport"';
                            addExpertReaderModal += ' >';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '<a class="btn btn-info" role="button" id="appReadersReport' + i + '">';
                            addExpertReaderModal += '<span class="glyphicon glyphicon-file"></span>';
                            addExpertReaderModal += 'Reader’s Report</a>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '<div class="col-sm-10">';
                            addExpertReaderModal += '<label for="readerReportSummary' + i + '" class="control-label pull-left"> Reader’s Report Summary</label>';
                            addExpertReaderModal += '<textarea id="readerReportSummary' + i + '" ';
                            addExpertReaderModal += 'class="form-control"';
                            addExpertReaderModal += 'name="readerReportSummary' + i + '" ';
                            addExpertReaderModal += 'style="height: 98px"';
                            addExpertReaderModal += '>';
                            addExpertReaderModal += '</textarea>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '<div class="modal-footer"  style="background-color: #c3bcbc">';
                            addExpertReaderModal += '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
//                            addExpertReaderModal += '<button type="button" class="btn btn-primary">Save changes</button>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '</div>';
                            $(addExpertReaderModal).appendTo('#additionalExpertReaderModal');
                            /* 
                             * get the data from the array
                             */

                            for (var j = 0; j <= 6; ++j) {

                                var ExpReader = expertReaderName[i][6];
                                console.log("676767 ExpReader  " + ExpReader);
                                console.log("676767 ij  " + i + " j " + j);
                                var expertReaderlElementID = "appExpertReader" + i;
                                console.log("676767 expertReaderlElementID  " + expertReaderlElementID);
                                document.getElementById(expertReaderlElementID).value = ExpReader;
//                                var sampleSentOut = expertReaderName[i][3];
//                                var sampleSntOut = new Date(expertReaderName[i][3]);
//                                var day = sampleSntOut.getDate();
//                                var month = sampleSntOut.getMonth() + 1;
//                                var year = sampleSntOut.getFullYear();
//                                var sampleSentOut = day + "/" + month + "/" + year;

                                var sampleSentOut = formatDate(expertReaderName[i][3]);
                                console.log("676767 sampleSentOut  " + sampleSentOut);
                                var sampleSentOutElementID = "sampleSentOut" + i;
                                document.getElementById(sampleSentOutElementID).value = sampleSentOut;
                                var samplReturned = expertReaderName[i][4];
                                if (samplReturned !== "nothing returned yet") {
//                                    var samplReturned = new Date(expertReaderName[i][4]);
//                                    var day = samplReturned.getDate();
//                                    var month = samplReturned.getMonth() + 1;
//                                    var year = samplReturned.getFullYear();
//                                    var samplReturned = day + "/" + month + "/" + year;
                                    var samplReturned = formatDate(expertReaderName[i][4]);
                                }

                                console.log("676767 samplReturned  " + samplReturned);
                                var samplReturnedElementID = "sampleReturned" + i;
                                console.log("676767 samplReturned  " + samplReturned);
                                document.getElementById(samplReturnedElementID).value = samplReturned;
                                var readerSummaryReport = expertReaderName[i][5];
                                var readersSummaryReportElementID = "readerReportSummary" + i;
                                document.getElementById(readersSummaryReportElementID).value = readerSummaryReport;
                                var readerReportLink = 'http://www.literatureirelandgrantapplication.com:8080' + expertReaderName[i][2] + '';
                                console.log("676767 expertReaderName[i][2]  " + expertReaderName[i][2]);
                                var readersReportElementID = "appReadersReport" + i;
                                console.log("676767 readersReportElementID  " + readersReportElementID);
                                console.log("676767 readerReportLink  " + readerReportLink);
                                document.getElementById(readersReportElementID).href = readerReportLink;
                                if (expertReaderName[i][2] === "") {
                                    console.log("676767 expertReaderName[i][2] === ''  ");
                                    document.getElementById(readersReportElementID).style.display = "none";
                                }
                            }
                        }
                    }


                    /*
                     * Get all Expert Readers that are not assigned at the moment
                     */

                    var unassignedExpertReaderList = rowdata.unassignedExpertReaderList;
                    var select = document.getElementById("selectUnassignedER");
                    /*
                     * Optional: Clear all existing options first:
                     */

                    select.innerHTML = "";
                    /*
                     * Populate list with options:
                     */

                    var defaultSelect = "Select Expert Reader";
                    /*
                     * set default
                     */

                    select.innerHTML += "<option value=\"" + defaultSelect + "\">" + defaultSelect + "</option>";
                    for (var i = 0; i < unassignedExpertReaderList.length; i++) {
                        var opt = unassignedExpertReaderList[i];
                        select.innerHTML += "<option value=\"" + opt + "\">" + opt + "</option>";
                    }



                });
            });
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


        <!-- applications-->              
        <script type="text/javascript">
            $(document).ready(function () {

                'use strict';
                oTable = $("#applications").DataTable({                   
                    "initComplete": function (settings, json) {
                        /*
                         * Kich off global search with Enter/RReturn => keyCode === 13
                         */
                        $('#applications_filter input').addClass('searchClass');
                        $('#applications_filter input').unbind();
                        $('#applications_filter input').bind('keyup', function (e) {
                            if (e.keyCode === 13) {
                                oTable.search(this.value).draw();
                            }
                        });
                    },
                    "ajax": {
                        "url": "./TestDataServlet14",
                        "type": "GET"
                    },
                    "colReorder": true,
                    "processing": true,
                    "language": {
                        "loadingRecords": "&nbsp; ",
                        "processing": "Loading Applications..."
                    },
                    "serverSide": true,
                    "stateSave": true,
                    "searching": true,
                    "info": true,
                    "iDisplayLength": 10,
                    "pageLength": 10,
                    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],

                    "language": {
                        "infoFiltered": " - filtered from _MAX_ records",
                        searchPlaceholder: "Search records",
                        search: "",
                        "sLoadingRecords": "Please wait - loading application data..."
                    },
                    "autoWidth": false,
                    "paging": true,
                    "pagingType": "full_numbers",
                    "columns": [
                        {
                            "targets": 0,
                            "class": "details-control",
                            "orderable": false,
                            "data": null,
                            "defaultContent": ""
                        },
                        {"data": "ReferenceNumber"},
                        {"data": "company",
                            "render": function (data) {
                                if (data !== null) {
//                                    console.log("company  " + data);
                                    return data;
                                } else {
                                    return "n/a";
                                }
                            }},
                        {"data": "bookTitle",
                            "render": function (data) {
                                if (data !== null) {
//                                    console.log("bookTitle  " + data);
                                    return data;
                                } else {
                                    return "n/a";
                                }
                            }},
                        {"data": "Status",
                            "render": function (data) {
                                if (data !== null) {
//                                    console.log("Status  " + data);
                                    return data;
                                } else {
                                    return "n/a";
                                }
                            }},
                        {"data": "Author",
                            "render": function (data) {
                                if (data !== null) {
//                                    console.log("Author  " + data);
                                    return data;
                                } else {
                                    return "n/a";
                                }
                            }}
                    ]

                });
//                $('#applications_filter input').addClass('searchClass');
//                $(".searchClass").keyup(function (e) {
//                    if (e.keyCode === 13) {
//                        oTable.search(this.value);
//                    }
//                });
                yadcf.init(oTable, [
                    {

                        data: [{value: 'new', label: "New"}, {value: 'open', label: "Open"}, {value: 'pending', label: "Pending"}, {value: 'closed', label: "Closed"}],
                        column_number: 4,
                        select_type: 'select',
//                        select_type_options: {
//                            dropdownAutoWidth: true
//                        },
                        column_data_type: "html",
                        html_data_type: "text",
                        filter_container_id: "status",
//                        filter_reset_button_text: false,
                        filter_default_label: "Select status"
                    }
                ]);
            });
        </script>


        <!--Stacked modals-->
        <script type="text/javascript">
            //Stacked modals
            //https://codepen.io/anon/pen/ZJgLGz

            $('.btn[data-toggle=modal]').on('click', function () {
                var $btn = $(this);
                var currentDialog = $btn.closest('.modal-dialog'),
                        targetDialog = $($btn.attr('data-target'));
                ;
                if (!currentDialog.length)
                    return;
                targetDialog.data('previous-dialog', currentDialog);
                currentDialog.addClass('aside');
                var stackedDialogCount = $('.modal.in .modal-dialog.aside').length;
                if (stackedDialogCount <= 5) {
                    currentDialog.addClass('aside-' + stackedDialogCount);
                }
            });
            $('.modal').on('hide.bs.modal', function () {
                var $dialog = $(this);
                var previousDialog = $dialog.data('previous-dialog');
                if (previousDialog) {
                    previousDialog.removeClass('aside');
                    $dialog.data('previous-dialog', undefined);
                }
            });
        </script>



        <!--get selectpicker selection--> 
        <script type="text/javascript">
            $(document).ready(function () {
                $('.selectpicker').on('change', function () {
                    var selected = $(this).find("option:selected").val();
                });
//                document.getElementById('sSearch').value = '216/2018';

            });</script>



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

        <script>
            function setSelectedIndex(s, v) {
                for (var i = 0; i < s.options.length; i++) {
                    if (s.options[i].text === v) {
                        s.options[i].selected = true;
                        console.log("13131 paymentStatusSelected " + s.options[i].text);
                        return;
                    }
                }
            }
        </script>


        <!--pressCuttingsModal-->
        <script type="text/javascript">
            function pressCuttingsModal() {
                $("#pressCuttingsModal").modal("show");
            }
        </script> 

        <!--Styles-->
        <style>
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

            .highlightHeader {
                background:yellow;
                /*      background-color:#d9d1d1;*/
            }
            table#translatorTrackTable{
                border: 1px solid black;
            }

            /*https://designshack.net/articles/css/joshuajohnson-2/*/

            /*GROW*/
            .grow img {
                height: 300px;
                width: 300px;

                -webkit-transition: all 1s ease;
                -moz-transition: all 1s ease;
                -o-transition: all 1s ease;
                -ms-transition: all 1s ease;
                transition: all 1s ease;
            }

            .grow img:hover {
                width: 400px;
                height: 400px;
            }

            td.details-control {
                background: url('images/details_open.png') no-repeat center center;
                cursor: pointer;
            }
            tr.shown td.details-control {
                background: url('images/details_close.png') no-repeat center center;
            }
            td.delete-control {
                background: url('images/delete-control.png') no-repeat center center;
                cursor: pointer;
            }

            td.add-control {
                background: url('images/add-control.png') no-repeat center center;
                cursor: pointer;
            }
            application.dataTable tbody td {
                word-break: break-all;
                vertical-align: top;
            }

            textarea {
                resize: vertical;
                overflow-x:scroll;
            }

            /*https://stackoverflow.com/questions/10476632/how-to-scroll-the-page-when-a-modal-dialog-is-longer-than-the-screen*/
            .modal-body {
                max-height: calc(100vh - 210px);
                overflow-y: auto;
            }

            /*increase size of "Show entries"*/
            select.input-sm {
                height: 33px;
            }

            ​body {
                margin: 5px;
                background: #d9d1d1
            }

            /* Tab Navigation */
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
            .my-tab .tab-pane{ border:solid 1px blue;  border-top: 0; background-color:#F7EFC6;
            }

            .img {
                max-width: 40%;
                height: auto;
                display: block;
                margin: auto;
                width: auto\9; /* ie8 */
            }
            .ImageBorder
            {
                border-width: 1px;
                border-color: Black;
            }

            .h4{
                font-size: 14px;
                line-height: 14px;
            }

            .box .box-header{
                background: #36a9e1;
                color: white;
                font-size: 16px;
                overflow: hidden;
                border-radius: 2px 2px 0 0;
            }

            .onlytableScroll{
                overflow-x:scroll;
            }

            /*        <!--Styles for the approved/withdrawn/rejected buttons-->*/

            /*
                        .active {
                            background-color: #F7F5F5 !important;
                        }*/
            .approved {

                display:inline;
                background-color: lightgreen !important;
                color: #FFFFFF;
                font-weight: 700;
            }
            .withdrawn {             
                display:inline;
                background-color: #FFA500 !important;
                color: #FFFFFF;
                font-weight: 700;
            }
            .rejected {
                display:inline;
                background-color: lightcoral !important;
                color: #FFFFFF;
                font-weight: 700;
            }

            .btn.outline {
                background: none;
                padding: 12px 22px;
                border: 2px solid #0099cc;
                box-shadow: 0 3px 0 0 #007299;
                color: #0099cc;
            }
            .mytab .tab-pane{ border:solid 1px blue;  border-top: 0;    }
            .mytab2 .tab-pane{ border:solid 1px blue;  border-top: 0;    }
            #myTab li a { border-color: blue;background-color:#A5C967; }
            #myTab li.active a {border-bottom-color: transparent;background-color:Yellow; }
            #myTab2 li a { border-color: blue;background-color:#A5C967; }
            #myTab2 li.active a {border-bottom-color: transparent;background-color:Yellow; }
            .my-tab .tab-pane{ border:solid 1px blue;  border-top: 0; background-color:#F7EFC6;}

            body .modal-admin {
                /* new custom width */
                width: 750px;
                /* must be half of the width, minus scrollbar on the left (30px) */
                margin-left: 175px;
                margin-right: 0;
                margin-top: 50px ;
            }
        </style>

        <script>
            $(document).ready(function () {
                $("button").click(function () {
                    $("button").removeClass("active");
                    $(this).addClass("active");
//                    $("button").removeClass("bold");
//                    $(this).addClass("bold");
                });
            });

        </script>

        <!--reply_click-->
        <script type="text/javascript">
            function reply_click(clicked_id)
            {
                document.getElementById("ApproveWithdrawnReject").value = clicked_id;
                console.log("ApproveWithdrawnReject  " + clicked_id);
                document.getElementById("award").checked = true;
                if (clicked_id === "Approved") {
                    var element = document.getElementById("Approved");
                    element.classList.add("approved");
                    var element = document.getElementById("Withdrawn");
                    element.classList.remove("withdrawn");
                    var element = document.getElementById("Rejected");
                    element.classList.remove("rejected");
                } else {
                    document.getElementById("award").checked = false;
                }

                if (clicked_id === "Withdrawn") {
                    var element = document.getElementById("Withdrawn");
                    element.classList.add("withdrawn");
                    var element = document.getElementById("Approved");
                    element.classList.remove("approved");
                    var element = document.getElementById("Rejected");
                    element.classList.remove("rejected");
                }

                if (clicked_id === "Rejected") {
                    var element = document.getElementById("Rejected");
                    element.classList.add("rejected");
                    var element = document.getElementById("Approved");
                    element.classList.remove("approved");
                    var element = document.getElementById("Withdrawn");
                    element.classList.remove("withdrawn");
                }
            }
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


        <!--if Publisher selected display publisherBox-->
        <script type="text/javascript">
            function selectER() {
                var selectBox = document.getElementById("selectUnassignedER");
                var selectedValue = selectBox.options[selectBox.selectedIndex].value;
//                alert("selectedValue " + selectedValue);
                document.getElementById("selectUnassignedER").value = selectedValue;
                document.getElementById("selectedUnassignedER").value = selectedValue;
            }
        </script>

    </head>

    <body style="height: 100%">
        <div id="shadowholder">
            <div class="shadowtop"> </div>
            <div id="container">
                <div id="topspacer"> </div>
                <div id="topbar">
                    <div class="animateddiv">
                        <a><img src="images/flashtext-animated2.gif" height="70" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a class="logo"><span class="hidden">Literature Ireland</span></a>
                </div> <!--  End of topbar div -->

                <!--container for welcome/logout-->
                <div class="container-fluid" >
                    <div class="pull-right">
                        <h6> <small>Welcome <strong>${name}</strong> - <strong>not ${name}</strong>? <a href="${pageContext.request.contextPath}/Logout">Click here to log out </a></small></h6>
                    </div>
                </div> <!--container for welcome/logout-->

                <div style="margin-bottom: 10px"> </div>

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

                        <!-- Nav tabs -->
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="myTab"  style="background-color: #d9d1d1">
                            <ul class="nav navbar-nav nav-tabs two-lines" role="tablist">
                                <li role="tab" class="active"><a href="#Application" data-toggle="tab">Application Management</a></li>
                                <li role="tab" ><a href="#User" data-toggle="tab">User Management</a></li>
                                <!--<li role="tab" ><a href="#Contracts" data-toggle="tab">Contracts</a></li>-->
                                <li role="tab" ><a href="#ExpertReader" data-toggle="tab">Expert Reader</a></li>
                                <li role="tab" ><a href="#Library" data-toggle="tab">Library</a></li>
                                <li role="tab" ><a href="#Genres" data-toggle="tab">Genres</a></li>
                                <li role="tab" ><a href="#Queries" data-toggle="tab">Queries</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->


                        <!-- Tab panes -->
                        <div class="tab-content" >

                            <input type="hidden" name="ReferenceNumber" id="sSearch" class="sSearch">
                            <input type="hidden" name="Status" id="Status" class="Status">
                            <input type="hidden" name="userID" value="${userID}">
                            <input type="hidden" name="publisherID" value="${publisherID}">
                            <input type="hidden" name="Company" value="${companyDetails.Company}">
                            <!-- Table id="applications1" -->
                            <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px; display: none">
                                <div class="table-responsive">
                                    <!--<button id="loadData">load data</button>-->
                                    <table id="applications1" class="table display table-striped table-bordered  dt-responsive " width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th class="details-control"></th>   
                                                <th class="never">Reference<br/>  No</th>
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
                                                <th class="never select-filter">Status</th>
                                                <th class="never">Copies <br/> Sent</th>
                                                <th class="never">Date Copies  <br/> Were Sent</th>
                                                <th class="never">Copies of  <br/> Translation Sample</th>
                                                <th class="never">T&C has been <br/> Accepted</th>
                                                <th class="never">Approved</th> 
                                                <th class="never">Genre</th>   
                                                <th class="never"></th>
                                                <th class="never">Expert Reader</th>
                                                <th class="never">Book title</th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never">Author(s)</th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th class="details-control"></th>   
                                                <th class="never">Reference<br/>  No</th>
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
                                                <th class="never select-filter">Status</th>
                                                <th class="never">Copies <br/> Sent</th>
                                                <th class="never">Date Copies  <br/> Were Sent</th>
                                                <th class="never">Copies of  <br/> Translation Sample</th>
                                                <th class="never">T&C has been <br/> Accepted</th>
                                                <th class="never">Approved</th> 
                                                <th class="never">Genre</th>   
                                                <th class="never"></th>
                                                <th class="never">Expert Reader</th>
                                                <th class="never">Book title</th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never">Author(s)</th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                            </tr>
                                        </tfoot>

                                    </table>
                                </div>
                            </div>

                            <!--Table id="applications"-->
                            <div class="tab-pane fade  active in" id="Application">
                                <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                                    <div class="table-responsive">
                                        <table id="applications" class="table display table-striped table-bordered  dt-responsive " width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th class="details-control"></th>   
                                                    <th class="all">Reference<br/>  No</th>
                                                    <th class="all">Publisher</th>       
                                                    <th class="all">bookTitle</th>                                    
                                                    <th class="all">Status</th>
                                                    <th class="all">Author(s)</th>                                 
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th class="details-control"></th>   
                                                    <th class="all">Reference<br/>  No</th>
                                                    <th class="all">Publisher</th>       
                                                    <th class="all">bookTitle</th>
                                                    <th class="all" id="status">Status</th>
                                                    <th class="all">Author(s)</th>    
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <!-- Main Grid -->  
                                            </tbody>
                                        </table>
                                    </div>                   
                                </div> <!-- container-fluid -->  
                            </div>  


                            <!--applicationForm-->
                            <form  method="POST" id="applicationEditForm" name="applicationForm" action="${pageContext.request.contextPath}/StaffServlet" >
                                <%request.getSession().setAttribute("task", "StaffServlet");%>

                                <!--applicationsModal-->
                                <div class="modal fade" id="applicationsModal" data-modal-index="1">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header" style="background-color: #c3bcbc">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                <!--<h4 class="modal-title">Applications</h4>-->
                                                <h4 class="modal-title">Application ReferenceNumber  <span id="ReferenceNumber"></span></h4>
                                            </div>
                                            <div class="modal-body" style="background-color: #d9d1d1">

                                                <ul class="nav nav-tabs" id="tabContent">
                                                    <li class="active"><a href="#originalContracts" data-toggle="tab">Original <br/>and Contracts</a></li>
                                                    <li><a href="#publisherTranslation" data-toggle="tab">Publisher <br/>and Translation</a></li>
                                                    <li><a href="#readerReport" data-toggle="tab">Reader’s  <br/>Report</a></li>
                                                    <li><a href="#boardMeeting" data-toggle="tab">Board  <br/>Meeting</a></li>
                                                    <li><a href="#contract" data-toggle="tab">Contract <br/> &nbsp;</a></li>
                                                </ul>

                                                <!-- Tab-content -->
                                                <div class="tab-content">

                                                    <!--Original and Contracts-->
                                                    <div class="tab-pane active" id="originalContracts">                                       
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 5px">
                                                            <div class="col-sm-4">
                                                                <label for="appReferenceNumber" class="control-label pull-left">Reference Number</label>
                                                                <input  id="appReferenceNumber" 
                                                                        type="text"                                                  
                                                                        class="form-control"    
                                                                        name="appReferenceNumber"   
                                                                        readonly
                                                                        >
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <label for="appStatus" class="control-label pull-left">Status</label>
                                                                <input id="appStatus"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="appStatus"         
                                                                       readonly
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 5px">
                                                            <div class="col-sm-8">
                                                                <label for="appBookTitle" class="control-label pull-left">Book Title</label>
                                                                <input  id="appBookTitle" 
                                                                        type="text"                                                  
                                                                        class="form-control"    
                                                                        name="appBookTitle"    
                                                                        readonly
                                                                        >
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 5px">
                                                            <div class="col-sm-8">
                                                                <label for="authorList" class="control-label pull-left">Author(s)</label>
                                                                <input  id="authorList" 
                                                                        type="text"                                                  
                                                                        class="form-control"    
                                                                        name="authorList"    
                                                                        readonly
                                                                        >
                                                            </div>
                                                        </div> <!--row-->

                                                        <!--second row-->
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-8">        
                                                                <label for="appCompany" class="control-label pull-left">Publisher</label>
                                                                <input id="appCompany"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="appCompany"    
                                                                       readonly
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <!--Original and Contracts-->
                                                        <div class="tab-pane" id="OriginalContracts">
                                                            <p class="header1 col-sm-12" >
                                                                Original and Contracts
                                                            </p>

                                                            <div class="container-fluid"  style="background-color: #d9d1d1">
                                                                <div class="row">

                                                                    <!-- Navbar -->
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

                                                                            <!-- tn -->
                                                                            <div  id="tn"></div>  

                                                                            <!-- tnc -->
                                                                            <div class="tab-content" id="tnc"></div>  

                                                                        </div>  <!-- <div class="container-fluid"  -->
                                                                    </nav>  <!-- <nav class="navbar -->
                                                                </div>  <!-- row  -->
                                                            </div> <!-- container-fluid  -->
                                                        </div> <!-- class="tab-pane" id="OriginalContracts" -->


                                                        <div class="container-fluid"  id="rightsAgreementContracts" style="margin-top: 40px;">


                                                            <!--Upload form for agreement-->
                                                            <div class="row" style="margin-bottom: 80px;">
                                                                <div style=" margin: 0 auto; position: relative;">

                                                                    <div class="col-md-10"  id="agreementToggle1" style="margin-bottom: 40px; position:absolute; z-index:0;">
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
                                                                        </div> 
                                                                    </div> <!-- position:absolute; z-index:0 -->

                                                                    <div class="col-md-7" id="agreement_button1" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> 
                                                                        <label  class="control-label pull-left" id="agreement_button_label1" ></label>
                                                                        <div class="input-group agreement_buttonText pull-left">
                                                                            <a class="btn btn-info btn-file pull-left" role="button" id="agreement_link1" href="">
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

                                                                <!--                                                                <div class="col-sm-4" style="margin-top: 30px; visibility: block" id="addAdditionalRightsHoldersModalDiv">  
                                                                                                                                    <a href="#" class="btn btn-group-sm btn-default pull-left" 
                                                                                                                                       data-toggle="modal" 
                                                                                                                                       data-target="#addAdditionalRightsHoldersModal"
                                                                                                                                       onclick="copyFirstRightsHolderName();"
                                                                                                                                       >Add more Translation rights holders</a>
                                                                                                                                </div>-->

                                                            </div> <!-- row  -->

                                                            <!--Upload form for addendum to the rights agreement-->
                                                            <div class="row" style="margin-bottom: 80px;">    

                                                                <div style=" margin: 0 auto; position: relative;">

                                                                    <div class="col-md-10"  id="addendumToggle1" style="margin-bottom: 40px; position:absolute; z-index:0;">
                                                                        <label  class="control-label pull-left"> <strong class="pull-left"  id="uploadAddendum1"></strong>
                                                                            <!--                                                                            <small> (where applicable)</small>     -->
                                                                        </label>
                                                                        <br/>                                                               
                                                                        <div class="input-group addendum  pull-left"  style="margin-bottom: 40px;">
                                                                            <label class="btn btn-default btn-file pull-left">
                                                                                Select file <input type="file" onchange="generatedLabels()" name="Addendum-1" id="addendum1">
                                                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                                            </label>
                                                                            <input type="text" id="label_addendum1" class="pull-left"/>
                                                                            <input type="hidden" value="Addendum" name="destination" id="addendum_upload1"/>
                                                                        </div> 
                                                                    </div> <!-- position:absolute; z-index:0 -->

                                                                    <div class="col-md-7" id="addendum_button1" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> 
                                                                        <label class="control-label pull-left" id="addendum_button_label1"></label> 
                                                                        <!--<small class='pull-left'> &nbsp;  (where applicable)</small>'-->
                                                                        <div class="input-group addendum_buttonText pull-left">
                                                                            <a class="btn btn-info btn-file pull-left" role="button" id="addendum_link1" href="">
                                                                                <span class="glyphicon glyphicon-file"></span>
                                                                                Click to open</a>
                                                                        </div>
                                                                    </div> <!-- position:absolute; z-index:1; display:none -->

                                                                </div> <!-- position: relative  -->
                                                            </div> <!-- row  -->
                                                        </div>


                                                        <!--translatorTableDiv-->
                                                        <div class="row" style="margin-bottom: 10px; margin-top: 30px">                                           
                                                            <div class="col-md-8" id="translatorTableDiv" style="margin-left: 40px;"></div>
                                                        </div> <!--row-->

                                                        <div class="row">
                                                            <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px">
                                                                <div class="col-sm-2">
                                                                    <input id="appOriginal"
                                                                           type="hidden"                                                             
                                                                           name="appOriginal"                                
                                                                           >
                                                                </div>
                                                                <a class="btn btn-info" role="button" id="original" >
                                                                    <span class="glyphicon glyphicon-file"></span>
                                                                    Original Work</a>
                                                            </div>

                                                            <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">  
                                                                <div class="col-sm-2">
                                                                    <input id="appcopiesTranslationSample"                                
                                                                           type="hidden"                                                            
                                                                           name="appcopiesTranslationSample"                                
                                                                           >
                                                                </div>
                                                                <a class="btn btn-info" role="button" id="copiesTranslationSample" >
                                                                    <span class="glyphicon glyphicon-file"></span>
                                                                    Translation Sample</a>
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-4">
                                                                <label for="appDateOfPublicationOriginal" class="control-label pull-left">Year of publication <br/>(of the original)</label>
                                                                <input id="appDateOfPublicationOriginal"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="appDateOfPublicationOriginal"   
                                                                       readonly
                                                                       >
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <label for="appPageExtentOriginal" class="control-label pull-left">Page extent <br/>(of the original)</label>
                                                                <input  id="appPageExtentOriginal" 
                                                                        name="appPageExtentOriginal" 
                                                                        type="text"                                                                
                                                                        class="form-control"  
                                                                        readonly
                                                                        >
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-4">        
                                                                <label for="appCountryOfPublication" class="control-label pull-left">Country of publication <br/>(of the original)</label>
                                                                <input id="appCountryOfPublication"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="appCountryOfPublication"      
                                                                       readonly
                                                                       >
                                                            </div>

                                                            <div class="col-sm-4">
                                                                <label for="appLanguageOriginal" class="control-label pull-left">Language <br/>(of the original)</label>
                                                                <input  id="appLanguageOriginal" 
                                                                        name="appLanguageOriginal" 
                                                                        type="text"                                                                
                                                                        class="form-control" 
                                                                        readonly
                                                                        >
                                                            </div>

                                                            <div class="col-sm-4">        
                                                                <label for="appGenre" class="control-label pull-left">&nbsp;<br/> Genre</label>
                                                                <input id="appGenre"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="appGenre"               
                                                                       readonly
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-4">
                                                                <label for="appcopiesSent" class="control-label pull-left">Has copy been sent?</label>
                                                                <input id="appcopiesSent"
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="appcopiesSent"   
                                                                       readonly
                                                                       >
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <label for="appdateCopiesWereSent" class="control-label pull-left">Date copy was sent</label>
                                                                <input id="appdateCopiesWereSent"                                
                                                                       type="text"      
                                                                       class="form-control"                                
                                                                       name="appdateCopiesWereSent"  
                                                                       readonly
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <!--                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                                                                    <div class="col-sm-3">
                                                                                                        <label for="appTC_ACCEPTED" class="control-label pull-left">T&C accepted</label>
                                                                                                        <input id="appTC_ACCEPTED"
                                                                                                               type="text"                                
                                                                                                               class="form-control"                                
                                                                                                               name="appTC_ACCEPTED"                                
                                                                                                               >
                                                                                                    </div>
                                                                                                    <div class="col-sm-4">
                                                                                                        <label for="appAPPROVED" class="control-label pull-left">Application Approved</label>
                                                                                                        <input id="appAPPROVED"
                                                                                                               type="text"                                
                                                                                                               class="form-control"                                
                                                                                                               name="appAPPROVED"                                
                                                                                                               >
                                                                                                    </div>
                                                                                                </div> row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">   

                                                            <div class="col-sm-12">
                                                                <label for="appNotesAboutApplication" class="control-label pull-left">Notes about Application</label>
                                                                <textarea id="appNotesAboutApplication" 
                                                                          class="form-control"                                               
                                                                          name="appNotesAboutApplication"    
                                                                          style="height: 98px"
                                                                          >                 
                                                                </textarea>
                                                            </div>
                                                        </div> <!--row-->
                                                    </div> <!--tab-pane" id="originalContracts" -->

                                                    <!--Publisher and Translation-->
                                                    <div class="tab-pane" id="publisherTranslation">                                       
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-4">
                                                                <label for="appForeignPublisher" class="control-label pull-left">Target publisher</label>
                                                                <input id="appForeignPublisher"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="appForeignPublisher"   
                                                                       readonly
                                                                       >
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <label for="appForeignCountry" class="control-label pull-left">Target country </label>
                                                                <input  id="appForeignCountry" 
                                                                        name="appForeignCountry" 
                                                                        type="text"                                                                
                                                                        class="form-control"     
                                                                        readonly
                                                                        >
                                                            </div>

                                                            <div class="col-sm-4">        
                                                                <label for="appTargetLanguage" class="control-label pull-left"> Target language</label>
                                                                <input id="appTargetLanguage"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="appTargetLanguage"     
                                                                       readonly
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 5px">
                                                            <div class="col-lg-12">
                                                                <div class="pull-left">
                                                                    <div class="box">
                                                                        <div class="box-header">
                                                                            <h4 class="marginLeft">                                                                                
                                                                                Track record for Translator(s):  
                                                                            </h4>
                                                                        </div>

                                                                        <div class="col-lg-12" style="margin-bottom: 20px;margin-top: 5px">
                                                                            <div id="translTrackDiv" class="table-responsive"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div> <!--row-->


                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-7">
                                                                <label for="appfeePerPage" class="control-label pull-left">Break-down of translator(s)'s fee</label>
                                                                <!--<div class="input-group" style="margin-bottom: 40px">-->
                                                                <textarea id="appfeePerPage"  class="form-control" name="appfeePerPage" style="height: 98px" readonly></textarea>
                                                                <!--</div>-->
                                                            </div>


                                                            <div class="col-sm-4">
                                                                <label for="apptranslatorFee" class="control-label pull-left">Translator(s)'s fee</label>
                                                                <div class="input-group  pull-left" style="margin-bottom: 40px">                                                               
                                                                    <label class="input-group-addon" for="apptranslatorFee">                                                           
                                                                        <span class="glyphicon glyphicon-euro"></span>                                     
                                                                    </label>
                                                                    <input type="text" class="form-control" readonly name="apptranslatorFee" id="apptranslatorFee" placeholder="fee">    
                                                                </div>
                                                            </div>
                                                        </div> <!--row-->


                                                        <div class="row" style="margin-bottom: 20px;margin-top: 5px"> 
                                                            <div class="col-sm-12">
                                                                <label for="previousGrantAid" class="control-label pull-left"> Previous grant aid</label>
                                                                <textarea id="previousGrantAid" class="form-control" readonly name="previousGrantAid" style="height: 183px" placeholder="author name, title, application year, amount awarded, etc " ></textarea>
                                                            </div>
                                                        </div> <!--row-->
                                                    </div> <!--tab-pane" id="publisherTranslation" -->


                                                    <!-- Reader’s  Report -->
                                                    <div class="tab-pane" id="readerReport">
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 20px"> 

                                                            <div class='col-sm-6'>
                                                                <button class="btn btn-success btn-xs pull-left" style="margin-bottom: 20px;" type="button" onclick="getTodaysDate()" data-toggle="modal" data-target="#assignEReadermodal">
                                                                    Assign expert reader to reference number 
                                                                </button>
                                                                <!--<a class="btn" data-toggle="modal" href="#stack2">Launch modal</a>-->
                                                                <!-- additionalExpertReader -->
                                                                <div class="row" style="margin-bottom: 20px;margin-top: 5px"> 
                                                                    <div id="additionalExpertReader"></div>
                                                                </div> <!--row-->   
                                                            </div>
                                                        </div> <!--row-->      

                                                    </div> 
                                                    <!--tab-pane" id="readerReport" -->



                                                    <!--Board  Meeting-->
                                                    <div class="tab-pane" id="boardMeeting">
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 5px">   

                                                            <div class='col-sm-5'>
                                                                <strong class="pull-left">Board meeting<br/>&nbsp;</strong>
                                                                <div class="input-group  pull-left date datepicker" >
                                                                    <input type="text" name="appDateOfBoardMeeting" id="appDateOfBoardMeeting" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                    <label class="input-group-addon" for="appDateOfBoardMeeting">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </label>
                                                                </div> 
                                                            </div>

                                                            <script>
                                                                $("#appDateOfBoardMeeting").datepicker({
                                                                    showWeekDays: true,
                                                                    todayHighlight: true,
                                                                    autoclose: true
                                                                });
                                                            </script>
                                                            <div class="col-sm-4">
                                                                <label for="directorChairDecision" class="control-label">Director/Chair decision</label>
                                                                <br/> 
                                                                <input id="directorChairDecision"
                                                                       type="checkbox"       
                                                                       value="ticked" 
                                                                       class="form-control"                                
                                                                       name="directorChairDecision"  
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">   

                                                            <div class="col-sm-6">
                                                                <strong class="pull-left">Amount requested</strong> 
                                                                <div class="input-group pull-left">
                                                                    <label class="input-group-addon" for="amountRequested">
                                                                        <span class="glyphicon glyphicon-euro"></span>                                     
                                                                    </label>
                                                                    <input type="text" class="form-control" name="amountRequested" id="amountRequested" placeholder="Amount Requested">    
                                                                </div>
                                                            </div>

                                                            <div class='col-sm-6'>
                                                                <strong class="pull-left">Proposed  publication date &nbsp;&nbsp;&nbsp; </strong>
                                                                <div class="input-group pull-left" >
                                                                    <input type="text" name="appproposedDateOfPublication" 
                                                                           id="appproposedDateOfPublication" 
                                                                           class="form-control" 
                                                                           placeholder="DD/MM/YYYY" />    
                                                                </div> 
                                                            </div>

                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                            <div class="col-sm-3">        
                                                                <label for="appplannedPageExtent" class="control-label pull-left">Planned page<br/> extent</label>
                                                                <input id="appplannedPageExtent"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="appplannedPageExtent"  
                                                                       >
                                                            </div>

                                                            <div class="col-sm-3">
                                                                <label for="appproposedPrintRun" class="control-label pull-left">Proposed print run<br/>&nbsp;</label>
                                                                <input  id="appproposedPrintRun" 
                                                                        name="appproposedPrintRun" 
                                                                        type="text"                                                                
                                                                        class="form-control"                                                            
                                                                        >
                                                            </div>

                                                            <div class="col-sm-4">
                                                                <label for="award" class="control-label"> &nbsp;<br/>Award &nbsp; &nbsp; &nbsp;</label>
                                                                <br/> 
                                                                <input id="award"
                                                                       type="checkbox"                                
                                                                       class="form-control"   
                                                                       value="ticked" 
                                                                       name="award"     
                                                                       onclick="return false;"
                                                                       >
                                                            </div>
                                                        </div> <!--row-->


                                                        <div class="row" style="margin-bottom: 20px;margin-top: 5px">  

                                                            <div class="col-sm-5">
                                                                <strong class="pull-left">Amount approved</strong> 
                                                                <div class="input-group pull-left">
                                                                    <label class="input-group-addon" for="amountApproved">
                                                                        <span class="glyphicon glyphicon-euro"></span>                                     
                                                                    </label>
                                                                    <input type="text" class="form-control" name="amountApproved" id="amountApproved" placeholder="Amount Approved">    
                                                                </div>
                                                            </div>

                                                            <div class='col-sm-5'>
                                                                <strong class="pull-left">Publisher informed of meeting</strong>
                                                                <div class="input-group pull-left">
                                                                    <input type="text" name="datePublisherInformedOfMeeting" id="datePublisherInformedOfMeeting" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                    <label class="input-group-addon" for="datePublisherInformedOfMeeting">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </label>
                                                                </div> 
                                                            </div>

                                                            <script>
                                                                $("#datePublisherInformedOfMeeting").datepicker({
                                                                    showWeekDays: true,
                                                                    todayHighlight: true,
                                                                    autoclose: true
                                                                });
                                                            </script>

                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">   

                                                            <div class="col-sm-12">
                                                                <label for="commentsAboutMeeting" class="control-label pull-left">Board comments/instructions </label>
                                                                <textarea id="commentsAboutMeeting" class="form-control" name="commentsAboutMeeting" style="height: 98px" placeholder="'Refuse funding’ , ‘Award €1,000’ , ‘Postpone to next round’ , ‘Request revised sample'"></textarea>
                                                            </div>

                                                            <div class="row"> 
                                                                <div class='col-xs-12 button-wrapper' style="margin-bottom: 20px;margin-top: 60px"> 
                                                                    <!--<div class="btn-group btn-group-toggle" data-toggle="buttons">-->
                                                                    <button class='btn btn-success outline approved' onClick="reply_click(this.id)" type="button" name="Approved"   id="Approved">Approved</button>
                                                                    <button class='btn btn-warning outline withdrawn' onClick="reply_click(this.id)" type="button" name="Withdrawn" id="Withdrawn">Withdrawn</button>
                                                                    <button class='btn btn-danger outline rejected'  onClick="reply_click(this.id)" type="button" name="Rejected"    id="Rejected">Rejected</button>
                                                                    <!--</div>-->
                                                                </div>
                                                            </div> <!--row-->
                                                        </div>
                                                        <input type="hidden" name="ApproveWithdrawnReject" id="ApproveWithdrawnReject" />   
                                                    </div> <!--tab-pane" id="boardMeeting" -->


                                                    <!--Contract -->
                                                    <div class="tab-pane" id="contract">
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-1"></div>
                                                            <div class="col-sm-8">        
                                                                <label class="control-label">Book cover</label>                                                               
                                                                <img id="cover" src="" alt="Book Cover" class="img grow ImageBorder form-control" title="Book Cover"/>
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 5px"> 
                                                            <div class='col-sm-4'>
                                                                <strong class=" pull-left">Contract sent to publisher</strong>
                                                                <div class="input-group pull-left">
                                                                    <input type="text" name="dateContractSenttoPublisher" id="dateContractSenttoPublisher" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                    <label class="input-group-addon" for="dateContractSenttoPublisher">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <script>
                                                                $("#dateContractSenttoPublisher").datepicker({
                                                                    showWeekDays: true,
                                                                    todayHighlight: true,
                                                                    autoclose: true
                                                                });
                                                            </script>

                                                            <div class='col-sm-4'>
                                                                <strong class=" pull-left">Acknowledgement approved</strong>
                                                                <br/>
                                                                <div class="input-group">
                                                                    <input type="text" name="dateILEAcknowledgementApproved" id="dateILEAcknowledgementApproved" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                    <label class="input-group-addon" for="dateILEAcknowledgementApproved">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </label>
                                                                </div> 
                                                            </div>

                                                            <script>
                                                                $("#dateILEAcknowledgementApproved").datepicker({
                                                                    showWeekDays: true,
                                                                    todayHighlight: true,
                                                                    autoclose: true
                                                                });
                                                            </script>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px"> 
                                                            <div class='col-sm-4'>
                                                                <strong class=" pull-left"> Date published books received</strong>
                                                                <br/>
                                                                <div class="input-group">
                                                                    <input type="text" name="datePublishedBooksReceived" id="datePublishedBooksReceived" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                    <label class="input-group-addon" for="datePublishedBooksReceived">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </label>
                                                                </div>   
                                                            </div>

                                                            <script>
                                                                $("#datePublishedBooksReceived").datepicker({
                                                                    showWeekDays: true,
                                                                    todayHighlight: true,
                                                                    autoclose: true
                                                                });
                                                            </script>

                                                            <div class='col-sm-4'>
                                                                <strong class=" pull-left"> Date Payment Made to Publisher </strong>
                                                                <br/>
                                                                <div class="input-group">
                                                                    <input type="text" name="datePaymentMadeToPublisher" id="datePaymentMadeToPublisher" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                    <label class="input-group-addon" for="datePaymentMadeToPublisher">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </label>
                                                                </div>   
                                                            </div>

                                                            <script>
                                                                $("#datePaymentMadeToPublisher").datepicker({
                                                                    showWeekDays: true,
                                                                    todayHighlight: true,
                                                                    autoclose: true
                                                                });
                                                            </script>

                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px"> 
                                                            <div class="col-sm-4">
                                                                <label for="paymentReferenceNumber" class="control-label pull-left">Payment reference number</label>
                                                                <input id="paymentReferenceNumber"
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="paymentReferenceNumber"                                
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row">
                                                            <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px">
                                                                <div class="col-sm-2">
                                                                    <input id="appProofPaymentToTranslator"
                                                                           type="hidden"                                                             
                                                                           name="appProofPaymentToTranslator"                                
                                                                           >
                                                                </div>

                                                                <a class="btn btn-info" role="button" id="proofPaymentToTranslator" >
                                                                    <span class="glyphicon glyphicon-file"></span>
                                                                    Proof of payment <br/> to the translator</a>
                                                            </div>

                                                            <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">  
                                                                <div class="col-sm-2">
                                                                    <input id="appBankDetailsForm"                                
                                                                           type="hidden"                                                            
                                                                           name="appBankDetailsForm"                                
                                                                           >
                                                                </div>

                                                                <a class="btn btn-info" role="button" id="bankDetailsForm" >
                                                                    <span class="glyphicon glyphicon-file"></span>
                                                                    Completed bank <br/> details form</a>
                                                            </div>

                                                            <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">  
                                                                <div class="col-sm-2">
                                                                    <input id="appSignedLIContract"                                
                                                                           type="hidden"                                                            
                                                                           name="appSignedLIContract"                                
                                                                           >
                                                                </div>

                                                                <a class="btn btn-info" role="button" id="signedLIContract">
                                                                    <span class="glyphicon glyphicon-file"></span>
                                                                    Signed Literature <br/> Ireland contract</a>
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">  
                                                            <div class="form-group">
                                                                <label for="paymentStatus" >Payment status</label>
                                                                <div class="col-sm-12">
                                                                    <select class="selectpicker" id="paymentStatus" name="paymentStatus" >
                                                                        <option>Incomplete</option>
                                                                        <option>Complete</option>
                                                                        <option>Awaiting payment</option>
                                                                        <option>Paid</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">   
                                                            <div class="col-md-5"   style="margin-top: 25px; margin-bottom: 40px">
                                                                <strong class="pull-left">&nbsp;</strong>                                                 
                                                                <label class="btn btn-default pull-left" onclick = "pressCuttingsModal();">
                                                                    <img src="images/Press_Cutting.png" width="20" alt="Press_Cutting" /> 
                                                                    Show press coverage                     
                                                                </label>
                                                            </div>
                                                        </div> <!--row-->

                                                        <!--                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">  
                                                                                                    <div class="col-sm-4">
                                                                                                        <label for="salesFigures" class="control-label pull-left">Sales figures</label>
                                                                                                        <input id="salesFigures"
                                                                                                               type="text"                                
                                                                                                               class="form-control"                                
                                                                                                               name="salesFigures"  
                                                                                                               data-toggle="tooltip" 
                                                                                                               title="Number of copies of the book that have been sold"
                                                                                                               >
                                                                                                    </div>
                                                        
                                                                                                    <div class='col-sm-4'>                                                       
                                                                                                        <label for="dateUpdate" class="control-label pull-left">Date updated &nbsp;&nbsp;&nbsp;</label>
                                                                                                        <br/>
                                                                                                        <div class="input-group pull-left">
                                                                                                            <input type="text" name="dateUpdate" id="dateUpdate" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                                                            <label class="input-group-addon" for="dateUpdate">
                                                                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                                                            </label>
                                                                                                        </div>   
                                                                                                    </div>
                                                        
                                                                                                    <script>
                                                                                                        $("#dateUpdate").datepicker({
                                                                                                            showWeekDays: true,
                                                                                                            todayHighlight: true,
                                                                                                            autoclose: true
                                                                                                        });
                                                                                                    </script>
                                                                                                </div> row-->
                                                    </div> <!--contract-->
                                                </div> <!--tab content-->
                                            </div><!--modal body-->

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <input type="submit" class="btn btn-primary" value="Save changes">
                                            </div>
                                        </div> <!--modal-content -->
                                    </div> <!--modal-dialog -->
                                </div><!--modal -->



                                <!--listAssignedEReadermodal-->
                                <div class="modal fade" id="listAssignedEReadermodal" data-modal-index="3">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header" style="background-color: #c3bcbc">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                <h4 class="modal-title">List assigned expert reader</h4>
                                            </div>

                                            <div class="modal-body" style="background-color: #d9d1d1">

                                                <div class="row" style="margin-bottom: 20px;margin-top: 5px"> 
                                                    <div class='col-sm-6'>
                                                        <strong class=" pull-left">Expert reader</strong>
                                                        <div class="input-group pull-left">
                                                            <input type="text" name="appExpertReader" 
                                                                   id="appExpertReader" 
                                                                   class="form-control" 
                                                                   />    
                                                        </div>
                                                    </div>
                                                </div> <!--row-->                                                      

                                                <div class="row" style="margin-top: 30px;margin-bottom: 10px">
                                                    <div class='col-sm-4'>
                                                        <strong class=" pull-left"> Sample sent out</strong>
                                                        <div class="input-group pull-left">
                                                            <input type="text" name="sampleSentOut" id="sampleSentOut" class="form-control" placeholder="DD/MM/YYYY" />    
                                                            <label class="input-group-addon" for="sampleSentOut">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <script>
                                                        $("#sampleSentOut").datepicker({
                                                            showWeekDays: true,
                                                            todayHighlight: true,
                                                            autoclose: true
                                                        });
                                                    </script>

                                                    <div class='col-sm-4'>
                                                        <strong class=" pull-left"> Sample returned</strong>
                                                        <div class="input-group pull-left">
                                                            <input type="text" name="sampleReturned" id="sampleReturned" class="form-control" placeholder="DD/MM/YYYY" />    
                                                        </div>
                                                    </div>
                                                </div> <!--row-->

                                                <div class="row" style="margin-bottom: 20px;">
                                                    <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">  
                                                        <div class="col-sm-2">
                                                            <input id="ReadersReport"                                
                                                                   type="hidden"                                                            
                                                                   name="ReadersReport"                                
                                                                   >
                                                        </div>
                                                        <a class="btn btn-info" role="button" id="appReadersReport" >
                                                            <span class="glyphicon glyphicon-file"></span>
                                                            Reader’s Report</a>
                                                    </div>

                                                    <div class="col-sm-10">
                                                        <label for="readerReportSummary" class="control-label pull-left"> Reader’s report summary1</label>
                                                        <textarea id="readerReportSummary" 
                                                                  class="form-control"                                               
                                                                  name="readerReportSummary"    
                                                                  style="height: 98px"
                                                                  >                 
                                                        </textarea>
                                                    </div>
                                                </div> <!--row-->                          
                                            </div>
                                            <!-- /.modal-body -->
                                            <div class="modal-footer"  style="background-color: #c3bcbc">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->

                            </form>

                            <!--User-->
                            <div class="tab-pane fade" id="User">
                                <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                                    <div class="table-responsive">
                                        <table id="user" class="display user table table-striped table-bordered  dt-responsive nowrap" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th class="details-control"></th>              
                                                    <th class="all">User Name</th>
                                                    <th class="all">First Name</th>
                                                    <th class="all">Last Name</th>
                                                    <th class="all">Email</th>
                                                    <th class="all">Function</th>
                                                    <th class="all">Role</th>
                                                    <th class="all"></th>
                                                </tr>
                                            </thead>

                                            <tfoot>
                                                <tr>
                                                    <th class="details-control"></th>
                                                    <th class="all">User Name</th>
                                                    <th class="all">First Name</th>
                                                    <th class="all">Last Name</th>
                                                    <th class="all">Email</th>
                                                    <th class="all">Function</th>
                                                    <th class="all">Role</th>
                                                    <th class="all"></th>
                                                </tr>
                                            </tfoot>

                                            <tbody>
                                                <!-- Main Grid -->   
                                            </tbody>
                                        </table>
                                    </div>             
                                    <c:if test="${not empty error}">Error: ${error}</c:if>
                                    </div> <!-- /container-fluid -->

                                    <!--userModal-->
                                    <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">

                                                <div class="modal-header" style="background-color: #c3bcbc">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="userModalLabel"><span id="usr_name">_</span></h4>
                                                </div>

                                                <div class="modal-body" style="background-color: #d9d1d1">

                                                    <div class="row" style="margin-bottom: 5px;margin-top: 5px">
                                                        <div class="col-sm-4">
                                                            <label for="userUname" class="control-label pull-left">Username</label>
                                                            <input  id="userUname" 
                                                                    type="text"                                                  
                                                                    class="form-control"    
                                                                    name="userUname"    
                                                                    >
                                                        </div>
                                                    </div> <!--row-->

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-sm-4">
                                                            <label for="userFirstName" class="control-label pull-left">First name</label>
                                                            <input id="userFirstName"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userFirstName"                                
                                                                   >
                                                        </div>

                                                        <div class="col-sm-4">
                                                            <label for="userLastName" class="control-label pull-left">Last name</label>
                                                            <input id="userLastName"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userLastName"                                
                                                                   >
                                                        </div>
                                                    </div> <!--row-->

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                        <div class="col-sm-4">
                                                            <label for="userFunction" class="control-label pull-left">Function</label>
                                                            <input id="userFunction"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userFunction"                                
                                                                   >
                                                        </div>

                                                        <div class="col-sm-4">
                                                            <label for="userRole" class="control-label pull-left">Role</label>
                                                            <input id="userRole"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userRole"                                
                                                                   >
                                                        </div>
                                                    </div> <!--row-->

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                        <div class="col-sm-4">
                                                            <input id="userEmail"
                                                                   type="hidden"                                   
                                                                   name="userEmail"               
                                                                   >                                                    
                                                            <a class="btn btn-info btn-sm" role="button" id="mails" >
                                                                <span class="glyphicon glyphicon-envelope"></span>
                                                                <p id="msg"><span id="msg_val">_</span></p> </a>
                                                        </div>
                                                    </div> <!--row-->


                                                </div><!-- /.modal body -->

                                                <div class="modal-footer"  style="background-color: #c3bcbc">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
                                    <!--userModal-->
                                </div> <!--User-->

                                <!--Contracts-->
                                <div class="tab-pane fade" id="Contracts">
                                    <h2>Contracts content goes here</h2>

                                </div><!--Contracts-->

                                <!--ExpertReader-->
                                <div class="tab-pane fade" id="ExpertReader">
                                    <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                                        <div class="table-responsive">
                                            <table id="expReader" class="table table-striped table-bordered" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th class="details-control"></th>
                                                        <th class="all">First Name</th>
                                                        <th class="all">Last Name</th>
                                                        <th class="all">Email</th>
                                                    </tr>
                                                </thead>

                                                <tfoot>
                                                    <tr>
                                                        <th class="details-control"></th>
                                                        <th class="all">First Name</th>
                                                        <th class="all">Last Name</th>
                                                        <th class="all">Email</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <!-- Main Grid -->   
                                                </tbody>
                                            </table>
                                        </div>             
                                    <c:if test="${not empty error}">Error: ${error}</c:if>
                                    </div> <!-- /container-fluid -->

                                    <!--expReaderModal-->
                                    <div class="modal fade" id="expReaderModal" tabindex="-1" role="dialog" aria-labelledby="expReaderModalLabel">

                                        <div class="modal-dialog" role="document">

                                            <div class="modal-content">

                                                <div class="modal-header" style="background-color: #c3bcbc">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="expReaderModalLabel">Display expert readers</h4>
                                                </div>

                                                <div class="modal-body" style="background-color: #d9d1d1">

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                        <div class="col-sm-4">
                                                            <label for="FirstNameExpReader" class="control-label pull-left">First name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                            <input type="text" class="input-sm" id="FirstNameExpReader"/>
                                                        </div>

                                                        <div class="col-sm-1"></div>
                                                        <!--
                                                                                                                <div class="col-sm-4">
                                                        
                                                                                                                    <label for="expertReaderReferenceNumber"> Assign Expert Readers to Reference Number: </label>
                                                                                                                    <input type="text" class="input-sm" id="expertReaderReferenceNumber"/>
                                                        
                                                                                                                </div>-->
                                                    </div>

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-sm-4">
                                                            <label for="LastNameExpReader" class="control-label pull-left"> Last name</label>
                                                            <input type="text" class="input-sm" id="LastNameExpReader"/>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-sm-4">
                                                            <label for="EmailExpReader" class="control-label pull-left"> Email</label>
                                                            <input type="text" class="input-sm" id="EmailExpReader"/>
                                                        </div>
                                                    </div>




                                                </div><!-- modal body -->

                                                <div class="modal-footer"  style="background-color: #c3bcbc">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div><!-- modal-footer -->

                                            </div><!-- modal-content -->
                                        </div><!-- modal-dialog -->
                                    </div><!-- modal -->

                                </div> <!-- tab-pane expReader-->



                                <!--Library-->
                                <div class="tab-pane fade" id="Library">
                                    <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                                        <div class="table-responsive">
                                            <table id="books" class="display table table-striped table-bordered nowrap" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>         
                                                        <th class="details-control"></th>
                                                        <th class="none">bookID</th>
                                                        <th class="all">Reference <br/> Number</th>
                                                        <th class="all">Author(s)</th>
                                                        <th class="all">Title</th>
                                                        <th class="all">Publisher</th>                                                        
                                                        <th class="none">Publisher <br/>Year</th>
                                                        <th class="none">Genre</th>
                                                        <th class="all">Translation<br/>Title</th>  
                                                        <th class="all">Original Publisher</th>                                                        
                                                        <th class="none">Translation<br/>Publisher Year</th>                                                        
                                                        <th class="all">Translator</th>
                                                        <th class="all">Language</th>
                                                        <th class="none">Copies</th>
                                                        <th class="none">Notes</th>
                                                        <th class="none">ISBN</th>
                                                        <th class="none">ISSN</th>
                                                        <th class="none"></th>                                                                                                            
                                                    </tr>
                                                </thead>

                                                <tfoot>
                                                    <tr>                                                                    
                                                        <th class="details-control"></th>
                                                        <th class="none">bookID</th>
                                                        <th class="all">Reference <br/> Number</th>
                                                        <th class="all">Author(s)</th>
                                                        <th class="all">Title</th>
                                                        <th class="all">Publisher</th>                                                        
                                                        <th class="none">Publisher <br/>Year</th>
                                                        <th class="none">Genre</th>
                                                        <th class="all">Translation<br/>Title</th>  
                                                        <th class="all">Original Publisher</th>                                                        
                                                        <th class="none">Translation<br/>Publisher Year</th>                                                        
                                                        <th class="all">Translator</th>
                                                        <th class="all">Language</th>
                                                        <th class="none">Copies</th>
                                                        <th class="none">Notes</th>
                                                        <th class="none">ISBN</th>
                                                        <th class="none">ISSN</th>
                                                        <th class="none"></th>                           
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>             
                                    <c:if test="${not empty error}">Error: ${error}</c:if>



                                        <!--createNewGenremodal-->
                                        <div class="modal fade" id="createNewGenremodal" tabindex="-1" role="dialog" aria-labelledby="createNewGenremodalLabel"  data-modal-index="3">

                                            <div class="modal-admin" role="document">

                                                <div class="modal-content">

                                                    <div class="modal-header" style="background-color: #c3bcbc;">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="createNewGenremodalLabel">Add Genre</h4>
                                                    </div>

                                                    <div class="modal-body" style="background-color: #d9d1d1">

                                                        <div class="row">
                                                            <div class="col-sm-4"></div>
                                                            <div class="col-sm-4">
                                                                <label for="addGenre" class="control-label pull-left">Add Genre</label>
                                                                <input type="text" class="form-control input-sm" id="addGenre"/>                               
                                                            </div>
                                                            <div class="col-sm-4"></div>
                                                        </div>

                                                    </div><!-- modal body -->

                                                    <div class="modal-footer"  style="background-color: #c3bcbc;">                       
                                                        <button type="button" class="btn btn-primary" id="addGenreButton" data-dismiss="modal" >Add Genre</button>
                                                    </div><!-- modal-footer -->

                                                </div><!-- modal-content -->
                                            </div><!-- modal-dialog -->
                                        </div><!-- modal -->

                                        <!--deleteGenreSuccessModal-->
                                        <div class="modal fade" id="deleteGenreSuccessModal" tabindex="-1" role="dialog" aria-labelledby="deleteGenreSuccessModalLabel"  data-modal-index="3">

                                            <div class="modal-admin" role="document">

                                                <div class="modal-content">

                                                    <div class="modal-header" style="background-color: #5bdc18;">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="deleteGenreSuccessModalLabel">Success</h4>
                                                    </div>

                                                    <div class="modal-body" style="background-color: #d9d1d1">

                                                        <div class="row">
                                                            <div class="col-sm-3"></div>
                                                            <div class="col-sm-6">                               
                                                                <p id="showDeletedGenre"></p>                       
                                                            </div>
                                                            <div class="col-sm-3"></div>
                                                        </div>

                                                    </div><!-- modal body -->

                                                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div><!-- modal-footer -->

                                                </div><!-- modal-content -->
                                            </div><!-- modal-dialog -->
                                        </div><!-- modal -->

                                        <!--addGenreSuccessModal-->
                                        <div class="modal fade" id="addGenreSuccessModal" tabindex="-1" role="dialog" aria-labelledby="addGenreSuccessModalLabel"  data-modal-index="3">

                                            <div class="modal-admin" role="document">

                                                <div class="modal-content">

                                                    <div class="modal-header" style="background-color: #5bdc18;">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="addGenreSuccessModalLabel">Success</h4>
                                                    </div>

                                                    <div class="modal-body" style="background-color: #d9d1d1">

                                                        <div class="row">
                                                            <div class="col-sm-3"></div>
                                                            <div class="col-sm-6">                               
                                                                <p id="showAddedGenre"></p>                       
                                                            </div>
                                                            <div class="col-sm-3"></div>
                                                        </div>

                                                    </div><!-- modal body -->

                                                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div><!-- modal-footer -->

                                                </div><!-- modal-content -->
                                            </div><!-- modal-dialog -->
                                        </div><!-- modal -->


                                        <div class="modal fade" id="editBooksModal" tabindex="-1" role="dialog" aria-labelledby="editBooksModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="editBooksModalLabel">Edit books</h4>
                                                    </div>
                                                    <div class="modal-body">


                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                            <div class="col-sm-4">
                                                                <label class="pull-left"> Reference number </label>
                                                                <p><input type="text" class="input-sm" id="referenceNumber2"/></p>
                                                            </div>
                                                        </div>

                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-6">
                                                                <label class="pull-left" for="Author2"> Author </label>   
                                                                <textarea  id="Author2" name="Author2"  rows="2" cols="65">
                                                        
                                                                </textarea>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-4">
                                                                <label class="pull-left" for="Title2"> Title</label>
                                                                <p><input type="text" class="input-sm" id="Title2"/></p>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-4">
                                                                <label class="pull-left"> Genre</label>
                                                                <p><input type="text" class="input-sm" id="Genre2"/></p>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-4">
                                                                <label class="pull-left"> Language(s) </label>
                                                                <p><input type="text" class="input-sm" id="Language2"/></p>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-4">                                                                                                          
                                                                <label class="pull-left"> ISBN </label>
                                                                <p><input type="text" class="input-sm" id="ISBN2"/></p>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="modal-footer"  style="background-color: #c3bcbc">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-primary">Save changes</button>
                                                    </div>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-dialog -->
                                        </div><!-- /.modal -->
                                    </div>
                                </div> <!--Library-->

                                <!--Genres-->
                                <div class="tab-pane fade" id="Genres">
                                    <h2>Manage Genres</h2>
                                    <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">
                                        <div class="table-responsive">
                                            <table id="genreTable" class="table table-striped table-bordered  dt-responsive nowrap" width="75%" cellspacing="0" border="1">
                                                <thead>
                                                    <tr>
                                                        <th class="delete-control" style="width: 5%">Remove</th>                                                  
                                                        <th class="all">Genre</th>   
                                                        <th class="never"></th>     
                                                        <th class="never"></th>
                                                    </tr>
                                                </thead>

                                                <tfoot>
                                                    <tr>
                                                        <th class="delete-control" style="width: 5%">Remove</th>                                                  
                                                        <th class="all"></th>   
                                                        <th class="never"></th>     
                                                        <th class="never"></th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>             
                                    </div>                             
                                </div> <!--tab-pane Genres-->


                                <div class="tab-pane fade" id="Queries">
                                    <h2>Queries go here</h2>
                                </div>
                            </div>

                        </div>

                    </nav>

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
                </div>
                <!-- end of container div -->
                <div class="shadowbase"> </div>
            </div><!-- end of Shadow container div -->
            <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
                &copy; 2019 mgr Software
            </div>


            <!--Add New Eexpert Reader modal-->
            <div class="modal fade" id="createNewEReadermodal" data-modal-index="2">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form 
                            id="createNewEReaderForm"  
                            method="POST"
                            role="form"                             
                            action="${pageContext.request.contextPath}/AddUserExpertReader" 
                        >


                        <input type="hidden" name="AddExpertReader"  class="form-control" value="AddExpertReader">
                        <div class="modal-header" style="background-color: #c3bcbc">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Add new expert reader</h4>
                        </div>
                        <div class="modal-body" style="background-color: #d9d1d1">

                            <div class="panel-body">

                                <!--                              <div class="signup-form-container">
                              
                              
                                                                      <div id="signupalert" style="display:none" class="alert alert-danger">
                                                                          <p>Error:</p>
                                                                          <span></span>
                                                                      </div>
                              
                                                                      <div class="form-body">
                                                                          <div class="alert alert-info" id="message" style="display:none;">
                                                                              submitted
                                                                          </div>
                              
                                                                          <div class="alert alert-danger" role="alert" id="errorField" style="display:none">
                                                                              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                                                              <span class="sr-only">Error:</span>
                                                                              <span class="message"></span>
                                                                          </div>
                              
                                                                          <div class="alert alert-success" role="alert" id="successField" style="display:none">
                                                                              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                                                              <span class="sr-only">Success:</span>
                                                                              <span class="message"></span>
                                                                          </div>-->
                                <!--ENSURE signup is validated-->
                                <div class="form-group">
                                    <!-- <label for="username" class="col-md-3 control-label">Username</label>-->
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="uname" id="uname" placeholder="Username" onblur="loadXMLDocER()"/>                                           
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <!--<label for="firstname" class="col-md-3 control-label">First Name</label>-->
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="firstname" placeholder="First Name">                                            
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <!--<label for="lastname" class="col-md-3 control-label">Last Name</label>-->
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="lastname" placeholder="Last Name">                                            
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>       

                                <div class="form-group">
                                    <!--<label for="email" class="col-md-3 control-label">Email</label>-->
                                    <div class="col-md-9">
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Email Address">                                            
                                        <span class="help-block" id="error"></span>   
                                        <!--<span id="erremail" class="alert alert-danger col-lg-8 col-md-8 col-sm-8 col-xs-12">Invalid Email Address</span>-->
                                    </div>
                                </div>

                                <div class="form-group">
                                    <!--<label for="password" class="col-md-3 control-label">Password</label>-->
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">                                           
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>

                                <div class="form-group">
                                    <!--<label for="cpassword" class="col-md-3 control-label">Confirm Password</label>-->
                                    <div class="col-md-9">
                                        <input type="password" class="form-control"  id="cpassword" name="cpassword" placeholder="Confirm Password">                               
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>

                                <!--                                       </div><%--form-body --%>
                               
                                                                       <div class="form-footer">
                                                                           <button type="submit" class="btn btn-info">
                                                                               <span class="glyphicon glyphicon-log-in"></span> Sign Me Up !
                                                                           </button>
                                                                       </div>-->
                            </div><!--signup-form-container-->

                            <!--<input type="hidden" name="NewAssignedERRefNo" id="NewAssignedERRefNo"  class="form-control">-->
                        </div>
                        <div class="modal-footer"  style="background-color: #c3bcbc">
                            <input type="hidden" name="userID" value="${userID}">
                            <input type="hidden" name="publisherID" value="${publisherID}">
                            <input type="hidden" name="Company" value="${companyDetails.Company}">
                            <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                            <button type="submit" class="btn btn-primary" >Add new expert reader</button>
                        </div>

                        <!--                                </div>-->
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->     


        <!--Add New Staff Member modal-->
        <div class="modal fade" id="createNewStaffmodal" data-modal-index="2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form 
                        id="createNewStaffmodalForm"  
                        method="POST"
                        role="form"                             
                        action="${pageContext.request.contextPath}/AddUserStaff" 
                        >


                        <input type="hidden" name="AddNewStaff"  class="form-control" value="AddNewStaff">
                        <div class="modal-header" style="background-color: #c3bcbc">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Add new Staff member</h4>
                        </div>
                        <div class="modal-body" style="background-color: #d9d1d1">

                            <div class="panel-body">

                                <!--ENSURE signup is validated-->
                                <div class="form-group">
                                    <!-- <label for="username" class="col-md-3 control-label">Username</label>-->
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="StaffUname" id="StaffUname" placeholder="Username" onblur="loadXMLDocStaff()"/>                                           
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <!--<label for="firstname" class="col-md-3 control-label">First Name</label>-->
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="StaffFirstname" placeholder="First Name">                                            
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <!--<label for="lastname" class="col-md-3 control-label">Last Name</label>-->
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="StaffLastname" placeholder="Last Name">                                            
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>       

                                <div class="form-group">
                                    <!--<label for="email" class="col-md-3 control-label">Email</label>-->
                                    <div class="col-md-9">
                                        <input type="email" class="form-control" name="StaffEmail" id="StaffEmail" placeholder="Email Address">                                            
                                        <span class="help-block" id="error"></span>   
                                        <!--<span id="erremail" class="alert alert-danger col-lg-8 col-md-8 col-sm-8 col-xs-12">Invalid Email Address</span>-->
                                    </div>
                                </div>

                                <div class="form-group">
                                    <!--<label for="password" class="col-md-3 control-label">Password</label>-->
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" id="StaffPassword" name="StaffPassword" placeholder="Password">                                           
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>

                                <div class="form-group">
                                    <!--<label for="cpassword" class="col-md-3 control-label">Confirm Password</label>-->
                                    <div class="col-md-9">
                                        <input type="password" class="form-control"  id="StaffCpassword" name="StaffCpassword" placeholder="Confirm Password">                               
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>
                            </div><!--signup-form-container-->

                            <!--<input type="hidden" name="NewAssignedERRefNo" id="NewAssignedERRefNo"  class="form-control">-->
                        </div>
                        <div class="modal-footer"  style="background-color: #c3bcbc">
                            <input type="hidden" name="userID" value="${userID}">
                            <input type="hidden" name="publisherID" value="${publisherID}">
                            <input type="hidden" name="Company" value="${companyDetails.Company}">
                            <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                            <button type="submit" class="btn btn-primary" >Add new Staff member</button>
                        </div>

                        <!--                                </div>-->
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->    

        <!--additionalExpertReaderModal-->
        <div id="additionalExpertReaderModal"></div>

        <!--assignEReadermodal-->
        <div class="modal fade" id="assignEReadermodal" data-modal-index="2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form 
                        id="assignEReaderForm"  
                        method="POST"
                        role="form"                             
                        action="${pageContext.request.contextPath}/AssignExpertReader" 
                        >
                        <%request.getSession().setAttribute("task", "AssignExpertReader");%>

                        <input type="hidden" name="AssignExpertReader"  class="form-control" value="AssignExpertReader">
                        <div class="modal-header" style="background-color: #c3bcbc">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Assign expert reader to reference number</h4>
                        </div>
                        <div class="modal-body" style="background-color: #d9d1d1">

                            <div class="row" style="margin-bottom: 20px;">  
                                <div class='col-sm-4'>
                                    <label for="selectUnassignedER" class="pull-left">Select</label>
                                    <select class="selectpicker" id="selectUnassignedER" onchange="selectER();"></select>
                                </div>
                                <input type="hidden" name="selectedUnassignedER" id="selectedUnassignedER"  class="form-control">
                                <div class='col-sm-4' style="padding-left: 5px">
                                    <label for="unassignedERRefNo"  class="pull-left">for Reference Number</label>
                                    <input id="unassignedERRefNo" value="" disabled />
                                </div>
                            </div> <!--row-->

                            <div class="row" style="margin-bottom: 20px;">  
                                <div class='col-sm-4'>
                                    <strong class=" pull-left">&nbsp;<br/> Sample sent out</strong>
                                    <div class="input-group pull-left">
                                        <input type="text" name="sampleSentOut" readonly="" id="sampleSentOut1" class="form-control" placeholder="DD/MM/YYYY" />    
                                    </div>
                                </div>
                                <div class='col-sm-6'>
                                    <strong class=" pull-left">Expected return date of report</strong>
                                    <div class="input-group pull-left">
                                        <input type="text" name="expectedReturnDate" id="expectedReturnDate" class="form-control" placeholder="DD/MM/YYYY" />    
                                        <label class="input-group-addon" for="expectedReturnDate">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </label>
                                    </div>
                                </div>
                                <script>
                                    $("#expectedReturnDate").datepicker({
                                        showWeekDays: true,
                                        todayHighlight: true,
                                        autoclose: true
                                    });
                                </script>
                            </div> <!--row-->
                            <input type="hidden" name="NewAssignedERRefNo" id="NewAssignedERRefNo"  class="form-control">
                        </div>
                        <div class="modal-footer"  style="background-color: #c3bcbc">
                            <input type="hidden" name="userID" value="${userID}">
                            <input type="hidden" name="publisherID" value="${publisherID}">
                            <input type="hidden" name="Company" value="${companyDetails.Company}">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" >Assign expert reader</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->           



        <!--pressCuttingsModal-->
        <div class="modal fade" id="pressCuttingsModal" tabindex="-1" role="dialog" aria-labelledby="pressCuttingsModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #c3bcbc">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="pressCuttingsModalLabel">See press coverage</h4>
                    </div>


                    <div class="modal-body" style="background-color: #d9d1d1">
                        <div class="row" style="margin-bottom: 10px">

                            <output id="result">Press coverage</output>
                            <div id="pressCoverageTag"></div>
                        </div>
                    </div>

                    <div class="modal-footer"  style="background-color: #c3bcbc">                      
                        <!--                        <label class="btn btn-default btn-file">
                                                    Add press coverage<input type="file" id="files" multiple  accept=".gif,.jpg,.jpeg,.png,.doc,.docx,.pdf">
                                                </label>-->
                        <button type="button" class="btn btn-default" data-dismiss="modal">Done</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div> <!--modal footer -->
                </div> <!--modal content-->          
            </div> <!--modal dialog-->
        </div> <!--modal fade-->
        <!--pressCuttingsModal-->
        <input type="hidden" value="pressCuttings" name="image-file" id="label_pressCuttings"/>

        <div class="modal fade" id="booksModal" tabindex="-1" role="dialog" aria-labelledby="booksModalLabel">

            <div class="modal-dialog" role="document">

                <div class="modal-content" style="background-color: #d9d1d1">

                    <div class="modal-header" style="background-color: #c3bcbc">
                        <h4 class="modal-title" id="booksModalLabel">Manage books</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                    </div>

                    <!-- modal-body -->
                    <div class="modal-body" style="background-color: #d9d1d1;">
                        <div class="container-fluid">
                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-8">        
                                    <label class="control-label">Book cover</label>                                                               
                                    <img id="bookCover" src="" alt="Book Cover" class="img ImageBorder form-control" title="Book Cover"/>
                                </div>
                            </div>

                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                <div class="col-sm-4">
                                    <label class="pull-left"> Reference Number </label>
                                    <p><input type="text" class="input-sm pull-left" id="referenceNumber"/></p>
                                </div>
                            </div>

                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                <div class="col-sm-5">
                                    <label class="pull-left" for="Author"> Author </label>   
                                    <input type="text" class="input-sm pull-left" id="Author"/>                                   
                                </div>

                                <div class="col-sm-6">
                                    <label class="pull-left" for="Translator"> Translator </label>   
                                    <input type="text" class="input-sm pull-left" id="Translator"/>
                                </div>

                            </div>

                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                <div class="col-sm-5">
                                    <label class="pull-left" for="OrgTitle"> Original Title &nbsp;&nbsp;&nbsp;</label>
                                    <input type="text" class="input-sm pull-left" id="OrgTitle"/>
                                </div>
                                <div class="col-sm-6">
                                    <label class="pull-left" for="TransTitle"> Translated Title</label>
                                    <input type="text" class="input-sm pull-left" id="TransTitle"/>
                                </div>

                            </div>

                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                <div class="col-sm-5">
                                    <label class="pull-left" for="Publisher"> Publisher &nbsp;&nbsp;&nbsp;</label>
                                    <input type="text" class="input-sm pull-left" id="Publisher"/>
                                </div>
                                <div class="col-sm-6">
                                    <label class="pull-left" for="translationPublisher"> Original Publisher</label>
                                    <input type="text" class="input-sm pull-left" id="translationPublisher"/>
                                </div>
                            </div>


                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                <div class="col-sm-5">
                                    <label class="pull-left"> Publisheryear</label>
                                    <input type="text" class="input-sm pull-left" id="Publisheryear"/>
                                </div>
                                <div class="col-sm-5">
                                    <label class="pull-left"> Genre</label>
                                    <input type="text" class="input-sm pull-left" id="Genre"/>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                <div class="col-sm-4">
                                    <label class="pull-left"> Language(s) </label>
                                    <p><input type="text" class="input-sm" id="Language"/></p>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                <div class="col-sm-5">                                                                                                          
                                    <label class="pull-left"> ISBN </label>
                                    <input type="text" class="input-sm" id="ISBN"/>
                                </div>
                                <div class="col-sm-5">                                                                                                          
                                    <label class="pull-left"> ISSN </label>
                                    <input type="text" class="input-sm" id="ISSN"/>
                                </div>
                            </div>
                        </div>
                    </div>  <!--modal-body -->

                    <!--modal-footer -->
                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                                       
                        <button type="button" class="btn btn-primary"  onclick="saveBooks();">Save changes / NOT available yet</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>  <!-- modal-footer -->

                </div> <!-- modal-content -->
            </div> <!-- modal-dialog -->
        </div> <!-- modal -->

        <!--loadXMLDocER-->
        <script type="text/javascript">
            function loadXMLDocER()
            {
                var xmlhttp;
                var uname = document.getElementById("uname").value;
                var urls = "checkusername.jsp?uname=" + uname;

                if (window.XMLHttpRequest)
                {
                    xmlhttp = new XMLHttpRequest();
                } else
                {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState === 4)
                    {
                        document.getElementById("error").innerHTML = xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET", urls, true);
                xmlhttp.send();
            }
            ;
        </script>

        <!--loadXMLDocStaff-->
        <script type="text/javascript">
            function loadXMLDocStaff()
            {
                var xmlhttp;
                var uname = document.getElementById("StaffUname").value;
                var urls = "checkusername.jsp?uname=" + uname;

                if (window.XMLHttpRequest)
                {
                    xmlhttp = new XMLHttpRequest();
                } else
                {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState === 4)
                    {
                        document.getElementById("error").innerHTML = xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET", urls, true);
                xmlhttp.send();
            }
            ;
        </script>
    </body>
</html>
