<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : newApplication
    Created on : 19-Mar-2017, 11:27:58
    Author     : markus
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html style="height: 100%" lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->

        <title>Translation Grant Application System</title>

        <!-- Bootstrap -->

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 

        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>-->
        <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
        <!--        <script src="https://code.jquery.com/jquery-3.0.0.js"></script>
                <script src="https://code.jquery.com/jquery-migrate-3.0.1.js"></script>-->

        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link type="text/css" rel="stylesheet" href="jquery.inputfile.css" />

        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.boot/strapvalidator/0.5.3/css/bootstrapValidator.min.css" />
        <link rel="stylesheet" type="text/css" href="css/newApplication.css">

        <script type="text/javascript"  src="js/moment.js"></script>
        <!--    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js" ></script>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>-->
        <script type="text/javascript"  src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"  src="js/jquery-ui.js"></script>

        <script type="text/javascript"  src="js/pdf.js"></script>
        <script type="text/javascript"  src="js/pdf.worker.js"></script>
        <script src="js/bootstrap-validate.js"></script>
        <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
        <script type="text/javascript" src="js/xregexp-all.js"></script> 
        <!--<script src="js/validateFileName.js"></script>-->
        <!--          <script src="js/formValidator.js"></script>-->
        <script  type="text/javascript"  src="js/newApplicationFormValidator.js"></script>
        <script src="js/newApplication.js"></script>


    </head>

    <body style="height: 100%">

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
                        <h6> <small>Welcome <strong>${name}</strong> - <strong>not ${name}</strong>? <a href="${pageContext.request.contextPath}/Logout">Click here to log out </a></small></h6>
                    </div>
                </div> <!--container for welcome/logout-->

                <h1 style="align-content: center">Translation Grant Application System for Literature Ireland</h1>

                <div class="container-fluid" style="margin-bottom: 20px"></div> 

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
                        <div class="collapse navbar-collapse" id="myTab" style="background-color: #d9d1d1">
                            <ul class="nav navbar-nav nav-tabs two-lines">
                                <!--<li class="active"><a href="#info" data-toggle="tab">Info</a></li>-->
                                <li class="active"><a href="#Contact" data-toggle="tab">Contact Details</a></li>
                                <li><a href="#books" data-toggle="tab">Book<br/> Details</a></li>
                                <li><a href="#Publication" data-toggle="tab">Publication<br/>  Details</a></li>
                                <li><a href="#Translator" data-toggle="tab">Translator <br/> Details</a></li>
                                <li><a href="#Rights" data-toggle="tab">Rights Agreement <br/> & Contracts</a></li>
                                <!--         <li><a href="#Misc" data-toggle="tab">Misc</a></li>    -->
                                <li><a href="#Original" data-toggle="tab"><span>Original Work &<br/> Sample Translation</span></a></li>
                            </ul>
                            <div style="margin: 20px; text-align: center">
                                <a href="#" data-toggle="tooltip" data-placement="top" title="Info" ><i class="material-icons zoom" onclick="showInfoModal()();">info</i></a>
                                <a href="#" data-toggle="tooltip" data-placement="top" title="Notes" ><i class="material-icons zoom" onclick="showNotesModal()();">note</i></a>                           
                            </div>

                        </div><!-- /.navbar-collapse -->

                        <form  
                            method="POST" 
                            id="applicationForm" 
                            name="applicationForm" 
                            action="${pageContext.request.contextPath}/GrantApplicationServlet" 
                            enctype="multipart/form-data">

                            <div id="my-tab-content" class="tab-content"  style="background-color: #E8F6FF">


                                <input type="hidden" name="tcACCEPTED" id="tcACCEPTED">
                                <input type="hidden" name="gdprACCEPTED" id="gdprACCEPTED">
                                <input type="hidden" name="firstname" value ="${firstname}">
                                <input type="hidden" name="lastname" value ="${lastname}">
                                <input type="hidden" name="name" value ="${name}">
                                <input type="hidden" name="userID" value ="${userID}">
                                <input type="hidden" name="publisherID" value ="${publisherID}">
                                <input type="hidden" name="publisherName" value ="${publisherName}">
                                <input type="hidden" name="task" id="task">

                                <!--////////////////////////////////////////////////////////////////////////////
                                    ///
                                    ///  For Publisher Contact details Update
                                    ///
                                    ////////////////////////////////////////////////////////////////////////////-->

                                <!-- Contact details -->
                                <div class="tab-pane active" id="Contact">

                                    <!--wrapper for Contact tab pane-->
                                    <div class="container">

                                        <!--first row-->
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
                                                       disabled
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
                                                           value="${companyDetails.Address1}"                                
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
                                                           value="${companyDetails.postCode}"                                
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
                                                           value="${companyDetails.City}"                                
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
                                                           value="${companyDetails.Address2}"                                
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
                                                           value="${companyDetails.Country}"                                
                                                           placeholder="Country"
                                                           >
                                                </div>
                                            </div>

                                        </div> <!--row-->

                                        <!--fourth row-->
                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-sm-4">
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

                                            <div class="col-sm-4">      
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
                                                <div class="form-group">
                                                    <label for="Telephone" class="control-label pull-left">Telephone</label>
                                                    <input id="Telephone"                                
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="Telephone"                                
                                                           value="${companyDetails.Telephone}"  
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
                                                       value="${companyDetails.Fax}"
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
                                                           value="${companyDetails.Email}"                                
                                                           placeholder="Main Email"
                                                           required
                                                           >
                                                    <script type="text/javascript">
                                                        bootstrapValidate('#Email', 'required:fill out this field|email:Enter a valid email address');
                                                    </script>
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
                                                           value="${companyDetails.WWW}"                                
                                                           placeholder="Web Address"
                                                           onblur="validate();"
                                                           required
                                                           >
                                                    <script type="text/javascript">
                                                        bootstrapValidate('#WWW', 'required:fill out this field|url:Enter a valid URL');
                                                    </script>
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
                                                               value="${companyDetails.doNotMail}" 
                                                               checked =""
                                                               >  
                                                        <label for="doNotMail">Sign up to newsletters</label>
                                                    </div><!--checkbox-->
                                                </div> <!--well-->
                                            </div> <!--<div class="col-sm-3">-->   

                                        </div> <!--row-->

                                        <input type="hidden" id="translatorArray" name="translatorArray" >
                                        <input type="hidden" id="rightsHolderArray" name="rightsHolderArray" >
                                        <!--keep in one line otherwise placeholder doesn't show-->
                                        <label class="pull-left">Additional contact information (where applicable)</label>
                                        <textarea id="companyNotes"  class="form-control" style="width: 870px; height: 343px;" name="companyNotes" placeholder="enter optional notes"> <c:out value="${companyDetails.Notes}" /></textarea>

                                    </div> <!--container-->

                                </div> <!--tab contact-->

                                <!--////////////////////////////////////////////////////////////////////////////
                                    ///
                                    ///  For Book details
                                    ///
                                    ////////////////////////////////////////////////////////////////////////////-->

                                <!-- Book Details -->
                                <div class="tab-pane fade" id="books">
                                    <p class="header1">
                                        Book Details
                                    </p>
                                    <div class="container-fluid">

                                        <div class="row" style="margin-bottom: 10px">

                                            <!--<div class="col-sm-4">-->    
                                            <div class="form-group has-feedback col-sm-4">
                                                <label for="aFirstName" class="control-label pull-left">Author&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2510;</label>                                                
                                                <div class="input-group pull-left">

                                                    <input id="aFirstName"                               
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="AuthorFirstName"      
                                                           required="required"
                                                           value=""    
                                                           placeholder="Author First Name"
                                                           >                                                               
                                                </div>
                                            </div>
                                            <!--</div>-->

                                            <!--<div class="col-sm-4">-->    
                                            <div class="form-group has-feedback col-sm-4">
                                                <label for="aLastName" class="control-label pull-left">&nbsp;</label>
                                                <div class="input-group pull-left">

                                                    <input id="aLastName"                                
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="AuthorLastName"      
                                                           required="required"
                                                           value=""    
                                                           onblur="copyFirstRow2();"
                                                           placeholder="Author Last Name"
                                                           >                                                                
                                                </div>
                                            </div>
                                            <!--</div>-->

                                            <div class="col-sm-3" style="margin-top: 30px; ">  
                                                <a href="#" class="btn btn-group-sm btn-default pull-left" 
                                                   data-toggle="modal" 
                                                   data-target="#addAuthorModal"
                                                   onclick="copyFirstRow2();"
                                                   >Add more authors</a>

                                            </div>

                                        </div> <!--row-->


                                        <input type="hidden" id="author_array" name="authorArray" >

                                        <!--Second row-->
                                        <div class="row" style="margin-bottom: 15px">

                                            <div class="col-sm-4">    
                                                <div class="form-group has-feedback"> 
                                                    <div class="input-group pull-left">
                                                        <label for="title" class="control-label pull-left">Title</label> 
                                                        <input id="title"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="title"                                
                                                               value=""    
                                                               placeholder="Title"
                                                               >
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">          
                                                <div class="form-group has-feedback">  
                                                    <div class="input-group pull-left">
                                                        <label for="appForeignPublisher" class="control-label pull-left">Publisher (of the original work)</label>                                                           
                                                        <input id="appForeignPublisher"                                  
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="appForeignPublisher"                                
                                                               value=""    
                                                               placeholder="Publisher of original work"
                                                               >                                                     
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-3">    
                                                <div class="form-group has-feedback">  
                                                    <div class="input-group pull-left">
                                                        <label for="publicationYear" class="control-label pull-left">Publication year</label>
                                                        <input id="publicationYear"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="publicationYear"                                
                                                               value=""    
                                                               placeholder="Publication Year"
                                                               >
                                                    </div>
                                                </div>
                                            </div>

                                        </div> <!--row-->


                                        <!--Third row-->

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-sm-4">    
                                                <div class="form-group has-feedback">
                                                    <div class="input-group pull-left">
                                                        <label for="genre" class="control-label pull-left">Genre</label>
                                                        <input id="genre"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="genre"                                
                                                               value=""    
                                                               placeholder="Genre"
                                                               >
                                                        <i class="glyphicon glyphicon-search form-control-feedback" style="margin-right: 20px"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">    
                                                <div class="form-group has-feedback">
                                                    <div class="input-group pull-left">
                                                        <label for="translationTitle" class="control-label pull-left">Translation title</label>
                                                        <input id="translationTitle"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="translationTitle"                                
                                                               value=""    
                                                               placeholder="Translation Title"
                                                               >
                                                    </div>
                                                </div>
                                            </div>

                                        </div> <!--row-->


                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-xs-4">
                                                <div class="form-group has-feedback">
                                                    <div class="input-group pull-left">
                                                        <label for="appLanguageOriginal" class="control-label ">Language (of the original)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        <div class="input-group pull-left">
                                                            <span class="input-group-addon">  
                                                                <span class="fa fa-language  fa-2x"></span>                                                            
                                                            </span>
                                                            <input id="appLanguageOriginal"                                
                                                                   type="text"                                
                                                                   class="form-control"                                
                                                                   name="appLanguageOriginal"                                
                                                                   value=""    
                                                                   placeholder="Language"
                                                                   >      
                                                            <i class="glyphicon glyphicon-search form-control-feedback" style="margin-right: 20px"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> <!--col-xs-4-->

                                            <div class="col-xs-4">
                                                <div class="form-group has-feedback">
                                                    <label for="countryOfPublication" class="control-label" > Country of publication</label>
                                                    <div class="input-group pull-left">
                                                        <span class="input-group-addon">  
                                                            <span class="glyphicon glyphicon-globe fa-1x"></span>                                                            
                                                        </span>
                                                        <input id="countryOfPublication"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="countryOfPublication"                                
                                                               value=""    
                                                               placeholder="Country of Publication"
                                                               >
                                                        <i class="glyphicon glyphicon-search form-control-feedback" style="margin-right: 15px"></i>
                                                    </div>   
                                                </div>   
                                            </div> <!--col-xs-4-->  

                                        </div> <!--row-->

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-xs-4">
                                                <div class="form-group has-feedback">  
                                                    <div class="input-group pull-left">
                                                        <label for="series" class="control-label pull-left"> Series</label>
                                                        <input id="series"                                
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="series"                                
                                                               value=""    
                                                               placeholder="Series"
                                                               >
                                                    </div>
                                                </div>
                                            </div> <!--col-xs-6-->


                                            <div class="col-sm-4">           
                                                <div class="form-group has-feedback">  
                                                    <label for="originalPageExtent" class="control-label pull-left">Page extent of the (of the original) </label>                                                                                             
                                                    <div class="input-group pull-left">
                                                        <span class="input-group-addon">  
                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                        </span>
                                                        <input type="text" 
                                                               name="originalPageExtent" 
                                                               id="originalPageExtent" 
                                                               class="form-control" 
                                                               placeholder="number of pages" 
                                                               >                                               
                                                    </div>
                                                    <!--<label for="originalPageExtent" class="validation_error_message help-block"></label>-->                                         
                                                </div>
                                            </div>

                                        </div> <!--row-->

                                        <!--Eigth row-->

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="col-sm-4">   
                                                <label for="bookNotes" class="control-label pull-left">Notes</label>
                                                <div class="form-group">
                                                    <!--keep in one line otherwise placeholder doesn't show-->
                                                    <textarea class="form-control" id="bookNotes" name="bookNotes" style="width: 800px; height: 215px"  maxlength="2000" placeholder="Notes"></textarea>
                                                </div>
                                            </div>      

                                        </div> <!-- row  -->       

                                    </div>  <!-- container-fluid  -->

                                </div> <!-- class="tab-pane" id="books" -->

                                <!-- Rights Agreement -->
                                <div class="tab-pane" id="Rights">
                                    <p class="header1" style="margin-bottom: 40px">
                                        Rights Agreement & Contracts
                                    </p>

                                    <div class="container-fluid"  id="rightsAgreementContracts">

                                        <div class="tab-content">

                                            <div class="row" style="margin-bottom: 10px;">

                                                <!--Upload a copy of the agreement with the translation rights holder-->
                                                <div class="col-md-10">
                                                    <div class="form-group has-feedback">
                                                        <label for="agreement1" class="control-label pull-left">Upload a copy of the agreement with the translation rights holder</label>
                                                        <div class="input-group pull-left">
                                                            <label class="input-group-addon btn btn-default btn-file">
                                                                <input type="file"  
                                                                       id="agreement1" 
                                                                       name="Agreement-1"                                                                       
                                                                       onchange="generatedLabels();"
                                                                       >
                                                                Select file 
                                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                            </label> 
                                                            <input id="label_agreement1" class="pull-left" value=""/>  
                                                        </div>  
                                                        <input type="hidden" value="Agreement" name="destination" id="agreement_upload1"/>
                                                    </div>                                                                
                                                    <label for="Agreement-1" class="validation_error_message help-block"></label>                                                         
                                                </div> 

                                            </div> <!-- row  -->

                                            <!--Name of translation rights holder-->
                                            <div class="row" style="margin-bottom: 10px;">                                               
                                                <div class="col-sm-6">      
                                                    <div class="form-group has-feedback">
                                                        <label for="rightsHoldersName0" class="control-label pull-left" id="rightsHoldersNameLabel">Translation rights holder</label>
                                                        <input id="rightsHoldersName0"                                 
                                                               type="text"                                
                                                               class="form-control"                                
                                                               name="rightsHoldersName0"                                
                                                               value=""    
                                                               onblur="copyFirstRightsHolderName();"
                                                               placeholder="Translation rights holder"
                                                               >
                                                    </div>

                                                    <div id="addAddRightsHolders"></div>
                                                </div>


                                                <div class="col-sm-4" style="margin-top: 30px; visibility: block;display:none" id="addAdditionalRightsHoldersModalDiv">  
                                                    <a href="#" class="btn btn-group-sm btn-default pull-left" 
                                                       data-toggle="modal" 
                                                       data-target="#addAdditionalRightsHoldersModal"
                                                       onclick="copyFirstRightsHolderName();"
                                                       >Add more Translation rights holders</a>
                                                </div>

                                            </div> <!-- row  -->

                                            <div class="row" style="margin-bottom: 10px;">
                                                <!--Upload form for addendum to the rights agreement-->
                                                <div class="col-md-10">
                                                    <div class="form-group has-feedback">
                                                        <label for="addendum1" class="control-label pull-left">Upload a copy of the addendum to the rights agreement</label>
                                                        <div class="input-group pull-left">
                                                            <label class="input-group-addon btn btn-default btn-file">
                                                                <input type="file"  
                                                                       id="addendum1" 
                                                                       name="Addendum-1"      
                                                                       class="form-control"
                                                                       onchange="generatedLabels();"
                                                                       >
                                                                Select file 
                                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                            </label> 
                                                            <input id="label_addendum1" class="pull-left" value=""/>      
                                                        </div> 
                                                        <input type="hidden" value="Addendum" name="destination" id="addendum_upload1" class="destination"/>
                                                    </div>  
                                                    <label for="Addendum-1" class="validation_error_message help-block"></label>                                         
                                                </div> 

                                            </div> <!-- row  -->

                                        </div> <!--tab-content-->

                                    </div> <!-- container-fluid  -->

                                </div> <!-- class="tab-pane" id="Rights" -->

                                <!-- Publication Details -->
                                <div class="tab-pane" id="Publication">
                                    <p class="header1" style="margin-bottom: 40px">
                                        Publication Details
                                    </p>

                                    <div class="container-fluid">


                                        <div class="row">

                                            <div class='col-sm-4'>
                                                <div class="form-group has-feedback">
                                                    <label for="proposedDateOfPublication" class="control-label pull-left">Proposed date of publication</label>
                                                    <div class="input-group">
                                                        <input type="text" 
                                                               name="proposedDateOfPublication" 
                                                               id="proposedDateOfPublication" 
                                                               class="form-control" 
                                                               placeholder="DD/MM/YYYY" 
                                                               >    
                                                        <label class="input-group-addon" for="proposedDateOfPublication">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </label>
                                                    </div>
                                                </div>    
                                                <script>
                                                    $("#proposedDateOfPublication").datepicker().on('change', function () {
                                                        $(this).valid();  // triggers the validation test
                                                        // '$(this)' refers to '$("#datepicker")'
                                                    });
                                                </script>
                                            </div>    

                                        </div> <!-- row  -->

                                        <div class="row" style="margin-bottom: 40px;">

                                            <div class='col-sm-4'>        
                                                <div class="form-group has-feedback">
                                                    <label for="plannedPageExtent" class="control-label pull-left">Planned page extent (published translation) </label>
                                                    <div class="input-group pull-left">
                                                        <span class="input-group-addon">  
                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                        </span>
                                                        <input type="text" 
                                                               name="plannedPageExtent" 
                                                               id="plannedPageExtent" 
                                                               class="form-control" 
                                                               placeholder="number of pages" 
                                                               >
                                                    </div>
                                                </div>
                                            </div>
                                            <script>
                                                $("#DateOfPublicationOriginal").datepicker().on('change', function () {
                                                    $(this).valid();  // triggers the validation test
                                                    // '$(this)' refers to '$("#datepicker")'
                                                });
                                            </script>

                                        </div> <!-- row  -->

                                        <div class="row">

                                            <div class='col-sm-4'>        
                                                <div class="form-group has-feedback">
                                                    <label for="appproposedPrintRun" class="control-label">Proposed print run 
                                                    </label>
                                                    <div class="input-group pull-left">
                                                        <span class="input-group-addon">  
                                                            <span class="glyphicon glyphicon-book"></span>                                                            
                                                        </span>
                                                        <input type="text" 
                                                               name="appproposedPrintRun" 
                                                               id="appproposedPrintRun" 
                                                               class="form-control" 
                                                               placeholder="number of pages" 
                                                               >
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">   
                                                <div class="form-group has-feedback">
                                                    <label for="appTargetLanguage" class="control-label pull-left"> Target language(s)</label>
                                                    <input id="appTargetLanguage"                                
                                                           type="text"                                
                                                           class="form-control"                                
                                                           name="appTargetLanguage"                                
                                                           >
                                                    <i class="glyphicon glyphicon-search form-control-feedback"></i>
                                                </div>
                                            </div>

                                            <input type="hidden" id="language_Array" name="languageArray" >

                                            <div class="col-sm-3">                                              
                                                <label for="bilingual" class="control-label">Bilingual edition</label>
                                                <br/> 
                                                <label style="font-size: 2.0em; " class="checkbox-inline  no_indent">
                                                    <input id="bilingual"
                                                           type="checkbox"                                
                                                           class="form-control"                                
                                                           name="bilingual"  
                                                           >
                                                </label>
                                            </div>

                                        </div> <!--row-->   

                                    </div> <!-- container-fluid  -->
                                </div> <!-- class="tab-pane" id="Publication" -->

                                <!-- Translator's Details -->
                                <div class="tab-pane" id="Translator"> 
                                    <p class="header1" style="margin-bottom: 5px">
                                        Translator Details
                                    </p>

                                    <div class="container-fluid" id="torget">

                                        <div class="row" style="margin-bottom: 40px">

                                            <div class="panel panel-default">
                                                <div class="panel-body">

                                                    <div class="col-md-3">                                                   
                                                        <div class="form-group has-feedback"> 
                                                            <label for="translatorFee" class="control-label pull-left">Translator(s)'s fee</label>                                                                        
                                                            <div class="input-group pull-left">
                                                                <label class="input-group-addon" for="translatorFee">
                                                                    <span class="glyphicon glyphicon-euro"></span>                                     
                                                                </label>
                                                                <input type="text" class="form-control pull-left" name="translatorFee" id="translatorFee" placeholder="fee">    
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-5">   
                                                        <div class="form-group has-feedback"> 
                                                            <label for="BreakDownOfTranslatorFee" class="control-label pull-left">Break-down of translator(s)'s fee</label>                                                        
                                                            <!--keep in one line otherwise placeholder doesn't show-->
                                                            <textarea class="form-control" placeholder="Break-down of translator fee" name="BreakDownOfTranslatorFee" id='BreakDownOfTranslatorFee' style="width: 280px; height: 196px;"></textarea>
                                                        </div>
                                                    </div>

                                                </div>  <!--panel--body-->
                                            </div> <!--panel-default-->
                                        </div> <!-- row -->

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="panel panel-default">
                                                <div class="panel-body">

                                                    <div class="col-sm-4"> 

                                                        <div class="input-group">
                                                            <div class="form-group has-feedback  has-clear">
                                                                <label for="translatorName" class="pull-left" id="translatorNameLabel">Translator</label>
                                                                <input id="translatorName"                                
                                                                       type="text"                                
                                                                       class="form-control"                                
                                                                       name="translatorName"                                
                                                                       value=""    
                                                                       placeholder="Translator Name"
                                                                       >
                                                                <span class="form-control-clear glyphicon glyphicon-remove form-control-feedback hidden"></span>
                                                            </div>
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

                                        <div class="row" style="margin-bottom: 10px">

                                            <div class="container-fluid" id="translatorTabs" style="display: none">
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
                                                        <div class="tab-content" id="tnc">
                                                        </div>  <!-- tnc -->
                                                    </div>  <!-- <div class="container-fluid"  -->
                                                </nav>  <!-- <nav class="navbar -->
                                            </div> <!-- container-fluid  -->

                                        </div> <!--row-->

                                    </div> <!-- container-fluid  -->

                                </div> <!-- class="tab-pane" id="Translator" -->


                                <!-- Original Work & Sample Translation -->
                                <div class="tab-pane" id="Original">
                                    <p class="header1" style="margin-bottom: 40px">
                                        Original Work & Sample Translation
                                    </p>

                                    <div class="container-fluid">

                                        <div class="row" >

                                            <div class="panel panel-default">
                                                <div class="panel-body">

                                                    <!--copies of the original work-->
                                                    <div class="col-md-9" >
                                                        <div class="checkbox">                                                             
                                                            <label for="copiesSent" class=" pull-left"><strong>One copy of the original work<sup>*</sup> sent to Literature Ireland by post</strong></label>
                                                            <label style="font-size: 2.0em; " class="checkbox-inline  no_indent">
                                                                <input type="checkbox" 
                                                                       name="copiesSent" 
                                                                       id="copiesSent" 
                                                                       value="ticked" 
                                                                       class="form-control">
                                                                <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                                                            </label>
                                                            <!--<input type="text" name="ApplicationNumber" value="${ApplicationNumber}">-->
                                                            <input type="hidden" name="userID" value="${userID}">
                                                            <input type="hidden" name="publisherID" value="${publisherID}">
                                                            <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                        </div>
                                                    </div> <!-- col-md-9 -->

                                                    <!--Date copies were sent:-->
                                                    <div class="col-md-3" id="dateCopiesWereSentVisibility">
                                                        <div class="form-group has-feedback">
                                                            <label for="dateCopiesWereSent" class=" pull-left">Date copy was sent:</label> 
                                                            <div class="input-group">
                                                                <input type="text" name="dateCopiesWereSent" id="dateCopiesWereSent" class="form-control" placeholder="DD/MM/YYYY" />    
                                                                <label class="input-group-addon" for="dateCopiesWereSent">
                                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                                </label>
                                                            </div>
                                                        </div>  <!-- input-group -->
                                                    </div> <!--col-md-3-->

                                                    <!--datepicker  dateCopiesWereSent-->
                                                    <script>
                                                        $("#dateCopiesWereSent").datepicker().on('change', function () {
                                                            $(this).valid();  // triggers the validation test
                                                            // '$(this)' refers to '$("#datepicker")'
                                                        });
                                                    </script>

                                                </div> <!--panel--body-->
                                            </div> <!--panel-default-->

                                        </div> <!-- row -->

                                        <div class="row" >

                                            <div class="panel panel-default">        
                                                <div class="panel-body">

                                                    <div class="col-md-12">

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

                                                        <div class="row">

                                                            <div class="col-md-8">
                                                                <div class="form-group has-feedback">
                                                                    <label for="originalSample" class="control-label pull-left">Upload electronic copy of original work</label>
                                                                    <div class="input-group originalSample pull-left">                                                                         
                                                                        <label class="input-group-addon btn btn-default btn-file">
                                                                            Select file 
                                                                            <input type="file"  
                                                                                   name="Original" 
                                                                                   id="originalSample" 
                                                                                   onchange="generatedLabels();"
                                                                                   class="form-input">
                                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                                        </label>
                                                                        <input id="label_originalSample" class="pull-left">   

                                                                        <input type="hidden" name="userID" value="${userID}">
                                                                        <input type="hidden" name="publisherID" value="${publisherID}">
                                                                        <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                                        <!--Destination:-->

                                                                    </div>
                                                                    <input type="hidden" id="originalSample_upload" value="originalSample" name="destination" />                           
                                                                </div>
                                                                <label for="Original" class="validation_error_message help-block"></label>      
                                                            </div>

                                                        </div> <!--row-->

                                                        <div class="row" style="margin-bottom: 40px">

                                                            <div class="col-md-8">
                                                                <div class="form-group has-feedback">
                                                                    <label for="translationSample" class="control-label pull-left">Upload copy of translation sample<sup>**</sup><br/> (10 to 12 pages of prose or six poems)</label>
                                                                    <div class="input-group translationSample pull-left" >
                                                                        <label class="input-group-addon btn btn-default btn-file">
                                                                            Select file 
                                                                            <input type="file"  name="TranslationSample" id="translationSample" class="form-control">
                                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                                        </label>
                                                                        <input id="label_translationSample" class="pull-left"/>

                                                                        <input type="hidden" name="userID" value="${userID}">
                                                                        <input type="hidden" name="publisherID" value="${publisherID}">
                                                                        <input type="hidden" name="Company" value="${companyDetails.Company}">
                                                                        <!--Destination:-->
                                                                        <input type="hidden" id="translationSample_upload" value="translationSample" name="destination" />                                          
                                                                    </div>
                                                                    <label for="TranslationSample" class="validation_error_message help-block"></label>  
                                                                </div>
                                                            </div> <!-- col-md-8 -->

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
                                                        <div class="input-group input-group-lg">
                                                            <button type="submit"                                                                          
                                                                    data-toggle="tooltip" 
                                                                    class="btn btn-success"
                                                                    title="Click to submit the application!"
                                                                    style="margin-bottom: 10px"
                                                                    name="Start New Application"
                                                                    >
                                                                Submit the application
                                                                <span class="glyphicon glyphicon-import"></span>
                                                            </button>
                                                        </div><!-- input-group -->
                                                    </div>  <!-- col-md-9 -->

                                                </div>  <!-- panel--body -->
                                            </div>  <!--panel--default-->                                                
                                        </div> <!-- row -->
                                        <hr/>
                                        <div class="col-md-10">
                                            <i class="pull-left"><strong>*</strong> Please contact Literature Ireland if a hard copy the original work cannot be obtained.<br/>
                                                &nbsp;  <strong>**</strong> If more than one translator is involved, a translation sample must be submitted for each translator.</i>
                                        </div>    
                                    </div>  <!-- container-fluid -->
                                </div> <!-- tab-pane Original --> 

                            </div> <!-- my-tab-content -->

                            <!--pressCuttingsModal-->
                            <div class="modal fade" id="pressCuttingsModal" tabindex="-1" role="dialog" aria-labelledby="pressCuttingsModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal"  onclick="backToMisc();"  aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="pressCuttingsModalLabel">add Press Cuttings</h4>
                                        </div> <!--modal header -->

                                        <div class="modal-body" style="background-color: #d9d1d1">
                                            <div class="row" style="margin-bottom: 10px">
                                                <output id="result">Press Cuttings</output>
                                                <!--<button type="button" id="clear">Clear</button>-->
                                            </div>
                                            <div class="row" style="margin-bottom: 10px">
                                                <div class='col-sm-12'>
                                                    <button type="button" id="clear">Clear</button>
                                                </div>
                                            </div>
                                        </div> <!--modal body -->

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <!--<button id="pressCutting" type="button" value="Add another Press Cutting"  class="btn btn-group-sm  button teal pull-left">Add Press Cuttings</button>-->
                                            <label class="btn btn-default btn-file">
                                                Add Press Cuttings<input type="file" id="files" multiple  accept=".gif,.jpg,.jpeg,.png,.doc,.docx,.pdf">
                                            </label>
                                            <!--<button type="button" id="clear">Clear</button>-->
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="backToMisc();">Done</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!--modal fade-->

                            <input type="hidden" value="pressCuttings" name="image-file" id="label_pressCuttings"/>

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

                            <!--addAdditionalRightsHoldersModal-->
                            <div class="modal fade" id="addAdditionalRightsHoldersModal" tabindex="-1" role="dialog" aria-labelledby="addAdditionalRightsHoldersModalLabel">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal"  onclick="backToRightsAgreement();"  aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="addAdditionalRightsHoldersModalLabel">add more Translation rights holder</h4>
                                        </div>


                                        <div class="modal-body" style="background-color: #d9d1d1">

                                            <div class="row" style="margin-bottom: 10px">
                                                <div class='col-sm-12'>

                                                    <div  id="RightsHolderGeneratedForm" class="input-group" style='margin-bottom:2px'>
                                                        1. Rights holder <input type="text" id="firstRightsHolder0" value="Name" style='margin-bottom:2px'>                                                         
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <button id="addAdditionalRightsHolders" type="button" value="additional rights holders"  class="btn btn-group-sm  button teal pull-left">Add additional rights holders</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="backToRightsAgreement();">Done</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!--modal fade-->

                            <!--addAuthorModal-->
                            <div class="modal fade" id="addAuthorModal" tabindex="-1" role="dialog" aria-labelledby="addAuthorModalLabel">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal"  onclick="backToBooks();"  aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="addAuthorModalLabel">add more Authors</h4>
                                        </div>


                                        <div class="modal-body" style="background-color: #d9d1d1">

                                            <div class="row" style="margin-bottom: 10px">


                                                <div  id="generatedFormAuthors" class="input-group" style='margin-bottom:2px'>
                                                    <div class='col-sm-12'>
                                                        1. Author <input type="text" id="firstAuthor0" value="Name" style='margin-bottom:2px'> <input type="text" id="lastAuthor0" value="Name" style='margin-bottom:2px'>                                                         
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <button id="addAuthor" type="button" value="Add another Author"  class="btn btn-group-sm  button teal pull-left">Add another Author</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="backToBooks2();">Done</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!-- addAuthorModal -->

                            <!--showInfoModal-->
                            <div class="modal fade" id="showInfoModal" tabindex="-1" role="dialog" aria-labelledby="showInfoModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal"  aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="showInfoModalLabel">Info</h4>
                                        </div>


                                        <div class="modal-body" style="background-color: #d9d1d1">

                                            <h2><strong>Translation Grant Programme Application Checklist</strong></h2>
                                            <br/>
                                            <br/>
                                            <strong>Your application to the Literature Ireland Translation Grant Programme should include the following:</strong>
                                            <br/>
                                            <br/>
                                            <h3> Contact Details</h3>
                                            <ul class="dashed">
                                                <li>The name, address, email and phone number of the applicant</li>
                                            </ul>

                                            <h3> Contracts</h3>
                                            <ul class="dashed">
                                                <li>A copy of the agreement with the translation rights holder (where applicable)<br/>
                                                <li> A copy of the contract with the translator </li>
                                            </ul>

                                            <h3> Publication Details</h3>
                                            <ul class="dashed">
                                                <li>The proposed date of publication<br/>
                                                <li>The proposed print run<br/></li>
                                                <li>The planned page extent of the published translation </li>
                                            </ul>

                                            <h3> Translator's Details</h3>
                                            <ul class="dashed">
                                                <li>A copy of the translator's CV, including a list of previous published literary translations</li>
                                                <li>Details of the fee to be paid to the translator (this should include the total sum in Euro and a breakdown of the rate according to which this sum has been calculated)</li>
                                            </ul>

                                            <h3> Original Work & Sample Translation</h3>
                                            <ul class="dashed">
                                                <li>One copy of the original work* </li>
                                                <li>A translation sample** consisting of 10 to 12 pages of prose or six poems</li>
                                            </ul>

                                            <br/>
                                            <p> <i> * &nbsp; Please contact Literature Ireland if a hard copy of the original work cannot be obtained.<br/>
                                                    ** If more than one translator is involved, a translation sample must be submitted for each translator.
                                                </i> </p>
                                            All queries in relation to the Translation Grant Programme should be sent to info@literatureireland.com.
                                            <br/>
                                        </div>

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!--modal fade-->

                            <!--showNotesModal-->
                            <div class="modal fade" id="showNotesModal" tabindex="-1" role="dialog" aria-labelledby="showNotesModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #c3bcbc">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="showNotesModalLabel">Notes</h4>
                                        </div>


                                        <div class="modal-body" style="background-color: #d9d1d1">
                                            <div class="row" style="margin-bottom: 10px">

                                                <p class="header1"> 
                                                    NOTES
                                                </p>
                                                <br/>
                                                <div class="container-fluid">
                                                    <ol>
                                                        <li>
                                                            <p>There
                                                                are three translation grant rounds per year. The <b> deadlines
                                                                    for submission of applications</b>
                                                                are available on the Literature Ireland website at
                                                                <u><a href="http://www.literatureireland.com/programmes/translation-grant-programme/">http://www.literatureireland.com/programmes/translation-grant-programme/</a></u>.
                                                                A translation grant round is considered to consist of a period of
                                                                two months from the date of the deadline.
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p>
                                                        <br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="2">
                                                        <li>
                                                            <p><b>Applications
                                                                    should be submitted from one month prior to the deadline.</b>
                                                                Applications submitted after the deadline may not be accepted or may
                                                                be postponed to the next round.
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="3">
                                                        <li>
                                                            <p><b>Late
                                                                    applications or applications for consideration outside the usual
                                                                    round</b> may, in rare
                                                                cases, be accepted at the discretion of Literature Ireland.
                                                                Applicants in these cases should contact 
                                                                <u><a href="mailto:info@literatureireland.com">
                                                                        info@literatureireland.com</a></u>
                                                                before submitting an application. Applicants are also advised that
                                                                late submission will affect the timeliness with which they can be
                                                                informed of the outcome of the application.
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="4">
                                                        <li>
                                                            <p>It
                                                                is recommended that the <b>translation
                                                                    sample</b> submitted
                                                                with the application be a final or near-final version which has been
                                                                <b>proofread and
                                                                    edited</b>. If the
                                                                sample submitted is an early or unedited draft, the applicant is
                                                                requested to inform Literature Ireland of this fact. There is a
                                                                ‘Notes’ field in the ‘Book Details’ tab of the application
                                                                system which may be used for this purpose. 
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="5">
                                                        <li>
                                                            <p>Literature
                                                                Ireland reserves the right to have <b>translation
                                                                    samples submitted assessed for quality by an independent expert</b>,
                                                                who will write a report that will be presented to the board of
                                                                directors when it considers the request for funding (see note 7).
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="6">
                                                        <li>
                                                            <p>Literature
                                                                Ireland maintains records of the average/typical rates paid to
                                                                literary translators in different countries. If the rate being paid
                                                                to the translator is substantially different from that which might
                                                                be usual, the application is requested to include an explanation for
                                                                this in his/her application.
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p>
                                                        <br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="7">
                                                        <li>
                                                            <p>All
                                                                applications in a given round will be considered by the board of
                                                                Literature Ireland at a <b>meeting
                                                                    held six to eight weeks after the deadline</b>.
                                                                Applications for <b>translations
                                                                    due for printing or publication before this meeting takes place will
                                                                    be deemed ineligible</b>.	
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="8">
                                                        <li>
                                                            <p><b>Applicants
                                                                    will be informed of the outcome of the application within 10 days of
                                                                    the board meeting</b>.
                                                                Successful applicants will be issued with formal contracts and a
                                                                letter of award within six weeks of approval.
                                                            </p>
                                                        </li>
                                                    </ol>
                                                    <p><br/>
                                                        <br/>

                                                    </p>
                                                    <ol start="9">
                                                        <li>
                                                            <p><b>All decisions of the board of Literature Ireland are final</b>.	
                                                            </p>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer"  style="background-color: #c3bcbc">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div> <!--modal footer -->
                                    </div> <!--modal content-->          
                                </div> <!--modal dialog-->
                            </div> <!--modal fade-->

                        </form> 
                    </div>  <!-- container-fluid -->
                </nav>

                <div class="scroll-top-wrapper ">
                    <span class="scroll-top-inner">
                        <i class="fa fa-3x fa-arrow-circle-up"></i>
                    </span>
                </div>

                <form class="form-horizontal" 
                      role="form"  
                      autocomplete="on"  
                      action="${pageContext.request.contextPath}/Application" 
                      method="POST" 
                      name="regF"
                      >
                    <input type="hidden" name="name" value="${name}">
                    <input type="hidden" name="userID" value="${userID}">
                    <input type="hidden" name="publisherID" value="${publisherID}">
                    <input type="hidden" name="Company" value="${companyDetails.Company}">
                    <input type="hidden" name="publisherName" value="${companyDetails.Company}">

                    <div class="container col-sm-12" style="margin-bottom: 40px">
                        <input type="submit" id="NewApplication" name="New Application"  class = "btn btn-default btn-sm active" value="New Application" />
                        <input type="submit" id="ListOpenApplications" name="List Open Applications"  class = "btn btn-default btn-sm" value="List Open Applications" />
                        <input type="submit" id="ListPendingApplications" name="List Pending Applications"  class = "btn btn-default btn-sm" value="List Pending Applications" />
                        <input type="submit" id="ListClosedApplications" name="List Closed Applications"  class = "btn btn-default btn-sm" value="List Closed Applications" />
                    </div>
                </form>

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
        <script src="js/bootstrap-imageupload.js"></script>

        <script>
                                var $imageupload = $('.imageupload');
                                $imageupload.imageupload();

                                function pressCuttingsModal() {
                                    $("#pressCuttingsModal").modal("show");
                                }

                                var pressCuttingsUpload = $('.pressCuttingsUpload');
                                pressCuttingsUpload.imageupload();

                                function  showInfoModal() {
                                    $("#showInfoModal").modal("show");
                                }
                                function  showNotesModal() {
                                    $("#showNotesModal").modal("show");
                                }
                                function  contactUsModal() {
                                    $("#contactUsModal").modal("show");
                                }
                                function  showLegalNoteModal() {
                                    $("#showLegalNoteModal").modal("show");
                                }
        </script>
    </body>
</html>
