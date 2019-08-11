<%@page import="ie.irishliterature.util.GlobalConstants"%>
<%-- 
    Document   : success
    Created on : 01-Apr-2017, 12:56:23
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

        <title>Translation Grant Application System</title>

        <!-- Bootstrap -->
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->


        <!--<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">-->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <!--<link rel="stylesheet" type="text/css" href="css/my-block-ui.css">-->   
        <!--<link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">-->
        <link rel="stylesheet" type="text/css" href="css/form.css">
        <!--<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">-->


        <script src="js/jquery-1.11.3.min.js"></script>

        <script src="js/bootstrap.js"></script>
        <script src="js/blockui.js"></script>
        <script src="js/my-block-ui.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/register.js"></script>
        <script src="js/bootstrap-validator.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/bootstrap-show-password.js"></script>


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
        <div id="shadowholder">

            <div class="shadowtop"> </div>

            <div id="container">

                <div id="topspacer"> </div>

                <div id="topbar">

                    <div class="animateddiv">
                        <a href="/the-translation-grant-programme"><img src="images/flashtext-animated2.gif" height="80" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a href="/" class="logo"><span class="hidden">Literature Ireland</span></a>

                </div> <!--  End of topbar div -->
                <h1 align="center" style="align-content: center">Translation Grant Application System for Literature Ireland</h1>

                <div class="container-fluid" style="align-content: center; margin-top: 50px; margin-bottom: 70px">
                    <div class="row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8">
                            <p style="margin-bottom: 100px; margin-top: 70px;">
                                <%
                                    String message = (String) request.getAttribute(GlobalConstants.MESSAGE);
                                %>
                                <%=message%>
                            </p>
                        </div>
                        <div class="col-sm-2"></div>
                    </div> <!--row-->
                </div>

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
                    <div class="baselogo-4 hidden-phone"><a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a></div>

                    <div class="mobile-baselogos visible-phone"> 
                        <a href="http://www.cultureireland.gov.ie" target="_blank"><span class="hidden">Culture Ireland</span></a>
                        <a href="http://www.artscouncil.ie" target="_blank"><span class="hidden">The Arts Council</span></a>
                        <a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a>
                    </div>

                </div><!-- end of Base div -->

            </div><!-- end of container div -->
            <div class="shadowbase"> </div>
        </div><!-- end of Shadow container div -->


        <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
            &copy; 2017-2019 mgr Software
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
