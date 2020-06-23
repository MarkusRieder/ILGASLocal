<%-- 
    Document   : welcome_Staff_1
    Created on : 15-May-2018, 07:09:54
    Author     : Markus Rieder
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 
           prefix="fn" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html style="height: 100%" >
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="robots" content="noindex, nofollow">

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 

        <!--JQuery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <!-- Bootstrap -->

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--DataTables-->

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https:////cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/plug-ins/1.10.15/integration/font-awesome/dataTables.fontAwesome.css">

        <link rel="stylesheet" type="text/css" href="css/welcome_Staff_1.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker.css" />

        <link rel="stylesheet" href="css/lesshat.css" />
        <link rel="stylesheet" type="text/css" href="css/lightbox.min.css">
        <link rel="stylesheet" href="css/jquery.dataTables.yadcf.css" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
        <link rel="stylesheet" type="text/css" href="css/irishLiterature.css">
        <link href="css/template.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/select-css.css">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>        
        <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>


        <script type="text/javascript"   src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>  

        <script type="text/javascript"   src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>       
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript"   src="//cdn.datatables.net/plug-ins/1.10.12/sorting/datetime-moment.js"></script>
        <script type="text/javascript"   src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript"   src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
        <script type="text/javascript"   src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
        <script type="text/javascript"   src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js "></script>
        <script type="text/javascript"   src="//cdn.datatables.net/plug-ins/1.10.15/dataRender/datetime.js"></script>
        <script type="text/javascript"   src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"   src="js/jquery-ui.js"></script>
        <script type="text/javascript"   src="js/lightbox.min.js"></script>
        <script src="//mozilla.github.io/pdf.js/build/pdf.js"></script>
        <script type="text/javascript"   src="js/jquery.dataTables.yadcf.js"></script>
        <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>

        <!--ckeditor-->
        <!--        <script type="text/javascript" src="assets/js/ckeditor/ckeditor.js"></script>
                <script type="text/javascript" src="assets/js/ckeditor/adapters/jquery.js"></script>
                <script type="text/javascript" src="assets/js/ckeditor/config.js"></script>-->
        <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script>

        <!--jqueryFileTree-->
        <script src="js/jquery.easing.js" type="text/javascript"></script>
        <script src="js/jqueryFileTree.js" type="text/javascript"></script>     

        <!--Stylesheets-->

        <!--jqueryFileTree-->
        <link href="css/jqueryFileTree.css" rel="stylesheet" type="text/css" media="screen" />

        <!--welcome_Staff_1-->
        <!--<script src="js/welcome_Staff_1.js" type="text/javascript"></script>-->
        <!--               template-->

        <!--<script src="js/template.js" type="text/javascript"></script>-->
        <title>Translation Grant Application System</title>

        <script>

            /*
             * welcome_Staff_1.js
             */

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
            var booksTable = null;
            var hasCover = false;
            var rowdata1;
            var rowdata = [];
            var oTable = null;
            var tuttut = [];
            var detailsTableData;


            function loadXMLDocER() {
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

            /*
             * gallery
             */
            function  gallery() {
                let modalId = $('#image-gallery');
                loadGallery(true, 'a.thumbnail');

                /*
                 * This function disables buttons when needed
                 */
                function disableButtons(counter_max, counter_current) {
                    $('#show-previous-image, #show-next-image')
                            .show();
                    if (counter_max === counter_current) {
                        $('#show-next-image')
                                .hide();
                    } else if (counter_current === 1) {
                        $('#show-previous-image')
                                .hide();
                    }
                }

                /**
                 *
                 * @param setIDs        Sets IDs when DOM is loaded. If using a PHP counter, set to false.
                 * @param setClickAttr  Sets the attribute for the click handler.
                 */

                function loadGallery(setIDs, setClickAttr) {
                    let current_image,
                            selector,
                            counter = 0;

                    $('#show-next-image, #show-previous-image')
                            .click(function () {
                                if ($(this)
                                        .attr('id') === 'show-previous-image') {
                                    current_image--;
                                } else {
                                    current_image++;
                                }

                                selector = $('[data-image-id="' + current_image + '"]');
                                console.log("selector " + selector.name);
                                updateGallery(selector);
                            });

                    function updateGallery(selector) {
                        let $sel = selector;
                        current_image = $sel.data('image-id');
                        console.log("current_image " + current_image);
                        var filename = $sel.data('image').replace(/^.*[\\\/]/, '');
                        $('#image-gallery-title')
                                .text(filename);
                        console.log("current_image " + $sel.data('image'));
                        console.log("current_image filename " + filename);
                        $('#image-gallery-image')
                                .attr('src', $sel.data('image'));
                        disableButtons(counter, $sel.data('image-id'));
                    }

                    if (setIDs === true) {
                        $('[data-image-id]')
                                .each(function () {
                                    counter++;
                                    console.log("counter " + counter);
                                    $(this).attr('data-image-id', counter);
                                });
                    }
                    $(setClickAttr)
                            .on('click', function () {
                                updateGallery($(this));
                            });
                }


// build key actions
                $(document)
                        .keydown(function (e) {
                            switch (e.which) {
                                case 37: // left
                                    if ((modalId.data('bs.modal') || {})._isShown && $('#show-previous-image').is(":visible")) {
                                        $('#show-previous-image')
                                                .click();
                                    }
                                    break;

                                case 39: // right
                                    if ((modalId.data('bs.modal') || {})._isShown && $('#show-next-image').is(":visible")) {
                                        $('#show-next-image')
                                                .click();
                                    }
                                    break;

                                default:
                                    return; // exit this handler for other keys
                            }
                            e.preventDefault(); // prevent the default action (scroll / move caret)
                        });
            }

//});

//Validation
            $(document).ready(function () {
                $("#alertSuccess").hide();
                $("#errid").hide();
                $("#errname").hide();
                $("#erremail").hide(); //Initially hiding the error spans
                $("#errpass").hide();
                $("#Rbtn").click(function () {
                    var userid = $("#id").val();
                    var username = $("#username").val();
                    var password = $("#password").val(); //triggers on click of register
                    var email = $("#email").val();
                    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                    var letters = /^[A-Za-z]+$/;
                    if (userid === "" || userid === null) {
                        alert("UserID cannot be Empty");
                        return false;
                    } else if (username === null || username === "") {
                        alert("UserName cannot be Empty");
                        return false;
                    } else if (password === "" || password === null) {
                        alert("Password cannot be Empty");
                        return false;
                    } else if (email === "" || email === null) {

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
                    var userid = $("#id").val(); //here we are restricting the user at the time of typing,we called an event "Keyup"
                    if (isNaN(userid)) {

                        $("#errid").show(); //if user enters other than number then the error span will be shown
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
                    if ((password = !cpassword)) {
                        $("#errpass").show();
                        return false;
                    } else {
                        $("#errpass").hide();
                        return true;
                    }
                });
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
            });

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
                });
            }

//            $.datepicker.setDefaults({
//                dateFormat: 'dd/mm/yy',
//                showOtherMonths: true,
//                selectOtherMonths: true,
//                autoclose: true,
//                changeMonth: true,
//                changeYear: true,
//                gotoCurrent: true,
//                orientation: "bottom" // <-- and add this
//            });

//genreTable
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

//userTable
            $(document).ready(function () {
                $.fn.dataTable.ext.buttons.newStaff = {
                    text: 'NewStaff'
                };
                var userTable = $("#user").DataTable({
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
                            text: '<i class="fas fa-user-plus" style="font-size:24px;color:blue"></i>',
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
                    var row = userTable.row(tr);
                    var rowdata = (userTable.row(tr).data());
                    console.log("rowdata.EMAIL  " + rowdata.EMAIL);
                    $('#usr_name').html("User Details for: " + rowdata.FIRST_NAME + " " + rowdata.LAST_NAME);
                    var mail = 'mailto: ' + rowdata.EMAIL;
                    $("#userClearEmail").val(rowdata.EMAIL);
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
                    console.log(userTable.row(this).data());
                });
            });

            //expReaderTable
            $(document).ready(function () {
                $.fn.dataTable.ext.buttons.reload = {
                    text: 'Reload'
                };
                $.fn.dataTable.ext.errMode = 'throw';
                var expReaderTable = $('#expReader').DataTable({

                    /**
                     B - Buttons
                     f - filtering input
                     r - processing display element
                     t - The table!
                     p - pagination control
                     
                     **/

                    dom: 'Bfrtip',
                    buttons: [
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
                        {className: "dt-left", "targets": [1, 2, 3, 4, 5]}
                    ],
                    "bProcessing": false,
                    "bServerSide": false,
                    "sAjaxSource": "./ExpertReaderDataServlet",
                    "columns": [{
                            "targets": -2,
                            "class": "details-control",
                            "orderable": false,
                            "data": null,
                            "defaultContent": ""
                        },
                        {
                            "targets": -1,
                            "class": "delete-control",
                            "orderable": false,
                            "data": null,
                            "defaultContent": ""
                        },
                        {"data": "USER_ID"},
                        {"data": "FIRST_NAME"},
                        {"data": "LAST_NAME"},
                        {"data": "EMAIL"}
                    ]
                });
                $('#expReader tbody').on('click', 'tr td.details-control', function () {
                    $("#expReaderModal").modal("show");
                    $("#FirstNameExpReader").val($(this).closest('tr').children()[3].textContent); // First Name
                    $("#LastNameExpReader").val($(this).closest('tr').children()[4].textContent); // Last Name
                    $("#EmailExpReader").val($(this).closest('tr').children()[5].textContent); // Email                    
                    console.log(expReaderTable.row(this).data());
                });
                $('#expReader tbody').on('click', 'tr td.delete-control', function () {
                    $("#deleteExpReaderModal").modal("show");
                    $("#delExpertReaderID").val($(this).closest('tr').children()[2].textContent); // ID
                    $("#delFirstNameExpReader").val($(this).closest('tr').children()[3].textContent); // First Name
                    $("#delLastNameExpReader").val($(this).closest('tr').children()[4].textContent); // Last Name
                    $("#delEmailExpReader").val($(this).closest('tr').children()[5].textContent); // Email                    
                    console.log(expReaderTable.row(this).data());
                });
                $('#der').on('click', function () {

                    var idToDelete = document.getElementById("delExpertReaderID").value;
                    console.log("idToDelete  " + idToDelete);
                    $.ajax({
                        type: "POST",
                        url: "./ExpertReaderDelete",
                        data: "id=" + idToDelete,
                        success: function (data, status, xhr) {
                            //delete the row
                            expReaderTable.ajax.reload();
                            $("#deleteExpReaderModal").modal('toggle');
                            document.getElementById("showDeleteExpReader").innerHTML = "Expert Reader: <strong>'" + idToDelete + "'</strong> has been  <strong>successfully</strong> deleted!";
                            $("#deleteExpReaderSuccessModal").modal('show');
                        },
                        error: function (xhr) {
                            alert("Error");
                            $('#edtModal').show();
                            //error handling
                        }});
                });
            });

            /*
             * booksTable
             */
            $(document).ready(function () {
                booksTable = $("#books").DataTable({
                    "processing": true,
                    'language': {
                        "loadingRecords": "&nbsp;",
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
                        {"data": "referenceNumber",
                            "render": function (data, type, full, meta) {
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }

                            }},
                        {"data": "Author",
                            "render": function (data, type, full, meta) {

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
                            }},
                        {"data": "Publisher",
                            "render": function (data, type, full, meta) {
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
                            }},
                        {"data": "Genre",
                            "render": function (data, type, full, meta) {
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                            }},
                        {"data": "translationTitle",
                            "render": function (data, type, full, meta) {
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                            }},
                        {"data": "translationPublisher",
                            "render": function (data, type, full, meta) {
//                                console.log("translationPublisher " + data);
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
//                                console.log("translationPublisherYear " + data);
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
//                                console.log("Language: " + data);
                            }},
//                        {"data": "physicalDescription"},
//                        {"data": "Duplicates"},
                        //{"data": "Copies"},
                        {"data": "translationPublisherYear",
                            "render": function (data, type, full, meta) {
//                                console.log("translationPublisherYear " + data);
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                            }
                        }, //as dummy for Copies
                        {"data": "Notes",
                            "render": function (data, type, full, meta) {
//                                console.log("Notes " + data);
                                if (typeof (data) === "undefined") {
                                    return 'Notes n/a';
                                } else {
                                    return data;
                                }
                            }},
                        {"data": "ISBN",
                            "render": function (data, type, full, meta) {
//                                console.log("ISBN " + data);
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                            }
                        },
                        {"data": "ISSN",
                            "render": function (data, type, full, meta) {
//                                console.log("ISSN " + data);
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

                                    return '<img src="http://www.literatureirelandgrantapplication.com:8080/ILGAS/images/not-available.jpg" width="275" height="275" alt="not-available"/>';
                                } else {
                                    return '<img src="http://www.literatureirelandgrantapplication.com:8080' + data + '">';
                                }
                            }}
                    ],
                    columnDefs: [
                        {
                            targets: -1,
                            visible: false
                        },
//                         { "visible": false, "targets": 1 },
                        {className: "dt-left", "targets": [2, 3, 4, 5, 6, 7, 8]}
                    ]

                });
                $('#books tbody').on('click', 'tr td.details-control', function () {

                    var cver = "";
                    var tr = $(this).closest('tr');
                    var row = booksTable.row(tr);
                    var rowdata = (booksTable.row(tr).data());
                    $("#booksModal").modal("show");
                    $("#bookID").val($(this).closest('tr').children()[1].textContent); // ID
                    $("#referenceNumber").val($(this).closest('tr').children()[2].textContent); // ID
//  $("#Author").val($(this).closest('tr').children()[4].textContent); // uname

                    console.log("lib a1  " + $(this).closest('tr').children()[1].textContent);
                    console.log("lib b2 id " + $(this).closest('tr').children()[2].textContent);
                    console.log("lib c3 ref " + $(this).closest('tr').children()[2].textContent);
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
                    console.log("rowdata.cover  " + rowdata.cover);
                    var authors = rowdata.Author;
// var authors = "AuthorFirst7 AuthorLast7, AuthorFirst777 AuthorLast777, AuthorFirst7 AuthorLast7";
                    console.log("lib rowdata.Author  " + rowdata.Author);
                    $("#Author").val(authors);
                    $("#Translator").val(rowdata.Translator);
                    if (typeof (rowdata.cover) === "undefined") {
//            var cver = 'ILGAS/images/not-available.jpg';
//        } else {
//            var cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
//        }
                        cver = 'ILGAS/images/not-available.jpg';
                    } else {
                        cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
                    }
                    var bookCover;
                    $("#bookCover").val(cver);
                    document.getElementById("Cover1").src = cver;
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


                    if (typeof (rowdata.cover) === "undefined" || rowdata.cover === "") {

                        // no cover - show upload
//            var cver = '..images/not-available.jpg';
                        cver = '..images/not-available.jpg';
                        $("#showUploadCover1").show();
                        $("#showUploadCover2").hide();
                        document.getElementById("cover21").src = cver;
                        hasCover = false;
                    } else {
                        // we have a cover - show cover
                        $("#showUploadCover2").show();
                        $("#showUploadCover1").hide();
//             var cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
                        cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
                        console.log("rowdata.cover cver " + cver);
                        hasCover = true;
                        $("#cover").val(cver);
                        console.log("81 xyz show bookCover cover " + bookCover);
                        console.log("81 xyz show Book cover for \n" + rowdata.translationTitle);
                        document.getElementById("cover21").src = cver;
                        document.getElementById("Cover1").src = cver;
                        document.getElementById("showUploadCoverTitle").innerHTML = "Book cover for \n" + rowdata.translationTitle;
                        console.log("cver  " + cver);
                        bookTranslationTitle = rowdata.translationTitle;
                        console.log("81 xyz show Book bookTranslationTitle for \n" + bookTranslationTitle);
                    }
                    console.log("hasCover2  " + hasCover);
                    console.log(booksTable.row(this).data());
                });
            });

//Submit
            $(document).ready(function () {
                $("#btnSubmit").click(function (event) {

                    event.preventDefault();
// $('#booksModal').modal('toggle');
                    var bookID = document.getElementById('bookID').value;
                    var referenceNumber = document.getElementById('referenceNumber').value;
                    var Author = document.getElementById('Author').value;
                    var Translator = document.getElementById('Translator').value;
                    var OrgTitle = document.getElementById('OrgTitle').value;
                    var TransTitle = document.getElementById('TransTitle').value;
                    var Publisher = document.getElementById('Publisher').value;
                    var translationPublisher = document.getElementById('translationPublisher').value;
                    var Genre = document.getElementById('Genre').value;
                    var Language = document.getElementById('Language').value;
                    var ISBN = document.getElementById('ISBN').value;
                    var ISSN = document.getElementById('ISSN').value;
                    var bookCover = document.getElementById('Cover1').value;
                    var bookCover2 = document.getElementById('cover21').value;
//                    var form = $("saveBooksForm")[0]; // You need to use standard javascript object here

                    console.log("bookCover  " + bookCover);
                    console.log("hasCover2  " + hasCover);
                    var formData = new FormData(); // Currently empty

                    formData.append("bookID", bookID);
                    formData.append("referenceNumber", referenceNumber);
                    formData.append("Publisher", Publisher);
                    formData.append("Author", Author);
                    formData.append("Translator", Translator);
                    formData.append("OrgTitle", OrgTitle);
                    formData.append("TransTitle", TransTitle);
                    formData.append("translationPublisher", translationPublisher);
                    formData.append("Genre", Genre);
                    formData.append("Language", Language);
                    formData.append("ISBN", ISBN);
                    formData.append("ISSN", ISSN);
                    console.log("rowdata.cover  " + rowdata.cover);
                    console.log("rowdata.cover cover21 " + document.getElementById("cover21").src);
                    if (!hasCover) {
                        formData.append("Cover", Cover1.files[0], bookCover);
                    }


                    $.ajax({
                        url: "./LibraryUpdate",
                        data: formData,
                        type: 'POST',
                        contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
                        processData: false, // NEEDED, DON'T OMIT THIS
                        // ... Other options like success and etc
                        success: function (data, status, xhr) {
                            console.log("Success ");
                            document.getElementById("showLibraryUpdateSuccess").innerHTML = "Library:  has been  <strong>successfully</strong> updated!";
//                            console.log("data " + data);
//                            console.log("status " + status);
//                            console.log("xhr " + xhr);
                            booksTable.ajax.reload();
//                            document.getElementById("showAddedGenre").innerHTML = "Genre: <strong>'" + genreToAdd + "'</strong> has been  <strong>successfully</strong> added!";
                            $("#libraryUpdateSuccessModal").modal('show');
                        },
                        error: function (xhr) {
                            alert("Error");
//                            $('#edtModal').show();
                            //error handling
                        }
                    });
                });
            });

            function getdetailsTableData(urlNew, callback) {
                console.log("getdetailsTableData url " + urlNew);
                $.ajax({
                    type: "get",
                    url: urlNew,
                    dataType: 'json',
//            async: false,
                    success: function (data) {
//            console.log("success: data");
//            console.log(data.aaData[0]);
                        detailsTableData = data.aaData[0];
                        callback(detailsTableData);
                    }

                });
            }

//function getdetailsTableData_success(detailsTableData) {
////    alert(Object.entries(detailsTableData));
//            console.log("getdetailsTableData_success: data");
//            console.log(detailsTableData);
////    return detailsTableData;
//}

//detailsTable
            $(document).ready(function () {
                console.log("555 load detailsTable  ");
                var rowdata1 = [];
                var rowdata = [];
//    var detailsTableData = [];
                detailsTable = $('#applications1').DataTable({
                    data: [],
                    "processing": true,
                    "language": {
                        "loadingRecords": "&nbsp; Loading Applications... ",
                        "processing": "Loading Applications..."
                    },
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
                        {"data": "Status",
                            "render": function (data, type, row) {
                                console.log("88888 Status " + data);
                            }},
                        {"data": "copiesSent",
                            "render": function (data) {
                                console.log("88888 copiesSent " + data);
                                if (data === 0) {
                                    return 'No';
                                } else {
                                    return 'Yes';
                                }

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

                            }},
                        {"data": "APPROVED",
                            "render": function (data, type, row) {
                                if (data === 0) {
                                    return 'No';
                                } else {

                                    return 'Yes';
                                }

                            }},
                        {"data": "genre"},
                        {"data": "TranslatorName",
                            "render": function (data) {
                                console.log("data:TranslatorName  " + data);
                                return data;
                            }},
                        {"data": "expertReaderName",
                            "render": function (data) {
                                console.log("expertReaderName  " + data);
                                return data;
                            }},
                        {"data": "bookTitle",
                            "render": function (data, type, full, meta) {
                                if (typeof (data) === "undefined") {
                                    return 'n/a';
                                } else {
                                    return data;
                                }
                            }
                        },
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
                        {"data": "translatorCVDocName",
                            "render": function (data, type, full, meta) {
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

                                    return '<img src="http://www.literatureirelandgrantapplication.com:8080/ILGAS/images/not-available.jpg" width="275" height="275" alt="not-available"/>';
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
                                    return "";
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
                                    return "";
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
                                    return "";
                                } else
                                {
                                    var date = new Date(data);
                                    var month = date.getMonth() + 1;
                                    return  date.getDate() + "/" + (month.length < 10 ? month : "0" + month) + "/" + date.getFullYear();
                                }
                            }},
                        {"data": "paymentReferenceNumber",
                            "render": function (data, type, row) {
                                console.log("8888 paymentReferenceNumber " + data);
                                if (typeof (data) === "undefined") {
                                    return "";
                                } else
                                    return data;
                            }},
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
                                    return "";
                                } else
                                    return data;
                            }},
                        {"data": "previousGrantAid"},
                        {"data": "award",
                            "render": function (data, type, row) {
                                console.log("8888 award " + data);
                                return (data === 1) ? '<span class="glyphicon glyphicon-ok"></span>' : '<span class="glyphicon glyphicon-remove"></span>';
                            }
                        },
                        {"data": "salesFigures"},
                        {"data": "original",
                            "render": function (data, type, row) {
                                return '<a href="http://www.literatureirelandgrantapplication.com:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                            }},
                        {"data": "originalName"},
                        {"data": "companyCountry",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    console.log("data: companyCountry " + data);
                                    return "Nope";
                                } else
                                {
                                    console.log("data: companyCountry " + data);
                                    return data;
                                }
                            }},
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
                        {"data": "rightsAgreement",
                            "render": function (data, type, row) {
                                if (typeof (data) === "undefined") {
                                    console.log("123v4 rightsAgreement data Nope " + data);
                                    return "Nope";
                                } else
                                {
                                    console.log("123v4 rightsAgreement data " + data);
                                    return data;
                                }
                            }},
                        {"data": "rightsHolderArray",
                            "render": function (data) {
                                if (typeof (data) === "undefined") {
                                    console.log("data: rightsHolderArray Nope " + data);
                                    return "Nope";
                                } else
                                {
                                    console.log("data: rightsHolderArray " + data);
                                    return data;
                                }
                            }},
                        {"data": "approveWithdrawnReject"},
                        {"data": "gender",
                            "render": function (data) {
                                console.log("data: gender  " + data);
                                return data;
                            }},
                        {"data": "idTranslator"}
                    ],
                    rowCallback: function (row, data) {
                        console.log("rowCallback: rowCallback: 1 ");
                        console.log(data);
                        rowdata1 = data;
                        console.log("rowCallback: rowdata1 ");
                        console.log(rowdata1);
                        return data;
                    },
//                    async: false,
                    filter: true,
                    info: true,
                    ordering: true,
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
                            console.log(data.aaData[0]);
//                            rowdata = data;
                            rowdata = data.aaData[0];
                        }
                    });

                    console.log("rowdata newUrl detailsTableData");
                    console.log(rowdata);

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

                    console.log("123v4 rightsAgreement data " + rowdata.rightsAgreement);
                    console.log("123v4 rightsHolderArray data " + rowdata.rightsHolderArray);

                    console.log("rightsHolderArray  ");
                    var rightsHolderArray = rowdata.rightsHolderArray;
                    console.log(rightsHolderArray);

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
                    console.log("rowdata rowdata.Author " + rowdata.Author);
                    if (rowdata.boardMeeting !== "undefined") {
                        $("#appDateOfBoardMeeting").val(formatDate(rowdata.boardMeeting));
                    }

                    console.log("rowdata.boardMeeting " + rowdata.boardMeeting);
                    $("#dateContractSenttoPublisher").val(formatDate(rowdata.contractSentToPublisher));
                    $("#dateILEAcknowledgementApproved").val(formatDate(rowdata.acknowledgementApproved));
                    $("#datePublishedBooksReceived").val(formatDate(rowdata.datePublishedBooksReceived));
                    $("#datePaymentMadeToPublisher").val(formatDate(rowdata.datePaymentMadeToPublisher));
                    var paymentStatusSelected = rowdata.paymentStatus;
                    console.log("13131 paymentStatusSelected " + paymentStatusSelected);
                    setSelectedIndex(document.getElementById('paymentStatus'), paymentStatusSelected);
                    $("#amountApproved").val(rowdata.amountApproved);
                    $("#datePublisherInformedOfMeeting").val(formatDate(rowdata.publisherInformedOfMeeting));

                    $("#directorChairDecision").val(rowdata.directorChairDecision);


                    var statii = rowdata.Status;
                    console.log("88888 Status statii 1 " + statii);
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
//                    $("#appcopiesSent").val(copiesSent);
//                    var date = new Date(rowdata.dateCopiesWereSent);
//                    var month = date.getMonth() + 1;
                    var dateCopiesWereSent = formatDate(rowdata.dateCopiesWereSent);
//                    $("#appdateCopiesWereSent").val(dateCopiesWereSent);
                    $("#appTC_ACCEPTED").val(rowdata.TC_ACCEPTED);
                    $("#appAPPROVED").val(rowdata.APPROVED);
                    $("#appNotesAboutApplication").val(rowdata.bookNotes);
                    console.log("bookNotes " + rowdata.bookNotes);
                    $("#appForeignPublisher").val(rowdata.company);
                    console.log("company " + rowdata.company);

                    $("#ForeignPublisher").val(rowdata.foreignPublisher);

                    console.log("ForeignPublisher " + rowdata.foreignPublisher);
                    $("#ForeignCountry").val(rowdata.foreignCountry);
                    console.log("rowdata.countryOfPublication " + rowdata.countryOfPublication);
                    $("#TargetLanguage").val(rowdata.targetLanguage);
                    console.log("rowdata.targetLanguage " + rowdata.targetLanguage);
//                    $("#appForeignPublisher").val(rowdata.foreignPublisher);
//                     console.log("rowdata.foreignPublisher " + rowdata.foreignPublisher);
                    $("#appForeignCountry").val(rowdata.companyCountry);
                    console.log("rowdata.companyCountry " + rowdata.companyCountry);
                    $("#appTargetLanguage").val(rowdata.targetLanguage);
                    console.log("rowdata.targetLanguage " + rowdata.targetLanguage);
                    $("#languageArray").val(rowdata.Author);
                    $("#feePerPage").val(rowdata.Author);
                    $("#appfeePerPage").val(rowdata.breakDownTranslatorFee);
                    $("#apptranslatorFee").val(rowdata.translatorFee);
                    $("#previousGrantAid").val(rowdata.previousGrantAid);
                    $("#amountRequested").val(rowdata.translatorFee);
//                    var date = new Date(rowdata.proposedDateOfPublication);
//                    var day = date.getDate();
//                    var month = date.getMonth() + 1;
//                    var year = date.getFullYear();
//                    var proposedDateOfPublication = day + "/" + month + "/" + year;
                    var proposedDateOfPublication = formatDate(rowdata.proposedDateOfPublication);
                    $("#appproposedDateOfPublication").val(proposedDateOfPublication);
                    $("#appplannedPageExtent").val(rowdata.plannedPageExtent);
                    console.log("plannedPageExtent " + rowdata.plannedPageExtent);
                    $("#appproposedPrintRun").val(rowdata.proposedPrintRun);
                    console.log("proposedPrintRun " + rowdata.proposedPrintRun);
                    $("#amountApproved").val(rowdata.amountApproved);

                    var commentsAboutMeeting = rowdata.boardComments_Instructions;
                    console.log("8888 commentsAboutMeeting === '' " + commentsAboutMeeting);
                    if (commentsAboutMeeting === 'null') {
                        commentsAboutMeeting = "";
                        console.log("8888 commentsAboutMeeting === '' " + commentsAboutMeeting);
                    }
                    $("#commentsAboutMeeting").val(commentsAboutMeeting);

                    var paymentReferenceNumber = rowdata.paymentReferenceNumber;

                    if (paymentReferenceNumber === 'null') {
                        paymentReferenceNumber = "";
                        console.log("8888 paymentReferenceNumber === '' " + paymentReferenceNumber);
                    }
                    $("#paymentReferenceNumber").val(paymentReferenceNumber);
                    console.log("8888 paymentReferenceNumber " + paymentReferenceNumber);

                    $("#ProofPaymentToTranslator").val(rowdata.proofOfPaymentToTranslator); // http://localhostundefined
                    $("#BankDetailsForm").val(rowdata.bankDetailsForm); // http://localhostundefined
                    $("#SignedLIContract").val(rowdata.SignedLIContract); // http://localhostundefined
                    $("#salesFigures").val(rowdata.salesFigures);
//                    $("#dateUpdate").val(rowdata.foreignPublisher);

//                    ##################################################################################################################

                    var agreemnt = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.agreement + '';
                    $("#appAgreement").val(agreemnt);
                    console.log("8 xyz 0 Loop Agreemnt ");
                    console.log(rowdata.agreement);
//                    document.getElementById("agreement").href = agreemnt;
                    var orig = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.original + '';
                    $("#appOriginal").val(orig);
                    document.getElementById("original").href = orig;
                    var addendumRightsAgreemnt = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.addendumRightsAgreement + '';
                    $("#appAddendumRightsAgreement").val(addendumRightsAgreemnt);

                    console.log("8 xyz 0 Loop addendumRightsAgreemnt ");
                    console.log(rowdata.addendumRightsAgreement);

                    console.log("8 xyz proofOfPaymentToTranslator " + rowdata.proofOfPaymentToTranslator);


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
                        var cver = 'http://www.literatureirelandgrantapplication.com:8080/ILGAS/images/not-available.jpg';
                    } else {
                        var cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
                    }

                    $("#cover").val(cver);
                    document.getElementById("cover").src = cver;

                    var transSamp = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.copiesTranslationSample + '';
                    console.log("444  copiesTranslationSample " + transSamp);
                    document.getElementById("copiesTranslationSample").href = transSamp;

                    $("#appApplicationNumber").val($(this).closest('tr').children()[1].textContent);
                    $("#appApplicationYear").val($(this).closest('tr').children()[2].textContent);
                    $("#appCompany").val($(this).closest('tr').children()[2].textContent); //ok


                    var appReferenceNumber = rowdata.ReferenceNumber;
                    console.log("appReferenceNumber " + appReferenceNumber);
                    $("#appReferenceNumber").val(appReferenceNumber); //ok
                    document.getElementById("assign_expert_reader_to_reference_number_Btn").innerHTML = "Assign expert reader to reference number  " + appReferenceNumber;

                    $("#unassignedERRefNo").val(appReferenceNumber);
                    $("#unassignedERRefNo1").val(appReferenceNumber);
                    var TranslName = rowdata.TranslatorName;
                    var translators = rowdata.TranslatorName;

                    console.log("8 xyz 0 Loop translators ");
                    console.log(translators);
                    console.log("8 xyz 0 Loop translators.length " + translators.length);
                    for (var s = 0; s < translators.length; s++) {
                        console.log("8 xyz 0 Loop translators s=" + s, translators[s][0]);
                    }
                    console.log("555 TranslatorDocs:  rowdata.transList   " + rowdata.transList);
                    var TranslatorDocs = [];
                    TranslatorDocs = rowdata.transList;
                    translatorArray = rowdata.transList;
                    $("#TranslatorName").val(TranslName);
                    // Generate table translatorTrackTable
                    var TranslTitles = rowdata.TranslatorTrack2;
                    console.log("444 TranslTitles:  TranslatorTrack2::   " + TranslTitles);
                    var TranslTitles = rowdata.TranslatorTrack2;
                    console.log("444 TranslTitles:  TranslatorTrack2::   " + TranslTitles);
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

                    header.appendChild(headingRow);
                    tble.appendChild(header);
                    var translatorNamesForGenerateTranslatorTab = [];
                    var translators = [];

                    for (var i = 0; i < TranslatorDocs.length; ++i) {
                        console.log("555 TranslatorDocs.length " + TranslatorDocs.length);
                        for (var j = 0; j < TranslatorDocs[i].length; ++j) {
                            console.log("555  translators[" + j + "][" + i + "] " + TranslatorDocs[i][j]);
//                translators = TranslatorDocs[i][j];   move that down
                            // skip undefined values to preserve sparse array
                            if (TranslatorDocs[i][j] === undefined)
                                continue;
                            // create row if it doesn't exist yet
                            if (translators[j] === undefined)
                                translators[j] = [];
                            // swap the x and y coords for the copy
                            translators[i][j] = TranslatorDocs[i][j];
                            console.log("555 0 translators[" + j + "][" + i + "] " + translators[j][i]);

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

                            console.log("555 1 translators[i][j] " + translators[i][j]);
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


                    //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
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

                            console.log("before TranslTitles[" + i + "][" + j + "] " + TranslTitles[i][j]);
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
                                continue;
                            }
                            // remove "undefined" cells
                            if (typeof (TranslTitles[i][j]) === "undefined") {
                                TranslTitles[i][j] = '';
                            }
                            console.log("555 last bit ");
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
                            console.log("8 xyz record " + record);
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

                    console.log("8 xyz 01 Loop translators ");
                    console.log(translators);
                    console.log("8 xyz 01 Loop translators.length " + translators.length);
                    for (var s = 0; s < translators.length; s++) {
                        console.log("8 xyz 01 Loop translators s=" + s, translators[0][s]);
                    }
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


                    var yup = rowdata.gender;
                    console.log("yup " + yup);
                    $('#genderSelect').val(rowdata.gender);



                    $('#pressCoverageTag').empty(); // empty the div before fetching and adding new data
                    // https://bootsnipp.com/snippets/P2gor
                    var pressCoverage = rowdata.pressCoverage;
                    console.log("before111 The proposed width is " + leastSquareRoot(pressCoverage.length));
                    var width = leastSquareRoot(pressCoverage.length);
                    pressCoverageTag = '';
                    pressCoverageTag += '<div class="container">';
                    pressCoverageTag += '<div class="row">';
                    pressCoverageTag += '<div class="row">';
                    var width = leastSquareRoot(pressCoverage.length);
                    for (var i = 0; i < pressCoverage.length; ++i) {

                        if (i % width === 0)
                        {
                            pressCoverageTag += '<div class="col-md-12" style="margin-bottom: 20px">';
                        }
                        var pressCoverageURL_cleaned = pressCoverage[i].substr(1).slice(0, -1);
                        console.log("before111 pressCoverageURL_cleaned  " + pressCoverageURL_cleaned);
                        var pressCoverageURL = pressCoverageURL_cleaned.split(",");
                        var jpgURL = pressCoverageURL[0];
                        var jpgURLName = pressCoverageURL[1];
                        var thumbURL = pressCoverageURL[2];
                        if (thumbURL.includes(".jpg")) {
                            var thumbURLName = pressCoverageURL[3];
                            console.log("before111 thumbURL  " + thumbURL);
                            console.log("before111 thumbURLName  " + thumbURLName);
                            pressCoverageTag += ' <div class="col-md-2 thumb">';
                            pressCoverageTag += '<a class="thumbnail" href="' + jpgURL + '"  target="_blank">';
                            pressCoverageTag += '<img class="img-thumbnail" src="' + thumbURL + '" alt = "' + jpgURLName + '-image" width="150" height="300"/>';
                            pressCoverageTag += '<div>"' + jpgURLName + '" </div>';
                            pressCoverageTag += '</a>';
                            pressCoverageTag += '</div>';

                        } else {

                            pressCoverageTag += ' <div class="col-md-2 thumb">';
                            pressCoverageTag += '<a class="thumbnail" href="#"  data-image-id="" data-toggle="modal" data-title="" data-image = "' + jpgURL + '" data-target="#image-gallery" > ';
                            pressCoverageTag += '<img class="img-thumbnail" src="' + jpgURL + '"  alt = "' + jpgURLName + '-image" >';
                            pressCoverageTag += '<div>"' + jpgURLName + '" </div>';
                            pressCoverageTag += '</a>';
                            pressCoverageTag += '</div>';

                            if (i % width === width - 1 || i === pressCoverage.length - 1)
                            {
                                pressCoverageTag += '</div>';
                            }
                        }
                    }

                    pressCoverageTag += '</div>'; //class="row"
                    pressCoverageTag += '</div>'; //class="row"
                    pressCoverageTag += '</div>'; // class="container"

                    $(pressCoverageTag).appendTo('#pressCoverageTag');

                    // load gallery
                    gallery();


                    function leastSquareRoot(n)
                    {
                        var sr = Math.sqrt(n);
                        return Math.floor(sr);
                    }

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

                    //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
                    $('#additionalExpertReader').empty(); // empty the div before fetching and adding new data

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

                            //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
                            var addExpertReaderModal = document.getElementById("additionalExpertReaderModal");
                            addExpertReaderModal = '';

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
                            
                             addExpertReaderModal += '<div class="container-fluid"> ';
                             
                            addExpertReaderModal += '<div class="row" style="margin-bottom: 20px;margin-top: 5px"> ';
                            addExpertReaderModal += '<div class="col-sm-2">';
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


                            addExpertReaderModal += '<div class="row" style="margin-bottom: 20px;">';
                            addExpertReaderModal += '<div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">';
                            addExpertReaderModal += '<div class="col-sm-2">';
                            addExpertReaderModal += '<input id="ReadersInvoice' + i + '"';
                            addExpertReaderModal += 'type="hidden"';
                            addExpertReaderModal += 'name="ReadersInvoice"';
                            addExpertReaderModal += ' >';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '<a class="btn btn-info" role="button" id="appReadersInvoice' + i + '">';
                            addExpertReaderModal += '<span class="glyphicon glyphicon-file"></span>';
                            addExpertReaderModal += 'Reader’s Invoice</a>';
                            addExpertReaderModal += '</div>';

                            addExpertReaderModal += '<div class="col-sm-10">';
                            addExpertReaderModal += '<label for="readerReportSummary' + i + '" class="control-label pull-left"> Reader’s Report Summary</label>';
                            addExpertReaderModal += '<textarea id="readerReportSummary' + i + '" ';
                            addExpertReaderModal += 'class="form-control"';
                            addExpertReaderModal += 'name="readerReportSummary' + i + '" ';
                            addExpertReaderModal += 'style="height: 300px;"';
                            addExpertReaderModal += '>';
                            addExpertReaderModal += '</textarea>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '</div>';
                            addExpertReaderModal += '<div class="modal-footer"  style="margin-bottom: 40px; background-color: #c3bcbc">';
                            addExpertReaderModal += '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
                            addExpertReaderModal += '</div>';
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

                                var readerInvoiceLink = 'http://www.literatureirelandgrantapplication.com:8080' + expertReaderName[i][7] + '';
                                console.log("676767 expertReaderName[i][7]  " + expertReaderName[i][7]);
                                var readersInvoiceElementID = "appReadersInvoice" + i;
                                console.log("676767 readersInvoiceElementID  " + readersInvoiceElementID);
                                console.log("676767 readerInvoiceLink  " + readerInvoiceLink);
                                document.getElementById(readersInvoiceElementID).href = readerInvoiceLink;
                                

                                if (expertReaderName[i][2] === "") {
                                    console.log("676767 expertReaderName[i][2] === ''  ");
                                    document.getElementById(readersReportElementID).style.display = "none";
                                }
                            }
                        }
                    }//(cntr === 1)


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


                    /*
                     *  empty the div before fetching and adding new data
                     */

                    $('#tn').empty();
                    $('#tnc').empty();
                    $('#agreementTranslationRightsHolder').empty();
                    $('#agreementTranslationRightsHolderName').empty();
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
                            agreementTranslationRightsHolderContent += '<div class="container wrapperContainer">';
                            agreementTranslationRightsHolderContent += '<div class="row" style="margin-bottom: 80px;">';
                            agreementTranslationRightsHolderContent += '<div style=" margin: 0 auto; position: relative;">';

                            agreementTranslationRightsHolderContent += '<div class="col-md-9"  id="agreementToggle' + j + '" style="margin-bottom: 40px; position:absolute; z-index:0;">';
                            agreementTranslationRightsHolderContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadAgreement' + j + '"></strong></div> ';
                            agreementTranslationRightsHolderContent += '<br/>';
                            agreementTranslationRightsHolderContent += '<div class="margin-bottom: 40px"></div>';
                            agreementTranslationRightsHolderContent += '<div class="col-sm-12">';
                            agreementTranslationRightsHolderContent += '<label id="uploadAgreement" class="control-label pull-left"></label>';
                            agreementTranslationRightsHolderContent += '<label  class="control-label pull-left">No Agreement has been uploaded!</label>';
                            agreementTranslationRightsHolderContent += '</div>';//class="col-sm-12"


                            agreementTranslationRightsHolderContent += '</div>'; //<div class="input-group agreement" 
                            agreementTranslationRightsHolderContent += '</div>'; //<div class="col-md-9" 

                            agreementTranslationRightsHolderContent += '<div class="col-md-6" id="agreement_button' + j + '" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> ';
                            agreementTranslationRightsHolderContent += '<label  class="control-label pull-left" id="agreement_button_label' + j + '" ></label>';
                            agreementTranslationRightsHolderContent += '<div class="input-group agreement_buttonText pull-left">';
                            agreementTranslationRightsHolderContent += '<a class="btn btn-info btn-file pull-left" role="button" id="agreement_link' + j + '" href=""  target="_blank">';
                            agreementTranslationRightsHolderContent += '<span class="glyphicon glyphicon-file"></span>';
                            agreementTranslationRightsHolderContent += 'Click to open</a>';
                            agreementTranslationRightsHolderContent += '</div>';

                            agreementTranslationRightsHolderContent += '</div>';
                            agreementTranslationRightsHolderContent += '</div>'; // -- col-md-7--


                            agreementTranslationRightsHolderContent += '</div>'; //-- position:relative;--
                            agreementTranslationRightsHolderContent += '</div>'; // row

                            agreementTranslationRightsHolderContent += '</div>';

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

                        rightsAgreementContractsNavContent += '</div>'; // class="container wrapperContainer"

                        /*
                         * Addendum to the rights agreement
                         */

                        if (j === 1) {
                            addendumAgreementTranslationRightsHolder += '<div class="container wrapperContainer">';
                            addendumAgreementTranslationRightsHolder += '<div class="row" style="margin-bottom: 80px;">';
                            addendumAgreementTranslationRightsHolder += '<div style=" margin: 0 auto; position: relative; ">';

                            addendumAgreementTranslationRightsHolder += '<div class="col-md-9"  id="addendumToggle' + j + '"  style="margin-bottom: 40px; position:absolute; z-index:0; ">';
                            addendumAgreementTranslationRightsHolder += '<div  style="margin-bottom: 10px;"><strong class="pull-left" id="uploadAddendum' + j + '" ></strong> </div>';
                            addendumAgreementTranslationRightsHolder += '<br/>';
                            addendumAgreementTranslationRightsHolder += '<div class="margin-bottom: 40px"></div>';
                            addendumAgreementTranslationRightsHolder += '<div class="col-sm-12">';
                            addendumAgreementTranslationRightsHolder += '<label id="uploadAddendum" class="control-label pull-left"></label>';
                            addendumAgreementTranslationRightsHolder += '<label  class="control-label pull-left">No addendum has been uploaded!</label>';
                            addendumAgreementTranslationRightsHolder += '</div>';//class="col-sm-12"

                            addendumAgreementTranslationRightsHolder += '</div>'; //<div class="input-group agreement" 
                            addendumAgreementTranslationRightsHolder += '</div>'; //<div class="col-md-9" 

                            addendumAgreementTranslationRightsHolder += '<div class="col-md-4" id="addendum_button' + j + '"  style="margin-bottom: 40px; position:absolute;z-index:1; display:none;">  ';
                            addendumAgreementTranslationRightsHolder += '<label  class="control-label pull-left" id="addendum_button_label' + j + '" ></label>';
                            addendumAgreementTranslationRightsHolder += '<div class="input-group addendum_buttonText pull-left" style="width: 190px; hight: 34px" >';
                            addendumAgreementTranslationRightsHolder += '<a class="btn btn-info btn-file pull-left" role="button" id="addendum_link' + j + '" href=""  target="_blank">';
                            addendumAgreementTranslationRightsHolder += '<span class="glyphicon glyphicon-file"></span>';
                            addendumAgreementTranslationRightsHolder += 'Click to open</a>';
                            addendumAgreementTranslationRightsHolder += '</div>';
                            addendumAgreementTranslationRightsHolder += '</div>'; // -- col-md-3--

                            addendumAgreementTranslationRightsHolder += '</div>'; //-- position:relative;--
                            addendumAgreementTranslationRightsHolder += '</div>'; // row
                            addendumAgreementTranslationRightsHolder += '</div>';
                            $(addendumAgreementTranslationRightsHolder).appendTo('#addendumAgreementTranslationRightsHolder');

                        }

                        rightsAgreementContractsNavContent += '</div>'; //  --container--
                        rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"
                    }

                    $(rightsAgreementContractsNavContent).appendTo('#tnc');

                    console.log("rightsHolderArray.length " + rightsHolderArray.length); //2


//                    for (var d = 0; d < rightsHolderArray.length; d++)
//                    {
//                        console.log("rightsHolderArray.length for loop " + rightsHolderArray.length);
//                        //  agreementTranslationRightsHolderName += '<div class="container wrapperContainer pull-left">';
//                        agreementTranslationRightsHolderName += '<div class="row">';
//                        agreementTranslationRightsHolderName += '<div class="col-md-12">';
//                        agreementTranslationRightsHolderName += '<label  id="agreementTranslationRightsHolderName' + d + '"  class="control-label pull-left"></label>';
//                        agreementTranslationRightsHolderName += '</div>';
//                        agreementTranslationRightsHolderName += '</div>';
//
//                        $(agreementTranslationRightsHolderName).appendTo('#agreementTranslationRightsHolderName');
//
//                        console.log("agreementTranslationRightsHolderName  " + d + " created ");
//                    }

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

                        console.log("rightsHolderArray " + rightsHolderArray[i]);

                        var additionalRightsHoldersTag = '';

                        additionalRightsHoldersTag += '<div class="row">';
                        additionalRightsHoldersTag += '<div class="form-group pull-left has-feedback">';
                        additionalRightsHoldersTag += '<div class="input-group pull-left">';
                        additionalRightsHoldersTag += ' <input id="rightsHoldersName' + i + '"';
                        additionalRightsHoldersTag += ' type="text"  ';
                        additionalRightsHoldersTag += ' class="form-control addRightsHolder"';
                        additionalRightsHoldersTag += ' name="rightsHoldersName' + i + '"';
                        additionalRightsHoldersTag += ' readonly';
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
//        additionalRightsHoldersTag += '<label  id="agreementTranslationRightsHolderName' + i + '"  class="control-label pull-left">' + rightsHolderArray[i] + '</label>';
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

                            document.getElementById("cv_button_label" + w).innerHTML = 'Open copy of the CV';// + translatorNamesForGenerateTranslatorTab[j];
                            document.getElementById('cv_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + linkArray[2].trim() + " ";

                            console.log("8 xyz linkArray[3]  " + linkArray[3]);

                            document.getElementById("contract_button_label" + w).innerHTML = 'Open copy of the contract';// + translatorNamesForGenerateTranslatorTab[j];
                            document.getElementById('contract_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + linkArray[3].trim() + " ";

                        }

                        w++;  // next translator

                    }

                    /*
                     * 3: Fill the tabs - Rights Agreement
                     */

                    for (var j = 0; j < rowdata.rightsAgreement.length; j++) {

                        var rightsAgreementArray = rowdata.rightsAgreement[j].split(",");

                        console.log("8 xyz  rightsAgreementArray  :");
                        console.log(rightsAgreementArray);
                        console.log("8 xyz  rightsHolderArray  :");
                        console.log(rightsHolderArray);

                        for (var v = 0; v < rightsAgreementArray.length; v++) {

                            console.log("8 xyz  rightsAgreementArray  :" + rightsAgreementArray[v].substr(1) + " w: " + w);
                            console.log("8 xyz ON i " + i);
                            console.log("8 xyz ON j " + j);
                            console.log("8 xyz ON v " + v);
                            console.log("8 xyz ON w " + w);
                            console.log("8 xyz  rightsAgreementArray before switch :", rightsAgreementArray[v].substr(1) + ":"); // /documents/2020/Caldean Books/47/Agreement/SunshineTrans Ltd/agreement with the translation rights holder.docx
                            console.log("8 xyz  rightsAgreementArray 1 before switch  :", rightsAgreementArray[v].substr(1) + ":");// /documents/2020/Caldean Books/47/Agreement/SunshineTrans Ltd/agreement with the translation rights holder.docx
                            console.log("8 xyz  rightsAgreementArray 1 before switch  :", rightsHolderArray[0] + ":");//SunshineTrans Ltd
                            console.log("8 xyz  rightsAgreementArray before switch j :", rightsHolderArray[j] + ":");//SunshineTrans Ltd
                            console.log("8 xyz  rightsAgreementArray 1 before switch  :", rightsHolderArray[0][1] + ":");// u

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

                                        document.getElementById('agreement_link1').href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
                                    }
                                    break;
//                        }
                                case 1:
//                        if (w === 1) {
                                    console.log("8 xyz  rightsAgreementArray w :", w + ":");
                                    // AgreementDocName
                                    console.log("8 xyz case 1 [" + j + "]");
                                    if (rightsAgreementArray[v].substr(1) === 'null') {
                                        console.log("8 xyz translatorNamesForGenerateTranslatorTab[j] ", translatorNamesForGenerateTranslatorTab[j]);
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

                                        document.getElementById("agreement_button_label1").innerHTML = 'Open a copy agreement with with the translation rights holder(s) <br/>'; //+ translatorNamesForGenerateTranslatorTab[j];

                                    }
                                    break;
//                        }
//                    case 2:
                                    // Contract

//                        if (rightsAgreementArray[v].substr(1) !== 'null') {
//
//                            document.getElementById('contract_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
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
//                                        document.getElementById('agreement_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
                                        document.getElementById('addendum_link1').href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
//                            document.getElementById('addendum_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
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
//                document.getElementById('cv_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + linkArray[2].trim() + " ";

                        }
                        console.log("8 xyz ON i " + i);
                        console.log("8 xyz ON j " + j);
                        console.log("8 xyz ON w " + w);
                        w++;  // next translator

                    }

                });
            });

            /*
             * formatDate
             */
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

            /*
             * applicationsTable
             */
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
                        "loadingRecords": "&nbsp; Loading Applications... ",
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
                                if (typeof data === "undefined") {
//                                    console.log("bookTitle  " + data);
                                    return  "n/a";
                                } else {
                                    return data;
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

            $(function () {
                $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                    var tab = $(e.target.attributes.href.value);
                    $(tab).load(tab.data('url'));
                });
                $('.nav-tabs a:first').each(function () {
                    $(this.attributes.href.value).load($(this.attributes.href.value).data('url'));
                });
            });

            function setSelectedIndex(s, v) {
                for (var i = 0; i < s.options.length; i++) {
                    if (s.options[i].text === v) {
                        s.options[i].selected = true;
                        console.log("13131 paymentStatusSelected " + s.options[i].text);
                        return;
                    }
                }
            }

            function pressCuttingsModal() {
                $("#pressCuttingsModal").modal("show");
            }

            $(document).ready(function () {
                $("button").click(function () {
                    $("button").removeClass("active");
                    $(this).addClass("active");
//                    $("button").removeClass("bold");
//                    $(this).addClass("bold");
                });
            });

            function directorChairDecision_click(cb) {
                console.log("directorChairDecision_click  set " + cb.checked);
                if (cb.checked) {
                    console.log("directorChairDecision  setting ('value', 'ticked')");
                    document.getElementById("directorChairDecision").value = "ticked";
                } else {
                    console.log("directorChairDecision  setting ('value', '')");
                    document.getElementById("directorChairDecision").value = "";
                }
                document.getElementById("directorChairDecision").value;
                console.log("directorChairDecision  value " + document.getElementById("directorChairDecision").value);
            }

//ApproveWithdrawnReject
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

            $(document).ready(function () {
                /**
                 * Vertically center Bootstrap 3 modals so they aren't always stuck at the top
                 * https://www.abeautifulsite.net/vertically-centering-bootstrap-modals
                 */
                $(function () {
                    function reposition() {
                        var modal = $(this),
                                dialog = modal.find('.modal-dialog1');
                        modal.css('display', 'block');
                        // Dividing by two centers the modal exactly, but dividing by three 
                        // or four works better for larger screens.
                        dialog.css("margin-top", Math.max(0, ($(window).height() - dialog.height()) / 2));
                    }
// Reposition when a modal is shown
                    $('.modal').on('show.bs.modal', reposition);
// Reposition when the window is resized
                    $(window).on('resize', function () {
                        $('.modal:visible').each(reposition);
                    });
                });
            });

            function selectER() {
                var selectBox = document.getElementById("selectUnassignedER");
                var selectedValue = selectBox.options[selectBox.selectedIndex].value;
                document.getElementById("selectUnassignedER").value = selectedValue;
                document.getElementById("selectedUnassignedER").value = selectedValue;
            }


            function  showInfoModal() {
                $("#showInfoModal").modal("show");
            }
            function  showNotesModal() {
                $("#showNotesModal").modal("show");
            }
            function  contactUsModal() {
                $("#contactUsModal").modal("show");
            }
            function  showLegalNoteModal() {
                $("#showLegalNoteModal").modal("show");
            }

//function replaceEditor() {
//    console.log("replaceEditor()");
//    CKEDITOR.replace('editor1', {
//        extraPlugins: 'allowsave',
//        width: 400,
//        height: 500
//    });
//
//}

//function getTemplate(template) {
//    console.log("getTemplate" + template);
//    console.log("getTemplate  url  templateHandler?action=openFile&filename=" + template);
//    $.ajax({
//        url: "TemplateHandler?action=openFile&filename=" + template,
//        type: 'GET',
//        dataType: 'text'
//    }).then(function (data) {
//        console.log(data);
//        CKEDITOR.instances.editor1.setData(data);
//    });
//}

//$(document).ready(function () {
//function getTemplate(template) {
//    console.log("getTemplate" + template);
//    console.log("getTemplate  url  templateHandler?action=openFile&filename=" + template);
//      alert("getTemplate clicked ");
//    $.ajax({
//        url: "TemplateHandler?action=openFile&filename=" + template,
//        type: 'GET',
////        dataType: 'text'
//        dataType: "json"
//    }).then(function (data) {
//        var length = data.length - 2;
//        var datacut = data.slice(9, length);
//        CKEDITOR.instances.editor1.setData(data);
//
//    });
//}
//});

//function selectTemplate() {
//    console.log("selectTemplate");
//    $('#selectTemplate').cleanData;
//    selectTemplate1();
//}

//$(document).ready(function () {
//function selectTemplate() {
//    console.log("selectTemplate1");
//    $('#selectTemplate').fileTree({root: '/home/markus/uploads/', script: 'connectors/jqueryFileTree.jsp'}, function (file) {
//        $('#fileName').val(file);
//        $('#emailTemplateSelected').val(file);
//        console.log("selectTemplate1:  " + file);
//    });
//}
//});




            $(document).ready(function () {
                console.log("call StaffUserDataServlet");
                $.ajax({
                    type: "GET",
                    url: "StaffUserDataServlet",
                    dataType: "json",
                    success: function (data) {
                        var rs = data.aaData;
                        console.log(rs);
                        $.each(rs, function (i, obj)
                        {
                            var optionValue = '<%= "' + rs[i].Full_NAME + '" %>';
                            var div_data = '<option value="' + rs[i].EMAIL + '">' + rs[i].Full_NAME + '</option>';
                            $(div_data).appendTo('#from');
                        });
                    }
                });
            });


            $(document).ready(function () {
                $('#showInstructionsModalBtn').click(function () {

                    $('#showInstructionsModal .modal-content').resizable();

                    $("#showInstructionsModal").draggable({
                        handle: ".modal-header"
                    });
                });

            });

            $(document).ready(function () {
                var validator = $("#applicationEditForm").validate();
                validator.form();
            });


            $(document).ready(function () {
                $('body').on('click', '.applicationEditForm-submit', function (e) {
                    $(this.form).submit();
                    $('#applicationEditForm').modal('hide');
                });
            });


            function replaceEditor() {
                CKEDITOR.plugins.addExternal('allowsave', '/ILGAS/assets/js/ckeditor/plugins/allowsave/', 'plugin.js');
                CKEDITOR.plugins.addExternal('simplebox', '/ILGAS/assets/js/ckeditor/plugins/simplebox/', 'plugin.js');

                console.log("welcome_Staff_1.js replaceEditor");
                var editor = CKEDITOR.replace('editor1', {
                    customConfig: '/ILGAS/assets/js/ckeditor/config.js',
                    contentsCss: [
                        'http://cdn.ckeditor.com/4.12.1/full-all/contents.css',
                        '/ILGAS/assets/js/ckeditor/contents.css'
                    ],
//        width: 800,
                    height: 500,
                    on: {
                        pluginsLoaded: function () {
                            var editor = this,
                                    config = editor.config;

                            editor.ui.addRichCombo('my-combo', {
                                label: 'Salutation',
                                title: 'Salutation',
                                toolbar: 'basicstyles,0',

                                panel: {
                                    css: [CKEDITOR.skin.getPath('editor')].concat(config.contentsCss),
                                    multiSelect: false,
                                    attributes: {'aria-label': 'Salutation'}
                                },

                                init: function () {
                                    this.startGroup('Salutations');
                                    this.add('First_Name', 'First name');
                                    this.add('Last_Name', 'Last name');
                                    this.add('Full_Name', 'Full name');
                                },

                                onClick: function (value) {
                                    editor.focus();
                                    editor.fire('saveSnapshot');

                                    editor.insertHtml(value);

                                    editor.fire('saveSnapshot');
                                }
                            });
                        }
                    }
                });
            }
//});

            function getTemplate(template) {
                console.log("welcome_Staff_1.js getTemplate " + template);
                $.ajax({
                    url: "templateHandler?action=openFile&filename=" + template,
                    type: 'GET',
                    dataType: 'text'
                }).then(function (data) {
                    var length = data.length - 2;
                    var datacut = data.slice(9, length);
                    CKEDITOR.instances.editor1.setData(data);

                });
            }

            function selectTemplate() {
                console.log("welcome_Staff_1.js selectTemplate");
                $('#selectTemplate').fileTree({root: '/home/markus/uploads/', script: 'connectors/jqueryFileTree.jsp'}, function (file) {
                    $('#fileName').val(file);
                    $('#emailTemplateSelected').val(file);
                    getTemplate(file);
                });
            }


//    $(function () {
            $(".jqueryFileTree li").click(function (e) {
                var str = $(this);
                console.log("jqueryFileTree li e " + e);
                console.log("jqueryFileTree li str " + str);
                console.log(str);
                alert("selectTemplate clicked ");
            });

            $(document).ready(function () {
                $('#genderSelect').on('change', function () {
                    var selected = $(this).find("option:selected").val();
                    console.log("genderSelect selected " + selected);
                    $('input[name="gender"]').val(selected);
                    var referenceNumber = $('#appReferenceNumber').val();
                    console.log("genderSelect referenceNumber " + referenceNumber);

                    $.ajax({
                        url: "./UpdateGender",
                        type: "post",
                        data: {
                            gender: selected,
                            ReferenceNumber: referenceNumber
                        },
                        success: function (data)
                        {
                            alert("SUCCESS: Gender has been updated!");
                            console.log('SUCCESS: ' + data.success);

                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            // Handle errors here
                            console.log('ERRORS: ' + textStatus);
                        }
                    });
                });
            }
            );

            $(document).ready(function () {
                $('#changeStatus').on('change', function () {
                    var selected = $(this).find("option:selected").val();
                    console.log("changeStatus selected " + selected);
                    $('input[name="appStatus"]').val(selected);
                    var statii0 = selected;
                    console.log("88888 Status statii 2 " + statii0);
                    if (statii0 === 'new') {

                        document.getElementById("appStatus").style.backgroundColor = '#aefca1';
                        document.getElementById("appStatus").value = 'new';
                    } else if (statii0 === 'open') {

                        document.getElementById("appStatus").style.backgroundColor = '#EFFCA1';
                        document.getElementById("appStatus").value = 'open';
                    } else if (statii0 === 'pending') {

                        document.getElementById("appStatus").style.backgroundColor = '#FCEFA1';
                        document.getElementById("appStatus").value = 'pending';
                    } else {
                        document.getElementById("appStatus").style.backgroundColor = '#efa1fc';
                        document.getElementById("appStatus").value = 'closed';
                    }


                    var referenceNumber = $('#appReferenceNumber').val();
                    console.log("changeStatus referenceNumber " + referenceNumber);
                    $.ajax({
                        url: "./UpdateStatusServlet",
                        type: "post",
                        data: {
                            newStatus: selected,
                            ReferenceNumber: referenceNumber
                        },
                        success: function (data) {
                            // There is no need for this...
                            // window.location.reload();
                            console.log("changeStatus success: ", data);
                        }
                    });
                });
            }
            );

            $(window).bind("beforeunload", function () {
                var username = document.getElementById("username").value;

                $.ajax({
                    async: false, //This will make sure the browser waits until request completes
                    url: "./Logout",
                    type: 'post',
                    cache: false,
                    data: {"username": username}
                });
            });

        </script>
        <style>
            .btn-link {
                border: none;
                outline: none;
                background: none;
                cursor: pointer;
                color: #0000EE;
                padding: 0;
                text-decoration: underline;
                font-family: inherit;
                font-size: inherit;
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
            .not-allowed {cursor: not-allowed;}
        </style>

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
                        <form action="${pageContext.request.contextPath}/Logout" method="POST">
                            <h6> <small>Welcome <strong>${name}</strong> - <strong>not ${name}</strong>? 
                                    <button type="submit" name="username" value="${username}" class="btn-link">Click here to log out </button></small></h6>
                            <input type="hidden" id="username" name="username" value="${username}">
                        </form>
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
                        <div class="collapse navbar-collapse" id="myTab" style="background-color: #d9d1d1">
                            <ul class="nav navbar-nav nav-tabs two-lines" role="tablist">
                                <li role="tab" class="active"><a href="#Application" data-toggle="tab">Application Management</a></li>
                                <li role="tab" ><a href="#User" data-toggle="tab">User Management</a></li>
                                <!--<li role="tab" ><a href="#Contracts" data-toggle="tab">Contracts</a></li>-->
                                <li role="tab" ><a href="#ExpertReader" data-toggle="tab">Expert Reader</a></li>
                                <li role="tab" ><a href="#Library" data-toggle="tab">Library</a></li>
                                <li role="tab" ><a href="#Genres" data-toggle="tab">Genres</a></li>
                                <li role="tab" ><a href="#Maintenance" data-toggle="tab">Maintenance</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->


                        <!-- Tab panes -->
                        <div class="tab-content" >

                            <input type="hidden" name="ReferenceNumber" id="sSearch" class="sSearch">
                            <input type="hidden" name="Status" id="Status" class="Status">
                            <input type="hidden" name="userID" value="${userID}">
                            <input type="hidden" name="username" value="${username}">
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
                                                <th class="never"></th>
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
                                                <th class="never"></th>
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
                                                    <th class="all">Book Title</th>                                    
                                                    <th class="all">Status</th>
                                                    <th class="all">Author(s)</th>                                 
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th class="details-control"></th>   
                                                    <th class="all">Reference<br/>  No</th>
                                                    <th class="all">Publisher</th>       
                                                    <th class="all">Book Title</th>
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



                            <!--applicationsModal-->
                            <div class="modal" id="applicationsModal" data-modal-index="1"   tabindex="-1">

                                <div class="modal-dialog">

                                    <div class="modal-content">
                                        <!--applicationForm-->
                                        <form  method="POST" 
                                               id="applicationEditForm" 
                                               name="applicationForm" 
                                               action="${pageContext.request.contextPath}/StaffServlet" 
                                               >
                                            <div class="modal-header" style="background-color: #c3bcbc">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                <h4 class="modal-title">Applications</h4>
                                            </div>

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
                                                        </div>
                                                        <!-- Collect the nav links, forms, and other content for toggling -->
                                                        <div class="collapse navbar-collapse" id="applicationsModalTab" style="font-size: 0.8em !important;  background-color: #d9d1d1">


                                                            <ul class="nav navbar-nav nav-tabs" id="tabContent">
                                                                <li class="active"><a href="#originalContracts" data-toggle="tab">Original <br/>and Contracts</a></li>
                                                                <li><a href="#publisherTranslation" data-toggle="tab">Publisher <br/>and Translation</a></li>
                                                                <li><a href="#readerReport" data-toggle="tab">Reader’s  <br/>Report</a></li>
                                                                <li><a href="#boardMeeting" data-toggle="tab">Board  <br/>Meeting</a></li>
                                                                <li><a href="#contract" data-toggle="tab">Contract <br/> &nbsp;</a></li>
                                                            </ul>
                                                        </div><!-- /.navbar-collapse -->


                                                        <%request.getSession().setAttribute( "task", "StaffServlet" );%>

                                                        <!-- Tab-content -->
                                                        <div class="applicationForm tab-content">

                                                            <!--Original and Contracts-->
                                                            <!--                                                            <div class="tab-pane active" id="originalContracts">     -->
                                                            <!-- Book Details -->
                                                            <div class="tab-pane active" id="originalContracts">
                                                                <p class="header1">
                                                                    Original and Contracts
                                                                </p>
                                                                <div class="container-fluid">

                                                                    <div class="row"  style="display: block;
                                                                         margin-right: auto;
                                                                         margin-left: auto;">

                                                                        <div class="row" style="margin-bottom: 20px;margin-top: 5px">

                                                                            <div class="col-md-4">
                                                                                <label for="appReferenceNumber" class="control-label pull-left">Reference Number</label>
                                                                                <input  id="appReferenceNumber" 
                                                                                        type="text"                                                  
                                                                                        class="form-control"    
                                                                                        name="appReferenceNumber"   
                                                                                        readonly
                                                                                        >
                                                                            </div>

                                                                            <div class="col-md-2 col-md-offset-2">
                                                                                <label for="appStatus" class="control-label pull-left">Status</label>
                                                                                <input id="appStatus"                                
                                                                                       type="text"                                
                                                                                       class="form-control"                                
                                                                                       name="appStatus"         
                                                                                       readonly
                                                                                       >
                                                                            </div>

                                                                            <div class="col-md-2">

                                                                                <div class="form-group">                                              
                                                                                    <label for="changeStatus" class="control-label pull-left">Change Status</label>
                                                                                    <!--<div class="col-sm-6 col-md-4">-->
                                                                                    <select id="changeStatus" required="required" class="form-control select-css">
                                                                                        <option value="" selected="selected">Change status to</option>

                                                                                        <option value="open">Open</option>
                                                                                        <option value="pending">Pending</option>
                                                                                        <option value="closed">Closed</option>
                                                                                    </select>
                                                                                </div>

                                                                            </div> <!--row-->

                                                                            <div class="row" style="margin-bottom: 20px;margin-top: 5px">

                                                                                <div class="col-md-8">
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

                                                                                <div class="col-md-8">
                                                                                    <label for="authorList" class="control-label pull-left">Author(s)</label>
                                                                                    <input  id="authorList" 
                                                                                            type="text"                                                  
                                                                                            class="form-control"    
                                                                                            name="authorList"    
                                                                                            readonly
                                                                                            >
                                                                                </div>

                                                                                <div class="col-md-2">
                                                                                    <div class="form-group">                                              
                                                                                        <label for="genderSelect" class="control-label pull-left">Gender</label>
                                                                                        <!--<div class="col-sm-6 col-md-4">-->
                                                                                        <select id="genderSelect" required="required" class="form-control select-css">
                                                                                            <option value="" selected="selected">Select gender</option>

                                                                                            <option value="Male">Male</option>
                                                                                            <option value="Female">Female</option>
                                                                                            <option value="Other">Other</option>
                                                                                        </select>
                                                                                    </div>
                                                                                    <input id="gender"                                
                                                                                           type="hidden"                                                            
                                                                                           name="gender"                                
                                                                                           >
                                                                                </div>

                                                                            </div> <!--row-->

                                                                            <!--second row-->
                                                                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                                <div class="col-md-8">        
                                                                                    <label for="appCompany" class="control-label pull-left">Publisher</label>
                                                                                    <input id="appCompany"                                
                                                                                           type="text"                                
                                                                                           class="form-control"                                
                                                                                           name="appCompany"    
                                                                                           readonly
                                                                                           >
                                                                                </div>

                                                                            </div> <!--row-->

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
                                                                                            <div class="tab-content pull-left" id="tnc"></div>  

                                                                                        </div>  <!-- <div class="container-fluid"  -->

                                                                                    </nav>  <!-- <nav class="navbar -->

                                                                                </div>  <!-- row  -->

                                                                            </div> <!-- container-fluid  -->


                                                                            <div class="row">

                                                                                <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px">
                                                                                    <div class="col-md-2">
                                                                                        <input id="appOriginal"
                                                                                               type="hidden"                                                             
                                                                                               name="appOriginal"                                
                                                                                               >
                                                                                    </div>
                                                                                    <a class="btn btn-info" role="button" id="original" target="_blank">
                                                                                        <span class="glyphicon glyphicon-file"></span>
                                                                                        Original Work</a>
                                                                                </div>

                                                                                <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">  
                                                                                    <div class="col-md-2">
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



                                                                            <div class = "panel panel-default tab-content pull-left">

                                                                                <div class="panel-heading panel-heading-translationRightsHolder pull-left"> 
                                                                                    <h1><strong>Translation rights holder:</strong></h1>
                                                                                </div>

                                                                                <div class = "panel-body">
                                                                                    <div class="container-fluid">
                                                                                        <div class="row" style="margin-top: 30px;margin-bottom: 30px">

                                                                                            <div class="col-md-12">
                                                                                                <div class="tab-content pull-left" id="agreementTranslationRightsHolderName"></div>
                                                                                            </div>

                                                                                        </div> <!--row-->

                                                                                        <div class="row" style="margin-top: 30px;margin-bottom: 30px">

                                                                                            <div class="col-md-12">
                                                                                                <div class="tab-content" id="agreementTranslationRightsHolder"></div>
                                                                                            </div>

                                                                                        </div> <!--row-->

                                                                                        <div class="row" style="margin-bottom: 20px">

                                                                                            <div class="col-md-12">
                                                                                                <div class="tab-content" id="addendumAgreementTranslationRightsHolder"></div>  
                                                                                            </div>

                                                                                        </div> <!--row-->
                                                                                    </div><!--container-fluid-->
                                                                                </div> <!--panel-heading-translationRightsHolder-->

                                                                            </div> <!--panel-default-->

                                                                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                                <div class="col-md-4">
                                                                                    <label for="appDateOfPublicationOriginal" class="control-label pull-left">Year of publication <br/>(of the original)</label>
                                                                                    <input id="appDateOfPublicationOriginal"                                
                                                                                           type="text"                                
                                                                                           class="form-control"                                
                                                                                           name="appDateOfPublicationOriginal"   
                                                                                           readonly
                                                                                           >
                                                                                </div>

                                                                                <div class="col-md-4">
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

                                                                                <div class="col-md-4">        
                                                                                    <label for="appCountryOfPublication" class="control-label pull-left">Country of publication <br/>(of the original)</label>
                                                                                    <input id="appCountryOfPublication"                                
                                                                                           type="text"                                
                                                                                           class="form-control"                                
                                                                                           name="appCountryOfPublication"      
                                                                                           readonly
                                                                                           >
                                                                                </div>

                                                                                <div class="col-md-4">
                                                                                    <label for="appLanguageOriginal" class="control-label pull-left">Language <br/>(of the original)</label>
                                                                                    <input  id="appLanguageOriginal" 
                                                                                            name="appLanguageOriginal" 
                                                                                            type="text"                                                                
                                                                                            class="form-control" 
                                                                                            readonly
                                                                                            >
                                                                                </div>

                                                                                <div class="col-md-2">        
                                                                                    <label for="appGenre" class="control-label pull-left">&nbsp;<br/> Genre</label>
                                                                                    <input id="appGenre"                                
                                                                                           type="text"                                
                                                                                           class="form-control"                                
                                                                                           name="appGenre"               
                                                                                           readonly
                                                                                           >
                                                                                </div>

                                                                            </div> <!--row-->

                                                                            <!--                                                                            <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                                            
                                                                                                                                                            <div class="col-md-4">
                                                                                                                                                                <label for="appcopiesSent" class="control-label pull-left">Has copy been sent?</label>
                                                                                                                                                                <input id="appcopiesSent"
                                                                                                                                                                       type="text"                                
                                                                                                                                                                       class="form-control"                                
                                                                                                                                                                       name="appcopiesSent"   
                                                                                                                                                                       readonly
                                                                                                                                                                       >
                                                                                                                                                            </div>
                                                                            
                                                                                                                                                            <div class="col-md-4">
                                                                                                                                                                <label for="appdateCopiesWereSent" class="control-label pull-left">Date copy was sent</label>
                                                                                                                                                                <input id="appdateCopiesWereSent"                                
                                                                                                                                                                       type="text"      
                                                                                                                                                                       class="form-control"                                
                                                                                                                                                                       name="appdateCopiesWereSent"  
                                                                                                                                                                       readonly
                                                                                                                                                                       >
                                                                                                                                                            </div>
                                                                            
                                                                                                                                                        </div> row-->

                                                                            <div class="row" style="margin-bottom: 40px;margin-top: 30px">   

                                                                                <div class="col-md-4">
                                                                                    <label for="appNotesAboutApplication" class="control-label pull-left">Notes about Application</label>
                                                                                    <!--keep in one line otherwise placeholder doesn't show-->
                                                                                    <textarea id="appNotesAboutApplication" class="form-control" name="appNotesAboutApplication"  style="width: 800px; height: 215px" placeholder="Notes"></textarea>
                                                                                </div>

                                                                            </div> <!--row-->
                                                                        </div> <!--row-->
                                                                    </div> <!--row-->
                                                                </div>  <!--container-fluid-->
                                                            </div> <!--tab-pane" id="originalContracts" -->

                                                            <!--Publisher and Translation-->
                                                            <div class="tab-pane" id="publisherTranslation">      

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                    <div class="col-md-4">
                                                                        <label for="appForeignPublisher" class="control-label pull-left">Target publisher</label>
                                                                        <input id="appForeignPublisher"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="appForeignPublisher"   
                                                                               readonly
                                                                               >
                                                                    </div>

                                                                    <div class="col-md-4">
                                                                        <label for="appForeignCountry" class="control-label pull-left">Target country </label>
                                                                        <input  id="appForeignCountry" 
                                                                                name="appForeignCountry" 
                                                                                type="text"                                                                
                                                                                class="form-control"     
                                                                                readonly
                                                                                >
                                                                    </div>

                                                                    <div class="col-md-4">        
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

                                                                    <div class="col-md-7">
                                                                        <label for="appfeePerPage" class="control-label pull-left">Break-down of translator(s)'s fee</label>
                                                                        <!--<div class="input-group" style="margin-bottom: 40px">-->
                                                                        <textarea id="appfeePerPage"  class="form-control" name="appfeePerPage" style="height: 98px" readonly></textarea>
                                                                        <!--</div>-->
                                                                    </div>


                                                                    <div class="col-md-4">
                                                                        <label for="apptranslatorFee" class="control-label pull-left">Translator(s)'s fee</label>
                                                                        <div class="input-group  pull-left" style="margin-bottom: 40px">                                                               
                                                                            <label class="input-group-addon" for="apptranslatorFee">                                                           
                                                                                <span class="glyphicon glyphicon-euro"></span>                                     
                                                                            </label>
                                                                            <input type="text" class="form-control" readonly name="apptranslatorFee" id="apptranslatorFee" placeholder="fee">    
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->


                                                                <div class="row" style="margin-bottom: 40px;margin-top: 5px"> 

                                                                    <div class="col-md-12">
                                                                        <label for="previousGrantAid" class="control-label pull-left"> Previous grant aid</label>
                                                                        <textarea id="previousGrantAid" class="form-control" readonly name="previousGrantAid" style="height: 183px" placeholder="author name, title, application year, amount awarded, etc " ></textarea>
                                                                    </div>

                                                                </div> <!--row-->

                                                            </div> <!--tab-pane" id="publisherTranslation" -->

                                                            <!-- Reader’s  Report -->
                                                            <div class="tab-pane" id="readerReport" style="margin-bottom: 140px;">

                                                                <div class="row" style="margin-bottom: 130px;margin-top: 20px;"> 

                                                                    <div class='col-md-6' style="margin-bottom: 100px;"> 
                                                                        <button class="btn btn-success btn-xs pull-left" 
                                                                                style="margin-bottom: 20px;" 
                                                                                id="assign_expert_reader_to_reference_number_Btn" 
                                                                                type="button" 
                                                                                onclick="getTodaysDate()" 
                                                                                data-toggle="modal" 
                                                                                data-target="#assignEReadermodal">                                                                   
                                                                        </button>
                                                                        <!--<a class="btn" data-toggle="modal" href="#stack2">Launch modal</a>-->
                                                                        <!-- additionalExpertReader -->
                                                                        <div class="row" style="margin-top: 5px"> 
                                                                            <div id="additionalExpertReader"></div>
                                                                        </div> <!--row-->   
                                                                    </div>

                                                                </div> <!--row-->      

                                                            </div>  <!--tab-pane" id="readerReport" -->

                                                            <!--Board  Meeting-->
                                                            <div class="tab-pane" id="boardMeeting">

                                                                <div class="row" style="margin-bottom: 40px;margin-top: 40px">   

                                                                    <div class='col-md-3 col-sm-offset-1'>
                                                                        <div class="form-group has-feedback">
                                                                            <label for="appDateOfBoardMeeting" class="control-label pull-left">Board meeting</label>                                                                   
                                                                            <div class="input-group  pull-left" >
                                                                                <input type="text" 
                                                                                       name="appDateOfBoardMeeting" 
                                                                                       id="appDateOfBoardMeeting" 
                                                                                       class="form-control" 
                                                                                       placeholder="DD/MM/YYYY" />    
                                                                                <label class="input-group-addon" for="appDateOfBoardMeeting">
                                                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                                                </label>
                                                                            </div> 
                                                                        </div>                                                            

                                                                        <script>
                                                                            $("#appDateOfBoardMeeting").datepicker().on('change', function () {
                                                                                $(this).valid(); // triggers the validation test
                                                                                // '$(this)' refers to '$("#datepicker")'
                                                                            });
                                                                        </script>
                                                                    </div>

                                                                    <div class="col-md-4 col-sm-offset-3">
                                                                        <div class="form-row">
                                                                            <div class="form-group  text-center">
                                                                                <label for="directorChairDecision" class="control-label">Director/Chair decision</label>
                                                                                <input id="directorChairDecision"
                                                                                       type="checkbox"      
                                                                                       class="form-control" 
                                                                                       value="ticked"             
                                                                                       name="directorChairDecision"  
                                                                                       onclick="directorChairDecision_click(this);"
                                                                                       >
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">   

                                                                    <div class="col-md-3 col-sm-offset-1">
                                                                        <div class="form-group">
                                                                            <label for="amountRequested" class="pull-left control-label">Amount requested</label> 
                                                                            <!--<strong class="pull-left">Amount requested</strong>--> 
                                                                            <div class="input-group pull-left">
                                                                                <label class="input-group-addon" for="amountRequested">
                                                                                    <span class="glyphicon glyphicon-euro"></span>                                     
                                                                                </label>
                                                                                <input type="text" class="form-control" name="amountRequested" id="amountRequested" placeholder="Amount Requested">    
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class='col-md-3'>
                                                                        <div class="form-group">
                                                                            <label for="amountRequested" class="pull-left control-label">Proposed  publication date </label>
                                                                            <div class="input-group pull-left" >
                                                                                <input type="text" name="appproposedDateOfPublication" 
                                                                                       id="appproposedDateOfPublication" 
                                                                                       class="form-control" 
                                                                                       placeholder="DD/MM/YYYY" />    
                                                                            </div> 
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                    <div class="col-md-3 col-sm-offset-1">   
                                                                        <div class="form-group">
                                                                            <label for="appplannedPageExtent" class="control-label pull-left">Planned page extent</label>
                                                                            <input id="appplannedPageExtent"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="appplannedPageExtent"  
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-3">
                                                                        <div class="form-group">
                                                                            <label for="appproposedPrintRun" class="control-label pull-left">Proposed print run</label>
                                                                            <input  id="appproposedPrintRun" 
                                                                                    name="appproposedPrintRun" 
                                                                                    type="text"                                                                
                                                                                    class="form-control"                                                            
                                                                                    >
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <label for="award" class="control-label"> Award </label>
                                                                            <br/> 
                                                                            <input id="award"
                                                                                   type="checkbox"                                
                                                                                   class="form-control not-allowed"   
                                                                                   value="ticked" 
                                                                                   name="award"     
                                                                                   onclick="return false;"
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->


                                                                <div class="row" style="margin-bottom: 20px;margin-top: 5px">  

                                                                    <div class="col-md-3 col-sm-offset-1">
                                                                        <div class="form-group">
                                                                            <label for="amountApproved"   class="control-label pull-left">Amount approved</label> 
                                                                            <div class="input-group pull-left">
                                                                                <label class="input-group-addon" for="amountApproved">
                                                                                    <span class="glyphicon glyphicon-euro"></span>                                     
                                                                                </label>
                                                                                <input type="text" class="form-control" name="amountApproved" id="amountApproved" placeholder="Amount Approved">    
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class='col-md-3'>
                                                                        <div class="form-group">
                                                                            <label for="datePublisherInformedOfMeeting"  class="control-label pull-left">Publisher informed of meeting</label>
                                                                            <div class="input-group pull-left">
                                                                                <input type="text" name="datePublisherInformedOfMeeting" id="datePublisherInformedOfMeeting" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                                <label class="input-group-addon" for="datePublisherInformedOfMeeting">
                                                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                                                </label>
                                                                            </div> 
                                                                        </div>
                                                                    </div>

                                                                    <script>
                                                                        $("#datePublisherInformedOfMeeting").datepicker().on('change', function () {
                                                                            $(this).valid(); // triggers the validation test
                                                                            // '$(this)' refers to '$("#datepicker")'
                                                                        });
                                                                    </script>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">   

                                                                    <div class="col-md-11 col-sm-offset-1">
                                                                        <label for="commentsAboutMeeting" class="control-label pull-left">Board comments/instructions </label>
                                                                        <textarea id="commentsAboutMeeting" class="form-control" name="commentsAboutMeeting" style="height: 98px" placeholder="'Refuse funding’ , ‘Award €1,000’ , ‘Postpone to next round’ , ‘Request revised sample'"></textarea>
                                                                    </div>

                                                                    <div class="row"> 
                                                                        <div class='col-md-12 button-wrapper' style="margin-bottom: 40px;margin-top: 60px"> 
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

                                                                <div class="row" style="margin-bottom: 60px;margin-top: 30px">

                                                                    <div class="col-md-8 col-sm-offset-1">        
                                                                        <label class="control-label">Book cover</label>                                                               
                                                                        <img id="cover" src="" alt="Book Cover" class="img grow ImageBorder form-control" title="Book Cover"/>
                                                                    </div>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 5px"> 
                                                                    <div class='col-md-3 col-sm-offset-1'>
                                                                        <strong class=" pull-left">Contract sent to publisher</strong>
                                                                        <div class="input-group pull-left">
                                                                            <input type="text" name="dateContractSenttoPublisher" id="dateContractSenttoPublisher" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                            <label class="input-group-addon" for="dateContractSenttoPublisher">
                                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                            </label>
                                                                        </div>
                                                                    </div>

                                                                    <script>
                                                                        $("#dateContractSenttoPublisher").datepicker().on('change', function () {
                                                                            $(this).valid(); // triggers the validation test
                                                                            // '$(this)' refers to '$("#datepicker")'
                                                                        });
                                                                    </script>

                                                                    <div class='col-md-3 col-sm-offset-1'>
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
                                                                        $("#dateILEAcknowledgementApproved").datepicker().on('change', function () {
                                                                            $(this).valid(); // triggers the validation test
                                                                            // '$(this)' refers to '$("#datepicker")'
                                                                        });
                                                                    </script>
                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px"> 

                                                                    <div class='col-md-3 col-sm-offset-1'>
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
                                                                        $("#datePublishedBooksReceived").datepicker().on('change', function () {
                                                                            $(this).valid(); // triggers the validation test
                                                                            // '$(this)' refers to '$("#datepicker")'
                                                                        });
                                                                    </script>

                                                                    <div class='col-md-3 col-sm-offset-1'>
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
                                                                        $("#datePaymentMadeToPublisher").datepicker().on('change', function () {
                                                                            $(this).valid(); // triggers the validation test
                                                                            // '$(this)' refers to '$("#datepicker")'
                                                                        });
                                                                    </script>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px"> 

                                                                    <div class="col-md-4 col-sm-offset-1">
                                                                        <label for="paymentReferenceNumber" class="control-label pull-left">Payment reference number</label>
                                                                        <input id="paymentReferenceNumber"
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="paymentReferenceNumber"                                
                                                                               >
                                                                    </div>
                                                                </div> <!--row-->

                                                                <div class="row">

                                                                    <div class="pull-left col-sm-offset-1" style="margin-bottom: 20px;margin-top: 30px">
                                                                        <div class="col-md-2">
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
                                                                        <div class="col-md-2">
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
                                                                        <div class="col-md-2">
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
                                                                        <div class="col-md-12">
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

                                                                    <div class="col-md-5 col-sm-offset-1"   style="margin-top: 25px; margin-bottom: 40px">
                                                                        <strong class="pull-left">&nbsp;</strong>                                                 
                                                                        <label class="btn btn-default pull-left" onclick = "pressCuttingsModal();">
                                                                            <img src="images/Press_Cutting.png" width="20" alt="Press_Cutting" /> 
                                                                            Show press coverage                     
                                                                        </label>
                                                                    </div>

                                                                </div> <!--row-->

                                                            </div>   <!--tab-pane" id="contract" -->


                                                        </div>  <!--tab content-->

                                                    </div> <!-- container-fluid --> 
                                                </nav> 
                                            </div><!--modal body-->
                                            <div class="modal-footer"  style="background-color: #c3bcbc">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <input type="submit" class="btn btn-primary" value="Save changes">
                                            </div>
                                        </form>

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
                                                <div class='col-md-6'>
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
                                                <div class='col-md-4'>
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

                                                <div class='col-md-4'>
                                                    <strong class=" pull-left"> Sample returned</strong>
                                                    <div class="input-group pull-left">
                                                        <input type="text" name="sampleReturned" id="sampleReturned" class="form-control" placeholder="DD/MM/YYYY" />    
                                                    </div>
                                                </div>
                                            </div> <!--row-->

                                            <div class="row" style="margin-bottom: 20px;">
                                                <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">  
                                                    <div class="col-md-2">
                                                        <input id="ReadersReport"                                
                                                               type="hidden"                                                            
                                                               name="ReadersReport"                                
                                                               >
                                                    </div>
                                                    <a class="btn btn-info" role="button" id="appReadersReport" >
                                                        <span class="glyphicon glyphicon-file"></span>
                                                        Reader’s Report</a>
                                                </div>

                                                <div class="col-md-10">
                                                    <label for="readerReportSummary" class="control-label pull-left"> Reader’s report summary1</label>
                                                    <textarea id="readerReportSummary" 
                                                              class="form-control"                                               
                                                              name="readerReportSummary"    
                                                              style="height: 98px"
                                                              >                 
                                                    </textarea>
                                                </div>
                                            </div> <!--row-->  
                                            <div class="modal-footer"  style="background-color: #c3bcbc">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                            </div>
                                        </div><!-- /.modal-body -->
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->



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
                                                    <th class="never">Role</th>
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
                                                    <th class="never">Role</th>
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
                                                        <div class="col-md-4">
                                                            <label for="userUname" class="control-label pull-left">Username</label>
                                                            <input  id="userUname" 
                                                                    type="text"                                                  
                                                                    class="form-control"    
                                                                    name="userUname"    
                                                                    >
                                                        </div>
                                                    </div> <!--row-->

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-md-4">
                                                            <label for="userFirstName" class="control-label pull-left">First name</label>
                                                            <input id="userFirstName"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userFirstName"                                
                                                                   >
                                                        </div>

                                                        <div class="col-md-4">
                                                            <label for="userLastName" class="control-label pull-left">Last name</label>
                                                            <input id="userLastName"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userLastName"                                
                                                                   >
                                                        </div>
                                                    </div> <!--row-->

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                        <div class="col-md-4">
                                                            <label for="userFunction" class="control-label pull-left">Function</label>
                                                            <input id="userFunction"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userFunction"                                
                                                                   >
                                                        </div>

                                                        <div class="col-md-4">
                                                            <label for="userClearEmail" class="control-label pull-left">Email</label>
                                                            <input id="userClearEmail"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userClearEmail"                                
                                                                   >
                                                        </div>
                                                    </div> <!--row-->

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                        <div class="col-md-4">
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
                                            <table id="expReader" class="display responsive table table-striped table-bordered" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th class="details-control"></th>
                                                        <th class="delete-control"></th>
                                                        <th class="never">User ID</th>
                                                        <th class="all">First Name</th>
                                                        <th class="all">Last Name</th>
                                                        <th class="all">Email</th>
                                                    </tr>
                                                </thead>

                                                <tfoot>
                                                    <tr>
                                                        <th class="details-control"></th>
                                                        <th class="delete-control"></th>
                                                        <th class="never">User ID</th>
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

                                                        <div class="col-md-4">
                                                            <label for="FirstNameExpReader" class="control-label pull-left">First name</label>
                                                            <input type="text" class="input-sm" id="FirstNameExpReader"/>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-md-4">
                                                            <label for="LastNameExpReader" class="control-label pull-left"> Last name</label>
                                                            <input type="text" class="input-sm" id="LastNameExpReader"/>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-md-4">
                                                            <label for="EmailExpReader" class="control-label pull-left"> Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                            <input type="text" class="input-sm" id="EmailExpReader"/>
                                                        </div>
                                                    </div>
                                                </div><!-- modal body -->

                                                <div class="modal-footer"  style="background-color: #c3bcbc">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div><!-- modal-footer -->
                                            </div><!-- modal-content -->
                                        </div><!-- modal-dialog -->
                                    </div><!-- modal -->

                                    <!--deleteExpReaderModal-->
                                    <div class="modal fade" id="deleteExpReaderModal" tabindex="-1" role="dialog" aria-labelledby="deleteExpReaderModalLabel">

                                        <div class="modal-dialog" role="document">

                                            <div class="modal-content">

                                                <div class="modal-header" style="background-color:  #ff0000;">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="deleteExpReaderModalLabel">Delete expert reader</h4>
                                                </div>

                                                <div class="modal-body" style="background-color: #d9d1d1">

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <input type="hidden" id="delExpertReaderID">  
                                                        <div class="col-md-4">
                                                            <label for="FirstNameExpReader" class="control-label pull-left">First name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                            <input type="text" class="input-sm" id="delFirstNameExpReader"/>
                                                        </div>
                                                        <div class="col-md-1"></div>                                                        
                                                    </div>

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-md-4">
                                                            <label for="LastNameExpReader" class="control-label pull-left"> Last name</label>
                                                            <input type="text" class="input-sm" id="delLastNameExpReader"/>
                                                        </div>
                                                        <div class="col-md-5">You are deleting this user
                                                            <span class="glyphicon glyphicon-exclamation-sign" style="color: red"></span>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-md-4">
                                                            <label for="EmailExpReader" class="control-label pull-left"> Email</label>
                                                            <input type="text" class="input-sm" id="delEmailExpReader"/>
                                                        </div>
                                                    </div>

                                                </div><!-- modal body -->

                                                <div class="modal-footer"  style="background-color: #c3bcbc">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" id="der" class="btn btn-danger">Delete Expert Reader</button>
                                                </div><!-- modal-footer -->

                                            </div><!-- modal-content -->
                                        </div><!-- modal-dialog -->
                                    </div><!-- modal -->

                                </div> <!-- tab-pane expReader-->

                                <!--Library-->
                                <div class="tab-pane fade" id="Library">
                                    <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                                        <div class="table-responsive">
                                            <table id="books" class="  table table-striped table-bordered nowrap" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>         
                                                        <th class="details-control"></th>
                                                        <th class="never">bookID</th>
                                                        <th class="all">Reference <br/> Number</th>
                                                        <th class="all">Author(s)</th>
                                                        <th class="all">Title</th>
                                                        <th class="all">Publisher</th>                                                        
                                                        <th class="never">Publisher <br/>Year</th>
                                                        <th class="never">Genre</th>
                                                        <th class="all">Translation<br/>Title</th>  
                                                        <th class="all">Original Publisher</th>                                                        
                                                        <th class="never">Translation<br/>Publisher Year</th>                                                        
                                                        <th class="all">Translator</th>
                                                        <th class="all">Language</th>
                                                        <th class="never">Copies</th>
                                                        <th class="never">Notes</th>
                                                        <th class="never">ISBN</th>
                                                        <th class="never">ISSN</th>
                                                        <th class="never"></th>      
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- Main Grid -->   
                                                </tbody>
                                                <tfoot>
                                                    <tr>                                                                    
                                                        <th class="details-control"></th>
                                                        <th class="never">bookID</th>
                                                        <th class="all">Reference <br/> Number</th>
                                                        <th class="all">Author(s)</th>
                                                        <th class="all">Title</th>
                                                        <th class="all">Publisher</th>                                                        
                                                        <th class="never">Publisher <br/>Year</th>
                                                        <th class="never">Genre</th>
                                                        <th class="all">Translation<br/>Title</th>  
                                                        <th class="all">Original Publisher</th>                                                        
                                                        <th class="never">Translation<br/>Publisher Year</th>                                                        
                                                        <th class="all">Translator</th>
                                                        <th class="all">Language</th>
                                                        <th class="never">Copies</th>
                                                        <th class="never">Notes</th>
                                                        <th class="never">ISBN</th>
                                                        <th class="never">ISSN</th>
                                                        <th class="never"></th>        
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>             
                                    <c:if test="${not empty error}">Error: ${error}</c:if>

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

                                <!--Maintenance-->
                                <div class="tab-pane fade" id="Maintenance">
                                    <h2>Maintenance</h2>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editEmailTemplatesModal">
                                        Edit email templates
                                    </button>
                                </div>
                            </div>
                        </div>
                    </nav>



                    <!--footer start-->
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
                            <!--<a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a>-->
                        </div>                    

                        <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
                            &copy; 2017-2020 mgr Software
                        </div>

                    </div><!-- end of Base div -->

                </div> <!-- end of container div -->

                <div class="shadowbase"> </div>

            </div><!-- shadowholder -->


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
                                        <!--<span id="erremail" class="alert alert-danger col-lg-8 col-md-8 col-md-8 col-xs-12">Invalid Email Address</span>-->
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
                            <input type="hidden" name="name" value="${name}">
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

        <!--Add New Expert Reader modal-->
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
                                        <!--<span id="erremail" class="alert alert-danger col-lg-8 col-md-8 col-md-8 col-xs-12">Invalid Email Address</span>-->
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

                            </div><!--signup-form-container-->

                            <!--<input type="hidden" name="NewAssignedERRefNo" id="NewAssignedERRefNo"  class="form-control">-->
                        </div>
                        <div class="modal-footer"  style="background-color: #c3bcbc">
                            <input type="hidden" name="userID" value="${userID}">
                            <input type="hidden" name="name" value="${name}">
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
                        <%request.getSession().setAttribute( "task", "AssignExpertReader" );%>

                        <input type="hidden" name="AssignExpertReader"  class="form-control" value="AssignExpertReader">
                        <div class="modal-header" style="background-color: #c3bcbc">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Assign expert reader to reference number  <input id="unassignedERRefNo" value="" disabled /></h4>
                        </div>
                        <div class="modal-body" style="background-color: #d9d1d1">

                            <div class="row" style="margin-bottom: 20px;">  
                                <div class='col-md-4'>
                                    <label for="selectUnassignedER" class="pull-left control-label">Select</label>
                                    <select class="selectpicker form-control" id="selectUnassignedER" onchange="selectER();"></select>
                                </div>
                                <input type="hidden" name="selectedUnassignedER" id="selectedUnassignedER"  class="form-control">
                                <div class='col-md-4' style="padding-left: 5px">
                                    <label for="unassignedERRefNo"  class="pull-left  control-label">for Reference Number</label>
                                    <input id="unassignedERRefNo1" class="form-control" value="" disabled />
                                </div>
                            </div> <!--row-->

                            <div class="row" style="margin-bottom: 20px;">  
                                <div class='col-md-4'>
                                    <strong class=" pull-left">&nbsp;<br/> Sample sent out</strong>
                                    <div class="input-group pull-left">
                                        <input type="text" name="sampleSentOut" readonly="" id="sampleSentOut1" class="form-control" placeholder="DD/MM/YYYY" />    
                                    </div>
                                </div>
                                <div class='col-md-4'>
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
                            <input type="hidden" name="name" value="${name}">
                            <input type="hidden" name="userID" value="${userID}">
                            <input type="hidden" name="publisherID" value="${publisherID}">
                            <input type="hidden" name="Company" value="${companyDetails.Company}">
                        </div>
                        <div class="modal-footer"  style="background-color: #c3bcbc">                            
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" >Assign expert reader</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->           

        <!--pressCuttingsModal-->
        <div class="modal fade" id="pressCuttingsModal" tabindex="-1" role="dialog" aria-labelledby="pressCuttingsModal">
            <div class="modal-dialog modal-lg">
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
                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc">                      
                        <button type="button" class="btn btn-default" data-dismiss="modal">Done</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div> <!--modal footer -->
                </div> <!--modal content-->          
            </div> <!--modal dialog-->
        </div> <!--modal fade-->
        <!--pressCuttingsModal-->
        <input type="hidden" value="pressCuttings" name="image-file" id="label_pressCuttings"/>

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
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <label for="addGenre" class="control-label pull-left">Add Genre</label>
                                <input type="text" class="form-control input-sm" id="addGenre"/>                               
                            </div>
                            <div class="col-md-4"></div>
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
                            <div class="col-md-3"></div>
                            <div class="col-md-6">                               
                                <p id="showDeletedGenre"></p>                       
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <!--deleteExpReaderSuccessModal-->
        <div class="modal fade" id="deleteExpReaderSuccessModal" tabindex="-1" role="dialog" aria-labelledby="deleteExpReaderSuccessModalLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: #5bdc18;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="deleteExpReaderSuccessModalLabel">Success</h4>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">                               
                                <p id="showDeleteExpReader"></p>                       
                            </div>
                            <div class="col-md-3"></div>
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
                            <div class="col-md-3"></div>
                            <div class="col-md-6">                               
                                <p id="showAddedGenre"></p>                       
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <!--libraryUpdateSuccessModal-->
        <div class="modal fade" id="libraryUpdateSuccessModal" tabindex="-1" role="dialog" aria-labelledby="libraryUpdateSuccessModallLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: #5bdc18;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="libraryUpdateSuccessModallLabel">Success</h4>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">                               
                                <p id="showLibraryUpdateSuccess"></p>                       
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <!--saveBooksForm-->
        <form 
            id="saveBooksForm"  
            method="POST"
            role="form"                             
            action="${pageContext.request.contextPath}/LibraryUpdate" 
            enctype="multipart/form-data">
            <div class="modal fade" id="booksModal" tabindex="-1" role="dialog" aria-labelledby="booksModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="background-color: #d9d1d1">



                        <div class="modal-header" style="background-color: #c3bcbc">

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="booksModalLabel">Manage books</h4>
                        </div>

                        <!-- modal-body -->
                        <div class="modal-body" style="background-color: #d9d1d1;">
                            <div class="container-fluid" style="margin-bottom:  40px; ">

                                <div class="row"> 

                                    <div style=" margin: 0 auto; position: relative;">
                                        <div class="col-md-2"></div>
                                        <div id="showUploadCover1" class="col-md-8"  style="margin-bottom:  20px; ">

                                            <!-- bootstrap-imageupload. -->                                                               
                                            <div class="imageupload panel panel-default">
                                                <div class="panel-heading clearfix">
                                                    <h3 class="panel-title ">Select book cover</h3>
                                                </div>
                                                <div class="file-tab panel-body" id="cover1" style="display:block; margin: 0 auto;width: 75%">

                                                    <label class="btn btn-default btn-file"> 
                                                        <span>Browse</span>
                                                        <!-- The file is stored here. -->

                                                        <input type="file" id="Cover1" name="Cover1" style="width:200px;height:300px;">

                                                    </label>

                                                    <button type="button" class="btn btn-default">Remove</button>
                                                </div>
                                            </div>

                                        </div>

                                        <!--<div id="showUploadCover2" class="col-md-8"  style="margin-bottom:  40px; ">--> 
                                        <div id="showUploadCover2" class="col-md-4"  style="margin-bottom:  40px; "> 
                                            <div class="panel panel-default">
                                                <div class="panel-heading clearfix">
                                                    <h3 class="panel-title" id="showUploadCoverTitle"></h3>
                                                </div>

                                                <div class="file-tab panel-body" id="cover2" style="display:block; margin: 0 auto;width: 75%">
                                                    <!--<div class="panel-body" id="cover2" style="display:block;  margin:auto;">-->
                                                    <img src="" id="cover21"  alt="" style="width:200px;height:300px;">

                                                </div>
                                            </div>
                                        </div>

                                    </div> <!-- position: relative; -->

                                </div> <!--row-->

                                <input type="hidden" class="input-sm pull-left" id="bookID"/> 
                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                    <div class="col-md-4">
                                        <label class="pull-left"> Reference Number </label>
                                        <p><input type="text" class="input-sm pull-left" id="referenceNumber"/></p>
                                    </div>
                                </div>

                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                    <div class="col-md-5">
                                        <label class="pull-left" for="Author"> Author </label>   
                                        <input type="text" class="input-sm pull-left" id="Author"/>                                   
                                    </div>

                                    <div class="col-md-6">
                                        <label class="pull-left" for="Translator"> Translator </label>   
                                        <input type="text" class="input-sm pull-left" id="Translator"/>
                                    </div>

                                </div>

                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                    <div class="col-md-5">
                                        <label class="pull-left" for="OrgTitle"> Original Title &nbsp;&nbsp;&nbsp;</label>
                                        <input type="text" class="input-sm pull-left" id="OrgTitle"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="pull-left" for="TransTitle"> Translated Title</label>
                                        <input type="text" class="input-sm pull-left" id="TransTitle"/>
                                    </div>

                                </div>

                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                    <div class="col-md-5">
                                        <label class="pull-left" for="Publisher"> Publisher &nbsp;&nbsp;&nbsp;</label>
                                        <input type="text" class="input-sm pull-left" id="Publisher"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="pull-left" for="translationPublisher"> Translation Publisher</label>
                                        <input type="text" class="input-sm pull-left" id="translationPublisher"/>
                                    </div>
                                </div>


                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                    <div class="col-md-5">
                                        <label class="pull-left"> Genre</label>
                                        <input type="text" class="input-sm pull-left" id="Genre"/>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="pull-left"> Language(s) </label>
                                        <p><input type="text" class="input-sm" id="Language"/></p>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                    <div class="col-md-5">                                                                                                          
                                        <label class="pull-left"> ISBN </label>
                                        <input type="text" class="input-sm" id="ISBN"/>
                                    </div>
                                    <div class="col-md-5">                                                                                                          
                                        <label class="pull-left"> ISSN </label>
                                        <input type="text" class="input-sm" id="ISSN"/>
                                    </div>
                                </div>
                            </div>
                        </div>  <!--modal-body -->

                        <!--modal-footer -->
                        <div class="modal-footer"  style="background-color: #c3bcbc;">                                                       
                            <button type="submit" id="btnSubmit" class="btn btn-primary" data-dismiss="modal" >Save changes</button>
                            <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                        </div>  <!-- modal-footer -->
                        <!--                    </form>                     -->
                    </div> <!-- modal-content -->
                </div> <!-- modal-dialog -->
            </div> <!-- modal -->
        </form>     

        <!--image-gallery-->
        <div class="modal fade" id="image-gallery" tabindex="-1" role="dialog" aria-labelledby="image-gallery-title" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #e5e5e5">
                        <h4 class="modal-title" id="image-gallery-title" style="background-color: #e5e5e5"></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body" style="position:relative; height: 800px; background-color: #f0ead6">
                        <img id="image-gallery-image" class="img-responsive col-md-12" src="" alt="">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary float-left" id="show-previous-image"><i class="fa fa-arrow-left"></i>
                        </button>

                        <button type="button" id="show-next-image" class="btn btn-secondary float-right"><i class="fa fa-arrow-right"></i>
                        </button>
                    </div>
                </div>
            </div>
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

        <!--editEmailTemplatesModal-->
        <div class="modal fade" id="editEmailTemplatesModal" tabindex="-1" role="dialog" aria-labelledby="editEmailTemplatesModalLabel" aria-hidden="true"   data-modal-index="4">
            <div class="modal-dialog  modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #c3bcbc">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h5 class="modal-title" id="editEmailTemplatesModalLabel">Edit email templates</h5>
                    </div>
                    <div class="modal-body" style="background-color: #d9d1d1">
                        <form action="templateHandler" method="GET">
                            <div class="row">
                                <div class="col-md-4">

                                    <div class="selectTemplate">
                                        <h2>Select email template</h2>
                                        <div id="selectTemplate" class="templateSelector" ></div>
                                    </div>

                                    <div class="selectParameter" style="margin-left: 20px">
                                        <h2>Select email parameter</h2>
                                        <table width="100%" >

                                            <tbody>
                                                <tr>
                                                    <td style="text-align:left">From:&nbsp;</td>
                                                    <td>&nbsp;</td>                              
                                                    <td style="text-align:left">
                                                        <select id="from" name="from"></select>
                                                    </td>
                                                </tr>
                                                <!--                                                <tr>
                                                                                                    <td style="text-align:left">Salutation:&nbsp;</td>
                                                                                                    <td>&nbsp;</td>                                                
                                                                                                    <td style="text-align:left">
                                                                                                        <select id="salutation" name="salutation" onchange="onchange_action();">
                                                                                                            <option value="First_Name" selected>First name</option>
                                                                                                            <option value="Last_Name">Last name</option>
                                                                                                            <option value="Full_Name">Full name</option>
                                                                                                        </select>
                                                                                                    </td>     -->                                    
                                                <tr> 
                                                    <td style="text-align:left">Salutation:&nbsp;</td>
                                                    <td>&nbsp;</td>                                           
                                                    <td style="text-align:left"> 
                                                        <c:set var="selectedRole" value='${requestScope["selectedRole"]}' />
                                                        <c:set var="grades" value="First_Name,Last_Name,Full_Name" scope="application" />
                                                        <select class="grade" title="Grade Obtained">
                                                            <c:forEach items="${fn:split(grades, ',')}" var="grade">
                                                                <option value="${grade}" ${grade == selectedRole ? 'selected' : ''}>${grade}</option>
                                                            </c:forEach>
                                                        </select>

                                                    </td>

                                            </tbody>
                                        </table>


                                    </div>

                                </div>

                                <div class="col-md-8">

                                    <input type="hidden" id="fileName" name="fileName">

                                    <textarea name="editor1" id="editor1" rows="20" cols="70"></textarea>  

                                </div>
                            </div> 
                        </form>
                    </div>
                    <div class="modal-footer"  style="background-color: #c3bcbc;"> 
                        <div class="input-group">
                            <form action="emailWithHTMLTemplate" method="POST">
                                <input type="hidden" id="emailTemplateSelected" name="emailTemplateSelected">                        
                                <button class="btn btn-secondary" type="submit" name="SendTest">Send test email</button>  &nbsp; &nbsp; &nbsp;   
                            </form>
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-secondary" id="showInstructionsModalBtn" data-toggle="modal" data-target="#showInstructionsModal">Open instructions</button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--showInstructionsModal-->
        <div class="modal fade" id="showInstructionsModal" tabindex="-1" role="dialog" aria-labelledby="showInstructionsModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header"   style="background-color: #c3bcbc">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h1 class="modal-title" id="showInstructionsModalLabel">Edit template instructions</h1>
                    </div>
                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="container-fluid">
                            <div id="contentarea1">
                                <div class="textpadding">
                                    <div class="typography">
                                        <h4>Select email template</h4>
                                        <p>Select a template on the left.
                                            As soon you clicked on the link the template's text is displayed in the editor</p>
                                        <p>Now you can edit the text. When you're done click on the <img src="assets/js/ckeditor/plugins/save/icons/save.png" width="16" height="16" alt="save icon"/>
                                            icon to save the edited template</p>
                                        <p> </p>
                                        <h4>Change sender of email</h4>
                                        <p>In order to change the sender select the user on the left 'Select email parameter'.</p>
                                        <p>Only Literature Ireland Staff that have been registered with the application can be selected </p>
                                        <p> </p>
                                        <h4>Change the salutation</h4>
                                        <p>You can change the salutation on the left.</p>
                                        <p>Available salutations are: Full Name, First Name, Last Name </p>
                                        <p> </p>     
                                        <h4>Testing</h4>
                                        <p>You can test the changes by sending an email to the user id you're logged in as : ${email}</p>
                                        <p></p>
                                        <p> </p>   
                                        <h4>Limitations</h4>
                                        <p>Do NOT change links or parameters that are all in upper case (i.e. LOGIN)  </p>  
                                        <p> </p>  
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

        <script src="js/bootstrap-imageupload.js"></script>
        <script>
                                    var $imageupload = $('.imageupload');
                                    $imageupload.imageupload();
                                    $(replaceEditor);
                                    $(selectTemplate);
        </script>
    </body>
</html>
