<%-- 
    Document   : welcome_Staff_1.jsp
    Created on : 15-May-2018, 07:09:54
    Author     : Markus Rieder
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List" %> 
<%@page import="java.util.ArrayList" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 
           prefix="fn" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html style="height: 100%" >
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="robots" content="noindex, nofollow">

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 

        <!--JQuery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


        <!-- Bootstrap -->

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--DataTables-->

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https:////cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/plug-ins/1.10.15/integration/font-awesome/dataTables.fontAwesome.css">


        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <!--<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">-->
        <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css"/> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker.css" />
        <link href="css/bootstrap-imageupload.css" rel="stylesheet">
        <link rel="stylesheet" href="css/lesshat.css" />
        <link rel="stylesheet" type="text/css" href="css/lightbox.min.css">
        <link rel="stylesheet" href="css/jquery.dataTables.yadcf.css" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
        <link rel="stylesheet" type="text/css" href="css/irishLiterature.css">
        <link rel="stylesheet" type="text/css" href="css/template.css">
        <link rel="stylesheet" type="text/css" href="css/select-css.css">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jQuery-ui-Slider-Pips/1.11.4/jquery-ui-slider-pips.css">
        <link rel="stylesheet" type="text/css" href="css/welcome_Staff_1.css">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>


        <script type="text/javascript"   src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>  

        <script type="text/javascript"   src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>       
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript"   src="//cdn.datatables.net/plug-ins/1.10.12/sorting/datetime-moment.js"></script>
        <script type="text/javascript"   src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript"   src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
        <script type="text/javascript"   src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
        <script type="text/javascript"   src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js "></script>
        <script type="text/javascript"   src="//cdn.datatables.net/plug-ins/1.10.15/dataRender/datetime.js"></script>
        <script type="text/javascript"   src="js/bootstrap-datepicker.js"></script>
        <!--<script type="text/javascript"   src="js/jquery-ui.js"></script>-->

        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

        <script type="text/javascript"   src="js/lightbox.min.js"></script>
        <script src="//mozilla.github.io/pdf.js/build/pdf.js"></script>
        <script type="text/javascript"   src="js/jquery.dataTables.yadcf.js"></script>
        <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-ui-Slider-Pips/1.11.4/jquery-ui-slider-pips.min.js"></script>
        <!--jqueryFileTree-->
        <script src="js/jquery.easing.js" type="text/javascript"></script>
        <script src="js/jqueryFileTree.js" type="text/javascript"></script>     

        <!--Stylesheets-->

        <!--jqueryFileTree-->
        <link href="css/jqueryFileTree.css" rel="stylesheet" type="text/css" media="screen" />

        <!--welcome_Staff_1-->
        <script src="js/welcome_Staff_1.js" type="text/javascript"></script>

        <!--               template-->
        <!--<script src="js/template.js" type="text/javascript"></script>-->


        <title>Translation Grant Application System</title>

        <script>

            /*
             * welcome_Staff_1.js
             */



        </script>
        <style>
            .btn-file {
                position: relative;
                overflow: hidden;
            }
            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: white;
                cursor: inherit;
                display: block;
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
                        <a><img src="images/flashtext-animated2.gif" height="70" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a class="logo"><span class="hidden">Literature Ireland</span></a>
                </div> <!--  End of topbar div -->

                <!--container for welcome/logout-->
                <div class="container-fluid" >
                    <div class="pull-right">
                        <form action="${pageContext.request.contextPath}/Logout" method="POST">
                            <h6> <small>Welcome <strong>${name}</strong> - <strong>not ${name}</strong>? 
                                    <button type="submit" name="username" value="${username}" class="btn-link">Click here to log out </button></small></h6>
                            <input type="hidden" id="username1" name="username" value="${username}">
                        </form>
                    </div>
                </div> <!--container for welcome/logout-->   

                <div style="margin-bottom: 10px"> </div>

                <nav class="navbar navbar-default" >
                    <div class="container-fluid"  style="background-color: #d9d1d1">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!--<a class="navbar-brand" href="#">Brand</a>-->
                        </div>

                        <!-- Nav tabs -->
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="myTab" style="background-color: #d9d1d1">
                            <ul class="nav navbar-nav nav-tabs two-lines" role="tablist">
                                <li role="tab" class="active"><a href="#Application" data-toggle="tab">Application Management</a></li>
                                <li role="tab" ><a href="#User" data-toggle="tab">User Management</a></li>
                                <!--<li role="tab" ><a href="#Contracts" data-toggle="tab">Contracts</a></li>-->
                                <li role="tab" ><a href="#ExpertReader" data-toggle="tab">Expert Reader</a></li>
                                <li role="tab" ><a href="#Library" data-toggle="tab">Library</a></li>
                                <li role="tab" ><a href="#Genres" data-toggle="tab">Genres</a></li>
                                <li role="tab" ><a href="#Maintenance" data-toggle="tab">Maintenance</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->


                        <!-- Tab panes -->
                        <div class="tab-content" >

                            <input type="text" name="ReferenceNumber" id="sSearch" class="sSearch">
                            <input type="hidden" name="Status" id="Status" class="Status">
                            <input type="hidden" name="userID" value="${userID}">
                            <input type="hidden" name="username" id="username2" value="${username}">
                            <input type="text" name="publisherID"  value="${publisherID}">
                            <input type="text" name="publisherName"  value="${publisherName}">
                            <input type="text" name="Company" value="${companyDetails.Company}">


                            <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px; display: none">

                                <!-- Table id="applications1" -->
                                <div class="table-responsive">

                                    <table id="applications1" class="table display table-striped table-bordered  dt-responsive " width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th class="details-control"></th>   
                                                <th class="never">Reference<br/>  No</th>
                                                <th class="never">Publisher</th>       
                                                <th class="never">Agreement</th>
                                                <th class="never">Contract</th>
                                                <th class="never">Proposed<br/> Date of <br/> Publication</th>
                                                <th class="never">Proposed<br/> Print Run</th>
                                                <th class="never">Planned Page <br/>  Extent</th>
                                                <th class="never">Translator<br/> CV</th>
                                                <th class="never">Number<br/> Pages</th>
                                                <th class="never">Break-down of <br/> Translator fee</th>
                                                <th class="never">Translator  <br/> Fee</th>
                                                <th class="never">Notes</th>
                                                <th class="never select-filter">Status</th>
                                                <th class="never">Copies <br/> Sent</th>
                                                <th class="never">Date Copies  <br/> Were Sent</th>
                                                <th class="never">Copies of  <br/> Translation Sample</th>
                                                <th class="never">T&C has been <br/> Accepted</th>
                                                <th class="never">Approved</th> 
                                                <th class="never">Genre</th>   
                                                <th class="never"></th>
                                                <th class="never">Expert Reader</th>
                                                <th class="never">Book title</th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never">Author(s)</th>
                                                <th class="never"></th>                                            
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th class="details-control"></th>   
                                                <th class="never">Reference<br/>  No</th>
                                                <th class="never">Publisher</th>       
                                                <th class="never">Agreement</th>
                                                <th class="never">Contract</th>
                                                <th class="never">Proposed<br/> Date of <br/> Publication</th>
                                                <th class="never">Proposed<br/> Print Run</th>
                                                <th class="never">Planned Page <br/>  Extent</th>
                                                <th class="never">Translator<br/> CV</th>
                                                <th class="never">Number<br/> Pages</th>
                                                <th class="never">Break-down of <br/> Translator fee</th>
                                                <th class="never">Translator  <br/> Fee</th>
                                                <th class="never">Notes</th>
                                                <th class="never select-filter">Status</th>
                                                <th class="never">Copies <br/> Sent</th>
                                                <th class="never">Date Copies  <br/> Were Sent</th>
                                                <th class="never">Copies of  <br/> Translation Sample</th>
                                                <th class="never">T&C has been <br/> Accepted</th>
                                                <th class="never">Approved</th> 
                                                <th class="never">Genre</th>   
                                                <th class="never"></th>
                                                <th class="never">Expert Reader</th>
                                                <th class="never">Book title</th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>    
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never">Author(s)</th>
                                                <th class="never"></th>                                                                          
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                                <th class="never"></th>
                                            </tr>
                                        </tfoot>

                                    </table>
                                </div>
                            </div>

                            <!--Table id="applications"-->
                            <div class="tab-pane fade  active in" id="Application">
                                <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                                    <div class="table-responsive">
                                        <table id="applications" class="table display table-striped table-bordered  dt-responsive " width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th class="details-control"></th>   
                                                    <th class="all">Reference<br/>  No</th>
                                                    <th class="all">Publisher</th>       
                                                    <th class="all">Book Title</th>                                    
                                                    <th class="all">Status</th>
                                                    <th class="all">Author(s)</th>                                 
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th class="details-control"></th>   
                                                    <th class="all">Reference<br/>  No</th>
                                                    <th class="all">Publisher</th>       
                                                    <th class="all">Book Title</th>
                                                    <th class="all" id="status">Status</th>
                                                    <th class="all">Author(s)</th>    
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <!-- Main Grid -->  
                                            </tbody>
                                        </table>
                                    </div>                   
                                </div> <!-- container-fluid -->  
                            </div>  

                            <!--applicationsModal-->
                            <div class="modal" id="applicationsModal" data-modal-index="1"   tabindex="-1">
                                <!--applicationEditForm-->
                                <form  method="POST" 
                                       id="applicationEditForm" 
                                       name="applicationForm" 
                                       action="${pageContext.request.contextPath}/StaffServlet" 
                                       enctype="multipart/form-data"> 
                                    <div class="modal-dialog">

                                        <div class="modal-content">

                                            <div class="modal-header" style="background-color: #c3bcbc">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                <h4 class="modal-title">Applications</h4>
                                            </div>

                                            <div class="modal-body" style="background-color: #d9d1d1">

                                                <nav class="navbar navbar-default" >

                                                    <div class="container-fluid"  style="background-color: #d9d1d1">

                                                        <!-- Brand and toggle get grouped for better mobile display -->
                                                        <div class="navbar-header">
                                                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                                                <span class="sr-only">Toggle navigation</span>
                                                                <span class="icon-bar"></span>
                                                                <span class="icon-bar"></span>
                                                                <span class="icon-bar"></span>
                                                            </button>
                                                        </div>

                                                        <!-- Collect the nav links, forms, and other content for toggling -->
                                                        <div class="collapse navbar-collapse" id="applicationsModalTab" style="font-size: 0.8em !important;  background-color: #d9d1d1">


                                                            <ul class="nav navbar-nav nav-tabs" id="tabContent">
                                                                <li class="active"><a href="#originalContracts" data-toggle="tab">Original <br/>and Contracts</a></li>
                                                                <li><a href="#publisherTranslation" data-toggle="tab">Publisher <br/>and Translation</a></li>
                                                                <li><a href="#readerReport" data-toggle="tab">Reader’s  <br/>Report</a></li>
                                                                <li><a href="#boardMeeting" data-toggle="tab">Board  <br/>Meeting</a></li>
                                                                <li><a href="#contract" data-toggle="tab">Contract <br/> &nbsp;</a></li>
                                                                <li><a href="#publisher" data-toggle="tab">Publisher <br/> details &nbsp;</a></li>
                                                            </ul>
                                                        </div><!-- /.navbar-collapse -->


                                                        <%request.getSession().setAttribute( "task", "StaffServlet" );%>
                                                        <input type="hidden" name="name" value="${name}">
                                                        <input type="hidden" name="username" id="username3" value="${username}">
                                                        <input type="hidden" id="translatorArray" name="translatorArray" >                                                                
                                                        <input type="hidden" id="rightsHolderArray" name="rightsHolderArray" >
                                                        <input type="hidden" id="appApplicationYear" name="appApplicationYear" >
                                                        <input type="hidden" id="languageArray" name="languageArray" >

                                                        <!-- Tab-content -->
                                                        <div id="applicationEditForm-tab-content" class="tab-content"  style="background-color: #E8F6FF">

                                                            <!--Original and Contracts-->
                                                            <div class="tab-pane active" id="originalContracts">

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                    <div class="col-md-4">
                                                                        <label for="appReferenceNumber" class="control-label pull-left">Reference Number</label>
                                                                        <input  id="appReferenceNumber" 
                                                                                type="text"                                                  
                                                                                class="form-control"    
                                                                                name="appReferenceNumber"   
                                                                                readonly="readonly"
                                                                                >
                                                                    </div>

                                                                    <div class="col-md-2 col-md-offset-2">
                                                                        <label for="appStatus" class="control-label pull-left">Status</label>
                                                                        <input id="appStatus"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="appStatus"         

                                                                               >
                                                                    </div>

                                                                    <div class="col-md-2">

                                                                        <div class="form-group">                                              
                                                                            <label for="changeStatus" class="control-label pull-left">Change Status</label>
                                                                            <!--<div class="col-sm-6 col-md-4">-->
                                                                            <select id="changeStatus" required="required" class="form-control select-css">
                                                                                <option value="Change status to" selected="selected">Change status to</option>
                                                                                <option value="open">Open</option>
                                                                                <option value="pending">Pending</option>
                                                                                <option value="closed">Closed</option>
                                                                            </select>
                                                                        </div>
                                                                    </div> <!--row-->
                                                                </div> 

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 5px">

                                                                    <div class="col-md-8">
                                                                        <label for="appBookTitle" class="control-label pull-left">Book Title</label>
                                                                        <input  id="appBookTitle" 
                                                                                type="text"                                                  
                                                                                class="form-control"    
                                                                                name="appBookTitle"    

                                                                                >
                                                                    </div>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 5px">

                                                                    <div class="col-md-8">
                                                                        <label for="authorList" class="control-label pull-left">Author(s)</label>
                                                                        <input  id="authorList" 
                                                                                type="text"                                                  
                                                                                class="form-control"    
                                                                                name="authorList"    

                                                                                >
                                                                    </div>
                                                                    <input type="hidden" id="TranslatorName" name="TranslatorName" >
                                                                    <div class="col-md-2">
                                                                        <div class="form-group">                                              
                                                                            <label for="genderSelect" class="control-label pull-left">Gender</label>
                                                                            <!--<div class="col-sm-6 col-md-4">-->
                                                                            <select id="genderSelect" required="required" class="form-control select-css">
                                                                                <option value="" selected="selected">Select gender</option>

                                                                                <option value="Male">Male</option>
                                                                                <option value="Female">Female</option>
                                                                                <option value="Other">Other</option>
                                                                            </select>
                                                                        </div>
                                                                        <input id="gender"                                
                                                                               type="hidden"                                                            
                                                                               name="gender"                                
                                                                               >
                                                                    </div>

                                                                </div> <!--row-->

                                                                <!--second row-->
                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                    <div class="col-md-8">        
                                                                        <label for="appCompany" class="control-label pull-left">Publisher</label>
                                                                        <input id="appCompany"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="appCompany"    

                                                                               >
                                                                    </div>

                                                                </div> <!--row-->

                                                                <div class="container-fluid"  style="background-color: #d9d1d1">

                                                                    <div class="row">

                                                                        <!-- Navbar -->
                                                                        <nav class="navbar navbar-default" >

                                                                            <div class="container-fluid"  style="background-color: #d9d1d1">     

                                                                                <div class="navbar-header">
                                                                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2" aria-expanded="false">
                                                                                        <span class="sr-only">Toggle navigation</span>
                                                                                        <span class="icon-bar"></span>
                                                                                        <span class="icon-bar"></span>
                                                                                        <span class="icon-bar"></span>
                                                                                    </button>                                                               
                                                                                </div>                                                           

                                                                                <!-- tn -->
                                                                                <div  id="tn"></div>  

                                                                                <!-- tnc -->
                                                                                <div class="tab-content pull-left" id="tnc"></div>  

                                                                                <!-- ########################################################################### --> 





                                                                                <!--addTranslatorModal-->
                                                                                <div class="modal fade" id="addTranslatorModal" tabindex="-1" role="dialog" aria-labelledby="addTranslatorModalLabel">
                                                                                    <div class="modal-dialog">
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header" style="background-color: #c3bcbc">
                                                                                                <button type="button" class="close" data-dismiss="modal"  onclick="backToTranslators();"  aria-hidden="true">&times;</button>
                                                                                                <h4 class="modal-title" id="addTranslatorModalLabel">add more Translators</h4>
                                                                                            </div>


                                                                                            <div class="modal-body" style="background-color: #d9d1d1">

                                                                                                <div class="row" style="margin-bottom: 10px">
                                                                                                    <div class='col-sm-12'>

                                                                                                        <div  id="generatedForm" class="input-group" style='margin-bottom:2px'>
                                                                                                            1. Translator <input type="text" id="first0" value="Name" style='margin-bottom:2px'>                                                         
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="modal-footer"  style="background-color: #c3bcbc">
                                                                                                <button id="addElement" type="button" value="Add another Translator"  class="btn btn-group-sm  button teal pull-left">Add another Translator</button>
                                                                                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="backToTranslators();">Done</button>
                                                                                                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                                                                            </div> <!--modal footer -->
                                                                                        </div> <!--modal content-->          
                                                                                    </div> <!--modal dialog-->
                                                                                </div> <!--modal fade-->

                                                                                <div class="row" id="translatorRemedy" style="margin-bottom: 10px; display: none">

                                                                                    <div class="panel panel-default col-md-9">
                                                                                        <div class="panel-body">

                                                                                            <div class="col-sm-4"> 

                                                                                                <div class="form-group  has-feedback">
                                                                                                    <label class="control-label pull-left" id="translatorNameLabel">Translator</label>
                                                                                                    <input id="translatorName"                                
                                                                                                           type="text"                                
                                                                                                           class="form-control"                                
                                                                                                           name="translatorName"                                
                                                                                                           value=""    
                                                                                                           required
                                                                                                           placeholder="Translator Name"
                                                                                                           >
                                                                                                </div>

                                                                                                <div id="addTransl"></div>

                                                                                            </div>

                                                                                            <div class="col-sm-4"> 
                                                                                                <button type="button"                   
                                                                                                        id="uploadDocuments"
                                                                                                        class="btn btn-success"
                                                                                                        title="upload documents"
                                                                                                        style="margin-top: 20px;display:none;"
                                                                                                        name="uploadDocuments"
                                                                                                        onclick="myFunction();"
                                                                                                        >                                                               
                                                                                                    <span class="glyphicon glyphicon-import"></span>
                                                                                                </button>           
                                                                                            </div>

                                                                                            <div class="col-sm-4">
                                                                                                <label for="addTranslatorModala" class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                                                <button type="button"                   
                                                                                                        id="addTranslatorModala"
                                                                                                        class="btn btn-success"
                                                                                                        data-toggle="modal" 
                                                                                                        data-target="#addTranslatorModal"
                                                                                                        title="Add more translators"
                                                                                                        style="margin-top: 25px;"
                                                                                                        name="addTranslatorModala"
                                                                                                        onclick="copyFirstTranslatorName();"
                                                                                                        >Add more translators                                                             
                                                                                                    <span class="glyphicon glyphicon-import"></span>
                                                                                                </button>           
                                                                                            </div>

                                                                                        </div><!--panel-body-->
                                                                                    </div><!--panel-default-->

                                                                                </div> <!--row-->


                                                                                <!-- ########################################################################### -->       

                                                                            </div>  <!-- <div class="container-fluid"  -->

                                                                        </nav>  <!-- <nav class="navbar -->

                                                                    </div>  <!-- row  -->

                                                                </div> <!-- container-fluid  -->

                                                                <div class="container-fluid ">
                                                                    <div class = "panel panel-default tab-content pull-left">
                                                                        <div class="panel-heading panel-heading-translationRightsHolder"> 

                                                                            <h1><strong>Original Work / Translation Sample</strong></h1>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <div class="container">
                                                                                <div class="col-md-12">
                                                                                    <div class="row" style="margin-top: 30px;margin-bottom: 30px">

                                                                                        <table class="originalTransSample" border="0">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th> <label>&nbsp;</label></th>
                                                                                                    <th> <label>Literature Ireland Staff option</label></th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td>                                                                    
                                                                                                        <div class="pull-left"> 
                                                                                                            <div class="col-md-2">
                                                                                                                <input id="appOriginal"
                                                                                                                       type="hidden"                                                             
                                                                                                                       name="appOriginal"                                
                                                                                                                       >
                                                                                                            </div>
                                                                                                            <div class="form-group pull-left">
                                                                                                                <div class="originalWork pull-left"  style=" margin-left: 10px">
                                                                                                                    <a class="btn btn-info" role="button" id="original" target="_blank">
                                                                                                                        <span class="glyphicon glyphicon-file"></span>
                                                                                                                    </a>
                                                                                                                </div> 
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </td>

                                                                                                    <td> 
                                                                                                        <div class="form-group pull-left">

                                                                                                            <div class="originalWork pull-left"  style=" margin-left: 10px">
                                                                                                                <label class="btn btn-success btn-file pull-left">
                                                                                                                    <span class="glyphicon glyphicon-folder-open"></span>
                                                                                                                    &nbsp;&nbsp;Original Work &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" 
                                                                                                                                                                                         onchange="generatedLabels()" 
                                                                                                                                                                                         name="Original" 
                                                                                                                                                                                         id="originalWork">
                                                                                                                </label>
                                                                                                                <input  type="text" id="label_originalWork" class="pull-left"/>
                                                                                                                <input type="hidden" value="Agreement" name="destination" id="originalWork_upload"/>
                                                                                                                <span class="help-block"></span> 
                                                                                                            </div> 
                                                                                                        </div>
                                                                                                    </td>
                                                                                                </tr>

                                                                                                <tr>
                                                                                                    <td>                                                                    
                                                                                                        <div class="input-group pull-left">  
                                                                                                            <div class="col-md-2">
                                                                                                                <input id="appcopiesTranslationSample"                                
                                                                                                                       type="hidden"                                                            
                                                                                                                       name="appcopiesTranslationSample"                                
                                                                                                                       >
                                                                                                            </div>
                                                                                                            <div class="form-group pull-left">
                                                                                                                <div class="originalWork pull-left"  style=" margin-left: 10px">
                                                                                                                    <a class="btn btn-info" role="button" id="copiesTranslationSample" target="_blank">
                                                                                                                    </a>
                                                                                                                </div> 
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </td>

                                                                                                    <td>                                                                    
                                                                                                        <div class="form-group pull-left">                                                                        

                                                                                                            <div class=" translationSample pull-left"  style="margin-left: 10px">
                                                                                                                <label class="btn btn-success btn-file pull-left" id="copiesTranslationSample1">
                                                                                                                    <span class="glyphicon glyphicon-folder-open"></span>
                                                                                                                    Translation Sample&nbsp;&nbsp; <input type="file" onchange="generatedLabels()" name="TranslationSample" id="translationSample">
                                                                                                                </label>
                                                                                                                <input  type="text" id="label_translationSample" class="pull-left" />
                                                                                                                <input type="hidden" value="Agreement" name="destination" id="translationSample_upload"/>
                                                                                                                <span class="help-block"></span> 
                                                                                                            </div> 
                                                                                                        </div>
                                                                                                    </td>
                                                                                                </tr>

                                                                                            </tbody>

                                                                                        </table>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div> <!-- container-fluid  -->

                                                                <div class="container-fluid ">
                                                                    <div class = "panel panel-default tab-content pull-left">

                                                                        <div class="panel-heading panel-heading-translationRightsHolder pull-left"> 

                                                                            <h1><strong>Translation rights holder:</strong></h1>
                                                                        </div>

                                                                        <div class = "panel-body">

                                                                            <div class="container">

                                                                                <div class="row" style="margin-top: 30px;margin-bottom: 30px">

                                                                                    <div class="col-md-12">
                                                                                        <div class="tab-content pull-left" id="agreementTranslationRightsHolderName"></div>
                                                                                    </div>

                                                                                </div> <!--row-->

                                                                                <div class="row" style="margin-top: 30px;margin-bottom: 30px">

                                                                                    <div class="col-md-12">
                                                                                        <div class="tab-content" id="agreementTranslationRightsHolder"></div>
                                                                                    </div>

                                                                                </div> <!--row-->

                                                                                <div class="row" style="margin-bottom: 20px">

                                                                                    <div class="col-md-12">
                                                                                        <div class="tab-content" id="addendumAgreementTranslationRightsHolder"></div>  
                                                                                    </div>

                                                                                </div> <!--row-->

                                                                            </div><!--container-->

                                                                        </div> <!--panel-heading-translationRightsHolder-->

                                                                    </div> <!--panel-default-->

                                                                </div> <!-- container-fluid  -->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                    <div class="col-md-4">
                                                                        <label for="appDateOfPublicationOriginal" class="control-label pull-left">Year of publication <br/>(of the original)</label>
                                                                        <input id="appDateOfPublicationOriginal"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="appDateOfPublicationOriginal"   

                                                                               >
                                                                    </div>

                                                                    <div class="col-md-4">
                                                                        <label for="appPageExtentOriginal" class="control-label pull-left">Page extent <br/>(of the original)</label>
                                                                        <input  id="appPageExtentOriginal" 
                                                                                name="appPageExtentOriginal" 
                                                                                type="text"                                                                
                                                                                class="form-control"  

                                                                                >
                                                                    </div>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                    <div class="col-sm-4" style="margin-bottom: 20px">
                                                                        <label for="translationTitle" class="pull-left">Translation Title <br/> &nbsp;</label>
                                                                        <input id="translationTitle"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="translationTitle"                                
                                                                               value=""    
                                                                               placeholder="Translation Title"
                                                                               >
                                                                    </div>
                                                                    <div class="col-sm-3">  
                                                                        <div class="form-group has-feedback pull-left">
                                                                            <label for="bilingual" class="control-label pull-left">Bilingual edition</label>
                                                                            <br/> 
                                                                            <label style="font-size: 2.0em; " class="checkbox-inline  no_indent">
                                                                                <input id="bilingual"
                                                                                       type="checkbox"                                
                                                                                       class="form-control"                                
                                                                                       name="bilingual"  
                                                                                       >
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                    <div class="col-md-4">        
                                                                        <label for="appCountryOfPublication" class="control-label pull-left">Country of publication <br/>(of the original)</label>
                                                                        <input id="appCountryOfPublication"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="appCountryOfPublication"      

                                                                               >
                                                                    </div>

                                                                    <div class="col-md-4">
                                                                        <label for="appLanguageOriginal" class="control-label pull-left">Language <br/>(of the original)</label>
                                                                        <input  id="appLanguageOriginal" 
                                                                                name="appLanguageOriginal" 
                                                                                type="text"                                                                
                                                                                class="form-control" 

                                                                                >
                                                                    </div>

                                                                    <div class="col-md-2">        
                                                                        <label for="appGenre" class="control-label pull-left">&nbsp;<br/> Genre</label>
                                                                        <input id="appGenre"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="appGenre"               

                                                                               >
                                                                    </div>

                                                                </div> <!--row-->



                                                                <div class="row" style="margin-bottom: 40px;margin-top: 30px">   

                                                                    <div class="col-md-4">
                                                                        <label for="appNotesAboutApplication" class="control-label pull-left">Notes about Application</label>
                                                                        <!--keep in one line otherwise placeholder doesn't show-->
                                                                        <textarea id="appNotesAboutApplication" class="form-control" name="appNotesAboutApplication"  style="width: 800px; height: 215px" placeholder="Notes"></textarea>
                                                                    </div>

                                                                </div> <!--row-->


                                                            </div> <!--tab-pane" id="originalContracts" -->

                                                            <!--Publisher and Translation-->
                                                            <div class="tab-pane" id="publisherTranslation">      

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                    <div class="col-md-4">
                                                                        <label for="appForeignPublisher" class="control-label pull-left">Target publisher</label>
                                                                        <input id="appForeignPublisher"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="appForeignPublisher"   

                                                                               >
                                                                    </div>

                                                                    <div class="col-md-4">
                                                                        <label for="appForeignCountry" class="control-label pull-left">Target country </label>
                                                                        <input  id="appForeignCountry" 
                                                                                name="appForeignCountry" 
                                                                                type="text"                                                                
                                                                                class="form-control"     

                                                                                >
                                                                    </div>

                                                                    <div class="col-md-4">        
                                                                        <label for="appTargetLanguage" class="control-label pull-left"> Target language</label>
                                                                        <input id="appTargetLanguage"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="appTargetLanguage"     

                                                                               >
                                                                    </div>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 5px">

                                                                    <div class="col-lg-12">
                                                                        <div class="pull-left">
                                                                            <div class="box">
                                                                                <div class="box-header">
                                                                                    <h4 class="marginLeft">                                                                                
                                                                                        Track record for Translator(s):  
                                                                                    </h4>
                                                                                </div>

                                                                                <div class="col-lg-12" style="margin-bottom: 20px;margin-top: 5px">
                                                                                    <div id="translTrackDiv" class="table-responsive"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->


                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                    <div class="col-md-7">
                                                                        <label for="breakDownTranslatorFee" class="control-label pull-left">Break-down of translator(s)'s fee</label>
                                                                        <!--<div class="input-group" style="margin-bottom: 40px">-->
                                                                        <textarea id="breakDownTranslatorFee"  class="form-control" name="breakDownTranslatorFee" style="height: 98px"  ></textarea>
                                                                        <!--</div>-->
                                                                    </div>


                                                                    <div class="col-md-4">
                                                                        <label for="apptranslatorFee" class="control-label pull-left">Translator(s)'s fee</label>
                                                                        <div class="input-group  pull-left" style="margin-bottom: 40px">                                                               
                                                                            <label class="input-group-addon" for="apptranslatorFee">                                                           
                                                                                <span class="glyphicon glyphicon-euro"></span>                                     
                                                                            </label>
                                                                            <input type="text" class="form-control"   name="apptranslatorFee" id="apptranslatorFee" placeholder="fee">    
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->


                                                                <div class="row" style="margin-bottom: 40px;margin-top: 5px"> 

                                                                    <div class="col-md-12">
                                                                        <label for="previousGrantAid" class="control-label pull-left"> Previous grant aid</label>
                                                                        <textarea id="previousGrantAid" class="form-control"   name="previousGrantAid" style="height: 183px" placeholder="author name, title, application year, amount awarded, etc " ></textarea>
                                                                    </div>

                                                                </div> <!--row-->

                                                            </div> <!--tab-pane" id="publisherTranslation" -->

                                                            <!-- Reader’s  Report -->
                                                            <div class="tab-pane" id="readerReport" style="margin-bottom: 140px;">

                                                                <div class="row" style="margin-bottom: 130px;margin-top: 20px;"> 

                                                                    <div class='col-md-6' style="margin-bottom: 100px;"> 
                                                                        <button class="btn btn-success btn-xs pull-left" 
                                                                                style="margin-bottom: 20px;" 
                                                                                id="assign_expert_reader_to_reference_number_Btn" 
                                                                                type="button" 
                                                                                onclick="getTodaysDate()" 
                                                                                data-toggle="modal" 
                                                                                data-target="#assignEReadermodal">                                                                   
                                                                        </button>
                                                                        <!--<a class="btn" data-toggle="modal" href="#stack2">Launch modal</a>-->
                                                                        <!-- additionalExpertReader -->
                                                                        <div class="row" style="margin-top: 5px"> 
                                                                            <div id="additionalExpertReader"></div>
                                                                        </div> <!--row-->   
                                                                    </div>

                                                                </div> <!--row-->      

                                                            </div>  <!--tab-pane" id="readerReport" -->

                                                            <!--Board  Meeting-->
                                                            <div class="tab-pane" id="boardMeeting">

                                                                <div class="row" style="margin-bottom: 40px;margin-top: 40px">   

                                                                    <div class='col-md-3 col-sm-offset-1'>
                                                                        <div class="form-group has-feedback">
                                                                            <label for="appDateOfBoardMeeting" class="control-label pull-left">Board meeting</label>                                                                   
                                                                            <div class="input-group  pull-left" >
                                                                                <input type="text" 
                                                                                       name="appDateOfBoardMeeting" 
                                                                                       id="appDateOfBoardMeeting" 
                                                                                       class="form-control" 
                                                                                       placeholder="DD/MM/YYYY" />    
                                                                                <label class="input-group-addon" for="appDateOfBoardMeeting">
                                                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                                                </label>
                                                                            </div> 
                                                                        </div>                                                            

                                                                        <script>
                                                                            $("#appDateOfBoardMeeting").datepicker().on('change', function () {
                                                                                $(this).valid(); // triggers the validation test
                                                                                // '$(this)' refers to '$("#datepicker")'
                                                                            });
                                                                        </script>
                                                                    </div>

                                                                    <div class="col-md-4 col-sm-offset-3">
                                                                        <div class="form-row">
                                                                            <div class="form-group  text-center">
                                                                                <label for="directorChairDecision" class="control-label">Director/Chair decision</label>
                                                                                <input id="directorChairDecision"
                                                                                       type="checkbox"      
                                                                                       class="form-control" 
                                                                                       value="ticked"             
                                                                                       name="directorChairDecision"  
                                                                                       onclick="directorChairDecision_click(this);"
                                                                                       >
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">   

                                                                    <div class="col-md-3 col-sm-offset-1">
                                                                        <div class="form-group">
                                                                            <label for="amountRequested" class="pull-left control-label">Amount requested</label> 
                                                                            <!--<strong class="pull-left">Amount requested</strong>--> 
                                                                            <div class="input-group pull-left">
                                                                                <label class="input-group-addon" for="amountRequested">
                                                                                    <span class="glyphicon glyphicon-euro"></span>                                     
                                                                                </label>
                                                                                <input type="text" class="form-control" name="amountRequested" id="amountRequested" placeholder="Amount Requested">    
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class='col-md-3'>
                                                                        <div class="form-group">
                                                                            <label for="amountRequested" class="pull-left control-label">Proposed  publication date </label>
                                                                            <div class="input-group pull-left" >
                                                                                <input type="text" name="appproposedDateOfPublication" 
                                                                                       id="appproposedDateOfPublication" 
                                                                                       class="form-control" 
                                                                                       placeholder="DD/MM/YYYY" />    
                                                                            </div> 
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                                    <div class="col-md-3 col-sm-offset-1">   
                                                                        <div class="form-group">
                                                                            <label for="appplannedPageExtent" class="control-label pull-left">Planned page extent</label>
                                                                            <input id="appplannedPageExtent"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="appplannedPageExtent"  
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-3">
                                                                        <div class="form-group">
                                                                            <label for="appproposedPrintRun" class="control-label pull-left">Proposed print run</label>
                                                                            <input  id="appproposedPrintRun" 
                                                                                    name="appproposedPrintRun" 
                                                                                    type="text"                                                                
                                                                                    class="form-control"                                                            
                                                                                    >
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <label for="award" class="control-label"> Award </label>
                                                                            <br/> 
                                                                            <input id="award"
                                                                                   type="checkbox"                                
                                                                                   class="form-control not-allowed"   
                                                                                   value="ticked" 
                                                                                   name="award"                                                                                                                                                                          
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->


                                                                <div class="row" style="margin-bottom: 20px;margin-top: 5px">  

                                                                    <div class="col-md-3 col-sm-offset-1">
                                                                        <div class="form-group">
                                                                            <label for="amountApproved"   class="control-label pull-left">Amount approved</label> 
                                                                            <div class="input-group pull-left">
                                                                                <label class="input-group-addon" for="amountApproved">
                                                                                    <span class="glyphicon glyphicon-euro"></span>                                     
                                                                                </label>
                                                                                <input type="text" class="form-control" name="amountApproved" id="amountApproved" placeholder="Amount Approved">    
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class='col-md-3'>
                                                                        <div class="form-group">
                                                                            <label for="datePublisherInformedOfMeeting"  class="control-label pull-left">Publisher informed of meeting</label>
                                                                            <div class="input-group pull-left">
                                                                                <input type="text" name="datePublisherInformedOfMeeting" id="datePublisherInformedOfMeeting" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                                <label class="input-group-addon" for="datePublisherInformedOfMeeting">
                                                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                                                </label>
                                                                            </div> 
                                                                        </div>
                                                                    </div>

                                                                    <script>
                                                                        $("#datePublisherInformedOfMeeting").datepicker().on('change', function () {
                                                                            $(this).valid(); // triggers the validation test
                                                                            // '$(this)' refers to '$("#datepicker")'
                                                                        });
                                                                    </script>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">   

                                                                    <div class="col-md-11 col-sm-offset-1">
                                                                        <label for="commentsAboutMeeting" class="control-label pull-left">Board comments/instructions </label>
                                                                        <textarea id="commentsAboutMeeting" class="form-control" name="commentsAboutMeeting" style="height: 98px" placeholder="'Refuse funding’ , ‘Award €1,000’ , ‘Postpone to next round’ , ‘Request revised sample'"></textarea>
                                                                    </div>

                                                                    <div class="row"> 
                                                                        <div class='col-md-12 button-wrapper' style="margin-bottom: 40px;margin-top: 60px"> 

                                                                            <button class='btn btn-success outline approved'  onClick="reply_click(this.id)" type="button" name="Approved"   id="Approved">Approved</button>
                                                                            <button class='btn btn-warning outline withdrawn' onClick="reply_click(this.id)" type="button" name="Withdrawn"  id="Withdrawn">Withdrawn</button>
                                                                            <button class='btn btn-danger outline rejected'   onClick="reply_click(this.id)" type="button" name="Rejected"   id="Rejected">Rejected</button>
                                                                            <!--</div>-->
                                                                        </div>                                                          

                                                                    </div> <!--row-->
                                                                    <div class="checkbox SendApproveRejectEmailtoPublisherToggle" id="SendApproveRejectEmailtoPublisherToggle">
                                                                        <label class="checkbox-inline" id="sendApproveRejectEmailtoPublisher">
                                                                            <input type="checkbox"   value="ticked"  id="SendApproveRejectEmailtoPublisher" name="SendApproveRejectEmailtoPublisher" >
                                                                            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                                                            Send email to publisher     &nbsp;   &nbsp;</label>                                                                   
                                                                        <i class="fas fa-envelope fa-4x"id="styleSendApproveRejectEmailtoPublisher" style=" vertical-align: middle;"></i>
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" name="ApproveWithdrawnReject" id="ApproveWithdrawnReject" />   

                                                            </div> <!--tab-pane" id="boardMeeting" -->

                                                            <!--Contract -->
                                                            <div class="tab-pane" id="contract">



                                                                <div class="row" style="margin-bottom: 60px;margin-top: 30px;">

                                                                    <div class="target col-md-8 col-md-offset-1">
                                                                        <label for=cover" class="control-label h1">Book cover</label>
                                                                        <img id="cover" src="" alt="Book Cover" class="grow img ImageBorder form-control" title="Book Cover"/>
                                                                        <br/>
                                                                        <label id="changeBookCoverBtn"  class="btn btn-warning btn-file">Change book cover</label>

                                                                    </div> 
                                                                    <!--<label id="origSize"></label>-->  
                                                                    <div class='col-md-3 pull-left'>
                                                                        <div class=" panel panel-success pull-left">
                                                                            <div class="panel-heading "  style="margin-top: 15px;">
                                                                                <div class="panel-title">Adjust cover size</div>

                                                                            </div>
<!--                                                                            <label id="origSize"></label>-->
                                                                            <br/>
                                                                            <div class='panel-body'>
                                                                                <div class='panel-body col-md-2'>
                                                                                    <div id="slider-vertical" ></div>
                                                                                </div>  
                                                                              
                                                                            </div> 
                                                                        </div>
                                                                    </div> 
                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 5px"> 
                                                                    <div class='col-md-3 col-sm-offset-1'>
                                                                        <strong class=" pull-left">Contract sent to publisher</strong>
                                                                        <div class="input-group pull-left">
                                                                            <input type="text" name="dateContractSenttoPublisher" id="dateContractSenttoPublisher" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                            <label class="input-group-addon" for="dateContractSenttoPublisher">
                                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                            </label>
                                                                        </div>
                                                                    </div>

                                                                    <script>
                                                                        $("#dateContractSenttoPublisher").datepicker().on('change', function () {
                                                                            $(this).valid(); // triggers the validation test
                                                                            // '$(this)' refers to '$("#datepicker")'
                                                                        });
                                                                    </script>

                                                                    <div class='col-md-3 col-sm-offset-1'>
                                                                        <strong class=" pull-left">Acknowledgement approved</strong>
                                                                        <br/>
                                                                        <div class="input-group">
                                                                            <input type="text" name="dateILEAcknowledgementApproved" id="dateILEAcknowledgementApproved" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                            <label class="input-group-addon" for="dateILEAcknowledgementApproved">
                                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                            </label>
                                                                        </div> 
                                                                    </div>

                                                                    <script>
                                                                        $("#dateILEAcknowledgementApproved").datepicker().on('change', function () {
                                                                            $(this).valid(); // triggers the validation test
                                                                            // '$(this)' refers to '$("#datepicker")'
                                                                        });
                                                                    </script>
                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px"> 

                                                                    <div class='col-md-3 col-sm-offset-1'>
                                                                        <strong class=" pull-left"> Date published books received</strong>
                                                                        <br/>
                                                                        <div class="input-group">
                                                                            <input type="text" name="datePublishedBooksReceived" id="datePublishedBooksReceived" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                            <label class="input-group-addon" for="datePublishedBooksReceived">
                                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                            </label>
                                                                        </div>   
                                                                    </div>

                                                                    <script>
                                                                        $("#datePublishedBooksReceived").datepicker().on('change', function () {
                                                                            $(this).valid(); // triggers the validation test
                                                                            // '$(this)' refers to '$("#datepicker")'
                                                                        });
                                                                    </script>

                                                                    <div class='col-md-3 col-sm-offset-1'>
                                                                        <strong class=" pull-left"> Date Payment Made to Publisher </strong>
                                                                        <br/>
                                                                        <div class="input-group">
                                                                            <input type="text" name="datePaymentMadeToPublisher" id="datePaymentMadeToPublisher" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                            <label class="input-group-addon" for="datePaymentMadeToPublisher">
                                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                            </label>
                                                                        </div>   
                                                                    </div>

                                                                    <script>
                                                                        $("#datePaymentMadeToPublisher").datepicker().on('change', function () {
                                                                            $(this).valid(); // triggers the validation test
                                                                            // '$(this)' refers to '$("#datepicker")'
                                                                        });
                                                                    </script>

                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px"> 

                                                                    <div class="col-md-4 col-sm-offset-1">
                                                                        <label for="paymentReferenceNumber" class="control-label pull-left">Payment reference number</label>
                                                                        <input id="paymentReferenceNumber"
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="paymentReferenceNumber"                                
                                                                               >
                                                                    </div>
                                                                </div> <!--row-->

                                                                <!-- ####################################################################### -->

                                                                <table border="0" class="submissions col-md-offset-1" cellspacing=12 style="margin-bottom: 80px; margin-top: 80px">

                                                                    <tbody>
                                                                        <tr>
                                                                            <td>&nbsp;</td>
                                                                            <td>&nbsp;</td>
                                                                            <td>&nbsp;</td>
                                                                            <td>&nbsp;</td>
                                                                            <td>&nbsp;</td>                                                                   
                                                                        </tr>
                                                                        <tr>
                                                                            <td>&nbsp;</td>
                                                                            <td><strong class="pull-left">Documents</strong> </td>

                                                                            <td  align="right" style="text-align: right; vertical-align: middle;">                                                                                                                                
                                                                                <div class="col-md-2 pull-left">
                                                                                    <input id="appProofPaymentToTranslator"
                                                                                           type="hidden"                                                             
                                                                                           name="appProofPaymentToTranslator"                                
                                                                                           >
                                                                                </div>

                                                                                <label class="pull-left" id="label_proofPaymentToTranslator"></label>

                                                                                <a class="btn btn-info pull-left" role="button" id="proofPaymentToTranslator" target="_blank">
                                                                                    <span class="glyphicon glyphicon-file"></span>
                                                                                    Proof of payment <br/> to the translator</a>                                                                              
                                                                            </td>

                                                                            <td style="text-align: center; vertical-align: middle;">                                                                                                                                          
                                                                                <div class="col-md-2 pull-left">
                                                                                    <input id="appBankDetailsForm"                                
                                                                                           type="hidden"                                                            
                                                                                           name="appBankDetailsForm"                                
                                                                                           >
                                                                                </div>

                                                                                <label class="pull-left" id="label_bankDetailsForm"></label>

                                                                                <a class="btn btn-info pull-left" role="button" id="bankDetailsForm" target="_blank">
                                                                                    <span class="glyphicon glyphicon-file"></span>
                                                                                    Bank Details Form<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                                                            </td>

                                                                            <td style="text-align: center; vertical-align: middle;">                                                                                                                                         
                                                                                <div class="col-md-2">
                                                                                    <input id="appSignedLIContract"                                
                                                                                           type="hidden"                                                            
                                                                                           name="appSignedLIContract"                                
                                                                                           >
                                                                                </div>

                                                                                <label class="pull-left" id="label_signedLIContract"></label>

                                                                                <a class="btn btn-info pull-left" role="button" id="signedLIContract" target="_blank">
                                                                                    <span class="glyphicon glyphicon-file"></span>
                                                                                    Signed Literature <br/> Ireland contract</a>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>&nbsp;</td>
                                                                            <td><strong> Literature Ireland Staff &nbsp; &nbsp;<br/>option</strong></td>
                                                                            <td>                                           
                                                                                <div class="pull-left" > 
                                                                                    <div  style="margin-bottom: 10px;"><strong class="pull-left"  id="proofPaymentDiv1"></strong></div> 
                                                                                    <br/>
                                                                                    <div class="input-group proofPayment pull-left">
                                                                                        <label class="btn btn-success btn-file pull-left">                                                          
                                                                                            <span class="glyphicon glyphicon-file"></span>
                                                                                            Upload / Replace <br/>Proof of payment 
                                                                                            <input type="file"  
                                                                                                   name="ProofPayment" 
                                                                                                   id="proofPayment"
                                                                                                   onchange="generatedLabels()"
                                                                                                   >
                                                                                        </label>
                                                                                    </div> 
                                                                                </div>                                                                               
                                                                            </td>

                                                                            <td>             
                                                                                <div class="pull-left" > 

                                                                                    <div style="margin-bottom: 10px;"><strong class="pull-left"  id="bankDetailForm1"></strong></div> 
                                                                                    <br/>
                                                                                    <div class="input-group bankDetailForm pull-left">
                                                                                        <label class="btn btn-success btn-file pull-left">    
                                                                                            <span class="glyphicon glyphicon-file"></span>
                                                                                            Upload / Replace <br/>Bank details form
                                                                                            <input type="file"  
                                                                                                   name="BankDetails" 
                                                                                                   id="bankDetails"
                                                                                                   onchange="generatedLabels()"
                                                                                                   >
                                                                                        </label>
                                                                                    </div> 
                                                                                </div>                                                                               
                                                                            </td>
                                                                            <td>                                                                
                                                                                <div class="pull-left" >                                                                             
                                                                                    <div  style="margin-bottom: 10px;"><strong class="pull-left"  id="signedLIContract1"></strong></div> 
                                                                                    <br/>
                                                                                    <div class="input-group signedLIcontract pull-left">
                                                                                        <label class="btn btn-success btn-file pull-left">  
                                                                                            <span class="glyphicon glyphicon-file"></span>
                                                                                            Upload / Replace  <br/>signed LI contract
                                                                                            <input type="file"  
                                                                                                   name="SignedLIContract" 
                                                                                                   id="signedLIcontract"
                                                                                                   onchange="generatedLabels()"
                                                                                                   >
                                                                                        </label>                                                                                            
                                                                                    </div> 
                                                                                </div>                                                                          
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>&nbsp;</td>
                                                                            <td><strong class="pull-left"> Filename for upload <br/>if selected</strong></td>
                                                                            <td><br/><input id="label_proofPayment" class="pull-left"></td>
                                                                            <td><br/><input id="label_bankDetails" class="pull-left"></td>
                                                                            <td><br/><input id="label_signedLIcontract" class="pull-left"></td><br/>
                                                                    </tr>

                                                                    </tbody>

                                                                </table>


                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px;">  
                                                                    <div class="col-md-3 col-md-offset-3 panel panel-default" style="background-color: #FFFFED">
                                                                        <div class="panel-body">
                                                                            <div class="col-md-5 col-md-offset-3"  style="margin-bottom: 5px;">
                                                                                <label class="pull-left" for="paymentStatus" >Payment status</label>                                                                  
                                                                                <div class="col-md-8 pull-left">
                                                                                    <select class="selectpicker" id="paymentStatus" name="paymentStatus" >
                                                                                        <option value="Incomplete">Incomplete</option>
                                                                                        <option value="Complete">Complete</option>
                                                                                        <option value="Awaiting payment">Awaiting payment</option>
                                                                                        <option value="Paid">Paid</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>                                                                            
                                                                        </div>
                                                                        <div class="checkbox SendPaidEmailtoPublisherToggle" id="SendPaidEmailtoPublisherToggle">
                                                                            <label class="checkbox-inline" id="sendPaidEmailtoPublisher">
                                                                                <input type="checkbox"   value="ticked"  id="SendPaidEmailtoPublisher" name="SendPaidEmailtoPublisher">
                                                                                <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                                                                Send email to publisher </label>
                                                                            <!--<img src="images/mail-message-send-icon.png" style="background-color: white" width="40" height="40"/>-->
                                                                            <i class="fas fa-envelope fa-4x"id="styleSendPaidEmailtoPublisher" style=" vertical-align: middle;"></i>
                                                                        </div>
                                                                    </div>
                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px"> 

                                                                    <div class="col-md-5 col-sm-offset-1"   style="margin-top: 25px; margin-bottom: 40px">
                                                                        <strong class="pull-left">&nbsp;</strong>                                                 
                                                                        <label class="btn btn-default pull-left" onclick = "pressCuttingsModal();">
                                                                            <img src="images/Press_Cutting.png" width="20" alt="Press_Cutting" /> 
                                                                            Show press coverage                     
                                                                        </label>
                                                                    </div>

                                                                </div> <!--row-->

                                                            </div>   <!--tab-pane" id="contract" -->

                                                            <!--Publisher -->
                                                            <div class="tab-pane" id="publisher">

                                                                <!--get Company and Company_Number via autocomplete-->
                                                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                                    <div class="col-sm-4">
                                                                        <input  id="Company" 
                                                                                name="Company" 
                                                                                type="text" 
                                                                                value="${companyDetails.Company}"
                                                                                data-toggle="tooltip"
                                                                                title="Please Enter your Company's Name - if it does not show up please fill in the form"
                                                                                class="form-control"
                                                                                readonly="readonly"
                                                                                placeholder="Company Name"
                                                                                >
                                                                    </div>

                                                                    <div class="col-sm-4">        
                                                                        <input id="Company_Number"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="Company_Number"                                
                                                                               value="${companyDetails.Company_Number}"                                   
                                                                               placeholder="internal Company Number"
                                                                               readonly="readonly"
                                                                               >
                                                                    </div>
                                                                </div> <!--row-->

                                                                <!--second row-->
                                                                <div class="row" style="margin-bottom: 10px">

                                                                    <div class="col-sm-4">
                                                                        <div class="form-group">
                                                                            <label for="Address1" class="control-label pull-left">Address1</label>
                                                                            <input id="Address1"
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="Address1"                                                          
                                                                                   placeholder="Address1"
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-sm-2">
                                                                        <div class="form-group">
                                                                            <label class="control-label pull-left">Post code</label>
                                                                            <input id="postCode"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="postCode"                                                           
                                                                                   placeholder="Post Code"
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-sm-3">
                                                                        <div class="form-group">
                                                                            <label class="control-label pull-left">City</label>
                                                                            <input id="City"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="City"                                                         
                                                                                   placeholder="City"
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->

                                                                <!--third row-->
                                                                <div class="row" style="margin-bottom: 10px">

                                                                    <div class="col-sm-4">
                                                                        <div class="form-group">
                                                                            <label class="control-label pull-left">Address2</label>
                                                                            <input id="Address2"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="Address2"                                                            
                                                                                   placeholder="Address2"
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-sm-4">
                                                                        <div class="form-group">
                                                                            <label class="control-label pull-left">Country</label>
                                                                            <input id="country"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="Country"                                                          
                                                                                   placeholder="Country"
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->

                                                                <!--fourth row-->
                                                                <div class="row" style="margin-bottom: 10px">

                                                                    <div class="col-sm-4">
                                                                        <label class="control-label pull-left">Address3</label>
                                                                        <input id="Address3"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="Address3"                                                           
                                                                               placeholder="Address3"
                                                                               >
                                                                    </div>

                                                                    <div class="col-sm-2">   
                                                                        <label class="pull-left">&nbsp;</label>
                                                                        <input id="countryCode"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="Country_Code"                                
                                                                               placeholder="Country Code"
                                                                               disabled
                                                                               >
                                                                    </div>

                                                                </div> <!--row-->

                                                                <!--fifth row-->
                                                                <div class="row" style="margin-bottom: 10px">

                                                                    <div class="col-sm-4">      
                                                                        <label class="pull-left">Address4</label>
                                                                        <input id="Address4"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="Address4"                                                             
                                                                               placeholder="Address4"
                                                                               >
                                                                    </div>

                                                                    <div class="col-sm-3">
                                                                        <div class="form-group">
                                                                            <label for="Telephone" class="control-label pull-left">Telephone</label>
                                                                            <input id="Telephone"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="Telephone"                                
                                                                                   required
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->

                                                                <!--sixth row-->
                                                                <div class="row" style="margin-bottom: 10px">

                                                                    <div class="col-sm-4"></div>

                                                                    <div class="col-sm-3">
                                                                        <label class="pull-left">Fax number</label>
                                                                        <input id="Fax"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="Fax"                                
                                                                               >
                                                                    </div>
                                                                </div> <!--row-->


                                                                <!--seventh row-->
                                                                <div class="row" style="margin-bottom: 10px">

                                                                    <div class="col-sm-4">
                                                                        <div class="form-group">
                                                                            <label for="Email" class="pull-left">Email</label>
                                                                            <input id="Email"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="Email"                                                              
                                                                                   placeholder="Main Email"
                                                                                   required
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-sm-4">
                                                                        <div class="form-group">
                                                                            <label for="WWW" class="pull-left">Website</label>
                                                                            <input id="WWW"                                
                                                                                   type="url"                                
                                                                                   class="form-control"                                
                                                                                   name="WWW"                  
                                                                                   pattern="(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&=]*)"                              
                                                                                   placeholder="Web Address"
                                                                                   required
                                                                                   >
                                                                        </div>
                                                                    </div>

                                                                </div> <!--row-->

                                                                <!--eighth row-->
                                                                <div class="row" style="margin-bottom: 10px;margin-top: 20px">
                                                                    <div class="col-sm-4"> 
                                                                        <div class="well well-sm">
                                                                            <div class="checkbox">                                                        
                                                                                <input id="doNotMail" 
                                                                                       type="checkbox" 
                                                                                       name="doNotMail" 
                                                                                       checked =""
                                                                                       >  
                                                                                <label for="doNotMail">Sign up to newsletters</label>
                                                                            </div><!--checkbox-->
                                                                        </div> <!--well-->
                                                                    </div> <!--<div class="col-sm-3">-->   

                                                                </div> <!--row-->



                                                                <div class="row">
                                                                    <div class="col-sm-4">
                                                                        <!--keep in one line otherwise placeholder doesn't show-->
                                                                        <label class="pull-left">Additional contact information</label>
                                                                        <textarea id="companyNotes"  class="form-control" style="width: 870px; height: 343px;margin-bottom: 40px" name="companyNotes" placeholder="enter optional notes" > <c:out value="${companyDetails.Notes}" /></textarea>
                                                                    </div>
                                                                </div> <!--row-->

                                                                <div class="row" style="margin-bottom: 40px">                                                                          
                                                                    <div class="col-sm-6 pull-left">
                                                                        <label class="pull-left">Last updated: &nbsp; </label>

                                                                        <div class="col-sm-3 pull-left"  style="background-color: #eeeeee"  id="lupdateD"></div>
                                                                        <div  class="col-sm-1" style="background-color: #eeeeee" >|</div>
                                                                        <div  class="col-sm-2 pull-left"  style="background-color: #eeeeee" id="lupdateT"></div>
                                                                    </div>

                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                    <input type="submit" class="btn btn-primary" value="Save changes">

                                                                </div>

                                                            </div><!--tab pane publisher-->

                                                        </div>  <!--applicationEditForm-tab-content-->

                                                    </div> <!-- container-fluid --> 

                                                </nav> 

                                            </div><!--modal body-->

                                            <div class="modal-footer"  style="background-color: #c3bcbc">

                                            </div>


                                        </div> <!--modal-content -->
                                    </div> <!--modal-dialog -->
                                </form>
                            </div><!--modal -->

                            <!--changeBookCoverModal-->
                            <div class="modal fade" id="changeBookCoverModal" tabindex="-1" role="dialog">
                                <form id="changeBookCoverForm" name="changeBookCoverForm" enctype="multipart/form-data">


                                    <!--Content-->
                                    <div class="modal-content">
                                        <input type="hidden"  name="Publisher" id="PublisherChangeBookCover">
                                        <input type="hidden"  name="referenceNumber" id="referenceNumberChangeBookCover">
                                        <!--Header-->
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <h4 class="modal-title" id="changeBookCoverTitle">Change book cover</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <!--Body-->
                                        <div class="modal-body" style="background-color: #d9d1d1">

                                            <div id="showUploadCover1" class="showUploadCover1"  style="margin-bottom:  80px; ">

                                                <!-- bootstrap-imageupload. -->                                                               
                                                <div class="imageupload">
                                                    <div class="clearfix">
                                                        <h2 class="panel-title ">Select book cover</h2>
                                                    </div>
                                                    <br/>
                                                    <div class="file-tab cover1" id="cover1">

                                                        <label class="btn btn-default btn-file">
                                                            <span>Browse</span>
                                                            <!-- The file is stored here. -->

                                                            <input type="file" id="Cover1" name="Cover">

                                                        </label>

                                                    </div>
                                                </div>

                                                <input type="hidden" value="Cover" name="image-file" id="label_cover1">
                                            </div>


                                            <div id="showUploadCover2"  style="margin-bottom: 40px; position:absolute; z-index:1; display: none"> 
                                                <div>

                                                    <h3 class="panel-title" id="showUploadCoverTitle"></h3>


                                                    <div  id="cover2" style="display:block;  margin:auto;">

                                                        <img src="" id="cover21"  alt=""  style="width:426px;height:639px;">


                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!--Footer-->
                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                                            <button id="saveBookCoverBtn" type="submit" class="btn btn-primary btn-sm">Save book cover</button>
                                        </div>
                                    </div>
                                </form>
                                <!--/.Content-->
                            </div>


                            <!--listAssignedEReadermodal-->
                            <div class="modal fade" id="listAssignedEReadermodal" data-modal-index="3">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">List assigned expert reader</h4>
                                        </div>

                                        <div class="modal-body" style="background-color: #d9d1d1">

                                            <div class="row" style="margin-bottom: 20px;margin-top: 5px"> 
                                                <div class='col-md-6'>
                                                    <strong class=" pull-left">Expert reader</strong>
                                                    <div class="input-group pull-left">
                                                        <input type="text" name="appExpertReader" 
                                                               id="appExpertReader" 
                                                               class="form-control" 
                                                               />    
                                                    </div>
                                                </div>
                                            </div> <!--row-->                                                      

                                            <div class="row" style="margin-top: 30px;margin-bottom: 10px">
                                                <div class='col-md-4'>
                                                    <strong class=" pull-left"> Sample sent out</strong>
                                                    <div class="input-group pull-left">
                                                        <input type="text" name="sampleSentOut" id="sampleSentOut" class="form-control" placeholder="DD/MM/YYYY" />    
                                                        <label class="input-group-addon" for="sampleSentOut">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <script>
                                                    $("#sampleSentOut").datepicker({
                                                        showWeekDays: true,
                                                        todayHighlight: true,
                                                        autoclose: true
                                                    });
                                                </script>

                                                <div class='col-md-4'>
                                                    <strong class=" pull-left"> Sample returned</strong>
                                                    <div class="input-group pull-left">
                                                        <input type="text" name="sampleReturned" id="sampleReturned" class="form-control" placeholder="DD/MM/YYYY" />    
                                                    </div>
                                                </div>
                                            </div> <!--row-->

                                            <div class="row" style="margin-bottom: 20px;">
                                                <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">  
                                                    <div class="col-md-2">
                                                        <input id="ReadersReport"                                
                                                               type="hidden"                                                            
                                                               name="ReadersReport"                                
                                                               >
                                                    </div>
                                                    <a class="btn btn-info" role="button" id="appReadersReport" >
                                                        <span class="glyphicon glyphicon-file"></span>
                                                        Reader’s Report</a>
                                                </div>

                                                <div class="col-md-10">
                                                    <label for="readerReportSummary" class="control-label pull-left"> Reader’s report summary1</label>
                                                    <textarea id="readerReportSummary" 
                                                              class="form-control"                                               
                                                              name="readerReportSummary"    
                                                              style="height: 98px"
                                                              >                 
                                                    </textarea>
                                                </div>
                                            </div> <!--row-->  
                                            <div class="modal-footer"  style="background-color: #c3bcbc">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                            </div>
                                        </div><!-- /.modal-body -->
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->

                            <!--User-->
                            <div class="tab-pane fade" id="User">

                                <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                                    <div class="table-responsive">
                                        <table id="user" class="display user table table-striped table-bordered  dt-responsive nowrap" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th class="details-control"></th>              
                                                    <th class="all">User Name</th>
                                                    <th class="all">First Name</th>
                                                    <th class="all">Last Name</th>
                                                    <th class="all">Email</th>
                                                    <th class="all">Function</th>
                                                    <th class="never">Role</th>
                                                    <th class="all"></th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <!-- Main Grid -->   
                                            </tbody>

                                            <tfoot>
                                                <tr>
                                                    <th class="details-control"></th>
                                                    <th class="all">User Name</th>
                                                    <th class="all">First Name</th>
                                                    <th class="all">Last Name</th>
                                                    <th class="all">Email</th>
                                                    <th class="all">Function</th>
                                                    <th class="never">Role</th>
                                                    <th class="all"></th>
                                                </tr>
                                            </tfoot>

                                        </table>

                                    </div>    

                                    <c:if test="${not empty error}">Error: ${error}</c:if>

                                    </div> <!-- /container-fluid -->

                                    <!--userModal-->
                                    <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel">

                                        <div class="modal-dialog" role="document">

                                            <div class="modal-content">

                                                <div class="modal-header" style="background-color: #c3bcbc">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="userModalLabel"><span id="usr_name">_</span></h4>
                                                </div>

                                                <div class="modal-body" style="background-color: #d9d1d1">

                                                    <div class="row" style="margin-bottom: 5px;margin-top: 5px">

                                                        <div class="col-md-4">
                                                            <label for="userUname" class="control-label pull-left">Username</label>
                                                            <input  id="userUname" 
                                                                    type="text"                                                  
                                                                    class="form-control"    
                                                                    name="userUname"    
                                                                    >
                                                        </div>

                                                    </div> <!--row-->

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                        <div class="col-md-4">
                                                            <label for="userFirstName" class="control-label pull-left">First name</label>
                                                            <input id="userFirstName"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userFirstName"                                
                                                                   >
                                                        </div>

                                                        <div class="col-md-4">
                                                            <label for="userLastName" class="control-label pull-left">Last name</label>
                                                            <input id="userLastName"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userLastName"                                
                                                                   >
                                                        </div>

                                                    </div> <!--row-->

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                        <div class="col-md-4">
                                                            <label for="userFunction" class="control-label pull-left">Function</label>
                                                            <input id="userFunction"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userFunction"                                
                                                                   >
                                                        </div>

                                                        <div class="col-md-4">
                                                            <label for="userClearEmail" class="control-label pull-left">Email</label>
                                                            <input id="userClearEmail"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="userClearEmail"                                
                                                                   >
                                                        </div>

                                                    </div> <!--row-->

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                        <div class="col-md-4">
                                                            <input id="userEmail"
                                                                   type="hidden"                                   
                                                                   name="userEmail"               
                                                                   >                                                    
                                                            <a class="btn btn-info btn-sm" role="button" id="mails" >
                                                                <span class="glyphicon glyphicon-envelope"></span>
                                                                <p id="msg"><span id="msg_val">_</span></p> </a>
                                                        </div>

                                                    </div> <!--row-->

                                                </div><!-- /.modal body -->

                                                <div class="modal-footer"  style="background-color: #c3bcbc">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>

                                            </div><!-- /.modal-content -->

                                        </div><!-- /.modal-dialog -->

                                    </div><!-- /.userModal -->


                                </div> <!-- tab-pane User-->



                                <!--ExpertReader-->
                                <div class="tab-pane fade" id="ExpertReader">

                                    <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                                        <div class="table-responsive">

                                            <table id="expReader" class="display responsive table table-striped table-bordered" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th class="details-control"></th>
                                                        <th class="delete-control"></th>
                                                        <th class="never">User ID</th>
                                                        <th class="all">First Name</th>
                                                        <th class="all">Last Name</th>
                                                        <th class="all">Email</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- Main Grid -->   
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th class="details-control"></th>
                                                        <th class="delete-control"></th>
                                                        <th class="never">User ID</th>
                                                        <th class="all">First Name</th>
                                                        <th class="all">Last Name</th>
                                                        <th class="all">Email</th>
                                                    </tr>
                                                </tfoot>

                                            </table>

                                        </div>          

                                    <c:if test="${not empty error}">Error: ${error}</c:if>

                                    </div> <!-- /container-fluid -->

                                    <!--expReaderModal-->
                                    <div class="modal fade" id="expReaderModal" tabindex="-1" role="dialog" aria-labelledby="expReaderModalLabel">

                                        <div class="modal-dialog" role="document">

                                            <div class="modal-content">

                                                <div class="modal-header" style="background-color: #c3bcbc">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="expReaderModalLabel">Display expert readers</h4>
                                                </div>

                                                <div class="modal-body" style="background-color: #d9d1d1">

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                                        <div class="col-md-4">
                                                            <label for="FirstNameExpReader" class="control-label pull-left">First name</label>
                                                            <input type="text" class="input-sm" id="FirstNameExpReader"/>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-md-4">
                                                            <label for="LastNameExpReader" class="control-label pull-left"> Last name</label>
                                                            <input type="text" class="input-sm" id="LastNameExpReader"/>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-md-4">
                                                            <label for="EmailExpReader" class="control-label pull-left"> Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                            <input type="text" class="input-sm" id="EmailExpReader"/>
                                                        </div>
                                                    </div>
                                                </div><!-- modal body -->

                                                <div class="modal-footer"  style="background-color: #c3bcbc">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div><!-- modal-footer -->
                                            </div><!-- modal-content -->
                                        </div><!-- modal-dialog -->
                                    </div><!-- modal -->

                                    <!--deleteExpReaderModal-->
                                    <div class="modal fade" id="deleteExpReaderModal" tabindex="-1" role="dialog" aria-labelledby="deleteExpReaderModalLabel">

                                        <div class="modal-dialog" role="document">

                                            <div class="modal-content">

                                                <div class="modal-header" style="background-color:  #ff0000;">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="deleteExpReaderModalLabel">Delete expert reader</h4>
                                                </div>

                                                <div class="modal-body" style="background-color: #d9d1d1">

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <input type="hidden" id="delExpertReaderID">  
                                                        <div class="col-md-4">
                                                            <label for="FirstNameExpReader" class="control-label pull-left">First name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                            <input type="text" class="input-sm" id="delFirstNameExpReader"/>
                                                        </div>
                                                        <div class="col-md-1"></div>                                                        
                                                    </div>

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-md-4">
                                                            <label for="LastNameExpReader" class="control-label pull-left"> Last name</label>
                                                            <input type="text" class="input-sm" id="delLastNameExpReader"/>
                                                        </div>
                                                        <div class="col-md-5">You are deleting this user
                                                            <span class="glyphicon glyphicon-exclamation-sign" style="color: red"></span>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                        <div class="col-md-4">
                                                            <label for="EmailExpReader" class="control-label pull-left"> Email</label>
                                                            <input type="text" class="input-sm" id="delEmailExpReader"/>
                                                        </div>
                                                    </div>

                                                </div><!-- modal body -->

                                                <div class="modal-footer"  style="background-color: #c3bcbc">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" id="der" class="btn btn-danger">Delete Expert Reader</button>
                                                </div><!-- modal-footer -->

                                            </div><!-- modal-content -->
                                        </div><!-- modal-dialog -->
                                    </div><!-- modal -->

                                </div> <!-- tab-pane expReader-->

                                <!--Library-->
                                <div class="tab-pane fade" id="Library">
                                    <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                                        <div class="table-responsive">
                                            <table id="books" class="  table table-striped table-bordered nowrap" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>         
                                                        <th class="details-control"></th>
                                                        <th class="never">bookID</th>
                                                        <th class="all">Reference <br/> Number</th>
                                                        <th class="all">Author(s)</th>
                                                        <th class="all">Title</th>
                                                        <th class="all">Publisher</th>                                                        
                                                        <th class="never">Publisher <br/>Year</th>
                                                        <th class="never">Genre</th>
                                                        <th class="all">Translation<br/>Title</th>  
                                                        <th class="all">Original Publisher</th>                                                        
                                                        <th class="never">Translation<br/>Publisher Year</th>                                                        
                                                        <th class="all">Translator</th>
                                                        <th class="all">Language</th>
                                                        <th class="never">Copies</th>
                                                        <th class="never">Notes</th>
                                                        <th class="never">ISBN</th>
                                                        <th class="never">ISSN</th>
                                                        <th class="never"></th>      
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- Main Grid -->   
                                                </tbody>
                                                <tfoot>
                                                    <tr>                                                                    
                                                        <th class="details-control"></th>
                                                        <th class="never">bookID</th>
                                                        <th class="all">Reference <br/> Number</th>
                                                        <th class="all">Author(s)</th>
                                                        <th class="all">Title</th>
                                                        <th class="all">Publisher</th>                                                        
                                                        <th class="never">Publisher <br/>Year</th>
                                                        <th class="never">Genre</th>
                                                        <th class="all">Translation<br/>Title</th>  
                                                        <th class="all">Original Publisher</th>                                                        
                                                        <th class="never">Translation<br/>Publisher Year</th>                                                        
                                                        <th class="all">Translator</th>
                                                        <th class="all">Language</th>
                                                        <th class="never">Copies</th>
                                                        <th class="never">Notes</th>
                                                        <th class="never">ISBN</th>
                                                        <th class="never">ISSN</th>
                                                        <th class="never"></th>        
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>             
                                    <c:if test="${not empty error}">Error: ${error}</c:if>

                                    </div>
                                </div> <!--Library-->

                                <!--Genres-->
                                <div class="tab-pane fade" id="Genres">
                                    <h2>Manage Genres</h2>
                                    <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">
                                        <div class="table-responsive">
                                            <table id="genreTable" class="table table-striped table-bordered  dt-responsive nowrap" width="75%" cellspacing="0" border="1">
                                                <thead>
                                                    <tr>
                                                        <th class="delete-control" style="width: 5%">Remove</th>                                                  
                                                        <th class="all">Genre</th>   
                                                        <th class="never"></th>     
                                                        <th class="never"></th>
                                                    </tr>
                                                </thead>

                                                <tfoot>
                                                    <tr>
                                                        <th class="delete-control" style="width: 5%">Remove</th>                                                  
                                                        <th class="all"></th>   
                                                        <th class="never"></th>     
                                                        <th class="never"></th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>             
                                    </div>                             
                                </div> <!--tab-pane Genres-->

                                <!--Maintenance-->
                                <div class="tab-pane fade" id="Maintenance">
                                    <h2>Maintenance</h2>


                                    <div class="container-fluid">
                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editEmailTemplatesModal">
                                                Edit email templates
                                            </button>
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#logoutUserModal">
                                                Logout User
                                            </button>
                                            <!--        <div id="logoutUsers" class="col-md-4 pull-left">   
                                                     <label class="control-label"> Logout active users on system</label>
                                                     <ul class="list-group">
                                        <c:forEach items="${users}" var="item" varStatus="loop">
                                            <div class="logoutUsers"  data-item-id="${loop.index}">
                                                <li id="${loop.index}"  class="list-group-item"  data-selected="false"><i class="glyphicon glyphicon-log-out pull-left" aria-hidden="true"></i>
                                            ${item}</li>
                                        </c:forEach>
                                </div>  </ul>
                        </div>          
                        <script>
                            $('div.logoutUsers').click(function (evt) {
                                var id = $(this).data('itemId');
                                alert('Huzzah, you clicked on ' + id);
        
                            });
        
                        </script>-->
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </nav>



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
                        <!--<a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a>-->
                    </div>                    

                    <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
                        &copy; 2017-2020 mgr Software
                    </div>

                </div><!-- end of Base div -->

            </div> <!-- end of container div -->

            <div class="shadowbase"> </div>

        </div><!-- shadowholder -->


        <!--Add New Staff Member modal-->
        <div class="modal fade" id="createNewStaffmodal" data-modal-index="2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form 
                        id="createNewStaffmodalForm"  
                        method="POST"
                        role="form"                             
                        action="${pageContext.request.contextPath}/AddUserStaff" 
                        >


                        <input type="hidden" name="AddNewStaff"  class="form-control" value="AddNewStaff">
                        <div class="modal-header" style="background-color: #c3bcbc">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Add new Staff member</h4>
                        </div>
                        <div class="modal-body" style="background-color: #d9d1d1">

                            <div class="panel-body">

                                <!--ENSURE signup is validated-->
                                <div class="form-group">
                                    <!-- <label for="username" class="col-md-3 control-label">Username</label>-->
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="StaffUname" id="StaffUname" placeholder="Username" onblur="loadXMLDocStaff()"/>                                           
                                        <span id="loadXMLDocStafferror"></span> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <!--<label for="firstname" class="col-md-3 control-label">First Name</label>-->
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="StaffFirstname" placeholder="First Name">                                            
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <!--<label for="lastname" class="col-md-3 control-label">Last Name</label>-->
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="StaffLastname" placeholder="Last Name">                                            
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>       

                                <div class="form-group">
                                    <!--<label for="email" class="col-md-3 control-label">Email</label>-->
                                    <div class="col-md-9">
                                        <input type="email" class="form-control" name="StaffEmail" id="StaffEmail" placeholder="Email Address">                                            
                                        <span class="help-block" id="error"></span>   
                                        <!--<span id="erremail" class="alert alert-danger col-lg-8 col-md-8 col-md-8 col-xs-12">Invalid Email Address</span>-->
                                    </div>
                                </div>

                                <div class="form-group">
                                    <!--<label for="password" class="col-md-3 control-label">Password</label>-->
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" id="StaffPassword" name="StaffPassword" placeholder="Password">                                           
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>

                                <div class="form-group">
                                    <!--<label for="cpassword" class="col-md-3 control-label">Confirm Password</label>-->
                                    <div class="col-md-9">
                                        <input type="password" class="form-control"  id="StaffCpassword" name="StaffCpassword" placeholder="Confirm Password">                               
                                        <span class="help-block" id="error"></span> 
                                    </div>
                                </div>
                            </div><!--signup-form-container-->

                            <!--<input type="hidden" name="NewAssignedERRefNo" id="NewAssignedERRefNo"  class="form-control">-->
                        </div>
                        <div class="modal-footer"  style="background-color: #c3bcbc">
                            <input type="hidden" name="userID" value="${userID}">
                            <input type="hidden" name="name" value="${name}">
                            <input type="hidden" name="publisherID" id="publisherID" value="${publisherID}">
                            <input type="hidden" name="publisherName"  value="${publisherName}">
                            <input type="hidden" name="Company" value="${companyDetails.Company}">
                            <button type="submit" class="btn btn-primary" >Add new Staff member</button>
                        </div>

                        <!--                                </div>-->
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->     

        <!--Add New Expert Reader modal-->
        <div class="modal fade" id="createNewEReadermodal" data-modal-index="2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form 
                        id="createNewEReaderForm"  
                        method="POST"
                        role="form"                             
                        action="${pageContext.request.contextPath}/AddUserExpertReader" 
                        >


                        <input type="hidden" name="AddExpertReader"  class="form-control" value="AddExpertReader">

                        <div class="modal-header" style="background-color: #c3bcbc">
                            <div class="modal-dialog">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">Add new expert reader</h4>
                            </div>

                            <div class="modal-body" style="background-color: #d9d1d1; margin-bottom: 100px; margin-top: 30px">

                                <div class="container-fluid"  style="background-color: #d9d1d1; margin-bottom: 150px; margin-top: 30px">

                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-1">
                                            <div class="form-group  has-feedback">
                                                <label for="uname" class="pull-left control-label required-field">Username</label>
                                                <input type="text" class="form-control" name="uname" id="uname" placeholder="Username" onblur="loadXMLDocER()"/>  
                                                <span id="loadXMLDocERerror"></span>                                     
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-4 col-md-offset-1">
                                            <div class="form-group  has-feedback">
                                                <label for="firstname" class="pull-left control-label required-field">First Name</label>
                                                <input type="text" class="form-control" name="firstname" id="firstname" placeholder="First Name">                                                                                     
                                            </div>
                                        </div>      


                                        <div class="col-md-4">
                                            <div class="form-group  has-feedback">
                                                <label for="lastname" class="pull-left control-label required-field">Last Name</label>
                                                <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Last Name">                                                                                       
                                            </div>
                                        </div>       

                                    </div>  

                                    <div class="row">


                                        <div class="col-md-4 col-md-offset-1">
                                            <div class="form-group  has-feedback">
                                                <label for="email" class="pull-left control-label required-field">Email</label>
                                                <input type="email" class="form-control" name="email" id="email" placeholder="Email Address">                                                
                                            </div>
                                        </div>

                                    </div>

                                    <div class="col-md-4 col-md-offset-1">
                                        <label  class="control-label pull-left required-field">Required fields</label>  
                                    </div>

                                </div><!--container-fluid-->
                            </div><!--modal-body-->

                        </div>

                        <div class="modal-footer"  style="background-color: #c3bcbc">
                            <input type="hidden" name="userID" value="${userID}">
                            <input type="hidden" name="name" value="${name}">
                            <input type="text" name="publisherID" value="${publisherID}">
                            <input type="text" name="publisherName"  value="${publisherName}">
                            <input type="hidden" name="Company" value="${companyDetails.Company}">
                            <input type="hidden" name="username" id="username4" value="${username}">
                            <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                            <button type="submit" class="btn btn-primary" >Add new expert reader</button>
                        </div>

                        <!--                                </div>-->
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->     

        <!--additionalExpertReaderModal-->
        <div id="additionalExpertReaderModal"></div>

        <!--assignEReadermodal-->
        <div class="modal fade" id="assignEReadermodal" data-modal-index="2">

            <div class="modal-dialog">

                <div class="modal-content" style="background-color: #d9d1d1; margin-top: 40px">

                    <form 
                        id="assignEReaderForm"  
                        method="POST"
                        role="form"                             
                        action="${pageContext.request.contextPath}/AssignExpertReader" 
                        >

                        <%request.getSession().setAttribute( "task", "AssignExpertReader" );%>

                        <input type="hidden" name="AssignExpertReader"  class="form-control" value="AssignExpertReader">

                        <div class="modal-header" style="background-color: #c3bcbc">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Assign expert reader to reference number  <input id="unassignedERRefNo" value="" disabled /></h4>
                        </div>

                        <div class="modal-body" style="background-color: #d9d1d1; margin-top: 40px">

                            <div class="panel" style="margin-left: 40px; margin-right: 40px">

                                <div class="row" style="margin-bottom: 20px;">  

                                    <div class='col-md-4'>
                                        <label for="selectUnassignedER" class="pull-left control-label">Select</label>
                                        <select class="selectpicker form-control" id="selectUnassignedER" onchange="selectER();"></select>
                                    </div>

                                    <input type="hidden" name="selectedUnassignedER" id="selectedUnassignedER"  class="form-control">

                                    <div class='col-md-4' style="padding-left: 5px">
                                        <label for="unassignedERRefNo"  class="pull-left  control-label">for Reference Number</label>
                                        <input id="unassignedERRefNo1" class="form-control" value="" disabled />
                                    </div>

                                </div> <!--row-->

                                <div class="row" style="margin-bottom: 20px;">  

                                    <div class='col-md-4'>
                                        <strong class=" pull-left">&nbsp;<br/> Sample sent out</strong>
                                        <div class="input-group pull-left">
                                            <input type="text" name="sampleSentOut" id="sampleSentOut1" class="form-control" placeholder="DD/MM/YYYY" />    
                                        </div>
                                    </div>

                                    <div class='col-md-4'>
                                        <strong class=" pull-left">Expected return date of report</strong>
                                        <div class="input-group pull-left">
                                            <input type="text" name="expectedReturnDate" id="expectedReturnDate" class="form-control" placeholder="DD/MM/YYYY" />    
                                            <label class="input-group-addon" for="expectedReturnDate">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </label>
                                        </div>
                                    </div>

                                    <script>
                                        $("#expectedReturnDate").datepicker({
                                            showWeekDays: true,
                                            todayHighlight: true,
                                            autoclose: true
                                        });
                                    </script>

                                </div> <!--row-->

                                <input type="hidden" name="NewAssignedERRefNo" id="NewAssignedERRefNo"  class="form-control">
                                <input type="hidden" name="name" value="${name}">
                                <input type="hidden" name="userID" value="${userID}">
                                <input type="text" name="publisherID" value="${publisherID}">
                                <input type="text" name="publisherName"  value="${publisherName}">
                                <input type="hidden" name="Company" value="${companyDetails.Company}">

                            </div> <!-- panel -->

                        </div> <!-- /.modal body -->

                        <div class="modal-footer"  style="background-color: #c3bcbc">                            
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" >Assign expert reader</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->           

        <!--pressCuttingsModal-->
        <div class="modal fade" id="pressCuttingsModal" tabindex="-1" role="dialog" aria-labelledby="pressCuttingsModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #c3bcbc">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="pressCuttingsModalLabel">See press coverage</h4>
                    </div>


                    <div class="modal-body" style="background-color: #d9d1d1">
                        <div class="row" style="margin-bottom: 10px">

                            <output id="result">Press coverage</output>
                            <div id="pressCoverageTag"></div>

                        </div>
                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc">                      
                        <button type="button" class="btn btn-default" data-dismiss="modal">Done</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div> <!--modal footer -->
                </div> <!--modal content-->          
            </div> <!--modal dialog-->
        </div> <!--modal fade-->
        <!--pressCuttingsModal-->
        <input type="hidden" value="pressCuttings" name="image-file" id="label_pressCuttings"/>

        <!--createNewGenremodal-->
        <div class="modal fade" id="createNewGenremodal" tabindex="-1" role="dialog" aria-labelledby="createNewGenremodalLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: #c3bcbc;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="createNewGenremodalLabel">Add Genre</h4>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <label for="addGenre" class="control-label pull-left">Add Genre</label>
                                <input type="text" class="form-control input-sm" id="addGenre"/>                               
                            </div>
                            <div class="col-md-4"></div>
                        </div>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                       
                        <button type="button" class="btn btn-primary" id="addGenreButton" data-dismiss="modal" >Add Genre</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <!--deleteGenreSuccessModal-->
        <div class="modal fade" id="deleteGenreSuccessModal" tabindex="-1" role="dialog" aria-labelledby="deleteGenreSuccessModalLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: #5bdc18;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="deleteGenreSuccessModalLabel">Success</h4>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">                               
                                <p id="showDeletedGenre"></p>                       
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <!--deleteExpReaderSuccessModal-->
        <div class="modal fade" id="deleteExpReaderSuccessModal" tabindex="-1" role="dialog" aria-labelledby="deleteExpReaderSuccessModalLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: #5bdc18;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="deleteExpReaderSuccessModalLabel">Success</h4>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">                               
                                <p id="showDeleteExpReader"></p>                       
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <!--addGenreSuccessModal-->
        <div class="modal fade" id="addGenreSuccessModal" tabindex="-1" role="dialog" aria-labelledby="addGenreSuccessModalLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: #5bdc18;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="addGenreSuccessModalLabel">Success</h4>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">                               
                                <p id="showAddedGenre"></p>                       
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <!--libraryUpdateSuccessModal-->
        <div class="modal fade" id="libraryUpdateSuccessModal" tabindex="-1" role="dialog" aria-labelledby="libraryUpdateSuccessModallLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: #5bdc18;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="libraryUpdateSuccessModallLabel">Success</h4>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">                               
                                <p id="showLibraryUpdateSuccess"></p>                       
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <!--saveBooksForm-->
        <form 
            id="saveBooksForm"  
            method="POST"
            role="form"                             
            action="${pageContext.request.contextPath}/LibraryUpdate" 
            enctype="multipart/form-data">
            <div class="modal fade" id="booksModal" tabindex="-1" role="dialog" aria-labelledby="booksModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="background-color: #d9d1d1">



                        <div class="modal-header" style="background-color: #c3bcbc">

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="booksModalLabel">Manage books</h4>
                        </div>

                        <!-- modal-body -->
                        <div class="modal-body" style="background-color: #d9d1d1;">
                            <div class="container-fluid" style="margin-bottom:  40px; ">

                                <div class="row"> 

                                    <div style=" margin: 0 auto; position: relative;">
                                        <div class="col-md-2"></div>
                                        <div id="showUploadCover1" class="col-md-8"  style="margin-bottom:  20px; ">

                                            <!-- bootstrap-imageupload. -->                                                               
                                            <div class="imageupload panel panel-default">
                                                <div class="panel-heading clearfix">
                                                    <h3 class="panel-title ">Select book cover</h3>
                                                </div>
                                                <div class="file-tab panel-body" id="cover1" style="display:block; margin: 0 auto;width: 75%">

                                                    <label class="btn btn-default btn-file"> 
                                                        <span>Browse</span>
                                                        <!-- The file is stored here. -->

                                                        <input type="file" id="Cover1" name="Cover1">

                                                    </label>

                                                    <button type="button" class="btn btn-default">Remove</button>
                                                </div>
                                            </div>

                                        </div>

                                        <!--<div id="showUploadCover2" class="col-md-8"  style="margin-bottom:  40px; ">--> 
                                        <div id="showUploadCover2" class="col-md-4"  style="margin-bottom:  40px; "> 
                                            <div class="panel panel-default">
                                                <div class="panel-heading clearfix">
                                                    <h3 class="panel-title" id="showUploadCoverTitle"></h3>
                                                </div>

                                                <div class="file-tab panel-body" id="cover2" style="display:block; margin: 0 auto;width: 75%">
                                                    <!--<div class="panel-body" id="cover2" style="display:block;  margin:auto;">-->
                                                    <img src="" id="cover21"  alt="">
                                                </div>
                                            </div>
                                        </div>

                                    </div> <!-- position: relative; -->

                                </div> <!--row-->

                                <input type="hidden" class="input-sm pull-left" id="bookID"/> 

                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                    <!--         <div class="col-md-4">
                                               <label class="pull-left"> Reference Number </label>
                                               <p><input type="text" class="input-sm pull-left" id="referenceNumber"/></p>
                                           </div>
                                       </div>-->
                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="referenceNumber" class="pull-left control-label">Reference Number</label>
                                            <input type="text" class="form-control" name="uname" id="referenceNumber"/>                                                                                   
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">

                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="Author" class="pull-left control-label">Author</label>
                                            <input type="text" class="form-control" name="Author" id="Author"/>                                                                                   
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="Translator" class="pull-left control-label">Translator</label>
                                            <input type="text" class="form-control" name="Translator" id="Translator"/>                                                                                   
                                        </div>
                                    </div>
                                    <!--                                    <div class="col-md-5">
                                                                        <label class="pull-left" for="Author"> Author </label>   
                                                                        <input type="text" class="input-sm pull-left" id="Author"/>                                   
                                                                    </div>
                                    
                                                                    <div class="col-md-6">
                                                                        <label class="pull-left" for="Translator"> Translator </label>   
                                                                        <input type="text" class="input-sm pull-left" id="Translator"/>
                                                                    </div>-->

                                </div>

                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="OrgTitle" class="pull-left control-label">Original Title </label>
                                            <input type="text" class="form-control" name="OrgTitle" id="OrgTitle"/>                                                                                   
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="TransTitle" class="pull-left control-label">Translated Title</label>
                                            <input type="text" class="form-control" name="TransTitle" id="TransTitle"/>                                                                                   
                                        </div>
                                    </div>
                                    <!--                                    <div class="col-md-5">
                                                                        <label class="pull-left" for="OrgTitle"> Original Title &nbsp;&nbsp;&nbsp;</label>
                                                                        <input type="text" class="input-sm pull-left" id="OrgTitle"/>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <label class="pull-left" for="TransTitle"> Translated Title</label>
                                                                        <input type="text" class="input-sm pull-left" id="TransTitle"/>
                                                                    </div>-->

                                </div>

                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="Publisher" class="pull-left control-label">Publisher </label>
                                            <input type="text" class="form-control" name="Publisher" id="Publisher"/>                                                                                   
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="translationPublisher" class="pull-left control-label">Translation Publisher</label>
                                            <input type="text" class="form-control" name="translationPublisher" id="translationPublisher"/>                                                                                   
                                        </div>
                                    </div>
                                    <!--                                    <div class="col-md-5">
                                                                            <label class="pull-left" for="Publisher"> Publisher &nbsp;&nbsp;&nbsp;</label>
                                                                            <input type="text" class="input-sm pull-left" id="Publisher"/>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <label class="pull-left" for="translationPublisher"> Translation Publisher</label>
                                                                            <input type="text" class="input-sm pull-left" id="translationPublisher"/>
                                                                        </div>-->
                                </div>


                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="Genre" class="pull-left control-label">Genre </label>
                                            <input type="text" class="form-control" name="Genre" id="Genre"/>                                                                                   
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="Language" class="pull-left control-label">Language(s)</label>
                                            <input type="text" class="form-control" name="Language" id="Language"/>                                                                                   
                                        </div>
                                    </div>

                                    <!--                                    <div class="col-md-5">
                                                                        <label class="pull-left"> Genre</label>
                                                                        <input type="text" class="input-sm pull-left" id="Genre"/>
                                                                    </div>
                                    
                                                                    <div class="col-md-4">
                                                                        <label class="pull-left"> Language(s) </label>
                                                                        <p><input type="text" class="input-sm" id="Language"/></p>
                                                                    </div>-->
                                </div>
                                <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="ISBN" class="pull-left control-label">ISBN </label>
                                            <input type="text" class="form-control" name="ISBN" id="ISBN"/>                                                                                   
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-md-offset-1">
                                        <div class="form-group  has-feedback">
                                            <label for="ISSN" class="pull-left control-label">ISSN</label>
                                            <input type="text" class="form-control" name="ISSN" id="ISSN"/>                                                                                   
                                        </div>
                                    </div>

                                    <!--                                    <div class="col-md-5">                                                                                                          
                                                                            <label class="pull-left"> ISBN </label>
                                                                            <input type="text" class="input-sm" id="ISBN"/>
                                                                        </div>
                                                                        <div class="col-md-5">                                                                                                          
                                                                            <label class="pull-left"> ISSN </label>
                                                                            <input type="text" class="input-sm" id="ISSN"/>
                                                                        </div>-->
                                </div>
                            </div>
                        </div>  <!--modal-body -->

                        <!--modal-footer -->
                        <div class="modal-footer"  style="background-color: #c3bcbc;">                                                       
                            <button type="submit" id="btnSubmit" class="btn btn-primary" data-dismiss="modal" >Save changes</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>  <!-- modal-footer -->
                        <!--                    </form>                     -->
                    </div> <!-- modal-content -->
                </div> <!-- modal-dialog -->
            </div> <!-- modal -->
        </form>     

        <!--image-gallery-->
        <div class="modal fade" id="image-gallery" tabindex="-1" role="dialog" aria-labelledby="image-gallery-title" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #e5e5e5">
                        <h4 class="modal-title" id="image-gallery-title" style="background-color: #e5e5e5"></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body" style="position:relative; height: 800px; background-color: #f0ead6">
                        <img id="image-gallery-image" class="img-responsive col-md-12" src="" alt="">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary float-left" id="show-previous-image"><i class="fa fa-arrow-left"></i>
                        </button>

                        <button type="button" id="show-next-image" class="btn btn-secondary float-right"><i class="fa fa-arrow-right"></i>
                        </button>
                    </div>
                </div>
            </div>
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

        <!--editEmailTemplatesModal-->
        <div class="modal fade" id="editEmailTemplatesModal" tabindex="-1" role="dialog" aria-labelledby="editEmailTemplatesModalLabel" aria-hidden="true"   data-modal-index="4">
            <div class="modal-dialog  modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #c3bcbc">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h5 class="modal-title" id="editEmailTemplatesModalLabel">Edit email templates</h5>
                    </div>
                    <div class="modal-body" style="background-color: #d9d1d1">
                        <form action="templateHandler" method="GET">
                            <div class="row">
                                <div class="col-md-4">

                                    <div class="selectTemplate">
                                        <h2>Select email template</h2>
                                        <div id="selectTemplate" class="templateSelector" ></div>
                                    </div>

                                    <div class="selectParameter" style="margin-left: 20px">
                                        <h2>Select email parameter</h2>
                                        <table width="100%" >

                                            <tbody>
                                                <tr>
                                                    <td style="text-align:left">From:&nbsp;</td>
                                                    <td>&nbsp;</td>                              
                                                    <td style="text-align:left">
                                                        <select id="from" name="from"></select>
                                                    </td>
                                                </tr>
                                                <!--                                                <tr>
                                                                                                    <td style="text-align:left">Salutation:&nbsp;</td>
                                                                                                    <td>&nbsp;</td>                                                
                                                                                                    <td style="text-align:left">
                                                                                                        <select id="salutation" name="salutation" onchange="onchange_action();">
                                                                                                            <option value="First_Name" selected>First name</option>
                                                                                                            <option value="Last_Name">Last name</option>
                                                                                                            <option value="Full_Name">Full name</option>
                                                                                                        </select>
                                                                                                    </td>     -->                                    
                                                <tr> 
                                                    <td style="text-align:left">Salutation:&nbsp;</td>
                                                    <td>&nbsp;</td>                                           
                                                    <td style="text-align:left"> 
                                                        <c:set var="selectedRole" value='${requestScope["selectedRole"]}' />
                                                        <c:set var="grades" value="First_Name,Last_Name,Full_Name" scope="application" />
                                                        <select class="grade" title="Grade Obtained">
                                                            <c:forEach items="${fn:split(grades, ',')}" var="grade">
                                                                <option value="${grade}" ${grade == selectedRole ? 'selected' : ''}>${grade}</option>
                                                            </c:forEach>
                                                        </select>

                                                    </td>

                                            </tbody>
                                        </table>


                                    </div>

                                </div>

                                <div class="col-md-8">

                                    <input type="hidden" id="fileName" name="fileName">

                                    <textarea name="editor1" id="editor1" rows="20" cols="70"></textarea>  

                                </div>
                            </div> 
                        </form>
                    </div>
                    <div class="modal-footer"  style="background-color: #c3bcbc;"> 
                        <div class="input-group">
                            <form action="emailWithHTMLTemplate" method="POST">
                                <input type="hidden" id="emailTemplateSelected" name="emailTemplateSelected">                        
                                <button class="btn btn-secondary" type="submit" name="SendTest">Send test email</button>  &nbsp; &nbsp; &nbsp;   
                            </form>
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-secondary" id="showInstructionsModalBtn" data-toggle="modal" data-target="#showInstructionsModal">Open instructions</button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--showInstructionsModal-->
        <div class="modal fade" id="showInstructionsModal" tabindex="-1" role="dialog" aria-labelledby="showInstructionsModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header"   style="background-color: #c3bcbc">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h1 class="modal-title" id="showInstructionsModalLabel">Edit template instructions</h1>
                    </div>
                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="container-fluid">
                            <div id="contentarea1">
                                <div class="textpadding">
                                    <div class="typography">
                                        <h4>Select email template</h4>
                                        <p>Select a template on the left.
                                            As soon you clicked on the link the template's text is displayed in the editor</p>
                                        <p>Now you can edit the text. When you're done click on the <img src="assets/js/ckeditor/plugins/save/icons/save.png" width="16" height="16" alt="save icon"/>
                                            icon to save the edited template</p>
                                        <p> </p>
                                        <h4>Change sender of email</h4>
                                        <p>In order to change the sender select the user on the left 'Select email parameter'.</p>
                                        <p>Only Literature Ireland Staff that have been registered with the application can be selected </p>
                                        <p> </p>
                                        <h4>Change the salutation</h4>
                                        <p>You can change the salutation on the left.</p>
                                        <p>Available salutations are: Full Name, First Name, Last Name </p>
                                        <p> </p>     
                                        <h4>Testing</h4>
                                        <p>You can test the changes by sending an email to the user id you're logged in as : ${email}</p>
                                        <p></p>
                                        <p> </p>   
                                        <h4>Limitations</h4>
                                        <p>Do NOT change links or parameters that are all in upper case (i.e. LOGIN)  </p>  
                                        <p> </p>  
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

        <!--logoutUserModal-->
        <div class="modal fade" id="logoutUserModal" tabindex="-1" role="dialog" aria-labelledby="logoutUserModalLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content" style="background-color: #d9d1d1; margin-bottom: 100px">

                    <div class="modal-header" style="background-color: #5bdc18;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="logoutUserModalLabel">Logout in/active users on system</h4>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1; margin-bottom: 100px">
                        <button type="button" id="myButton" class="btn btn-info">Info</button>
                        <div id="logoutUsers" class="col-md-4 pull-left">   
                            <label class="control-label"> In/active users on system</label>
                            <ul class="list-group">
                                <c:forEach items="${users}" var="item" varStatus="loop">
                                    <div class="logoutUsers"  data-item-id="${loop.index}">
                                        <li id="${loop.index}"  class="list-group-item"><i class="glyphicon glyphicon-log-out pull-left" aria-hidden="true"></i>
                                            ${item}</li>
                                        </c:forEach>
                                </div>  
                            </ul>
                        </div>          

                        <div id="123abc"> </div>

                        <script>

                            $('#myButton').on('click', function (event) {

                                var strs = ${users};
                                var list = document.createElement("ul");
                                for (var i in strs) {
                                    var anchor = document.createElement("a");
                                    anchor.href = "#";
                                    anchor.innerText = strs[i];

                                    var elem = document.createElement("li");
                                    elem.appendChild(anchor);
                                    list.appendChild(elem);
                                }

                                $('123abc').append(list);
                            });

                            $('div.logoutUsers').click(function (evt) {
                                var id = $(this).data('itemId');
                                alert('Huzzah, you clicked on ' + id);

                            });

                        </script>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <script src="js/bootstrap-imageupload.js"></script>
        <script>
                            var $imageupload = $('.imageupload');
                            $imageupload.imageupload({
                                maxWidth: 500,
                                maxHeight: 500,
                                maxFileSizeKb: 3048
                            });
                            $(replaceEditor);
                            $(selectTemplate);
        </script>
    </body>
</html>
