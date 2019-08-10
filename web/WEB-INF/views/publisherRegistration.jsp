<%-- 
    Document   : publisherRegistration
    Created on : 14-Apr-2017, 02:32:24
    Author     : markus
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html style="height: 100%" lang="en"> 
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Translation Grant Application System</title>


        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 

        <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" />

        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js" ></script>
        <script type="text/javascript"  src="js/jquery-ui.js"></script>
        <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>

        <!--AutoComplete_international_publishers-->
        <script>
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
                        $('#Company_Number').val(ui.item.id);
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
        </script>

        <!--AutoComplete_country-->
        <script>
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
        </script>

        <!-- checks for http:// in URL
             if not then URL will be preceded with http:// -->

        <!--addhttp-->
        <script type="text/javascript">
            function addhttp(url) {
                var urlValue = url.value;
                if (urlValue !== "") {
                    if (!/^(?:f|ht)tps?\:\/\//.test(urlValue)) {
                        urlValue = "http://" + urlValue;
                    }
                }
                url.value = urlValue;
                return urlValue;
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
                        <a><img src="images/flashtext-animated2.gif" height="80" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a class="logo"><span class="hidden">Literature Ireland</span></a>
                    <!--container for welcome/logout-->
                    <div class="container-fluid" style="margin-bottom: 20px; width: 100%">
                        <div class="pull-right">
                            <h6> <small>Welcome <strong>${name}</strong> - <strong>not ${name}</strong>? <a href="${pageContext.request.contextPath}/Logout">Click here to log out </a></small></h6>
                        </div>
                    </div> <!--container for welcome/logout-->
                </div> <!--  End of topbar div -->

                <div class="container-fluid" style="margin-bottom: 20px; width: 100%;">

                    <form id="newPublisherForm" 
                          name="newPublisherForm"
                          action="${pageContext.request.contextPath}/newPublisher" 
                          method="POST"  
                          role="form" 
                          >

                        <!--first row-->
                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                            <div class="col-sm-6">
                                <input  id="company" 
                                        name="Company" 
                                        type="text" 
                                        value="${publisherName}"
                                        data-toggle="tooltip"
                                        title="Please Enter your Company's Name - if it does not show up please fill in the form"
                                        class="form-control"     
                                        onblur="CheckboxValue();"
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

                            <div class="col-sm-5">
                                <div class="form-group has-feedback">
                                    <label for="Address1" class="pull-left control-label">Address field 1</label>
                                    <input id="Address1"
                                           type="text"                                
                                           class="form-control"                                
                                           name="Address1"                            
                                           placeholder="Address1"
                                           required=""
                                           >
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group has-feedback">
                                    <label for="postCode" class="pull-left control-label">Post code</label>
                                    <input id="postCode"                                
                                           type="text"                                
                                           class="form-control"                                
                                           name="postCode"          
                                           placeholder="Post Code"
                                           required=""
                                           >
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="form-group has-feedback">
                                    <label for="City" class="pull-left control-label">City</label>
                                    <input id="City"                                
                                           type="text"                                
                                           class="form-control"                                
                                           name="City"                                
                                           value=""                                
                                           placeholder="City"
                                           required=""
                                           >
                                </div>
                            </div>

                        </div> <!--row-->

                        <!--third row-->
                        <div class="row" style="margin-bottom: 10px">
                            <div class="col-sm-5">
                                <div class="form-group has-feedback">
                                    <label for="Address2" class="pull-left control-label">Address field 2</label>
                                    <input id="Address2"                                
                                           type="text"                                
                                           class="form-control"                                
                                           name="Address2"                                                               
                                           placeholder="Address2"
                                           >
                                </div>
                            </div>

                            <!--get Country via autocomplete set Country Code automatically -->
                            <div class="col-sm-5">
                                <div class="form-group has-feedback">
                                    <label for="country" class="pull-left control-label">Country</label>
                                    <input id="country"                                
                                           type="text"                                
                                           class="form-control"                                
                                           name="Country"                                
                                           value=""                                
                                           placeholder="Country"
                                           required=""
                                           >   
                                    <i class="glyphicon glyphicon-search form-control-feedback"></i>
                                </div>
                            </div>
                        </div> <!--row-->

                        <!--fourth row-->
                        <div class="row" style="margin-bottom: 10px">
                            <div class="col-sm-5">
                                <label for="Address3" class="pull-left">Address field 3</label>
                                <input id="Address3"                                
                                       type="text"                                
                                       class="form-control"                                
                                       name="Address3"                                
                                       value=""                                
                                       placeholder="Address3"
                                       >
                            </div>
                            <div class="col-sm-3">   
                                <label for="countryCode" class="pull-left">Country code</label>
                                <input id="countryCode"                                
                                       type="text"                                
                                       class="form-control"                                
                                       name="Country_Code"                                
                                       value=""                               
                                       readonly
                                       placeholder="Country Code"
                                       >
                            </div>
                        </div> <!--row-->

                        <!--fifth row-->
                        <div class="row" style="margin-bottom: 10px">
                            <div class="col-sm-5">  
                                <label for="Address4" class="pull-left">Address field 4</label>
                                <input id="Address4"                                
                                       type="text"                                
                                       class="form-control"                                
                                       name="Address4"                                
                                       value=""                                
                                       placeholder="Address4"
                                       >
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group has-feedback">
                                    <label for="Telephone" class="pull-left control-label">Telephone</label>
                                    <input id="Telephone"                                
                                           type="text"                                
                                           class="form-control"                                
                                           name="Telephone"                                
                                           value=""                                
                                           placeholder="Telephone"
                                           required=""
                                           >

                                </div>
                            </div>
                        </div> <!--row-->

                        <!--sixth row-->
                        <div class="row" style="margin-bottom: 20px">
                            <div class="col-sm-5"></div>
                            <div class="col-sm-3">
                                <input id="Fax"                                
                                       type="text"                                
                                       class="form-control"                                
                                       name="Fax"                                
                                       value=""                                
                                       placeholder="Fax Number"
                                       >
                            </div>
                        </div> <!--row-->

                        <!--seventh row-->
                        <div class="row" style="margin-bottom: 10px">

                            <div class="col-sm-5">
                                <div class="form-group has-feedback">
                                    <label for="Email" class="pull-left control-label">Email</label>
                                    <input id="Email"                                
                                           type="email"                                
                                           class="form-control"                                
                                           name="Email"                                
                                           value="${companyDetails.Email}"                                
                                           placeholder="Main Email"
                                           required
                                           >

                                </div>
                            </div>                        

                            <div class="col-sm-5">
                                <div class="form-group has-feedback">
                                    <label for="WWW" class="pull-left control-label">Web address</label>
                                    <input id="WWW"                                
                                           type="url"                                            
                                           class="form-control"                                
                                           name="WWW"    
                                           onblur ="addhttp(this)"
                                           value=""           
                                           placeholder="http://www.example.com"
                                           required=""
                                           >

                                </div>
                            </div>

                        </div> <!--row-->

                        <!--eighth row-->
                        <div class="row" style="margin-bottom: 20px">
                            <div class="col-sm-3">        
                                <input id="doNotMail" 
                                       type="checkbox" 
                                       name="doNotMail" 
                                       value="ticked"     

                                       >  
                                <label for="doNotMail">Sign up to newsletters</label>
                            </div> <!--<div class="col-sm-3">-->                                        
                        </div> <!--row-->

                        <!--ninth row-->
                        <div class="row" style="margin-bottom: 20px">
                            <div class="col-sm-3">    
                                <input id="Founded"                                
                                       type="text"                                
                                       class="form-control"                                
                                       name="Founded"                                
                                       value=""                                
                                       placeholder="Founded"
                                       >
                            </div>
                            <div class="col-sm-3">    
                                <input id="NumberOfTitles"                                
                                       type="text"                                
                                       class="form-control"                                
                                       name="NumberOfTitles"                                
                                       value=""                                
                                       placeholder="Number of Titles"
                                       >      
                            </div>
                            <div class="col-sm-3">    
                                <input id="DateModified"                                
                                       type="text"                                
                                       class="form-control"                                
                                       name="DateModified"                                
                                       value=""                                
                                       placeholder="Date modified"
                                       >
                            </div>
                        </div> <!--row-->

                        <!--last row-->
                        <div class="row">
                            <div class="col-sm-4">
                                <!--keep in one line otherwise placeholder doesn't show-->
                                <textarea id="Notes" class="form-control" style="width: 883px; height: 343px;" name="Notes" placeholder="enter optional notes"></textarea>
                            </div>
                        </div> <!--row-->

                        <div style="margin-top:10px" class="form-group">
                            <!-- Button -->
                            <div class="col-sm-12 controls">
                                <input type="submit" class="btn btn-success btn-send" value="Save Details">
                            </div> <!-- col-md-12 control -->
                        </div> <!-- form-group -->
                    </form>  <!--newPublisherForm-->

                </div> <!--container-fluid-->

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

            </div><!-- end of container div -->
            <div class="shadowbase"> </div>
        </div><!-- end of Shadowholder container div -->


        <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
            &copy; 2019 mgr Software
        </div>
        <script>
            $(document).ready(function () {
                $("#newPublisherForm").validate({
                    /*
                     * validate on onkeyup
                     * 
                     * @param {type} element
                     * @param {type} event
                     * @returns {undefined}
                     */
                    onkeyup: function (element, event) {
                        console.log("newPublisherFormvalidate  element " + element + " event " + event);
                        if (event.which === 9 && this.elementValue(element) === "") {
                            return;
                        } else {
                            this.element(element);
                        }
                    },
                    rules: {
                        Email: {
                            required: true,
                            email: true
                        },
                        WWW: {
                            required: true,
                            url: true
                        },
                        Address1: {
                            required: true,
                            minlength: 5
                        },
                        postCode: "required",
                        City: "required",
                        country: "required",
                        Telephone: {
                            required: true,
                            number: true
                        }
                    },
                    messages: {
                        WWW: "This field is required. Please use syntax: http://www.example.com"
                    },
                    errorElement: "em",
                    errorPlacement: function (error, element) {
                        // Add the `help-block` class to the error element
                        error.addClass("help-block");

                        // Add `has-feedback` class to the parent div.form-group
                        // in order to add icons to inputs
                        element.parents(".col-sm-3").addClass("has-feedback");

                        if (element.prop("type") === "checkbox") {
                            error.insertAfter(element.parent("label"));
                        } else {
                            error.insertAfter(element);
                        }

                        // Add the span element, if doesn't exists, and apply the icon classes to it.
                        if (!element.next("span")[ 0 ]) {
                            $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(element);
                        }
                    },
                    success: function (label, element) {
                        // Add the span element, if doesn't exists, and apply the icon classes to it.
                        if (!$(element).next("span")[ 0 ]) {
                            $("<span class='glyphicon glyphicon-ok form-control-feedback'></span>").insertAfter($(element));
                        }
                    },
                    highlight: function (element, errorClass, validClass) {
                        $(element).parents(".col-sm-3").addClass("has-error").removeClass("has-success");
                        $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
                        $(element).parents(".col-sm-5").addClass("has-error").removeClass("has-success");
                        $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
                    },
                    unhighlight: function (element, errorClass, validClass) {
                        $(element).parents(".col-sm-3").addClass("has-success").removeClass("has-error");
                        $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
                        $(element).parents(".col-sm-5").addClass("has-success").removeClass("has-error");
                        $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
                    }
                });
            });

//            $(document).ready(function () {
//                var validator = $("#newPublisherForm").validate();
//                alert("Validate");
//                validator.form();
//            });
        </script>
        <script>
            $(document).ready(function () {
                $("input[type='url']").blur(function () {
                    $('#WWW').valid();
                });
            });
        </script>
    </body>
</html>
