<%-- 
    Document   : template
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
        <!--login.jsp-->
        <!-- Bootstrap -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <!--<link rel="stylesheet" type="text/css" href="css/bootstrap.css">-->
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
        <script type="text/javascript" src="js/xregexp-all.js"></script> 
        <script src="js/register.js"></script>
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


        <!--if Publisher selected display publisherBox-->
        <script type="text/javascript">
            function changeFunc() {
                var selectBox = document.getElementById("functionDataset");
                var selectedValue = selectBox.options[selectBox.selectedIndex].value;
                if (selectedValue === 'Publisher') {
//                    $('#signupbox').hide();
                    $('#publisherBox').show();
                }
            }
        </script>

        <!--show input for new Publisher name-->
        <script type="text/javascript">
            $(document).ready(function () {
                $('#cbnewPublisher').change(function () {
                    if ($(this).is(":checked")) {
                        $('#newPublisher').show();
                    } else {
                        $('#newPublisher').hide();
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
                background: #d9d1d1;
            }
        </style>  


        <!--autocomplete-->
        <!--AutoComplete_international_publishers-->
        <script type="text/javascript">
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
        </script>


        <!--AutoComplete_country-->
        <script type="text/javascript">
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

        <!--Tooltips-->
        <script  type="text/javascript">
            $('input[type=text][name=Company]').tooltip({
                placement: "top",
                trigger: "hover"
            });
        </script>

        <!--setting checkboxes if value is true = 1 -->
        <script type="text/javascript">
            function CheckboxValue() {
                $(":checkbox").filter(function () {
                    return this.value === "1";
                }).prop("checked", "true");
            }
        </script>

        <!--clear all checkboxes onload-->
        <script type="text/javascript">
            function deCheckboxValue() {
                var w = document.getElementsByTagName("input");
                for (var i = 0; i < w.length; i++) {
                    if (w[i].type === 'checkbox') {
                        w[i].checked = false;
                    }
                }
            }
        </script>

        <!-- clear company autocomplete box and make it invisible -->
        <script type="text/javascript">
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
        </script>

        <!--icon exclamation-->
        <style>
            .icon-exclamation {
                color: #ff0000;

                ul {
                    margin: 0;
                }
                ul.dashed {
                    list-style-type: none;
                }
                ul.dashed > li {
                    text-indent: -5px;
                }
                ul.dashed > li:before {
                    content: "-";
                    text-indent: -5px;
                }
            }

            input {
                vertical-align: -2px;
            }
            input[type="text"]:focus + .glyphicon-search{
                color: #FF8C00;
            }
        </style>

    </head>

    <body style="height: 100%" onload="deCheckboxValue();"> 

        <div class="alert alert-danger" role="alert" id="errorField" style="display:none">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            <span class="errorMessage"></span>
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

                <h1 align="center" style="align-content: center">userloggedin Translation Grant Application System for Literature Ireland</h1>

                <div class="container-fluid">

                    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
                        <div class="panel panel-danger" >
                            <div class="panel-heading">
                                <div class="panel-title">You are already signed in</div>
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
                                                        $('#signupbox').show();
                                                        $('#uname').focus();">
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
                    <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">

                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="panel-title">Sign Up</div>

                                <div style="float:right; font-size: 85%; position: relative; top:-10px">
                                    <a id="signinlink" 
                                       href="#" 
                                       onclick="$('#signupbox').hide();
                                               $('#loginbox').show()">Sign In</a></div>
                            </div>   <!--panel-heading-->

                            <div class="panel-body">

                                <div class="signup-form-container">

                                    <form class="form-horizontal" 
                                          role="form"  
                                          id="register-form" 
                                          autocomplete="on"  
                                          action="${pageContext.request.contextPath}/RegisterServlet" 
                                          method="POST" 
                                          name="regF"
                                          >
                                        <div id="signupalert" style="display:none" class="alert alert-danger">
                                            <p>Error:</p>
                                            <span></span>
                                        </div>

                                        <!--form-body-->
                                        <div class="form-body">

                                            <div class="alert alert-info" id="message" style="display:none;">
                                                submitted
                                            </div>

                                            <!--uname-->
                                            <div class="form-group">
                                                <div class="col-md-9">
                                                    <input type="text" 
                                                           class="form-control" 
                                                           name="uname" 
                                                           id="uname" 
                                                           placeholder="User name"                                             
                                                           onblur="loadXMLDoc()"
                                                           required 
                                                           pattern="^\S+$"
                                                           title='The username can only consist of alphabetical, number and underscore'
                                                           >    
                                                    <span  id="checkusernameResultMessage"></span> 
                                                </div>
                                            </div> <!--form-group uname-->  

                                            <!--firstname-->
                                            <div class="form-group">
                                                <div class="col-md-9">
                                                    <input type="text" 
                                                           class="form-control" 
                                                           id="firstname" 
                                                           name="firstname" 
                                                           placeholder="First Name" 
                                                           required="required"
                                                           >     
                                                    <span class="help-block"></span> 
                                                </div>
                                            </div> <!--form-group firstname-->     

                                            <!--lastname-->
                                            <div class="form-group">
                                                <div class="col-md-9">
                                                    <input type="text" 
                                                           class="form-control" 
                                                           id="lastname" 
                                                           name="lastname" 
                                                           placeholder="Last Name"
                                                           required="required"
                                                           >    
                                                    <span class="help-block"></span> 
                                                </div>
                                            </div> <!--form-group lastname-->      
                                            <div class="form-group">
                                                <div class="col-md-9">
                                                    <input type="text" 
                                                           class="form-control" 
                                                           name="username" 
                                                           id="username" 
                                                           placeholder="User name"                                                         
                                                           required 
                                                           pattern="^\S+$"
                                                           title='The username can only consist of alphabetical, number and underscore'
                                                           >    
                                                    <span class="help-block"></span> 
                                                </div>
                                            </div> <!--form-group uname-->  
                                            <!--email-->
                                            <div class="form-group">
                                                <div class="col-md-9">
                                                    <input type="email" 
                                                           class="form-control" 
                                                           name="email" 
                                                           placeholder="Email Address"
                                                           pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
                                                           data-error="Enter valid Email"
                                                           required
                                                           >                                            
                                                    <span class="help-block"></span> 
                                                </div>
                                            </div> <!--form-group email-->

                                            <!--password-->
                                            <div class="form-group">
                                                <div class="col-md-9">
                                                    <input type="text" 
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
                                                </div>
                                            </div> <!--form-group password-->

                                            <!--cpassword-->
                                            <div class="form-group">
                                                <!--<label for="cpassword" class="col-md-3 control-label">Confirm Password</label>-->
                                                <div class="col-md-9">
                                                    <input type="text" 
                                                           class="form-control"  
                                                           id="cpassword" 
                                                           name="cpassword" 
                                                           placeholder="Confirm Password"                                           
                                                           data-match="#password"                                                                      
                                                           required
                                                           >                 
                                                    <span class="help-block"></span> 
                                                </div>
                                            </div> <!--form-group cpassword-->

                                            <div class="form-group">
                                                <div class="col-md-9">
                                                    <label for="functionDataset" >Your function</label>
                                                    <div style="clear: both;"></div>
                                                    <input type="text" 
                                                           class="form-control"  
                                                           id="functionDataset" 
                                                           name="function" 
                                                           placeholder="Publisher"                                           
                                                           value="Publisher" 
                                                           style=" background-color:#00c0ef"
                                                           readonly
                                                           >                               
                                                </div>
                                            </div> <!--form-group functionDataset-->

                                            <!--publisherBox-->
                                            <div id="publisherBox" style="margin-top:50px; ">

                                                <!--get Company and Company_Number via autocomplete-->
                                                <div class="row" style="margin-bottom: 40px;margin-top: 30px">
                                                    <div class="form-group has-feedback has-feedback-left">
                                                        <div class="col-sm-10">
                                                            <input  id="company" 
                                                                    name="company" 
                                                                    type="text" 
                                                                    value="" 
                                                                    data-toggle="tooltip"
                                                                    title="Please Enter your Company's Name - if it does not show up please fill in the form"
                                                                    class="form-control  move-left"     
                                                                    onblur="CheckboxValue();"
                                                                    placeholder="Company Name"
                                                                    >
                                                            <i class="glyphicon glyphicon-search form-control-feedback" id="companyGlyphicon"></i>
                                                        </div>
                                                    </div> <!--form-group-->

                                                    <!--companyNumber-->
                                                    <div class="form-group">
                                                        <input id="companyNumber"                                
                                                               type="hidden"                                
                                                               class="form-control"                                
                                                               name="companyNumber"                                
                                                               value=""                                
                                                               >
                                                    </div> <!--form-group-->

                                                    <!-- tick box if company is not in database and display input for new company name  -->    
                                                    <div class="form-group">
                                                        <div class="col-sm-12">
                                                            <div class="checkbox" style="margin-top: 30px; margin-bottom: 30px">
                                                                <label>    
                                                                    <input type="checkbox"  
                                                                           id="cbnewPublisher"
                                                                           name="cbnewPublisher"         
                                                                           value="cbnewPublisher"  
                                                                           onclick="clearCompany(this);"
                                                                           > 
                                                                    Can't find your company? 
                                                                    Tick the box                                                           
                                                                    <span class="glyphicon glyphicon-exclamation-sign icon-exclamation"></span>
                                                                </label>             
                                                            </div> <!-- checkbox -->
                                                        </div>
                                                    </div> <!--form-group-->

                                                    <!--input for new company name-->  
                                                    <div class="form-group">
                                                        <div class="col-sm-10">
                                                            <input type="text" 
                                                                   id="newPublisher"
                                                                   name="newPublisher"
                                                                   class="form-control"     
                                                                   placeholder="Please enter your company's name"
                                                                   style="display:none"
                                                                   >
                                                        </div> 
                                                    </div> <!--form-group-->
                                                </div>  <!-- row -->
                                            </div>  <!--publisherBox-->

                                        </div>  <%--form-body --%>

                                        <div class="form-footer">
                                            <button type="submit" class="btn btn-info">
                                                <span class="glyphicon glyphicon-log-in"></span> Sign Me Up !
                                            </button>
                                        </div>  <%--form-footer --%>
                                    </form> <!--register-form-->

                                    <!--blockUiDiv-->
                                    <div id="blockUiDiv">
                                        <img src="images/gears.svg" alt="spinner.gif"/>
                                    </div>
                                    <div id="blockUiBackdrop">
                                    </div>

                                </div>  <!--signup-form-container-->
                            </div> <%--form-body --%>

                            <div style="border-top: 1px solid #999; padding-top:20px"  class="form-group"> </div>
                        </div>  <!--panel-info-->
                    </div>  <!-- signupbox -->
                </div> <!-- /container-fluid -->


                <script>
                    $(document).ready(function () {
//                        alert("bootstrapValidator")
                        $('#register-form').bootstrapValidator({
                            message: 'This value is not valid',
                            live: 'enabled',
                            trigger: "keyup",
                            feedbackIcons: {
                                valid: 'glyphicon glyphicon-ok',
                                invalid: 'glyphicon glyphicon-remove',
                                validating: 'glyphicon glyphicon-refresh'
                            },
                            fields: {
                                uname: {
                                    message: 'The username is not valid',
                                    validators: {
                                        notEmpty: {
                                            message: 'The username is required and cannot be empty'
                                        },
                                        stringLength: {
                                            min: 6,
                                            max: 30,
                                            message: 'The username must be more than 6 and less than 30 characters long'
                                        },
                                        regexp: {
                                            regexp: /^\S+$/,
                                            message: 'The username can only consist of letters and spaces'
                                        }
                                    }
                                },
                                username: {
                                    message: 'The username is not valid',
                                    validators: {
                                        notEmpty: {
                                            message: 'The username is required and cannot be empty'
                                        },
                                        stringLength: {
                                            min: 6,
                                            max: 30,
                                            message: 'The username must be more than 6 and less than 30 characters long'
                                        },
                                        regexp: {
                                            regexp: /^\S+$/,
                                            message: 'The username can only consist of letters and spaces'
                                        }
                                    }
                                },
                                firstname: {
                                    message: 'The first name is not valid',
                                    validators: {
                                        notEmpty: {
                                            message: 'The first name is required and cannot be empty'
                                        },
                                        stringLength: {
                                            min: 2,
                                            max: 30,
                                            message: 'The first name must be more than 6 and less than 30 characters long'
                                        },
                                        regexp: {
                                            regexp: /^[a-zA-Z0-9_]+$/,
                                            message: 'The first name can only consist of letters and spaces'
                                        }
                                    }
                                },
                                lastname: {
                                    message: 'The last name is not valid',
                                    validators: {
                                        notEmpty: {
                                            message: 'The last name is required and cannot be empty'
                                        },
                                        stringLength: {
                                            min: 2,
                                            max: 30,
                                            message: 'The last name must be more than 6 and less than 30 characters long'
                                        },
                                        regexp: {
                                            regexp: /^[a-zA-Z0-9_]+$/,
                                            message: 'The last name can only consist of letters and spaces'
                                        }
                                    }
                                },
                                email: {
                                    validators: {
                                        notEmpty: {
                                            message: 'The email address is required and cannot be empty'
                                        },
                                        emailAddress: {
                                            message: 'The email address is not a valid'
                                        }
                                    }
                                },
                                password: {
                                    validators: {
                                        notEmpty: {
                                            message: 'The password is required and cannot be empty'
                                        },
                                        different: {
                                            field: 'username',
                                            message: 'The password cannot be the same as username'
                                        },
                                        stringLength: {
                                            min: 8,
                                            message: 'The password must have at least 8 characters'
                                        }
                                    }
                                }
                            }
                        });
                    });
                </script>


                <script  type="text/javascript">
                    $(function () {
                        $('#register-form').validator().on('submit', function (e) {
                            if (e.isDefaultPrevented()) {
                                // handle the invalid form...
                                console.log(e);
                            } else {
                                blockUi();
                                // everything looks good!
                                $.post("RegisterServlet", $("#register-form").serialize(), function (data) {
                                    var jdata = JSON.parse(data);
                                    console.log(jdata.message);
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
                        if (uname !== "") {
                            var urls = "checkusername.jsp?uname=" + uname;

                            if (window.XMLHttpRequest)
                            {
                                xmlhttp = new XMLHttpRequest();
                            } else
                            {
                                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                            }
                        }
                        xmlhttp.onreadystatechange = function ()
                        {
                            if (xmlhttp.readyState === 4)
                            {
                                document.getElementById("checkusernameResultMessage").innerHTML = xmlhttp.responseText;
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
