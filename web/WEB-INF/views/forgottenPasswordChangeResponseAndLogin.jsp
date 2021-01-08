<%-- 
    Document   : forgottenPasswordChangeResponseAndLogin
    Created on : 16 Jul 2020, 20:11:54
    Author     : markus
--%>

<%-- 
    Document   : login.jsp - remote
    Created on : 17-Mar-2017, 11:57:10
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

        <title>Translation Grant Application System</title>

        <!-- Bootstrap -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/my-block-ui.css">   
        <link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">
        <link rel="stylesheet" type="text/css" href="css/form.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css" />


        <script src="js/jquery-1.11.3.min.js"></script>

        <script src="js/bootstrap.js"></script>
        <script src="js/blockui.js"></script>
        <script src="js/my-block-ui.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="https://unpkg.com/xregexp/xregexp-all.js"></script>
        <!--<script src="js/register.js"></script>-->
        <script src="js/bootstrap-validator.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/bootstrap-show-password.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>

        <!--clear localStorage and sessionStorage-->
        <script type="text/javascript">
            localStorage.clear();
            sessionStorage.clear();            
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
                background: #d9d1d1;
            }
        </style>  


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

                </div> <!--  End of topbar div -->

                <h1 align="center" style="align-content: center">Translation Grant Application System for Literature Ireland</h1>

                <div class="container-fluid">

                    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">       
                                        <div class="container-fluid" style="margin-bottom: 20px; width: 100%">
                    <!--<div class="col-md-3"></div>-->
                    <div>
                        <%-- Using JSP EL to get message attribute value from request scope --%>
                        <h2 style="margin-bottom: 10px; align-content: center; color: blue">
                            ${requestScope.message}</h2>
                    </div>
                    <!--<div class="col-md-3"></div>-->
                </div>
                        <div class="panel panel-info" >
                            <div class="panel-heading">
                                <div class="panel-title">Sign In</div>
                                <div style="float:right; font-size: 80%; position: relative; top:-10px;"><a href="forgotPassword.jsp">Forgot password ?</a></div>
                                <br/>    
                            </div>     

                            <div style="padding-top:30px" class="panel-body" >

                                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                                <form id="loginform" 
                                      class="form-horizontal" 
                                      action="${pageContext.request.contextPath}/login" 
                                      method="POST"  
                                      role="form" 
                                      >

                                    <div style="margin-bottom: 25px" class="input-group col-sm-9">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" 
                                               type="text" 
                                               class="form-control" 
                                               name="username" 
                                               value="" 
                                               placeholder="Enter your username"
                                               >   
                                    </div>

                                    <div style="margin-bottom: 25px" class="input-group col-sm-9">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="lpassword" 
                                               type="password" 
                                               class="form-control" 
                                               name="password" 
                                               data-toggle="password"  
                                               data-placement="after" 
                                               placeholder="Enter your password"
                                               >

                                    </div>
                                    <!--https://www.javaworld.com/article/2072937/java-web-development/solving-the-logout-problem-properly-and-elegantly.html?page=2-->
                                    <input name="lastLogon" type="hidden" value="<%= new java.lang.Long( System.currentTimeMillis() ).toString()%>"/>
                                    <div class="help-block with-errors"></div>

                                    <div style="margin-top:10px" class="form-group">
                                        <!-- Button -->
                                        <div class="col-sm-12 controls">
                                            <input type="submit" class="btn btn-success btn-send" value="Login">
                                        </div> <!-- col-md-12 control -->
                                    </div> <!-- form-group -->

                                </form>  <!--loginform-->
                            </div>  <!-- panel-body -->
                        </div>  <!--panel-info-->
                    </div> <!--loginbox-->
                </div> <!-- /container-fluid -->


                <script  type="text/javascript">
                    $(function () {
                        $('#register-form').validator().on('submit', function (e) {
                            if (e.isDefaultPrevented()) {
                                // handle the invalid form...
                            } else {
                                blockUi();
                                // everything looks good!
                                $.post("RegisterServlet", $("#register-form").serialize(), function (data) {
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

                <script  type="text/javascript">
                    $(function () {
                        $('#methods').click(function () {
                            $('#password').password('toggle');
                        });
                    });
                </script>

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
                        &copy; 2017-2020 mgr Software
                    </div>

                </div><!-- end of Base div -->

            </div><!-- end of container div -->

            <div class="shadowbase"> </div>

        </div><!-- end of Shadowholder container div -->


        <!--        <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
                    &copy; 2017-2019 mgr Software
                </div>-->
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
                            <div id="contentarea1">
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

