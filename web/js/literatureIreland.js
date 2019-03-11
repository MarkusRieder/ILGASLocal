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
         

  


        /* autocomplete */
        /* AutoComplete_international_publishers */
         
            $(function () {
                $("#company").autocomplete({
                    source: 'ACintPublishers_test', // The source of the AJAX results
                    dataType: 'json',
                    data: '',
                    minLength: 3, // The minimum amount of characters that must be typed before the autocomplete is triggered
                    focus: function (event, ui) { // What happens when an autocomplete result is focused on
                        $("#company").val(ui.item.name);
                        return false;
                    },
                    select: function (event, ui) { // What happens when an autocomplete result is selected
                        $("#company").val(ui.item.name);
                        $('#companyNumber').val(ui.item.id);
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
         


        /* AutoComplete_country */
         
            $(function () {
                $("#country").autocomplete({
                    source: 'AutoComplete_country', // The source of the AJAX results
                    dataType: 'json',
                    data: '',
                    minLength: 3, // The minimum amount of characters that must be typed before the autocomplete is triggered
                    focus: function (event, ui) { // What happens when an autocomplete result is focused on
                        $("#country").val(ui.item.name);
                        return false;
                    },
                    select: function (event, ui) { // What happens when an autocomplete result is selected
                        $("#country").val(ui.item.name);
                        $('#countryCode').val(ui.item.id);
                    }
                });
            });
         

        /* Tooltips */
      
            $('input[type=text][name=Company]').tooltip({
                placement: "top",
                trigger: "hover"
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
         