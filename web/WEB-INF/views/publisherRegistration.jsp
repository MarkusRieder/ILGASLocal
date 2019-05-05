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
                            <div class="col-sm-6">
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
                            <div class="col-sm-6">  
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
                            <div class="col-sm-6"></div>
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
                                           onblur ="addhttp(this);"
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
        <script>
            $(document).ready(function () {
                $("#newPublisherForm").validate({
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
                            minlength: 2
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
        </script>
        <script>
            $(document).ready(function () {
                $("input[type='url']").blur(function () {
                    $('#WWW').valid();
                });
            });
        </script>
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
