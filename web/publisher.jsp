<%-- 
    Document   : publisher.jsp
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
        <!--publisher.jsp-->
        <!-- Bootstrap -->

        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">    
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/my-block-ui.css">   
        <link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">
        <link rel="stylesheet" type="text/css" href="css/form.css">
        <link rel="stylesheet" type="text/css" href="css/signup-form.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/publisher.css">


        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/publisher.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/blockui.js"></script>
        <script src="js/my-block-ui.js"></script>
        <script type="text/javascript" src="js/xregexp-all.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/register.js"></script>
        <script src="js/bootstrap-validator.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/bootstrap-show-password.js"></script>
        <script src="js/jquery-ui.js"></script>


    </head>

    <body style="height: 100%" onload="deCheckboxValue();"> 

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
                        <a><img src="images/flashtext-animated2.gif" height="80" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a class="logo"><span class="hidden">Literature Ireland</span></a>

                </div> <!--  End of topbar div -->

                <h1 align="center" style="align-content: center">Translation Grant Application System for Literature Ireland</h1>

                <div class="container-fluid">

                    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
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
                                    <input name="lastLogon" type="hidden" value="<%= new java.lang.Long(System.currentTimeMillis()).toString()%>"/>
                                    <div class="help-block with-errors"></div>

                                    <div style="margin-top:10px" class="form-group">
                                        <!-- Button -->
                                        <div class="col-sm-12 controls">
                                            <input type="submit" class="btn btn-success btn-send" value="Login">
                                        </div> <!-- col-md-12 control -->
                                    </div> <!-- form-group -->

                                    <div class="form-group">
                                        <div class="col-md-12 control">
                                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                                Don't have an account? 
                                                <a href="#" onClick="$('#loginbox').hide();
                                                        $('#signupbox').show()">
                                                    Sign Up Here
                                                </a>
                                            </div> <%-- div style --%>
                                        </div> <!-- col-md-12 control -->
                                    </div> <!-- form-group -->
                                </form>  <!--loginform-->
                            </div>  <!-- panel-body -->
                        </div>  <!--panel-info-->
                    </div> <!--loginbox-->


                    <!--Signup-->
                    <div id="signupbox" style="display:none; margin-top:50px;" class="mainbox ">

                        <div class="row centered-form col-xs-12"> 
                            <div class="panel panel-info"  style="background-color: #e0d9d9">
                                <div class="panel-heading" style="margin-bottom: 20px">
                                    <div class="panel-title">Register with Literature Ireland</div>

                                    <div style="float:right; font-size: 85%; position: relative; top:-10px">
                                        <a id="signinlink" 
                                           href="#" 
                                           onclick="$('#signupbox').hide();
                                                   $('#loginbox').show()">Sign In</a></div>
                                </div>

                                <div class="panel-body"  style="background-color: #e0d9d9">
                                    <form class="form-horizontal" 
                                          role="form"  
                                          id="register-form" 
                                          autocomplete="on"  
                                          action="${pageContext.request.contextPath}/RegisterServlet" 
                                          method="POST" 
                                          name="regF"
                                          >
                                        <div class="row">

                                            <div class="form-group">

                                                <!-- <label for="username" class="col-md-3 control-label">Username</label>-->
                                                <div class="col-xs-6 col-sm-6 col-md-6">

                                                    <input type="text" 
                                                           class="form-control" 
                                                           name="uname" 
                                                           id="uname" 
                                                           placeholder="Username" 
                                                           data-toggle="validator"
                                                           onblur="checkUserName()"
                                                           pattern="[A-Za-z0-9 \-']{1,20}" 
                                                           data-error="Username should not be empty. It should be less than 20 characters. Use only A-Z, a-z, 0-9 charecters"
                                                           required
                                                           >     
                                                    <span class="help-block" id="error"></span> 

                                                </div>

                                            </div> <!--form-group uname--> 

                                        </div> <!-- row --> 

                                        <div class="row">

                                            <div class="col-xs-6 col-sm-6 col-md-6">

                                                <div class="form-group">

                                                    <input type="text" 
                                                           class="form-control" 
                                                           name="firstname" 
                                                           placeholder="First Name" 
                                                           data-toggle="validator"                                                  
                                                           data-error="First name should not be empty. It should be less than 20 characters. Use only A-Z, a-z, 0-9 charecters"
                                                           required
                                                           >    
                                                    <span class="help-block"></span> 

                                                </div> <!--form-group firstname--> 

                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">

                                                <div class="form-group">

                                                    <input type="text" 
                                                           class="form-control" 
                                                           name="lastname" 
                                                           placeholder="Last Name"
                                                           data-toggle="validator"                                        
                                                           data-error="Last name should not be empty. It should be less than 20 characters. Use only A-Z, a-z, 0-9 charecters"
                                                           required
                                                           >    
                                                    <span class="help-block"></span> 

                                                </div> <!--form-group lastname--> 

                                            </div>

                                        </div> <!-- row --> 

                                        <div class="row">

                                            <div class="col-xs-6 col-sm-6 col-md-6">

                                                <div class="form-group">

                                                    <input type="password" 
                                                           class="form-control" 
                                                           id="password"
                                                           name="password" 
                                                           placeholder="Enter Password"    
                                                           pattern="[A-Za-z0-9@#$%!^&*]{6,30}" 
                                                           data-error="Password should not be null. It should be greater than 6 and less than 30 characters . 
                                                           Use only A-Z, a-z, 0-9, @ # $ % ! ^ & * charecters" 
                                                           required                                                                                     
                                                           >       
                                                    <span class="help-block"></span> 

                                                </div> <!--form-group password--> 

                                            </div>


                                            <div class="col-xs-6 col-sm-6 col-md-6">

                                                <div class="form-group">

                                                    <input type="password" 
                                                           class="form-control"  
                                                           id="cpassword" 
                                                           name="cpassword" 
                                                           placeholder="Confirm Password"                                           
                                                           data-match="#password"                                                                      
                                                           required
                                                           >     
                                                    <span class="help-block"></span> 

                                                </div> <!--form-group cpassword--> 

                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">

                                                <div class="form-group">

                                                    <input type="hidden" 
                                                           class="form-control"  
                                                           id="functionDataset" 
                                                           name="function" 
                                                           value="Publisher" 
                                                           style=" background-color:#00c0ef"

                                                           >    
                                                </div> <!--form-group function--> 

                                            </div>

                                        </div> <!-- row --> 

                                        <div class="row">

                                            <div class="col-xs-6 col-sm-6 col-md-6  pull-left">

                                                <div class="form-group">

                                                    <input type="email" 
                                                           class="form-control" 
                                                           name="email" 
                                                           placeholder="Email Address"
                                                           data-toggle="validator"
                                                           pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
                                                           data-error="Enter valid Email"
                                                           required
                                                           >   
                                                    <span class="help-block"></span> 

                                                </div> <!--form-group email--> 

                                            </div>

                                        </div> <!-- row --> 

                                        <div class="row">

                                            <div class="col-xs-6 col-sm-6 col-md-6  pull-left">

                                                <div class="form-group">

                                                    <label> Enter your company name:</label>
                                                    <input  id="company" 
                                                            name="company" 
                                                            type="text" 
                                                            value="" 
                                                            data-toggle="tooltip"
                                                            title="Please Enter your Company's Name - if it does not show up please fill in the form"
                                                            class="form-control pull-left"     
                                                            onblur="CheckboxValue();"
                                                            placeholder="Company Name"
                                                            >
                                                    <span class="help-block"></span> 
                                                    <!--<i class="glyphicon glyphicon-search form-control-feedback" id="companyGlyphicon"></i>-->

                                                </div> <!--form-group company--> 

                                            </div>

                                        </div> <!-- row --> 


                                        <!--<input type="submit" value="Register" class="btn btn-info btn-block">-->
                                        <div class="pull-left"  style="background-color: #e0d9d9; margin-top: 40px">
                                            <button type="submit" class="btn btn-info">
                                                <span class="glyphicon glyphicon-log-in"></span> Sign Me Up !
                                            </button>
                                        </div>  <%--form-footer --%>

                                    </form>

                                </div>

                            </div>

                            <div style="border-top: 1px solid #999; padding-top:20px"  class="form-group"> </div>
                        </div>  <!--  panel-info -->
                    </div>  <!-- signupbox -->
                </div> <!-- container-fluid -->

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

    </body>
</html>
