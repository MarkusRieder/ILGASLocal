<%-- 
    Document   : openApplications
    Created on : 07-Ma7-2017, 23:27:58
    Author     : markus
--%>

<%@ page import="java.io.*,java.io.*,org.apache.poi.hwpf.HWPFDocument,org.apache.poi.hwpf.extractor.WordExtractor" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html style="height: 100%" >
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="robots" content="noindex, nofollow">
        <title>Translation Grant Application System</title>
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 
        <!--
           https://www.javaworld.com/article/2072937/java-web-development/solving-the-logout-problem-properly-and-elegantly.html?page=2
           Solving the logout problem properly and elegantly
        -->

        <%
//            response.setHeader("Cache-Control", "no-cache"); //forces caches to obtain a new copy of the page from the origin server
//            response.setHeader("Cache-Control", "no-store"); //directs caches not to store the page under any circumstance
//            response.setDateHeader("Expires", 0); //causes the proxy cache to see the page as "stale"
//            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

//            String userName = (String) session.getAttribute("username");
//            if (null == userName) {
//                System.out.println("userName: " + userName + " not found");
//                request.setAttribute("Error", "Session has ended.  Please login.");
//                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
//                rd.forward(request, response);
//            }
        %>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->


        <!-- Bootstrap -->


        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <!--<link rel="stylesheet" type="text/css" href="css/font-awesome.css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="css/irishLiterature.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css" />
        <link rel="stylesheet" type="text/css" href="css/openApplications.css">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.dataTables.js"></script>
        <script src="js/dataTables.bootstrap.js"></script>
        <script src="js/dataTables.responsive.min.js"></script>
        <script src="js/dataTables.bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script>

        <script type="text/javascript"  src="js/pdf.js"></script>
        <script type="text/javascript"  src="js/pdf.worker.js"></script>
        <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>

        <script src="js/xregexp-all.js"></script> 
        <script src="js/validateFileName.js"></script>
        <script src="js/formValidator.js"></script>


    </head>

    <body style="height: 100%">

        <input type="text" name="pid"  id='pid' value="${publisherID}">

        <sql:query var="applicationQuery" dataSource="jdbc/ILGAS">
            SELECT * FROM GrantApplication
            WHERE GrantApplication.Status = 'open' 
            AND publisherID = ?;
            <sql:param value="${publisherID}"/>
        </sql:query>
        <c:set var="applicationDetails" value="${applicationQuery.rows[0]}"/>

        <sql:query var="companyQuery" dataSource="jdbc/ILGAS">
            SELECT * FROM international_publishers
            WHERE  international_publishers.Company_Number = ?
            <sql:param value="${publisherID}"/>
        </sql:query>    
        <c:set var="companyDetails" value="${companyQuery.rows[0]}"/>

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


                <!--container for welcome/logout-->
                <div class="container-fluid" style="margin-bottom: 20px; width: 100%">
                    <div class="pull-right">
                        <form action="${pageContext.request.contextPath}/Logout" method="POST">
                            <h6> <small>Welcome <strong>${name}</strong> - <strong>not ${name}</strong>? 
                                    <button type="submit" name="username" value="${username}" class="btn-link">Click here to log out </button></small></h6>
                            <input type="hidden" name="username" id="username1" value="${username}">
                        </form>
                    </div>
                </div> <!--container for welcome/logout-->

                <h1 align="center" style="align-content: center">Translation Grant Application System for Literature Ireland</h1>
                <input type="hidden" name="pid2" value="${publisherID}">
                <div class="container-fluid" style="margin-bottom: 20px"></div>

                <!-- Main Grid Container -->  
                <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                    <h3 align="center" style="align-content: center">Display open applications</h3>
                    <br/>
                    <input type="hidden" name="username" id="username2" value="${username}">
                    <!--Application-->
                    <div class="tab-pane fade  active in" id="Application">
                        <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">

                            <!-- Main Grid -->  
                            <div class="table-responsive">
                                <table id="applications" class="table display table-striped table-bordered  dt-responsive nowrap" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="details-control"></th>   
                                            <th class="never">Application<br/>  No</th>
                                            <th class="never">Application<br/>  Year</th>
                                            <th class="all">Reference<br/>  No</th>
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
                                            <th class="never">Status</th>
                                            <th class="never">Copies <br/> Sent</th>
                                            <th class="never">Date Copies  <br/> Were Sent</th>
                                            <th class="never">Copies of  <br/> Translation Sample</th>
                                            <th class="never">T&C has been <br/> Accepted</th>
                                            <th class="never">Approved</th> 
                                            <th class="never">Genre</th>   
                                            <th class="never"></th>
                                            <th class="never">Expert Reader</th>
                                            <th class="all">Book Title</th>
                                            <th class="never">24Translator Titles</th>
                                            <th class="never">25 Titles</th>
                                            <th class="never">26 Translator CV Doc Name</th>
                                            <th class="never">27 Cover</th>
                                            <th class="never">28 Sample Sent Out</th>
                                            <th class="never">29 Sample Returned</th>
                                            <th class="never">30 Reader Report</th>
                                            <th class="never">31 Expert Reader List</th>
                                            <th class="never">32 Unassigned Expert Reader List</th>    
                                            <th class="never">33 idTranslator</th>
                                            <th class="never">34 Original Date of Publication</th>
                                            <th class="never">35 Original Language</th>
                                            <th class="never">36 Page Extent <br/>(of the original)</th>
                                            <th class="never">37 Country of Publication</th>    
                                            <th class="never">38 Foreign Publisher</th>
                                            <th class="never">39 Foreign Country</th>
                                            <th class="never">Target Language</th>
                                            <th class="never">Board Meeting</th>
                                            <th class="never">Amount Requested</th>
                                            <th class="never">Amount Approved</th>
                                            <th class="never">Publisher informed of Meeting</th>
                                            <th class="never">Board Comments/Instructions</th>
                                            <th class="never">Contract Sent to Publisher</th>
                                            <th class="never">Acknowledgement Approved</th>
                                            <th class="never">Date Published Books Received</th>    
                                            <th class="never">Date Payment made to Publisher</th>
                                            <th class="never">Payment Reference Number</th>
                                            <th class="never">Addendum</th>
                                            <th class="never">Addendum Name</th>
                                            <th class="never">Proof of Payment</th>    
                                            <th class="never">Proof of Payment Name</th>
                                            <th class="never">Bank Details</th>
                                            <th class="never">Bank Details Name</th>    
                                            <th class="never">Signed LI Contract</th>
                                            <th class="never">Signed LI ContractName</th>
                                            <th class="never">Payment Status</th>
                                            <th class="never">Previous Grant Aid</th>
                                            <th class="never">Award</th>    
                                            <th class="never">Sales Figures</th>
                                            <th class="never">Original</th>
                                            <th class="never">Original Name</th>
                                            <th class="all">Author(s)</th>
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
                                        <!-- Main Grid -->   
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th class="details-control"></th>   
                                            <th class="never">Application<br/>  No</th>
                                            <th class="never">Application<br/>  Year</th>
                                            <th class="all">Reference<br/>  No</th>
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
                                            <th class="never">Status</th>
                                            <th class="never">Copies <br/> Sent</th>
                                            <th class="never">Date Copies  <br/> Were Sent</th>
                                            <th class="never">Copies of  <br/> Translation Sample</th>
                                            <th class="never">T&C has been <br/> Accepted</th>
                                            <th class="never">Approved</th> 
                                            <th class="never">Genre</th>   
                                            <th class="never"></th>
                                            <th class="never">Expert Reader</th>
                                            <th class="all">Book Title</th>
                                            <th class="never">24Translator Titles</th>
                                            <th class="never">25 Titles</th>
                                            <th class="never">26 Translator CV Doc Name</th>
                                            <th class="never">27 Cover</th>
                                            <th class="never">28 Sample Sent Out</th>
                                            <th class="never">29 Sample Returned</th>
                                            <th class="never">30 Reader Report</th>
                                            <th class="never">31 Expert Reader List</th>
                                            <th class="never">32 Unassigned Expert Reader List</th>    
                                            <th class="never">33 idTranslator</th>
                                            <th class="never">34 Original Date of Publication</th>
                                            <th class="never">35 Original Language</th>
                                            <th class="never">36 Page Extent <br/>(of the original)</th>
                                            <th class="never">37 Country of Publication</th>    
                                            <th class="never">38 Foreign Publisher</th>
                                            <th class="never">39 Foreign Country</th>
                                            <th class="never">Target Language</th>
                                            <th class="never">Board Meeting</th>
                                            <th class="never">Amount Requested</th>
                                            <th class="never">Amount Approved</th>
                                            <th class="never">Publisher informed of Meeting</th>
                                            <th class="never">Board Comments/Instructions</th>
                                            <th class="never">Contract Sent to Publisher</th>
                                            <th class="never">Acknowledgement Approved</th>
                                            <th class="never">Date Published Books Received</th>    
                                            <th class="never">Date Payment made to Publisher</th>
                                            <th class="never">Payment Reference Number</th>
                                            <th class="never">Addendum</th>
                                            <th class="never">Addendum Name</th>
                                            <th class="never">Proof of Payment</th>    
                                            <th class="never">Proof of Payment Name</th>
                                            <th class="never">Bank Details</th>
                                            <th class="never">Bank Details Name</th>    
                                            <th class="never">Signed LI Contract</th>
                                            <th class="never">Signed LI ContractName</th>
                                            <th class="never">Payment Status</th>
                                            <th class="never">Previous Grant Aid</th>
                                            <th class="never">Award</th>    
                                            <th class="never">Sales Figures</th>
                                            <th class="never">Original</th>
                                            <th class="never">Original Name</th>
                                            <th class="all">Author(s)</th>
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
                            </div> <!-- Main Grid -->       

                        </div> <!-- container-fluid -->  
                    </div> <!-- tab-pane "Application" -->  

                    <c:if test="${not empty error}">Error: ${error}</c:if>

                    </div> <!-- container-fluid -->

                    <div class="modal fade" id="applicationsModal" data-modal-index="1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #c3bcbc">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title">Add details to application <span id="appReferenceNumber"></span></h4>
                                </div>

                                <!-- modal-body -->
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
                                                <!--<a class="navbar-brand" href="#">Brand</a>-->
                                            </div>

                                            <!-- Collect the nav links, forms, and other content for toggling -->
                                            <div class="collapse navbar-collapse" id="myTab"  style="font-size: 0.8em !important;  background-color: #d9d1d1">
                                                <ul class="nav navbar-nav nav-tabs two-lines">
                                                    <li class="active"><a href="#Contact" data-toggle="tab">Contact <br/>Details</a></li>
                                                    <li><a href="#books" data-toggle="tab">Book<br/> Details</a></li>                                                    
                                                    <li><a href="#Publication" data-toggle="tab">Publication<br/>  Details</a></li>
                                                    <li><a href="#Translator" data-toggle="tab">Translator's <br/> Details</a></li>
                                                    <li><a href="#Rights" data-toggle="tab">Rights Agreement <br/>&nbsp;</a></li>
                                                    <!--              <li><a href="#Misc" data-toggle="tab">Misc</a></li>  -->
                                                    <li><a href="#Original" data-toggle="tab"><span>Original Work<br/>& Sample Translation</span></a></li>
                                                </ul>
                                            </div><!-- /.navbar-collapse -->

                                            <form 
                                                method="POST" 
                                                id="applicationEditForm" 
                                                name="applicationForm" 
                                                action="${pageContext.request.contextPath}/OpenApplicationServlet" 
                                            enctype="multipart/form-data"
                                            >
                                            <%request.getSession().setAttribute( "task", "openApplications" );%>
                                            <div id="applicationEditForm-tab-content" class="tab-content"  style="background-color: #E8F6FF">
                                                <input type="hidden" name="name" value="${name}">
                                                <input type="hidden" name="username" id="username3" value="${username}">
                                                <!-- Contact details -->
                                                <div class="tab-pane active" id="Contact">

                                                    <!--wrapper for Contact tab pane-->
                                                    <div class="container-fluid">

                                                        <!--first row-->
                                                        <!--get Company and Company_Number via autocomplete-->
                                                        <div class="row" style="margin-bottom: 20px;margin-top: 30px">
                                                            <div class="col-sm-6">
                                                                <input  id="company" 
                                                                        name="company" 
                                                                        type="text" 
                                                                        value="${publisherName}"
                                                                        data-toggle="tooltip"
                                                                        title="Please Enter your Company's Name - if it does not show up please fill in the form"
                                                                        class="form-control"
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
                                                            <div class="col-sm-6">
                                                                <label class="pull-left">Address1</label>
                                                                <input id="Address1"
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Address1"                                
                                                                       value="${companyDetails.Address1}"                                
                                                                       placeholder="Address1"
                                                                       >
                                                            </div>
                                                            <div class="col-sm-2">
                                                                <label class="pull-left">Post code</label>
                                                                <input id="postCode"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="postCode"                                
                                                                       value="${companyDetails.postCode}"                                
                                                                       placeholder="Post Code"
                                                                       >
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <label class="pull-left">City</label>
                                                                <input id="City"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="City"                                
                                                                       value="${companyDetails.City}"                                
                                                                       placeholder="City"
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <!--third row-->
                                                        <div class="row" style="margin-bottom: 10px">
                                                            <div class="col-sm-6">
                                                                <label class="pull-left">Address2</label>
                                                                <input id="Address2"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Address2"                                
                                                                       value="${companyDetails.Address2}"                                
                                                                       placeholder="Address2"
                                                                       >
                                                            </div>

                                                            <div class="col-sm-5">
                                                                <label class="pull-left">Country</label>
                                                                <input id="country"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Country"                                
                                                                       value="${companyDetails.Country}"                                
                                                                       placeholder="Country"
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <!--fourth row-->
                                                        <div class="row" style="margin-bottom: 10px">
                                                            <div class="col-sm-6">
                                                                <label class="pull-left">Address3</label>
                                                                <input id="Address3"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Address3"                                
                                                                       value="${companyDetails.Address3}"                                
                                                                       placeholder="Address3"
                                                                       >
                                                            </div>
                                                            <div class="col-sm-2">   
                                                                <label class="pull-left">&nbsp;</label>
                                                                <input id="countryCode"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Country_Code"                                
                                                                       value="${companyDetails.CountryCode}"                               
                                                                       readonly
                                                                       placeholder="Country Code"
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <!--fifth row-->
                                                        <div class="row" style="margin-bottom: 10px">
                                                            <div class="col-sm-6">      
                                                                <label class="pull-left">Address4</label>
                                                                <input id="Address4"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Address4"                                
                                                                       value="${companyDetails.Address4}"                                
                                                                       placeholder="Address4"
                                                                       >
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <label class="pull-left">Telephone</label>
                                                                <input id="Telephone"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Telephone"                                
                                                                       value="${companyDetails.Telephone}"                                
                                                                       >
                                                            </div>
                                                        </div> <!--row-->

                                                        <!--sixth row-->
                                                        <div class="row" style="margin-bottom: 10px">
                                                            <div class="col-sm-6"></div>
                                                            <div class="col-sm-3">
                                                                <label class="pull-left">Fax number</label>
                                                                <input id="Fax"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Fax"                                
                                                                       value="${companyDetails.Fax}"
                                                                       >
                                                            </div>
                                                        </div> <!--row-->


                                                        <!--seventh row-->
                                                        <div class="row" style="margin-bottom: 10px">
                                                            <div class="col-sm-6">
                                                                <label class="pull-left">Email</label>
                                                                <input id="Email"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="Email"                                
                                                                       value="${companyDetails.Email}"                                
                                                                       placeholder="Main Email"
                                                                       >
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <label class="pull-left">Website</label>
                                                                <input id="WWW"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="WWW"                                
                                                                       value="${companyDetails.WWW}"                                
                                                                       placeholder="Web Address"
                                                                       >
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
                                                                               value="${companyDetails.doNotMail}" 
                                                                               checked =""
                                                                               >  
                                                                        <label for="doNotMail">Sign up to newsletters</label>
                                                                    </div><!--checkbox-->
                                                                </div> <!--well-->
                                                            </div> <!--<div class="col-sm-3">-->   
                                                        </div> <!--row-->
                                                        <input type="hidden" id="authorArray" name="authorArray" >
                                                        <input type="hidden" id="ReferenceNumber" name="ReferenceNumber" >
                                                        <input type="hidden" id="translatorArray" name="translatorArray" >
                                                        <input type="hidden" id="rightsHolderArray" name="rightsHolderArray" >
                                                        <input type="hidden" id="Status" name="Status" >
                                                        <!--keep in one line otherwise placeholder doesn't show-->
                                                        <textarea id="companyNotes"  class="form-control" style="width: 870px; height: 343px;" name="companyNotes" placeholder="enter optional notes"> <c:out value="${companyDetails.Notes}" /></textarea>

                                                    </div> <!--container-->
                                                </div> <!-- tab-pane "Contact" -->

                                                <!-- Book Details -->
                                                <div class="tab-pane fade" id="books">
                                                    <p class="header1">
                                                        Book Details
                                                    </p>
                                                    <div class="container-fluid">

                                                        <div class="row"  style="display: block;
                                                             margin-right: auto;
                                                             margin-left: auto;">

                                                            <!--First row-->
                                                            <!--in Panel-->
                                                            <div class = "panel panel-default">
                                                                <div class = "panel-body">

                                                                    <div class="row" style="margin-bottom: 10px">
                                                                        <div class="col-sm-8">    

                                                                            <label for="authors" class="pull-left">Author(s)</label><br/>
                                                                            <div class="form-group">

                                                                                <textarea class="form-control" id="authors" readonly name="authors" ></textarea>
                                                                                <!--       <input id="aFirstName"                                
                                                                                      type="text"                                
                                                                                      class="form-control"                                
                                                                                      name="AuthorFirstName"                                
                                                                                      value=""    
                                                                                      placeholder="Author First Name"
                                                                                      >
                                                                               <i class="glyphicon glyphicon-search form-control-feedback"></i>-->
                                                                            </div>  <!-- input-group -->
                                                                        </div>
                                                                    </div> <!--row-->




                                                                    <!--Second row-->
                                                                    <div class="row" style="margin-bottom: 15px">

                                                                        <div class="col-sm-4">    
                                                                            <label for="appBookTitle" class="pull-left">Title<br/> &nbsp;</label> 
                                                                            <input id="appBookTitle"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="appBookTitle"                                
                                                                                   value=""    
                                                                                   placeholder="Title"
                                                                                   >
                                                                        </div>
                                                                        <input type="hidden" id="bookTitle" name="bookTitle" >
                                                                        <div class="col-sm-4">          
                                                                            <label for="foreignPublisher" class="pull-left">Publisher (of the original)<br/> &nbsp;</label>                                                           
                                                                            <input id="foreignPublisher"                                
                                                                                   type="text"                                
                                                                                   class="form-control"                                
                                                                                   name="foreignPublisher"                                
                                                                                   value="${companyDetails.Company}"    
                                                                                   placeholder="Publisher"
                                                                                   >                                                     
                                                                        </div>

                                                                    </div> <!--row-->


                                                                    <!--Third row-->

                                                                    <div class="row" style="margin-bottom: 10px">

                                                                        <div class="col-sm-4">    
                                                                            <div class="form-group has-feedback">
                                                                                <label for="appGenre" class="pull-left">Genre</label>
                                                                                <input id="appGenre"                                
                                                                                       type="text"                                
                                                                                       class="form-control"                                
                                                                                       name="genre"                                
                                                                                       value=""    
                                                                                       placeholder="Genre"
                                                                                       >
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!--Fourth row-->
                                                                    <div class="row" style="margin-bottom: 10px">

                                                                        <div class="col-xs-8">

                                                                            <div class="row">

                                                                                <div class="col-xs-6">
                                                                                    <div class="mini-box">
                                                                                        <div class="form-group has-feedback">
                                                                                            <label for="appLanguageOriginal" class="pull-left" >Language (of the original)</label>
                                                                                            <input id="appLanguageOriginal"                                
                                                                                                   type="text"                                
                                                                                                   class="form-control"                                
                                                                                                   name="languageOfTheOriginal"                                
                                                                                                   value=""    
                                                                                                   placeholder="Language"

                                                                                                   >
                                                                                        </div>
                                                                                    </div>
                                                                                </div> <!--col-xs-6-->

                                                                                <div class="col-xs-6" style="margin-bottom: 20px">
                                                                                    <div class="mini-box">
                                                                                        <label for="appCountryOfPublication" class="control-label pull-left" >Country of publication (of the original)</label>
                                                                                        <input id="appCountryOfPublication"                                
                                                                                               type="text"                                
                                                                                               class="form-control"                                
                                                                                               name="appCountryOfPublication"                                
                                                                                               value=""    
                                                                                               placeholder="Country of Publication"
                                                                                               >
                                                                                    </div>
                                                                                </div> <!--col-xs-6-->
                                                                            </div> <!--row-->

                                                                            <div class="row">

                                                                                <div class='col-sm-6'  style="margin-bottom: 40px;">                                                
                                                                                    <label for="originalPageExtent" class="control-label pull-left">Page extent of the  (of the original): </label>
                                                                                    <div class="input-group pull-left"  style="margin-bottom: 40px;">
                                                                                        <span class="input-group-addon" id="sizing-addon3">  
                                                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                                                        </span>
                                                                                        <input type="text" name="originalPageExtent" id="originalPageExtent" class="form-control" placeholder="number of pages" aria-describedby="sizing-addon3">
                                                                                    </div>
                                                                                </div>
                                                                            </div> <!--row-->
                                                                        </div><!--col-xs-8-->
                                                                    </div> <!-- row-->


                                                                    <!--Eigthrow-->

                                                                    <div class="row" style="margin-bottom: 10px">

                                                                        <div class="col-sm-4">   
                                                                            <label for="bookNotes" class="pull-left">Notes</label>
                                                                            <div class="form-group">
                                                                                <textarea class="form-control" id="bookNotes" name="bookNotes" style="width: 600px; height: 215px" placeholder="Notes"></textarea>
                                                                            </div>
                                                                        </div>                                                    
                                                                    </div> <!-- row  -->

                                                                </div>  <!-- panel-body-->     
                                                            </div>  <!-- panel --> 

                                                        </div> <!-- row  -->

                                                    </div>  <!-- container-fluid  -->

                                                </div><!-- tab-pane "Book" -->

                                                <!-- Publication Details -->
                                                <div class="tab-pane" id="Publication">
                                                    <p class="header1" style="margin-bottom: 40px">
                                                        Publication Details
                                                    </p>

                                                    <div class="container-fluid">
                                                        <div class="col-xs-12 content">

                                                            <div class="row">


                                                                <div class='col-sm-4'>
                                                                    <label for="proposedDateOfPublication" class="control-label pull-left">Proposed date of publication</label>
                                                                    <div class="input-group pull-left"   style="margin-bottom: 40px;">
                                                                        <input type="text" name="proposedDateOfPublication" id="proposedDateOfPublication" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                        <label class="input-group-addon" for="proposedDateOfPublication">
                                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                                        </label>
                                                                    </div>
                                                                    <script>
                                                                        $("#proposedDateOfPublication").datepicker();
                                                                    </script>
                                                                </div>

                                                            </div> <!-- row -->

                                                            <div class="row">

                                                                <div class='col-md-4'  style="margin-bottom: 20px;">                                                
                                                                    <label for="plannedPageExtent" class="control-label pull-left">Planned page extent of the <br/>  published translation </label>
                                                                    <div class="input-group pull-left"  style="margin-bottom: 20px;">
                                                                        <span class="input-group-addon" id="sizing-addon2">  
                                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                                        </span>
                                                                        <input type="text" name="plannedPageExtent" id="plannedPageExtent" class="form-control" placeholder="number of pages" aria-describedby="sizing-addon2">
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-4 col-md-offset-1">
                                                                    <label for="appForeignCountry" class="control-label pull-left">Foreign Country <br/> &nbsp;</label>
                                                                    <input  id="appForeignCountry" 
                                                                            name="appForeignCountry" 
                                                                            type="text"                                                                
                                                                            class="form-control"     
                                                                            >
                                                                </div>

                                                            </div>  <!-- row -->

                                                            <div class="row">
                                                                <div class='col-sm-4'>
                                                                    <label for="appproposedPrintRun" class="control-label pull-left">Proposed print run </label>
                                                                    <div class="input-group pull-left"  style="margin-bottom: 20px;">
                                                                        <span class="input-group-addon" id="sizing-addon1">  
                                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                                        </span>
                                                                        <input type="text" name="appproposedPrintRun" id="appproposedPrintRun" class="form-control" placeholder="number of books" aria-describedby="sizing-addon1">  
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-4 col-md-offset-1">      
                                                                    <label for="appTargetLanguage" class="control-label pull-left"> Target Language</label>
                                                                    <input id="appTargetLanguage"                                
                                                                           type="text"                                
                                                                           class="form-control"                                
                                                                           name="appTargetLanguage"                                
                                                                           >
                                                                </div>
                                                            </div> <!-- row -->

                                                            <div class="row">

                                                                <div class="col-sm-4" style="margin-bottom: 20px">
                                                                    <label for="translationTitle" class="pull-left">Translation Title</label>
                                                                    <input id="translationTitle"                                
                                                                           type="text"                                
                                                                           class="form-control"                                
                                                                           name="translationTitle"                                
                                                                           value=""    
                                                                           placeholder="Translation Title"
                                                                           >
                                                                </div>

                                                                <div class="col-sm-4 col-md-offset-1"> 
                                                                    <div class="form-group">                                                                 
                                                                        <label for="publicationYear1" class="control-label pull-left">Year of Publication (original) </label>                                                                      
                                                                        <input type="text" 
                                                                               name="publicationYear1" 
                                                                               id="publicationYear1" 
                                                                               class="form-control" 
                                                                               placeholder="YYYY"
                                                                               />                                                                                                                                   
                                                                    </div>
                                                                    <script>
                                                                        $("#appDateOfPublicationOriginal").datepicker();
                                                                    </script>
                                                                </div> <!--col-xs-6-->

                                                            </div> <!-- row -->


                                                            <div class="row">

                                                                <div class="col-xs-4">
                                                                    <div class="mini-box"   style="margin-bottom: 20px">
                                                                        <label for="appCompany" class="pull-left">Translation Publisher</label>
                                                                        <input id="appCompany"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="appCompany"                                
                                                                               value=""    
                                                                               placeholder="Translation Publisher"
                                                                               >
                                                                    </div>
                                                                </div> <!--col-xs-6-->

                                                                <div class="col-sm-4 col-md-offset-1"> 
                                                                    <div class="mini-box">
                                                                        <div class="form-group has-feedback">
                                                                            <!--<label for="languages" class="pull-left" >Languages</label>-->
                                                                            <input id="languages"                                
                                                                                   type="hidden"                                
                                                                                   class="form-control"                                
                                                                                   name="languages"                                
                                                                                   >
                                                                            <!--<i class="glyphicon glyphicon-search form-control-feedback"></i>-->
                                                                        </div>
                                                                    </div>
                                                                </div> <!--col-xs-6-->

                                                                <input type="hidden" id="languageArray" name="languageArray" >

                                                            </div> <!-- row -->
                                                            <div class="row">
                                                                <div class="col-xs-4">
                                                                    <div class="mini-box" style="margin-bottom: 20px">
                                                                        <label for="series" class="pull-left" style="margin-top: 10px">Series</label>
                                                                        <input id="series"                                
                                                                               type="text"                                
                                                                               class="form-control"                                
                                                                               name="series"                                
                                                                               value=""    
                                                                               placeholder="Series"
                                                                               >
                                                                    </div>
                                                                </div> <!--col-xs-6-->
                                                            </div> <!-- row -->

                                                        </div>  <!-- col-xs-12 content -->
                                                    </div> <!-- container-fluid -->
                                                </div> <!-- tab-pane "Publication Details" -->

                                                <!-- Translator's Details -->
                                                <div class="tab-pane fade" id="Translator"> 
                                                    <p class="header1" style="margin-bottom: 5px">
                                                        Translator Details
                                                    </p>

                                                    <div class="container-fluid" id="torget">                                                        

                                                        <div class="row" style="margin-bottom: 1px">
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <div class="col-md-4" style="margin-top: 40px; margin-bottom: 20px">                                              

                                                                        <label for="translatorFee" class="control-label pull-left">Translator(s)'s fee</label>                                                                        
                                                                        <div class="input-group pull-left" style="margin-bottom: 20px">
                                                                            <label class="input-group-addon" for="translatorFee">
                                                                                <span class="glyphicon glyphicon-euro"></span>                                     
                                                                            </label>
                                                                            <input type="text" class="form-control pull-left" name="translatorFee" id="translatorFee" placeholder="fee">    
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-4" style="margin-top: 40px; margin-bottom: 20px">  
                                                                        <label for="BreakDownOfTranslatorFee" class="control-label pull-left">Break-down of translator(s)'s fee</label>                                                  
                                                                        <div class="form-group">
                                                                            <!--keep in one line otherwise placeholder doesn't show-->
                                                                            <textarea class="form-control" placeholder="Break-down of translator fee" name="BreakDownOfTranslatorFee" id='BreakDownOfTranslatorFee' style="width: 280px; height: 196px;"></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>  <!--panel--body-->
                                                            </div> <!--panel-default-->
                                                        </div> <!-- row -->


                                                        <div class="row" style="margin-bottom: 10px">

                                                            <!--<div class="container-fluid" id="translatorTabs" style="display: none">-->
                                                            <div class="container-fluid" id="translatorTabs" >
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
                                                                        <div  id="tn">
                                                                        </div>  <!-- tn -->
                                                                        <div class="tab-content pull-left" id="tnc">
                                                                        </div>  <!-- tnc -->
                                                                    </div>  <!-- <div class="container-fluid"  -->
                                                                </nav>  <!-- <nav class="navbar -->
                                                            </div> <!-- container-fluid  -->

                                                        </div> <!--row-->
                                                    </div> <!-- container-fluid  -->
                                                </div> <!-- class="tab-pane" id="Translator" -->  

                                                <!-- Rights Agreement -->
                                                <div class="tab-pane fade" id="Rights">
                                                    <p class="header1" style="margin-bottom: 5px">
                                                        Rights Agreement
                                                    </p>

                                                    <div class="container-fluid"  id="rightsAgreementContracts">
                                                        <!--<div class="container-fluid">-->
                                                        <!--<div class="tab-content">-->

                                                        <!--Upload form for agreement-->
                                                        <div class="row" style="margin-bottom: 80px;">
                                                            <div style=" margin: 0 auto; position: relative;">

                                                                <div class="col-md-8"  id="agreementToggle1" style="margin-bottom: 40px; position:absolute; z-index:0;">
                                                                    <div class="input-group ">
                                                                        <label  class="control-label pull-left"> <strong class="pull-left"  id="uploadAgreement1"></strong>
                                                                            <small> Please upload the rights agreement</small>     
                                                                        </label>
                                                                        <!--<label  class="control-label pull-left" id="uploadAgreement1" ></label>-->
                                                                        <br/>
                                                                        <div class="margin-bottom: 40px"></div>
                                                                        <div class="input-group agreement"  style="margin-bottom: 40px;">
                                                                            <label class="btn btn-default btn-file pull-left">
                                                                                Select file <input type="file" onchange="generatedLabels()" name="Agreement-1" id="agreement1">
                                                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                                            </label>
                                                                            <input  type="text" id="label_agreement1" class="pull-left"/>
                                                                            <input type="hidden" value="Agreement" name="destination" id="agreement_upload1"/>
                                                                            <span class="help-block"></span> 
                                                                        </div> 
                                                                    </div>   
                                                                </div> <!-- position:absolute; z-index:0 -->

                                                                <div class="col-md-7" id="agreement_button1" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> 
                                                                    <div class="input-group ">
                                                                        <label  class="control-label pull-left" id="agreement_button_label1" ></label>
                                                                    </div>
                                                                    <div class="input-group agreement_buttonText pull-left">
                                                                        <a class="btn btn-info btn-file pull-left" role="button" id="agreement_link1" href=""  target="_blank">
                                                                            <span class="glyphicon glyphicon-file"></span>
                                                                            Click to open</a>
                                                                    </div> 
                                                                </div> <!-- position:absolute; z-index:1; display:none -->

                                                            </div> <!-- position: relative  -->
                                                        </div> <!-- row  -->

                                                        <!--Name of translation rights holder-->
                                                        <div class="row" style="margin-bottom: 40px;margin-top: 60px">  

                                                            <div class="col-sm-6">  
                                                                <div class="input-group has-feedback"  style="margin-bottom: 10px">  
                                                                    <label for="rightsHoldersName0" class="pull-left" id="rightsHoldersNameLabel">Translation rights holder</label>
                                                                    <input id="rightsHoldersName0"                                
                                                                           type="text"                                
                                                                           class="form-control"                                
                                                                           name="rightsHoldersName"                                
                                                                           value=""    

                                                                           placeholder="Translation rights holder"
                                                                           >
                                                                </div>

                                                                <div id="addAddRightsHolders"></div>

                                                            </div>

                                                            <div class="col-sm-4" style="margin-top: 30px; visibility: block" id="addAdditionalRightsHoldersModalDiv">  
                                                                <a href="#" class="btn btn-group-sm btn-default pull-left" 
                                                                   data-toggle="modal" 
                                                                   data-target="#addAdditionalRightsHoldersModal"
                                                                   onclick="copyFirstRightsHolderName();"
                                                                   >Add more Translation rights holders</a>
                                                            </div>

                                                        </div> <!-- row  -->

                                                        <!--Upload form for addendum to the rights agreement-->
                                                        <div class="row" style="margin-bottom: 80px;">    

                                                            <div style=" margin: 0 auto; position: relative;">

                                                                <div class="col-md-10"  id="addendumToggle1" style="margin-bottom: 40px; position:absolute; z-index:0;">
                                                                    <div class="input-group ">
                                                                        <label  class="control-label pull-left"> <strong class="pull-left"  id="uploadAddendum1"></strong>
                                                                            <small> Please upload an addendum to the rights agreement (where applicable)</small>     
                                                                        </label>
                                                                        <br/>                                                               
                                                                        <div class="form-group addendum  pull-left"  style="margin-bottom: 40px;">

                                                                            <label class="btn btn-default btn-file pull-left">
                                                                                Select file <input type="file" onchange="generatedLabels()" name="Addendum-1" id="addendum1">
                                                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                                            </label> 

                                                                            <input type="text" id="label_addendum1" class="pull-left"/>                                                                        
                                                                            <input type="hidden" value="Addendum" name="destination" id="addendum_upload1"/>
                                                                            <span class="help-block"></span> 
                                                                        </div>         
                                                                    </div>                                                   
                                                                </div> <!-- position:absolute; z-index:0 -->
                                                                <div class="col-md-7" id="addendum_button1" style="margin-bottom: 40px; position:absolute; z-index:1; display:none;"> 
                                                                    <div class="input-group ">
                                                                        <label class="control-label pull-left" id="addendum_button_label1"></label> <small class='pull-left'> &nbsp;  (where applicable)456</small>'
                                                                    </div>
                                                                    <div class="input-group addendum_buttonText pull-left">
                                                                        <a class="btn btn-info btn-file pull-left" role="button" id="addendum_link1" href=""  target="_blank">
                                                                            <span class="glyphicon glyphicon-file"></span>
                                                                            Click to open</a>
                                                                    </div>
                                                                </div> <!-- position:absolute; z-index:1; display:none -->

                                                            </div> <!-- position: relative  -->
                                                        </div> <!-- row  -->
                                                        <div class="col-sm-12" style="min-height: 100%;height: 100%;margin-bottom: 80px"></div>

                                                        <!--</div> tab-content-->
                                                    </div> <!-- container-fluid  -->
                                                </div> <!-- class="tab-pane" id="Rights" -->

                                                <!-- Original Work & Sample Translation -->
                                                <div class="tab-pane" id="Original">
                                                    <p class="header1" style="margin-bottom: 40px">
                                                        Original Work & Sample Translation
                                                    </p>

                                                    <div class="container-fluid">

                                                        <!--                                                        <div class="row" >
                                                        
                                                                                                                    <div class="panel panel-default">
                                                                                                                        <div class="panel-body">
                                                        
                                                                                                                            copies of the original work
                                                                                                                            <div class="col-md-9" >
                                                                                                                                <div class="checkbox pull-left">                                                             
                                                                                                                                    <label for="copiesSent" class="pull-left"><strong>One copy of the original work<sup>*</sup> sent to Literature Ireland by post</strong></label>
                                                                                                                                    <label style="font-size: 2.0em; " class="checkbox-inline  no_indent">
                                                                                                                                        <input type="checkbox" 
                                                                                                                                               name="copiesSent" 
                                                                                                                                               id="copiesSent" 
                                                                                                                                               checked =""
                                                                                                                                               value="" 
                                                                                                                                               class="form-control">
                                                                                                                                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                                                                                                                    </label>
                                                                                                                                    <input type="hidden" name="userID" value="${userID}">
                                                                                                                                    <input type="hidden" name="publisherID" value="${publisherID}">
                                                                                                                                    <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                                                                                                </div>
                                                                                                                            </div>  col-md-9 
                                                        
                                                        
                                                        
                                                                                                                            Date copies were sent:
                                                                                                                            <div class="col-md-3" >
                                                                                                                                <label for="copiesSent" class="pull-left"><strong>Date copies were sent</strong> </label>
                                                                                                                                <div class="input-group pull-left" >
                                                                                                                                    <input type="text" name="dateCopiesWereSent" id="dateCopiesWereSent" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                                                                                    <label class="input-group-addon" for="dateCopiesWereSent">
                                                                                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                                                                                    </label>
                                                                                                                                </div>   input-group 
                                                                                                                            </div> col-md-3
                                                        
                                                                                                                            datepicker  mail-sent
                                                                                                                            <script>
                                                                                                                                $("#dateCopiesWereSent").datepicker();
                                                                                                                            </script>
                                                        
                                                                                                                        </div> panel--body
                                                                                                                    </div> panel-default
                                                        
                                                                                                                </div>  row -->

                                                        <div class="row" >

                                                            <div class="panel panel-default">        
                                                                <div class="panel-body">
                                                                    <div class="col-md-12">

                                                                        <div class="row input-group ">
                                                                            <label  class="control-label pull-left">Open electronic copy of original work </label>
                                                                            <div class="col-md-6"   style="margin-bottom: 20px">        
                                                                                <div class="input-group originalSample1 pull-left" >
                                                                                    <a class="btn btn-info btn-file pull-left" role="button" id="originalSample1" href=""  target="_blank">
                                                                                        <span class="glyphicon glyphicon-file"></span>
                                                                                        Copy of original work</a>
                                                                                </div>
                                                                            </div>
                                                                        </div> <!--row-->

                                                                        <div class="row input-group">
                                                                            <label class="control-label pull-left">Open copy of translation sample<sup>**</sup><br/> (10 to 12 pages of prose or six poems)</label>
                                                                            <div class="col-md-6"   style="margin-bottom: 20px">        
                                                                                <div class="input-group translationSample1 pull-left" >
                                                                                    <a class="btn btn-info btn-file pull-left" role="button" id="translationSample1" href=""  target="_blank">
                                                                                        <span class="glyphicon glyphicon-file"></span>
                                                                                        Copy of translation sample</a>
                                                                                </div>
                                                                            </div>
                                                                        </div> <!--row-->                                                            
                                                                        <!-- translationSampleForm -->                                                                                                              
                                                                    </div>  <!-- col-md-12 -->
                                                                </div>  <!--panel--body-->
                                                            </div> <!--panel-default-->

                                                        </div> <!-- row -->

                                                        <div class="row" >

                                                            <div class="panel panel-default">        
                                                                <div class="panel-body">

                                                                    <div class="col-md-9"   >
                                                                        <div class="input-group input-group-lg"> <br/>
                                                                            <button type="submit"                                                                          
                                                                                    data-toggle="tooltip" 
                                                                                    class="btn btn-success"
                                                                                    title="Click to update the application!"
                                                                                    style="margin-bottom: 10px"
                                                                                    >
                                                                                Update the application
                                                                                <span class="glyphicon glyphicon-import"></span>
                                                                            </button>
                                                                        </div><!-- input-group -->
                                                                    </div>  <!-- col-md-9 -->
                                                                </div>  <!-- panel--body -->
                                                            </div>  <!--panel--default-->     

                                                        </div> <!-- row -->
                                                        <input type="hidden" name="userID" value="${userID}">
                                                        <input type="hidden" name="publisherID" value="${publisherID}">
                                                        <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                        <hr/>
                                                        <div class="col-md-12">
                                                            <!--<i class="pull-left"><strong> &nbsp; *</strong> Please contact Literature Ireland if a hard copy of the original work cannot be obtained.</i><br/>-->
                                                            <i class="pull-left">  <strong>**</strong> If more than one translator is involved, a translation sample must be submitted for each translator.</i>
                                                        </div>    
                                                    </div>  <!-- container-fluid -->
                                                </div>  <!-- tab-pane Original --> 

                                            </div> <!-- applicationEditForm-tab-content -->

                                        </form>

                                    </div> <!-- container-fluid -->  
                                </nav>   
                            </div> <!-- /.modal-body -->    
                            <div class="modal-footer"  style="background-color: #c3bcbc">
                                &nbsp; &nbsp;
                            </div>
                        </div>  <!--/.modal-content--> 

                    </div> <!--/.modal-dialog--> 

                </div>  <!--/.modal applicationsModal-->

                <!--</div>  my-tab-content -->

                <!--addAdditionalRightsHoldersModal-->
                <div class="modal fade" id="addAdditionalRightsHoldersModal" tabindex="-1" role="dialog" aria-labelledby="addAdditionalRightsHoldersModalLabel">
                    <div class="modal-dialog">
                        <div class="modal-content" style="background-color: #d9d1d1">
                            <div class="modal-header" style="background-color: #c3bcbc">
                                <button type="button" class="close" data-dismiss="modal"  onclick="backToRightsAgreement();"  aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="addAdditionalRightsHoldersModalLabel">add more Translation rights holder</h4>
                            </div>


                            <div class="modal-body" style="background-color: #d9d1d1">

                                <div class="row" style="margin-bottom: 10px">

                                    <div class='col-sm-12'>

                                        <div  id="RightsHolderGeneratedForm" class="input-group" style='margin-bottom:2px;'>
                                            1. Rights holder <input  type="text" id="firstRightsHolder0" value="Name" style='margin-bottom:2px'>                                                         
                                        </div>
                                    </div>

                                </div> <!-- row -->

                            </div><!--modal body -->

                            <div class="modal-footer"  style="background-color: #c3bcbc">
                                <button id="addAdditionalRightsHolders" type="button" value="additional rights holders"  class="btn btn-group-sm  button teal pull-left">Add additional rights holders</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="backToRightsAgreement();">Done</button>
                                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                            </div> <!--modal footer -->

                        </div> <!--modal content-->          
                    </div> <!--modal dialog-->
                </div> <!--modal fade-->


                <form class="form-horizontal" 
                      role="form"  
                      autocomplete="on"  
                      action="${pageContext.request.contextPath}/Application" 
                      method="POST" 
                      name="regF"
                      >

                    <input type="hidden" name="userID" value="${userID}">
                    <input type="hidden" name="name" value="${name}">
                    <input type="hidden" name="publisherID" value="${publisherID}">
                    <input type="hidden" name="Company" value="${companyDetails.Company}">
                    <input type="hidden" name="publisherName" value="${companyDetails.Company}">
                    <input type="hidden" name="username" id="username4" value="${username}">
                    <div class="container col-sm-12" style="margin-bottom: 40px">
                        <input type="submit" id="NewApplication" name="task"  class = "btn btn-default btn-sm" value="Start New Application" />
                        <input type="submit" id="ListOpenApplications" name="task"  class = "btn btn-default btn-sm active" value="List Open Applications" />
                        <input type="submit" id="ListPendingApplications" name="task"  class = "btn btn-default btn-sm" value="List Pending Applications" />
                        <input type="submit" id="ListClosedApplications" name="task"  class = "btn btn-default btn-sm" value="List Closed Applications" />
                    </div>

                </form>


                <!-- footer start -->
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

            <!--        <div class="shadowbase"> </div>-->

        </div>  <!--  end of Shadowholder container div -->

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

        <script src="js/openApplications.js"></script>

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
