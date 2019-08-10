

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

//gallery
//$(document).ready(function () {
function  gallery() {
    let modalId = $('#image-gallery');
    loadGallery(true, 'a.thumbnail');

    //This function disables buttons when needed
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
;
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
        if (!(password === cpassword)) {
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

//booksTable
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
            var cver = 'ILGAS/images/not-available.jpg';
        } else {
            var cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
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
            var cver = '..ILGAS/images/not-available.jpg';
            $("#showUploadCover1").show();
            $("#showUploadCover2").hide();
            document.getElementById("cover21").src = cver;
            hasCover = false;
        } else {
            // we have a cover - show cover
            $("#showUploadCover2").show();
            $("#showUploadCover1").hide();
            var cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
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
//    console.log("555 load detailsTable  ");
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
                "render": function (data) {
                    if (data !== null) {
//                                    console.log("Status  " + data);
                        return data;
                    } else {
                        return "n/a";
                    }
                }},
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
                "render": function (data, type, row) {
                    if (typeof (data) === "undefined") {
                        return "";
                    } else
                        return data;
                }},
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
            {"data": "originalLanguage",
                "render": function (data) {
                    console.log("originalLanguage  " + data);
                    return data;
                }},
            {"data": "originalPageExtent"},
            {"data": "countryOfPublication"},
            {"data": "foreignPublisher"},
            {"data": "foreignCountry"},
            {"data": "targetLanguage",
                "render": function (data) {
                    console.log("targetLanguage  " + data);
                    return data;
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
            {"data": "boardComments_Instructions",
                "render": function (data, type, row) {
                    if (typeof (data) === "undefined") {
                        return "";
                    } else
                        return data;
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
        //      alert("ReferenceNumber  " + ReferenceNumber);
        /*
         * 
         * create new URL to retrieve ALL data for detailsTable
         */


        var newUrl = "./openSingleApplicationDataServlet?ReferenceNumber=" + ReferenceNumber;
//        var detailsTableData = [];

//    function getdetailsTableData_success(detailsTableData1) {
////    alert(Object.entries(detailsTableData));
//            console.log("getdetailsTableData_success: data");
//            console.log(detailsTableData1);
//            detailsTableData = detailsTableData1;
//            return detailsTableData1;
//        }
//var tuttut = getdetailsTableData(newUrl, getdetailsTableData_success);
////        getdetailsTableData(function getdetailsTableData(response) {
////            tuttut = response;
////        });
//
////      var  rowdata = getdetailsTableData(newUrl);
//        console.log("tuttut");
//        console.log(tuttut);
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
//        console.log("rowdata1 |BB||B");
//        console.log(rowdata1);
//        console.log("rowdata1[aaData][0]");
//        console.log(rowdata1["aaData"][0]);
//        rowdata1 = rowdata1["aaData"][0];
        console.log("rowdata newUrl detailsTableData");
//       var rowdata = rowdata1;
        console.log(rowdata);
//                    var ReferenceNumber1 = rowdata1.ReferenceNumber;
//                    alert("ReferenceNumber 1 " + ReferenceNumber1);

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
        var readerInvoice = "";
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
        console.log("rowdata rowdata.Author " + rowdata.Author);
        if (rowdata.boardMeeting !== "undefined") {
            $("#appDateOfBoardMeeting").val(formatDate(rowdata.boardMeeting));
        }

        console.log("rowdata.boardMeeting " + rowdata.boardMeeting);
        $("#dateContractSenttoPublisher").val(formatDate(rowdata.contractSentToPublisher));
        $("#dateILEAcknowledgementApproved").val(formatDate(rowdata.acknowledgementApproved));
        $("#datePublishedBooksReceived").val(formatDate(rowdata.datePublishedBooksReceived));
        $("#datePaymentMadeToPublisher").val(formatDate(rowdata.datePaymentMadeToPublisher));
        var paymentReferenceNumber = rowdata.paymentReferenceNumber;
        console.log("13131 paymentReferenceNumber " + paymentReferenceNumber);
        if (paymentReferenceNumber === "null") {
            paymentReferenceNumber = "";
        }
        $("#paymentReferenceNumber").val(paymentReferenceNumber);
        var paymentStatusSelected = rowdata.paymentStatus;
        console.log("13131 paymentStatusSelected " + paymentStatusSelected);
        setSelectedIndex(document.getElementById('paymentStatus'), paymentStatusSelected);
        $("#amountApproved").val(rowdata.amountApproved);
        $("#datePublisherInformedOfMeeting").val(formatDate(rowdata.publisherInformedOfMeeting));
        if (rowdata.boardComments_Instructions === 'null') {
            $("#commentsAboutMeeting").val("Nothing entered");
        } else {
            $("#commentsAboutMeeting").val(rowdata.boardComments_Instructions);
        }

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
//        $("#commentsAboutMeeting").val(rowdata.boardComments_Instructions);
//        $("#paymentReferenceNumber").val(rowdata.paymentReferenceNumber);
        $("#ProofPaymentToTranslator").val(rowdata.proofOfPaymentToTranslator); // http://www.literatureirelandgrantapplication.com:8080undefined
        $("#BankDetailsForm").val(rowdata.bankDetailsForm); // http://www.literatureirelandgrantapplication.com:8080undefined
        $("#SignedLIContract").val(rowdata.SignedLIContract); // http://www.literatureirelandgrantapplication.com:8080undefined
        $("#salesFigures").val(rowdata.salesFigures);
//                    $("#dateUpdate").val(rowdata.foreignPublisher);

//                    ##################################################################################################################

//                    var agreemnt = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.agreement + '';
//                    $("#appAgreement").val(agreemnt);
//                    document.getElementById("agreement").href = agreemnt;
        var orig = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.original + ' ';
        console.log("7771 original " + rowdata.original);
        console.log("7771 original " + orig);
        $("#appOriginal").val(orig);
        document.getElementById("original").href = orig;
//                    var addendumRightsAgreemnt = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.addendumRightsAgreement + '';
//                    $("#appAddendumRightsAgreement").val(addendumRightsAgreemnt);
//                    document.getElementById("addendumRightsAgreement").href = addendumRightsAgreemnt;


        var proofOfPaymentToTrans = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.proofOfPaymentToTranslator + '';
        $("#appProofPaymentToTranslator").val(proofOfPaymentToTrans);
        document.getElementById("proofPaymentToTranslator").href = proofOfPaymentToTrans;
        console.log("7771  proofOfPaymentToTrans rowdata.proofOfPaymentToTranslator " + rowdata.proofOfPaymentToTranslator);

        var bankDetailsFrm = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.bankDetailsForm + '';
        $("#appBankDetailsForm").val(bankDetailsFrm);
        document.getElementById("bankDetailsForm").href = bankDetailsFrm;
        console.log("7771  bankDetailsForm rowdata.bankDetailsForm " + rowdata.bankDetailsForm);

        var signedLIContr = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.SignedLIContract + '';
        $("#appSignedLIContract").val(signedLIContr);
        document.getElementById("signedLIContract").href = signedLIContr;
        console.log("7771  SignedLIContract rowdata.SignedLIContract " + rowdata.SignedLIContract);

//        if (typeof (rowdata.cover) === "undefined") {
//            var cver = 'http://www.literatureirelandgrantapplication.com:8080/ILGAS/images/not-available.jpg';
//        } else {
//            var cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
//        }
//
//        $("#cover").val(cver);
//        document.getElementById("cover").src = cver;
//        
        if (typeof (rowdata.cover) === "undefined") {
            var cver = 'http://www.literatureirelandgrantapplication.com:8080/ILGASLocal/images/not-available.jpg';
        } else {
            var cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
        }
        var bookCover;
        $("#bookCover").val(cver);
        document.getElementById("Cover1").src = cver;
        if (typeof (rowdata.cover) === "undefined" || rowdata.cover === "") {
            console.log("rowdata.cover undefined ");
            // no cover - show upload
            var cver = '..images/not-available.jpg';
            $("#showUploadCover1").show();
            $("#showUploadCover2").hide();
            document.getElementById("cover21").src = cver;
            document.getElementById("cover").src = cver;
            hasCover = false;
        } else {
            // we have a cover - show cover
            $("#showUploadCover2").show();
            $("#showUploadCover1").hide();
            var cver = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.cover + '';
            console.log("rowdata.cover cver " + cver);

            hasCover = true;
            document.getElementById("cover").src = cver;
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



//                    var contr = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.contract + '';
//                    document.getElementById("contract").href = contr;
//                    var trans = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.translatorCV + '';
//                    document.getElementById("translatorCV").href = trans;
        var transSamp = 'http://www.literatureirelandgrantapplication.com:8080' + rowdata.copiesTranslationSample + ' ';
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
        $("#appReferenceNumber1").val(appReferenceNumber); //ok
        $("#unassignedERRefNo").val(appReferenceNumber);
        var TranslName = rowdata.TranslatorName;
        var translators = rowdata.TranslatorName;
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
                        var entry = "location.href='http://www.literatureirelandgrantapplication.com:8080" + destination + "'";
                        console.log("www.literatureirelandgrantapplication.com:8080 " + entry);
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
//        translatorTableDiv.appendChild(tble);
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
                addExpertReaderModal += '<div class="row" style="margin-bottom: 20px;margin-top: 15px"> ';
                addExpertReaderModal += '<div class="col-md-4">';
                addExpertReaderModal += '<label for="appExpertReader' + i + '" class="control-label pull-left"> Expert reader</label>';
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
                addExpertReaderModal += '<label for="sampleSentOut" class="control-label pull-left"> Sample sent out</label>';
                addExpertReaderModal += '<div class="input-group pull-left">';
                var sampleSentOut = "sampleSentOut" + i;
                console.log("sampleSentOut  " + sampleSentOut);
                addExpertReaderModal += '<input type="text" readonly name="sampleSentOut' + i + '" id="' + sampleSentOut + '" class="form-control" placeholder="DD/MM/YYYY" /> ';
                addExpertReaderModal += '<label class="input-group-addon" for="sampleSentOut' + i + '">';
                addExpertReaderModal += '<span class="glyphicon glyphicon-calendar"></span>';
                addExpertReaderModal += '</label>';
                addExpertReaderModal += '</div>';
                addExpertReaderModal += ' </div>';
                addExpertReaderModal += '<div class="col-sm-4">';
                addExpertReaderModal += '<label for="sampleReturned" class="control-label pull-left"> Sample returned</label>';
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

//                Reader’s Report
                addExpertReaderModal += '<div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">';
                addExpertReaderModal += '<div class="col-sm-2">';
                addExpertReaderModal += '<input id="ReadersReport' + i + '"';
                addExpertReaderModal += 'type="hidden"';
                addExpertReaderModal += 'name="ReadersReport"';
                addExpertReaderModal += ' >';
                addExpertReaderModal += '</div>';
                addExpertReaderModal += '<a class="btn btn-info" role="button" id="appReadersReport' + i + '"target="_blank">';
                addExpertReaderModal += '<span class="glyphicon glyphicon-file"></span>';
                addExpertReaderModal += 'Reader’s Report</a>';
                addExpertReaderModal += '</div>';

//                Reader’s Invoice
                addExpertReaderModal += '<div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">';
                addExpertReaderModal += '<div class="col-sm-2">';
                addExpertReaderModal += '<input id="ReadersInvoice' + i + '"';
                addExpertReaderModal += 'type="hidden"';
                addExpertReaderModal += 'name="ReadersInvoice"';
                addExpertReaderModal += ' >';
                addExpertReaderModal += '</div>';
                addExpertReaderModal += '<a class="btn btn-info" role="button" id="appReadersInvoice' + i + '"target="_blank">';
                addExpertReaderModal += '<span class="glyphicon glyphicon-file"></span>';
                addExpertReaderModal += 'Reader’s Invoice</a>';
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
                addExpertReaderModal += '</div>';
                addExpertReaderModal += '</div>';
                addExpertReaderModal += '</div>';
                addExpertReaderModal += '</div>';
                $(addExpertReaderModal).appendTo('#additionalExpertReaderModal');
                /* 
                 * get the data from the array
                 */

                for (var j = 0; j <= 7; ++j) {

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

                    var expertInvoiceElementID = "appReadersInvoice" + i;
                    document.getElementById(expertInvoiceElementID).href = 'http://www.literatureirelandgrantapplication.com:8080' + expertReaderName[i][7] + '';


                    console.log("rowdata readerInvoice " + expertReaderName[i][7]);


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


        // empty the div before fetching and adding new data
        $('#tn').empty();
        $('#tnc').empty();
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
        for (var i = 0; i < translators.length; i++) {

            var j = i + 1;
            if (i === 0) {

                rightsAgreementContractsNavContent += '<div class="tab-pane fade in active" id="tn' + j + '">';
            } else {

                rightsAgreementContractsNavContent += '<div class="tab-pane fade" id="tn' + j + '">';
            }



            agreementTranslationRightsHolderContent += '<div class="container wrapperContainer">';
            //Agreement with the translation rights holder
            agreementTranslationRightsHolderContent += '<div class="row" style="margin-bottom: 80px;">';
            agreementTranslationRightsHolderContent += '<div style=" margin: 0 auto; position: relative;">';
            agreementTranslationRightsHolderContent += '<div class="col-md-9"  id="agreementToggle' + j + '" style="margin-bottom: 40px; position:absolute; z-index:0;">';
            agreementTranslationRightsHolderContent += '<div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadAgreement' + j + '"></strong></div> ';
            agreementTranslationRightsHolderContent += '<br/>';
            agreementTranslationRightsHolderContent += '<div class="col-sm-5">';
            agreementTranslationRightsHolderContent += '<label id="uploadAgreement" class="control-label pull-left"></label>';
            agreementTranslationRightsHolderContent += '<label  class="control-label pull-left">Nothing has been uploaded!</label>';
            agreementTranslationRightsHolderContent += '</div>';
            agreementTranslationRightsHolderContent += '</div>'; //<div class="input-group agreement" 
            agreementTranslationRightsHolderContent += '</div>'; //<div class="col-md-9" 
            //Open Agreement with the translation rights holder
            agreementTranslationRightsHolderContent += '<div class="col-md-7" id="agreement_button' + j + '" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> ';
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

            rightsAgreementContractsNavContent += '<div class="container wrapperContainer">';

            //CV
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
            //Open CV
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

            //Contract with translator
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
            //Open Contract
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

            addendumAgreementTranslationRightsHolder += '<div class="container wrapperContainer">';
            //Addendum to the rights agreement
            addendumAgreementTranslationRightsHolder += '<div class="row" style="margin-bottom: 80px;">';
            addendumAgreementTranslationRightsHolder += '<div style=" margin: 0 auto; position: relative; ">';

            addendumAgreementTranslationRightsHolder += '<div class="col-md-12"  id="addendumToggle' + j + '"  style="margin-bottom: 40px; position:absolute; z-index:0; ">';
            addendumAgreementTranslationRightsHolder += '<div  style="margin-bottom: 10px;"><strong class="pull-left" id="uploadAddendum' + j + '" ></strong> </div>';
            addendumAgreementTranslationRightsHolder += '<br/>';
            addendumAgreementTranslationRightsHolder += '<div class="margin-bottom: 40px"></div>';
            addendumAgreementTranslationRightsHolder += '<div class="col-sm-12">';
            addendumAgreementTranslationRightsHolder += '<label id="uploadAddendum" class="control-label pull-left"></label>';
            addendumAgreementTranslationRightsHolder += '<label  class="control-label pull-left">No addendum to the rights agreement has been uploaded!</label>';


            addendumAgreementTranslationRightsHolder += '</div>'; //<div class="input-group agreement" 
            addendumAgreementTranslationRightsHolder += '</div>'; //<div class="col-md-10" 
            //Open Addendum
            addendumAgreementTranslationRightsHolder += '<div class="col-md-7" id="addendum_button' + j + '"  style="margin-bottom: 40px; position:absolute;z-index:1; display:none;">  ';
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

            rightsAgreementContractsNavContent += '</div>'; //  --container--
            rightsAgreementContractsNavContent += '</div>'; //<div class="tab-pane"
        }

        $(rightsAgreementContractsNavContent).appendTo('#tnc');
        /*
         * 3: Fill the tabs
         */


        var w = 1;
        for (var j = 0; j < rowdata.rightsAgreement.length; j++) {
            var rightsAgreementArray = rowdata.rightsAgreement[j].split(",");
            for (var v = 0; v < rightsAgreementArray.length; v++) {
                console.log("8 xyz  rightsAgreementArray  v:" + v + ":");
                switch (v) {
                    case 0:
                        // Agreement
                        console.log("8 xyz  rightsAgreementArray  :" + rightsAgreementArray[v].substr(1) + ":");
                        console.log("8 xyz  rightsAgreementArray  w:" + w + ":");
                        if (rightsAgreementArray[v].substr(1) !== 'null') {
                            console.log("8 xyz  Agreement found");
                            console.log("8 xyz case 0  [" + j + "]");
                            console.log("8 xyz  rightsAgreementArray  :" + rightsAgreementArray[v].substr(1) + ":");
                            document.getElementById('agreement_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
                        }
                        break;
                    case 1:
                        // AgreementDocName
                        console.log("8 xyz case 1 [" + j + "]");
                        if (rightsAgreementArray[v].substr(1) === 'null') {
                            console.log("8 xyz  " + translatorNamesForGenerateTranslatorTab[j]);
//                            document.getElementById('uploadAgreement' + w).innerHTML = 'Copy of the agreement with ' + translatorNamesForGenerateTranslatorTab[j];
                        } else {
                            console.log("8 xyz case 1 toggle ");
                            $('#agreementToggle' + w).toggle();
                            $('#agreement_button' + w).toggle();
                            document.getElementById("agreement_button_label" + w).innerHTML = 'Open copy agreement with the translation rights holder <br/>'; //+ translatorNamesForGenerateTranslatorTab[j];

                        }
                        break;
                    case 2:
                        // Contract

                        if (rightsAgreementArray[v].substr(1) !== 'null') {
                            console.log("8 xyz  Contract found");
                            document.getElementById('contract_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
                        }
                        break;
                    case 3:
                        // ContractDocName

                        if (rightsAgreementArray[v].substr(1) === 'null') {
//                            document.getElementById('uploadContract' + w).innerHTML = 'Copy of the contract with ' + translatorNamesForGenerateTranslatorTab[j];
                        } else {

                            $('#contractToggle' + w).toggle();
                            $('#contract_button' + w).toggle();
                            document.getElementById("contract_button_label" + w).innerHTML = 'Open copy of the contract '; //with ' + translatorNamesForGenerateTranslatorTab[j];

                        }
                        break;
                    case 4:
                        // AddendumRightsAgreement

                        if (rightsAgreementArray[v].substr(1) !== 'null') {
                            console.log("8 xyz  Addendum found");
                            document.getElementById('addendum_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + rightsAgreementArray[v].substr(1) + " ";
                        }
                        break;
                    case 5:
                        // AddendumRightsAgreementName
                        var test = rightsAgreementArray[v].substr(1).replace("]", "");
//                        test = test.replace("]", "");

//                        if (test !== null && test !== '') {
                        if (rightsAgreementArray[v].substr(1).replace("]", "") === 'null') {
//                            document.getElementById('uploadAddendum' + w).innerHTML = 'Copy of the addendum to the rights agreement ';// + translatorNamesForGenerateTranslatorTab[j];
                        } else {
                            console.log("8 xyz  Addendum found  test:" + test);
                            $('#addendumToggle' + w).toggle();
                            $('#addendum_button' + w).toggle();
                            document.getElementById("addendum_button_label" + w).innerHTML = 'Open copy of the addendum to the rights agreement'; // with ' + translatorNamesForGenerateTranslatorTab[j];
                        }
                        break;
                }
            }

            console.log("8 xyz  #################   translatorNamesForGenerateTranslatorTab[" + j + "]", translators[j][0]);
            console.log("8 xyz  translatorNamesForGenerateTranslatorTab[" + j + "]", translatorNamesForGenerateTranslatorTab[j]);


            // CV
            if (translatorNamesForGenerateTranslatorTab[j] === 'null') {

                console.log("8 xyz  translatorNamesForGenerateTranslatorTab[" + j + "]", translatorNamesForGenerateTranslatorTab[j]);
                document.getElementById('uploadCV' + j).innerHTML = 'Copy of the CV with ' + translatorNamesForGenerateTranslatorTab[j];

            } else {
                console.log("8 xyz ON i " + i);
                console.log("8 xyz ON j " + j);
                console.log("8 xyz ON w " + w);

                console.log("8 xyz Array translators j ", translatorNamesForGenerateTranslatorTab[j]);


                $('#cvToggle' + w).toggle();
                $('#cv_button' + w).toggle();

                var transArray = translators[j][0];

                transArray = transArray.replace("[", "");
                transArray = transArray.replace("]", "");

                var linkArray = transArray.split(",");

                console.log("8 xyz linkArray[2]  " + linkArray[2]);

                document.getElementById("cv_button_label" + w).innerHTML = 'Open copy of the CV';// + translatorNamesForGenerateTranslatorTab[j];
                document.getElementById('cv_link' + w).href = "http://www.literatureirelandgrantapplication.com:8080" + linkArray[2].trim() + " ";

            }

            w++;  // next translator

        }

    });
});

//formatDate
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

//applicationsTable
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

//https://bootsnipp.com/snippets/P2gor
//$(document).ready(function () {
//    function  gallery(){
// let modalId = $('#image-gallery');
//    loadGallery(true, 'a.thumbnail');
//    
//       //This function disables buttons when needed
//    function disableButtons(counter_max, counter_current) {
//        $('#show-previous-image, #show-next-image')
//                .show();
//        if (counter_max === counter_current) {
//            $('#show-next-image')
//                    .hide();
//        } else if (counter_current === 1) {
//            $('#show-previous-image')
//                    .hide();
//        }
//    }
//
//    /**
//     *
//     * @param setIDs        Sets IDs when DOM is loaded. If using a PHP counter, set to false.
//     * @param setClickAttr  Sets the attribute for the click handler.
//     */
//
//    function loadGallery(setIDs, setClickAttr) {
//        let current_image,
//                selector,
//                counter = 0;
//
//        $('#show-next-image, #show-previous-image')
//                .click(function () {
//                    if ($(this)
//                            .attr('id') === 'show-previous-image') {
//                        current_image--;
//                    } else {
//                        current_image++;
//                    }
//
//                    selector = $('[data-image-id="' + current_image + '"]');
//                    console.log("selector " + selector.name);
//                    updateGallery(selector);
//                });
//
//        function updateGallery(selector) {
//            let $sel = selector;
//            current_image = $sel.data('image-id');
//            console.log("current_image " + current_image);
//            var filename = $sel.data('image').replace(/^.*[\\\/]/, '');
//            $('#image-gallery-title')
//                    .text(filename);
//            console.log("current_image " + $sel.data('image'));
//            console.log("current_image filename " + filename);
//            $('#image-gallery-image')
//                    .attr('src', $sel.data('image'));
//            disableButtons(counter, $sel.data('image-id'));
//        }
//
//        if (setIDs === true) {
//            $('[data-image-id]')
//                    .each(function () {
//                        counter++;
//                        console.log("counter " + counter);
//                        $(this).attr('data-image-id', counter);
//                    });
//        }
//        $(setClickAttr)
//                .on('click', function () {
//                    updateGallery($(this));
//                });
//    }
//
//
//// build key actions
//    $(document)
//            .keydown(function (e) {
//                switch (e.which) {
//                    case 37: // left
//                        if ((modalId.data('bs.modal') || {})._isShown && $('#show-previous-image').is(":visible")) {
//                            $('#show-previous-image')
//                                    .click();
//                        }
//                        break;
//
//                    case 39: // right
//                        if ((modalId.data('bs.modal') || {})._isShown && $('#show-next-image').is(":visible")) {
//                            $('#show-next-image')
//                                    .click();
//                        }
//                        break;
//
//                    default:
//                        return; // exit this handler for other keys
//                }
//                e.preventDefault(); // prevent the default action (scroll / move caret)
//            });
//        }
//});

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

function replaceEditor() {
    alert("replaceEditor")
    var editor = CKEDITOR.replace('editor1', {
        extraPlugins: 'allowsave',
        filebrowserBrowseUrl: 'product/browseFile.jsp',
        filebrowserWindowWidth: 800,
        filebrowserWindowHeight: 500,
        width: 400,
        height: 500
    });
}

function getTemplate(template) {
    $.ajax({
        url: "templateHandler?action=openFile&filename=" + template,
        type: 'GET',
        dataType: 'text'
    }).then(function (data) {
        CKEDITOR.instances.editor1.setData(data);

    });
}

function selectTemplate() {
    $('#selectTemplate').fileTree({root: '/home/glassfish/glassfish/domains/domain1/docroot/templates/', script: '/connectors/jqueryFileTree.jsp'}, function (file) {
        $('#fileName').val(file);
        getTemplate(file);
    });
}
      