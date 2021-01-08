<%-- 
    Document   : resetPassword
    Created on : 14-Mar-2017, 09:33:35
    Author     : markus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html style="height: 100%" >
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Translation Grant Application System</title>
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />


        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css" />
        <link rel="stylesheet" type="text/css" href="css/my-block-ui.css">   

        <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js" ></script>
        <script src="js/my-block-ui.js"></script>
        <script src="js/bootstrap-validator.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/bootstrap-show-password.js"></script>
        <script src="js/jquery-ui.js"></script>
    </head>
    <body>

        <div id="shadowholder">

            <div class="shadowtop"> </div>

            <div id="container">
                <div id="topspacer"> </div>

                <div id="topbar">
                    <div class="animateddiv">
                        <a><img src="images/flashtext-animated2.gif" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a class="logo"><span class="hidden">Literature Ireland</span></a>
                </div><!-- End of topbar div -->

                <div class="container-fluid"> 


                    <div style="max-width:400px;padding:10px 20px;margin:auto;margin-top:30px;">


                        <h3 style="text-align:center">Change Password 1212</h3>


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


                        <div id="loginUser" style="display:none">
                            Now you can verify your password by <a href="index.jsp">Login</a>
                        </div>


                        <form class="form-horizontal" id="formChangePassword" data-toggle="validator" role="form"
                              action="${pageContext.request.contextPath}/ForgotPassword" method="POST">
                            
                            <div class="form-group">
                                <label for="inputPassword" class="control-label">New Password</label>
                                <div style="margin-bottom: 25px" class="input-group col-sm-10">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type="password" 
                                           pattern="[A-Za-z0-9@#$%!^&*]{6,30}" 
                                           name="inputPassword" 
                                           class="form-control" 
                                           id="inputPassword" 
                                           data-toggle="password"  
                                           data-placement="after" 
                                           placeholder="Enter New Password" 
                                           data-error="Password should not be null. It should be greater than 6 and less than 30 characters . Use only A-Z, a-z, 0-9, @ # $ % ! ^ & * charecters" 
                                           required
                                           >
                                </div>
                                <div class="help-block with-errors"></div>

                            </div>


                            <div class="form-group">
                                <label for="inputPassword1" class="control-label">Confirm New Password</label>
                                <div style="margin-bottom: 25px" class="input-group col-sm-10">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type="password" 
                                           name="inputPassword1" 
                                           class="form-control" 
                                           id="inputPassword1" 
                                           data-toggle="password"  
                                           data-placement="after" 
                                           data-match="#inputPassword" 
                                           placeholder="Enter New Password Again" 
                                           data-error="Password should not be null and should match with above password" 
                                           required
                                           >
                                </div>
                                <div class="help-block with-errors"></div>

                            </div>

                            <div class="form-group">
                                <button style="width:100%" type="submit" class="btn btn-default btn-primary">Login</button>
                            </div>
                        </form>
                    </div>


                </div> <!-- /container-fluid -->

<!--                <script>
                    $(function () {
                        $('#formChangePassword').validator().on('submit', function (e) {
                            if (e.isDefaultPrevented()) {
                                // handle the invalid form...
                            } else {
                                blockUi();
                                // everything looks good!
                                $.post("ForgotPassword", $("#formChangePassword").serialize(), function (data) {
                                    var jdata = JSON.parse(data);
                                    if (jdata.code === -1) {
                                        $("#errorField .message").text(jdata.message);
                                        $("#errorField").show();
                                        $("#successField").hide();
                                        $("#loginUser").hide();
                                    } else {
                                        $("#successField .message").text(jdata.message);
                                        $("#errorField").hide();
                                        $("#successField").show();
                                        $("#loginUser").show();
                                        $("#formChangePassword").hide();
                                    }
                                }).always(function () {
                                    unBlockUi();
                                });
                            }
                            return false;
                        });
                    });
                </script>-->


                <!--footer start-->

