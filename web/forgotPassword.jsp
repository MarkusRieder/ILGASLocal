<%-- 
    Document   : forgotPassword
    Created on : 06-Mar-2017, 23:40:43
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

        <!-- Load mobile menu -->
        <!--<script type="text/javascript" src="js/jquery.mobile-menu.js"></script>-->
        <!--    <script type="text/javascript">
                $(function () {
                    $("body").mobile_menu({
                        menu: "#phonenav"
                    });
                });
            </script>-->

        <title>Translation Grant Application System</title>


        <!-- Bootstrap -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/home.css" >
        <link rel="stylesheet" type="text/css" href="css/form.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-select.css"> 
        <link rel="stylesheet" type="text/css" href="css/my-block-ui.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">     

        <!--<link rel="stylesheet" type="text/css" href="css/mobile.css">-->

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
                background-color:#f4f4f4;
            }
        </style>

        <!-- Load jQuery and the validate plugin -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" async=""></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" async=""></script>
        <script src="js/bootstrap.js" type="text/javascript" async=""></script>
        <script src="js/register.js"  type="text/javascript" async=""></script>
        <script src="js/bootstrap-select.min.js" type="text/javascript" async=""></script>
        <script src="js/validator.js" type="text/javascript" async=""></script>
        <script src="js/my-block-ui.js" type="text/javascript" async=""></script>

        <script src="js/bootstrap.min.js"></script>
        <script src="js/validator.min.js"></script>

        <!--        <script>
                    var select = document.getElementById('functionDataset');
                    select.onchange = function () {
                        input.value = select.value;
                    };
                </script>-->


        <!--        <script type="text/javascript">
                    function loadXMLDoc()
                    {
                        var xmlhttp;
                        var uname = document.getElementById("uname").value;
                        var urls = "checkusername.jsp?ver=" + uname;
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
                </script>-->


        <!--        <script type="text/javascript">
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
                </script>-->

        <script>
            $(function () {
                $('#formForgotPassword').validator().on('submit', function (e) {
                    if (e.isDefaultPrevented()) {
                        // handle the invalid form...
                    } else {
                        blockUi();
                        // everything looks good!
                        $.post("ForgotPassword", $("#formForgotPassword").serialize(), function (data) {
                            var jdata = JSON.parse(data);
                            if (jdata.code === -1) {
                                $("#errorField .message").text(jdata.message);
                                $("#errorField").show();
                                $("#successField").hide();
                            } else {
                                $("#successField .message").text(jdata.message);
                                $("#errorField").hide();
                                $("#successField").show();
                                $("#formForgotPassword").hide();
                            }
                        }).always(function () {
                            unBlockUi();
                        });
                    }
                    return false;
                });
            });
        </script>
    </head>


    <body style="height: 100%">

        <div id="shadowholder">

            <div class="shadowtop"> </div>

            <div id="container">
                <div id="topspacer"> </div>

                <div id="topbar">
                    <div class="animateddiv">
                        <a href="/the-translation-grant-programme"><img src="images/flashtext-animated2.gif" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a href="/" class="logo"><span class="hidden">Literature Ireland</span></a>
                </div><!-- End of topbar div -->

                <div class="container-fluid"> 
                    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
                        <!--<div style="max-width:500px;padding:10px 20px;margin:auto;margin-top:calc(50vh - 220px);">-->
                        <h3 style="text-align:center">Forgot Password</h3>
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
                        <form class="form-horizontal" id="formForgotPassword" data-toggle="validator" method="Post" role="form" action="${pageContext.request.contextPath}/ForgotPassword" >
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">Email</label>
                                <input name="inputEmail" type="email" class="form-control" id="inputEmail" placeholder="Enter Email" data-error="Enter valid Email" required>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <button style="width:100%" type="submit" class="btn btn-default btn-primary">Send Verification Link</button>
                                <div style="margin-bottom: 100px;"> </div>
                            </div>
                        </form>
                        <div id="blockUiDiv">
                            <img src="images/gears.svg"  alt="spinner"/>

                        </div>
                        <div id="blockUiBackdrop">
                        </div>
                    </div>

                </div> <!-- /container-fluid -->


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
                    <div class="baselogo-4 hidden-phone"><a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a></div>

                    <div class="mobile-baselogos visible-phone"> 
                        <a href="http://www.cultureireland.gov.ie" target="_blank"><span class="hidden">Culture Ireland</span></a>
                        <a href="http://www.artscouncil.ie" target="_blank"><span class="hidden">The Arts Council</span></a>
                        <a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a>
                    </div>

                </div><!-- end of Base div -->

                <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
                    &copy; 2017-2020 mgr Software
                </div>

            </div><!-- end of container div -->

            <div class="shadowbase"> </div>

        </div><!-- end of Shadow container div -->

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