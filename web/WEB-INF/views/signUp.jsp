<%-- 
    Document   : signUp
    Created on : 17-Mar-2017, 14:00:34
    Author     : markus
--%>

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
        <!-- Load mobile menu -->
        <script type="text/javascript" src="js/jquery.mobile-menu.js"></script>

        <script type="text/javascript">
            $(function () {
                $("body").mobile_menu({
                    menu: "#phonenav"
                });
            });
        </script>

        <title>Translation Grant Application System</title>



        <!-- Bootstrap -->

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/my-block-ui.css">   
        <link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">
        <link rel="stylesheet" type="text/css" href="css/form.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


        <script src="js/blockui.js"></script>
        <script src="js/my-block-ui.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/xregexp-all.js"></script> 
        <script src="js/register.js"></script>
        <script src="js/validator.js"></script>
        <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>

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
                        alert("Please Enter only Characters for Username");
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

        <style>
            .form-horizontal .control-label {
                margin-bottom: 5px;
            }
            .form-horizontal .form-group {
                margin-bottom: 5px;
                margin-left:0px;
                margin-right:0px;
            }
            body {
                background-color: #d9d1d1;
            }
        </style>
        <!--        
                <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
                <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
                <link rel="stylesheet" type="text/css" href="css/layout.css">
                <link rel="stylesheet" type="text/css" href="css/home.css" >
                <link rel="stylesheet" type="text/css" href="css/form.css">
                <link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">
                <link rel="stylesheet" type="text/css" href="css/my-block-ui.css">   
        
                <link type="text/css" rel="stylesheet" href="css/responsive-tabs.css" />
                <link type="text/css" rel="stylesheet" href="css/style.css" />
        
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>-->

        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.js"></script>-->
    </head>



    <body style="height: 100%">

        <div id="shadowholder">

            <div class="shadowtop"> </div>

            <div id="container">

                <div id="topspacer"> </div>

                <div id="topbar">

                    <div class="animateddiv">
                        <a href="/the-translation-grant-programme"><img src="images/flashtext-animated2.gif" height="80" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a href="/" class="logo"><span class="hidden">Literature Ireland</span></a>

                </div><!-- End of topbar div -->

                <h1>SIGNUP.JSP</h1>

                <h1 align="center" style="align-content: center">Translation Grant Application System for Literature Ireland Signup</h1>

                <div class="alert alert-danger" role="alert" id="errorField" style="display:none">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span class="sr-only">Error:</span>
                    <span class="message"></span>
                </div>

                <div class="alert alert-success" role="alert" id="successField" style="display:none">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span class="sr-only">Success:</span>
                    <span class="message"></span>
                </div>

                <div class="container-fluid"> 

                    <!--Signup-->
                    <div id="signupbox" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">

                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="panel-title">Sign Up</div>
                                <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
                            </div>  

                            <div class="panel-body">

                                <div class="signup-form-container">

                                    <form class="form-horizontal" role="form"  id="formRegister" 
                                          action="/RegisterServlet" 
                                          data-toggle="validator" method="POST">

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
                                            </div>

                                            <div class="form-group">
                                                <!-- <label for="username" class="col-md-3 control-label">Username</label>-->
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" name="username" id="uname" placeholder="Username" onblur="loadXMLDoc()"/>                                           
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
                                                    <span id="erremail" class="alert alert-danger col-lg-8 col-md-8 col-sm-8 col-xs-12">Invalid Email Address</span>
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

                                            <div class="form-group">
                                                <!--<label for="location" class="col-sm-3 control-label">Select your function</label>-->
                                                <div class="col-sm-6">
                                                    <!--<select class="selectpicker" title="Select Your Function" style="display: none;">-->
                                                    <select class="selectpicker" title="Select Your Function" style="display: none;" name="function" id="functionDataset" required>
                                                        <option>Literature Ireland Staff</option>
                                                        <option>Publisher</option>
                                                        <option>Expert Reader</option>
                                                    </select>                                        
                                                    <span class="help-block" id="error"></span> 
                                                </div>
                                            </div> <%--form-group --%>
                                        </div><%--form-body --%>

                                        <div class="form-footer">
                                            <button type="submit" class="btn btn-info">
                                                <span class="glyphicon glyphicon-log-in"></span> Sign Me Up !
                                            </button>
                                        </div>
                                    </form>
                                    <div id="blockUiDiv">
                                        <img src="images/gears.svg" alt="spinner.gif"/>                           
                                    </div>
                                    <div id="blockUiBackdrop"></div>
                                </div>
                                <script>
                                    $(function () {
                                        $('#formRegister').validator().on('submit', function (e) {
                                            if (e.isDefaultPrevented()) {
                                                // handle the invalid form...
                                            } else {
                                                blockUi();
                                                // everything looks good!
                                                $.post("RegisterServlet", $("#formRegister").serialize(), function (data) {
                                                    var jdata = JSON.parse(data);
                                                    if (jdata.code === -1) {
                                                        $("#errorField .message").text(jdata.message);
                                                        $("#errorField").show();
                                                        $("#successField").hide();
                                                    } else {
                                                        $("#successField .message").text(jdata.message);
                                                        $("#errorField").hide();
                                                        $("#successField").show();
                                                        $("#formRegister").hide();
                                                    }
                                                }).always(function () {
                                                    unBlockUi();
                                                });
                                            }
                                            return false;
                                        });

                                    });

                                </script>
                            </div>
                            <div style="border-top: 1px solid #999; padding-top:20px"  class="form-group"></div>
                        </div>
                    </div>  
                </div> <!-- /container-fluid -->



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
                    <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
                        &copy; 2017-2019 mgr Software
                    </div>
                </div><!-- end of Base div -->

            </div><!-- end of container div -->
            <div class="shadowbase"> </div>
        </div><!-- end of Shadow container div -->

        <script type="text/javascript">
            function loadXMLDoc()
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

        <script type="text/javascript">
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
