/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* clear localStorage and sessionStorage */

localStorage.clear();
sessionStorage.clear();



/* if Publisher selected display publisherBox */

function changeFunc() {
    var selectBox = document.getElementById("functionDataset");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    if (selectedValue === 'Publisher') {
//                    $('#signupbox').hide();
        $('#publisherBox').show();
    }
}


/* show input for new Publisher name */

$(document).ready(function () {
    $('#cbnewPublisher').change(function () {
        if ($(this).is(":checked")) {
            $('#newPublisher').show();
        } else {
            $('#newPublisher').hide();
        }
    });
});


/* Tooltips */
$(document).ready(function () {
    $('input[type=text][name=Company]').tooltip({
        placement: "top",
        trigger: "hover"
    });

    $(function () {
        $('#methods').click(function () {
            $('#password').password('toggle');
        });
    });
});

/* setting checkboxes if value is true = 1  */

function CheckboxValue() {
    $(":checkbox").filter(function () {
        return this.value === "1";
    }).prop("checked", "true");
}


/* clear all checkboxes onload */

function deCheckboxValue() {
    var w = document.getElementsByTagName("input");
    for (var i = 0; i < w.length; i++) {
        if (w[i].type === 'checkbox') {
            w[i].checked = false;
        }
    }
}


/*  clear company autocomplete box and make it invisible  */

function clearCompany(checkboxElem) {
    if (checkboxElem.checked) {
        document.getElementById("company").value = "";
        document.getElementById("company").style.visibility = "hidden";
        document.getElementById("companyGlyphicon").style.visibility = "hidden";
    } else {
        document.getElementById("company").value = "";
        document.getElementById("company").style.visibility = "visible";
        document.getElementById("companyGlyphicon").style.visibility = "visible";
    }
}

function checkUserName() {
//    alert("checkUserName");
    $('#error').hide();
    if ($('#uname').val() === null || $('#uname').val() === "") {
        $('#error').show();
        $("#error").html("Username is required field.").css("color", "red");
    } else {

        $.ajax({
            type: "POST",
            url: "CheckUserName",
            data: $('#register-form').serialize(),
//            dataType: "html",
            cache: false,
            success: function (msg) {
                $('#error').show();
                $("#error").html(msg);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#error').show();
                $("#error").html(textStatus + " " + errorThrown);
            }
        });
    }
}

window.onload = function () {
    $('.selectpicker').selectpicker();
    $('.functionDataset').each(function () {
        $(this).rules('add', {
            required: true,
            messages: {
                required: "Choose a function"
            }
        });
        // scrollYou
        $('.scrollMe .dropdown-menu').scrollyou();
        prettyPrint();
    });
};



