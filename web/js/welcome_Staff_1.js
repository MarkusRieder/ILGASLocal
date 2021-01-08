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
var TranslTitles = "";
var TranslatorDocs = [];
var readerReport = "";
var genreTable = null;
var booksTable = null;
//var hasCover = false;
var rowdata1;
var rowdata = [];
var oTable = null;
var tuttut = [];
var detailsTableData;
var translators = [];



function loadXMLDocER() {
    var xmlhttp;
    var uname = document.getElementById("uname").value;
    var urls = "CheckUserName?uname=" + uname;
    console.log("loadXMLDocER " + urls);
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
            document.getElementById("loadXMLDocERerror").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("Post", urls, true);
    xmlhttp.send();
}

function loadXMLDocStaff()
{
    var xmlhttp;
    var uname = document.getElementById("StaffUname").value;
    var urls = "CheckUserName?uname=" + uname;
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
            document.getElementById("loadXMLDocStafferror").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("Post", urls, true);
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


    /*
     * build key actions for gallery
     * move right (key 39) left (key 37)
     */
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

/*
 * Validation
 */
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
        console.log("label_id              ", label_id);
        document.getElementById(label_id).value = label;
        console.log("generatedLabels document.getElementById(" + label_id + " = ", label);
    });
}

/*
 * genreTable
 */
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

    /*
     *  genreTable tbody').on('click'                
     */
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

/*
 * userTable
 */
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

/*
 * expReaderTable           
 */
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
                    console.log("referenceNumber " + data);
                    if (typeof (data) === "undefined") {
                        return 'n/a';
                    } else {
                        return data;
                    }

                }},
            {"data": "Author",
                "render": function (data, type, full, meta) {
                    console.log("Author " + data);
                    return data;
                }
            },
            {"data": "Titles",
                "render": function (data, type, full, meta) {
                    console.log("Title " + data);
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
                    console.log("Notes " + data);
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

                        return '<img src="images/not-available.jpg" width="275" height="275" alt="not-available"/>';
                    } else {
                        return '<img src="http://localhost:8080' + data + '">';
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
//        console.log("rowdata.cover  " + rowdata.cover);
        var authors = rowdata.Author;
// var authors = "AuthorFirst7 AuthorLast7, AuthorFirst777 AuthorLast777, AuthorFirst7 AuthorLast7";
        console.log("lib rowdata.Author  " + rowdata.Author);
        $("#Author").val(authors);
        $("#Translator").val(rowdata.Translator);


//        if (typeof (rowdata.cover) === "undefined") {
//            var cver = 'ILGAS/images/not-available.jpg';
//        } else {
//            var cver = 'http://localhost' + rowdata.cover + '';
//        }

//var bookCover;
//        $("#bookCover").val(cver);
//        document.getElementById("Cover1").src = cver;

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


//        if (typeof (rowdata.cover) === "undefined" || rowdata.cover === "") {
//
//            // no cover - show upload
////            var cver = '..images/not-available.jpg';
//            cver = 'images/not-available.jpg';
//            $("#showUploadCover1").show();
//            $("#showUploadCover2").hide();
//            document.getElementById("cover21").src = cver;
//            hasCover = false;
//        } else {
//            // we have a cover - show cover
//            $("#showUploadCover2").show();
//            $("#showUploadCover1").hide();
////             var cver = 'http://localhost' + rowdata.cover + '';
//            cver = 'http://localhost' + rowdata.cover + '';
//            console.log("rowdata.cover cver " + cver);
//            hasCover = true;
//            $("#cover").val(cver);
//            console.log("81 xyz show bookCover cover " + bookCover);
//            console.log("81 xyz show Book cover for \n" + rowdata.translationTitle);
//            document.getElementById("cover21").src = cver;
//            document.getElementById("cover").src = cver;
//            document.getElementById("Cover1").src = cver;
//            document.getElementById("showUploadCoverTitle").innerHTML = "Book cover for \n" + rowdata.translationTitle;
//            console.log("cver  " + cver);
//            bookTranslationTitle = rowdata.translationTitle;
//            console.log("81 xyz show Book bookTranslationTitle for \n" + bookTranslationTitle);
//        }
//        console.log("hasCover2  " + hasCover);
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
//        var bookCover = document.getElementById('Cover1').value;
//        var bookCover2 = document.getElementById('cover21').value;
//                    var form = $("saveBooksForm")[0]; // You need to use standard javascript object here

//        console.log("bookCover  " + bookCover);
//        console.log("hasCover2  " + hasCover);
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
//        console.log("rowdata.cover  " + rowdata.cover);
//        console.log("rowdata.cover cover21 " + document.getElementById("cover21").src);
//        if (!hasCover) {
//            formData.append("Cover", Cover1.files[0], bookCover);
//        }


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
/*
 * function getdetailsTableData(urlNew, callback)
 * @param {type} urlNew
 * @param {type} callback
 */
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


/*
 * detailsTable
 */
$(document).ready(function () {
    console.log("555 load detailsTable  ");
    var rowdata1 = [];
    var rowdata = [];
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
                    console.log("ReferenceNumber  " + data);
                    return data;
                }},
            {"data": "company",
                "render": function (data) {
                    console.log("company  " + data);
                    return data;
                }},
            {"data": "agreement",
                "render": function (data, type, row) {

                    return '<a href="http://localhost:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                }},
            {"data": "contract",
                "render": function (data, type, row) {

                    return '<a href="http://localhost:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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

                    return '<a href="http://localhost:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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

                    return '<a href="http://localhost:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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

                        return '<img src="localhost/ILGAS/images1/not-available.jpg" width="275" height="275" alt="not-available"/>';
                    } else {
                        return '<img src="http://localhost:8080' + data + '">';
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
                    return '<a href="http://localhost:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                    return '<a href="http://localhost:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                }},
            {"data": "addendumRightsAgreementName"},
            {"data": "proofOfPaymentToTranslator",
                "render": function (data, type, row) {
                    return '<a href="http://localhost:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                }},
            {"data": "proofOfPaymentToTranslatorName"},
            {"data": "bankDetailsForm",
                "render": function (data, type, row) {
                    return '<a href="http://localhost:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
                }},
            {"data": "bankDetailsFormName"},
            {"data": "SignedLIContract",
                "render": function (data, type, row) {
                    return '<a href="http://localhost:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
                    return '<a href="http://localhost:8080' + data + '"><i class="fa fa-file-text-o" style="font-size:24px;color:blue"></i></a>';
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
            {"data": "bilingual",
                "render": function (data) {
                    console.log("data: bilingual  " + data);
                    return data;
                }},
            {"data": "SendPaidEmailtoPublisher",
                "render": function (data) {
                    console.log("data: SendPaidEmailtoPublisher  " + data);
                    return data;
                }},
            {"data": "SendApproveRejectEmailtoPublisher",
                "render": function (data) {
                    console.log("data: SendApproveRejectEmailtoPublisher  " + data);
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
            /* reset Change Status selector */


            return data;
        },
//                    async: false,
        filter: true,
        info: true,
        ordering: true,
        retrieve: true
    });
    /*
     * 
     * get rowdata from table where row has been clicked
     * 
     */

    $('#applications tbody').on('click', 'tr td.details-control', function (e) {
        e.preventDefault();
        console.log("eeeeeeeeeeeeeeeeeeee ");
        console.log(e);
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
        $.ajaxSetup({
            cache: false
        });
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


        /* reset Change Status selector */

        document.getElementById("PublisherChangeBookCover").value = rowdata.company;
        document.getElementById("referenceNumberChangeBookCover").value = ReferenceNumber;

        $('#changeStatus').get(0).selectedIndex = 0;


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

        /* When SendPaidEmailtoPublisher and SendApproveRejectEmailtoPublisher are ticked change text of 
         * checkbox SendPaidEmailtoPublisherToggle
         * checkbox SendApproveRejectEmailtoPublisherToggle
         * to: email to publisher has already being sent   
         * 
         * @type String
         */

        /* initialise variable varSendPaidEmailtoPublisher */
        var varSendPaidEmailtoPublisher = 0;
        varSendPaidEmailtoPublisher = rowdata.SendPaidEmailtoPublisher;
        console.log("6565 sendPaidEmailtoPublisher:  " + varSendPaidEmailtoPublisher);
        if (varSendPaidEmailtoPublisher === 1) {
            document.getElementById("sendPaidEmailtoPublisher").checked = true;
            console.log("sendPaidEmailtoPublisher:  TRUE");
        } else if (varSendPaidEmailtoPublisher === 0) {
            document.getElementById("sendPaidEmailtoPublisher").checked = false;
            console.log("sendPaidEmailtoPublisher:  FALSE");
        }

        /* initialise variable varSendApproveRejectEmailtoPublisher */
        var varSendApproveRejectEmailtoPublisher = 0;
        varSendApproveRejectEmailtoPublisher = rowdata.SendApproveRejectEmailtoPublisher;
        console.log("6565 sendApproveRejectEmailtoPublisher:  " + varSendApproveRejectEmailtoPublisher);
        if (varSendApproveRejectEmailtoPublisher === 1) {
            document.getElementById("sendApproveRejectEmailtoPublisher").checked = true;
            console.log("sendApproveRejectEmailtoPublisher:  TRUE");
        } else if (varSendApproveRejectEmailtoPublisher === 0) {
            document.getElementById("sendApproveRejectEmailtoPublisher").checked = false;
            console.log("sendApproveRejectEmailtoPublisher:  FALSE");
        }

        if (varSendPaidEmailtoPublisher === 1) {
            document.getElementById("sendPaidEmailtoPublisher").innerHTML = "email to publisher has already being sent    &nbsp;   &nbsp;";
            document.getElementById("styleSendPaidEmailtoPublisher").style.color = "red";
        } else {
            document.getElementById("styleSendPaidEmailtoPublisher").style.color = "green";
        }

        if (varSendApproveRejectEmailtoPublisher === 1) {
            document.getElementById("sendApproveRejectEmailtoPublisher").innerHTML = "email to publisher has already being sent    &nbsp;   &nbsp;";
            document.getElementById("styleSendApproveRejectEmailtoPublisher").style.color = "red";
        } else {
            document.getElementById("styleSendApproveRejectEmailtoPublisher").style.color = "green";
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
        //var bookTitles = "";
        var TranslTitles = "";
        var TranslatorDocs = [];
        var readerReport = "";
        var expertReaderName = "";


        console.log("123v4 rightsAgreement data " + rowdata.rightsAgreement);
        console.log("123v4 rightsHolderArray data " + rowdata.rightsHolderArray);
        console.log("rightsHolderArray  ");
        var rightsHolderArray = rowdata.rightsHolderArray;
        console.log(rightsHolderArray);
        $("#rightsHolderArray").val(rowdata.rightsHolderArray);
        
        
        
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
        //added to solve the magically changing bookTitles
        var bookTitles = "";
        $("#appBookTitle").val("");
        //    bookTitles = rowdata.Titles;
        console.log("rowdata bookTitles: " + rowdata.bookTitle);
        $("#appBookTitle").val(rowdata.bookTitle);
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
        console.log("13130 paymentStatusSelected " + paymentStatusSelected);
        setSelectedIndex(document.getElementById('paymentStatus'), paymentStatusSelected);
        $("#amountApproved").val(rowdata.amountApproved);
        $("#datePublisherInformedOfMeeting").val(formatDate(rowdata.publisherInformedOfMeeting));
        
        
        
        var directorChairDecision = rowdata.directorChairDecision;
        console.log("directorChairDecision  " + directorChairDecision);
        if (directorChairDecision === 1) {
            document.getElementById("directorChairDecision").checked = true;
            console.log("directorChairDecision  TRUE");
        } else if (directorChairDecision === 0) {
            document.getElementById("directorChairDecision").checked = false;
            console.log("directorChairDecision  FALSE");
        }


        var bilingual = rowdata.bilingual_edition;
        console.log("awardValue:  " + awardValue);
        if (bilingual === 1) {
            document.getElementById("bilingual").checked = true;
            console.log("bilingual  TRUE");
        } else if (bilingual === 0) {
            document.getElementById("bilingual").checked = false;
            console.log("bilingual  FALSE");
        }

        console.log("rowdata.bilingual " + rowdata.bilingual_edition);
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

        var translationTitle = rowdata.translationTitle;
        console.log("translationTitle  " + translationTitle);
        $("#translationTitle").val(rowdata.translationTitle);
        $("#appDateOfPublicationOriginal").val(rowdata.publicationYear);
        $("#appPageExtentOriginal").val(rowdata.originalPageExtent);
        $("#appCountryOfPublication").val(rowdata.countryOfPublication);
        $("#appLanguageOriginal").val(rowdata.originalLanguage);
        //added to solve the magically changing genre
        var genre = "";
        $("#appGenre").val("");
        genre = rowdata.genre;
        $("#appGenre").val(genre);
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
        console.log("4447 rowdata.notesAboutApplication " + rowdata.notesAboutApplication);
        console.log("bookNotes " + rowdata.bookNotes);
        $("#appForeignPublisher").val(rowdata.company);
        console.log("company " + rowdata.company);
//         $("#publisherNamechangeBookCoverTitle").val(rowdata.company);
//           $("#publisherIDchangeBookCoverTitle").val(rowdata.ReferenceNumber);
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
        $("#languageArray").val(rowdata.targetLanguage);
        $("#feePerPage").val(rowdata.Author);
        $("#breakDownTranslatorFee").val(rowdata.breakDownTranslatorFee);
        $("#apptranslatorFee").val(rowdata.translatorFee);
        $("#previousGrantAid").val(rowdata.previousGrantAid);
        console.log("previousGrantAid " + rowdata.previousGrantAid);
        $("#amountRequested").val(rowdata.translatorFee);
        var proposedDateOfPublication = formatDate(rowdata.proposedDateOfPublication);
        console.log("proposedDateOfPublication " + proposedDateOfPublication);
        console.log("rowdata.proposedDateOfPublication " + rowdata.proposedDateOfPublication);
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
//        $("#salesFigures").val(rowdata.salesFigures);
//                    $("#dateUpdate").val(rowdata.foreignPublisher);

//                    ##################################################################################################################

//                    document.getElementById("agreement").href = agreemnt;
//        var orig = 'http://localhost' + rowdata.original + '';
//        $("#appOriginal").val(orig);
//        document.getElementById("original").href = orig;
//        var addendumRightsAgreemnt = 'http://localhost' + rowdata.addendumRightsAgreement + '';
//        $("#appAddendumRightsAgreement").val(addendumRightsAgreemnt);
//
//        console.log("8 xyz 0 Loop addendumRightsAgreemnt ");
//        console.log(rowdata.addendumRightsAgreement);
//
//        console.log("8 xyz proofOfPaymentToTranslator " + rowdata.proofOfPaymentToTranslator);
//               var transSamp = 'http://localhost' + rowdata.copiesTranslationSample + '';
//        console.log("444  copiesTranslationSample " + transSamp);
//        document.getElementById("copiesTranslationSample").href = transSamp;

        /* ------------------------- Original  ---------------------------------*/

        if (rowdata.original !== undefined) {
            var orig = 'http://localhost' + rowdata.original + '';
            $("#appOriginal").val(orig);
            document.getElementById("original").href = orig;
            $("#original").text("Click to open");
            console.log("8 xyz  original ", rowdata.original);
            $("#original").removeClass("btn-warning");
            $("#original").addClass("btn-info");
            $("#original").prepend("<span class='glyphicon glyphicon-file'>&nbsp;</span>");
        } else {

            $("#original").text("No Original sample has been subitted");
            $("#original").removeClass("btn-info");
            $("#original").addClass("btn-warning");
            $("#original").prepend("<span class='glyphicon glyphicon-info-sign'>&nbsp;</span>");
        }

        /* ------------------------- TranslationSample  ------------------------*/

        if (rowdata.copiesTranslationSample !== undefined) {
            var transSamp = 'http://localhost' + rowdata.copiesTranslationSample + '';
            document.getElementById("copiesTranslationSample").href = transSamp;
            $("#copiesTranslationSample").text("Click to open");
            console.log("8 xyz  copiesTranslationSample ", rowdata.copiesTranslationSample);
            $("#copiesTranslationSample").removeClass("btn-warning");
            $("#copiesTranslationSample").addClass("btn-info");
            $("#copiesTranslationSample").prepend("<span class='glyphicon glyphicon-file'>&nbsp;</span>");
        } else {

            $("#copiesTranslationSample").text('No Translation sample has been subitted');
            $("#copiesTranslationSample").removeClass("btn-info");
            $("#copiesTranslationSample").addClass("btn-warning");
            $("#copiesTranslationSample").prepend("<span class='glyphicon glyphicon-info-sign'>&nbsp;</span>");
        }


        /**
         * proofOfPaymentToTranslator
         * bankDetailsFrm
         * signedLIContract
         *  --------------------------------------------------------------------
         */
        console.log("4447  rowdata.proofOfPaymentToTranslator " + rowdata.proofOfPaymentToTranslator);
        if (rowdata.proofOfPaymentToTranslator !== undefined) {
            console.log("4447  rowdata.proofOfPaymentToTranslator " + rowdata.proofOfPaymentToTranslator);
            var proofOfPaymentToTrans = 'http://localhost' + rowdata.proofOfPaymentToTranslator + '';
            $("#appProofPaymentToTranslator").val(proofOfPaymentToTrans);
            document.getElementById("proofPaymentToTranslator").href = proofOfPaymentToTrans;
            document.getElementById("label_proofPaymentToTranslator").style.display = 'none';
            document.getElementById("proofPaymentToTranslator").style.display = 'block';
            $("#label_proofPaymentToTranslator").removeClass("btn-warning");
            $("#label_proofPaymentToTranslator").addClass("btn-info");
            $("#label_proofPaymentToTranslator").prepend("<span class='glyphicon glyphicon-file'>&nbsp;</span>");
        } else {
            console.log("4447  rowdata.proofOfPaymentToTranslator == undefined");
            document.getElementById("proofPaymentToTranslator").style.display = 'none';
            document.getElementById("label_proofPaymentToTranslator").style.display = 'block';
            document.getElementById("label_proofPaymentToTranslator").innerHTML = 'No proof of payment <br/>to translator subitted';
            document.getElementById("label_proofPaymentToTranslator").style.backgroundColor = 'white';
            document.getElementById("label_proofPaymentToTranslator").style.border = 'thin solid black';
            $("#label_proofPaymentToTranslator").removeClass("btn-info");
            $("#label_proofPaymentToTranslator").addClass("btn-warning");
            $("#label_proofPaymentToTranslator").prepend("<span class='glyphicon glyphicon-info-sign'>&nbsp;</span>");
        }

        document.getElementById("label_proofPayment").value = '';

        console.log("4447  rowdata.bankDetailsForm " + rowdata.bankDetailsForm);
        if (rowdata.bankDetailsForm !== undefined) {
            console.log("4447  rowdata.bankDetailsFrm " + rowdata.bankDetailsForm);
            var bankDetailsForm = 'http://localhost' + rowdata.bankDetailsForm + '';
            $("#appBankDetailsForm").val(bankDetailsFrm);
            document.getElementById("bankDetailsForm").href = bankDetailsForm;
            document.getElementById("label_bankDetailsForm").style.display = 'none';
            document.getElementById("bankDetailsForm").style.display = 'block';
            $("#label_bankDetailsForm").removeClass("btn-warning");
            $("#label_bankDetailsForm").addClass("btn-info");
            $("#label_bankDetailsForm").prepend("<span class='glyphicon glyphicon-file'>&nbsp;</span>");
        } else {
            document.getElementById("bankDetailsForm").style.display = 'none';
            document.getElementById("label_bankDetailsForm").style.display = 'block';
            document.getElementById("label_bankDetailsForm").innerHTML = 'No bank details form<br/> subitted&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
            document.getElementById("label_bankDetailsForm").style.backgroundColor = 'white';
            $("#label_bankDetailsForm").removeClass("btn-info");
            $("#label_bankDetailsForm").addClass("btn-warning");
            $("#label_bankDetailsForm").prepend("<span class='glyphicon glyphicon-info-sign'>&nbsp;</span>");
        }

        document.getElementById("label_bankDetails").value = '';

        console.log("4447  rowdata.SignedLIContract " + rowdata.SignedLIContract);
        if (rowdata.SignedLIContract !== undefined) {
            console.log("4447  rowdata.signedLIContract " + rowdata.SignedLIContract);
            var signedLIContr = 'http://localhost' + rowdata.SignedLIContract + '';
            $("#appSignedLIContract").val(signedLIContr);
            document.getElementById("signedLIContract").href = signedLIContr;
            document.getElementById("label_signedLIContract").style.display = 'none';
            document.getElementById("signedLIContract").style.display = 'block';
            $("#label_signedLIContract").removeClass("btn-warning");
            $("#label_signedLIContract").addClass("btn-info");
            $("#label_signedLIContract").prepend("<span class='glyphicon glyphicon-file'>&nbsp;</span>");
        } else {
            document.getElementById("signedLIContract").style.display = 'none';
            document.getElementById("label_signedLIContract").style.display = 'block';
            document.getElementById("label_signedLIContract").innerHTML = 'No signed LI contract<br/> subitted';
            document.getElementById("label_signedLIContract").style.backgroundColor = 'white';
            $("#label_signedLIContract").removeClass("btn-info");
            $("#label_signedLIContract").addClass("btn-warning");
            $("#label_signedLIContract").prepend("<span class='glyphicon glyphicon-info-sign'>&nbsp;</span>");
        }

        document.getElementById("label_signedLIcontract").value = '';


        /* --------------------------- Cover ----------------------------- */
        console.log('rowdata.cover: ', rowdata.cover);
        if (typeof (rowdata.cover) === "undefined") {
            var cver = 'http://localhost/ILGASLocal/images/not-available.jpg';
            console.log('rowdata.cover:undefined ', cver);
            document.getElementById("cover").src = cver;
        } else {
            var cver = 'http://localhost' + rowdata.cover + '';
            console.log('rowdata.cover: ', cver);
//        $("#cover").val(cver);

            document.getElementById("cover").src = cver;
            var orginalWidth = $("#cover").width();
            console.log('orginalWidth: ', orginalWidth);
            document.getElementById("cover21").src = cver;

            var img = document.getElementById('cover');
//or however you get a handle to the IMG
            var width = img.clientWidth;
            var height = img.clientHeight;
            var naturalWidth = img.naturalWidth;
            var naturalHeight = img.naturalHeight;

            console.log('x123 clientWidth: ', width);
            console.log('x123 clientHeight: ', height);
            console.log('x123 naturalWidth: ', naturalWidth);
            console.log('x123 naturalHeight: ', naturalHeight);
            console.log('x123 ', img.height, img.width);
            console.log('x123 ', img.naturalHeight, img.naturalWidth);
            console.log('x123 ', $("#cover").height(), $("#cover").width());
        }

        $("#slider-vertical").slider({
            value: 100,
            min: 0,
            max: 100,
            animate: "slow",
            orientation: 'vertical',
            slide: function (event, ui) {
                console.log('x123 clientWidth: ', width);
                console.log('x123 clientHeight: ', height);
                console.log('x123 naturalWidth: ', naturalWidth);
                console.log('x123 naturalHeight: ', naturalHeight);
                console.log('x123 ui.value: ', ui.value);
                console.log('x123 newWidth: ', orginalWidth / 100 * ui.value);
                $("#cover").width(naturalWidth / 100 * ui.value);

            }
        })
                .slider("pips", {
                    rest: "label",
                    step: "10"
                })
                .slider("float");


        $("#changeBookCoverBtn").on("click", function () {

            $("#changeBookCoverModal").modal("show");
        });


        $("#saveBookCoverBtn").on("click", function () {
            event.preventDefault();

            var url = "./changeBookCoverServlet";
            var form = $("#changeBookCoverForm")[0];
            var data = new FormData(form);

            var referenceNumber = rowdata.ReferenceNumber;
            var Publisher = rowdata.company;
            data.append("referenceNumber", referenceNumber);
            data.append("Publisher", Publisher);

            var dataO = data.entries();
            var obj = dataO.next();
            var retrieved = {};
            while (undefined !== obj.value) {
                retrieved[obj.value[0]] = obj.value[1];
                obj = dataO.next();
            }
            console.log('retrieved: ', retrieved);

            $.ajax({
                type: "POST",
                encType: "multipart/form-data",
                url: url,
                cache: false,
                dataType: 'json',
                processData: false,
                contentType: false,
                data: data,
                success: function (data, textStatus, jqXHR) {
                    alert("Cover has been updated successfully");

                    /* Clear the loaded image in changeBookCoverModal */
                    $('.thumbnail').remove();

                    /* close the changeBookCoverModal */
                    $("#changeBookCoverModal").modal("hide");

                    /* Get the path to the new image */
                    var imagePath = data.imagePath;

                    /* Replace the old cover with the new one */
                    $("#cover").attr('src', imagePath + '?dt=' + (+new Date()));

                    console.log('data: ', data.imagePath);
                    console.log('textStatus: ', textStatus);
                    console.log('jqXHR: ', jqXHR);

                },
                error: function (msg) {
                    console.log('json:: data:3: ', data);
                    console.log('json:: data:3: msg: ', msg);
                    alert("Couldn't upload file");
                }
            });
        });


        /* --------------------------- end of Cover ----------------------------- */



        $("#appApplicationNumber").val($(this).closest('tr').children()[1].textContent);
        $("#appApplicationYear").val($(this).closest('tr').children()[2].textContent);
        $("#appCompany").val($(this).closest('tr').children()[2].textContent); //ok


        var appReferenceNumber = rowdata.ReferenceNumber;
        console.log("appReferenceNumber " + appReferenceNumber);
        $("#appReferenceNumber").val(appReferenceNumber); //ok
        document.getElementById("assign_expert_reader_to_reference_number_Btn").innerHTML = "Assign expert reader to reference number  " + appReferenceNumber;
        $("#expectedReturnDate").val("");
        $("#unassignedERRefNo").val(appReferenceNumber);
        $("#unassignedERRefNo1").val(appReferenceNumber);
        console.log("8 xyz rowdata.TranslatorName ", rowdata.TranslatorName);
        var TranslName = rowdata.TranslatorName;
        var translators = rowdata.TranslatorName;
        console.log("8 xyz 0 Loop translators ");
        console.log(rowdata.TranslatorName);
        console.log("8 xyz 0 Loop translators.length " + rowdata.TranslatorName.length);
        for (var s = 0; s < translators.length; s++) {
            console.log("8 xyz 0 Loop translators s=" + s, translators[s][0]);
        }
        console.log("555 TranslatorDocs:  rowdata.transList   " + rowdata.transList);
        var TranslatorDocs = [];
        TranslatorDocs = rowdata.transList;
        translatorArray = rowdata.transList;
        console.log("AAA translatorArray   " + translatorArray);
        $("#translatorArray").val(rowdata.transList);
        console.log("AAA translatorArray rowdata.transList  " + rowdata.transList);
        $("#TranslatorName").val(TranslName);
        console.log("555 TranslatorName:  rowdata.TranslatorName   " + rowdata.TranslatorName);
        console.log("555 TranslatorName:  translators   " + translators + " translators.length " + translators.length);
        // Generate table translatorTrackTable
        var TranslTitles = rowdata.TranslatorTrack2;
        console.log("444 TranslTitles:  TranslatorTrack2::   " + TranslTitles);

        /* --------------------------- translator Track ----------------------------- */

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

        /* TABLE ROWS */
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
                /*  remove "undefined" cells */
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

        /* Build table for: Track record for Translator(s):  */

        //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
        $('#translTrackDiv').empty();
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

                /* skip undefined values to preserve sparse array */
                if (TranslTitles[i][j] === undefined)
                    continue;
                /* create row if it doesn't exist yet */
                if (translatorTrack[j] === undefined)
                    translatorTrack[j] = [];
                /* swap the x and y coords for the copy */
                translatorTrack[j][i] = TranslTitles[i][j];

            }
        }

        var idx = 0;
        /* TABLE ROWS */
        console.log("TranslTitles.length " + TranslTitles.length);
        for (i = 0; i < TranslTitles.length; i++) {
            var tr = document.createElement('TR');
            console.log("TranslTitles[i].length " + TranslTitles[i].length);
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
                    console.log("555 record i " + i + " j " + j + TranslTitles[i][j]);
                    var tr = document.createElement('TR');
                    td.width = '33.33%';
                    td2.width = '33.33%';
                    td3.width = '33.33%';
                    td.style = 'text-align:left';
                    td2.style = 'text-align: left';
                    td3.style = 'text-align: left';
                    var record = TranslTitles[i][j];
                    console.log("555 record i " + i + " j " + j + TranslTitles[i][j]);
                    console.log("555 record " + TranslTitles[0][0]);
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
                    continue;
                }
                /* remove "undefined" cells */
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
                console.log("555 record i " + i + " j " + j + TranslTitles[i][j]);
                console.log("555 record " + TranslTitles[0][0]);
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

                /* get translators */
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

        /* --------------------------- End translator Track ----------------------------- */


        var genderSelect = rowdata.gender;
        console.log("genderSelect " + genderSelect);
        $('#genderSelect').val(rowdata.gender);


        /* --------------------------- Publisher Data ----------------------------- */


        var publisherId = rowdata.publisherID;
        console.log("publisherId ", publisherId);


        var pubURL = "./PublisherDataServlet?publisherId=" + publisherId;
        $.ajax({
            url: pubURL,
//                        data: formData,
            type: 'get',
            success: function (data, status, xhr) {
                console.log("Success data fromPublisherDataServlet");
                console.log(data);
                Object.keys(data.aaData[0])
                        .forEach(function eachKey(key) {
                            console.log(key); // alerts key 
                            console.log(data.aaData[0][key]); // alerts value
                        });
                var ts = new Date(data.aaData[0]["DateModified"]);
                console.log(ts.toDateString());
                console.log(ts.toLocaleDateString());
                console.log(ts.toLocaleTimeString());
                document.getElementById("Company").value = data.aaData[0]["Company"];
                document.getElementById("Company_Number").value = data.aaData[0]["Company_Number"];
                document.getElementById("Address1").value = data.aaData[0]["Address1"];
                document.getElementById("Address2").value = data.aaData[0]["Address2"];
                document.getElementById("Address3").value = data.aaData[0]["Address3"];
                document.getElementById("Address4").value = data.aaData[0]["Address4"];
                document.getElementById("postCode").value = data.aaData[0]["postCode"];
                document.getElementById("City").value = data.aaData[0]["City"];
                document.getElementById("country").value = data.aaData[0]["Country"];
                document.getElementById("countryCode").value = data.aaData[0]["CountryCode"];
                document.getElementById("Telephone").value = data.aaData[0]["Telephone"];
                document.getElementById("Fax").value = data.aaData[0]["Fax"];
                document.getElementById("Email").value = data.aaData[0]["Email"];
                document.getElementById("WWW").value = data.aaData[0]["WWW"];
                document.getElementById("doNotMail").value = data.aaData[0]["DoNotMail"];
//                            document.getElementById("lupdate").value = ts.toDateString();
                document.getElementById("lupdateD").innerHTML = ts.toLocaleDateString();
                document.getElementById("lupdateT").innerHTML = ts.toLocaleTimeString();
            },
            error: function (xhr) {
                alert("Error");
//                            $('#edtModal').show();
                //error handling
            }
        });

        /* --------------------------- Press Coverage ----------------------------- */

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

        /* --------------------------- Expert Reader ----------------------------- */


        console.log("000 loadExpertReader");
        var expertReaderName = "";
        console.log("000 expertReaderName .length " + rowdata.expertReaderList.length);
        if (rowdata.expertReaderList.length > 0) {

            $('#additionalExpertReader').empty();
            expertReaderName = rowdata.expertReaderList;
            console.log("000 expertReaderName  IF " + expertReaderName);
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
                    var readerReportLink = 'http://localhost' + expertReaderName[i][2] + '';
                    console.log("676767 expertReaderName[i][2]  " + expertReaderName[i][2]);
                    var readersReportElementID = "appReadersReport" + i;
                    console.log("676767 readersReportElementID  " + readersReportElementID);
                    console.log("676767 readerReportLink  " + readerReportLink);
                    document.getElementById(readersReportElementID).href = readerReportLink;
                    var readerInvoiceLink = 'http://localhost' + expertReaderName[i][7] + '';
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
        } else {
            $('#additionalExpertReader').empty();
        }

        console.log("000 expertReaderName");
        console.log(expertReaderName);
        console.log("000 expertReaderName  " + expertReaderName + " ReferenceNumber" + rowdata.ReferenceNumber);
        console.log("000 ReferenceNumber" + rowdata.ReferenceNumber);
        document.getElementById("unassignedERRefNo").value = rowdata.ReferenceNumber;
        document.getElementById("NewAssignedERRefNo").value = rowdata.ReferenceNumber;
        /*
         * get the whole List with the arrays  
         * no of arrays = expertReaderName.length
         */


        if (cntr === 1) {

            //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
            $('#additionalExpertReader').empty(); // empty the div before fetching and adding new data

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
                    var readerReportLink = 'http://localhost:8080' + expertReaderName[i][2] + '';
                    console.log("676767 expertReaderName[i][2]  " + expertReaderName[i][2]);
                    var readersReportElementID = "appReadersReport" + i;
                    console.log("676767 readersReportElementID  " + readersReportElementID);
                    console.log("676767 readerReportLink  " + readerReportLink);
                    document.getElementById(readersReportElementID).href = readerReportLink;
                    var readerInvoiceLink = 'http://localhost:8080' + expertReaderName[i][7] + '';
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
        console.log(" AAAA translators.length " + translators.length);
        console.log(" AAAA translators " + translators);
        $("#translatorArray").val(translators);
        if (translators.length > 0) {

            document.getElementById("translatorRemedy").style.display = 'none';
            for (var i = 0; i < translators.length; i++) {

                var j = i + 1;
                if (i === 0) {

                    rightsAgreementContractsNavContent += '<div class="tab-pane fade in active" id="tn' + j + '">';
                } else {

                    rightsAgreementContractsNavContent += '<div class="tab-pane fade" id="tn' + j + '">';
                }


                rightsAgreementContractsNavContent += '<div class="container wrapperContainer">';
                /*
                 * CV
                 */

                rightsAgreementContractsNavContent += '<div class="row" style="margin-bottom: 10px;">';
                rightsAgreementContractsNavContent += '<div style=" margin: 0 auto; position: relative;">';
                rightsAgreementContractsNavContent += '<div class="col-md-9"  id="cvToggle' + j + '" style="margin-bottom: 10px; position:absolute; z-index:0;">';
                rightsAgreementContractsNavContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadCV' + j + '"></strong></div>';
                rightsAgreementContractsNavContent += '<br/>';
                rightsAgreementContractsNavContent += '<div class="col-sm-5">';
                rightsAgreementContractsNavContent += '<label id="uploadCV" class="control-label pull-left"></label>';
                rightsAgreementContractsNavContent += '<label  class="control-label pull-left">Nothing has been uploaded!</label>';
                rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 

                rightsAgreementContractsNavContent += '<div class="col-md-3" id="cv_button' + j + '" style="margin-bottom: 10px; position:absolute; z-index:1; display:none;"> ';
                rightsAgreementContractsNavContent += '<label  class="control-label pull-left">&nbsp;</label>';
                rightsAgreementContractsNavContent += '<div class="panel panel-default">';
                rightsAgreementContractsNavContent += '<div class="panel-body">';
                rightsAgreementContractsNavContent += '<label class="control-label pull-left" id="cv_button_label' + j + '" ></label>';
                rightsAgreementContractsNavContent += '<br/><br/>';
                rightsAgreementContractsNavContent += '<div class="input-group cv_buttonText pull-left">';
                rightsAgreementContractsNavContent += '<a class="btn btn-info btn-file pull-left" role="button" id="cv_link' + j + '" href=""  target="_blank">';
                rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-file"></span>';
                rightsAgreementContractsNavContent += 'Click to open</a>';
                rightsAgreementContractsNavContent += '</div>'; //panel-body
                rightsAgreementContractsNavContent += '</div>'; //panel 
                rightsAgreementContractsNavContent += '</div>';
                rightsAgreementContractsNavContent += '</div>'; // -- col-md-10--

                rightsAgreementContractsNavContent += '</div>'; //-- position:relative;--

                /**
                 * start    Literature Ireland Staff Option
                 */
                rightsAgreementContractsNavContent += '<div class="col-md-8  col-md-offset-3 pull-left" style="margin-bottom: 10px;"> ';
                rightsAgreementContractsNavContent += '<label  class="control-label pull-left">Literature Ireland Staff option</label>';
                rightsAgreementContractsNavContent += ' <div class="panel panel-default">';
                rightsAgreementContractsNavContent += '<div class="panel-body">';
                rightsAgreementContractsNavContent += '<div class="input-group translatorcv pull-left">';
                rightsAgreementContractsNavContent += '<label for="translator_cv' + j + '"  class="control-label pull-left">Upload / Replace CV</label>';
                rightsAgreementContractsNavContent += '<br/><br/>';
                rightsAgreementContractsNavContent += '<label class="btn btn-success btn-file pull-left">';
                rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                rightsAgreementContractsNavContent += '&nbsp; Upload / Replace <input type="file" onchange="generatedLabels()" name="Translator_CV-' + j + '" id="translator_cv' + j + '">';
                rightsAgreementContractsNavContent += '</label>';
                rightsAgreementContractsNavContent += '<input id="label_translator_cv' + j + '"  class="pull-left"/>';
                rightsAgreementContractsNavContent += '<input type="hidden"  id="translator_cv_upload' + j + '" value="Translator_CV" name="destination">';
                rightsAgreementContractsNavContent += '<label for="Translator_CV' + j + '" class="validation_error_message help-block"></label> ';
                rightsAgreementContractsNavContent += '</div>'; //panel-body
                rightsAgreementContractsNavContent += '</div>'; //panel-body
                rightsAgreementContractsNavContent += '</div>'; //panel
                rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                rightsAgreementContractsNavContent += '</div>'; //class="col-md-4"
                /**
                 * end
                 */

//                rightsAgreementContractsNavContent += '</div>'; // row

                /*
                 * Contract with translator
                 */

                rightsAgreementContractsNavContent += '<div class="row" style="margin-bottom: 10px;">';

                rightsAgreementContractsNavContent += '<div style=" margin: 0 auto; position: relative; ">';

                rightsAgreementContractsNavContent += '<div class="col-md-9"  id="contractToggle' + j + '" style="margin-bottom: 10px; position:absolute; z-index:0;">';
                rightsAgreementContractsNavContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadContract' + j + '"></strong></div>';
                rightsAgreementContractsNavContent += '<br/><br/>';
                rightsAgreementContractsNavContent += '<div class="col-sm-5">';
                rightsAgreementContractsNavContent += '<label id="uploadContract" class="control-label pull-left"></label>';
                rightsAgreementContractsNavContent += '<label  class="control-label pull-left">Nothing has been uploaded!</label>';

                rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9" 

                rightsAgreementContractsNavContent += '<div class="col-md-3" id="contract_button' + j + '" style="margin-bottom: 10px; position:absolute; z-index:1; display:none;"> ';
                rightsAgreementContractsNavContent += ' <div class="panel panel-success">';
                rightsAgreementContractsNavContent += '<div class="panel-body">';
                rightsAgreementContractsNavContent += '<label class="control-label pull-left" id="contract_button_label' + j + '" ></label>';
                rightsAgreementContractsNavContent += '<br/><br/>';
                rightsAgreementContractsNavContent += '<div class="input-group contract_buttonText pull-left">';
                rightsAgreementContractsNavContent += '<a class="btn btn-info btn-file pull-left" role="button" id="contract_link' + j + '" href=""  target="_blank">';
                rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-file"></span>';
                rightsAgreementContractsNavContent += 'Click to open</a>';
                rightsAgreementContractsNavContent += '</div>'; //panel-body
                rightsAgreementContractsNavContent += '</div>'; //panel 
                rightsAgreementContractsNavContent += '</div>';
                rightsAgreementContractsNavContent += '</div>'; // -- col-md-10--

                rightsAgreementContractsNavContent += '</div>'; //-- position:relative;--

                /**
                 * start    Literature Ireland Staff Option
                 */
                rightsAgreementContractsNavContent += '<div class="col-md-8  col-md-offset-3 pull-left" style="margin-bottom: 10px;"> ';
                rightsAgreementContractsNavContent += '<label  class="control-label pull-left">Literature Ireland Staff option</label>';
                rightsAgreementContractsNavContent += ' <div class="panel panel-default">';
                rightsAgreementContractsNavContent += '<div class="panel-body">';

                rightsAgreementContractsNavContent += '<div class="input-group contract pull-left">';
                rightsAgreementContractsNavContent += '<label for="translator_contract' + j + '"  class="control-label pull-left">Upload / Replace Contract</label>';
                rightsAgreementContractsNavContent += '<br/><br/>';
                rightsAgreementContractsNavContent += '<label class="btn btn-success btn-file pull-left">';
                rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
                rightsAgreementContractsNavContent += '&nbsp; Upload / Replace <input type="file" onchange="generatedLabels()" name="Contract-' + j + '" id="translator_contract' + j + '">';
                rightsAgreementContractsNavContent += '</label>';
                rightsAgreementContractsNavContent += '<input  type="text" id="label_translator_contract' + j + '" class="pull-left"/>';
                rightsAgreementContractsNavContent += '<input type="hidden" value="Contract" name="destination" id="contract_upload' + j + '""/>';
                rightsAgreementContractsNavContent += ' <span class="help-block"></span> ';
                rightsAgreementContractsNavContent += '</div>'; //panel-body
                rightsAgreementContractsNavContent += '</div>'; //panel-body
                rightsAgreementContractsNavContent += '</div>'; //panel
                rightsAgreementContractsNavContent += '</div>'; //<div class="input-group agreement" 
                rightsAgreementContractsNavContent += '</div>';//class="col-md-4"
                /**
                 * end
                 */


                rightsAgreementContractsNavContent += '</div>'; // row

                rightsAgreementContractsNavContent += '</div>'; // class="container wrapperContainer"



                rightsAgreementContractsNavContent += '</div>'; //  --container--
                rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"
            }
        } else {
            /**
             * translators.length > 0
             */
            rightsAgreementContractsNavContent += '<div class = "panel panel-default tab-content pull-left col-md-5">';
            rightsAgreementContractsNavContent += '<div class="panel-heading panel-heading-translationRightsHolder"> ';
            rightsAgreementContractsNavContent += '<div class = "panel-body">';
            rightsAgreementContractsNavContent += '<div class="container">';
            rightsAgreementContractsNavContent += '<div class="row" style="margin-bottom: 80px;">';
            rightsAgreementContractsNavContent += '<div style=" margin: 0 auto; position: relative;">';
            rightsAgreementContractsNavContent += '<div class="col-md-9"   style="margin-bottom: 40px; position:absolute; z-index:0;">';
            rightsAgreementContractsNavContent += '<label class="control-label pull-left">No translators have been assigned!</label>';
            rightsAgreementContractsNavContent += '<br/><br/>';
            rightsAgreementContractsNavContent += '<div class="container-fluid pull-left">';
            rightsAgreementContractsNavContent += ' <span class="label" style="text-align: center; color: black">';
            rightsAgreementContractsNavContent += '<a><i style="font-size: 25px;" class="glyphicon glyphicon-arrow-down"></i></a> ';
            rightsAgreementContractsNavContent += '<span> &nbsp; You can remedy that below &nbsp;</span>';
            rightsAgreementContractsNavContent += '<a><i style="font-size: 25px;" class="glyphicon glyphicon-arrow-down"></i></a> ';
            rightsAgreementContractsNavContent += '</span>';
            rightsAgreementContractsNavContent += '</div>';
            rightsAgreementContractsNavContent += '<br/><br/>';
            rightsAgreementContractsNavContent += '</div>'; //<div class="col-md-9"   style="margin-bottom: 40px; position:absolute; z-index:0" 
            rightsAgreementContractsNavContent += '</div>'; //<div style=" margin: 0 auto; position: relative" 
            rightsAgreementContractsNavContent += '</div>'; //<div class="row" style="margin-bottom: 80px" 
            rightsAgreementContractsNavContent += '</div>'; //<div class="container"" 
            rightsAgreementContractsNavContent += '</div>'; //<div class = "panel-body" 
            rightsAgreementContractsNavContent += '</div>'; //<div class = "panel-body" 
            rightsAgreementContractsNavContent += '</div>'; //<div class = "panel-body" 

            rightsAgreementContractsNavContent += '</div>'; //class="panel-heading panel-heading-translationRightsHolder pull-left
//                        rightsAgreementContractsNavContent += '</div>'; // row

            document.getElementById("translatorRemedy").style.display = 'block';

        }

        $(rightsAgreementContractsNavContent).appendTo('#tnc');

        console.log("rightsHolderArray.length " + rightsHolderArray.length); //2
        console.log("AAAA rightsHolderArray " + rightsHolderArray);

        /**
         * Translation Rights Holder
         * 
         * Agreement with the translation rights holder
         */

        agreementTranslationRightsHolderContent += '<div class="container wrapperContainer">';
        agreementTranslationRightsHolderContent += '<div class="row" style="margin-bottom: 10px;">';
        agreementTranslationRightsHolderContent += '<div style=" margin: 0 auto; position: relative;">';
        agreementTranslationRightsHolderContent += '<div class="col-md-6"  id="agreementToggle1" style="margin-bottom: 10px;position:absolute; z-index:0;">';
        agreementTranslationRightsHolderContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadAgreement' + j + '"></strong></div> ';
        agreementTranslationRightsHolderContent += '<br/>';
        agreementTranslationRightsHolderContent += '<div class="margin-bottom: 40px"></div>';
        agreementTranslationRightsHolderContent += '<div class="col-sm-12">';
        agreementTranslationRightsHolderContent += '<label class="control-label pull-left"></label>';
        agreementTranslationRightsHolderContent += ' <div class="panel  panel-default">';
        agreementTranslationRightsHolderContent += '<div class="panel-body">';
        agreementTranslationRightsHolderContent += '<div class="input-group agreement_buttonText pull-left" style="width: 190px; hight: 34px" >';
        agreementTranslationRightsHolderContent += '<a class="btn btn-info btn-warning pull-left" role="button" id="uploadAgreement">';
        agreementTranslationRightsHolderContent += '<span class="glyphicon glyphicon-info-sign">&nbsp;</span>';
        agreementTranslationRightsHolderContent += 'No Agreement has been uploaded!</a>';
        agreementTranslationRightsHolderContent += '</div>'; //input-group agreement_buttonText 
        agreementTranslationRightsHolderContent += '</div>'; //panel 
        agreementTranslationRightsHolderContent += '</div>'; //panel-body
        agreementTranslationRightsHolderContent += '</div>'; //panel 
        agreementTranslationRightsHolderContent += '</div>'; //<div class="col-sm-12" 
        agreementTranslationRightsHolderContent += '</div>'; //class="col-md-6"

        console.log(" agreementTranslationRightsHolderContent " + j);
        agreementTranslationRightsHolderContent += '<div class="col-md-6" id="agreement_button1" style="margin-bottom: 10px; position:absolute; z-index:1; display:none;"> ';
        agreementTranslationRightsHolderContent += '<label  class="control-label pull-left">&nbsp;&nbsp;</label>';
        agreementTranslationRightsHolderContent += ' <div class="panel panel-default">';
        agreementTranslationRightsHolderContent += '<div class="panel-body">';
        agreementTranslationRightsHolderContent += '<div class="input-group Agreement pull-left">';
        agreementTranslationRightsHolderContent += '<label  class="control-label pull-left" id="agreement_button_label1" ></label>';
        agreementTranslationRightsHolderContent += '<br/>';
        agreementTranslationRightsHolderContent += '<div class="input-group agreement_buttonText pull-left">';
        agreementTranslationRightsHolderContent += '<a class="btn btn-info btn-file pull-left" role="button" id="agreement_link1" href=""  target="_blank">';
        agreementTranslationRightsHolderContent += '<span class="glyphicon glyphicon-file"></span>';
        agreementTranslationRightsHolderContent += 'Click to open</a>';
        agreementTranslationRightsHolderContent += '</div>'; //panel-body
        agreementTranslationRightsHolderContent += '</div>'; //panel 
        agreementTranslationRightsHolderContent += '</div>'; //<div class="input-group agreement" 
        agreementTranslationRightsHolderContent += '</div>'; // class="col-md-6"

        agreementTranslationRightsHolderContent += '</div>'; //-- position:relative;--


        /**
         * start    Literature Ireland Staff Option
         */
        agreementTranslationRightsHolderContent += '<div class="col-md-6 pull-right" style="margin-bottom: 10px;"> ';
        agreementTranslationRightsHolderContent += '<label  class="control-label pull-left">Literature Ireland Staff option</label>';
        agreementTranslationRightsHolderContent += ' <div class="panel  panel-default">';
        agreementTranslationRightsHolderContent += '<div class="panel-body">';
        agreementTranslationRightsHolderContent += '<div class="input-group Agreement pull-left">';
        agreementTranslationRightsHolderContent += '<label class="control-label pull-left">Upload / Replace agreement with translation rights holder</label>';
        agreementTranslationRightsHolderContent += '<br/>';
        agreementTranslationRightsHolderContent += '<label class="btn btn-success btn-file pull-left">';
        agreementTranslationRightsHolderContent += '<span class="glyphicon glyphicon-folder-open"></span>';
        agreementTranslationRightsHolderContent += '&nbsp; Upload / Replace agreement <input type="file" onchange="generatedLabels()" name="Agreement-1" id="agreement1">';
        agreementTranslationRightsHolderContent += '</label>';
        agreementTranslationRightsHolderContent += '<input  type="text" id="label_agreement1" class="pull-left"/>';
        agreementTranslationRightsHolderContent += '<input type="hidden" value="Agreement" name="destination" id="agreement_upload1"/>';
        agreementTranslationRightsHolderContent += ' <span class="help-block"></span> ';
        agreementTranslationRightsHolderContent += '</div>'; //panel 
        agreementTranslationRightsHolderContent += '</div>'; //panel-body
        agreementTranslationRightsHolderContent += '</div>'; //panel 
        agreementTranslationRightsHolderContent += '</div>'; //<div class="input-group agreement" 
        agreementTranslationRightsHolderContent += '</div>'; //class="col-md-5"
        /**
         * end
         */


        agreementTranslationRightsHolderContent += '</div>'; // row

        $(agreementTranslationRightsHolderContent).appendTo('#agreementTranslationRightsHolder');

        /*
         * Addendum to the rights agreement
         */

        addendumAgreementTranslationRightsHolder += '<div class="container wrapperContainer">';
        addendumAgreementTranslationRightsHolder += '<div class="row" style="margin-bottom: 10px;">';
        addendumAgreementTranslationRightsHolder += '<div style=" margin: 0 auto; position: relative; ">';
        addendumAgreementTranslationRightsHolder += '<div class="col-md-6"  id="addendumToggle' + j + '"  style="margin-bottom: 40px; margin-top: 14px; position:absolute; z-index:0; ">';
        addendumAgreementTranslationRightsHolder += '<div  style="margin-bottom: 10px;"><strong class="pull-left" id="uploadAddendum' + j + '" ></strong> </div>';
        addendumAgreementTranslationRightsHolder += '<br/>';
        addendumAgreementTranslationRightsHolder += '<div class="margin-bottom: 40px"></div>';
        addendumAgreementTranslationRightsHolder += '<div class="col-sm-12">';
        addendumAgreementTranslationRightsHolder += '<label class="control-label pull-left"></label>';
        addendumAgreementTranslationRightsHolder += ' <div class="panel  panel-default">';
        addendumAgreementTranslationRightsHolder += '<div class="panel-body">';
        addendumAgreementTranslationRightsHolder += '<div class="input-group addendum_buttonText pull-left" style="width: 190px; hight: 34px" >';
        addendumAgreementTranslationRightsHolder += '<a class="btn btn-info btn-warning pull-left" role="button" id="uploadAddendum">';
        addendumAgreementTranslationRightsHolder += '<span class="glyphicon glyphicon-info-sign">&nbsp;</span>';
        addendumAgreementTranslationRightsHolder += 'No Addendum has been uploaded!</a>';
        addendumAgreementTranslationRightsHolder += '</div>'; //input-group addendum_buttonText 
        addendumAgreementTranslationRightsHolder += '</div>'; //panel 
        addendumAgreementTranslationRightsHolder += '</div>'; //panel-body
        addendumAgreementTranslationRightsHolder += '</div>'; //panel 
        addendumAgreementTranslationRightsHolder += '</div>'; //<div class="col-sm-12" 
        addendumAgreementTranslationRightsHolder += '</div>'; //class="col-md-6"

        addendumAgreementTranslationRightsHolder += '<div class="col-md-6" id="addendum_button' + j + '"  style="margin-bottom: 40px; position:absolute;z-index:1; display:none;">  ';
        addendumAgreementTranslationRightsHolder += '<label  class="control-label pull-left">&nbsp;&nbsp;</label>';
        addendumAgreementTranslationRightsHolder += ' <div class="panel panel-success">';
        addendumAgreementTranslationRightsHolder += '<div class="panel-body">';
        addendumAgreementTranslationRightsHolder += '<label  class="control-label pull-left" id="addendum_button_label' + j + '" ></label>';
        addendumAgreementTranslationRightsHolder += '<br/>';
        addendumAgreementTranslationRightsHolder += '<div class="input-group addendum_buttonText pull-left">';
        addendumAgreementTranslationRightsHolder += '<a class="btn btn-info btn-file pull-left" role="button" id="addendum_link' + j + '" href=""  target="_blank">';
        addendumAgreementTranslationRightsHolder += '<span class="glyphicon glyphicon-file"></span>';
        addendumAgreementTranslationRightsHolder += 'Click to open</a>';
        addendumAgreementTranslationRightsHolder += '</div>'; //panel-body
        addendumAgreementTranslationRightsHolder += '</div>'; //panel
        addendumAgreementTranslationRightsHolder += '</div>';
        addendumAgreementTranslationRightsHolder += '</div>'; // -- col-md-3--

        addendumAgreementTranslationRightsHolder += '</div>'; //-- position:relative;--

        /**
         * start    Literature Ireland Staff Option
         */
        addendumAgreementTranslationRightsHolder += '<div class="col-md-6 pull-right" style="margin-bottom: 40px;"> ';
        addendumAgreementTranslationRightsHolder += '<label  class="control-label pull-left">Literature Ireland Staff option</label>';
        addendumAgreementTranslationRightsHolder += ' <div class="panel  panel-default">';
        addendumAgreementTranslationRightsHolder += '<div class="panel-body">';
        addendumAgreementTranslationRightsHolder += '<label class="control-label pull-left">Upload / Replace addendum to agreement with translation rights holder</label>';
        addendumAgreementTranslationRightsHolder += '<br/>';
        addendumAgreementTranslationRightsHolder += '<label class="btn btn-success btn-file pull-left">';
        addendumAgreementTranslationRightsHolder += '<span class="glyphicon glyphicon-folder-open"></span>';
        addendumAgreementTranslationRightsHolder += '&nbsp; Upload / Replace addendum <input type="file" onchange="generatedLabels()" name="Addendum-1" id="addendum1">';
        addendumAgreementTranslationRightsHolder += '</label>';
        addendumAgreementTranslationRightsHolder += '<input  type="text" id="label_addendum1" class="pull-left"/>';
        addendumAgreementTranslationRightsHolder += '<input type="hidden" value="addendumAgreement" name="destination" id="addendum_upload1"/>';
        addendumAgreementTranslationRightsHolder += ' <span class="help-block"></span> ';
        addendumAgreementTranslationRightsHolder += '</div>'; //panel-body
        addendumAgreementTranslationRightsHolder += '</div>'; //panel 
        addendumAgreementTranslationRightsHolder += '</div>'; //<div class="input-group agreement" 
        addendumAgreementTranslationRightsHolder += '</div>';//class="col-md-5"
        /**
         * end
         */

        addendumAgreementTranslationRightsHolder += '</div>'; // row

        $(addendumAgreementTranslationRightsHolder).appendTo('#addendumAgreementTranslationRightsHolder');
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
//            console.log("555transArray  #################   j  " + j + " i " + i);
//            console.log("555transArray  #################   translators", translators);
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
                document.getElementById("cv_button_label" + w).innerHTML = 'Open copy of the CV'; // + translatorNamesForGenerateTranslatorTab[j];
                document.getElementById('cv_link' + w).href = "http://localhost" + linkArray[2].trim() + " ";
                console.log("8 xyz linkArray[3]  " + linkArray[3]);
                document.getElementById("contract_button_label" + w).innerHTML = 'Open copy of the contract'; // + translatorNamesForGenerateTranslatorTab[j];
                document.getElementById('contract_link' + w).href = "http://localhost" + linkArray[3].trim() + " ";
            }

            w++; // next translator

        }

        /*
         * 3: Fill the tabs - Rights Agreement
         */

        console.log("8 xyz  rowdata.rightsAgreement.length 3: Fill the tabs - Rights Agreement :" + rowdata.rightsAgreement.length);
        for (var j = 0; j < rowdata.rightsAgreement.length; j++) {

            var rightsAgreementArray = rowdata.rightsAgreement[j].split(",");
            var translators = rowdata.TranslatorName;
            console.log("8 xyz  rightsAgreementArray 3: Fill the tabs - Rights Agreement :");
            console.log(rightsAgreementArray);
            console.log("8 xyz  rightsHolderArray  3: Fill the tabs - Rights Agreement");
            console.log(rightsHolderArray);
            for (var v = 0; v < rightsAgreementArray.length; v++) {

//                            console.log("8 xyz  rightsAgreementArray  :" + rightsAgreementArray[v].substr(1) + " w: " + w);
//                            console.log("8 xyz ON i " + i);
//                            console.log("8 xyz ON j " + j);
//                            console.log("8 xyz ON v " + v);
//                            console.log("8 xyz ON w " + w);
//                            console.log("8 xyz  rightsAgreementArray before switch :", rightsAgreementArray[v].substr(1) + ":"); // /documents/2020/Caldean Books/47/Agreement/SunshineTrans Ltd/agreement with the translation rights holder.docx
//                            console.log("8 xyz  rightsAgreementArray 1 before switch  :", rightsAgreementArray[v].substr(1) + ":");// /documents/2020/Caldean Books/47/Agreement/SunshineTrans Ltd/agreement with the translation rights holder.docx
//                            console.log("8 xyz  rightsAgreementArray 1 before switch  :", rightsHolderArray[0] + ":");//SunshineTrans Ltd
//                            console.log("8 xyz  rightsAgreementArray before switch j :", rightsHolderArray[j] + ":");//SunshineTrans Ltd
//                            console.log("8 xyz  rightsAgreementArray 1 before switch  :", rightsHolderArray[0][1] + ":");// u

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
                            document.getElementById('agreement_link1').href = "http://localhost" + rightsAgreementArray[v].substr(1) + " ";
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
//                            document.getElementById('uploadAgreement1').innerHTML = 'Copy of the agreement with ' + translatorNamesForGenerateTranslatorTab[j];
                        } else {
                            console.log("8 xyz case 1 toggle ");
                            $('#agreementToggle1').toggle();
                            $('#agreement_button1').toggle();
                            console.log("8 xyz  rightsAgreementArray case 1: j :", rightsHolderArray[j] + ":");
                            console.log("8 xyz  rightsAgreementArray [0]  case 1:  :", rightsHolderArray[0] + ":");
//                                        var rha = rightsHolderArray[0];
//                                        console.log("8 xyz  rightsAgreementArray rha[0] case 1:  :", rha[0] + ":");

                            document.getElementById("agreement_button_label1").innerHTML = 'Open a copy agreement with with the translation rights holder(s) <br/>'; //+ translatorNamesForGenerateTranslatorTab[j];

                        }
                        break;
//                        }
//                    case 2:
                        // Contract

//                        if (rightsAgreementArray[v].substr(1) !== 'null') {
//
//                            document.getElementById('contract_link' + w).href = "http://localhost:8080" + rightsAgreementArray[v].substr(1) + " ";
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
//                                        document.getElementById('agreement_link' + w).href = "http://localhost:8080" + rightsAgreementArray[v].substr(1) + " ";
                            document.getElementById('addendum_link1').href = "http://localhost" + rightsAgreementArray[v].substr(1) + " ";
//                            document.getElementById('addendum_link' + w).href = "http://localhost:8080" + rightsAgreementArray[v].substr(1) + " ";
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

//            console.log("555transArray  #################   j  " + j + " i " + i);
//            console.log("555transArray  #################   translators", translators);
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
                $('#cvToggle' + w).toggle();
                $('#cv_button' + w).toggle();
                console.log("Toggle 1 " + w);
                console.log("translators.length " + translators.length);
                if (translators.length !== 0) {

                    var transArray = translators[0][j];
                    transArray = transArray.replace("[", "");
                    transArray = transArray.replace("]", "");
                    var linkArray = transArray.split(",");
                    console.log("8 xyz linkArray[2]  " + linkArray[2]);
                    console.log("8 xyz ON i " + i);
                    console.log("8 xyz ON j " + j);
                    console.log("8 xyz ON w " + w);
                    console.log("Toggle 2 " + w);
                }
//                document.getElementById("cv_button_label" + w).innerHTML = 'Open copy of the CV for ' + translatorNamesForGenerateTranslatorTab[j];
//                document.getElementById('cv_link' + w).href = "http://localhost:8080" + linkArray[2].trim() + " ";

            }
            console.log("8 xyz ON i " + i);
            console.log("8 xyz ON j " + j);
            console.log("8 xyz ON w " + w);
            w++; // next translator

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

/* applicationsTable */
$(document).ready(function () {
    'use strict';
    oTable = $("#applications").DataTable({
        "initComplete": function (settings, json) {
            /*
             * Kick off global search with Enter/Return => keyCode === 13
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
            "url": "./SearchServlet",
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
                        console.log("bookTitle  " + data);
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
                        console.log("Author  " + data);
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
/*
 * 
 * Stacked modals
 * https://codepen.io/anon/pen/ZJgLGz
 */

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
            if (s.options[i].text === "Paid") {
                document.getElementById("SendPaidEmailtoPublisherToggle").style.display = "inline";
            } else {
                document.getElementById("SendPaidEmailtoPublisherToggle").style.display = "none";
            }
            return;
        }
    }
}


$(document).ready(function () {
    $('#paymentStatus').on('change', function () {
        var paymentStatus = $(this).find("option:selected").val();
        console.log("13132 selectedD " + paymentStatus);
        if (paymentStatus === "Paid") {
            document.getElementById("SendPaidEmailtoPublisherToggle").style.display = "inline";
        } else {
            document.getElementById("SendPaidEmailtoPublisherToggle").style.display = "none";
        }
    });
});
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


function reply_click(clicked_id)
{
    document.getElementById("ApproveWithdrawnReject").value = clicked_id;
    console.log("ApproveWithdrawnReject  " + clicked_id);
    document.getElementById("award").checked = true;
    /*
     * When an award is made, the application becomes both 'approved' and 'pending'.
     * When an application is rejected, it becomes both 'rejected' and 'closed'.
     */


    var elementChangeStatus = "";
    var element = document.getElementById("Approved");
    element.classList.remove("approved");
    var element = document.getElementById("Withdrawn");
    element.classList.remove("withdrawn");
    var element = document.getElementById("Rejected");
    element.classList.remove("rejected");
    /* reset Change Status selector */

    $('#changeStatus').get(0).selectedIndex = 0;
    if (clicked_id === "Approved") {

        elementChangeStatus = document.getElementById("changeStatus");
        elementChangeStatus.value = "pending";
        document.getElementById("SendApproveRejectEmailtoPublisherToggle").style.display = "inline";
        var element = document.getElementById("Approved");
        element.classList.add("approved");
        var element = document.getElementById("Withdrawn");
        element.classList.remove("withdrawn");
        var element = document.getElementById("Rejected");
        element.classList.remove("rejected");
        /* reset Change Status selector */

        $('#changeStatus').get(0).selectedIndex = 0;
    } else {
        document.getElementById("award").checked = false;
    }

    if (clicked_id === "Withdrawn") {
        document.getElementById("SendApproveRejectEmailtoPublisherToggle").style.display = "none";
        var element = document.getElementById("Withdrawn");
        element.classList.add("withdrawn");
        var element = document.getElementById("Approved");
        element.classList.remove("approved");
        var element = document.getElementById("Rejected");
        element.classList.remove("rejected");
        /* reset Change Status selector */

        $('#changeStatus').get(0).selectedIndex = 0;
    }

    if (clicked_id === "Rejected") {

        elementChangeStatus = document.getElementById("changeStatus");
        elementChangeStatus.value = "closed";
        document.getElementById("SendApproveRejectEmailtoPublisherToggle").style.display = "inline";
        var element = document.getElementById("Rejected");
        element.classList.add("rejected");
        var element = document.getElementById("Approved");
        element.classList.remove("approved");
        var element = document.getElementById("Withdrawn");
        element.classList.remove("withdrawn");
        /* reset Change Status selector */

        $('#changeStatus').get(0).selectedIndex = 0;
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


$(document).ready(function () {
    console.log("call StaffUserDataServlet");
    $.ajax({
        type: "GET",
        url: "./StaffUserDataServlet",
        dataType: "json",
        success: function (data) {
            var rs = data.aaData;
            console.log("call StaffUserDataServlet");
            console.log(rs);
            $.each(rs, function (i, obj)
            {
                var optionValue = '<%= "' + rs[i].Full_NAME + '"%>';
                var div_data = '<option value="' + rs[i].EMAIL + '">' + rs[i].Full_NAME + '</option>';
                $(div_data).appendTo('#from');
                console.log("call StaffUserDataServlet optionValue");
                console.log(optionValue);
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
            'https://cdn.ckeditor.com/4.12.1/full-all/contents.css',
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
    $('#selectTemplate').fileTree({root: '/home/glassfish/glassfish/domains/domain1/docroot/templates/', script: 'connectors/jqueryFileTree.jsp'}, function (file) {
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
        $('#changeStatus').get(0).selectedIndex = 0;
    });
}
);
$(window).bind("beforeunload", function () {
    var username = document.getElementById("username1").value;
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
    console.log("username welcome_Staff ", username);
    document.getElementById("username4").value = username;
});
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

/*
 * generateTranslatorTab
 */
function  generateTranslatorTab(indicator) {

    if (indicator === 0) {

        // if we have a final list of translators (more than one)
        // we need to clear a possible existing tab

        $('#tnc').empty(); // empty the div before fetching and adding new data
        $('#tn').empty(); // empty the div before fetching and adding new data

    }

    $('#tnc').empty(); // empty the div before fetching and adding new data
    $('#tn').empty(); // empty the div before fetching and adding new data

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
        console.log("processFirstTranslator generateTranslatorTab Upload a copy of the CV i " + i + " j " + j + " :: " + translatorArray[i]);
        /*
         * Upload a copy of the CV
         */
//        rightsAgreementContractsNavContent += '<div class="col-md-8" style="margin-bottom: 40px">';
//        rightsAgreementContractsNavContent += '<div class="form-group has-feedback"> ';
//        rightsAgreementContractsNavContent += '<label for="translator_cv' + j + '" class="control-label pull-left" >Upload a copy of ' + translatorArray[i] + '\'s CV:</label>';
//        rightsAgreementContractsNavContent += ' <small class="pull-left" style="margin-bottom: 10px"></small>';
//        rightsAgreementContractsNavContent += '<div class="input-group translatorcv pull-left">';
//        rightsAgreementContractsNavContent += '<label class="input-group-addon btn btn-default btn-file">';
//        rightsAgreementContractsNavContent += 'Select file <input type="file" onchange="generatedLabels()" name="Translator_CV-' + j + '" id="translator_cv' + j + '">';
//
//        rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
//        rightsAgreementContractsNavContent += '</label>';
//        rightsAgreementContractsNavContent += '<input id="label_translator_cv' + j + '" class="pull-left">';
//        rightsAgreementContractsNavContent += '</div>';
//        rightsAgreementContractsNavContent += '<input type="hidden" id="translator_cv_upload' + j + '" value="Translator_CV" name="destination">';
//        rightsAgreementContractsNavContent += '</div>';
//        rightsAgreementContractsNavContent += '<label for="Translator_CV' + j + '" class="validation_error_message help-block"></label> ';
//        rightsAgreementContractsNavContent += '</div>';
//
//
//        /*
//         * Upload a copy of the contract with
//         */
//        rightsAgreementContractsNavContent += '<div class="col-md-8">';
//        rightsAgreementContractsNavContent += '<div class="form-group has-feedback"> ';
//        rightsAgreementContractsNavContent += '<label for="label_contract' + j + '" class="control-label pull-left" >Upload a copy of the contract with ' + translatorArray[i] + '</label>';
//        rightsAgreementContractsNavContent += '<div class="input-group contract pull-left">';
//        rightsAgreementContractsNavContent += '<label class="input-group-addon btn btn-default btn-file">';
//        rightsAgreementContractsNavContent += 'Select file <input type="file" onchange="generatedLabels()" name="Contract-' + j + '" id="contract' + j + '">';
//        rightsAgreementContractsNavContent += '<span class="glyphicon glyphicon-folder-open"></span>';
//        rightsAgreementContractsNavContent += '</label>';
//        rightsAgreementContractsNavContent += '<input id="label_contract' + j + '" class="pull-left"/>';
//        rightsAgreementContractsNavContent += '</div>';
//        rightsAgreementContractsNavContent += '<input type="hidden" value="Contract" name="destination" id="contract_upload' + j + '"/>';
//        rightsAgreementContractsNavContent += '</div>';
//        rightsAgreementContractsNavContent += '<label for="Contract" class="validation_error_message help-block"></label> ';
//        rightsAgreementContractsNavContent += '</div>';


        rightsAgreementContractsNavContent += '</div  class="container EndwrapperContainer">'; // //container
        rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"

    }

    //show translatorTabs if hidden
    if ($('#translatorTabs').css('display') === 'none' || $('#translatorTabs').css("visibility") === "hidden") {
        $('#translatorTabs').show();
    }

    $(rightsAgreementContractsNavContent).appendTo('#tnc');
}

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
        for (i = 0; i < localStorage.translatorContent.length; i++) {
            console.log("restored translatorContent " + localStorage.translatorContent);
        }
    }


    /*
     * back To Translators tab
     */
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
//Translatorform

//check if Translator name has been deleted
$(document).ready(function () {
    $("#translatorName").change(function () {
        if ($('#translatorName').val() === '') {
            $('#uploadDocuments').hide();
            translatorArray = []; // clear translatorArray
            $('#tnc').empty(); // empty the div 
            $('#tn').empty(); // empty the div 
            $('#translatorTabs').hide(); // close div
            $('#translatorName').trigger('click');
            console.log(translatorArray);
        }

    });
});
// When typing Translator name change text for uploadDocuments 
$(document).ready(function () {
    $("#translatorName").keyup(function () {
        //show translatorTabs if hidden
        if ($('#uploadDocuments').css('display') === 'none' || $('#uploadDocuments').css("visibility") === "hidden") {
            $('#uploadDocuments').show();
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
        if ($('#uploadDocuments').css('display') === 'none' || $('#uploadDocuments').css("visibility") === "hidden") {
            $('#uploadDocuments').show();
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
            if ($('#uploadDocuments').css('display') === 'none' || $('#uploadDocuments').css("visibility") === "hidden") {
                $('#uploadDocuments').show();
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
            $('#uploadDocuments').hide();
            translatorArray = []; // clear translatorArray
            $('#tnc').empty(); // empty the div 
            $('#tn').empty(); // empty the div 
            $('#translatorTabs').hide(); // close div
            $('#addTranslatorModala').text("Add more translators"); // reset text
            $('#translatorName').trigger('click');
            console.log(translatorArray);
        }
    });
    $('#changeStatus').get(0).selectedIndex = 0;
});
